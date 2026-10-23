with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.I18N_Rendering;
with Humanize.Message_Keys;
with Humanize.Selections;
with Humanize.Status;

package body Humanize.Parsing.Locale_Digits is

   use type Humanize.Status.Status_Code;

   --  Text with the locale's digits as ASCII and its grouping separators
   --  dropped between digits ("١٢٣", German "1.234" -> "1234"), learnt from
   --  how the locale writes 1234567890; Text where the locale cannot render.
   function Base (Context : Humanize.Contexts.Context; Text : String) return String is
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
   end Base;

   function Normalize
     (Context    : Humanize.Contexts.Context;
      Text       : String;
      Quantities : Boolean := False)
      return String
   is
      Plain : constant String := Base (Context, Text);
   begin
      if not Quantities then
         return Plain;
      end if;
      declare
         --  The decimal separator: what the locale writes between 0 and 5
         --  of one half.
         Half : constant Humanize.Status.Text_Result :=
           Humanize.I18N_Rendering.Render
             (Context, Humanize.Selections.Text_Value (Humanize.Message_Keys.Number_Plain, "0.5"));
         Half_Text : constant String :=
           (if Half.Status = Humanize.Status.Ok then Base (Context, To_String (Half.Text)) else "0.5");
         Zero : constant Natural := Index (To_Unbounded_String (Half_Text), "0");
         Five : constant Natural := Index (To_Unbounded_String (Half_Text), "5");
         Decimal : constant String :=
           (if Zero > 0 and then Five > Zero + 1 then Half_Text (Zero + 1 .. Five - 1) else ".");
         Result : Unbounded_String;
         I      : Positive := Plain'First;

         function At_Position (Item : String) return Boolean is
           (I + Item'Length - 1 <= Plain'Last and then Plain (I .. I + Item'Length - 1) = Item);
      begin
         while I <= Plain'Last loop
            if Decimal /= "." and then At_Position (Decimal)
              and then Length (Result) > 0 and then Element (Result, Length (Result)) in '0' .. '9'
              and then I + Decimal'Length <= Plain'Last and then Plain (I + Decimal'Length) in '0' .. '9'
            then
               Append (Result, '.');
               I := I + Decimal'Length;
            elsif At_Position ([Character'Val (16#C2#), Character'Val (16#A0#)]) then
               Append (Result, ' ');
               I := I + 2;
            elsif At_Position ([Character'Val (16#E2#), Character'Val (16#80#), Character'Val (16#AF#)])
              or else At_Position ([Character'Val (16#E2#), Character'Val (16#80#), Character'Val (16#89#)])
            then
               Append (Result, ' ');
               I := I + 3;
            elsif At_Position ([Character'Val (16#E2#), Character'Val (16#80#), Character'Val (16#8E#)])
              or else At_Position ([Character'Val (16#E2#), Character'Val (16#80#), Character'Val (16#8F#)])
            then
               I := I + 3;
            elsif At_Position ([Character'Val (16#D8#), Character'Val (16#9C#)]) then
               I := I + 2;
            else
               Append (Result, Plain (I));
               I := I + 1;
            end if;
         end loop;
         return To_String (Result);
      end;
   end Normalize;

end Humanize.Parsing.Locale_Digits;
