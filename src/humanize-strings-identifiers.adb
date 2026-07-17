with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Status;

package body Humanize.Strings.Identifiers is
   use type Humanize.Status.Status_Code;

   function Is_Upper (C : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Uppercase;

   function Is_Lower (C : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Lowercase;

   function Is_Digit (C : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;

   function Digit_Value (C : Character) return Natural
      renames Humanize.Bounded_Text.Digit_Value;

   function Is_Alnum (C : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Alphanumeric;

   function Lower (C : Character) return Character
      renames Humanize.Bounded_Text.Lower_Char;

   function Upper (C : Character) return Character
      renames Humanize.Bounded_Text.Upper_Char;

   function Natural_Text (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text (Result : Humanize.Status.Text_Result) return String
      renames Humanize.Bounded_Text.Result_Text;

   procedure Copy_Into
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Is_Acronym (Word : String) return Boolean is
   begin
      return Word = "api" or else Word = "url" or else Word = "http"
        or else Word = "https" or else Word = "id" or else Word = "ui"
        or else Word = "cpu" or else Word = "iops" or else Word = "utf8";
   end Is_Acronym;

   function Last_Index
     (Text : String;
      Ch   : Character)
      return Natural
   is
   begin
      for Index in reverse Text'Range loop
         if Text (Index) = Ch then
            return Index;
         end if;
      end loop;
      return 0;
   end Last_Index;

   function Parameterize
     (Text      : String;
      Separator : Character := '-')
      return Humanize.Status.Text_Result
   is
      Result        : Unbounded_String;
      Need_Separator : Boolean := False;
   begin
      for Ch of Text loop
         if Is_Alnum (Ch) then
            if Need_Separator and then Length (Result) > 0 then
               Append (Result, Separator);
            end if;
            Append (Result, Lower (Ch));
            Need_Separator := False;
         else
            Need_Separator := Length (Result) > 0;
         end if;
      end loop;
      return Ok_Text (To_String (Result));
   end Parameterize;

   function Dasherize
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
   begin
      for Ch of Text loop
         if Ch = '_' or else Ch = ' ' then
            Append (Result, "-");
         else
            Append (Result, Ch);
         end if;
      end loop;
      return Ok_Text (To_String (Result));
   end Dasherize;

   function Underscore
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      Prev   : Character := ASCII.NUL;
   begin
      for Ch of Text loop
         if Ch = '-' or else Ch = ' ' then
            if Length (Result) > 0
              and then Element (Result, Length (Result)) /= '_'
            then
               Append (Result, "_");
            end if;
         else
            if Is_Upper (Ch)
              and then Length (Result) > 0
              and then (Is_Lower (Prev) or else Is_Digit (Prev))
            then
               Append (Result, "_");
            end if;
            Append (Result, Lower (Ch));
         end if;
         Prev := Ch;
      end loop;
      return Ok_Text (To_String (Result));
   end Underscore;

   function Camelize
     (Text        : String;
      Upper_First : Boolean := True)
      return Humanize.Status.Text_Result
   is
      Result   : Unbounded_String;
      New_Word : Boolean := True;
      First    : Boolean := True;
   begin
      for Ch of Text loop
         if Ch = '_' or else Ch = '-' or else Ch = ' ' then
            New_Word := True;
         elsif New_Word then
            if First and then not Upper_First then
               Append (Result, Lower (Ch));
            else
               Append (Result, Upper (Ch));
            end if;
            New_Word := False;
            First := False;
         else
            Append (Result, Ch);
         end if;
      end loop;
      return Ok_Text (To_String (Result));
   end Camelize;

   function Humanize_String
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Under : constant Humanize.Status.Text_Result := Underscore (Text);
      Raw   : constant String := Result_Text (Under);
      Words : Unbounded_String;
   begin
      for Ch of Raw loop
         if Ch = '_' then
            Append (Words, " ");
         else
            Append (Words, Ch);
         end if;
      end loop;
      return Humanize.Strings.Capitalize (To_String (Words), Downcase => True);
   end Humanize_String;

   function Deconstantize
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Dot : constant Natural := Last_Index (Text, '.');
   begin
      if Dot = 0 then
         return Ok_Text ("");
      else
         return Ok_Text (Text (Text'First .. Dot - 1));
      end if;
   end Deconstantize;

   function Demodulize
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Dot : constant Natural := Last_Index (Text, '.');
   begin
      if Dot = 0 or else Dot = Text'Last then
         return Ok_Text (Text);
      else
         return Ok_Text (Text (Dot + 1 .. Text'Last));
      end if;
   end Demodulize;

   function Tableize
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Underscore (Text);
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;
      return Humanize.Strings.Pluralize (Result_Text (Base));
   end Tableize;

   function Classify
     (Text : String)
      return Humanize.Status.Text_Result
   is
      One : constant Humanize.Status.Text_Result :=
        Humanize.Strings.Singularize (Text);
   begin
      if One.Status /= Humanize.Status.Ok then
         return One;
      end if;
      return Camelize (Result_Text (One));
   end Classify;

   function Foreign_Key
     (Text             : String;
      Separate_Class_Id : Boolean := True)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Underscore (Result_Text (Demodulize (Text)));
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      elsif Separate_Class_Id then
         return Ok_Text (Result_Text (Base) & "_id");
      else
         return Ok_Text (Result_Text (Base) & "id");
      end if;
   end Foreign_Key;

   function Acronym
     (Text    : String;
      Options : Identifier_Options := Default_Identifier_Options)
      return Humanize.Status.Text_Result
   is
      Under : constant Humanize.Status.Text_Result := Underscore (Text);
      Word  : Unbounded_String;
      Result : Unbounded_String;

      procedure Flush is
         Raw : constant String := To_String (Word);
      begin
         if Raw'Length = 0 then
            return;
         end if;

         if Options.Preserve_Acronyms and then Is_Acronym (Raw) then
            for Ch of Raw loop
               Append (Result, Upper (Ch));
            end loop;
         else
            Append (Result, Upper (Raw (Raw'First)));
         end if;
         Word := Null_Unbounded_String;
      end Flush;
   begin
      if Under.Status /= Humanize.Status.Ok then
         return Under;
      end if;

      for Ch of Result_Text (Under) loop
         if Ch = '_' then
            Flush;
         else
            Append (Word, Ch);
         end if;
      end loop;
      Flush;
      return Ok_Text (To_String (Result));
   end Acronym;

   function Is_Key_Separator (Ch : Character) return Boolean is
     (Ch = ' ' or else Ch = ASCII.HT or else Ch = ASCII.LF
      or else Ch = ASCII.CR or else Ch = '_' or else Ch = '-'
      or else Ch = '.' or else Ch = '/' or else Ch = '\');

   function Search_Key
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result        : Unbounded_String;
      Pending_Space : Boolean := False;
   begin
      for Ch of Text loop
         if Is_Alnum (Ch) then
            if Pending_Space and then Length (Result) > 0 then
               Append (Result, " ");
            end if;
            Append (Result, Lower (Ch));
            Pending_Space := False;
         elsif Is_Key_Separator (Ch) then
            Pending_Space := Length (Result) > 0;
         end if;
      end loop;

      return Ok_Text (To_String (Result));
   end Search_Key;

   function Padded_Natural
     (Value : Natural;
      Width : Positive)
      return String
   is
      Image_Digits : constant String := Natural_Text (Value);
      Result : String (1 .. Width) := [others => '0'];
   begin
      if Image_Digits'Length >= Width then
         return Image_Digits;
      end if;

      Result (Width - Image_Digits'Length + 1 .. Width) := Image_Digits;
      return Result;
   end Padded_Natural;

   function Natural_Sort_Key
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result        : Unbounded_String;
      Index         : Natural := Text'First;
      Pending_Space : Boolean := False;
   begin
      while Index <= Text'Last loop
         if Is_Digit (Text (Index)) then
            if Pending_Space and then Length (Result) > 0 then
               Append (Result, " ");
            end if;
            Pending_Space := False;

            declare
               Start : constant Natural := Index;
            begin
               while Index <= Text'Last and then Is_Digit (Text (Index)) loop
                  Index := Index + 1;
               end loop;

               declare
                  Stop      : constant Natural := Index - 1;
                  First_Digit : Natural := Start;
               begin
                  while First_Digit < Stop and then Text (First_Digit) = '0' loop
                     First_Digit := First_Digit + 1;
                  end loop;

                  Append (Result, "{");
                  Append
                    (Result,
                     Padded_Natural (Stop - First_Digit + 1, 8));
                  Append (Result, ":");
                  Append (Result, Text (First_Digit .. Stop));
                  Append (Result, "}");
               end;
            end;
         elsif Is_Alnum (Text (Index)) then
            if Pending_Space and then Length (Result) > 0 then
               Append (Result, " ");
            end if;
            Append (Result, Lower (Text (Index)));
            Pending_Space := False;
            Index := Index + 1;
         else
            if Is_Key_Separator (Text (Index)) then
               Pending_Space := Length (Result) > 0;
            end if;
            Index := Index + 1;
         end if;
      end loop;

      return Ok_Text (To_String (Result));
   end Natural_Sort_Key;

   function Natural_Less
     (Left  : String;
      Right : String)
      return Boolean
   is
      Left_Key  : constant String := Result_Text (Natural_Sort_Key (Left));
      Right_Key : constant String := Result_Text (Natural_Sort_Key (Right));
   begin
      return Left_Key < Right_Key;
   end Natural_Less;

   function UTF8_Byte_Count
     (Lead : Character;
      Remaining : Natural)
      return Positive
   is
      Value : constant Natural := Character'Pos (Lead);
   begin
      if Value < 16#80# then
         return 1;
      elsif Value in 16#C2# .. 16#DF# and then Remaining >= 2 then
         return 2;
      elsif Value in 16#E0# .. 16#EF# and then Remaining >= 3 then
         return 3;
      elsif Value in 16#F0# .. 16#F4# and then Remaining >= 4 then
         return 4;
      else
         return 1;
      end if;
   end UTF8_Byte_Count;

   function Transliterate_ASCII
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      Index  : Natural := Text'First;
   begin
      while Index <= Text'Last loop
         if Character'Pos (Text (Index)) < 16#80# then
            Append (Result, Text (Index));
            Index := Index + 1;
         elsif Index + 1 <= Text'Last
           and then Character'Pos (Text (Index)) = 16#C3#
         then
            case Character'Pos (Text (Index + 1)) is
               when 16#80# | 16#81# | 16#82# | 16#83# | 16#84# | 16#85# =>
                  Append (Result, "A");
               when 16#86# =>
                  Append (Result, "AE");
               when 16#87# =>
                  Append (Result, "C");
               when 16#88# | 16#89# | 16#8A# | 16#8B# =>
                  Append (Result, "E");
               when 16#8C# | 16#8D# | 16#8E# | 16#8F# =>
                  Append (Result, "I");
               when 16#91# =>
                  Append (Result, "N");
               when 16#92# | 16#93# | 16#94# | 16#95# | 16#96# | 16#98# =>
                  Append (Result, "O");
               when 16#99# | 16#9A# | 16#9B# | 16#9C# =>
                  Append (Result, "U");
               when 16#9D# =>
                  Append (Result, "Y");
               when 16#9F# =>
                  Append (Result, "ss");
               when 16#A0# | 16#A1# | 16#A2# | 16#A3# | 16#A4# | 16#A5# =>
                  Append (Result, "a");
               when 16#A6# =>
                  Append (Result, "ae");
               when 16#A7# =>
                  Append (Result, "c");
               when 16#A8# | 16#A9# | 16#AA# | 16#AB# =>
                  Append (Result, "e");
               when 16#AC# | 16#AD# | 16#AE# | 16#AF# =>
                  Append (Result, "i");
               when 16#B1# =>
                  Append (Result, "n");
               when 16#B2# | 16#B3# | 16#B4# | 16#B5# | 16#B6# | 16#B8# =>
                  Append (Result, "o");
               when 16#B9# | 16#BA# | 16#BB# | 16#BC# =>
                  Append (Result, "u");
               when 16#BD# | 16#BF# =>
                  Append (Result, "y");
               when others =>
                  null;
            end case;
            Index := Index + 2;
         elsif Index + 1 <= Text'Last
           and then Character'Pos (Text (Index)) in 16#C4# .. 16#C5#
         then
            declare
               Lead : constant Natural := Character'Pos (Text (Index));
               Trail : constant Natural := Character'Pos (Text (Index + 1));
            begin
               if Lead = 16#C4# then
                  case Trail is
                     when 16#80# | 16#82# | 16#84# =>
                        Append (Result, "A");
                     when 16#81# | 16#83# | 16#85# =>
                        Append (Result, "a");
                     when 16#86# | 16#88# | 16#8A# | 16#8C# =>
                        Append (Result, "C");
                     when 16#87# | 16#89# | 16#8B# | 16#8D# =>
                        Append (Result, "c");
                     when 16#8E# | 16#90# =>
                        Append (Result, "D");
                     when 16#8F# | 16#91# =>
                        Append (Result, "d");
                     when 16#92# | 16#94# | 16#96# | 16#98# | 16#9A# =>
                        Append (Result, "E");
                     when 16#93# | 16#95# | 16#97# | 16#99# | 16#9B# =>
                        Append (Result, "e");
                     when 16#9C# | 16#9E# =>
                        Append (Result, "G");
                     when 16#9D# | 16#9F# =>
                        Append (Result, "g");
                     when 16#B0# =>
                        Append (Result, "I");
                     when 16#B1# =>
                        Append (Result, "i");
                     when 16#B9# =>
                        Append (Result, "L");
                     when 16#BA# =>
                        Append (Result, "l");
                     when others =>
                        null;
                  end case;
               else
                  case Trail is
                     when 16#81# =>
                        Append (Result, "L");
                     when 16#82# =>
                        Append (Result, "l");
                     when 16#83# | 16#87# =>
                        Append (Result, "N");
                     when 16#84# | 16#88# =>
                        Append (Result, "n");
                     when 16#90# =>
                        Append (Result, "O");
                     when 16#91# =>
                        Append (Result, "o");
                     when 16#94# | 16#98# =>
                        Append (Result, "R");
                     when 16#95# | 16#99# =>
                        Append (Result, "r");
                     when 16#9A# | 16#9C# | 16#9E# | 16#A0# =>
                        Append (Result, "S");
                     when 16#9B# | 16#9D# | 16#9F# | 16#A1# =>
                        Append (Result, "s");
                     when 16#A2# | 16#A4# =>
                        Append (Result, "T");
                     when 16#A3# | 16#A5# =>
                        Append (Result, "t");
                     when 16#AA# | 16#AC# | 16#AE# | 16#B0# =>
                        Append (Result, "U");
                     when 16#AB# | 16#AD# | 16#AF# | 16#B1# =>
                        Append (Result, "u");
                     when 16#B9# | 16#BB# | 16#BD# =>
                        Append (Result, "Z");
                     when 16#BA# | 16#BC# | 16#BE# =>
                        Append (Result, "z");
                     when others =>
                        null;
                  end case;
               end if;
            end;
            Index := Index + 2;
         elsif Index + 1 <= Text'Last
           and then Character'Pos (Text (Index)) in 16#CE# .. 16#CF#
         then
            declare
               Lead  : constant Natural := Character'Pos (Text (Index));
               Trail : constant Natural := Character'Pos (Text (Index + 1));
            begin
               if Lead = 16#CE# then
                  case Trail is
                     when 16#91# => Append (Result, "A");
                     when 16#92# => Append (Result, "B");
                     when 16#93# => Append (Result, "G");
                     when 16#94# => Append (Result, "D");
                     when 16#95# | 16#88# => Append (Result, "E");
                     when 16#96# => Append (Result, "Z");
                     when 16#97# | 16#89# => Append (Result, "I");
                     when 16#98# => Append (Result, "Th");
                     when 16#99# | 16#8A# | 16#AA# => Append (Result, "I");
                     when 16#9A# => Append (Result, "K");
                     when 16#9B# => Append (Result, "L");
                     when 16#9C# => Append (Result, "M");
                     when 16#9D# => Append (Result, "N");
                     when 16#9E# => Append (Result, "X");
                     when 16#9F# | 16#8C# => Append (Result, "O");
                     when 16#A0# => Append (Result, "P");
                     when 16#A1# => Append (Result, "R");
                     when 16#A3# => Append (Result, "S");
                     when 16#A4# => Append (Result, "T");
                     when 16#A5# | 16#8E# | 16#AB# => Append (Result, "Y");
                     when 16#A6# => Append (Result, "F");
                     when 16#A7# => Append (Result, "Ch");
                     when 16#A8# => Append (Result, "Ps");
                     when 16#A9# | 16#8F# => Append (Result, "O");
                     when 16#B1# | 16#AC# => Append (Result, "a");
                     when 16#B2# => Append (Result, "b");
                     when 16#B3# => Append (Result, "g");
                     when 16#B4# => Append (Result, "d");
                     when 16#B5# | 16#AD# => Append (Result, "e");
                     when 16#B6# => Append (Result, "z");
                     when 16#B7# | 16#AE# => Append (Result, "i");
                     when 16#B8# => Append (Result, "th");
                     when 16#B9# | 16#AF# | 16#90# | 16#CA# =>
                        Append (Result, "i");
                     when 16#BA# => Append (Result, "k");
                     when 16#BB# => Append (Result, "l");
                     when 16#BC# => Append (Result, "m");
                     when 16#BD# => Append (Result, "n");
                     when 16#BE# => Append (Result, "x");
                     when 16#BF# => Append (Result, "o");
                     when others => null;
                  end case;
               else
                  case Trail is
                     when 16#80# => Append (Result, "p");
                     when 16#81# | 16#AC# => Append (Result, "r");
                     when 16#82# | 16#83# => Append (Result, "s");
                     when 16#84# => Append (Result, "t");
                     when 16#85# | 16#8D# | 16#8B# => Append (Result, "y");
                     when 16#86# => Append (Result, "f");
                     when 16#87# => Append (Result, "ch");
                     when 16#88# => Append (Result, "ps");
                     when 16#89# | 16#8E# => Append (Result, "o");
                     when others => null;
                  end case;
               end if;
            end;
            Index := Index + 2;
         elsif Index + 1 <= Text'Last
           and then Character'Pos (Text (Index)) in 16#D0# .. 16#D1#
         then
            declare
               Lead  : constant Natural := Character'Pos (Text (Index));
               Trail : constant Natural := Character'Pos (Text (Index + 1));
            begin
               if Lead = 16#D0# then
                  case Trail is
                     when 16#90# => Append (Result, "A");
                     when 16#91# => Append (Result, "B");
                     when 16#92# => Append (Result, "V");
                     when 16#93# => Append (Result, "G");
                     when 16#94# => Append (Result, "D");
                     when 16#95# => Append (Result, "E");
                     when 16#96# => Append (Result, "Zh");
                     when 16#97# => Append (Result, "Z");
                     when 16#98# => Append (Result, "I");
                     when 16#99# => Append (Result, "Y");
                     when 16#9A# => Append (Result, "K");
                     when 16#9B# => Append (Result, "L");
                     when 16#9C# => Append (Result, "M");
                     when 16#9D# => Append (Result, "N");
                     when 16#9E# => Append (Result, "O");
                     when 16#9F# => Append (Result, "P");
                     when 16#A0# => Append (Result, "R");
                     when 16#A1# => Append (Result, "S");
                     when 16#A2# => Append (Result, "T");
                     when 16#A3# => Append (Result, "U");
                     when 16#A4# => Append (Result, "F");
                     when 16#A5# => Append (Result, "Kh");
                     when 16#A6# => Append (Result, "Ts");
                     when 16#A7# => Append (Result, "Ch");
                     when 16#A8# => Append (Result, "Sh");
                     when 16#A9# => Append (Result, "Shch");
                     when 16#AB# => Append (Result, "Y");
                     when 16#AD# => Append (Result, "E");
                     when 16#AE# => Append (Result, "Yu");
                     when 16#AF# => Append (Result, "Ya");
                     when 16#B0# => Append (Result, "a");
                     when 16#B1# => Append (Result, "b");
                     when 16#B2# => Append (Result, "v");
                     when 16#B3# => Append (Result, "g");
                     when 16#B4# => Append (Result, "d");
                     when 16#B5# => Append (Result, "e");
                     when 16#B6# => Append (Result, "zh");
                     when 16#B7# => Append (Result, "z");
                     when 16#B8# => Append (Result, "i");
                     when 16#B9# => Append (Result, "y");
                     when 16#BA# => Append (Result, "k");
                     when 16#BB# => Append (Result, "l");
                     when 16#BC# => Append (Result, "m");
                     when 16#BD# => Append (Result, "n");
                     when 16#BE# => Append (Result, "o");
                     when 16#BF# => Append (Result, "p");
                     when others => null;
                  end case;
               else
                  case Trail is
                     when 16#80# => Append (Result, "r");
                     when 16#81# => Append (Result, "s");
                     when 16#82# => Append (Result, "t");
                     when 16#83# => Append (Result, "u");
                     when 16#84# => Append (Result, "f");
                     when 16#85# => Append (Result, "kh");
                     when 16#86# => Append (Result, "ts");
                     when 16#87# => Append (Result, "ch");
                     when 16#88# => Append (Result, "sh");
                     when 16#89# => Append (Result, "shch");
                     when 16#8B# => Append (Result, "y");
                     when 16#8D# => Append (Result, "e");
                     when 16#8E# => Append (Result, "yu");
                     when 16#8F# => Append (Result, "ya");
                     when others => null;
                  end case;
               end if;
            end;
            Index := Index + 2;
         elsif Index + 1 <= Text'Last
           and then Character'Pos (Text (Index)) = 16#D7#
         then
            case Character'Pos (Text (Index + 1)) is
               when 16#90# => Append (Result, "a");
               when 16#91# => Append (Result, "b");
               when 16#92# => Append (Result, "g");
               when 16#93# => Append (Result, "d");
               when 16#94# => Append (Result, "h");
               when 16#95# => Append (Result, "v");
               when 16#96# => Append (Result, "z");
               when 16#97# => Append (Result, "ch");
               when 16#98# => Append (Result, "t");
               when 16#99# => Append (Result, "y");
               when 16#9A# | 16#9B# => Append (Result, "k");
               when 16#9C# => Append (Result, "l");
               when 16#9D# | 16#9E# => Append (Result, "m");
               when 16#9F# | 16#A0# => Append (Result, "n");
               when 16#A1# => Append (Result, "s");
               when 16#A2# => Append (Result, "a");
               when 16#A3# | 16#A4# => Append (Result, "p");
               when 16#A5# | 16#A6# => Append (Result, "ts");
               when 16#A7# => Append (Result, "q");
               when 16#A8# => Append (Result, "r");
               when 16#A9# => Append (Result, "sh");
               when 16#AA# => Append (Result, "t");
               when others => null;
            end case;
            Index := Index + 2;
         elsif Index + 1 <= Text'Last
           and then Character'Pos (Text (Index)) in 16#D4# .. 16#D6#
         then
            declare
               Lead  : constant Natural := Character'Pos (Text (Index));
               Trail : constant Natural := Character'Pos (Text (Index + 1));
            begin
               if Lead = 16#D4# then
                  case Trail is
                     when 16#B1# => Append (Result, "A");
                     when 16#B2# => Append (Result, "B");
                     when 16#B3# => Append (Result, "G");
                     when 16#B4# => Append (Result, "D");
                     when 16#B5# => Append (Result, "E");
                     when 16#B6# => Append (Result, "Z");
                     when 16#B7# => Append (Result, "E");
                     when 16#B8# => Append (Result, "Y");
                     when 16#B9# => Append (Result, "T");
                     when 16#BA# => Append (Result, "Zh");
                     when 16#BB# => Append (Result, "I");
                     when 16#BC# => Append (Result, "L");
                     when 16#BD# => Append (Result, "Kh");
                     when 16#BE# => Append (Result, "Ts");
                     when 16#BF# => Append (Result, "K");
                     when others => null;
                  end case;
               elsif Lead = 16#D5# then
                  case Trail is
                     when 16#80# => Append (Result, "H");
                     when 16#81# => Append (Result, "Dz");
                     when 16#82# => Append (Result, "Gh");
                     when 16#83# => Append (Result, "Ch");
                     when 16#84# => Append (Result, "M");
                     when 16#85# => Append (Result, "Y");
                     when 16#86# => Append (Result, "N");
                     when 16#87# => Append (Result, "Sh");
                     when 16#88# => Append (Result, "O");
                     when 16#89# => Append (Result, "Ch");
                     when 16#8A# => Append (Result, "P");
                     when 16#8B# => Append (Result, "J");
                     when 16#8C# => Append (Result, "R");
                     when 16#8D# => Append (Result, "S");
                     when 16#8E# => Append (Result, "V");
                     when 16#8F# => Append (Result, "T");
                     when 16#90# => Append (Result, "R");
                     when 16#91# => Append (Result, "Ts");
                     when 16#92# => Append (Result, "W");
                     when 16#93# => Append (Result, "P");
                     when 16#94# => Append (Result, "K");
                     when 16#95# => Append (Result, "O");
                     when 16#96# => Append (Result, "F");
                     when 16#A1# => Append (Result, "a");
                     when 16#A2# => Append (Result, "b");
                     when 16#A3# => Append (Result, "g");
                     when 16#A4# => Append (Result, "d");
                     when 16#A5# => Append (Result, "e");
                     when 16#A6# => Append (Result, "z");
                     when 16#A7# => Append (Result, "e");
                     when 16#A8# => Append (Result, "y");
                     when 16#A9# => Append (Result, "t");
                     when 16#AA# => Append (Result, "zh");
                     when 16#AB# => Append (Result, "i");
                     when 16#AC# => Append (Result, "l");
                     when 16#AD# => Append (Result, "kh");
                     when 16#AE# => Append (Result, "ts");
                     when 16#AF# => Append (Result, "k");
                     when 16#B0# => Append (Result, "h");
                     when 16#B1# => Append (Result, "dz");
                     when 16#B2# => Append (Result, "gh");
                     when 16#B3# => Append (Result, "ch");
                     when 16#B4# => Append (Result, "m");
                     when 16#B5# => Append (Result, "y");
                     when 16#B6# => Append (Result, "n");
                     when 16#B7# => Append (Result, "sh");
                     when 16#B8# => Append (Result, "o");
                     when 16#B9# => Append (Result, "ch");
                     when 16#BA# => Append (Result, "p");
                     when 16#BB# => Append (Result, "j");
                     when 16#BC# => Append (Result, "r");
                     when 16#BD# => Append (Result, "s");
                     when 16#BE# => Append (Result, "v");
                     when 16#BF# => Append (Result, "t");
                     when others => null;
                  end case;
               else
                  case Trail is
                     when 16#80# => Append (Result, "r");
                     when 16#81# => Append (Result, "ts");
                     when 16#82# => Append (Result, "w");
                     when 16#83# => Append (Result, "p");
                     when 16#84# => Append (Result, "k");
                     when 16#85# => Append (Result, "o");
                     when 16#86# => Append (Result, "f");
                     when others => null;
                  end case;
               end if;
            end;
            Index := Index + 2;
         elsif Index + 1 <= Text'Last
           and then Character'Pos (Text (Index)) in 16#D8# .. 16#D9#
         then
            declare
               Lead  : constant Natural := Character'Pos (Text (Index));
               Trail : constant Natural := Character'Pos (Text (Index + 1));
            begin
               if Lead = 16#D8# then
                  case Trail is
                     when 16#A1# | 16#A2# | 16#A3# | 16#A5# =>
                        Append (Result, "a");
                     when 16#A7# => Append (Result, "a");
                     when 16#A8# => Append (Result, "b");
                     when 16#A9# => Append (Result, "t");
                     when 16#AA# => Append (Result, "t");
                     when 16#AB# => Append (Result, "th");
                     when 16#AC# => Append (Result, "j");
                     when 16#AD# => Append (Result, "h");
                     when 16#AE# => Append (Result, "kh");
                     when 16#AF# => Append (Result, "d");
                     when 16#B0# => Append (Result, "dh");
                     when 16#B1# => Append (Result, "r");
                     when 16#B2# => Append (Result, "z");
                     when 16#B3# => Append (Result, "s");
                     when 16#B4# => Append (Result, "sh");
                     when 16#B5# => Append (Result, "s");
                     when 16#B6# => Append (Result, "d");
                     when 16#B7# => Append (Result, "t");
                     when 16#B8# => Append (Result, "z");
                     when 16#B9# => Append (Result, "a");
                     when 16#BA# => Append (Result, "gh");
                     when others => null;
                  end case;
               else
                  case Trail is
                     when 16#81# => Append (Result, "f");
                     when 16#82# => Append (Result, "q");
                     when 16#83# => Append (Result, "k");
                     when 16#84# => Append (Result, "l");
                     when 16#85# => Append (Result, "m");
                     when 16#86# => Append (Result, "n");
                     when 16#87# => Append (Result, "h");
                     when 16#88# => Append (Result, "w");
                     when 16#89# => Append (Result, "a");
                     when 16#8A# => Append (Result, "y");
                     when others => null;
                  end case;
               end if;
            end;
            Index := Index + 2;
         elsif Index + 2 <= Text'Last
           and then Character'Pos (Text (Index)) = 16#E1#
           and then Character'Pos (Text (Index + 1)) = 16#83#
         then
            case Character'Pos (Text (Index + 2)) is
               when 16#90# => Append (Result, "a");
               when 16#91# => Append (Result, "b");
               when 16#92# => Append (Result, "g");
               when 16#93# => Append (Result, "d");
               when 16#94# => Append (Result, "e");
               when 16#95# => Append (Result, "v");
               when 16#96# => Append (Result, "z");
               when 16#97# => Append (Result, "t");
               when 16#98# => Append (Result, "i");
               when 16#99# => Append (Result, "k");
               when 16#9A# => Append (Result, "l");
               when 16#9B# => Append (Result, "m");
               when 16#9C# => Append (Result, "n");
               when 16#9D# => Append (Result, "o");
               when 16#9E# => Append (Result, "p");
               when 16#9F# => Append (Result, "zh");
               when 16#A0# => Append (Result, "r");
               when 16#A1# => Append (Result, "s");
               when 16#A2# => Append (Result, "t");
               when 16#A3# => Append (Result, "u");
               when 16#A4# => Append (Result, "p");
               when 16#A5# => Append (Result, "k");
               when 16#A6# => Append (Result, "gh");
               when 16#A7# => Append (Result, "q");
               when 16#A8# => Append (Result, "sh");
               when 16#A9# => Append (Result, "ch");
               when 16#AA# => Append (Result, "ts");
               when 16#AB# => Append (Result, "dz");
               when 16#AC# => Append (Result, "ts");
               when 16#AD# => Append (Result, "ch");
               when 16#AE# => Append (Result, "kh");
               when 16#AF# => Append (Result, "j");
               when 16#B0# => Append (Result, "h");
               when others => null;
            end case;
            Index := Index + 3;
         else
            Index := Index + UTF8_Byte_Count
              (Text (Index), Text'Last - Index + 1);
         end if;
      end loop;
      return Ok_Text (To_String (Result));
   end Transliterate_ASCII;

   function Casefold_ASCII
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Transliterate_ASCII (Text);
      Result : Unbounded_String;
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;

      for Ch of Result_Text (Base) loop
         Append (Result, Lower (Ch));
      end loop;
      return Ok_Text (To_String (Result));
   end Casefold_ASCII;

   function Slug
     (Text      : String;
      Separator : Character := '-')
      return Humanize.Status.Text_Result
   is
      ASCII_Text : constant String := Result_Text (Transliterate_ASCII (Text));
   begin
      return Parameterize (ASCII_Text, Separator);
   end Slug;

   procedure Parameterize_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : Character := '-')
   is
   begin
      Copy_Into (Parameterize (Text, Separator), Target, Written, Status);
   end Parameterize_Into;

   procedure Dasherize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Dasherize (Text), Target, Written, Status);
   end Dasherize_Into;

   procedure Underscore_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Underscore (Text), Target, Written, Status);
   end Underscore_Into;

   procedure Camelize_Into
     (Text        : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Upper_First : Boolean := True)
   is
   begin
      Copy_Into (Camelize (Text, Upper_First), Target, Written, Status);
   end Camelize_Into;

   procedure Humanize_String_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Humanize_String (Text), Target, Written, Status);
   end Humanize_String_Into;

   procedure Deconstantize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Deconstantize (Text), Target, Written, Status);
   end Deconstantize_Into;

   procedure Demodulize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Demodulize (Text), Target, Written, Status);
   end Demodulize_Into;

   procedure Tableize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Tableize (Text), Target, Written, Status);
   end Tableize_Into;

   procedure Classify_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Classify (Text), Target, Written, Status);
   end Classify_Into;

   procedure Foreign_Key_Into
     (Text             : String;
      Target           : in out String;
      Written          : out Natural;
      Status           : out Humanize.Status.Status_Code;
      Separate_Class_Id : Boolean := True)
   is
   begin
      Copy_Into
        (Foreign_Key (Text, Separate_Class_Id), Target, Written, Status);
   end Foreign_Key_Into;

   procedure Acronym_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Identifier_Options := Default_Identifier_Options)
   is
   begin
      Copy_Into (Acronym (Text, Options), Target, Written, Status);
   end Acronym_Into;

   procedure Search_Key_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Search_Key (Text), Target, Written, Status);
   end Search_Key_Into;

   procedure Natural_Sort_Key_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Natural_Sort_Key (Text), Target, Written, Status);
   end Natural_Sort_Key_Into;

   procedure Transliterate_ASCII_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Transliterate_ASCII (Text), Target, Written, Status);
   end Transliterate_ASCII_Into;

   procedure Casefold_ASCII_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Casefold_ASCII (Text), Target, Written, Status);
   end Casefold_ASCII_Into;

   procedure Slug_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : Character := '-')
   is
   begin
      Copy_Into (Slug (Text, Separator), Target, Written, Status);
   end Slug_Into;
end Humanize.Strings.Identifiers;
