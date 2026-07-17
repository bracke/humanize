with Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Parsing.Implementation.Numeric_Text_Helpers;
with Humanize.Status;

package body Humanize.Parsing.Implementation.Text_Helpers is
   use type Humanize.Status.Status_Code;
   use Ada.Strings.Unbounded;

   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;
   function Lower (Text : String) return String
      renames Humanize.Bounded_Text.Lower_Text;
   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;
   function Starts_With (Text, Prefix : String) return Boolean
      renames Humanize.Bounded_Text.Starts_With;
   function Ends_With (Text, Suffix : String) return Boolean
      renames Humanize.Bounded_Text.Ends_With;
   function Is_Digit (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;
   function Is_ASCII_Letter (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Letter;
   function Is_Upper (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Uppercase;
   function Is_Lower (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Lowercase;
   function Is_Alphanumeric (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Alphanumeric;
   function Find_Substring (Text, Pattern : String) return Natural
      renames Humanize.Bounded_Text.Index_Text;
   function Parse_Number_And_Tail
     (Text   : String;
      Value  : out Long_Float;
      Tail   : out Unbounded_String)
      return Boolean
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Parse_Number_And_Tail;
   procedure Store
     (Source : String;
      Target : out String;
      Length : out Natural)
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Store;

   function First_Alphabetic_Token_Last (Text : String) return Natural is
      First : Natural := Text'First;
   begin
      while First <= Text'Last and then Text (First) = ' ' loop
         First := First + 1;
      end loop;

      if First > Text'Last or else not Is_ASCII_Letter (Text (First)) then
         return 0;
      end if;

      for Index in First .. Text'Last loop
         if not Is_ASCII_Letter (Text (Index)) then
            return Index - 1;
         end if;
      end loop;

      return Text'Last;
   end First_Alphabetic_Token_Last;

   function Is_Alnum (Item : Character) return Boolean is
     (Is_Alphanumeric (Item));

   function Is_Lower_Alnum_Or
     (Item      : Character;
      Separator : Character)
      return Boolean
   is
     (Is_Lower (Item)
     or else Is_Digit (Item)
     or else Item = Separator);

   function Word_Count (Text : String) return Natural is
      Count : Natural := 0;
      In_Word : Boolean := False;
   begin
      for Ch of Text loop
         if Is_Alnum (Ch) then
            if not In_Word then
               Count := Count + 1;
            end if;
            In_Word := True;
         else
            In_Word := False;
         end if;
      end loop;
      return Count;
   end Word_Count;

   function Count_Words (Text : String) return Natural is
      Item : constant String := Trim (Text);
      Count : Natural := 0;
      In_Word : Boolean := False;
   begin
      for Ch of Item loop
         if Ch = ' ' then
            In_Word := False;
         elsif not In_Word then
            Count := Count + 1;
            In_Word := True;
         end if;
      end loop;
      return Count;
   end Count_Words;

   function Lowercase_Label (Text : String) return Boolean is
      Seen : Boolean := False;
   begin
      for Ch of Text loop
         if Is_Upper (Ch) then
            return False;
         elsif Is_Lower (Ch) then
            Seen := True;
         end if;
      end loop;
      return Seen;
   end Lowercase_Label;

   function Uppercase_Label (Text : String) return Boolean is
      Seen : Boolean := False;
   begin
      for Ch of Text loop
         if Is_Lower (Ch) then
            return False;
         elsif Is_Upper (Ch) then
            Seen := True;
         end if;
      end loop;
      return Seen;
   end Uppercase_Label;

   function Title_Case_Label (Text : String) return Boolean is
      At_Word_Start : Boolean := True;
      Seen_Word : Boolean := False;
   begin
      for Ch of Text loop
         if Is_Alnum (Ch) then
            if At_Word_Start then
               if Is_Lower (Ch) then
                  return False;
               end if;
               Seen_Word := True;
            elsif Is_Upper (Ch) then
               return False;
            end if;
            At_Word_Start := False;
         else
            At_Word_Start := True;
         end if;
      end loop;
      return Seen_Word;
   end Title_Case_Label;

   function ASCII_Only_Label (Text : String) return Boolean is
   begin
      for Ch of Text loop
         if Character'Pos (Ch) > 127 then
            return False;
         end if;
      end loop;
      return True;
   end ASCII_Only_Label;

   function Has_Spaced_Token (Text, Token : String) return Boolean is
     (Find_Substring (Text, " " & Token & " ") /= 0);

   function Starts_At
     (Text    : String;
      Index   : Natural;
      Pattern : String)
      return Boolean
   is
   begin
      return Index in Text'Range
        and then Index + Pattern'Length - 1 <= Text'Last
        and then Text (Index .. Index + Pattern'Length - 1) = Pattern;
   end Starts_At;

   function Parse_Text_Count_Summary
     (Text : String)
      return Humanize.Parsing.Text_Count_Summary_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Count : Natural := 0;
      Unit_Buffer : String (1 .. 32);
      Unit_Length : Natural;
      Amount : Long_Float;
      Tail : Unbounded_String;
   begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Humanize.Parsing.Empty_Input,
                 others => <>);
      elsif Starts_With (Item, "no ") then
         Store (Item (Item'First + 3 .. Item'Last), Unit_Buffer, Unit_Length);
      elsif Parse_Number_And_Tail (Item, Amount, Tail) and then Amount >= 0.0
      then
         Count := Natural (Long_Float'Rounding (Amount));
         if Long_Float (Count) /= Amount then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Humanize.Parsing.Expected_Number,
                    others => <>);
         end if;
         Store (To_String (Tail), Unit_Buffer, Unit_Length);
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Humanize.Parsing.Expected_Number,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Count => Count,
         Unit => Unit_Buffer,
         Unit_Length => Unit_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => Humanize.Parsing.No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Text_Count_Summary;

   function Parse_Count_With_Expected_Unit
     (Text          : String;
      Singular_Unit : String;
      Plural_Unit   : String)
      return Humanize.Parsing.Text_Count_Summary_Parse_Result
   is
      Result : constant Humanize.Parsing.Text_Count_Summary_Parse_Result :=
        Parse_Text_Count_Summary (Text);
      Unit : constant String :=
        (if Result.Unit_Length = 0 then ""
         else Result.Unit (1 .. Result.Unit_Length));
   begin
      if Result.Status /= Humanize.Status.Ok then
         return Result;
      elsif Unit /= Singular_Unit and then Unit /= Plural_Unit then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Humanize.Parsing.Expected_Unit,
                 others => <>);
      else
         return Result;
      end if;
   end Parse_Count_With_Expected_Unit;

   function Parse_Word_Count_Summary
     (Text : String)
      return Humanize.Parsing.Text_Count_Summary_Parse_Result is
   begin
      return Parse_Count_With_Expected_Unit (Text, "word", "words");
   end Parse_Word_Count_Summary;

   function Parse_Sentence_Count_Summary
     (Text : String)
      return Humanize.Parsing.Text_Count_Summary_Parse_Result is
   begin
      return Parse_Count_With_Expected_Unit (Text, "sentence", "sentences");
   end Parse_Sentence_Count_Summary;

   function Parse_Paragraph_Count_Summary
     (Text : String)
      return Humanize.Parsing.Text_Count_Summary_Parse_Result is
   begin
      return Parse_Count_With_Expected_Unit (Text, "paragraph", "paragraphs");
   end Parse_Paragraph_Count_Summary;

   function Parse_Mask
     (Text : String;
      Mask_Char : Character := '*')
      return Humanize.Parsing.Mask_Parse_Result
   is
      Item : constant String := Text;
      Hidden : Natural := 0;
      Visible_Buffer : String (1 .. 80);
      Visible_Length : Natural;
   begin
      for Ch of Item loop
         exit when Ch /= Mask_Char;
         Hidden := Hidden + 1;
      end loop;

      if Hidden = 0 then
         Store (Item, Visible_Buffer, Visible_Length);
      elsif Hidden = Item'Length then
         Store ("", Visible_Buffer, Visible_Length);
      else
         Store (Item (Item'First + Hidden .. Item'Last),
                Visible_Buffer, Visible_Length);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Masked_Count => Hidden,
         Visible_Count => Item'Length - Hidden,
         Mask_Char => Mask_Char,
         Visible_Tail => Visible_Buffer,
         Visible_Tail_Length => Visible_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => Humanize.Parsing.No_Parse_Error);
   end Parse_Mask;

   function Parse_Grouped_Token
     (Text : String;
      Separator : Character := '-')
      return Humanize.Parsing.Grouped_Token_Parse_Result
   is
      Item : constant String := Trim (Text);
      Groups : Natural := (if Item'Length = 0 then 0 else 1);
      Has_Separator : Boolean := False;
      Normal : String (1 .. 160);
      Normal_Length : Natural := 0;
   begin
      for Ch of Item loop
         if Ch = Separator then
            Groups := Groups + 1;
            Has_Separator := True;
         else
            if Normal_Length < Normal'Length then
               Normal_Length := Normal_Length + 1;
               Normal (Normal_Length) := Ch;
            end if;
         end if;
      end loop;
      if Normal_Length < Normal'Length then
         Normal (Normal_Length + 1 .. Normal'Last) := [others => ' '];
      end if;

      return
        (Status => Humanize.Status.Ok,
         Group_Count => Groups,
         Token_Length => Normal_Length,
         Separator => Separator,
         Has_Separator => Has_Separator,
         Normalized => Normal,
         Normalized_Length => Normal_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => Humanize.Parsing.No_Parse_Error);
   end Parse_Grouped_Token;

   function Parse_Masked_Token
     (Text : String;
      Separator : Character := '-';
      Mask_Char : Character := '*')
      return Humanize.Parsing.Grouped_Token_Parse_Result
   is
      pragma Unreferenced (Mask_Char);
   begin
      return Parse_Grouped_Token (Text, Separator);
   end Parse_Masked_Token;

   function Parse_Initials
     (Text : String)
      return Humanize.Parsing.Initials_Parse_Result
   is
      Item : constant String := Trim (Text);
      Buffer : String (1 .. 32);
      Length : Natural;
      Uppercase : Boolean := True;
      Has_Digit : Boolean := False;
   begin
      for Ch of Item loop
         if not Is_Alnum (Ch) then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Humanize.Parsing.Unsupported_Form,
                    others => <>);
         elsif Is_Lower (Ch) then
            Uppercase := False;
         elsif Is_Digit (Ch) then
            Has_Digit := True;
         end if;
      end loop;

      Store (Item, Buffer, Length);
      return
        (Status => Humanize.Status.Ok,
         Value => Buffer,
         Value_Length => Length,
         Initial_Count => Item'Length,
         All_Uppercase => Uppercase,
         Has_Digit => Has_Digit,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => Humanize.Parsing.No_Parse_Error);
   end Parse_Initials;

   function Parse_Person_Initials
     (Text : String)
      return Humanize.Parsing.Initials_Parse_Result is
   begin
      return Parse_Initials (Text);
   end Parse_Person_Initials;

   function Parse_Possessive_Label
     (Text : String)
      return Humanize.Parsing.Possessive_Parse_Result
   is
      Item : constant String := Trim (Text);
      Owner_Last : Natural := 0;
      Apostrophe_Only : Boolean := False;
      Buffer : String (1 .. 160);
      Length : Natural;
      Owner_Text : Unbounded_String;
   begin
      if Ends_With (Item, "'s") then
         Owner_Last := Item'Last - 2;
      elsif Ends_With (Item, "'") then
         Owner_Last := Item'Last - 1;
         Apostrophe_Only := True;
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Humanize.Parsing.Unsupported_Form,
                 others => <>);
      end if;

      if Owner_Last < Item'First then
         Store ("", Buffer, Length);
         Owner_Text := To_Unbounded_String ("");
      else
         Store (Item (Item'First .. Owner_Last), Buffer, Length);
         Owner_Text := To_Unbounded_String (Item (Item'First .. Owner_Last));
      end if;

      return
        (Status => Humanize.Status.Ok,
         Owner => Buffer,
         Owner_Length => Length,
         Apostrophe_Only => Apostrophe_Only,
         Owner_Ends_With_S =>
           Length > 0
           and then Lower (To_String (Owner_Text)
             (To_String (Owner_Text)'Last .. To_String (Owner_Text)'Last)) = "s",
         Owner_Word_Count => Word_Count (To_String (Owner_Text)),
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => Humanize.Parsing.No_Parse_Error);
   end Parse_Possessive_Label;

   function Parse_Possessive_Name
     (Text : String)
      return Humanize.Parsing.Possessive_Parse_Result is
   begin
      return Parse_Possessive_Label (Text);
   end Parse_Possessive_Name;
end Humanize.Parsing.Implementation.Text_Helpers;
