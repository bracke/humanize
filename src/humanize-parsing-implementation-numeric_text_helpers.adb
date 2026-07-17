with Humanize.Bounded_Text;
with Humanize.Parsing.Support;

package body Humanize.Parsing.Implementation.Numeric_Text_Helpers is
   use Ada.Strings.Unbounded;

   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;
   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;
   function Is_Digit (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;
   function Upper_Char (Item : Character) return Character
      renames Humanize.Bounded_Text.Upper_Char;
   function Ends_With (Text, Suffix : String) return Boolean
      renames Humanize.Bounded_Text.Ends_With;
   function Find_Substring (Text, Pattern : String) return Natural
      renames Humanize.Bounded_Text.Index_Text;
   function Numeric_Value
     (Text  : String;
      Value : out Long_Float)
      return Boolean
      renames Humanize.Parsing.Support.Numeric_Value;

   function Parse_Two_Naturals
     (Left_Text  : String;
      Right_Text : String;
      Left       : out Natural;
      Right      : out Natural)
      return Boolean
   is
      L, R : Long_Float;
   begin
      if not Numeric_Value (Left_Text, L)
        or else not Numeric_Value (Right_Text, R)
        or else L < 0.0 or else R < 0.0
      then
         return False;
      end if;
      Left := Natural (Long_Float'Rounding (L));
      Right := Natural (Long_Float'Rounding (R));
      return Long_Float (Left) = L and then Long_Float (Right) = R;
   exception
      when others =>
         return False;
   end Parse_Two_Naturals;

   function Parse_Digit_Word
     (Text  : String;
      Digit : out Natural)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
   begin
      if Item = "zero" then
         Digit := 0;
      elsif Item = "one" then
         Digit := 1;
      elsif Item = "two" then
         Digit := 2;
      elsif Item = "three" then
         Digit := 3;
      elsif Item = "four" then
         Digit := 4;
      elsif Item = "five" then
         Digit := 5;
      elsif Item = "six" then
         Digit := 6;
      elsif Item = "seven" then
         Digit := 7;
      elsif Item = "eight" then
         Digit := 8;
      elsif Item = "nine" then
         Digit := 9;
      else
         return False;
      end if;
      return True;
   end Parse_Digit_Word;

   function Parse_Fraction_Denominator_Word
     (Text        : String;
      Denominator : out Natural)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
   begin
      if Item = "half" or else Item = "halves" then
         Denominator := 2;
      elsif Item = "third" or else Item = "thirds" then
         Denominator := 3;
      elsif Item = "quarter" or else Item = "quarters"
        or else Item = "fourth" or else Item = "fourths"
      then
         Denominator := 4;
      elsif Item = "fifth" or else Item = "fifths" then
         Denominator := 5;
      elsif Item = "sixth" or else Item = "sixths" then
         Denominator := 6;
      elsif Item = "seventh" or else Item = "sevenths" then
         Denominator := 7;
      elsif Item = "eighth" or else Item = "eighths" then
         Denominator := 8;
      elsif Item = "ninth" or else Item = "ninths" then
         Denominator := 9;
      elsif Item = "tenth" or else Item = "tenths" then
         Denominator := 10;
      else
         return False;
      end if;
      return True;
   end Parse_Fraction_Denominator_Word;

   procedure Store
     (Source : String;
      Target : out String;
      Length : out Natural)
   is
      Count : constant Natural := Natural'Min (Source'Length, Target'Length);
   begin
      Target := [others => ' '];
      if Count > 0 then
         Target (Target'First .. Target'First + Count - 1) :=
           Source (Source'First .. Source'First + Count - 1);
      end if;
      Length := Count;
   end Store;

   function Number_Token_End (Text : String) return Natural is
   begin
      for Index in Text'Range loop
         if Is_Digit (Text (Index))
           or else Text (Index) = '.'
           or else Text (Index) = ','
           or else Text (Index) = '+'
           or else Text (Index) = '-'
         then
            null;
         else
            return Index - 1;
         end if;
      end loop;
      return Text'Last;
   end Number_Token_End;

   function Parse_Number_And_Tail
     (Text   : String;
      Value  : out Long_Float;
      Tail   : out Unbounded_String)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Last : Natural;
   begin
      if Item'Length = 0 then
         return False;
      end if;

      Last := Number_Token_End (Item);
      if Last < Item'First
        or else not Numeric_Value (Item (Item'First .. Last), Value)
      then
         return False;
      end if;

      if Last = Item'Last then
         Tail := Null_Unbounded_String;
      else
         Tail := To_Unbounded_String (Trim (Item (Last + 1 .. Item'Last)));
      end if;
      return True;
   end Parse_Number_And_Tail;

   function Strip_Grouping (Text : String) return String is
      Result : String (1 .. Text'Length);
      Last : Natural := 0;
   begin
      for Char of Text loop
         if Char /= ',' and then Char /= '_' and then Char /= ' ' then
            Last := Last + 1;
            Result (Last) := Char;
         end if;
      end loop;
      return Result (1 .. Last);
   end Strip_Grouping;

   function Singular_Unit (Text : String) return String is
      Item : constant String := Clean_Lower (Text);
   begin
      if Item'Length > 1 and then Item (Item'Last) = 's' then
         return Item (Item'First .. Item'Last - 1);
      else
         return Item;
      end if;
   end Singular_Unit;

   function Parse_Natural_Field
     (Text  : String;
      Value : out Natural)
      return Boolean
   is
      Amount : Long_Float;
   begin
      if not Numeric_Value (Trim (Text), Amount) or else Amount < 0.0 then
         return False;
      end if;
      Value := Natural (Long_Float'Rounding (Amount));
      return Long_Float (Value) = Amount;
   exception
      when others =>
         return False;
   end Parse_Natural_Field;

   function Parse_Other_Count_From_Details (Text : String) return Natural is
      Item : constant String := Clean_Lower (Text);
      Other_Mark : constant String := " other";
      Others_Mark : constant String := " others";
      And_Mark : constant String := " and ";
      And_At : constant Natural := Find_Substring (Item, And_Mark);
      Amount : Long_Float;
      Tail : Unbounded_String;
   begin
      if And_At = 0 then
         return 0;
      end if;

      declare
         Candidate : constant String :=
           Trim (Item (And_At + And_Mark'Length .. Item'Last));
      begin
         if Candidate = "1 other" then
            return 1;
         elsif (Ends_With (Candidate, Other_Mark)
                or else Ends_With (Candidate, Others_Mark))
           and then Parse_Number_And_Tail (Candidate, Amount, Tail)
           and then (To_String (Tail) = "other"
                     or else To_String (Tail) = "others")
           and then Amount >= 0.0
         then
            return Natural (Long_Float'Rounding (Amount));
         else
            return 0;
         end if;
      end;
   exception
      when others =>
         return 0;
   end Parse_Other_Count_From_Details;

   function Roman_Digit (Ch : Character) return Natural is
   begin
      case Upper_Char (Ch) is
         when 'I' => return 1;
         when 'V' => return 5;
         when 'X' => return 10;
         when 'L' => return 50;
         when 'C' => return 100;
         when 'D' => return 500;
         when 'M' => return 1_000;
         when others => return 0;
      end case;
   end Roman_Digit;

   function Is_Roman_Character (Ch : Character) return Boolean is
     (Roman_Digit (Ch) /= 0);
end Humanize.Parsing.Implementation.Numeric_Text_Helpers;
