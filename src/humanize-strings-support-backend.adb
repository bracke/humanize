with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Strings.Display;
with Humanize.Strings.Inflections;
with Humanize.Strings.Identifiers;
with Humanize.Strings.Markup;
with Humanize.Strings.Metrics;
with Humanize.Strings.Names;
with Humanize.Strings.Paths;

package body Humanize.Strings.Support.Backend is
   use type Humanize.Status.Status_Code;

   function Is_Upper (C : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Uppercase;

   function Is_Lower (C : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Lowercase;

   function Lower (C : Character) return Character is
   begin
      if Is_Upper (C) then
         return Character'Val (Character'Pos (C) + 32);
      else
         return C;
      end if;
   end Lower;

   function Upper (C : Character) return Character is
   begin
      if Is_Lower (C) then
         return Character'Val (Character'Pos (C) - 32);
      else
         return C;
      end if;
   end Upper;

   function Is_Alpha (C : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Letter;

   function Is_Digit (C : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;

   function Digit_Value (C : Character) return Natural
      renames Humanize.Bounded_Text.Digit_Value;

   function Is_Alnum (C : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Alphanumeric;

   function Natural_Text (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text (Result : Humanize.Status.Text_Result) return String
      renames Humanize.Bounded_Text.Result_Text;

   function Ends_With (Text, Suffix : String) return Boolean
      renames Humanize.Bounded_Text.Ends_With;

   function Truncate
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
   is
   begin
      if Text'Length <= Max_Chars then
         return Ok_Text (Text);
      elsif Max_Chars = 0 then
         return Ok_Text ("");
      elsif Max_Chars <= Ellipsis'Length then
         return Ok_Text (Ellipsis (Ellipsis'First .. Ellipsis'First + Max_Chars - 1));
      else
         declare
            Keep : constant Natural := Max_Chars - Ellipsis'Length;
         begin
            return Ok_Text (Text (Text'First .. Text'First + Keep - 1) & Ellipsis);
         end;
      end if;
   end Truncate;

   function Truncate_Words
     (Text      : String;
      Max_Words : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
      is separate;

   function Capitalize
     (Text      : String;
      Downcase  : Boolean := False)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
   begin
      if Text'Length = 0 then
         return Ok_Text ("");
      end if;

      Append (Result, Upper (Text (Text'First)));
      for Index in Text'First + 1 .. Text'Last loop
         Append (Result, (if Downcase then Lower (Text (Index)) else Text (Index)));
      end loop;
      return Ok_Text (To_String (Result));
   end Capitalize;

   function Title_Case
     (Text : String)
      return Humanize.Status.Text_Result
      is separate;

   function Is_Acronym (Word : String) return Boolean is
   begin
      return Word = "api" or else Word = "url" or else Word = "http"
        or else Word = "https" or else Word = "id" or else Word = "ui"
        or else Word = "cpu" or else Word = "iops" or else Word = "utf8";
   end Is_Acronym;

   function Is_Small_Title_Word (Word : String) return Boolean is
   begin
      return Word = "a" or else Word = "an" or else Word = "and"
        or else Word = "as" or else Word = "at" or else Word = "but"
        or else Word = "by" or else Word = "for" or else Word = "in"
        or else Word = "of" or else Word = "on" or else Word = "or"
        or else Word = "the" or else Word = "to" or else Word = "with";
   end Is_Small_Title_Word;

   function Contains_List_Word
     (List : String;
      Word : String)
      return Boolean
      is separate;

   function Title_Case_Smart
     (Text : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Title_Case_With_Options (Text, Default_Title_Case_Options);
   end Title_Case_Smart;

   function Title_Case_With_Options
     (Text    : String;
      Options : Title_Case_Options := Default_Title_Case_Options)
      return Humanize.Status.Text_Result
      is separate;

   function Title_Case_With_Word_Lists
     (Text        : String;
      Acronyms    : String := "";
      Small_Words : String := "")
      return Humanize.Status.Text_Result
      is separate;

   function Editorial_Title
     (Text  : String;
      Style : Editorial_Title_Style := AP_Title)
      return Humanize.Status.Text_Result
      is separate;

   function NL_To_BR
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Markup.NL_To_BR;

   function BR_To_NL
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Markup.BR_To_NL;

   function Parameterize
     (Text      : String;
      Separator : Character := '-')
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Identifiers.Parameterize;

   function Dasherize
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Identifiers.Dasherize;

   function Underscore
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Identifiers.Underscore;

   function Camelize
     (Text        : String;
      Upper_First : Boolean := True)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Identifiers.Camelize;

   function Humanize_String
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Identifiers.Humanize_String;

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

   function Deconstantize
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Identifiers.Deconstantize;

   function Demodulize
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Identifiers.Demodulize;

   function Tableize
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Identifiers.Tableize;

   function Classify
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Identifiers.Classify;

   function Foreign_Key
     (Text             : String;
      Separate_Class_Id : Boolean := True)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Identifiers.Foreign_Key;

   function Acronym
     (Text    : String;
      Options : Identifier_Options := Default_Identifier_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Identifiers.Acronym;

   function Escape_HTML
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Markup.Escape_HTML;

   function Preserve_Separator
     (Text      : String;
      Separator : Character)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Markup.Preserve_Separator;

   function Normalize_Whitespace
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Markup.Normalize_Whitespace;

   function Squish
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Markup.Squish;

   function Strip_Tags
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Markup.Strip_Tags;

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
      is separate;

   function Same_Character
     (Left    : Character;
      Right   : Character;
      Options : Match_Options)
      return Boolean
   is
   begin
      case Options.Case_Mode is
         when Case_Sensitive =>
            return Left = Right;
         when Case_Insensitive =>
            return Lower (Left) = Lower (Right);
      end case;
   end Same_Character;

   function Has_Word_Boundary
     (Text          : String;
      Match_First   : Natural;
      Match_Last    : Natural;
      Boundary_Mode : Match_Boundary_Mode)
      return Boolean
   is
   begin
      if Boundary_Mode = Match_Anywhere then
         return True;
      end if;

      return
        (Match_First = Text'First or else not Is_Alnum (Text (Match_First - 1)))
        and then
        (Match_Last = Text'Last or else not Is_Alnum (Text (Match_Last + 1)));
   end Has_Word_Boundary;

   function Matches_At
     (Text    : String;
      Pattern : String;
      Pos     : Natural;
      Options : Match_Options)
      return Boolean
   is
      Match_Last : constant Natural := Pos + Pattern'Length - 1;
   begin
      if Pattern'Length = 0
        or else Pos < Text'First
        or else Match_Last > Text'Last
      then
         return False;
      end if;

      for Offset in 0 .. Pattern'Length - 1 loop
         if not Same_Character
           (Text (Pos + Offset), Pattern (Pattern'First + Offset), Options)
         then
            return False;
         end if;
      end loop;

      return Has_Word_Boundary
        (Text, Pos, Match_Last, Options.Boundary_Mode);
   end Matches_At;

   function Find_Match
     (Text    : String;
      Pattern : String;
      Start   : Natural;
      Options : Match_Options)
      return Natural
   is
      First : constant Natural := Natural'Max (Start, Text'First);
   begin
      if Pattern'Length = 0 or else Text'Length < Pattern'Length then
         return 0;
      end if;

      if First > Text'Last - Pattern'Length + 1 then
         return 0;
      end if;

      for Index in First .. Text'Last - Pattern'Length + 1 loop
         if Matches_At (Text, Pattern, Index, Options) then
            return Index;
         end if;
      end loop;
      return 0;
   end Find_Match;

   function Excerpt
     (Text      : String;
      Phrase    : String;
      Radius    : Natural := 32;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
   is
   begin
      return Excerpt_With_Options
        (Text, Phrase, Radius, Ellipsis, Default_Match_Options);
   end Excerpt;

   function Excerpt_With_Options
     (Text      : String;
      Phrase    : String;
      Radius    : Natural := 32;
      Ellipsis  : String := "...";
      Options   : Match_Options := Default_Match_Options)
      return Humanize.Status.Text_Result
   is
      Pos : constant Natural :=
        Find_Match (Text, Phrase, Text'First, Options);
   begin
      if Pos = 0 then
         return Truncate (Text, Radius * 2 + Phrase'Length, Ellipsis);
      end if;

      declare
         Start : constant Natural :=
           (if Pos > Radius then Pos - Radius else Text'First);
         Stop  : constant Natural :=
           Natural'Min (Text'Last, Pos + Phrase'Length + Radius - 1);
         Prefix : constant String :=
           (if Start > Text'First then Ellipsis else "");
         Suffix : constant String :=
           (if Stop < Text'Last then Ellipsis else "");
      begin
         return Ok_Text (Prefix & Text (Start .. Stop) & Suffix);
      end;
   end Excerpt_With_Options;

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

   function Text_Metrics
     (Text : String)
      return Text_Metrics_Result
      renames Humanize.Strings.Metrics.Text_Metrics;

   function Word_Count (Text : String) return Natural
      renames Humanize.Strings.Metrics.Word_Count;

   function Sentence_Count (Text : String) return Natural
      renames Humanize.Strings.Metrics.Sentence_Count;

   function Paragraph_Count (Text : String) return Natural
      renames Humanize.Strings.Metrics.Paragraph_Count;

   function Word_Count_Summary
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Metrics.Word_Count_Summary;

   function Sentence_Count_Summary
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Metrics.Sentence_Count_Summary;

   function Paragraph_Count_Summary
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Metrics.Paragraph_Count_Summary;

   function Reading_Time
     (Text    : String;
      Options : Text_Time_Options := Default_Text_Time_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Metrics.Reading_Time;

   function Speaking_Time
     (Text    : String;
      Options : Text_Time_Options := Default_Text_Time_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Metrics.Speaking_Time;

   function Text_Summary_With_Options
     (Text    : String;
      Options : Text_Summary_Composition_Options :=
        Default_Text_Summary_Composition_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Metrics.Text_Summary_With_Options;

   function Text_Summary
     (Text    : String;
      Options : Text_Summary_Options := Default_Text_Summary_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Metrics.Text_Summary;

   function Count_Label
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
   is
   begin
      if Count = 0 then
         return "no " & Plural;
      elsif Count = 1 then
         return "1 " & Singular;
      else
         return Natural_Text (Count) & " " & Plural;
      end if;
   end Count_Label;

   function Previous_Word_Start
     (Text  : String;
      Index : Natural)
      return Natural
      is separate;

   function Next_Word_End
     (Text  : String;
      Index : Natural)
      return Natural
   is
      Pos     : Natural := Index;
      Width   : Positive;
      Code    : Natural;
      Last    : Natural := Text'Last;
      In_Word : Boolean := False;
   begin
      while Pos <= Text'Last loop
         Code := UTF8_Code_Point (Text, Pos, Width);
         if Is_Unicode_Word_Continuation (Code) then
            Last := Pos + Width - 1;
            In_Word := True;
         elsif In_Word then
            return Last;
         end if;
         Pos := Pos + Width;
      end loop;
      return Last;
   end Next_Word_End;

   function Excerpt_With_Context
     (Text          : String;
      Phrase        : String;
      Context_Words : Natural := 5;
      Ellipsis      : String := "...")
      return Humanize.Status.Text_Result
   is
   begin
      return Excerpt_With_Context_Options
        (Text, Phrase, Context_Words, Ellipsis, Default_Match_Options);
   end Excerpt_With_Context;

   function Excerpt_With_Context_Options
     (Text          : String;
      Phrase        : String;
      Context_Words : Natural := 5;
      Ellipsis      : String := "...";
      Options       : Match_Options := Default_Match_Options)
      return Humanize.Status.Text_Result
      is separate;

   procedure Append_HTML_Escaped
     (Result : in out Unbounded_String;
      Text   : String)
   is
   begin
      for Ch of Text loop
         case Ch is
            when '&' => Append (Result, "&amp;");
            when '<' => Append (Result, "&lt;");
            when '>' => Append (Result, "&gt;");
            when '"' => Append (Result, "&quot;");
            when ''' => Append (Result, "&#39;");
            when others => Append (Result, Ch);
         end case;
      end loop;
   end Append_HTML_Escaped;

   procedure Append_Output_Text
     (Result      : in out Unbounded_String;
      Text        : String;
      Escape_HTML : Boolean)
   is
   begin
      if Escape_HTML then
         Append_HTML_Escaped (Result, Text);
      else
         Append (Result, Text);
      end if;
   end Append_Output_Text;

   function Highlight_Core
     (Text        : String;
      Phrase      : String;
      Before      : String;
      After       : String;
      Options     : Highlight_Options;
      Escape_HTML : Boolean)
      return Humanize.Status.Text_Result
      is separate;

   function Highlight
     (Text   : String;
      Phrase : String;
      Before : String := "<mark>";
      After  : String := "</mark>")
      return Humanize.Status.Text_Result
   is
   begin
      return Highlight_With_Options
        (Text, Phrase, Before, After, Default_Highlight_Options);
   end Highlight;

   function Highlight_With_Options
     (Text    : String;
      Phrase  : String;
      Before  : String := "<mark>";
      After   : String := "</mark>";
      Options : Highlight_Options := Default_Highlight_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Highlight_Core
        (Text, Phrase, Before, After, Options, Escape_HTML => False);
   end Highlight_With_Options;

   function Highlighted_Excerpt
     (Text               : String;
      Phrase             : String;
      Radius             : Natural := 32;
      Ellipsis           : String := "...";
      Before             : String := "<mark>";
      After              : String := "</mark>";
      Options            : Highlight_Options := Default_Highlight_Options;
      Escape_HTML_Output : Boolean := True)
      return Humanize.Status.Text_Result
      is separate;

   function Mask
     (Text         : String;
      Visible_Last : Natural := 4;
      Mask_Char    : Character := '*')
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      Hidden : constant Natural :=
        (if Text'Length > Visible_Last then Text'Length - Visible_Last else 0);
   begin
      for Count in 1 .. Hidden loop
         pragma Unreferenced (Count);
         Append (Result, Mask_Char);
      end loop;
      if Hidden < Text'Length then
         Append (Result, Text (Text'First + Hidden .. Text'Last));
      end if;
      return Ok_Text (To_String (Result));
   end Mask;

   function Apply_Token_Case
     (Ch        : Character;
      Case_Mode : Token_Case_Mode)
      return Character
   is
   begin
      case Case_Mode is
         when Preserve_Token_Case =>
            return Ch;
         when Uppercase_Token =>
            return Upper (Ch);
         when Lowercase_Token =>
            return Lower (Ch);
      end case;
   end Apply_Token_Case;

   function Normalize_Token
     (Text      : String;
      Case_Mode : Token_Case_Mode := Preserve_Token_Case)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
   begin
      for Ch of Text loop
         if Is_Alnum (Ch) then
            Append (Result, Apply_Token_Case (Ch, Case_Mode));
         end if;
      end loop;
      return Ok_Text (To_String (Result));
   end Normalize_Token;

   function Group_Normalized_Token
     (Text    : String;
      Options : Token_Group_Options)
      return String
      is separate;

   function Group_Token
     (Text    : String;
      Options : Token_Group_Options := Default_Token_Group_Options)
      return Humanize.Status.Text_Result
   is
      Normal : constant Humanize.Status.Text_Result :=
        Normalize_Token (Text, Options.Case_Mode);
   begin
      return Ok_Text (Group_Normalized_Token (Result_Text (Normal), Options));
   end Group_Token;

   function Masked_Token
     (Text         : String;
      Visible_Last : Natural := 4;
      Options      : Token_Group_Options := Default_Token_Group_Options;
      Mask_Char    : Character := '*')
      return Humanize.Status.Text_Result
   is
      Normal : constant Humanize.Status.Text_Result :=
        Normalize_Token (Text, Options.Case_Mode);
      Raw    : constant String := Result_Text (Normal);
      Hidden : constant Natural :=
        (if Raw'Length > Visible_Last then Raw'Length - Visible_Last else 0);
      Masked : Unbounded_String;
   begin
      for Index in Raw'Range loop
         if Natural (Index - Raw'First) < Hidden then
            Append (Masked, Mask_Char);
         else
            Append (Masked, Raw (Index));
         end if;
      end loop;
      return Ok_Text (Group_Normalized_Token (To_String (Masked), Options));
   end Masked_Token;

   function Safe_Filename
     (Text      : String;
      Separator : Character := '-')
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Paths.Safe_Filename;

   function Safe_Filename
     (Text    : String;
      Options : Safe_Filename_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Paths.Safe_Filename;

   function Path_Basename
     (Path : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Paths.Path_Basename;

   function Path_Title
     (Path : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Paths.Path_Title;

   function Path_Title
     (Path    : String;
      Options : Path_Title_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Paths.Path_Title;

   function Extension_Label
     (Path : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Paths.Extension_Label;

   function Extension_Label
     (Path    : String;
      Options : Extension_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Paths.Extension_Label;

   function Shorten_Path
     (Path    : String;
      Options : Path_Shorten_Options := Default_Path_Shorten_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Paths.Shorten_Path;

   function Symbolic_File_Mode
     (Mode : File_Mode_Value;
      Kind : File_Mode_Kind := Mode_Only)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Paths.Symbolic_File_Mode;

   function Octal_File_Mode
     (Mode            : File_Mode_Value;
      Include_Special : Boolean := False;
      Prefix          : Boolean := False)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Paths.Octal_File_Mode;

   function File_Mode_Summary
     (Mode : File_Mode_Value;
      Kind : File_Mode_Kind := Mode_Only)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Paths.File_Mode_Summary;

   function Parse_File_Mode
     (Text : String;
      Mode : out File_Mode_Value;
      Kind : out File_Mode_Kind)
      return Humanize.Status.Status_Code
      renames Humanize.Strings.Paths.Parse_File_Mode;

   function Search_Key
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Identifiers.Search_Key;

   function Natural_Sort_Key
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Identifiers.Natural_Sort_Key;

   function Natural_Less
     (Left  : String;
      Right : String)
      return Boolean
      renames Humanize.Strings.Identifiers.Natural_Less;

   function Initials
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Names.Initials;

   function Possessive
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Names.Possessive;

   function Clean_Name
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Names.Clean_Name;

   function Person_Initials
     (Text         : String;
      Max_Initials : Initial_Count_Limit := 3)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Names.Person_Initials;

   function Name_Part
     (Text    : String;
      Style   : Name_Display_Style;
      Options : Person_Name_Options := Default_Person_Name_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Names.Name_Part;

   function Handle_Label
     (Handle      : String;
      Preserve_At : Boolean := True)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Names.Handle_Label;

   function Email_Local_Part
     (Email : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Names.Email_Local_Part;

   function Display_Name
     (Name     : String;
      Handle   : String := "";
      Email    : String := "";
      Fallback : String := "Anonymous";
      Options  : Person_Name_Options := Default_Person_Name_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Names.Display_Name;

   function Possessive_Name
     (Name     : String;
      Fallback : String := "someone")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Names.Possessive_Name;

   function Person_List
     (Names    : Name_List;
      Limit    : Positive := 2;
      Fallback : String := "no one")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Names.Person_List;

   function Transliterate_ASCII
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Identifiers.Transliterate_ASCII;

   function Pluralize
     (Word : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Inflections.Pluralize;

   function Singularize
     (Word : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Inflections.Singularize;

   function Pluralize_With_Dictionary
     (Word      : String;
      Singulars : String;
      Plurals   : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Inflections.Pluralize_With_Dictionary;

   function Singularize_With_Dictionary
     (Word      : String;
      Singulars : String;
      Plurals   : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Inflections.Singularize_With_Dictionary;

   function Pluralize_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Inflections.Pluralize_With_Options;

   function Singularize_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Inflections.Singularize_With_Options;

   function Pluralize_In_Language
     (Word     : String;
      Language : Inflection_Language)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Inflections.Pluralize_In_Language;

   function Singularize_In_Language
     (Word     : String;
      Language : Inflection_Language)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Inflections.Singularize_In_Language;

   function Inflection_Language_Label
     (Language : Inflection_Language)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Inflections.Inflection_Language_Label;

   function Pluralize_Source
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "")
      return Inflection_Source
      renames Humanize.Strings.Inflections.Pluralize_Source;

   function Singularize_Source
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "")
      return Inflection_Source
      renames Humanize.Strings.Inflections.Singularize_Source;

   function Pluralize_Source_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Inflection_Source
      renames Humanize.Strings.Inflections.Pluralize_Source_With_Options;

   function Singularize_Source_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Inflection_Source
      renames Humanize.Strings.Inflections.Singularize_Source_With_Options;

   function Inflection_Source_Label
     (Source : Inflection_Source)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Inflections.Inflection_Source_Label;

   function Casefold_ASCII
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Identifiers.Casefold_ASCII;

   function UTF8_Length
     (Text : String)
      return Natural
      renames Humanize.Strings.Display.UTF8_Length;

   function UTF8_Display_Width
     (Text : String)
      return Natural
      renames Humanize.Strings.Display.UTF8_Display_Width;

   function Grapheme_Length
     (Text : String)
      return Natural
      renames Humanize.Strings.Display.Grapheme_Length;

   function Grapheme_Display_Width
     (Text : String)
      return Natural
      renames Humanize.Strings.Display.Grapheme_Display_Width;

   function ANSI_Display_Width
     (Text : String)
      return Natural
      renames Humanize.Strings.Display.ANSI_Display_Width;

   function Truncate_UTF8
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Display.Truncate_UTF8;

   function UTF8_Slice
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Display.UTF8_Slice;

   function Truncate_UTF8_Words
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Display.Truncate_UTF8_Words;

   function Truncate_Graphemes
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Display.Truncate_Graphemes;

   function Truncate_Display_Width
     (Text      : String;
      Max_Width : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Display.Truncate_Display_Width;

   function Truncate_ANSI_Display_Width
     (Text      : String;
      Max_Width : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Display.Truncate_ANSI_Display_Width;

   function Wrap_Display_Width
     (Text      : String;
      Max_Width : Positive;
      Indent    : Natural := 0)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Display.Wrap_Display_Width;

   function Wrap_ANSI_Display_Width
     (Text      : String;
      Max_Width : Positive;
      Indent    : Natural := 0)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Display.Wrap_ANSI_Display_Width;

   function Wrap_ANSI_Display_Width_Styled
     (Text      : String;
      Max_Width : Positive;
      Indent    : Natural := 0)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Display.Wrap_ANSI_Display_Width_Styled;

   function Key_Value_Line
     (Key       : String;
      Value     : String;
      Separator : String := ": ")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Display.Key_Value_Line;

   function Aligned_Key_Value_Line
     (Key       : String;
      Value     : String;
      Key_Width : Natural;
      Separator : String := " : ")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Display.Aligned_Key_Value_Line;

   function Table_Row_2
     (Left       : String;
      Right      : String;
      Left_Width : Natural;
      Separator  : String := "  ")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Display.Table_Row_2;

   function Table_Row_3
     (Left         : String;
      Middle       : String;
      Right        : String;
      Left_Width   : Natural;
      Middle_Width : Natural;
      Separator    : String := "  ")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Display.Table_Row_3;

   function Table_2
     (Left_Column  : Name_List;
      Right_Column : Name_List;
      Left_Width   : Natural;
      Separator    : String := "  ")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Display.Table_2;

   function Table_3
     (Left_Column   : Name_List;
      Middle_Column : Name_List;
      Right_Column  : Name_List;
      Left_Width    : Natural;
      Middle_Width  : Natural;
      Separator     : String := "  ")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Display.Table_3;

   function Grapheme_Slice
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Display.Grapheme_Slice;

   function Truncate_Grapheme_Words
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Display.Truncate_Grapheme_Words;

   procedure Truncate_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
   is
   begin
      Copy_Into (Truncate (Text, Max_Chars, Ellipsis), Target, Written, Status);
   end Truncate_Into;

   procedure Truncate_UTF8_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
      renames Humanize.Strings.Display.Truncate_UTF8_Into;

   procedure UTF8_Slice_Into
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Display.UTF8_Slice_Into;

   procedure Truncate_UTF8_Words_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
      renames Humanize.Strings.Display.Truncate_UTF8_Words_Into;

   procedure Truncate_Graphemes_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
      renames Humanize.Strings.Display.Truncate_Graphemes_Into;

   procedure Truncate_Display_Width_Into
     (Text      : String;
      Max_Width : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
      renames Humanize.Strings.Display.Truncate_Display_Width_Into;

   procedure Truncate_ANSI_Display_Width_Into
     (Text      : String;
      Max_Width : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
      renames Humanize.Strings.Display.Truncate_ANSI_Display_Width_Into;

   procedure Wrap_Display_Width_Into
     (Text      : String;
      Max_Width : Positive;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Indent    : Natural := 0)
      renames Humanize.Strings.Display.Wrap_Display_Width_Into;

   procedure Wrap_ANSI_Display_Width_Into
     (Text      : String;
      Max_Width : Positive;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Indent    : Natural := 0)
      renames Humanize.Strings.Display.Wrap_ANSI_Display_Width_Into;

   procedure Key_Value_Line_Into
     (Key       : String;
      Value     : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : String := ": ")
      renames Humanize.Strings.Display.Key_Value_Line_Into;

   procedure Aligned_Key_Value_Line_Into
     (Key       : String;
      Value     : String;
      Key_Width : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : String := " : ")
      renames Humanize.Strings.Display.Aligned_Key_Value_Line_Into;

   procedure Table_Row_2_Into
     (Left       : String;
      Right      : String;
      Left_Width : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Separator  : String := "  ")
      renames Humanize.Strings.Display.Table_Row_2_Into;

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
      renames Humanize.Strings.Display.Table_Row_3_Into;

   procedure Table_2_Into
     (Left_Column  : Name_List;
      Right_Column : Name_List;
      Left_Width   : Natural;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Separator    : String := "  ")
      renames Humanize.Strings.Display.Table_2_Into;

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
      renames Humanize.Strings.Display.Table_3_Into;

   procedure Grapheme_Slice_Into
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Display.Grapheme_Slice_Into;

   procedure Truncate_Grapheme_Words_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
      renames Humanize.Strings.Display.Truncate_Grapheme_Words_Into;

   procedure Truncate_Words_Into
     (Text      : String;
      Max_Words : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
   is
   begin
      Copy_Into
        (Truncate_Words (Text, Max_Words, Ellipsis), Target, Written, Status);
   end Truncate_Words_Into;

   procedure Capitalize_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Downcase  : Boolean := False)
   is
   begin
      Copy_Into (Capitalize (Text, Downcase), Target, Written, Status);
   end Capitalize_Into;

   procedure Title_Case_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Title_Case (Text), Target, Written, Status);
   end Title_Case_Into;

   procedure Title_Case_Smart_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Title_Case_Smart (Text), Target, Written, Status);
   end Title_Case_Smart_Into;

   procedure Title_Case_With_Options_Into
     (Text    : String;
      Options : Title_Case_Options;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into
        (Title_Case_With_Options (Text, Options), Target, Written, Status);
   end Title_Case_With_Options_Into;

   procedure Title_Case_With_Word_Lists_Into
     (Text        : String;
      Acronyms    : String;
      Small_Words : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into
        (Title_Case_With_Word_Lists (Text, Acronyms, Small_Words),
         Target, Written, Status);
   end Title_Case_With_Word_Lists_Into;

   procedure Editorial_Title_Into
     (Text    : String;
      Style   : Editorial_Title_Style;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Editorial_Title (Text, Style), Target, Written, Status);
   end Editorial_Title_Into;

   procedure NL_To_BR_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Markup.NL_To_BR_Into;

   procedure BR_To_NL_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Markup.BR_To_NL_Into;

   procedure Parameterize_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : Character := '-')
      renames Humanize.Strings.Identifiers.Parameterize_Into;

   procedure Dasherize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Identifiers.Dasherize_Into;

   procedure Underscore_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Identifiers.Underscore_Into;

   procedure Camelize_Into
     (Text        : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Upper_First : Boolean := True)
      renames Humanize.Strings.Identifiers.Camelize_Into;

   procedure Humanize_String_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Identifiers.Humanize_String_Into;

   procedure Deconstantize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Identifiers.Deconstantize_Into;

   procedure Demodulize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Identifiers.Demodulize_Into;

   procedure Tableize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Identifiers.Tableize_Into;

   procedure Classify_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Identifiers.Classify_Into;

   procedure Foreign_Key_Into
     (Text             : String;
      Target           : in out String;
      Written          : out Natural;
      Status           : out Humanize.Status.Status_Code;
      Separate_Class_Id : Boolean := True)
      renames Humanize.Strings.Identifiers.Foreign_Key_Into;

   procedure Acronym_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Identifier_Options := Default_Identifier_Options)
      renames Humanize.Strings.Identifiers.Acronym_Into;

   procedure Escape_HTML_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Markup.Escape_HTML_Into;

   procedure Preserve_Separator_Into
     (Text      : String;
      Separator : Character;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Markup.Preserve_Separator_Into;

   procedure Normalize_Whitespace_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Markup.Normalize_Whitespace_Into;

   procedure Squish_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Markup.Squish_Into;

   procedure Strip_Tags_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Markup.Strip_Tags_Into;

   procedure Mask_Into
     (Text         : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Visible_Last : Natural := 4;
      Mask_Char    : Character := '*')
   is
   begin
      Copy_Into (Mask (Text, Visible_Last, Mask_Char), Target, Written, Status);
   end Mask_Into;

   procedure Normalize_Token_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Case_Mode : Token_Case_Mode := Preserve_Token_Case)
   is
   begin
      Copy_Into
        (Normalize_Token (Text, Case_Mode), Target, Written, Status);
   end Normalize_Token_Into;

   procedure Group_Token_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Token_Group_Options := Default_Token_Group_Options)
   is
   begin
      Copy_Into (Group_Token (Text, Options), Target, Written, Status);
   end Group_Token_Into;

   procedure Masked_Token_Into
     (Text         : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Visible_Last : Natural := 4;
      Options      : Token_Group_Options := Default_Token_Group_Options;
      Mask_Char    : Character := '*')
   is
   begin
      Copy_Into
        (Masked_Token (Text, Visible_Last, Options, Mask_Char),
         Target, Written, Status);
   end Masked_Token_Into;

   procedure Safe_Filename_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : Character := '-')
      renames Humanize.Strings.Paths.Safe_Filename_Into;

   procedure Safe_Filename_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Safe_Filename_Options)
      renames Humanize.Strings.Paths.Safe_Filename_Into;

   procedure Path_Basename_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Paths.Path_Basename_Into;

   procedure Path_Title_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Paths.Path_Title_Into;

   procedure Path_Title_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Path_Title_Options)
      renames Humanize.Strings.Paths.Path_Title_Into;

   procedure Extension_Label_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Paths.Extension_Label_Into;

   procedure Extension_Label_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Extension_Label_Options)
      renames Humanize.Strings.Paths.Extension_Label_Into;

   procedure Shorten_Path_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Path_Shorten_Options := Default_Path_Shorten_Options)
      renames Humanize.Strings.Paths.Shorten_Path_Into;

   procedure Symbolic_File_Mode_Into
     (Mode    : File_Mode_Value;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : File_Mode_Kind := Mode_Only)
      renames Humanize.Strings.Paths.Symbolic_File_Mode_Into;

   procedure Octal_File_Mode_Into
     (Mode            : File_Mode_Value;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code;
      Include_Special : Boolean := False;
      Prefix          : Boolean := False)
      renames Humanize.Strings.Paths.Octal_File_Mode_Into;

   procedure File_Mode_Summary_Into
     (Mode    : File_Mode_Value;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : File_Mode_Kind := Mode_Only)
      renames Humanize.Strings.Paths.File_Mode_Summary_Into;

   procedure Search_Key_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Identifiers.Search_Key_Into;

   procedure Natural_Sort_Key_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Identifiers.Natural_Sort_Key_Into;

   procedure Excerpt_Into
     (Text      : String;
      Phrase    : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Radius    : Natural := 32;
      Ellipsis  : String := "...")
   is
   begin
      Copy_Into (Excerpt (Text, Phrase, Radius, Ellipsis), Target, Written, Status);
   end Excerpt_Into;

   procedure Excerpt_With_Context_Into
     (Text          : String;
      Phrase        : String;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Context_Words : Natural := 5;
      Ellipsis      : String := "...")
   is
   begin
      Copy_Into
        (Excerpt_With_Context (Text, Phrase, Context_Words, Ellipsis),
         Target, Written, Status);
   end Excerpt_With_Context_Into;

   procedure Excerpt_With_Options_Into
     (Text      : String;
      Phrase    : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Radius    : Natural := 32;
      Ellipsis  : String := "...";
      Options   : Match_Options := Default_Match_Options)
   is
   begin
      Copy_Into
        (Excerpt_With_Options (Text, Phrase, Radius, Ellipsis, Options),
         Target, Written, Status);
   end Excerpt_With_Options_Into;

   procedure Excerpt_With_Context_Options_Into
     (Text          : String;
      Phrase        : String;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Context_Words : Natural := 5;
      Ellipsis      : String := "...";
      Options       : Match_Options := Default_Match_Options)
   is
   begin
      Copy_Into
        (Excerpt_With_Context_Options
           (Text, Phrase, Context_Words, Ellipsis, Options),
         Target, Written, Status);
   end Excerpt_With_Context_Options_Into;

   procedure Word_Count_Summary_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Metrics.Word_Count_Summary_Into;

   procedure Sentence_Count_Summary_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Metrics.Sentence_Count_Summary_Into;

   procedure Paragraph_Count_Summary_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Metrics.Paragraph_Count_Summary_Into;

   procedure Reading_Time_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Text_Time_Options := Default_Text_Time_Options)
      renames Humanize.Strings.Metrics.Reading_Time_Into;

   procedure Speaking_Time_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Text_Time_Options := Default_Text_Time_Options)
      renames Humanize.Strings.Metrics.Speaking_Time_Into;

   procedure Text_Summary_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Text_Summary_Options := Default_Text_Summary_Options)
      renames Humanize.Strings.Metrics.Text_Summary_Into;

   procedure Text_Summary_With_Options_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Text_Summary_Composition_Options :=
        Default_Text_Summary_Composition_Options)
      renames Humanize.Strings.Metrics.Text_Summary_With_Options_Into;

   procedure Highlight_Into
     (Text    : String;
      Phrase  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Before  : String := "<mark>";
      After   : String := "</mark>")
   is
   begin
      Copy_Into (Highlight (Text, Phrase, Before, After), Target, Written, Status);
   end Highlight_Into;

   procedure Highlight_With_Options_Into
     (Text    : String;
      Phrase  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Before  : String := "<mark>";
      After   : String := "</mark>";
      Options : Highlight_Options := Default_Highlight_Options)
   is
   begin
      Copy_Into
        (Highlight_With_Options (Text, Phrase, Before, After, Options),
         Target, Written, Status);
   end Highlight_With_Options_Into;

   procedure Highlighted_Excerpt_Into
     (Text               : String;
      Phrase             : String;
      Target             : in out String;
      Written            : out Natural;
      Status             : out Humanize.Status.Status_Code;
      Radius             : Natural := 32;
      Ellipsis           : String := "...";
      Before             : String := "<mark>";
      After              : String := "</mark>";
      Options            : Highlight_Options := Default_Highlight_Options;
      Escape_HTML_Output : Boolean := True)
   is
   begin
      Copy_Into
        (Highlighted_Excerpt
           (Text, Phrase, Radius, Ellipsis, Before, After, Options,
            Escape_HTML_Output),
         Target, Written, Status);
   end Highlighted_Excerpt_Into;

   procedure Initials_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Names.Initials_Into;

   procedure Possessive_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Names.Possessive_Into;

   procedure Clean_Name_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Names.Clean_Name_Into;

   procedure Person_Initials_Into
     (Text         : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Max_Initials : Initial_Count_Limit := 3)
      renames Humanize.Strings.Names.Person_Initials_Into;

   procedure Name_Part_Into
     (Text    : String;
      Style   : Name_Display_Style;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Person_Name_Options := Default_Person_Name_Options)
      renames Humanize.Strings.Names.Name_Part_Into;

   procedure Handle_Label_Into
     (Handle      : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Preserve_At : Boolean := True)
      renames Humanize.Strings.Names.Handle_Label_Into;

   procedure Email_Local_Part_Into
     (Email   : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Names.Email_Local_Part_Into;

   procedure Display_Name_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Handle   : String := "";
      Email    : String := "";
      Fallback : String := "Anonymous";
      Options  : Person_Name_Options := Default_Person_Name_Options)
      renames Humanize.Strings.Names.Display_Name_Into;

   procedure Possessive_Name_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Fallback : String := "someone")
      renames Humanize.Strings.Names.Possessive_Name_Into;

   procedure Person_List_Into
     (Names    : Name_List;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Limit    : Positive := 2;
      Fallback : String := "no one")
      renames Humanize.Strings.Names.Person_List_Into;

   procedure Transliterate_ASCII_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Identifiers.Transliterate_ASCII_Into;

   function Slug
     (Text      : String;
      Separator : Character := '-')
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Identifiers.Slug;

   procedure Slug_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : Character := '-')
      renames Humanize.Strings.Identifiers.Slug_Into;

   function Safe_Email_Label
     (Email : String)
      return Humanize.Status.Text_Result
   is
      At_Pos : Natural := 0;
   begin
      for Index in Email'Range loop
         if Email (Index) = '@' then
            At_Pos := Index;
            exit;
         end if;
      end loop;

      if Email'Length = 0 then
         return Ok_Text ("empty email");
      elsif At_Pos = 0 or else At_Pos = Email'Last then
         return Ok_Text ("email address");
      else
         return Ok_Text ("email at " & Email (At_Pos + 1 .. Email'Last));
      end if;
   end Safe_Email_Label;

   function Safe_Phone_Label
     (Phone : String;
      Visible_Digits : Natural := 4)
      return Humanize.Status.Text_Result
   is
      Digit_Text : Unbounded_String;
   begin
      for Ch of Phone loop
         if Is_Digit (Ch) then
            Append (Digit_Text, Ch);
         end if;
      end loop;

      if Length (Digit_Text) = 0 then
         return Ok_Text ("phone number");
      elsif Visible_Digits = 0 then
         return Ok_Text ("phone number redacted");
      else
         declare
            Text : constant String := To_String (Digit_Text);
            Keep : constant Natural := Natural'Min (Visible_Digits, Text'Length);
         begin
            return Ok_Text ("phone ending in "
               & Text (Text'Last - Keep + 1 .. Text'Last));
         end;
      end if;
   end Safe_Phone_Label;

   function Safe_Handle_Label
     (Handle : String)
      return Humanize.Status.Text_Result
   is
      Clean : constant String := Result_Text (Handle_Label (Handle, True));
   begin
      if Clean'Length = 0 then
         return Ok_Text ("handle");
      elsif Clean'Length <= 3 then
         return Ok_Text ("handle " & Clean);
      else
         return Ok_Text ("handle " & Clean (Clean'First .. Clean'First + 1)
            & "***" & Clean (Clean'Last .. Clean'Last));
      end if;
   end Safe_Handle_Label;

   function Code_Symbol_Label
     (Symbol : String)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      Need_Space : Boolean := False;
   begin
      for Ch of Symbol loop
         if Is_Alnum (Ch) then
            if Need_Space and then Length (Result) > 0 then
               Append (Result, " ");
            end if;
            Append (Result, Lower (Ch));
            Need_Space := False;
         elsif Ch = '.' or else Ch = ':' or else Ch = '_' or else Ch = '-' then
            Need_Space := Length (Result) > 0;
         else
            Need_Space := Length (Result) > 0;
         end if;
      end loop;

      if Length (Result) = 0 then
         return Ok_Text ("code symbol");
      else
         return Ok_Text ("code symbol " & To_String (Result));
      end if;
   end Code_Symbol_Label;

   function Source_Location_Label
     (Path   : String;
      Line   : Natural := 0;
      Column : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Base : constant String :=
        (if Path'Length = 0 then "source"
         else Result_Text (Path_Basename (Path)));
   begin
      if Line = 0 then
         return Ok_Text (Base);
      elsif Column = 0 then
         return Ok_Text (Base & ":" & Natural_Text (Line));
      else
         return Ok_Text (Base & ":" & Natural_Text (Line) & ":"
            & Natural_Text (Column));
      end if;
   end Source_Location_Label;

   function Prose_Conjunction (Ch : Character) return String is
   begin
      if Ch = 'o' or else Ch = 'O' then
         return "or";
      else
         return "and";
      end if;
   end Prose_Conjunction;

   function Prose_List
     (Items   : Name_List;
      Options : Prose_List_Options := Default_Prose_List_Options)
      return Humanize.Status.Text_Result
      is separate;

   function Sentence_From_Parts
     (Parts : Name_List)
      return Humanize.Status.Text_Result
      is separate;

   function Unit_Text (Options : Generic_Range_Options) return String is
   begin
      if Options.Unit_Length = 0 then
         return "";
      else
         return " " & Options.Unit
           (Options.Unit'First
            .. Options.Unit'First
              + Natural'Min (Options.Unit_Length, Options.Unit'Length) - 1);
      end if;
   end Unit_Text;

   function Generic_Range_Label
     (Low     : String;
      High    : String;
      Options : Generic_Range_Options)
      return Humanize.Status.Text_Result
      is separate;

   function Uncertainty_Label
     (Value       : String;
      Uncertainty : String;
      Unit        : String := "")
      return Humanize.Status.Text_Result
   is
      V : constant String := Result_Text (Squish (Value));
      U : constant String := Result_Text (Squish (Uncertainty));
      Suffix : constant String :=
        (if Unit'Length = 0 then "" else " " & Result_Text (Squish (Unit)));
   begin
      if V'Length = 0 then
         return Ok_Text ("unknown value");
      elsif U'Length = 0 then
         return Ok_Text (V & Suffix);
      else
         return Ok_Text (V & " +/- " & U & Suffix);
      end if;
   end Uncertainty_Label;

   function Lower_String (Text : String) return String is
      Result : String := Text;
   begin
      for Index in Result'Range loop
         Result (Index) := Lower (Result (Index));
      end loop;
      return Result;
   end Lower_String;

   function Strip_Punctuation_Key (Text : String) return String is
      Result : Unbounded_String;
      Need_Space : Boolean := False;
   begin
      for C of Text loop
         if Is_Alnum (C) then
            if Need_Space and then Length (Result) > 0 then
               Append (Result, " ");
            end if;
            Append (Result, Lower (C));
            Need_Space := False;
         elsif C = ' ' or else C = ASCII.HT or else C = ASCII.LF then
            Need_Space := Length (Result) > 0;
         end if;
      end loop;
      return To_String (Result);
   end Strip_Punctuation_Key;

   function Text_Change_Metadata_For
     (Old_Text : String;
      New_Text : String)
      return Text_Change_Metadata
      is separate;

   function Text_Change_Kind_Text (Kind : Text_Change_Kind) return String is
   begin
      case Kind is
         when Text_Unchanged       => return "unchanged";
         when Text_Whitespace_Only => return "whitespace-only change";
         when Text_Minor_Edit      => return "minor edit";
         when Text_Moderate_Edit   => return "moderate edit";
         when Text_Major_Rewrite   => return "major rewrite";
      end case;
   end Text_Change_Kind_Text;

   function Text_Change_Label
     (Old_Text : String;
      New_Text : String)
      return Humanize.Status.Text_Result
   is
      Meta : constant Text_Change_Metadata :=
        Text_Change_Metadata_For (Old_Text, New_Text);
      Detail : constant String :=
        (if Meta.Case_Only then ", case-only"
         elsif Meta.Punctuation_Only then ", punctuation-only"
         else "");
   begin
      return Ok_Text ("text change: " & Text_Change_Kind_Text (Meta.Kind)
         & ", " & Count_Label (Meta.Old_Words, "old word", "old words")
         & ", " & Count_Label (Meta.New_Words, "new word", "new words")
         & ", " & Count_Label (Meta.Changed_Words, "changed word",
                                "changed words")
         & Detail);
   end Text_Change_Label;

   function Slice_Field
     (Value  : String;
      Length : Natural)
      return String
   is
      Last : constant Natural :=
        Value'First + Natural'Min (Length, Value'Length) - 1;
   begin
      if Length = 0 then
         return "";
      else
         return Result_Text (Squish (Value (Value'First .. Last)));
      end if;
   end Slice_Field;

   procedure Append_Address_Part
     (Result    : in out Unbounded_String;
      Part      : String;
      Multiline : Boolean)
   is
   begin
      if Part'Length = 0 then
         return;
      elsif Length (Result) > 0 then
         Append (Result, (if Multiline then String'(1 => ASCII.LF) else ", "));
      end if;
      Append (Result, Part);
   end Append_Address_Part;

   function Address_Label
     (Address   : Address_Fields;
      Multiline : Boolean := False)
      return Humanize.Status.Text_Result
      is separate;

   function Address_Metadata_Label
     (Address : Address_Fields)
      return Humanize.Status.Text_Result
   is
      Present : Natural := 0;
      Missing : Natural := 0;

      procedure Count (Length : Natural) is
      begin
         if Length = 0 then
            Missing := Missing + 1;
         else
            Present := Present + 1;
         end if;
      end Count;
   begin
      Count (Address.Name_Length);
      Count (Address.Street_Length);
      Count (Address.City_Length);
      Count (Address.Region_Length);
      Count (Address.Postal_Length);
      Count (Address.Country_Length);
      return Ok_Text ("address metadata: " & Count_Label (Present, "field present",
                                             "fields present")
         & ", " & Count_Label (Missing, "field missing", "fields missing"));
   end Address_Metadata_Label;

   function Privacy_Address_Label
     (Address : Address_Fields)
      return Humanize.Status.Text_Result
      is separate;

   function Data_Shape_Kind_Text (Kind : Data_Shape_Kind) return String is
   begin
      case Kind is
         when Scalar_Shape => return "scalar";
         when Object_Shape => return "object";
         when Array_Shape  => return "array";
         when Empty_Shape  => return "empty";
         when Mixed_Shape  => return "mixed";
      end case;
   end Data_Shape_Kind_Text;

   function Data_Shape_Label
     (Shape : Data_Shape_Metadata)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text ("data shape: " & Data_Shape_Kind_Text (Shape.Kind)
         & ", " & Count_Label (Shape.Fields, "field", "fields")
         & ", " & Count_Label (Shape.Items, "item", "items")
         & ", " & Count_Label (Shape.Nulls, "null", "nulls")
         & ", " & Count_Label (Shape.Mixed_Types, "mixed type",
                                "mixed types")
         & ", depth " & Natural_Text (Shape.Max_Depth));
   end Data_Shape_Label;

   function Infer_Data_Shape
     (Text : String)
      return Data_Shape_Metadata
      is separate;

   function Data_Shape_Label
     (Text : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Data_Shape_Label (Infer_Data_Shape (Text));
   end Data_Shape_Label;

   function Label_Coverage_Audit_Label
     (Coverage : Label_Coverage_Metadata)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text ("label coverage: " & Count_Label (Coverage.Families, "family",
                                           "families")
         & ", " & Natural_Text (Coverage.Bounded) & " bounded"
         & ", " & Natural_Text (Coverage.Parseable) & " parseable"
         & ", " & Natural_Text (Coverage.Metadata) & " with metadata"
         & ", " & Natural_Text (Coverage.Stable) & " stable"
         & ", " & Natural_Text (Coverage.Privacy_Safe) & " privacy-safe");
   end Label_Coverage_Audit_Label;

   function Transliteration_Coverage_Label
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Input_Clusters : constant Natural := Grapheme_Length (Text);
      ASCII_Text     : constant String :=
        Result_Text (Transliterate_ASCII (Text));
      Output_Chars   : constant Natural := ASCII_Text'Length;
   begin
      if Text'Length = 0 then
         return Ok_Text ("empty text, no transliteration needed");
      elsif Input_Clusters = 0 then
         return Ok_Text ("no transliterable text");
      elsif Output_Chars = 0 then
         return Ok_Text ("0 of " & Natural_Text (Input_Clusters)
            & " characters transliterated to ASCII");
      else
         return Ok_Text (Natural_Text (Output_Chars) & " ASCII characters from "
            & Natural_Text (Input_Clusters) & " input characters");
      end if;
   end Transliteration_Coverage_Label;

   function Text_Boundary_Summary_Label
     (Text : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Natural_Text (Grapheme_Length (Text)) & " graphemes, "
         & Natural_Text (Word_Count (Text)) & " words, "
         & Natural_Text (Sentence_Count (Text)) & " sentences, "
         & Natural_Text (Paragraph_Count (Text)) & " paragraphs, width "
         & Natural_Text (Grapheme_Display_Width (Text)));
   end Text_Boundary_Summary_Label;

   function Terminal_Paragraph
     (Text         : String;
      Width        : Positive;
      Prefix       : String := "";
      Continuation : String := "")
      return Humanize.Status.Text_Result
      is separate;

   function Terminal_Bullet_List
     (Items  : Name_List;
      Width  : Positive;
      Bullet : String := "- ")
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
   begin
      for Index in Items'Range loop
         declare
            Line : constant String := Result_Text
              (Terminal_Paragraph
                 (To_String (Items (Index)), Width, Bullet,
                  [1 .. Natural'Max (1, Bullet'Length) => ' ']));
         begin
            if Length (Result) > 0 then
               Append (Result, ASCII.LF);
            end if;
            Append (Result, Line);
         end;
      end loop;

      return Ok_Text (To_String (Result));
   end Terminal_Bullet_List;

   function Text_Metadata_Label
     (Text : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text ("text metadata: graphemes="
         & Natural_Text (Grapheme_Length (Text))
         & " words=" & Natural_Text (Word_Count (Text))
         & " display-width=" & Natural_Text (Grapheme_Display_Width (Text))
         & " ansi-width=" & Natural_Text (ANSI_Display_Width (Text)));
   end Text_Metadata_Label;

   function Prefix_Text (Ch : Character) return String is
   begin
      if Ch = ' ' then
         return "";
      else
         return String'(1 => Ch) & " ";
      end if;
   end Prefix_Text;

   function Terminal_Section
     (Title   : String;
      Content : String;
      Options : Terminal_Layout_Options := Default_Terminal_Layout_Options)
      return Humanize.Status.Text_Result
   is
      Clean_Title : constant String := Result_Text (Squish (Title));
      Wrapped : constant String := Result_Text
        (Terminal_Paragraph
           (Content, Options.Width, "",
            (if Options.Mode = Terminal_Compact then "" else "  ")));
   begin
      if Clean_Title'Length = 0 then
         return Ok_Text (Wrapped);
      elsif Wrapped'Length = 0 then
         return Ok_Text (Clean_Title);
      else
         return Ok_Text (Clean_Title & ASCII.LF & Wrapped);
      end if;
   end Terminal_Section;

   function Terminal_Key_Value_Block
     (Keys    : Name_List;
      Values  : Name_List;
      Options : Terminal_Layout_Options := Default_Terminal_Layout_Options)
      return Humanize.Status.Text_Result
      is separate;

   function Terminal_Status_Block
     (Status_Label : String;
      Detail       : String := "";
      Options      : Terminal_Layout_Options := Default_Terminal_Layout_Options)
      return Humanize.Status.Text_Result
   is
      Prefix : constant String := Prefix_Text (Options.Prefix);
      Main : constant String := Result_Text
        (Terminal_Paragraph (Status_Label, Options.Width, Prefix, ""));
   begin
      if Detail'Length = 0 or else Options.Mode = Terminal_Compact then
         return Ok_Text (Main);
      else
         return Ok_Text (Main & ASCII.LF
            & Result_Text
                (Terminal_Paragraph
                   (Detail, Options.Width, "  ", "  ")));
      end if;
   end Terminal_Status_Block;

   procedure Transliteration_Coverage_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into
        (Transliteration_Coverage_Label (Text), Target, Written, Status);
   end Transliteration_Coverage_Label_Into;

   procedure Text_Boundary_Summary_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into
        (Text_Boundary_Summary_Label (Text), Target, Written, Status);
   end Text_Boundary_Summary_Label_Into;

   procedure Terminal_Paragraph_Into
     (Text         : String;
      Width        : Positive;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Prefix       : String := "";
      Continuation : String := "")
   is
   begin
      Copy_Into
        (Terminal_Paragraph (Text, Width, Prefix, Continuation),
         Target, Written, Status);
   end Terminal_Paragraph_Into;

   procedure Text_Metadata_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Text_Metadata_Label (Text), Target, Written, Status);
   end Text_Metadata_Label_Into;

   procedure Prose_List_Into
     (Items   : Name_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Prose_List_Options := Default_Prose_List_Options)
   is
   begin
      Copy_Into (Prose_List (Items, Options), Target, Written, Status);
   end Prose_List_Into;

   procedure Text_Change_Label_Into
     (Old_Text : String;
      New_Text : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Text_Change_Label (Old_Text, New_Text), Target, Written, Status);
   end Text_Change_Label_Into;

   procedure Data_Shape_Label_Into
     (Shape   : Data_Shape_Metadata;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Data_Shape_Label (Shape), Target, Written, Status);
   end Data_Shape_Label_Into;

   procedure Pluralize_Into
     (Word    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Inflections.Pluralize_Into;

   procedure Singularize_Into
     (Word    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Inflections.Singularize_Into;

   procedure Pluralize_In_Language_Into
     (Word     : String;
      Language : Inflection_Language;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Inflections.Pluralize_In_Language_Into;

   procedure Singularize_In_Language_Into
     (Word     : String;
      Language : Inflection_Language;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Inflections.Singularize_In_Language_Into;

   procedure Casefold_ASCII_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Identifiers.Casefold_ASCII_Into;

   procedure Pluralize_With_Dictionary_Into
     (Word      : String;
      Singulars : String;
      Plurals   : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Inflections.Pluralize_With_Dictionary_Into;

   procedure Singularize_With_Dictionary_Into
     (Word      : String;
      Singulars : String;
      Plurals   : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Inflections.Singularize_With_Dictionary_Into;

   procedure Pluralize_With_Options_Into
     (Word      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      renames Humanize.Strings.Inflections.Pluralize_With_Options_Into;

   procedure Singularize_With_Options_Into
     (Word      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      renames Humanize.Strings.Inflections.Singularize_With_Options_Into;

   procedure Inflection_Source_Label_Into
     (Source  : Inflection_Source;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Inflections.Inflection_Source_Label_Into;

   procedure Inflection_Language_Label_Into
     (Language : Inflection_Language;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Inflections.Inflection_Language_Label_Into;

   procedure Copy_Into
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;
end Humanize.Strings.Support.Backend;
