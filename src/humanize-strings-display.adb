with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Status;

package body Humanize.Strings.Display is
   use type Humanize.Status.Status_Code;

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

   function UTF8_Byte_Count
     (Lead : Character;
      Remaining : Natural)
      return Positive;

   function UTF8_Code_Point
     (Text  : String;
      Index : Natural;
      Width : out Positive)
      return Natural;

   function Is_UTF8_Continuation (Ch : Character) return Boolean;

   function Is_Unicode_Combining_Mark (Code : Natural) return Boolean is
     ((Code in 16#0300# .. 16#036F#)
      or else (Code in 16#1AB0# .. 16#1AFF#)
      or else (Code in 16#1DC0# .. 16#1DFF#)
      or else (Code in 16#20D0# .. 16#20FF#)
      or else (Code in 16#FE20# .. 16#FE2F#));

   function Is_Unicode_Default_Ignorable (Code : Natural) return Boolean is
     (Code = 16#00AD#
      or else Code = 16#034F#
      or else (Code in 16#061C# .. 16#061C#)
      or else (Code in 16#115F# .. 16#1160#)
      or else (Code in 16#17B4# .. 16#17B5#)
      or else (Code in 16#180B# .. 16#180F#)
      or else (Code in 16#200B# .. 16#200F#)
      or else (Code in 16#202A# .. 16#202E#)
      or else (Code in 16#2060# .. 16#206F#)
      or else (Code in 16#3164# .. 16#3164#)
      or else (Code in 16#FE00# .. 16#FE0F#)
      or else (Code in 16#FEFF# .. 16#FEFF#)
      or else (Code in 16#FFA0# .. 16#FFA0#)
      or else (Code in 16#FFF0# .. 16#FFF8#)
      or else (Code in 16#1BCA0# .. 16#1BCA3#)
      or else (Code in 16#1D173# .. 16#1D17A#)
      or else (Code in 16#E0000# .. 16#E0FFF#));

   function Is_Unicode_Space (Code : Natural) return Boolean is
     (Code = 16#0009# or else Code = 16#000A# or else Code = 16#000B#
      or else Code = 16#000C# or else Code = 16#000D#
      or else Code = 16#0020# or else Code = 16#0085#
      or else Code = 16#00A0# or else Code = 16#1680#
      or else (Code in 16#2000# .. 16#200A#)
      or else Code = 16#2028# or else Code = 16#2029#
      or else Code = 16#202F# or else Code = 16#205F#
      or else Code = 16#3000#);

   function Is_Unicode_Punctuation (Code : Natural) return Boolean is
     ((Code in 16#0021# .. 16#002F#)
      or else (Code in 16#003A# .. 16#0040#)
      or else (Code in 16#005B# .. 16#0060#)
      or else (Code in 16#007B# .. 16#007E#)
      or else Code = 16#00A1# or else Code = 16#00A7#
      or else Code = 16#00AB# or else Code = 16#00B6#
      or else Code = 16#00B7# or else Code = 16#00BB#
      or else Code = 16#00BF# or else Code = 16#037E#
      or else Code = 16#0387# or else Code = 16#05BE#
      or else Code = 16#05C0# or else Code = 16#05C3#
      or else Code = 16#05C6# or else Code = 16#060C#
      or else Code = 16#061B# or else Code = 16#061F#
      or else Code = 16#06D4#
      or else (Code in 16#2000# .. 16#206F#)
      or else (Code in 16#3000# .. 16#303F#)
      or else (Code in 16#FE10# .. 16#FE1F#)
      or else (Code in 16#FE30# .. 16#FE6F#)
      or else (Code in 16#FF01# .. 16#FF0F#)
      or else (Code in 16#FF1A# .. 16#FF20#)
      or else (Code in 16#FF3B# .. 16#FF40#)
      or else (Code in 16#FF5B# .. 16#FF65#));

   function Is_Unicode_Word_Start (Code : Natural) return Boolean is
     (not Is_Unicode_Space (Code)
      and then not Is_Unicode_Punctuation (Code)
      and then not Is_Unicode_Combining_Mark (Code)
      and then
     ((Code in Character'Pos ('0') .. Character'Pos ('9'))
      or else (Code in Character'Pos ('A') .. Character'Pos ('Z'))
      or else (Code in Character'Pos ('a') .. Character'Pos ('z'))
      or else (Code in 16#00AA# .. 16#00AA#)
      or else (Code in 16#00B2# .. 16#00B3#)
      or else (Code in 16#00B5# .. 16#00B5#)
      or else (Code in 16#00B9# .. 16#00BA#)
      or else (Code in 16#00C0# .. 16#00D6#)
      or else (Code in 16#00D8# .. 16#00F6#)
      or else (Code in 16#00F8# .. 16#02AF#)
      or else (Code in 16#0370# .. 16#03FF#)
      or else (Code in 16#0400# .. 16#052F#)
      or else (Code in 16#0530# .. 16#058F#)
      or else (Code in 16#0590# .. 16#05FF#)
      or else (Code in 16#0600# .. 16#06FF#)
      or else (Code in 16#0750# .. 16#077F#)
      or else (Code in 16#08A0# .. 16#08FF#)
      or else (Code in 16#0900# .. 16#0DFF#)
      or else (Code in 16#0E00# .. 16#0E7F#)
      or else (Code in 16#0F00# .. 16#0FFF#)
      or else (Code in 16#1000# .. 16#109F#)
      or else (Code in 16#10A0# .. 16#10FF#)
      or else (Code in 16#1100# .. 16#11FF#)
      or else (Code in 16#1200# .. 16#137F#)
      or else (Code in 16#13A0# .. 16#13FF#)
      or else (Code in 16#1780# .. 16#17FF#)
      or else (Code in 16#1800# .. 16#18AF#)
      or else (Code in 16#1E00# .. 16#1EFF#)
      or else (Code in 16#1F00# .. 16#1FFF#)
      or else (Code in 16#3040# .. 16#30FF#)
      or else (Code in 16#3400# .. 16#4DBF#)
      or else (Code in 16#4E00# .. 16#9FFF#)
      or else (Code in 16#AC00# .. 16#D7AF#)
      or else (Code in 16#F900# .. 16#FAFF#)
      or else (Code in 16#FF10# .. 16#FF19#)
      or else (Code in 16#FF21# .. 16#FF3A#)
      or else (Code in 16#FF41# .. 16#FF5A#)
      or else (Code in 16#20000# .. 16#2FA1F#)));

   function Is_Unicode_Word_Continuation (Code : Natural) return Boolean is
     (Is_Unicode_Word_Start (Code) or else Is_Unicode_Combining_Mark (Code));

   function Is_Internal_Word_Connector (Code : Natural) return Boolean is
     (Code = Character'Pos (''') or else Code = Character'Pos ('-')
      or else Code = 16#2019# or else Code = 16#02BC#);

   function Is_Sentence_Terminator (Code : Natural) return Boolean is
     (Code = Character'Pos ('.') or else Code = Character'Pos ('?')
      or else Code = Character'Pos ('!') or else Code = 16#061F#
      or else Code = 16#06D4# or else Code = 16#0964#
      or else Code = 16#0965# or else Code = 16#2026#
      or else Code = 16#3002# or else Code = 16#FF01#
      or else Code = 16#FF1F#);

   function Is_Line_Break (Code : Natural) return Boolean is
     (Code = 16#000A# or else Code = 16#000D# or else Code = 16#0085#
      or else Code = 16#2028#);

   function Is_Paragraph_Break (Code : Natural) return Boolean is
     (Code = 16#2029#);

   function Is_Wide_Code_Point (Code : Natural) return Boolean is
     ((Code in 16#1100# .. 16#115F#)
      or else (Code in 16#2329# .. 16#232A#)
      or else (Code in 16#2E80# .. 16#A4CF#)
      or else (Code in 16#AC00# .. 16#D7A3#)
      or else (Code in 16#F900# .. 16#FAFF#)
      or else (Code in 16#FE10# .. 16#FE19#)
      or else (Code in 16#FE30# .. 16#FE6F#)
      or else (Code in 16#FF00# .. 16#FF60#)
      or else (Code in 16#FFE0# .. 16#FFE6#)
      or else (Code in 16#16FE0# .. 16#16FE4#)
      or else (Code in 16#17000# .. 16#187F7#)
      or else (Code in 16#18800# .. 16#18CD5#)
      or else (Code in 16#18D00# .. 16#18D08#)
      or else (Code in 16#1AFF0# .. 16#1AFFF#)
      or else (Code in 16#1B000# .. 16#1B122#)
      or else (Code in 16#1B132# .. 16#1B132#)
      or else (Code in 16#1B150# .. 16#1B152#)
      or else (Code in 16#1B155# .. 16#1B155#)
      or else (Code in 16#1B164# .. 16#1B167#)
      or else (Code in 16#1F200# .. 16#1F2FF#)
      or else (Code in 16#1F300# .. 16#1FAFF#)
      or else (Code in 16#20000# .. 16#3FFFD#));

   function Unicode_Display_Cell_Width (Code : Natural) return Natural is
   begin
      if Code = 0
        or else Code < 16#20#
        or else (Code in 16#007F# .. 16#009F#)
        or else Is_Unicode_Combining_Mark (Code)
        or else Is_Unicode_Default_Ignorable (Code)
      then
         return 0;
      elsif Is_Wide_Code_Point (Code) then
         return 2;
      else
         return 1;
      end if;
   end Unicode_Display_Cell_Width;

   function Next_Code_Point_Is_Word_Start
     (Text  : String;
      Index : Natural)
      return Boolean
   is
      Width : Positive;
   begin
      if Index > Text'Last then
         return False;
      end if;
      return Is_Unicode_Word_Start (UTF8_Code_Point (Text, Index, Width));
   end Next_Code_Point_Is_Word_Start;

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

   function Is_UTF8_Continuation (Ch : Character) return Boolean is
      Value : constant Natural := Character'Pos (Ch);
   begin
      return Value in 16#80# .. 16#BF#;
   end Is_UTF8_Continuation;

   function UTF8_Code_Point
     (Text  : String;
      Index : Natural;
      Width : out Positive)
      return Natural
   is
      B1 : constant Natural := Character'Pos (Text (Index));
      B2 : Natural := 0;
      B3 : Natural := 0;
      B4 : Natural := 0;
   begin
      Width := UTF8_Byte_Count (Text (Index), Text'Last - Index + 1);
      if Width = 1 then
         return B1;
      elsif Index + Width - 1 > Text'Last then
         Width := 1;
         return B1;
      end if;

      if Width >= 2 then
         if not Is_UTF8_Continuation (Text (Index + 1)) then
            Width := 1;
            return B1;
         end if;
         B2 := Character'Pos (Text (Index + 1));
      end if;

      if Width >= 3 then
         if not Is_UTF8_Continuation (Text (Index + 2)) then
            Width := 1;
            return B1;
         end if;
         B3 := Character'Pos (Text (Index + 2));
      end if;

      if Width = 4 then
         if not Is_UTF8_Continuation (Text (Index + 3)) then
            Width := 1;
            return B1;
         end if;
         B4 := Character'Pos (Text (Index + 3));
      end if;

      if Width = 3
        and then
          ((B1 = 16#E0# and then B2 < 16#A0#)
           or else (B1 = 16#ED# and then B2 >= 16#A0#))
      then
         Width := 1;
         return B1;
      elsif Width = 4
        and then
          ((B1 = 16#F0# and then B2 < 16#90#)
           or else (B1 = 16#F4# and then B2 > 16#8F#))
      then
         Width := 1;
         return B1;
      end if;

      case Width is
         when 2 =>
            return (B1 - 16#C0#) * 16#40# + (B2 - 16#80#);
         when 3 =>
            return (B1 - 16#E0#) * 16#1000#
              + (B2 - 16#80#) * 16#40# + (B3 - 16#80#);
         when 4 =>
            return (B1 - 16#F0#) * 16#40000#
              + (B2 - 16#80#) * 16#1000#
              + (B3 - 16#80#) * 16#40# + (B4 - 16#80#);
         when others =>
            return B1;
      end case;
   end UTF8_Code_Point;

   function UTF8_Length
     (Text : String)
      return Natural
   is
      Index : Natural := Text'First;
      Count : Natural := 0;
      Width : Positive;
   begin
      while Index <= Text'Last loop
         Count := Count + 1;
         declare
            Code : constant Natural := UTF8_Code_Point (Text, Index, Width);
            pragma Unreferenced (Code);
         begin
            Index := Index + Width;
         end;
      end loop;
      return Count;
   end UTF8_Length;

   function UTF8_Display_Width
     (Text : String)
      return Natural
   is
      Index : Natural := Text'First;
      Count : Natural := 0;
      Width : Positive;
   begin
      while Index <= Text'Last loop
         Count := Count + Unicode_Display_Cell_Width
           (UTF8_Code_Point (Text, Index, Width));
         Index := Index + Width;
      end loop;
      return Count;
   end UTF8_Display_Width;

   function Is_Regional_Indicator (Code : Natural) return Boolean is
     (Code in 16#1F1E6# .. 16#1F1FF#);

   function Is_Emoji_Modifier (Code : Natural) return Boolean is
     (Code in 16#1F3FB# .. 16#1F3FF#);

   function Is_Variation_Selector (Code : Natural) return Boolean is
     ((Code in 16#FE00# .. 16#FE0F#)
      or else (Code in 16#E0100# .. 16#E01EF#));

   function Is_Text_Variation_Selector (Code : Natural) return Boolean is
     (Code = 16#FE0E#);

   function Is_Emoji_Variation_Selector (Code : Natural) return Boolean is
     (Code = 16#FE0F#);

   function Is_Default_Emoji_Presentation (Code : Natural) return Boolean is
     ((Code in 16#1F000# .. 16#1FAFF#)
      or else (Code in 16#2300# .. 16#23FF#));

   function Is_Extended_Pictographic (Code : Natural) return Boolean is
     ((Code in 16#00A9# .. 16#00A9#)
      or else (Code in 16#00AE# .. 16#00AE#)
      or else (Code in 16#203C# .. 16#203C#)
      or else (Code in 16#2049# .. 16#2049#)
      or else (Code in 16#2122# .. 16#2122#)
      or else (Code in 16#2139# .. 16#2139#)
      or else (Code in 16#2194# .. 16#21AA#)
      or else (Code in 16#231A# .. 16#231B#)
      or else (Code in 16#2328# .. 16#2328#)
      or else (Code in 16#23CF# .. 16#23CF#)
      or else (Code in 16#23E9# .. 16#23F3#)
      or else (Code in 16#23F8# .. 16#23FA#)
      or else (Code in 16#24C2# .. 16#24C2#)
      or else (Code in 16#25AA# .. 16#25AB#)
      or else (Code in 16#25B6# .. 16#25B6#)
      or else (Code in 16#25C0# .. 16#25C0#)
      or else (Code in 16#25FB# .. 16#25FE#)
      or else (Code in 16#2600# .. 16#27BF#)
      or else (Code in 16#2934# .. 16#2935#)
      or else (Code in 16#2B05# .. 16#2B55#)
      or else (Code in 16#3030# .. 16#3030#)
      or else (Code in 16#303D# .. 16#303D#)
      or else (Code in 16#3297# .. 16#3297#)
      or else (Code in 16#3299# .. 16#3299#)
      or else (Code in 16#1F000# .. 16#1FAFF#));

   function Is_Emoji_Keycap_Base (Code : Natural) return Boolean is
     ((Code in Character'Pos ('0') .. Character'Pos ('9'))
      or else Code = Character'Pos ('#')
      or else Code = Character'Pos ('*'));

   function Is_Grapheme_Control (Code : Natural) return Boolean is
     ((Code in 16#0000# .. 16#0009#)
      or else (Code in 16#000B# .. 16#000C#)
      or else (Code in 16#000E# .. 16#001F#)
      or else (Code in 16#007F# .. 16#009F#));

   function Is_Grapheme_Prepend (Code : Natural) return Boolean is
     ((Code in 16#0600# .. 16#0605#)
      or else Code = 16#06DD#
      or else Code = 16#070F#
      or else (Code in 16#0890# .. 16#0891#)
      or else Code = 16#08E2#
      or else Code = 16#110BD#
      or else Code = 16#110CD#);

   function Is_Grapheme_Spacing_Mark (Code : Natural) return Boolean is
     ((Code in 16#0903# .. 16#0903#)
      or else (Code in 16#093B# .. 16#093B#)
      or else (Code in 16#093E# .. 16#0940#)
      or else (Code in 16#0949# .. 16#094C#)
      or else (Code in 16#094E# .. 16#094F#)
      or else (Code in 16#0982# .. 16#0983#)
      or else (Code in 16#09BE# .. 16#09C0#)
      or else (Code in 16#09C7# .. 16#09C8#)
      or else (Code in 16#09CB# .. 16#09CC#)
      or else Code = 16#09D7#
      or else (Code in 16#0A03# .. 16#0A03#)
      or else (Code in 16#0A3E# .. 16#0A40#)
      or else (Code in 16#0A83# .. 16#0A83#)
      or else (Code in 16#0ABE# .. 16#0AC0#)
      or else Code = 16#0AC9#
      or else (Code in 16#0ACB# .. 16#0ACC#)
      or else (Code in 16#0B02# .. 16#0B03#)
      or else Code = 16#0B3E#
      or else Code = 16#0B40#
      or else (Code in 16#0B47# .. 16#0B48#)
      or else (Code in 16#0B4B# .. 16#0B4C#)
      or else Code = 16#0B57#
      or else Code = 16#0BBE#
      or else Code = 16#0BC1#
      or else (Code in 16#0BC6# .. 16#0BC8#)
      or else (Code in 16#0BCA# .. 16#0BCC#)
      or else Code = 16#0BD7#
      or else (Code in 16#0C01# .. 16#0C03#)
      or else (Code in 16#0C41# .. 16#0C44#)
      or else (Code in 16#0C82# .. 16#0C83#)
      or else Code = 16#0CBE#
      or else (Code in 16#0CC0# .. 16#0CC1#)
      or else (Code in 16#0CC3# .. 16#0CC4#)
      or else (Code in 16#0CC7# .. 16#0CC8#)
      or else (Code in 16#0CCA# .. 16#0CCB#)
      or else (Code in 16#0D02# .. 16#0D03#)
      or else (Code in 16#0D3E# .. 16#0D40#)
      or else (Code in 16#0D46# .. 16#0D48#)
      or else (Code in 16#0D4A# .. 16#0D4C#)
      or else Code = 16#0D57#
      or else Code = 16#0F7F#
      or else (Code in 16#102B# .. 16#102C#)
      or else Code = 16#1031#
      or else Code = 16#1038#
      or else (Code in 16#103B# .. 16#103C#)
      or else (Code in 16#1056# .. 16#1057#)
      or else (Code in 16#1062# .. 16#1064#)
      or else (Code in 16#1067# .. 16#106D#)
      or else (Code in 16#1083# .. 16#1084#)
      or else (Code in 16#1087# .. 16#108C#)
      or else Code = 16#108F#
      or else (Code in 16#109A# .. 16#109C#)
      or else Code = 16#17B6#
      or else (Code in 16#17BE# .. 16#17C5#)
      or else (Code in 16#17C7# .. 16#17C8#)
      or else (Code in 16#1923# .. 16#1926#)
      or else (Code in 16#1929# .. 16#192B#)
      or else (Code in 16#1A19# .. 16#1A1A#)
      or else Code = 16#1A55#
      or else Code = 16#1A57#
      or else Code = 16#1A61#
      or else Code = 16#1A63#
      or else (Code in 16#1A6D# .. 16#1A72#)
      or else Code = 16#1B04#
      or else Code = 16#1B35#
      or else Code = 16#1B3B#
      or else (Code in 16#1B3D# .. 16#1B41#)
      or else (Code in 16#1B43# .. 16#1B44#)
      or else (Code in 16#1B82# .. 16#1B82#)
      or else (Code in 16#1BA1# .. 16#1BA1#)
      or else (Code in 16#1BA6# .. 16#1BA7#)
      or else Code = 16#1BAA#
      or else (Code in 16#1BE7# .. 16#1BE7#)
      or else (Code in 16#1BEA# .. 16#1BEC#)
      or else Code = 16#1BEE#
      or else (Code in 16#1BF2# .. 16#1BF3#)
      or else (Code in 16#1C24# .. 16#1C2B#)
      or else (Code in 16#1C34# .. 16#1C35#)
      or else (Code in 16#1CE1# .. 16#1CE1#)
      or else (Code in 16#1CF7# .. 16#1CF7#)
      or else (Code in 16#302E# .. 16#302F#)
      or else (Code in 16#A823# .. 16#A824#)
      or else Code = 16#A827#
      or else Code = 16#A880#
      or else Code = 16#A881#
      or else Code = 16#A8B4#
      or else (Code in 16#A8B5# .. 16#A8C3#)
      or else (Code in 16#A952# .. 16#A953#)
      or else Code = 16#A983#
      or else (Code in 16#A9B4# .. 16#A9B5#)
      or else (Code in 16#A9BA# .. 16#A9BB#)
      or else (Code in 16#A9BD# .. 16#A9C0#)
      or else Code = 16#AA2F#
      or else Code = 16#AA30#
      or else (Code in 16#AA33# .. 16#AA34#)
      or else Code = 16#AA4D#
      or else Code = 16#AA7B#
      or else Code = 16#AA7D#
      or else (Code in 16#AAEB# .. 16#AAEB#)
      or else (Code in 16#AAEE# .. 16#AAEF#)
      or else Code = 16#AAF5#
      or else (Code in 16#ABE3# .. 16#ABE4#)
      or else (Code in 16#ABE6# .. 16#ABE7#)
      or else (Code in 16#ABE9# .. 16#ABEA#)
      or else Code = 16#ABEC#
      or else (Code in 16#11000# .. 16#11000#)
      or else Code = 16#11002#
      or else Code = 16#11082#
      or else (Code in 16#110B0# .. 16#110B2#)
      or else (Code in 16#110B7# .. 16#110B8#)
      or else (Code in 16#1112C# .. 16#1112C#)
      or else (Code in 16#11145# .. 16#11146#)
      or else (Code in 16#11182# .. 16#11182#)
      or else (Code in 16#111B3# .. 16#111B5#)
      or else (Code in 16#111BF# .. 16#111C0#)
      or else Code = 16#1122C#
      or else (Code in 16#1122D# .. 16#1122E#)
      or else (Code in 16#11232# .. 16#11233#)
      or else Code = 16#11235#
      or else (Code in 16#112E0# .. 16#112E2#)
      or else (Code in 16#11302# .. 16#11303#)
      or else (Code in 16#1133E# .. 16#1133F#)
      or else Code = 16#11341#
      or else (Code in 16#11347# .. 16#11348#)
      or else (Code in 16#1134B# .. 16#1134D#)
      or else Code = 16#11357#
      or else Code = 16#11362#
      or else Code = 16#11363#
      or else (Code in 16#11435# .. 16#11437#)
      or else (Code in 16#11440# .. 16#11441#)
      or else (Code in 16#11445# .. 16#11445#)
      or else (Code in 16#114B0# .. 16#114B2#)
      or else Code = 16#114B9#
      or else (Code in 16#114BB# .. 16#114BE#)
      or else (Code in 16#114C1# .. 16#114C1#)
      or else (Code in 16#115AF# .. 16#115B1#)
      or else (Code in 16#115B8# .. 16#115BB#)
      or else (Code in 16#115BE# .. 16#115BE#)
      or else (Code in 16#11630# .. 16#11632#)
      or else Code = 16#1163B#
      or else (Code in 16#1163E# .. 16#1163E#)
      or else Code = 16#116AC#
      or else (Code in 16#116AE# .. 16#116AF#)
      or else (Code in 16#116B6# .. 16#116B6#)
      or else (Code in 16#11720# .. 16#11721#)
      or else (Code in 16#1182C# .. 16#1182E#)
      or else (Code in 16#11838# .. 16#11838#)
      or else (Code in 16#11930# .. 16#11935#)
      or else (Code in 16#11937# .. 16#11938#)
      or else (Code in 16#1193D# .. 16#1193D#)
      or else Code = 16#11940#
      or else (Code in 16#11942# .. 16#11942#)
      or else (Code in 16#119D1# .. 16#119D3#)
      or else (Code in 16#119DC# .. 16#119DF#)
      or else Code = 16#119E4#
      or else (Code in 16#11A39# .. 16#11A39#)
      or else (Code in 16#11A57# .. 16#11A58#)
      or else Code = 16#11A97#
      or else Code = 16#11C2F#
      or else (Code in 16#11C3E# .. 16#11C3E#)
      or else Code = 16#11CA9#
      or else (Code in 16#11CB1# .. 16#11CB1#)
      or else (Code in 16#11CB4# .. 16#11CB4#)
      or else (Code in 16#11D8A# .. 16#11D8E#)
      or else (Code in 16#11D93# .. 16#11D94#)
      or else Code = 16#11D96#
      or else (Code in 16#11EF5# .. 16#11EF6#));

   function Is_Hangul_L (Code : Natural) return Boolean is
     ((Code in 16#1100# .. 16#115F#) or else (Code in 16#A960# .. 16#A97C#));

   function Is_Hangul_V (Code : Natural) return Boolean is
     ((Code in 16#1160# .. 16#11A7#) or else (Code in 16#D7B0# .. 16#D7C6#));

   function Is_Hangul_T (Code : Natural) return Boolean is
     ((Code in 16#11A8# .. 16#11FF#) or else (Code in 16#D7CB# .. 16#D7FB#));

   function Is_Hangul_LV (Code : Natural) return Boolean is
     (Code in 16#AC00# .. 16#D7A3# and then (Code - 16#AC00#) mod 28 = 0);

   function Is_Hangul_LVT (Code : Natural) return Boolean is
     (Code in 16#AC00# .. 16#D7A3# and then (Code - 16#AC00#) mod 28 /= 0);

   function Is_Grapheme_Extend (Code : Natural) return Boolean is
     (Is_Unicode_Combining_Mark (Code)
      or else Is_Variation_Selector (Code)
      or else Is_Emoji_Modifier (Code)
      or else Code = 16#034F#
      or else Is_Unicode_Default_Ignorable (Code)
      or else Code = 16#0483# or else Code = 16#0484#
      or else Code = 16#0485# or else Code = 16#0486#
      or else Code = 16#0487# or else Code = 16#0591#
      or else (Code in 16#0592# .. 16#05BD#)
      or else Code = 16#05BF#
      or else (Code in 16#05C1# .. 16#05C2#)
      or else (Code in 16#05C4# .. 16#05C5#)
      or else Code = 16#05C7#
      or else (Code in 16#0610# .. 16#061A#)
      or else (Code in 16#064B# .. 16#065F#)
      or else Code = 16#0670#
      or else (Code in 16#06D6# .. 16#06DC#)
      or else (Code in 16#06DF# .. 16#06E4#)
      or else (Code in 16#06E7# .. 16#06E8#)
      or else (Code in 16#06EA# .. 16#06ED#)
      or else (Code in 16#0711# .. 16#0711#)
      or else (Code in 16#0730# .. 16#074A#)
      or else (Code in 16#07A6# .. 16#07B0#)
      or else (Code in 16#07EB# .. 16#07F3#)
      or else (Code in 16#0816# .. 16#0819#)
      or else (Code in 16#081B# .. 16#0823#)
      or else (Code in 16#0825# .. 16#0827#)
      or else (Code in 16#0829# .. 16#082D#)
      or else (Code in 16#0859# .. 16#085B#)
      or else (Code in 16#08D3# .. 16#08FF#)
      or else (Code in 16#0900# .. 16#0903#)
      or else Code = 16#093A# or else Code = 16#093C#
      or else (Code in 16#0941# .. 16#0948#)
      or else Code = 16#094D#
      or else (Code in 16#0951# .. 16#0957#)
      or else (Code in 16#0962# .. 16#0963#)
      or else Code = 16#0981#
      or else Code = 16#09BC# or else Code = 16#09BE#
      or else (Code in 16#09C1# .. 16#09C4#)
      or else Code = 16#09CD# or else Code = 16#09D7#
      or else (Code in 16#09E2# .. 16#09E3#)
      or else Code = 16#0A01# or else Code = 16#0A02#
      or else Code = 16#0A3C#
      or else (Code in 16#0A41# .. 16#0A42#)
      or else (Code in 16#0A47# .. 16#0A48#)
      or else (Code in 16#0A4B# .. 16#0A4D#)
      or else Code = 16#0A51#
      or else (Code in 16#0A70# .. 16#0A71#)
      or else Code = 16#0A75#
      or else (Code in 16#0ABC# .. 16#0ABC#)
      or else (Code in 16#0AC1# .. 16#0AC5#)
      or else (Code in 16#0AC7# .. 16#0AC8#)
      or else Code = 16#0ACD#
      or else (Code in 16#0AE2# .. 16#0AE3#)
      or else Code = 16#0B01# or else Code = 16#0B3C#
      or else Code = 16#0B3E#
      or else Code = 16#0B3F#
      or else (Code in 16#0B41# .. 16#0B44#)
      or else Code = 16#0B4D# or else Code = 16#0B56#
      or else Code = 16#0B57#
      or else (Code in 16#0B62# .. 16#0B63#)
      or else Code = 16#0B82#
      or else Code = 16#0BBE# or else Code = 16#0BC0#
      or else Code = 16#0BCD# or else Code = 16#0BD7#
      or else (Code in 16#0C00# .. 16#0C04#)
      or else Code = 16#0C3E#
      or else (Code in 16#0C3F# .. 16#0C40#)
      or else (Code in 16#0C46# .. 16#0C48#)
      or else (Code in 16#0C4A# .. 16#0C4D#)
      or else (Code in 16#0C55# .. 16#0C56#)
      or else (Code in 16#0C62# .. 16#0C63#)
      or else (Code in 16#0C81# .. 16#0C83#)
      or else Code = 16#0CBC#
      or else Code = 16#0CBF#
      or else Code = 16#0CC2# or else Code = 16#0CC6#
      or else (Code in 16#0CCC# .. 16#0CCD#)
      or else (Code in 16#0CD5# .. 16#0CD6#)
      or else (Code in 16#0CE2# .. 16#0CE3#)
      or else (Code in 16#0D00# .. 16#0D03#)
      or else (Code in 16#0D3B# .. 16#0D3C#)
      or else Code = 16#0D3E#
      or else (Code in 16#0D41# .. 16#0D44#)
      or else Code = 16#0D4D# or else Code = 16#0D57#
      or else (Code in 16#0D62# .. 16#0D63#)
      or else Code = 16#200D# or else Code = 16#20E3#);

   function Next_Grapheme_Last
     (Text  : String;
      Start : Natural)
      return Natural
   is
      Index      : Natural := Start;
      Width      : Positive;
      Code       : Natural;
      Next_Code  : Natural;
      Last       : Natural;
      Previous   : Natural;
      RI_Count   : Natural := 0;
      Has_Extended_Pictographic : Boolean := False;
      ZWJ_After_Pictographic    : Boolean := False;
   begin
      if Text'Length = 0 or else Start > Text'Last then
         return Start - 1;
      end if;

      Code := UTF8_Code_Point (Text, Index, Width);
      Last := Index + Width - 1;
      Previous := Code;
      Has_Extended_Pictographic := Is_Extended_Pictographic (Code);
      if Is_Regional_Indicator (Code) then
         RI_Count := 1;
      end if;
      Index := Last + 1;

      if Code = 16#000D#
        and then Index <= Text'Last
        and then UTF8_Code_Point (Text, Index, Width) = 16#000A#
      then
         return Index + Width - 1;
      end if;

      while Index <= Text'Last loop
         Next_Code := UTF8_Code_Point (Text, Index, Width);

         if Is_Grapheme_Control (Previous)
           or else Is_Grapheme_Control (Next_Code)
           or else Next_Code = 16#000D#
           or else Next_Code = 16#000A#
         then
            exit;
         elsif ZWJ_After_Pictographic
           and then Is_Extended_Pictographic (Next_Code)
         then
            null;
         elsif Is_Grapheme_Extend (Next_Code) then
            null;
         elsif Is_Grapheme_Spacing_Mark (Next_Code) then
            null;
         elsif Is_Grapheme_Prepend (Previous) then
            null;
         elsif Is_Regional_Indicator (Previous)
           and then Is_Regional_Indicator (Next_Code)
           and then RI_Count mod 2 = 1
         then
            RI_Count := RI_Count + 1;
         elsif Is_Hangul_L (Previous)
           and then
             (Is_Hangul_L (Next_Code)
              or else Is_Hangul_V (Next_Code)
              or else Is_Hangul_LV (Next_Code)
              or else Is_Hangul_LVT (Next_Code))
         then
            null;
         elsif (Is_Hangul_LV (Previous) or else Is_Hangul_V (Previous))
           and then (Is_Hangul_V (Next_Code) or else Is_Hangul_T (Next_Code))
         then
            null;
         elsif (Is_Hangul_LVT (Previous) or else Is_Hangul_T (Previous))
           and then Is_Hangul_T (Next_Code)
         then
            null;
         else
            exit;
         end if;

         Last := Index + Width - 1;
         Previous := Next_Code;
         if Is_Extended_Pictographic (Next_Code) then
            Has_Extended_Pictographic := True;
         end if;
         ZWJ_After_Pictographic :=
           Next_Code = 16#200D# and then Has_Extended_Pictographic;
         if not Is_Regional_Indicator (Next_Code) then
            RI_Count := 0;
         end if;
         Index := Last + 1;
      end loop;

      return Last;
   end Next_Grapheme_Last;

   function Grapheme_Length
     (Text : String)
      return Natural
   is
      Index : Natural := Text'First;
      Count : Natural := 0;
   begin
      while Index <= Text'Last loop
         Count := Count + 1;
         Index := Next_Grapheme_Last (Text, Index) + 1;
      end loop;
      return Count;
   end Grapheme_Length;

   function Grapheme_Cluster_Display_Width
     (Text  : String;
      First : Natural;
      Last  : Natural)
      return Natural
   is
      Index       : Natural := First;
      Width       : Positive;
      Code        : Natural;
      Sum         : Natural := 0;
      Emoji_Like  : Boolean := False;
      Text_Style  : Boolean := False;
      Has_Keycap_Base : Boolean := False;
   begin
      while Index <= Last loop
         Code := UTF8_Code_Point (Text, Index, Width);
         if Is_Text_Variation_Selector (Code) then
            Text_Style := True;
         elsif Is_Emoji_Variation_Selector (Code) then
            Emoji_Like := True;
         elsif Is_Default_Emoji_Presentation (Code)
           or else Is_Regional_Indicator (Code)
         then
            Emoji_Like := True;
         elsif Is_Emoji_Keycap_Base (Code) then
            Has_Keycap_Base := True;
            Sum := Sum + Unicode_Display_Cell_Width (Code);
         elsif Code = 16#20E3# then
            Emoji_Like := Has_Keycap_Base;
         elsif not Is_Grapheme_Extend (Code)
           and then not Is_Grapheme_Spacing_Mark (Code)
         then
            Sum := Sum + Unicode_Display_Cell_Width (Code);
         end if;
         Index := Index + Width;
      end loop;

      if Emoji_Like and then not Text_Style then
         return 2;
      else
         return Sum;
      end if;
   end Grapheme_Cluster_Display_Width;

   function Grapheme_Display_Width
     (Text : String)
      return Natural
   is
      Index : Natural := Text'First;
      Last  : Natural;
      Count : Natural := 0;
   begin
      while Index <= Text'Last loop
         Last := Next_Grapheme_Last (Text, Index);
         Count := Count + Grapheme_Cluster_Display_Width (Text, Index, Last);
         Index := Last + 1;
      end loop;
      return Count;
   end Grapheme_Display_Width;

   function ANSI_Escape_Last
     (Text  : String;
      First : Natural)
      return Natural
   is
      Index : Natural;
   begin
      if First > Text'Last or else Text (First) /= ASCII.ESC then
         return 0;
      elsif First = Text'Last then
         return First;
      end if;

      case Text (First + 1) is
         when '[' =>
            Index := First + 2;
            while Index <= Text'Last loop
               if Character'Pos (Text (Index)) in 16#40# .. 16#7E# then
                  return Index;
               end if;
               Index := Index + 1;
            end loop;
            return Text'Last;
         when ']' | 'P' | '^' | '_' =>
            Index := First + 2;
            while Index <= Text'Last loop
               if Text (Index) = ASCII.BEL then
                  return Index;
               elsif Text (Index) = ASCII.ESC
                 and then Index < Text'Last
                 and then Text (Index + 1) = '\'
               then
                  return Index + 1;
               end if;
               Index := Index + 1;
            end loop;
            return Text'Last;
         when others =>
            return First + 1;
      end case;
   end ANSI_Escape_Last;

   function ANSI_Display_Width
     (Text : String)
      return Natural
   is
      Index : Natural := Text'First;
      Last  : Natural;
      Count : Natural := 0;
   begin
      while Index <= Text'Last loop
         Last := ANSI_Escape_Last (Text, Index);
         if Last /= 0 then
            Index := Last + 1;
         else
            Last := Next_Grapheme_Last (Text, Index);
            Count := Count + Grapheme_Cluster_Display_Width (Text, Index, Last);
            Index := Last + 1;
         end if;
      end loop;
      return Count;
   end ANSI_Display_Width;

   function Truncate_UTF8
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
   is
      Index : Natural := Text'First;
      Count : Natural := 0;
      Last_Keep : Natural := Text'First - 1;
      Ellipsis_Length : constant Natural := UTF8_Length (Ellipsis);
      Keep_Count : Natural;
      Width : Positive;
   begin
      if UTF8_Length (Text) <= Max_Chars then
         return Ok_Text (Text);
      elsif Max_Chars = 0 then
         return Ok_Text ("");
      elsif Max_Chars <= Ellipsis_Length then
         Index := Ellipsis'First;
         while Index <= Ellipsis'Last and then Count < Max_Chars loop
            Count := Count + 1;
            declare
               Code : constant Natural :=
                 UTF8_Code_Point (Ellipsis, Index, Width);
               pragma Unreferenced (Code);
            begin
               Last_Keep := Index + Width - 1;
            end;
            Index := Last_Keep + 1;
         end loop;
         return Ok_Text (Ellipsis (Ellipsis'First .. Last_Keep));
      end if;

      Keep_Count := Max_Chars - Ellipsis_Length;
      Count := 0;
      Index := Text'First;
      while Index <= Text'Last and then Count < Keep_Count loop
         Count := Count + 1;
         declare
            Code : constant Natural := UTF8_Code_Point (Text, Index, Width);
            pragma Unreferenced (Code);
         begin
            Last_Keep := Index + Width - 1;
         end;
         Index := Last_Keep + 1;
      end loop;
      return Ok_Text (Text (Text'First .. Last_Keep) & Ellipsis);
   end Truncate_UTF8;

   function Truncate_UTF8_Words
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
   is
      Ellipsis_Length : constant Natural := UTF8_Length (Ellipsis);
      Limit : Natural;
      Index : Natural := Text'First;
      Count : Natural := 0;
      Last_Keep : Natural := Text'First - 1;
      Last_Space : Natural := 0;
      Width : Positive;
   begin
      if UTF8_Length (Text) <= Max_Chars then
         return Ok_Text (Text);
      elsif Max_Chars = 0 then
         return Ok_Text ("");
      elsif Max_Chars <= Ellipsis_Length then
         return Truncate_UTF8 (Ellipsis, Max_Chars, "");
      end if;

      Limit := Max_Chars - Ellipsis_Length;
      while Index <= Text'Last and then Count < Limit loop
         declare
            Code : constant Natural := UTF8_Code_Point (Text, Index, Width);
            pragma Unreferenced (Code);
         begin
            null;
         end;
         if Text (Index) = ' ' or else Text (Index) = ASCII.HT then
            Last_Space := Index - 1;
         end if;
         Last_Keep := Index + Width - 1;
         Count := Count + 1;
         Index := Last_Keep + 1;
      end loop;

      if Last_Space >= Text'First then
         Last_Keep := Last_Space;
      end if;
      return Ok_Text (Text (Text'First .. Last_Keep) & Ellipsis);
   end Truncate_UTF8_Words;

   function Truncate_Graphemes
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
   is
      Index           : Natural := Text'First;
      Count           : Natural := 0;
      Last_Keep       : Natural := Text'First - 1;
      Ellipsis_Length : constant Natural := Grapheme_Length (Ellipsis);
      Keep_Count      : Natural;
   begin
      if Grapheme_Length (Text) <= Max_Chars then
         return Ok_Text (Text);
      elsif Max_Chars = 0 then
         return Ok_Text ("");
      elsif Max_Chars <= Ellipsis_Length then
         Index := Ellipsis'First;
         while Index <= Ellipsis'Last and then Count < Max_Chars loop
            Count := Count + 1;
            Last_Keep := Next_Grapheme_Last (Ellipsis, Index);
            Index := Last_Keep + 1;
         end loop;
         return Ok_Text (Ellipsis (Ellipsis'First .. Last_Keep));
      end if;

      Keep_Count := Max_Chars - Ellipsis_Length;
      Count := 0;
      Index := Text'First;
      while Index <= Text'Last and then Count < Keep_Count loop
         Count := Count + 1;
         Last_Keep := Next_Grapheme_Last (Text, Index);
         Index := Last_Keep + 1;
      end loop;
      return Ok_Text (Text (Text'First .. Last_Keep) & Ellipsis);
   end Truncate_Graphemes;

   function Truncate_Display_Width
     (Text      : String;
      Max_Width : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
   is
      Ellipsis_Width : constant Natural := Grapheme_Display_Width (Ellipsis);
      Limit          : Natural;
      Index          : Natural := Text'First;
      Cluster_Last   : Natural;
      Cluster_Width  : Natural;
      Used           : Natural := 0;
      Last_Keep      : Natural := Text'First - 1;
   begin
      if Grapheme_Display_Width (Text) <= Max_Width then
         return Ok_Text (Text);
      elsif Max_Width = 0 then
         return Ok_Text ("");
      elsif Max_Width <= Ellipsis_Width then
         return Truncate_Display_Width (Ellipsis, Max_Width, "");
      end if;

      Limit := Max_Width - Ellipsis_Width;
      while Index <= Text'Last loop
         Cluster_Last := Next_Grapheme_Last (Text, Index);
         Cluster_Width :=
           Grapheme_Cluster_Display_Width (Text, Index, Cluster_Last);
         exit when Used + Cluster_Width > Limit;
         Used := Used + Cluster_Width;
         Last_Keep := Cluster_Last;
         Index := Cluster_Last + 1;
      end loop;

      if Last_Keep < Text'First then
         return Ok_Text (Ellipsis);
      else
         return Ok_Text (Text (Text'First .. Last_Keep) & Ellipsis);
      end if;
   end Truncate_Display_Width;

   function Truncate_ANSI_Display_Width
     (Text      : String;
      Max_Width : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
   is
      Ellipsis_Width : constant Natural := ANSI_Display_Width (Ellipsis);
      Limit          : Natural;
      Index          : Natural := Text'First;
      Last           : Natural;
      Cluster_Width  : Natural;
      Used           : Natural := 0;
      Result         : Unbounded_String;
   begin
      if ANSI_Display_Width (Text) <= Max_Width then
         return Ok_Text (Text);
      elsif Max_Width = 0 then
         return Ok_Text ("");
      elsif Max_Width <= Ellipsis_Width then
         return Truncate_ANSI_Display_Width (Ellipsis, Max_Width, "");
      end if;

      Limit := Max_Width - Ellipsis_Width;
      while Index <= Text'Last loop
         Last := ANSI_Escape_Last (Text, Index);
         if Last /= 0 then
            Append (Result, Text (Index .. Last));
            Index := Last + 1;
         else
            Last := Next_Grapheme_Last (Text, Index);
            Cluster_Width :=
              Grapheme_Cluster_Display_Width (Text, Index, Last);
            exit when Used + Cluster_Width > Limit;
            Used := Used + Cluster_Width;
            Append (Result, Text (Index .. Last));
            Index := Last + 1;
         end if;
      end loop;

      Append (Result, Ellipsis);
      return Ok_Text (To_String (Result));
   end Truncate_ANSI_Display_Width;

   function Spaces (Count : Natural) return String is
      Result : String (1 .. Count);
   begin
      for Index in Result'Range loop
         Result (Index) := ' ';
      end loop;
      return Result;
   end Spaces;

   function Wrap_Internal
     (Text      : String;
      Max_Width : Positive;
      Indent    : Natural;
      ANSI      : Boolean)
      return Humanize.Status.Text_Result
   is
      Index         : Natural := Text'First;
      Last          : Natural;
      Cluster_Width : Natural;
      Line_Width    : Natural := 0;
      Result        : Unbounded_String;

      procedure Break_Line is
      begin
         Append (Result, ASCII.LF);
         if Indent > 0 then
            Append (Result, Spaces (Indent));
         end if;
         Line_Width := Indent;
      end Break_Line;
   begin
      while Index <= Text'Last loop
         if ANSI then
            Last := ANSI_Escape_Last (Text, Index);
            if Last /= 0 then
               Append (Result, Text (Index .. Last));
               Index := Last + 1;
               goto Continue;
            end if;
         end if;

         Last := Next_Grapheme_Last (Text, Index);
         if Text (Index) = ASCII.LF then
            Break_Line;
         else
            Cluster_Width :=
              Grapheme_Cluster_Display_Width (Text, Index, Last);
            if Line_Width > 0
              and then Line_Width + Cluster_Width > Max_Width
            then
               Break_Line;
               if Text (Index) = ' ' or else Text (Index) = ASCII.HT then
                  Index := Last + 1;
                  goto Continue;
               end if;
            end if;
            Append (Result, Text (Index .. Last));
            Line_Width := Line_Width + Cluster_Width;
         end if;
         Index := Last + 1;
         <<Continue>>
         null;
      end loop;

      return Ok_Text (To_String (Result));
   end Wrap_Internal;

   function Wrap_Display_Width
     (Text      : String;
      Max_Width : Positive;
      Indent    : Natural := 0)
      return Humanize.Status.Text_Result
   is
   begin
      return Wrap_Internal (Text, Max_Width, Indent, ANSI => False);
   end Wrap_Display_Width;

   function Wrap_ANSI_Display_Width
     (Text      : String;
      Max_Width : Positive;
      Indent    : Natural := 0)
      return Humanize.Status.Text_Result
   is
   begin
      return Wrap_Internal (Text, Max_Width, Indent, ANSI => True);
   end Wrap_ANSI_Display_Width;

   function Is_SGR_Reset (Escape : String) return Boolean is
   begin
      return Escape = ASCII.ESC & "[0m" or else Escape = ASCII.ESC & "[m";
   end Is_SGR_Reset;

   function Wrap_ANSI_Display_Width_Styled
     (Text      : String;
      Max_Width : Positive;
      Indent    : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Wrapped : constant String :=
        Result_Text (Wrap_ANSI_Display_Width (Text, Max_Width, Indent));
      Result  : Unbounded_String;
      Active  : Unbounded_String;
      Index   : Natural := Wrapped'First;
      Last    : Natural;
   begin
      while Index <= Wrapped'Last loop
         Last := ANSI_Escape_Last (Wrapped, Index);
         if Last /= 0 then
            declare
               Escape : constant String := Wrapped (Index .. Last);
            begin
               Append (Result, Escape);
               if Escape (Escape'Last) = 'm' then
                  if Is_SGR_Reset (Escape) then
                     Active := Null_Unbounded_String;
                  else
                     Active := To_Unbounded_String (Escape);
                  end if;
               end if;
            end;
            Index := Last + 1;
         elsif Wrapped (Index) = ASCII.LF then
            if Length (Active) > 0 then
               Append (Result, ASCII.ESC & "[0m");
            end if;
            Append (Result, ASCII.LF);
            if Length (Active) > 0 then
               Append (Result, To_String (Active));
            end if;
            Index := Index + 1;
         else
            Append (Result, Wrapped (Index));
            Index := Index + 1;
         end if;
      end loop;
      return Ok_Text (To_String (Result));
   end Wrap_ANSI_Display_Width_Styled;

   function Key_Value_Line
     (Key       : String;
      Value     : String;
      Separator : String := ": ")
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Key & Separator & Value);
   end Key_Value_Line;

   function Aligned_Key_Value_Line
     (Key       : String;
      Value     : String;
      Key_Width : Natural;
      Separator : String := " : ")
      return Humanize.Status.Text_Result
   is
      Key_Display_Width : constant Natural := ANSI_Display_Width (Key);
      Pad : constant Natural :=
        (if Key_Display_Width >= Key_Width then 0 else Key_Width - Key_Display_Width);
   begin
      return Ok_Text (Key & (1 .. Pad => ' ') & Separator & Value);
   end Aligned_Key_Value_Line;

   function Pad_To_Display_Width
     (Text  : String;
      Width : Natural)
      return String
   is
      Text_Width : constant Natural := ANSI_Display_Width (Text);
      Pad : constant Natural :=
        (if Text_Width >= Width then 0 else Width - Text_Width);
   begin
      return Text & (1 .. Pad => ' ');
   end Pad_To_Display_Width;

   function Table_Row_2
     (Left       : String;
      Right      : String;
      Left_Width : Natural;
      Separator  : String := "  ")
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Pad_To_Display_Width (Left, Left_Width) & Separator & Right);
   end Table_Row_2;

   function Table_Row_3
     (Left         : String;
      Middle       : String;
      Right        : String;
      Left_Width   : Natural;
      Middle_Width : Natural;
      Separator    : String := "  ")
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Pad_To_Display_Width (Left, Left_Width) & Separator
         & Pad_To_Display_Width (Middle, Middle_Width) & Separator
         & Right);
   end Table_Row_3;

   function Table_2
     (Left_Column  : Name_List;
      Right_Column : Name_List;
      Left_Width   : Natural;
      Separator    : String := "  ")
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
   begin
      if Left_Column'Length /= Right_Column'Length then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      for Offset in 0 .. Left_Column'Length - 1 loop
         if Offset > 0 then
            Append (Result, ASCII.LF);
         end if;
         Append
           (Result,
            Pad_To_Display_Width
              (To_String (Left_Column (Left_Column'First + Offset)),
               Left_Width)
            & Separator
            & To_String (Right_Column (Right_Column'First + Offset)));
      end loop;
      return Ok_Text (To_String (Result));
   end Table_2;

   function Table_3
     (Left_Column   : Name_List;
      Middle_Column : Name_List;
      Right_Column  : Name_List;
      Left_Width    : Natural;
      Middle_Width  : Natural;
      Separator     : String := "  ")
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
   begin
      if Left_Column'Length /= Middle_Column'Length
        or else Left_Column'Length /= Right_Column'Length
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      for Offset in 0 .. Left_Column'Length - 1 loop
         if Offset > 0 then
            Append (Result, ASCII.LF);
         end if;
         Append
           (Result,
            Pad_To_Display_Width
              (To_String (Left_Column (Left_Column'First + Offset)),
               Left_Width)
            & Separator
            & Pad_To_Display_Width
              (To_String (Middle_Column (Middle_Column'First + Offset)),
               Middle_Width)
            & Separator
            & To_String (Right_Column (Right_Column'First + Offset)));
      end loop;
      return Ok_Text (To_String (Result));
   end Table_3;

   function UTF8_Slice
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural)
      return Humanize.Status.Text_Result
   is
      Index      : Natural := Text'First;
      Char_Index : Natural := 1;
      First_Byte : Natural := 0;
      Last_Byte  : Natural := 0;
      Width      : Positive;
   begin
      if Last_Char < First_Char or else Text'Length = 0 then
         return Ok_Text ("");
      end if;

      while Index <= Text'Last loop
         declare
            Code : constant Natural := UTF8_Code_Point (Text, Index, Width);
            pragma Unreferenced (Code);
         begin
            null;
         end;
         if Char_Index = First_Char then
            First_Byte := Index;
         end if;
         if Char_Index = Last_Char then
            Last_Byte := Index + Width - 1;
            exit;
         end if;
         Char_Index := Char_Index + 1;
         Index := Index + Width;
      end loop;

      if First_Byte = 0 then
         return Ok_Text ("");
      elsif Last_Byte = 0 then
         Last_Byte := Text'Last;
      end if;

      return Ok_Text (Text (First_Byte .. Last_Byte));
   end UTF8_Slice;

   function Grapheme_Slice
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural)
      return Humanize.Status.Text_Result
   is
      Index      : Natural := Text'First;
      Char_Index : Natural := 1;
      First_Byte : Natural := 0;
      Last_Byte  : Natural := 0;
      Cluster_Last : Natural;
   begin
      if Last_Char < First_Char or else Text'Length = 0 then
         return Ok_Text ("");
      end if;

      while Index <= Text'Last loop
         Cluster_Last := Next_Grapheme_Last (Text, Index);
         if Char_Index = First_Char then
            First_Byte := Index;
         end if;
         if Char_Index = Last_Char then
            Last_Byte := Cluster_Last;
            exit;
         end if;
         Char_Index := Char_Index + 1;
         Index := Cluster_Last + 1;
      end loop;

      if First_Byte = 0 then
         return Ok_Text ("");
      elsif Last_Byte = 0 then
         Last_Byte := Text'Last;
      end if;

      return Ok_Text (Text (First_Byte .. Last_Byte));
   end Grapheme_Slice;

   function Truncate_Grapheme_Words
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
   is
      Ellipsis_Length : constant Natural := Grapheme_Length (Ellipsis);
      Limit           : Natural;
      Index           : Natural := Text'First;
      Count           : Natural := 0;
      Last_Keep       : Natural := Text'First - 1;
      Last_Space      : Natural := 0;
      Cluster_Last    : Natural;
   begin
      if Grapheme_Length (Text) <= Max_Chars then
         return Ok_Text (Text);
      elsif Max_Chars = 0 then
         return Ok_Text ("");
      elsif Max_Chars <= Ellipsis_Length then
         return Truncate_Graphemes (Ellipsis, Max_Chars, "");
      end if;

      Limit := Max_Chars - Ellipsis_Length;
      while Index <= Text'Last and then Count < Limit loop
         Cluster_Last := Next_Grapheme_Last (Text, Index);
         if Text (Index) = ' ' or else Text (Index) = ASCII.HT then
            Last_Space := Index - 1;
         end if;
         Last_Keep := Cluster_Last;
         Count := Count + 1;
         Index := Cluster_Last + 1;
      end loop;

      if Last_Space >= Text'First then
         Last_Keep := Last_Space;
      end if;
      return Ok_Text (Text (Text'First .. Last_Keep) & Ellipsis);
   end Truncate_Grapheme_Words;

   procedure Truncate_UTF8_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
   is
   begin
      Copy_Into
        (Truncate_UTF8 (Text, Max_Chars, Ellipsis), Target, Written, Status);
   end Truncate_UTF8_Into;

   procedure UTF8_Slice_Into
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into
        (UTF8_Slice (Text, First_Char, Last_Char), Target, Written, Status);
   end UTF8_Slice_Into;

   procedure Truncate_UTF8_Words_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
   is
   begin
      Copy_Into
        (Truncate_UTF8_Words (Text, Max_Chars, Ellipsis),
         Target, Written, Status);
   end Truncate_UTF8_Words_Into;

   procedure Truncate_Graphemes_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
   is
   begin
      Copy_Into
        (Truncate_Graphemes (Text, Max_Chars, Ellipsis),
         Target, Written, Status);
   end Truncate_Graphemes_Into;

   procedure Truncate_Display_Width_Into
     (Text      : String;
      Max_Width : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
   is
   begin
      Copy_Into
        (Truncate_Display_Width (Text, Max_Width, Ellipsis),
         Target, Written, Status);
   end Truncate_Display_Width_Into;

   procedure Truncate_ANSI_Display_Width_Into
     (Text      : String;
      Max_Width : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
   is
   begin
      Copy_Into
        (Truncate_ANSI_Display_Width (Text, Max_Width, Ellipsis),
         Target, Written, Status);
   end Truncate_ANSI_Display_Width_Into;

   procedure Wrap_Display_Width_Into
     (Text      : String;
      Max_Width : Positive;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Indent    : Natural := 0)
   is
   begin
      Copy_Into
        (Wrap_Display_Width (Text, Max_Width, Indent),
         Target, Written, Status);
   end Wrap_Display_Width_Into;

   procedure Wrap_ANSI_Display_Width_Into
     (Text      : String;
      Max_Width : Positive;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Indent    : Natural := 0)
   is
   begin
      Copy_Into
        (Wrap_ANSI_Display_Width (Text, Max_Width, Indent),
         Target, Written, Status);
   end Wrap_ANSI_Display_Width_Into;

   procedure Key_Value_Line_Into
     (Key       : String;
      Value     : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : String := ": ")
   is
   begin
      Copy_Into
        (Key_Value_Line (Key, Value, Separator), Target, Written, Status);
   end Key_Value_Line_Into;

   procedure Aligned_Key_Value_Line_Into
     (Key       : String;
      Value     : String;
      Key_Width : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : String := " : ")
   is
   begin
      Copy_Into
        (Aligned_Key_Value_Line (Key, Value, Key_Width, Separator),
         Target, Written, Status);
   end Aligned_Key_Value_Line_Into;

   procedure Table_Row_2_Into
     (Left       : String;
      Right      : String;
      Left_Width : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Separator  : String := "  ")
   is
   begin
      Copy_Into
        (Table_Row_2 (Left, Right, Left_Width, Separator),
         Target, Written, Status);
   end Table_Row_2_Into;

   procedure Table_Row_3_Into
     (Left         : String;
      Middle       : String;
      Right        : String;
      Left_Width   : Natural;
      Middle_Width : Natural;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Separator    : String := "  ")
   is
   begin
      Copy_Into
        (Table_Row_3
           (Left, Middle, Right, Left_Width, Middle_Width, Separator),
         Target, Written, Status);
   end Table_Row_3_Into;

   procedure Table_2_Into
     (Left_Column  : Name_List;
      Right_Column : Name_List;
      Left_Width   : Natural;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Separator    : String := "  ")
   is
   begin
      Copy_Into
        (Table_2 (Left_Column, Right_Column, Left_Width, Separator),
         Target, Written, Status);
   end Table_2_Into;

   procedure Table_3_Into
     (Left_Column   : Name_List;
      Middle_Column : Name_List;
      Right_Column  : Name_List;
      Left_Width    : Natural;
      Middle_Width  : Natural;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Separator     : String := "  ")
   is
   begin
      Copy_Into
        (Table_3
           (Left_Column, Middle_Column, Right_Column,
            Left_Width, Middle_Width, Separator),
         Target, Written, Status);
   end Table_3_Into;

   procedure Grapheme_Slice_Into
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into
        (Grapheme_Slice (Text, First_Char, Last_Char),
         Target, Written, Status);
   end Grapheme_Slice_Into;

   procedure Truncate_Grapheme_Words_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
   is
   begin
      Copy_Into
        (Truncate_Grapheme_Words (Text, Max_Chars, Ellipsis),
         Target, Written, Status);
   end Truncate_Grapheme_Words_Into;
end Humanize.Strings.Display;
