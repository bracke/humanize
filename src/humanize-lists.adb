with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.I18N_Rendering;
with Humanize.Messages;
with Humanize.Selections;
with Humanize.Bounded_Text;

package body Humanize.Lists is
   use type Humanize.Status.Status_Code;

   function Natural_Text (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text
     (Result : Humanize.Status.Text_Result)
      return String
      renames Humanize.Bounded_Text.Result_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Ends_With (Text, Suffix : String) return Boolean
      renames Humanize.Bounded_Text.Ends_With;

   function Is_Upper (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Uppercase;

   function Invalid_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Invalid_Text;

   function Starts_With_Vowel_Sound (Text : String) return Boolean is
      First : Character;
   begin
      if Text'Length = 0 then
         return False;
      end if;

      First := Text (Text'First);
      if Is_Upper (First) then
         First := Character'Val
           (Character'Pos (First) - Character'Pos ('A') + Character'Pos ('a'));
      end if;
      return First in 'a' | 'e' | 'i' | 'o' | 'u';
   end Starts_With_Vowel_Sound;

   function Looks_Irregular (Singular, Plural : String) return Boolean is
   begin
      if Plural'Length = 0 then
         return False;
      elsif Ends_With (Singular, "y") and then Ends_With (Plural, "ies") then
         return False;
      elsif Ends_With (Singular, "s") and then Plural = Singular & "es" then
         return False;
      elsif Ends_With (Singular, "x") and then Plural = Singular & "es" then
         return False;
      elsif Ends_With (Singular, "z") and then Plural = Singular & "es" then
         return False;
      elsif Ends_With (Singular, "ch") and then Plural = Singular & "es" then
         return False;
      elsif Ends_With (Singular, "sh") and then Plural = Singular & "es" then
         return False;
      else
         return Plural /= Singular & "s";
      end if;
   end Looks_Irregular;

   function Noun_For
     (Quantity : Natural;
      Singular : String;
      Plural   : String)
      return String
   is
     (if Quantity = 1 then Singular
      elsif Plural'Length > 0 then Plural
      else Singular & "s");

   function Pluralize_Default (Singular : String) return String is
      Stem_Last : Natural;
   begin
      if Ends_With (Singular, "y") and then Singular'Length > 1 then
         Stem_Last := Singular'Last - 1;
         if Singular (Stem_Last) not in 'a' | 'e' | 'i' | 'o' | 'u'
           and then Singular (Stem_Last) not in 'A' | 'E' | 'I' | 'O' | 'U'
         then
            return Singular (Singular'First .. Stem_Last) & "ies";
         end if;
      end if;

      if Ends_With (Singular, "s")
        or else Ends_With (Singular, "x")
        or else Ends_With (Singular, "z")
        or else Ends_With (Singular, "ch")
        or else Ends_With (Singular, "sh")
      then
         return Singular & "es";
      else
         return Singular & "s";
      end if;
   end Pluralize_Default;

   function Counted_Noun_Source
     (Quantity : Natural;
      Singular : String;
      Plural   : String := "")
      return Count_Noun_Source
   is
      pragma Unreferenced (Quantity);
   begin
      if Plural'Length = 0 then
         return Default_S_Suffix;
      elsif Looks_Irregular (Singular, Plural) then
         return Irregular_Noun;
      else
         return Explicit_Plural;
      end if;
   end Counted_Noun_Source;

   function Counted_Noun_Source_Label
     (Source : Count_Noun_Source)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (case Source is
            when Explicit_Plural  => "explicit-plural",
            when Default_S_Suffix => "default-s-suffix",
            when Irregular_Noun   => "irregular-noun");
   end Counted_Noun_Source_Label;

   function Severity_Noun
     (Severity : Validation_Severity;
      Quantity : Natural)
      return String
   is
   begin
      case Severity is
         when Validation_Error =>
            return Noun_For (Quantity, "error", "errors");
         when Validation_Warning =>
            return Noun_For (Quantity, "warning", "warnings");
         when Validation_Info =>
            return Noun_For (Quantity, "notice", "notices");
      end case;
   end Severity_Noun;

   function Noun_For_Advanced
     (Quantity : Natural;
      Singular : String;
      Plural   : String)
      return String
   is
   begin
      if Quantity = 1 then
         return Singular;
      elsif Plural'Length > 0 then
         return Plural;
      else
         return Pluralize_Default (Singular);
      end if;
   end Noun_For_Advanced;

   function Small_Word (Quantity : Natural; Text : out Unbounded_String)
      return Boolean
   is
   begin
      case Quantity is
         when 0  => Text := To_Unbounded_String ("zero");
         when 1  => Text := To_Unbounded_String ("one");
         when 2  => Text := To_Unbounded_String ("two");
         when 3  => Text := To_Unbounded_String ("three");
         when 4  => Text := To_Unbounded_String ("four");
         when 5  => Text := To_Unbounded_String ("five");
         when 6  => Text := To_Unbounded_String ("six");
         when 7  => Text := To_Unbounded_String ("seven");
         when 8  => Text := To_Unbounded_String ("eight");
         when 9  => Text := To_Unbounded_String ("nine");
         when 10 => Text := To_Unbounded_String ("ten");
         when 11 => Text := To_Unbounded_String ("eleven");
         when 12 => Text := To_Unbounded_String ("twelve");
         when others => return False;
      end case;
      return True;
   end Small_Word;

   function Decimal_Tenths (Whole, Tenths : Natural) return String is
      Whole_Text : constant String := Natural_Text (Whole);
   begin
      if Tenths = 0 then
         return Whole_Text;
      else
         return Whole_Text & "." & Natural_Text (Tenths);
      end if;
   end Decimal_Tenths;

   function Compact_Number (Quantity : Natural) return String is
      type Tier is record
         Value  : Long_Long_Integer;
         Suffix : Character;
      end record;
      Tiers : constant array (Positive range 1 .. 3) of Tier :=
        [(1_000_000_000, 'B'), (1_000_000, 'M'), (1_000, 'K')];
      Q : constant Long_Long_Integer := Long_Long_Integer (Quantity);
   begin
      for Item of Tiers loop
         if Q >= Item.Value then
            declare
               Times_10 : constant Long_Long_Integer :=
                 (Q * 10 + Item.Value / 2) / Item.Value;
               Whole : constant Natural := Natural (Times_10 / 10);
               Tenths : constant Natural := Natural (Times_10 mod 10);
            begin
               return Decimal_Tenths (Whole, Tenths) & Item.Suffix;
            end;
         end if;
      end loop;
      return Natural_Text (Quantity);
   end Compact_Number;

   function Count_Text
     (Quantity : Natural;
      Singular : String;
      Options  : Counted_Noun_Options)
      return String
   is
      Word : Unbounded_String;
   begin
      if Quantity = 0 then
         case Options.Zero_Style is
            when No_Zero      => return "no";
            when Numeric_Zero => return "0";
            when Word_Zero    => return "zero";
         end case;
      end if;

      if Options.Number_Style = Article_Count
        or else (Options.Prefer_Article and then Quantity = 1)
      then
         if Quantity = 1 then
            return (if Starts_With_Vowel_Sound (Singular) then "an" else "a");
         end if;
      end if;

      case Options.Number_Style is
         when Numeric_Count | Article_Count =>
            return Natural_Text (Quantity);
         when Word_Count =>
            if Small_Word (Quantity, Word) then
               return To_String (Word);
            else
               return Natural_Text (Quantity);
            end if;
         when Compact_Count =>
            if Quantity >= Options.Compact_At then
               return Compact_Number (Quantity);
            else
               return Natural_Text (Quantity);
            end if;
      end case;
   end Count_Text;

   function Conjunction (Context : Humanize.Contexts.Context) return String is
      Result : constant Humanize.Status.Text_Result :=
        Humanize.I18N_Rendering.Render
          (Context, Humanize.Selections.No_Arg (Humanize.Messages.List_And));
   begin
      if Result.Status = Humanize.Status.Ok then
         return Result_Text (Result);
      else
         return "and";
      end if;
   end Conjunction;

   function Connector
     (Context : Humanize.Contexts.Context;
      Style   : List_Style)
      return String
   is
   begin
      case Style is
         when Conjunction =>
            return Conjunction (Context);
         when Disjunction =>
            return "or";
      end case;
   end Connector;

   function Format
     (Context : Humanize.Contexts.Context;
      Items   : Text_List;
      Options : List_Options := Default_List_Options)
      return Humanize.Status.Text_Result
   is
      Joined : Unbounded_String;
      And_Text : constant String := Connector (Context, Options.Style);
   begin
      if Items'Length = 0 then
         return Ok_Text ("");
      end if;

      if Items'Length = 1 then
         Joined := Items (Items'First);
      else
         for Index in Items'First .. Items'Last - 1 loop
            if Index > Items'First then
               Append (Joined, ", ");
            end if;
            Append (Joined, Items (Index));
         end loop;
         if Options.Oxford_Comma and then Items'Length > 2 then
            Append (Joined, ",");
         end if;
         Append (Joined, " " & And_Text & " ");
         Append (Joined, Items (Items'Last));
      end if;

      return Ok_Text (To_String (Joined));
   end Format;

   function Others_Text
     (Context : Humanize.Contexts.Context;
      Count   : Positive)
      return Humanize.Status.Text_Result
   is
      Key : constant Humanize.Messages.Message_Id :=
        (if Count = 1
         then Humanize.Messages.List_Other
         else Humanize.Messages.List_Others);
   begin
      return Humanize.I18N_Rendering.Render
        (Context,
         Humanize.Selections.Count
           (Key, Humanize.Selections.Count_Value (Count)));
   end Others_Text;

   function Format_Limited
     (Context : Humanize.Contexts.Context;
      Items   : Text_List;
      Limit   : Positive;
      Options : List_Options := Default_List_Options)
      return Humanize.Status.Text_Result
   is
   begin
      if Items'Length <= Limit then
         return Format (Context, Items, Options);
      end if;

      declare
         Hidden : constant Positive := Items'Length - Limit;
         Tail   : constant Humanize.Status.Text_Result :=
           Others_Text (Context, Hidden);
      begin
         if Tail.Status /= Humanize.Status.Ok then
            return Tail;
         end if;

         declare
            Shown : Text_List (1 .. Limit + 1);
         begin
            for Offset in 0 .. Limit - 1 loop
               Shown (Offset + 1) := Items (Items'First + Offset);
            end loop;
            Shown (Limit + 1) := Tail.Text;
            return Format (Context, Shown, Options);
         end;
      end;
   end Format_Limited;

   function Count
     (Context  : Humanize.Contexts.Context;
      Quantity : Natural;
      Singular : String;
      Plural   : String := "")
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Noun : constant String := Noun_For (Quantity, Singular, Plural);
   begin
      if Quantity = 0 then
         return Ok_Text ("no " & Noun);
      else
         return Ok_Text (Natural_Text (Quantity) & " " & Noun);
      end if;
   end Count;

   function Counted_Noun
     (Context  : Humanize.Contexts.Context;
      Quantity : Natural;
      Singular : String;
      Plural   : String := "";
      Options  : Counted_Noun_Options := Default_Counted_Noun_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Noun : constant String := Noun_For_Advanced (Quantity, Singular, Plural);
      Prefix : constant String := Count_Text (Quantity, Singular, Options);
   begin
      if Singular'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      elsif Options.Compact_At = 0 then
         return (Status => Humanize.Status.Invalid_Options, others => <>);
      elsif Options.Include_Noun then
         return Ok_Text (Prefix & " " & Noun);
      else
         return Ok_Text (Prefix);
      end if;
   end Counted_Noun;

   function Validation_Count
     (Context : Humanize.Contexts.Context;
      Count   : Natural;
      Options : Validation_Summary_Options :=
        Default_Validation_Summary_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Noun : constant String := Severity_Noun (Options.Severity, Count);
   begin
      if Count = 0 and then not Options.Include_Ok then
         return Ok_Text ("");
      elsif Count = 0 then
         return Ok_Text ("no " & Noun);
      else
         return Ok_Text (Natural_Text (Count) & " " & Noun);
      end if;
   end Validation_Count;

   function Validation_Summary
     (Context : Humanize.Contexts.Context;
      Issues  : Text_List;
      Options : Validation_Summary_Options :=
        Default_Validation_Summary_Options)
      return Humanize.Status.Text_Result
   is
      Count_Label : constant Humanize.Status.Text_Result :=
        Validation_Count (Context, Issues'Length, Options);
   begin
      if Count_Label.Status /= Humanize.Status.Ok then
         return Count_Label;
      elsif Issues'Length = 0
        or else Options.Style = Validation_Headline
        or else Options.Max_Details = 0
      then
         return Count_Label;
      else
         declare
            Limit   : constant Positive :=
              Positive'Min (Positive (Options.Max_Details), Issues'Length);
            Details : constant Humanize.Status.Text_Result :=
              Format_Limited
                (Context, Issues, Limit, Options.Detail_List_Options);
         begin
            if Details.Status /= Humanize.Status.Ok then
               return Details;
            else
               return Ok_Text (Result_Text (Count_Label) & ": "
                  & Result_Text (Details));
            end if;
         end;
      end if;
   end Validation_Summary;

   function Field_Problem_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Issues  : Text_List;
      Options : Validation_Summary_Options :=
        Default_Validation_Summary_Options)
      return Humanize.Status.Text_Result
   is
      Summary : constant Humanize.Status.Text_Result :=
        Validation_Summary (Context, Issues, Options);
   begin
      if Summary.Status /= Humanize.Status.Ok then
         return Summary;
      elsif Field'Length = 0 then
         return Summary;
      else
         return Ok_Text (Field & ": " & Result_Text (Summary));
      end if;
   end Field_Problem_Summary;

   function Selection_Count
     (Context  : Humanize.Contexts.Context;
      Selected : Natural;
      Total    : Natural;
      Singular : String;
      Plural   : String := "")
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Noun : constant String := Noun_For (Total, Singular, Plural);
   begin
      return Ok_Text (Natural_Text (Selected) & " of "
         & Natural_Text (Total) & " " & Noun & " selected");
   end Selection_Count;

   function Remaining_Count
     (Context   : Humanize.Contexts.Context;
      Remaining : Natural;
      Singular  : String;
      Plural    : String := "")
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Count (Context, Remaining, Singular, Plural);
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;
      return Ok_Text (Result_Text (Base) & " remaining");
   end Remaining_Count;

   function Position_Count
     (Context  : Humanize.Contexts.Context;
      Position : Natural;
      Total    : Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text (Natural_Text (Position) & " of " & Natural_Text (Total));
   end Position_Count;

   function All_Count
     (Context  : Humanize.Contexts.Context;
      Total    : Natural;
      Singular : String;
      Plural   : String := "")
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text ("all " & Natural_Text (Total) & " "
         & Noun_For (Total, Singular, Plural));
   end All_Count;

   function None_Count
     (Context  : Humanize.Contexts.Context;
      Singular : String;
      Plural   : String := "")
      return Humanize.Status.Text_Result
   is
   begin
      return Count (Context, 0, Singular, Plural);
   end None_Count;

   function Result_Count
     (Context  : Humanize.Contexts.Context;
      Quantity : Natural;
      Singular : String := "result";
      Plural   : String := "results")
      return Humanize.Status.Text_Result is
   begin
      return Count (Context, Quantity, Singular, Plural);
   end Result_Count;

   function Showing_Count
     (Context  : Humanize.Contexts.Context;
      Showing  : Natural;
      Total    : Natural;
      Singular : String := "result";
      Plural   : String := "results")
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text ("showing " & Natural_Text (Showing) & " of "
         & Natural_Text (Total) & " "
         & Noun_For (Total, Singular, Plural));
   end Showing_Count;

   function Page_Count
     (Context : Humanize.Contexts.Context;
      Page    : Natural;
      Total   : Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text ("page " & Natural_Text (Page) & " of "
         & Natural_Text (Total));
   end Page_Count;

   function More_Count
     (Context   : Humanize.Contexts.Context;
      Visible   : Natural;
      Remaining : Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text (Natural_Text (Visible) & " shown, +"
         & Natural_Text (Remaining) & " more");
   end More_Count;

   function Others_Count
     (Context   : Humanize.Contexts.Context;
      First     : String;
      Remaining : Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if Remaining = 0 then
         return Ok_Text (First);
      elsif Remaining = 1 then
         return Ok_Text (First & " and 1 other");
      else
         return Ok_Text (First & " and " & Natural_Text (Remaining)
            & " others");
      end if;
   end Others_Count;

   function Selection_Summary
     (Context  : Humanize.Contexts.Context;
      Selected : Natural;
      Total    : Natural;
      Singular : String;
      Plural   : String := "")
      return Humanize.Status.Text_Result
   is
   begin
      if Selected = 0 then
         return Ok_Text ("no " & Noun_For (Total, Singular, Plural) & " selected");
      elsif Selected = Total then
         return Ok_Text ("all " & Natural_Text (Total) & " "
            & Noun_For (Total, Singular, Plural) & " selected");
      else
         return Selection_Count (Context, Selected, Total, Singular, Plural);
      end if;
   end Selection_Summary;

   function Filtered_Count
     (Context  : Humanize.Contexts.Context;
      Matching : Natural;
      Total    : Natural;
      Singular : String := "result";
      Plural   : String := "results")
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Noun : constant String := Noun_For (Total, Singular, Plural);
   begin
      if Matching = 0 then
         return Ok_Text ("no " & Noun & " match");
      elsif Matching = Total then
         return Ok_Text ("all " & Natural_Text (Total) & " "
            & Noun & " match");
      else
         return Ok_Text (Natural_Text (Matching) & " of "
            & Natural_Text (Total) & " "
            & Noun & " match");
      end if;
   end Filtered_Count;

   function Pagination_Range
     (Context  : Humanize.Contexts.Context;
      First    : Natural;
      Last     : Natural;
      Total    : Natural;
      Singular : String := "result";
      Plural   : String := "results")
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text (Natural_Text (First) & "-"
         & Natural_Text (Last) & " of "
         & Natural_Text (Total) & " "
         & Noun_For (Total, Singular, Plural));
   end Pagination_Range;

   function Collection_Display
     (Context   : Humanize.Contexts.Context;
      Visible   : Natural;
      Remaining : Natural;
      Singular  : String := "item";
      Plural    : String := "items";
      Options   : Collection_Display_Options :=
        Default_Collection_Display_Options)
      return Humanize.Status.Text_Result
   is
      Visible_Text : constant String := Natural_Text (Visible);
      Rem_Text     : constant String := Natural_Text (Remaining);
   begin
      case Options.Style is
         when Compact_Display =>
            return Ok_Text ((if Remaining = 0 then Visible_Text else "+" & Rem_Text));
         when Summary_Display =>
            return More_Count (Context, Visible, Remaining);
         when Screen_Reader_Display =>
            return Ok_Text (Visible_Text & " " & Noun_For (Visible, Singular, Plural)
               & " shown, " & Rem_Text & " "
               & Noun_For (Remaining, Singular, Plural)
               & " available");
      end case;
   end Collection_Display;

   function Collection_Count_Label
     (Context  : Humanize.Contexts.Context;
      Total    : Natural;
      Singular : String := "item";
      Plural   : String := "items")
      return Humanize.Status.Text_Result
   is
   begin
      return Count (Context, Total, Singular, Plural);
   end Collection_Count_Label;

   function Collection_Summary
     (Context   : Humanize.Contexts.Context;
      Visible   : Natural;
      Total     : Natural;
      Singular  : String := "item";
      Plural    : String := "items";
      Options   : Collection_Summary_Options :=
        Default_Collection_Summary_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Hidden : Natural := 0;
      Visible_Text : constant String := Natural_Text (Visible);
      Total_Text : constant String := Natural_Text (Total);
   begin
      if Visible > Total then
         return Invalid_Text ("invalid collection summary");
      elsif Total = 0 then
         return Ok_Text ("no " & Noun_For (0, Singular, Plural));
      elsif Visible = 0 then
         return Ok_Text ("no " & Noun_For (Total, Singular, Plural) & " shown");
      end if;

      Hidden := Total - Visible;
      declare
         Hidden_Text : constant String := Natural_Text (Hidden);
      begin
         case Options.Style is
            when Collection_Compact_Summary =>
               if Options.Include_Total then
                  return Ok_Text (Visible_Text & "/" & Total_Text);
               elsif Options.Include_Hidden and then Hidden > 0 then
                  return Ok_Text (Visible_Text & " +" & Hidden_Text);
               else
                  return Ok_Text (Visible_Text);
               end if;

            when Collection_Detailed_Summary =>
               if Options.Include_Total and then Options.Include_Hidden
                 and then Hidden > 0
               then
                  return Ok_Text ("showing " & Visible_Text & " of " & Total_Text & " "
                     & Noun_For (Total, Singular, Plural) & ", "
                     & Hidden_Text & " hidden");
               elsif Options.Include_Total then
                  return Ok_Text ("showing " & Visible_Text & " of " & Total_Text & " "
                     & Noun_For (Total, Singular, Plural));
               elsif Options.Include_Hidden and then Hidden > 0 then
                  return Ok_Text (Visible_Text & " " & Noun_For (Visible, Singular, Plural)
                     & " shown, " & Hidden_Text & " hidden");
               else
                  return Ok_Text (Visible_Text & " " & Noun_For (Visible, Singular, Plural)
                     & " shown");
               end if;

            when Collection_Accessible_Summary =>
               return Ok_Text (Visible_Text & " " & Noun_For (Visible, Singular, Plural)
                  & " visible out of " & Total_Text & " "
                  & Noun_For (Total, Singular, Plural));
         end case;
      end;
   end Collection_Summary;

   function Empty_Collection_Label
     (Context  : Humanize.Contexts.Context;
      Singular : String := "item";
      Plural   : String := "items")
      return Humanize.Status.Text_Result
   is
   begin
      return Count (Context, 0, Singular, Plural);
   end Empty_Collection_Label;

   function Page_Position_Label
     (Context : Humanize.Contexts.Context;
      Page    : Positive;
      Total   : Positive)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if Page > Total then
         return Invalid_Text ("invalid page position");
      else
         return Ok_Text ("page " & Natural_Text (Page) & " of "
            & Natural_Text (Total));
      end if;
   end Page_Position_Label;

   function Page_Range_Label
     (Context  : Humanize.Contexts.Context;
      First    : Positive;
      Last     : Positive;
      Total    : Natural;
      Singular : String := "result";
      Plural   : String := "results")
      return Humanize.Status.Text_Result
   is
   begin
      if Last < First or else Last > Total then
         return Invalid_Text ("invalid page range");
      else
         return Pagination_Range (Context, First, Last, Total, Singular, Plural);
      end if;
   end Page_Range_Label;

   function Page_Navigation_Label
     (Context : Humanize.Contexts.Context;
      Page    : Positive;
      Total   : Positive)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if Page > Total then
         return Invalid_Text ("invalid page position");
      elsif Total = 1 then
         return Ok_Text ("only page");
      elsif Page = 1 then
         return Ok_Text ("first page, next available");
      elsif Page = Total then
         return Ok_Text ("last page, previous available");
      else
         return Ok_Text ("previous and next available");
      end if;
   end Page_Navigation_Label;

   function Page_Size_Label
     (Context   : Humanize.Contexts.Context;
      Page_Size : Positive;
      Singular  : String := "result";
      Plural    : String := "results")
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text (Natural_Text (Page_Size) & " "
         & Noun_For (Page_Size, Singular, Plural) & " per page");
   end Page_Size_Label;

   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Items   : Text_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : List_Options := Default_List_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Format (Context, Items, Options);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Format_Into;

   procedure Format_Limited_Into
     (Context : Humanize.Contexts.Context;
      Items   : Text_List;
      Limit   : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : List_Options := Default_List_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Format_Limited (Context, Items, Limit, Options);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Format_Limited_Into;

   procedure Count_Into
     (Context  : Humanize.Contexts.Context;
      Quantity : Natural;
      Singular : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Plural   : String := "")
   is
   begin
      Copy_Result
        (Count (Context, Quantity, Singular, Plural), Target, Written, Status);
   end Count_Into;

   procedure Counted_Noun_Into
     (Context  : Humanize.Contexts.Context;
      Quantity : Natural;
      Singular : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Plural   : String := "";
      Options  : Counted_Noun_Options := Default_Counted_Noun_Options)
   is
   begin
      Copy_Result
        (Counted_Noun (Context, Quantity, Singular, Plural, Options),
         Target, Written, Status);
   end Counted_Noun_Into;

   procedure Counted_Noun_Source_Label_Into
     (Source  : Count_Noun_Source;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Counted_Noun_Source_Label (Source), Target, Written, Status);
   end Counted_Noun_Source_Label_Into;

   procedure Validation_Count_Into
     (Context : Humanize.Contexts.Context;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Validation_Summary_Options :=
        Default_Validation_Summary_Options)
   is
   begin
      Copy_Result
        (Validation_Count (Context, Count, Options), Target, Written, Status);
   end Validation_Count_Into;

   procedure Validation_Summary_Into
     (Context : Humanize.Contexts.Context;
      Issues  : Text_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Validation_Summary_Options :=
        Default_Validation_Summary_Options)
   is
   begin
      Copy_Result
        (Validation_Summary (Context, Issues, Options),
         Target, Written, Status);
   end Validation_Summary_Into;

   procedure Field_Problem_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Issues  : Text_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Validation_Summary_Options :=
        Default_Validation_Summary_Options)
   is
   begin
      Copy_Result
        (Field_Problem_Summary (Context, Field, Issues, Options),
         Target, Written, Status);
   end Field_Problem_Summary_Into;

   procedure Selection_Count_Into
     (Context  : Humanize.Contexts.Context;
      Selected : Natural;
      Total    : Natural;
      Singular : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Plural   : String := "")
   is
   begin
      Copy_Result
        (Selection_Count (Context, Selected, Total, Singular, Plural),
         Target, Written, Status);
   end Selection_Count_Into;

   procedure Remaining_Count_Into
     (Context   : Humanize.Contexts.Context;
      Remaining : Natural;
      Singular  : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Plural    : String := "")
   is
   begin
      Copy_Result
        (Remaining_Count (Context, Remaining, Singular, Plural),
         Target, Written, Status);
   end Remaining_Count_Into;

   procedure Position_Count_Into
     (Context  : Humanize.Contexts.Context;
      Position : Natural;
      Total    : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Position_Count (Context, Position, Total), Target, Written, Status);
   end Position_Count_Into;

   procedure All_Count_Into
     (Context  : Humanize.Contexts.Context;
      Total    : Natural;
      Singular : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Plural   : String := "")
   is
   begin
      Copy_Result
        (All_Count (Context, Total, Singular, Plural), Target, Written, Status);
   end All_Count_Into;

   procedure None_Count_Into
     (Context  : Humanize.Contexts.Context;
      Singular : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Plural   : String := "")
   is
   begin
      Copy_Result
        (None_Count (Context, Singular, Plural), Target, Written, Status);
   end None_Count_Into;

   procedure Result_Count_Into
     (Context  : Humanize.Contexts.Context;
      Quantity : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Singular : String := "result";
      Plural   : String := "results")
   is
   begin
      Copy_Result
        (Result_Count (Context, Quantity, Singular, Plural),
         Target, Written, Status);
   end Result_Count_Into;

   procedure Showing_Count_Into
     (Context  : Humanize.Contexts.Context;
      Showing  : Natural;
      Total    : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Singular : String := "result";
      Plural   : String := "results")
   is
   begin
      Copy_Result
        (Showing_Count (Context, Showing, Total, Singular, Plural),
         Target, Written, Status);
   end Showing_Count_Into;

   procedure Page_Count_Into
     (Context : Humanize.Contexts.Context;
      Page    : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Page_Count (Context, Page, Total), Target, Written, Status);
   end Page_Count_Into;

   procedure More_Count_Into
     (Context   : Humanize.Contexts.Context;
      Visible   : Natural;
      Remaining : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (More_Count (Context, Visible, Remaining), Target, Written, Status);
   end More_Count_Into;

   procedure Others_Count_Into
     (Context   : Humanize.Contexts.Context;
      First     : String;
      Remaining : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Others_Count (Context, First, Remaining), Target, Written, Status);
   end Others_Count_Into;

   procedure Selection_Summary_Into
     (Context  : Humanize.Contexts.Context;
      Selected : Natural;
      Total    : Natural;
      Singular : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Plural   : String := "")
   is
   begin
      Copy_Result
        (Selection_Summary (Context, Selected, Total, Singular, Plural),
         Target, Written, Status);
   end Selection_Summary_Into;

   procedure Filtered_Count_Into
     (Context  : Humanize.Contexts.Context;
      Matching : Natural;
      Total    : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Singular : String := "result";
      Plural   : String := "results")
   is
   begin
      Copy_Result
        (Filtered_Count (Context, Matching, Total, Singular, Plural),
         Target, Written, Status);
   end Filtered_Count_Into;

   procedure Pagination_Range_Into
     (Context  : Humanize.Contexts.Context;
      First    : Natural;
      Last     : Natural;
      Total    : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Singular : String := "result";
      Plural   : String := "results")
   is
   begin
      Copy_Result
        (Pagination_Range (Context, First, Last, Total, Singular, Plural),
         Target, Written, Status);
   end Pagination_Range_Into;

   procedure Collection_Display_Into
     (Context   : Humanize.Contexts.Context;
      Visible   : Natural;
      Remaining : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Singular  : String := "item";
      Plural    : String := "items";
      Options   : Collection_Display_Options :=
        Default_Collection_Display_Options)
   is
   begin
      Copy_Result
        (Collection_Display
           (Context, Visible, Remaining, Singular, Plural, Options),
         Target, Written, Status);
   end Collection_Display_Into;

   procedure Collection_Count_Label_Into
     (Context  : Humanize.Contexts.Context;
      Total    : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Singular : String := "item";
      Plural   : String := "items")
   is
   begin
      Copy_Result
        (Collection_Count_Label (Context, Total, Singular, Plural),
         Target, Written, Status);
   end Collection_Count_Label_Into;

   procedure Collection_Summary_Into
     (Context   : Humanize.Contexts.Context;
      Visible   : Natural;
      Total     : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Singular  : String := "item";
      Plural    : String := "items";
      Options   : Collection_Summary_Options :=
        Default_Collection_Summary_Options)
   is
   begin
      Copy_Result
        (Collection_Summary
           (Context, Visible, Total, Singular, Plural, Options),
         Target, Written, Status);
   end Collection_Summary_Into;

   procedure Empty_Collection_Label_Into
     (Context  : Humanize.Contexts.Context;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Singular : String := "item";
      Plural   : String := "items")
   is
   begin
      Copy_Result
        (Empty_Collection_Label (Context, Singular, Plural),
         Target, Written, Status);
   end Empty_Collection_Label_Into;

   procedure Page_Position_Label_Into
     (Context : Humanize.Contexts.Context;
      Page    : Positive;
      Total   : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Page_Position_Label (Context, Page, Total), Target, Written, Status);
   end Page_Position_Label_Into;

   procedure Page_Range_Label_Into
     (Context  : Humanize.Contexts.Context;
      First    : Positive;
      Last     : Positive;
      Total    : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Singular : String := "result";
      Plural   : String := "results")
   is
   begin
      Copy_Result
        (Page_Range_Label (Context, First, Last, Total, Singular, Plural),
         Target, Written, Status);
   end Page_Range_Label_Into;

   procedure Page_Navigation_Label_Into
     (Context : Humanize.Contexts.Context;
      Page    : Positive;
      Total   : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Page_Navigation_Label (Context, Page, Total), Target, Written, Status);
   end Page_Navigation_Label_Into;

   procedure Page_Size_Label_Into
     (Context   : Humanize.Contexts.Context;
      Page_Size : Positive;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Singular  : String := "result";
      Plural    : String := "results")
   is
   begin
      Copy_Result
        (Page_Size_Label (Context, Page_Size, Singular, Plural),
         Target, Written, Status);
   end Page_Size_Label_Into;
end Humanize.Lists;
