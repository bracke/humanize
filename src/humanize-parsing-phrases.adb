with Ada.Strings.Fixed;

with Humanize.I18N_Rendering;
with Humanize.Message_Keys;
with Humanize.Parsing.Phrase_Keys;
with Humanize.Selections;

package body Humanize.Parsing.Phrases is

   use Ada.Strings.Unbounded;
   use type Humanize.Status.Status_Code;

   --  Stands for any free text while rendering: what it matches in the input
   --  is that text.
   Wildcard : constant Character := Character'Val (16#1A#);

   function Choices_For (Argument : String) return String is
     (if Argument = "severity" then "error,warning,info"
      elsif Argument = "domain" then "queue,job,run,cache,sync,import,export"
      elsif Argument = "state" then "queued,running,waiting,paused,complete,failed,stale,skipped"
      else "");

   --  The Index-th comma-separated item of List (1-based), and their count.
   function Item_Count (List : String) return Natural is
      Count : Natural := (if List = "" then 0 else 1);
   begin
      for C of List loop
         if C = ',' then
            Count := Count + 1;
         end if;
      end loop;
      return Count;
   end Item_Count;

   function Item (List : String; Index : Positive) return String is
      Seen  : Natural := 1;
      Start : Positive := List'First;
   begin
      for I in List'Range loop
         if List (I) = ',' then
            if Seen = Index then
               return List (Start .. I - 1);
            end if;
            Seen := Seen + 1;
            Start := I + 1;
         end if;
      end loop;
      return List (Start .. List'Last);
   end Item;

   --  Field Index of a "name|numbers|selects" entry.
   function Field (Entry_Text : String; Index : Positive) return String is
      Seen  : Natural := 1;
      Start : Positive := Entry_Text'First;
   begin
      for I in Entry_Text'Range loop
         if Entry_Text (I) = '|' then
            if Seen = Index then
               return Entry_Text (Start .. I - 1);
            end if;
            Seen := Seen + 1;
            Start := I + 1;
         end if;
      end loop;
      return Entry_Text (Start .. Entry_Text'Last);
   end Field;

   --  Whether Pattern, where each Wildcard stands for one or more characters,
   --  reads all of Text; the matched texts in Captures, in order.
   function Matches
     (Pattern  : String;
      Text     : String;
      Captures : in out Name_Array;
      Count    : in out Natural)
      return Boolean
   is
      function From (P, T : Natural; Depth : Natural) return Boolean is
      begin
         if P > Pattern'Last then
            return T > Text'Last;
         elsif Pattern (P) /= Wildcard then
            return T <= Text'Last and then Pattern (P) = Text (T) and then From (P + 1, T + 1, Depth);
         end if;
         --  The shortest reading first, as a label's text is short.
         for Last in T .. Text'Last loop
            if From (P + 1, Last + 1, Depth + 1) then
               if Depth + 1 <= Max_Values then
                  Captures (Depth + 1) := To_Unbounded_String (Text (T .. Last));
                  Count := Natural'Max (Count, Depth + 1);
               end if;
               return True;
            end if;
         end loop;
         return False;
      end From;
   begin
      return From (Pattern'First, Text'First, 0);
   end Matches;

   type Pool_Type is record
      Values : Number_Array := [others => 0];
      Count  : Natural := 0;
   end record;

   --  The distinct digit runs in Text, then 0, 1 and 2 for counts it does not
   --  show ("due today"; "twice files"; "all 5 files", one number for two
   --  counts).
   function Candidates (Text : String) return Pool_Type is
      Result : Pool_Type;
      Start  : Natural := 0;

      procedure Add (Value : Long_Long_Integer) is
      begin
         for I in 1 .. Result.Count loop
            if Result.Values (I) = Value then
               return;
            end if;
         end loop;
         if Result.Count < Max_Values then
            Result.Count := Result.Count + 1;
            Result.Values (Result.Count) := Value;
         end if;
      end Add;
   begin
      for I in Text'Range loop
         if Text (I) in '0' .. '9' then
            if Start = 0 then
               Start := I;
            end if;
            if I = Text'Last or else Text (I + 1) not in '0' .. '9' then
               if I - Start < 17 then
                  Add (Long_Long_Integer'Value (Text (Start .. I)));
               end if;
               Start := 0;
            end if;
         end if;
      end loop;
      Add (0);
      Add (1);
      Add (2);
      return Result;
   end Candidates;

   --  Text with the locale's digits as ASCII and its grouping separators
   --  dropped between digits ("١٢٣", German "1.234" -> "1234"), learnt from
   --  how the locale writes 1234567890; Text where the locale cannot render.
   function Normalized (Context : Humanize.Contexts.Context; Text : String) return String is
      Sample : constant Humanize.Status.Text_Result :=
        Humanize.I18N_Rendering.Render
          (Context, Humanize.Selections.Text_Value (Humanize.Message_Keys.Number_Plain, "1234567890"));

      --  The UTF-8 character starting at Index of Item.
      function Char_At (Item : String; Index : Positive) return String is
         Lead : constant Natural := Character'Pos (Item (Index));
         Size : constant Positive :=
           (if Lead < 16#80# then 1 elsif Lead >= 16#F0# then 4 elsif Lead >= 16#E0# then 3
            elsif Lead >= 16#C0# then 2 else 1);
      begin
         return Item (Index .. Natural'Min (Item'Last, Index + Size - 1));
      end Char_At;

      type Glyph_Array is array (0 .. 9) of Unbounded_String;
      Digit_Glyphs : Glyph_Array;
      Separator    : Unbounded_String;
      Group_Sizes  : array (2 .. 3) of Boolean := [others => False];
   begin
      if Sample.Status /= Humanize.Status.Ok then
         return Text;
      end if;
      --  Read the sample: one separator (the character after the first
      --  digit, where there are more than ten), the ten digits in order, and
      --  the sizes of the groups it separates.
      declare
         Item  : constant String := To_String (Sample.Text);
         Count : Natural := 0;
         Index : Positive := Item'First;
         Seen  : Natural := 0;
         Run   : Natural := 0;
      begin
         while Index <= Item'Last loop
            Count := Count + 1;
            Index := Index + Char_At (Item, Index)'Length;
         end loop;
         if Count > 10 and then Item'Length > Char_At (Item, Item'First)'Length then
            Separator := To_Unbounded_String (Char_At (Item, Item'First + Char_At (Item, Item'First)'Length));
         end if;
         Index := Item'First;
         while Index <= Item'Last loop
            declare
               C : constant String := Char_At (Item, Index);
            begin
               if Separator /= Null_Unbounded_String and then C = To_String (Separator) then
                  --  A group ends; the first is the leading digit, not a group.
                  if Run in 2 .. 3 and then Seen > Run then
                     Group_Sizes (Run) := True;
                  end if;
                  Run := 0;
               else
                  Seen := Seen + 1;
                  Run := Run + 1;
                  if Seen <= 10 then
                     Digit_Glyphs (Seen mod 10) := To_Unbounded_String (C);
                  end if;
               end if;
               Index := Index + C'Length;
            end;
         end loop;
         if Run in 2 .. 3 and then Separator /= Null_Unbounded_String then
            Group_Sizes (Run) := True;
         end if;
         if Seen /= 10 then
            return Text;
         end if;
      end;
      --  Rewrite Text: digits to ASCII, separators between digit groups out.
      declare
         Result : Unbounded_String;
         Index  : Positive := Text'First;

         function Digit_Of (C : String) return Integer is
         begin
            for D in Digit_Glyphs'Range loop
               if To_String (Digit_Glyphs (D)) = C then
                  return D;
               end if;
            end loop;
            return (if C'Length = 1 and then C (C'First) in '0' .. '9'
                    then Character'Pos (C (C'First)) - Character'Pos ('0') else -1);
         end Digit_Of;

         --  How many digits follow the character at Index, before a non-digit.
         function Digits_After (From : Positive) return Natural is
            Count : Natural := 0;
            I     : Positive := From;
         begin
            while I <= Text'Last loop
               declare
                  C : constant String := Char_At (Text, I);
               begin
                  exit when Digit_Of (C) < 0;
                  Count := Count + 1;
                  I := I + C'Length;
               end;
            end loop;
            return Count;
         end Digits_After;
      begin
         while Index <= Text'Last loop
            declare
               C : constant String := Char_At (Text, Index);
               D : constant Integer := Digit_Of (C);
               Last_Digit : constant Boolean :=
                 Length (Result) > 0 and then Element (Result, Length (Result)) in '0' .. '9';
            begin
               if D >= 0 then
                  Append (Result, Character'Val (Character'Pos ('0') + D));
               elsif Separator /= Null_Unbounded_String and then C = To_String (Separator) and then Last_Digit
                 and then Index + C'Length <= Text'Last
                 and then (Digits_After (Index + C'Length) = 3
                           or else (Group_Sizes (2) and then Digits_After (Index + C'Length) = 2))
               then
                  null;
               else
                  Append (Result, C);
               end if;
               Index := Index + C'Length;
            end;
         end loop;
         return To_String (Result);
      end;
   end Normalized;

   function Parse_Entry
     (Context    : Humanize.Contexts.Context;
      Entry_Text : String;
      Text       : String;
      Normalize  : Boolean := False)
      return Phrase_Parse_Result
   is
      Name     : constant String := Field (Entry_Text, 1);
      Numbers  : constant String := Field (Entry_Text, 2);
      Selects  : constant String := Field (Entry_Text, 3);
      Texts    : constant String := Field (Entry_Text, 4);
      Pool     : constant Pool_Type := Candidates (Text);
      N_Count  : constant Natural := Natural'Min (Item_Count (Numbers), Max_Values);
      S_Count  : constant Natural := Natural'Min (Item_Count (Selects), 2);
      Picks    : array (1 .. Max_Values) of Positive := [others => 1];
      Chosen   : array (1 .. 2) of Positive := [others => 1];

      function Choice (Index : Positive) return String is
        (Item (Choices_For (Item (Selects, Index)), Chosen (Index)));

      --  The decimal runs in Text ("12.5", "50"): a decimal text argument a
      --  template counts by (Russian "50 процентов") cannot be a wildcard.
      function Decimal_Run (Index : Positive) return String is
         Seen  : Natural := 0;
         Start : Natural := 0;
      begin
         for I in Text'Range loop
            if Text (I) in '0' .. '9' or else (Start /= 0 and then Text (I) = '.') then
               if Start = 0 then
                  Start := I;
               end if;
               if I = Text'Last or else not (Text (I + 1) in '0' .. '9' | '.') then
                  Seen := Seen + 1;
                  if Seen = Index then
                     return Text (Start .. I);
                  end if;
                  Start := 0;
               end if;
            end if;
         end loop;
         return "";
      end Decimal_Run;

      --  Text with the arguments chosen; Decimal names the decimal run that
      --  stands for "percent" and "value" (0: a wildcard).
      function Try_With (Decimal : Natural) return Phrase_Parse_Result is
         Selection : Humanize.Selections.Message_Selection := Humanize.Selections.Phrase (Name);
         Result    : Phrase_Parse_Result;
      begin
         for I in 1 .. Item_Count (Texts) loop
            declare
               Argument : constant String := Item (Texts, I);
            begin
               Selection := Humanize.Selections.With_Arg
                 (Selection, Argument,
                  (if Decimal /= 0 and then Argument in "percent" | "value" then Decimal_Run (Decimal)
                   else [Wildcard]));
            end;
         end loop;
         for I in 1 .. N_Count loop
            Selection := Humanize.Selections.With_Arg (Selection, Item (Numbers, I), Pool.Values (Picks (I)));
         end loop;
         for I in 1 .. S_Count loop
            Selection := Humanize.Selections.With_Arg (Selection, Item (Selects, I), Choice (I));
         end loop;
         declare
            Rendered : constant Humanize.Status.Text_Result := Humanize.I18N_Rendering.Render (Context, Selection);
         begin
            if Rendered.Status /= Humanize.Status.Ok
              or else not Matches
                            ((if Normalize then Normalized (Context, To_String (Rendered.Text))
                              else To_String (Rendered.Text)),
                             Text, Result.Texts, Result.Text_Count)
            then
               return (Status => Humanize.Status.Invalid_Argument, others => <>);
            end if;
         end;
         Result.Status := Humanize.Status.Ok;
         Result.Name := To_Unbounded_String (Name);
         Result.Number_Count := N_Count;
         for I in 1 .. N_Count loop
            Result.Number_Names (I) := To_Unbounded_String (Item (Numbers, I));
            Result.Numbers (I) := Pool.Values (Picks (I));
         end loop;
         Result.Choice_Count := S_Count;
         for I in 1 .. S_Count loop
            Result.Choice_Names (I) := To_Unbounded_String (Item (Selects, I));
            Result.Choices (I) := To_Unbounded_String (Choice (I));
         end loop;
         if Decimal /= 0 and then Result.Text_Count < Max_Values then
            Result.Text_Count := Result.Text_Count + 1;
            Result.Texts (Result.Text_Count) := To_Unbounded_String (Decimal_Run (Decimal));
         end if;
         return Result;
      end Try_With;

      Has_Decimal : constant Boolean :=
        (for some I in 1 .. Item_Count (Texts) => Item (Texts, I) in "percent" | "value");

      function Try return Phrase_Parse_Result is
         Result : Phrase_Parse_Result := Try_With (0);
         Run    : Positive := 1;
      begin
         while Result.Status /= Humanize.Status.Ok and then Has_Decimal and then Decimal_Run (Run) /= "" loop
            Result := Try_With (Run);
            Run := Run + 1;
         end loop;
         return Result;
      end Try;

      --  Every choice of select values, then of numbers from the pool.
      function Next_Choice return Boolean is
      begin
         for I in 1 .. S_Count loop
            if Chosen (I) < Item_Count (Choices_For (Item (Selects, I))) then
               Chosen (I) := Chosen (I) + 1;
               return True;
            end if;
            Chosen (I) := 1;
         end loop;
         return False;
      end Next_Choice;

      function Next_Pick return Boolean is
      begin
         for I in 1 .. N_Count loop
            if Picks (I) < Pool.Count then
               Picks (I) := Picks (I) + 1;
               return True;
            end if;
            Picks (I) := 1;
         end loop;
         return False;
      end Next_Pick;
      --  The text's numbers in the order the phrase shows its arguments, learnt
      --  from a rendering with a marker number for each: most readings are the
      --  first tried, and the search over every choice is the fallback.
      procedure Order_Picks is
         Selection : Humanize.Selections.Message_Selection := Humanize.Selections.Phrase (Name);
         Shown     : Natural := 0;
         Runs      : constant Natural := Pool.Count - 2;
      begin
         for I in 1 .. Item_Count (Texts) loop
            Selection := Humanize.Selections.With_Arg (Selection, Item (Texts, I), [Wildcard]);
         end loop;
         for I in 1 .. N_Count loop
            Selection := Humanize.Selections.With_Arg
              (Selection, Item (Numbers, I), Long_Long_Integer (9_000_000 + I * 1_111));
         end loop;
         for I in 1 .. S_Count loop
            Selection := Humanize.Selections.With_Arg (Selection, Item (Selects, I), Choice (I));
         end loop;
         declare
            Rendered : constant Humanize.Status.Text_Result := Humanize.I18N_Rendering.Render (Context, Selection);
            Probe    : constant String := To_String (Rendered.Text);
            Position : array (1 .. Max_Values) of Natural := [others => 0];
         begin
            if Rendered.Status /= Humanize.Status.Ok then
               return;
            end if;
            for I in 1 .. N_Count loop
               declare
                  Image  : constant String := Long_Long_Integer'Image (Long_Long_Integer (9_000_000 + I * 1_111));
               begin
                  Position (I) := Ada.Strings.Fixed.Index (Probe, Image (Image'First + 1 .. Image'Last));
               end;
            end loop;
            --  Each shown argument takes the text's next number, in order.
            for Rank in 1 .. N_Count loop
               declare
                  Best : Natural := 0;
               begin
                  for I in 1 .. N_Count loop
                     if Position (I) > 0
                       and then (Best = 0 or else Position (I) < Position (Best))
                     then
                        Best := I;
                     end if;
                  end loop;
                  exit when Best = 0;
                  Position (Best) := 0;
                  Shown := Shown + 1;
                  if Shown <= Runs then
                     Picks (Best) := Shown;
                  end if;
               end;
            end loop;
         end;
      end Order_Picks;
   begin
      if N_Count > 0 and then Pool.Count > 2 then
         Order_Picks;
         declare
            Result : constant Phrase_Parse_Result := Try;
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
         Picks := [others => 1];
      end if;
      loop
         loop
            declare
               Result : constant Phrase_Parse_Result := Try;
            begin
               if Result.Status = Humanize.Status.Ok then
                  return Result;
               end if;
            end;
            exit when not Next_Choice;
         end loop;
         exit when not Next_Pick;
      end loop;
      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Entry;

   function Parse
     (Context : Humanize.Contexts.Context;
      Name    : String;
      Text    : String)
      return Phrase_Parse_Result
   is
   begin
      for Entry_Text of Humanize.Parsing.Phrase_Keys.Entries loop
         if Field (Entry_Text.all, 1) = Name then
            declare
               Raw : constant Phrase_Parse_Result := Parse_Entry (Context, Entry_Text.all, Text);
            begin
               if Raw.Status = Humanize.Status.Ok then
                  return Raw;
               end if;
               declare
                  Plain : constant String := Normalized (Context, Text);
               begin
                  --  The rendering in the locale's digits is compared
                  --  normalized too.
                  return (if Plain = Text then Raw
                          else Parse_Entry (Context, Entry_Text.all, Plain, Normalize => True));
               end;
            end;
         end if;
      end loop;
      return (Status => Humanize.Status.Missing_Message, others => <>);
   end Parse;

   function Parse_Any
     (Context : Humanize.Contexts.Context;
      Prefix  : String;
      Text    : String)
      return Phrase_Parse_Result
   is
   begin
      for Entry_Text of Humanize.Parsing.Phrase_Keys.Entries loop
         declare
            Name : constant String := Field (Entry_Text.all, 1);
         begin
            if Name'Length >= Prefix'Length
              and then Name (Name'First .. Name'First + Prefix'Length - 1) = Prefix
            then
               declare
                  Result : constant Phrase_Parse_Result := Parse_Entry (Context, Entry_Text.all, Text);
               begin
                  if Result.Status = Humanize.Status.Ok then
                     return Result;
                  end if;
               end;
            end if;
         end;
      end loop;
      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Any;

   function Number
     (Result : Phrase_Parse_Result;
      Name   : String)
      return Long_Long_Integer
   is
   begin
      for I in 1 .. Result.Number_Count loop
         if To_String (Result.Number_Names (I)) = Name then
            return Result.Numbers (I);
         end if;
      end loop;
      return 0;
   end Number;

   function Phrase_Count return Natural is (Humanize.Parsing.Phrase_Keys.Entries'Length);

   function Phrase_Name (Index : Positive) return String is
     (Field (Humanize.Parsing.Phrase_Keys.Entries (Humanize.Parsing.Phrase_Keys.Entries'First + Index - 1).all, 1));

end Humanize.Parsing.Phrases;
