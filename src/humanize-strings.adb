with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Messages;

package body Humanize.Strings is
   use type Humanize.Status.Status_Code;

   function Lower (C : Character) return Character is
   begin
      if C in 'A' .. 'Z' then
         return Character'Val (Character'Pos (C) + 32);
      else
         return C;
      end if;
   end Lower;

   function Upper (C : Character) return Character is
   begin
      if C in 'a' .. 'z' then
         return Character'Val (Character'Pos (C) - 32);
      else
         return C;
      end if;
   end Upper;

   function Is_Alpha (C : Character) return Boolean is
     (C in 'A' .. 'Z' or else C in 'a' .. 'z');

   function Is_Digit (C : Character) return Boolean is
     (C in '0' .. '9');

   function Is_Alnum (C : Character) return Boolean is
     (Is_Alpha (C) or else Is_Digit (C));

   function Natural_Text (Value : Natural) return String is
      Image : constant String := Natural'Image (Value);
   begin
      return Image (Image'First + 1 .. Image'Last);
   end Natural_Text;

   function Ok (Text : String) return Humanize.Status.Text_Result is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String (Text),
         Key    => Humanize.Messages.No_Message);
   end Ok;

   function Truncate
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
   is
   begin
      if Text'Length <= Max_Chars then
         return Ok (Text);
      elsif Max_Chars = 0 then
         return Ok ("");
      elsif Max_Chars <= Ellipsis'Length then
         return Ok (Ellipsis (Ellipsis'First .. Ellipsis'First + Max_Chars - 1));
      else
         declare
            Keep : constant Natural := Max_Chars - Ellipsis'Length;
         begin
            return Ok (Text (Text'First .. Text'First + Keep - 1) & Ellipsis);
         end;
      end if;
   end Truncate;

   function Truncate_Words
     (Text      : String;
      Max_Words : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      Words  : Natural := 0;
      Index  : Natural := Text'First;
   begin
      if Max_Words = 0 then
         return Ok (Ellipsis);
      end if;

      while Index <= Text'Last loop
         while Index <= Text'Last and then Text (Index) = ' ' loop
            Index := Index + 1;
         end loop;
         exit when Index > Text'Last;

         Words := Words + 1;
         if Words > Max_Words then
            Append (Result, " " & Ellipsis);
            return Ok (To_String (Result));
         end if;

         if Length (Result) > 0 then
            Append (Result, " ");
         end if;
         while Index <= Text'Last and then Text (Index) /= ' ' loop
            Append (Result, Text (Index));
            Index := Index + 1;
         end loop;
      end loop;

      return Ok (To_String (Result));
   end Truncate_Words;

   function Capitalize
     (Text      : String;
      Downcase  : Boolean := False)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
   begin
      if Text'Length = 0 then
         return Ok ("");
      end if;

      Append (Result, Upper (Text (Text'First)));
      for Index in Text'First + 1 .. Text'Last loop
         Append (Result, (if Downcase then Lower (Text (Index)) else Text (Index)));
      end loop;
      return Ok (To_String (Result));
   end Capitalize;

   function Title_Case
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result     : Unbounded_String;
      New_Word   : Boolean := True;
      Have_Chars : Boolean := False;
   begin
      for Ch of Text loop
         if Ch = ' ' or else Ch = ASCII.HT or else Ch = ASCII.LF then
            if Have_Chars and then not New_Word then
               Append (Result, " ");
               New_Word := True;
            end if;
         else
            if New_Word then
               Append (Result, Upper (Ch));
               New_Word := False;
            else
               Append (Result, Lower (Ch));
            end if;
            Have_Chars := True;
         end if;
      end loop;

      declare
         Text_Result : constant String := To_String (Result);
      begin
         if Text_Result'Length > 0 and then Text_Result (Text_Result'Last) = ' ' then
            return Ok (Text_Result (Text_Result'First .. Text_Result'Last - 1));
         else
            return Ok (Text_Result);
         end if;
      end;
   end Title_Case;

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
   is
      Item : Unbounded_String;

      procedure Flush (Found : in out Boolean) is
         Raw : constant String := To_String (Item);
         Low : Unbounded_String;
      begin
         for Ch of Raw loop
            Append (Low, Lower (Ch));
         end loop;
         if To_String (Low) = Word then
            Found := True;
         end if;
         Item := Null_Unbounded_String;
      end Flush;

      Found : Boolean := False;
   begin
      for Ch of List loop
         if Ch = ',' or else Ch = ' ' or else Ch = ASCII.HT or else Ch = ASCII.LF then
            if Length (Item) > 0 then
               Flush (Found);
            end if;
         else
            Append (Item, Ch);
         end if;
      end loop;
      if Length (Item) > 0 then
         Flush (Found);
      end if;
      return Found;
   end Contains_List_Word;

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
   is
      Result : Unbounded_String;
      Word   : Unbounded_String;
      Count  : Natural := 0;

      procedure Flush is
         Raw : constant String := To_String (Word);
         Low : Unbounded_String;
      begin
         if Raw'Length = 0 then
            return;
         end if;

         for Ch of Raw loop
            Append (Low, Lower (Ch));
         end loop;

         declare
            L : constant String := To_String (Low);
         begin
            if Count > 0 then
               Append (Result, " ");
            end if;
            if Options.Preserve_Acronyms and then Is_Acronym (L) then
               for Ch of L loop
                  Append (Result, Upper (Ch));
               end loop;
            elsif Options.Lowercase_Small_Words
              and then Count > 0
              and then Is_Small_Title_Word (L)
            then
               Append (Result, L);
            else
               Append (Result, Upper (L (L'First)));
               if L'Length > 1 then
                  Append (Result, L (L'First + 1 .. L'Last));
               end if;
            end if;
            Count := Count + 1;
         end;
         Word := Null_Unbounded_String;
      end Flush;
   begin
      for Ch of Text loop
         if Is_Alnum (Ch) then
            Append (Word, Ch);
         else
            Flush;
         end if;
      end loop;
      Flush;
      return Ok (To_String (Result));
   end Title_Case_With_Options;

   function Title_Case_With_Word_Lists
     (Text        : String;
      Acronyms    : String := "";
      Small_Words : String := "")
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      Word   : Unbounded_String;
      Count  : Natural := 0;

      procedure Flush is
         Raw : constant String := To_String (Word);
         Low : Unbounded_String;
      begin
         if Raw'Length = 0 then
            return;
         end if;

         for Ch of Raw loop
            Append (Low, Lower (Ch));
         end loop;

         declare
            L : constant String := To_String (Low);
         begin
            if Count > 0 then
               Append (Result, " ");
            end if;
            if Contains_List_Word (Acronyms, L) then
               for Ch of L loop
                  Append (Result, Upper (Ch));
               end loop;
            elsif Count > 0 and then Contains_List_Word (Small_Words, L) then
               Append (Result, L);
            else
               Append (Result, Upper (L (L'First)));
               if L'Length > 1 then
                  Append (Result, L (L'First + 1 .. L'Last));
               end if;
            end if;
            Count := Count + 1;
         end;
         Word := Null_Unbounded_String;
      end Flush;
   begin
      for Ch of Text loop
         if Is_Alnum (Ch) then
            Append (Word, Ch);
         else
            Flush;
         end if;
      end loop;
      Flush;
      return Ok (To_String (Result));
   end Title_Case_With_Word_Lists;

   function Editorial_Title
     (Text  : String;
      Style : Editorial_Title_Style := AP_Title)
      return Humanize.Status.Text_Result
   is
      Acronyms : constant String := "api url http https id ui cpu iops utf8";
   begin
      case Style is
         when AP_Title =>
            return Title_Case_With_Word_Lists
              (Text,
               Acronyms,
               "a an and as at but by for in nor of on or per the to via vs "
               & "with");
         when Chicago_Title =>
            return Title_Case_With_Word_Lists
              (Text,
               Acronyms,
               "a an and as at but by for from in into nor of on or over the "
               & "to with");
         when Sentence_Title =>
            declare
               Squished : constant Humanize.Status.Text_Result := Squish (Text);
               Raw      : constant String := To_String (Squished.Text);
               Lowered  : Unbounded_String;
            begin
               for Ch of Raw loop
                  Append (Lowered, Lower (Ch));
               end loop;
               return Capitalize (To_String (Lowered));
            end;
      end case;
   end Editorial_Title;

   function NL_To_BR
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
   begin
      for Ch of Text loop
         if Ch = ASCII.LF then
            Append (Result, "<br/>");
         else
            Append (Result, Ch);
         end if;
      end loop;
      return Ok (To_String (Result));
   end NL_To_BR;

   function BR_To_NL
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      Index  : Natural := Text'First;
   begin
      while Index <= Text'Last loop
         if Index + 3 <= Text'Last
           and then Text (Index .. Index + 3) = "<br>"
         then
            Append (Result, ASCII.LF);
            Index := Index + 4;
         elsif Index + 4 <= Text'Last
           and then Text (Index .. Index + 4) = "<br/>"
         then
            Append (Result, ASCII.LF);
            Index := Index + 5;
         elsif Index + 5 <= Text'Last
           and then Text (Index .. Index + 5) = "<br />"
         then
            Append (Result, ASCII.LF);
            Index := Index + 6;
         else
            Append (Result, Text (Index));
            Index := Index + 1;
         end if;
      end loop;
      return Ok (To_String (Result));
   end BR_To_NL;

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
      return Ok (To_String (Result));
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
      return Ok (To_String (Result));
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
            if Ch in 'A' .. 'Z'
              and then Length (Result) > 0
              and then (Prev in 'a' .. 'z' or else Prev in '0' .. '9')
            then
               Append (Result, "_");
            end if;
            Append (Result, Lower (Ch));
         end if;
         Prev := Ch;
      end loop;
      return Ok (To_String (Result));
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
      return Ok (To_String (Result));
   end Camelize;

   function Humanize_String
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Under : constant Humanize.Status.Text_Result := Underscore (Text);
      Raw   : constant String := To_String (Under.Text);
      Words : Unbounded_String;
   begin
      for Ch of Raw loop
         if Ch = '_' then
            Append (Words, " ");
         else
            Append (Words, Ch);
         end if;
      end loop;
      return Capitalize (To_String (Words), Downcase => True);
   end Humanize_String;

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
   is
      Dot : constant Natural := Last_Index (Text, '.');
   begin
      if Dot = 0 then
         return Ok ("");
      else
         return Ok (Text (Text'First .. Dot - 1));
      end if;
   end Deconstantize;

   function Demodulize
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Dot : constant Natural := Last_Index (Text, '.');
   begin
      if Dot = 0 or else Dot = Text'Last then
         return Ok (Text);
      else
         return Ok (Text (Dot + 1 .. Text'Last));
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
      return Pluralize (To_String (Base.Text));
   end Tableize;

   function Classify
     (Text : String)
      return Humanize.Status.Text_Result
   is
      One : constant Humanize.Status.Text_Result := Singularize (Text);
   begin
      if One.Status /= Humanize.Status.Ok then
         return One;
      end if;
      return Camelize (To_String (One.Text));
   end Classify;

   function Foreign_Key
     (Text             : String;
      Separate_Class_Id : Boolean := True)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Underscore (To_String (Demodulize (Text).Text));
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      elsif Separate_Class_Id then
         return Ok (To_String (Base.Text) & "_id");
      else
         return Ok (To_String (Base.Text) & "id");
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

      for Ch of To_String (Under.Text) loop
         if Ch = '_' then
            Flush;
         else
            Append (Word, Ch);
         end if;
      end loop;
      Flush;
      return Ok (To_String (Result));
   end Acronym;

   function Escape_HTML
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
   begin
      for Ch of Text loop
         case Ch is
            when '&' => Append (Result, "&amp;");
            when '<' => Append (Result, "&lt;");
            when '>' => Append (Result, "&gt;");
            when '"' => Append (Result, "&quot;");
            when others => Append (Result, Ch);
         end case;
         if Ch = Character'Val (39) then
            Replace_Slice (Result, Length (Result), Length (Result), "&#39;");
         end if;
      end loop;
      return Ok (To_String (Result));
   end Escape_HTML;

   function Preserve_Separator
     (Text      : String;
      Separator : Character)
      return Humanize.Status.Text_Result
   is
      Result   : Unbounded_String;
      Last_Sep : Boolean := False;
   begin
      for Ch of Text loop
         if Ch = Separator then
            if Length (Result) > 0 and then not Last_Sep then
               Append (Result, Separator);
            end if;
            Last_Sep := True;
         else
            Append (Result, Ch);
            Last_Sep := False;
         end if;
      end loop;
      return Ok (To_String (Result));
   end Preserve_Separator;

   function Is_Space (Ch : Character) return Boolean is
     (Ch = ' ' or else Ch = ASCII.HT or else Ch = ASCII.LF
      or else Ch = ASCII.CR);

   function Normalize_Whitespace
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      Need_Space : Boolean := False;
   begin
      for Ch of Text loop
         if Is_Space (Ch) then
            Need_Space := Length (Result) > 0;
         else
            if Need_Space then
               Append (Result, " ");
            end if;
            Append (Result, Ch);
            Need_Space := False;
         end if;
      end loop;
      return Ok (To_String (Result));
   end Normalize_Whitespace;

   function Squish
     (Text : String)
      return Humanize.Status.Text_Result is
   begin
      return Normalize_Whitespace (Text);
   end Squish;

   function Strip_Tags
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      In_Tag : Boolean := False;
   begin
      for Ch of Text loop
         if Ch = '<' then
            In_Tag := True;
         elsif Ch = '>' then
            In_Tag := False;
         elsif not In_Tag then
            Append (Result, Ch);
         end if;
      end loop;
      return Ok (To_String (Result));
   end Strip_Tags;

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
         return Ok (Prefix & Text (Start .. Stop) & Suffix);
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
   is
      Result               : Text_Metrics_Result;
      Index                : Natural := Text'First;
      Width                : Positive;
      Code                 : Natural;
      In_Word              : Boolean := False;
      Pending_Sentence     : Boolean := False;
      In_Sentence_End      : Boolean := False;
      In_Paragraph         : Boolean := False;
      Line_Has_Text        : Boolean := False;
      Blank_Line_Seen      : Boolean := True;
      Previous_Was_CR      : Boolean := False;

      procedure End_Word is
      begin
         In_Word := False;
      end End_Word;

      procedure End_Line is
      begin
         if Line_Has_Text then
            Blank_Line_Seen := False;
         elsif not Blank_Line_Seen then
            In_Paragraph := False;
            Blank_Line_Seen := True;
         end if;
         Line_Has_Text := False;
      end End_Line;
   begin
      while Index <= Text'Last loop
         Code := UTF8_Code_Point (Text, Index, Width);
         Result.Code_Points := Result.Code_Points + 1;

         if Is_Unicode_Word_Start (Code) then
            if not In_Word then
               Result.Words := Result.Words + 1;
               In_Word := True;
            end if;
            Pending_Sentence := True;
            In_Sentence_End := False;
            Line_Has_Text := True;
            if not In_Paragraph then
               Result.Paragraphs := Result.Paragraphs + 1;
               In_Paragraph := True;
            end if;
         elsif Is_Unicode_Word_Continuation (Code) and then In_Word then
            Line_Has_Text := True;
         elsif Is_Internal_Word_Connector (Code)
           and then In_Word
           and then Next_Code_Point_Is_Word_Start (Text, Index + Width)
         then
            Line_Has_Text := True;
         else
            End_Word;
            if Is_Sentence_Terminator (Code) then
               if Pending_Sentence and then not In_Sentence_End then
                  Result.Sentences := Result.Sentences + 1;
                  Pending_Sentence := False;
                  In_Sentence_End := True;
               end if;
               Line_Has_Text := True;
               if not In_Paragraph then
                  Result.Paragraphs := Result.Paragraphs + 1;
                  In_Paragraph := True;
               end if;
            elsif Is_Paragraph_Break (Code) then
               End_Line;
               In_Paragraph := False;
               Blank_Line_Seen := True;
               Line_Has_Text := False;
               In_Sentence_End := False;
            elsif Is_Line_Break (Code) then
               if Code = 16#000A# and then Previous_Was_CR then
                  null;
               else
                  End_Line;
               end if;
               In_Sentence_End := False;
            elsif not Is_Unicode_Space (Code) then
               Line_Has_Text := True;
               if not In_Paragraph then
                  Result.Paragraphs := Result.Paragraphs + 1;
                  In_Paragraph := True;
               end if;
               In_Sentence_End := False;
            end if;
         end if;

         Previous_Was_CR := Code = 16#000D#;
         Index := Index + Width;
      end loop;

      if Pending_Sentence then
         Result.Sentences := Result.Sentences + 1;
      end if;
      Result.Display_Width := Grapheme_Display_Width (Text);
      return Result;
   end Text_Metrics;

   function Word_Count (Text : String) return Natural is
   begin
      return Text_Metrics (Text).Words;
   end Word_Count;

   function Sentence_Count (Text : String) return Natural is
   begin
      return Text_Metrics (Text).Sentences;
   end Sentence_Count;

   function Paragraph_Count (Text : String) return Natural is
   begin
      return Text_Metrics (Text).Paragraphs;
   end Paragraph_Count;

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
         return Natural'Image (Count) (2 .. Natural'Image (Count)'Last)
           & " " & Plural;
      end if;
   end Count_Label;

   function Word_Count_Summary
     (Text : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok (Count_Label (Word_Count (Text), "word", "words"));
   end Word_Count_Summary;

   function Sentence_Count_Summary
     (Text : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok (Count_Label (Sentence_Count (Text), "sentence", "sentences"));
   end Sentence_Count_Summary;

   function Paragraph_Count_Summary
     (Text : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok (Count_Label (Paragraph_Count (Text), "paragraph", "paragraphs"));
   end Paragraph_Count_Summary;

   function Minutes_Label
     (Words  : Natural;
      Rate   : Words_Per_Minute;
      Suffix : String)
      return String
   is
      Minutes : Natural;
   begin
      if Words = 0 then
         return "0 minutes " & Suffix;
      end if;

      Minutes := (Words + Natural (Rate) - 1) / Natural (Rate);
      if Minutes <= 1 then
         return "less than 1 minute " & Suffix;
      else
         return Natural'Image (Minutes) (2 .. Natural'Image (Minutes)'Last)
           & " minutes " & Suffix;
      end if;
   end Minutes_Label;

   function Reading_Time
     (Text    : String;
      Options : Text_Time_Options := Default_Text_Time_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok
        (Minutes_Label
           (Word_Count (Text), Options.Reading_Words_Per_Minute, "read"));
   end Reading_Time;

   function Speaking_Time
     (Text    : String;
      Options : Text_Time_Options := Default_Text_Time_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok
        (Minutes_Label
           (Word_Count (Text), Options.Speaking_Words_Per_Minute, "spoken"));
   end Speaking_Time;

   procedure Append_Summary_Part
     (Summary : in out Unbounded_String;
      Part    : String;
      Separator : String := ", ")
   is
   begin
      if Length (Summary) > 0 then
         Append (Summary, Separator);
      end if;
      Append (Summary, Part);
   end Append_Summary_Part;

   function Natural_Image (Value : Natural) return String is
      Raw : constant String := Natural'Image (Value);
   begin
      return Raw (Raw'First + 1 .. Raw'Last);
   end Natural_Image;

   function Count_Label_With_Style
     (Count    : Natural;
      Singular : String;
      Plural   : String;
      Compact  : String;
      Style    : Text_Summary_Label_Style)
      return String
   is
   begin
      case Style is
         when Natural_Labels =>
            return Count_Label (Count, Singular, Plural);
         when Compact_Labels =>
            return Natural_Image (Count) & " " & Compact;
         when Minimal_Labels =>
            return Natural_Image (Count);
      end case;
   end Count_Label_With_Style;

   function Minutes_Label_With_Style
     (Words  : Natural;
      Rate   : Words_Per_Minute;
      Suffix : String;
      Style  : Text_Summary_Label_Style)
      return String
   is
      Minutes : Natural;
   begin
      if Style = Natural_Labels then
         return Minutes_Label (Words, Rate, Suffix);
      end if;

      if Words = 0 then
         Minutes := 0;
      else
         Minutes := (Words + Natural (Rate) - 1) / Natural (Rate);
         if Minutes = 0 then
            Minutes := 1;
         end if;
      end if;

      case Style is
         when Compact_Labels =>
            return Natural_Image (Minutes)
              & (if Suffix = "read" then " min read" else " min spoken");
         when Minimal_Labels =>
            return Natural_Image (Minutes);
         when Natural_Labels =>
            return Minutes_Label (Words, Rate, Suffix);
      end case;
   end Minutes_Label_With_Style;

   function Summary_Field_Value
     (Metrics : Text_Metrics_Result;
      Field   : Text_Summary_Field)
      return Natural
   is
   begin
      case Field is
         when Summary_Words =>
            return Metrics.Words;
         when Summary_Sentences =>
            return Metrics.Sentences;
         when Summary_Paragraphs =>
            return Metrics.Paragraphs;
         when Summary_Code_Points =>
            return Metrics.Code_Points;
         when Summary_Display_Width =>
            return Metrics.Display_Width;
         when Summary_Reading_Time | Summary_Speaking_Time =>
            return Metrics.Words;
      end case;
   end Summary_Field_Value;

   function Summary_Separator
     (Options : Text_Summary_Composition_Options)
      return String
   is
   begin
      return [1 => Options.Separator]
        & (if Options.Space_After_Separator then " " else "");
   end Summary_Separator;

   function Summary_Field_Text
     (Metrics : Text_Metrics_Result;
      Field   : Text_Summary_Field;
      Options : Text_Summary_Composition_Options)
      return String
   is
   begin
      case Field is
         when Summary_Words =>
            return Count_Label_With_Style
              (Metrics.Words, "word", "words", "w", Options.Label_Style);
         when Summary_Sentences =>
            return Count_Label_With_Style
              (Metrics.Sentences, "sentence", "sentences", "sent",
               Options.Label_Style);
         when Summary_Paragraphs =>
            return Count_Label_With_Style
              (Metrics.Paragraphs, "paragraph", "paragraphs", "para",
               Options.Label_Style);
         when Summary_Reading_Time =>
            return Minutes_Label_With_Style
              (Metrics.Words, Options.Time.Reading_Words_Per_Minute, "read",
               Options.Label_Style);
         when Summary_Speaking_Time =>
            return Minutes_Label_With_Style
              (Metrics.Words, Options.Time.Speaking_Words_Per_Minute, "spoken",
               Options.Label_Style);
         when Summary_Code_Points =>
            return Count_Label_With_Style
              (Metrics.Code_Points, "character", "characters", "ch",
               Options.Label_Style);
         when Summary_Display_Width =>
            return Count_Label_With_Style
              (Metrics.Display_Width, "column", "columns", "col",
               Options.Label_Style);
      end case;
   end Summary_Field_Text;

   function Text_Summary_With_Options
     (Text    : String;
      Options : Text_Summary_Composition_Options :=
        Default_Text_Summary_Composition_Options)
      return Humanize.Status.Text_Result
   is
      Metrics : constant Text_Metrics_Result := Text_Metrics (Text);
      Summary : Unbounded_String;
      Sep     : constant String := Summary_Separator (Options);
   begin
      for Index in 1 .. Options.Field_Count loop
         declare
            Field : constant Text_Summary_Field := Options.Fields (Index);
         begin
            if not Options.Omit_Zero_Counts
              or else Summary_Field_Value (Metrics, Field) /= 0
            then
               Append_Summary_Part
                 (Summary, Summary_Field_Text (Metrics, Field, Options), Sep);
            end if;
         end;
      end loop;

      if Length (Summary) = 0 then
         return Ok ([1 => Options.Empty_Text]);
      else
         return Ok (To_String (Summary));
      end if;
   end Text_Summary_With_Options;

   function Text_Summary
     (Text    : String;
      Options : Text_Summary_Options := Default_Text_Summary_Options)
      return Humanize.Status.Text_Result
   is
      Fields : Text_Summary_Field_List :=
        [Summary_Words,
         Summary_Sentences,
         Summary_Paragraphs,
         Summary_Reading_Time,
         Summary_Speaking_Time,
         Summary_Code_Points,
         Summary_Display_Width];
      Count  : Text_Summary_Field_Count := 1;
   begin
      if Options.Include_Sentences then
         Count := Count + 1;
         Fields (Count) := Summary_Sentences;
      end if;

      if Options.Include_Paragraphs then
         Count := Count + 1;
         Fields (Count) := Summary_Paragraphs;
      end if;

      if Options.Include_Reading_Time then
         Count := Count + 1;
         Fields (Count) := Summary_Reading_Time;
      end if;

      if Options.Include_Speaking_Time then
         Count := Count + 1;
         Fields (Count) := Summary_Speaking_Time;
      end if;

      return Text_Summary_With_Options
        (Text,
         (Fields => Fields,
          Field_Count => Count,
          Separator => ',',
          Space_After_Separator => True,
          Label_Style => Natural_Labels,
          Omit_Zero_Counts => False,
          Empty_Text => '-',
          Time => Options.Time));
   end Text_Summary;

   function Previous_Word_Start
     (Text  : String;
      Index : Natural)
      return Natural
   is
      Pos     : Natural := Natural'Min (Index, Text'Last);
      Lead    : Natural;
      Width   : Positive;
      Code    : Natural;
      In_Word : Boolean := False;
      Start  : Natural := Text'First;
   begin
      if Text'Length = 0 then
         return 0;
      end if;

      while Pos >= Text'First loop
         Lead := Pos;
         while Lead > Text'First and then Is_UTF8_Continuation (Text (Lead)) loop
            Lead := Lead - 1;
         end loop;

         Code := UTF8_Code_Point (Text, Lead, Width);
         if Is_Unicode_Word_Continuation (Code) then
            Start := Lead;
            In_Word := True;
         elsif In_Word then
            return Start;
         end if;
         exit when Lead = Text'First;
         Pos := Lead - 1;
      end loop;
      return Start;
   end Previous_Word_Start;

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
   is
      Pos : constant Natural :=
        Find_Match (Text, Phrase, Text'First, Options);
      Start : Natural;
      Stop  : Natural;
   begin
      if Pos = 0 then
         return Truncate_Words (Text, Context_Words * 2 + 1, Ellipsis);
      end if;

      Start := Pos;
      for I in 1 .. Context_Words loop
         Start := Previous_Word_Start
           (Text, (if Start > Text'First then Start - 1 else Text'First));
      end loop;

      Stop := Pos + Phrase'Length - 1;
      for I in 1 .. Context_Words loop
         Stop := Next_Word_End
           (Text, (if Stop < Text'Last then Stop + 1 else Text'Last));
      end loop;

      declare
         Prefix : constant String :=
           (if Start > Text'First then Ellipsis else "");
         Suffix : constant String :=
           (if Stop < Text'Last then Ellipsis else "");
      begin
         return Ok (Prefix & Text (Start .. Stop) & Suffix);
      end;
   end Excerpt_With_Context_Options;

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
   is
      Result : Unbounded_String;
      Index  : Natural := Text'First;
      Pos    : Natural;
   begin
      if Phrase'Length = 0 then
         Append_Output_Text (Result, Text, Escape_HTML);
         return Ok (To_String (Result));
      end if;

      while Index <= Text'Last loop
         Pos := Find_Match (Text, Phrase, Index, Options.Match_Mode);
         if Pos = 0 then
            Append_Output_Text (Result, Text (Index .. Text'Last), Escape_HTML);
            exit;
         end if;
         if Pos > Index then
            Append_Output_Text (Result, Text (Index .. Pos - 1), Escape_HTML);
         end if;

         Append (Result, Before);
         Append_Output_Text
           (Result, Text (Pos .. Pos + Phrase'Length - 1), Escape_HTML);
         Append (Result, After);

         Index := Pos + Phrase'Length;
         if Options.Count_Mode = First_Match and then Index <= Text'Last then
            Append_Output_Text (Result, Text (Index .. Text'Last), Escape_HTML);
            exit;
         end if;
      end loop;
      return Ok (To_String (Result));
   end Highlight_Core;

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
   is
      Excerpted : constant Humanize.Status.Text_Result :=
        Excerpt_With_Options
          (Text, Phrase, Radius, Ellipsis, Options.Match_Mode);
   begin
      return Highlight_Core
        (To_String (Excerpted.Text), Phrase, Before, After, Options,
         Escape_HTML => Escape_HTML_Output);
   end Highlighted_Excerpt;

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
      return Ok (To_String (Result));
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
      return Ok (To_String (Result));
   end Normalize_Token;

   function Group_Normalized_Token
     (Text    : String;
      Options : Token_Group_Options)
      return String
   is
      Result : Unbounded_String;
      Count  : Natural := 0;
      First_Group : Natural;
   begin
      if Text'Length = 0 then
         return "";
      end if;

      if Options.Direction = Group_From_Left then
         for Index in Text'Range loop
            if Count > 0 and then Count mod Natural (Options.Group_Size) = 0 then
               Append (Result, Options.Separator);
            end if;
            Append (Result, Text (Index));
            Count := Count + 1;
         end loop;
      else
         First_Group := Text'Length mod Natural (Options.Group_Size);
         if First_Group = 0 then
            First_Group := Natural (Options.Group_Size);
         end if;

         for Index in Text'Range loop
            if Count > 0
              and then (Count = First_Group
                        or else (Count > First_Group
                                 and then (Count - First_Group)
                                   mod Natural (Options.Group_Size) = 0))
            then
               Append (Result, Options.Separator);
            end if;
            Append (Result, Text (Index));
            Count := Count + 1;
         end loop;
      end if;

      return To_String (Result);
   end Group_Normalized_Token;

   function Group_Token
     (Text    : String;
      Options : Token_Group_Options := Default_Token_Group_Options)
      return Humanize.Status.Text_Result
   is
      Normal : constant Humanize.Status.Text_Result :=
        Normalize_Token (Text, Options.Case_Mode);
   begin
      return Ok (Group_Normalized_Token (To_String (Normal.Text), Options));
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
      Raw    : constant String := To_String (Normal.Text);
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
      return Ok (Group_Normalized_Token (To_String (Masked), Options));
   end Masked_Token;

   function Is_Path_Separator (Ch : Character) return Boolean is
     (Ch = '/' or else Ch = '\');

   function Apply_Case
     (Ch   : Character;
      Mode : Filename_Case_Mode)
      return Character
   is
   begin
      case Mode is
         when Preserve_Filename_Case =>
            return Ch;
         when Lowercase_Filename =>
            return Lower (Ch);
         when Uppercase_Filename =>
            return Upper (Ch);
      end case;
   end Apply_Case;

   function Is_Reserved_Filename_Stem (Stem : String) return Boolean
   is
      Upper_Stem : Unbounded_String;
   begin
      for Ch of Stem loop
         Append (Upper_Stem, Upper (Ch));
      end loop;

      declare
         Name : constant String := To_String (Upper_Stem);
      begin
         if Name = "CON" or else Name = "PRN" or else Name = "AUX"
           or else Name = "NUL"
         then
            return True;
         elsif Name'Length = 4
           and then (Name (Name'First .. Name'First + 2) = "COM"
                     or else Name (Name'First .. Name'First + 2) = "LPT")
           and then Name (Name'Last) in '1' .. '9'
         then
            return True;
         else
            return False;
         end if;
      end;
   end Is_Reserved_Filename_Stem;

   function Extension_Start
     (Name                : String;
      Hidden_File_Extends : Boolean := False)
      return Natural
   is
      Dot : constant Natural := Last_Index (Name, '.');
   begin
      if Dot = 0 or else Dot = Name'Last then
         return 0;
      elsif Dot = Name'First and then not Hidden_File_Extends then
         return 0;
      else
         return Dot;
      end if;
   end Extension_Start;

   procedure Append_Safe_Chars
     (Source    : String;
      Result    : in out Unbounded_String;
      Options   : Safe_Filename_Options;
      Allow_Dot : Boolean)
   is
      Pending : Boolean := False;

      procedure Append_Separator is
      begin
         if Length (Result) > 0
           and then Element (Result, Length (Result)) /= Options.Separator
           and then Element (Result, Length (Result)) /= '.'
         then
            Append (Result, Options.Separator);
         end if;
      end Append_Separator;
   begin
      for Ch of Source loop
         if Is_Alnum (Ch) then
            if Pending then
               Append_Separator;
               Pending := False;
            end if;
            Append (Result, Apply_Case (Ch, Options.Case_Mode));
         elsif Ch = '.' and then Allow_Dot then
            if Length (Result) > 0
              and then Element (Result, Length (Result)) /= Options.Separator
              and then Element (Result, Length (Result)) /= '.'
            then
               Append (Result, '.');
            end if;
            Pending := False;
         elsif Ch = ' ' or else Ch = ASCII.HT or else Ch = ASCII.LF
           or else Ch = ASCII.CR or else Ch = '_' or else Ch = '-'
           or else Is_Path_Separator (Ch)
         then
            Pending := Length (Result) > 0;
         else
            Pending := Length (Result) > 0;
         end if;
      end loop;
   end Append_Safe_Chars;

   procedure Trim_Safe_Tail
     (Text      : in out Unbounded_String;
      Separator : Character)
   is
   begin
      while Length (Text) > 0
        and then (Element (Text, Length (Text)) = Separator
                  or else Element (Text, Length (Text)) = '.')
      loop
         Delete (Text, Length (Text), Length (Text));
      end loop;
   end Trim_Safe_Tail;

   function Safe_Filename
     (Text      : String;
      Separator : Character := '-')
      return Humanize.Status.Text_Result
   is
      Options : Safe_Filename_Options := Default_Safe_Filename_Options;
   begin
      Options.Separator := Separator;
      return Safe_Filename (Text, Options);
   end Safe_Filename;

   function Safe_Filename
     (Text    : String;
      Options : Safe_Filename_Options)
      return Humanize.Status.Text_Result
   is
      Source : constant String :=
        (if Options.Hidden_Mode = Drop_Hidden_Dot
           and then Text'Length > 1
           and then Text (Text'First) = '.'
         then Text (Text'First + 1 .. Text'Last)
         else Text);
      Dot    : constant Natural :=
        (if Options.Preserve_Extension and then Source'Length > 0
         then Extension_Start
           (Source, Options.Hidden_Mode = Preserve_Hidden_File)
         else 0);
      Stem_Source : constant String :=
        (if Dot = 0 then Source else Source (Source'First .. Dot - 1));
      Ext_Source : constant String :=
        (if Dot = 0 then "" else Source (Dot + 1 .. Source'Last));
      Stem   : Unbounded_String;
      Ext    : Unbounded_String;
      Result : Unbounded_String;
   begin
      if Options.Hidden_Mode = Preserve_Hidden_File
        and then Text'Length > 1
        and then Text (Text'First) = '.'
      then
         Append (Stem, '.');
      end if;

      Append_Safe_Chars
        (Stem_Source, Stem, Options, not Options.Preserve_Extension);
      Trim_Safe_Tail (Stem, Options.Separator);

      if Length (Stem) = 0
        or else (Length (Stem) = 1 and then Element (Stem, 1) = '.')
      then
         Append (Stem, Options.Empty_Fallback);
      end if;

      if Options.Max_Stem_Length > 0
        and then Length (Stem) > Natural (Options.Max_Stem_Length)
      then
         Delete
           (Stem, Natural (Options.Max_Stem_Length) + 1, Length (Stem));
         Trim_Safe_Tail (Stem, Options.Separator);
      end if;

      if Is_Reserved_Filename_Stem (To_String (Stem)) then
         Append (Stem, Options.Reserved_Name_Fallback);
      end if;

      if Dot /= 0 then
         Append_Safe_Chars (Ext_Source, Ext, Options, False);
         Trim_Safe_Tail (Ext, Options.Separator);
      end if;

      Append (Result, To_String (Stem));
      if Length (Ext) > 0 then
         Append (Result, '.');
         Append (Result, To_String (Ext));
      end if;
      return Ok (To_String (Result));
   end Safe_Filename;

   function Last_Path_Separator
     (Path      : String;
      Separator : Character := ASCII.NUL)
      return Natural
   is
   begin
      for Index in reverse Path'Range loop
         if (Separator /= ASCII.NUL and then Path (Index) = Separator)
           or else (Separator = ASCII.NUL and then Is_Path_Separator (Path (Index)))
         then
            return Index;
         end if;
      end loop;
      return 0;
   end Last_Path_Separator;

   function Path_Basename
     (Path : String)
      return Humanize.Status.Text_Result
   is
      Last : Natural := Path'Last;
      Sep  : Natural;
   begin
      if Path'Length = 0 then
         return Ok ("");
      end if;

      while Last >= Path'First and then Is_Path_Separator (Path (Last)) loop
         exit when Last = Path'First;
         Last := Last - 1;
      end loop;

      if Last = Path'First and then Is_Path_Separator (Path (Last)) then
         return Ok ("");
      end if;

      Sep := Last_Path_Separator (Path (Path'First .. Last));
      if Sep = 0 then
         return Ok (Path (Path'First .. Last));
      else
         return Ok (Path (Sep + 1 .. Last));
      end if;
   end Path_Basename;

   function Path_Title
     (Path : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Path_Title (Path, Default_Path_Title_Options);
   end Path_Title;

   function Path_Title
     (Path    : String;
      Options : Path_Title_Options)
      return Humanize.Status.Text_Result
   is
      Base_Result : constant Humanize.Status.Text_Result := Path_Basename (Path);
      Raw_Base    : constant String := To_String (Base_Result.Text);
      Base        : constant String :=
        (if Options.Hidden_Mode = Drop_Hidden_Dot
           and then Raw_Base'Length > 1
           and then Raw_Base (Raw_Base'First) = '.'
         then Raw_Base (Raw_Base'First + 1 .. Raw_Base'Last)
         else Raw_Base);
      Dot         : constant Natural :=
        (if Base'Length = 0 or else Options.Include_Extension
         then 0
         else Extension_Start
           (Base, Options.Hidden_Mode = Preserve_Hidden_File));
      Stem        : constant String :=
        (if Dot = 0 then Base else Base (Base'First .. Dot - 1));
      Words       : Unbounded_String;
      Pending     : Boolean := False;
      Limit       : constant Natural := Natural (Options.Max_Stem_Length);
   begin
      for Ch of Stem loop
         exit when Limit > 0 and then Length (Words) >= Limit;
         if Is_Alnum (Ch) then
            if Pending and then Length (Words) > 0 then
               Append (Words, " ");
            end if;
            Append (Words, Ch);
            Pending := False;
         else
            Pending := Length (Words) > 0;
         end if;
      end loop;

      if Length (Words) = 0 then
         return Ok ([1 => Options.Empty_Text]);
      else
         return Title_Case_With_Options (To_String (Words), Options.Title);
      end if;
   end Path_Title;

   function Extension_Label
     (Path : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Extension_Label (Path, Default_Extension_Label_Options);
   end Extension_Label;

   function Extension_Label
     (Path    : String;
      Options : Extension_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base_Result : constant Humanize.Status.Text_Result := Path_Basename (Path);
      Base        : constant String := To_String (Base_Result.Text);
      Dot         : constant Natural :=
        (if Base'Length = 0 then 0
         else Extension_Start (Base, Options.Hidden_File_Extends));
      Result      : Unbounded_String;
   begin
      if Dot = 0 then
         case Options.Missing_Label is
            when Generic_File_Label =>
               return Ok ("file");
            when No_Extension_Label =>
               return Ok ("no extension");
            when Empty_Extension_Label =>
               return Ok ("");
         end case;
      end if;

      for Index in Dot + 1 .. Base'Last loop
         Append (Result, Apply_Case (Base (Index), Options.Case_Mode));
      end loop;
      return Ok (To_String (Result));
   end Extension_Label;

   function Shorten_Basename_Preserving_Extension
     (Base     : String;
      Max      : Natural;
      Ellipsis : Character)
      return String
   is
      Dot : constant Natural := Extension_Start (Base);
   begin
      if Dot = 0 or else Max <= 1 then
         return [1 => Ellipsis] & Base (Base'Last - (Max - 2) .. Base'Last);
      end if;

      declare
         Ext_Length  : constant Natural := Base'Last - Dot + 1;
         Stem_Length : constant Natural := Dot - Base'First;
      begin
         if Max <= Ext_Length + 1 then
            return [1 => Ellipsis] & Base (Base'Last - (Max - 2) .. Base'Last);
         end if;

         declare
            Keep : constant Natural := Natural'Min
              (Stem_Length, Max - Ext_Length - 1);
         begin
            return
              [1 => Ellipsis]
              & Base (Dot - Keep .. Dot - 1)
              & Base (Dot .. Base'Last);
         end;
      end;
   end Shorten_Basename_Preserving_Extension;

   function Shorten_Path
     (Path    : String;
      Options : Path_Shorten_Options := Default_Path_Shorten_Options)
      return Humanize.Status.Text_Result
   is
      Max      : constant Natural := Natural (Options.Max_Chars);
      Base     : constant String := To_String (Path_Basename (Path).Text);
      Sep      : constant Natural := Last_Path_Separator (Path, Options.Separator);
      Prefix_Last : Natural := (if Sep = 0 then Path'First - 1 else Sep - 1);
   begin
      if Path'Length <= Max then
         return Ok (Path);
      elsif Max = 0 then
         return Ok ("");
      elsif Max = 1 then
         return Ok ([1 => Options.Ellipsis]);
      elsif Base'Length + 1 >= Max then
         if Options.Preserve_Extension then
            return Ok
              (Shorten_Basename_Preserving_Extension
                 (Base, Max, Options.Ellipsis));
         else
            return Ok
              ([1 => Options.Ellipsis]
               & Base (Base'Last - (Max - 2) .. Base'Last));
         end if;
      end if;

      declare
         Prefix_Keep : constant Natural := Max - Base'Length - 2;
      begin
         if Prefix_Last < Path'First then
            Prefix_Last := Path'First + Prefix_Keep - 1;
         else
            Prefix_Last := Natural'Min
              (Prefix_Last, Path'First + Prefix_Keep - 1);
         end if;

         return Ok
           (Path (Path'First .. Prefix_Last)
           & Options.Ellipsis & Options.Separator & Base);
      end;
   end Shorten_Path;

   function Kind_Char (Kind : File_Mode_Kind) return Character is
   begin
      case Kind is
         when Mode_Only =>
            return ASCII.NUL;
         when Regular_File =>
            return '-';
         when Directory_File =>
            return 'd';
         when Symlink_File =>
            return 'l';
         when Character_Device =>
            return 'c';
         when Block_Device =>
            return 'b';
         when FIFO_File =>
            return 'p';
         when Socket_File =>
            return 's';
      end case;
   end Kind_Char;

   function Kind_Label (Kind : File_Mode_Kind) return String is
   begin
      case Kind is
         when Mode_Only =>
            return "";
         when Regular_File =>
            return "file";
         when Directory_File =>
            return "directory";
         when Symlink_File =>
            return "symlink";
         when Character_Device =>
            return "character device";
         when Block_Device =>
            return "block device";
         when FIFO_File =>
            return "FIFO";
         when Socket_File =>
            return "socket";
      end case;
   end Kind_Label;

   function Symbolic_File_Mode
     (Mode : File_Mode_Value;
      Kind : File_Mode_Kind := Mode_Only)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;

      function Has_Bit (Bit : Natural) return Boolean is
        ((Natural (Mode) / Bit) mod 2 = 1);

      procedure Append_Triplet
        (Read_Bit    : Natural;
         Write_Bit   : Natural;
         Execute_Bit : Natural;
         Special_Bit : Natural;
         Special_Exec : Character;
         Special_No_Exec : Character)
      is
         Has_Execute : constant Boolean := Has_Bit (Execute_Bit);
      begin
         Append (Result, (if Has_Bit (Read_Bit) then 'r' else '-'));
         Append (Result, (if Has_Bit (Write_Bit) then 'w' else '-'));
         if Has_Bit (Special_Bit) then
            Append (Result, (if Has_Execute then Special_Exec else Special_No_Exec));
         else
            Append (Result, (if Has_Execute then 'x' else '-'));
         end if;
      end Append_Triplet;
   begin
      if Kind /= Mode_Only then
         Append (Result, Kind_Char (Kind));
      end if;

      Append_Triplet (8#0400#, 8#0200#, 8#0100#, 8#4000#, 's', 'S');
      Append_Triplet (8#0040#, 8#0020#, 8#0010#, 8#2000#, 's', 'S');
      Append_Triplet (8#0004#, 8#0002#, 8#0001#, 8#1000#, 't', 'T');
      return Ok (To_String (Result));
   end Symbolic_File_Mode;

   function Octal_Digit (Value : Natural) return Character is
     (Character'Val (Character'Pos ('0') + Value));

   function Octal_File_Mode
     (Mode            : File_Mode_Value;
      Include_Special : Boolean := False;
      Prefix          : Boolean := False)
      return Humanize.Status.Text_Result
   is
      Special : constant Natural := Mode / 8#1000#;
      Owner   : constant Natural := (Mode / 8#0100#) mod 8;
      Group   : constant Natural := (Mode / 8#0010#) mod 8;
      Other   : constant Natural := Mode mod 8;
      Result  : Unbounded_String;
   begin
      if Prefix and then (Special /= 0 or else not Include_Special) then
         Append (Result, "0");
      end if;
      if Include_Special or else Special /= 0 then
         Append (Result, Octal_Digit (Special));
      end if;
      Append (Result, Octal_Digit (Owner));
      Append (Result, Octal_Digit (Group));
      Append (Result, Octal_Digit (Other));
      return Ok (To_String (Result));
   end Octal_File_Mode;

   procedure Append_Permission_List
     (Result      : in out Unbounded_String;
      Mode        : File_Mode_Value;
      Read_Bit    : Natural;
      Write_Bit   : Natural;
      Execute_Bit : Natural)
   is
      Have : Boolean := False;

      function Has_Bit (Bit : Natural) return Boolean is
        ((Natural (Mode) / Bit) mod 2 = 1);

      procedure Add (Text : String) is
      begin
         if Have then
            Append (Result, "/");
         end if;
         Append (Result, Text);
         Have := True;
      end Add;
   begin
      if Has_Bit (Read_Bit) then
         Add ("read");
      end if;
      if Has_Bit (Write_Bit) then
         Add ("write");
      end if;
      if Has_Bit (Execute_Bit) then
         Add ("execute");
      end if;
      if not Have then
         Append (Result, "no access");
      end if;
   end Append_Permission_List;

   function File_Mode_Summary
     (Mode : File_Mode_Value;
      Kind : File_Mode_Kind := Mode_Only)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;

      function Has_Bit (Bit : Natural) return Boolean is
        ((Natural (Mode) / Bit) mod 2 = 1);
   begin
      if Kind /= Mode_Only then
         Append (Result, Kind_Label (Kind));
         Append (Result, ", ");
      end if;

      Append (Result, "owner ");
      Append_Permission_List (Result, Mode, 8#0400#, 8#0200#, 8#0100#);
      Append (Result, "; group ");
      Append_Permission_List (Result, Mode, 8#0040#, 8#0020#, 8#0010#);
      Append (Result, "; others ");
      Append_Permission_List (Result, Mode, 8#0004#, 8#0002#, 8#0001#);

      if Has_Bit (8#4000#) then
         Append (Result, "; setuid");
      end if;
      if Has_Bit (8#2000#) then
         Append (Result, "; setgid");
      end if;
      if Has_Bit (8#1000#) then
         Append (Result, "; sticky");
      end if;

      return Ok (To_String (Result));
   end File_Mode_Summary;

   function Kind_From_Char
     (Ch   : Character;
      Kind : out File_Mode_Kind)
      return Boolean
   is
   begin
      case Ch is
         when '-' =>
            Kind := Regular_File;
         when 'd' =>
            Kind := Directory_File;
         when 'l' =>
            Kind := Symlink_File;
         when 'c' =>
            Kind := Character_Device;
         when 'b' =>
            Kind := Block_Device;
         when 'p' =>
            Kind := FIFO_File;
         when 's' =>
            Kind := Socket_File;
         when others =>
            return False;
      end case;
      return True;
   end Kind_From_Char;

   function Parse_Octal_File_Mode
     (Text : String;
      Mode : out File_Mode_Value)
      return Boolean
   is
      Value : Natural := 0;
      First : Natural := Text'First;
   begin
      if Text'Length = 0 then
         return False;
      end if;
      if (Text'Length in 4 | 5) and then Text (Text'First) = '0' then
         First := Text'First + 1;
      end if;
      if Text'Last - First + 1 not in 3 | 4 then
         return False;
      end if;
      for Index in First .. Text'Last loop
         if Text (Index) not in '0' .. '7' then
            return False;
         end if;
         Value := Value * 8
           + Character'Pos (Text (Index)) - Character'Pos ('0');
      end loop;
      if Value > File_Mode_Value'Last then
         return False;
      end if;
      Mode := File_Mode_Value (Value);
      return True;
   end Parse_Octal_File_Mode;

   function Parse_Symbolic_File_Mode
     (Text : String;
      Mode : out File_Mode_Value;
      Kind : out File_Mode_Kind)
      return Boolean
   is
      Offset : Natural := 0;
      Value  : Natural := 0;

      function Has (Index : Natural; Ch : Character) return Boolean is
        (Text (Index) = Ch);

      function Parse_Execute
        (Index       : Natural;
         Execute_Bit : Natural;
         Special_Bit : Natural;
         Lower       : Character;
         Upper       : Character)
         return Boolean
      is
      begin
         case Text (Index) is
            when 'x' =>
               Value := Value + Execute_Bit;
            when '-' =>
               null;
            when others =>
               if Text (Index) = Lower then
                  Value := Value + Execute_Bit + Special_Bit;
               elsif Text (Index) = Upper then
                  Value := Value + Special_Bit;
               else
                  return False;
               end if;
         end case;
         return True;
      end Parse_Execute;
   begin
      Kind := Mode_Only;
      if Text'Length = 10 then
         if not Kind_From_Char (Text (Text'First), Kind) then
            return False;
         end if;
         Offset := 1;
      elsif Text'Length /= 9 then
         return False;
      end if;

      if Has (Text'First + Offset, 'r') then
         Value := Value + 8#0400#;
      elsif not Has (Text'First + Offset, '-') then
         return False;
      end if;
      if Has (Text'First + Offset + 1, 'w') then
         Value := Value + 8#0200#;
      elsif not Has (Text'First + Offset + 1, '-') then
         return False;
      end if;
      if not Parse_Execute
        (Text'First + Offset + 2, 8#0100#, 8#4000#, 's', 'S')
      then
         return False;
      end if;

      if Has (Text'First + Offset + 3, 'r') then
         Value := Value + 8#0040#;
      elsif not Has (Text'First + Offset + 3, '-') then
         return False;
      end if;
      if Has (Text'First + Offset + 4, 'w') then
         Value := Value + 8#0020#;
      elsif not Has (Text'First + Offset + 4, '-') then
         return False;
      end if;
      if not Parse_Execute
        (Text'First + Offset + 5, 8#0010#, 8#2000#, 's', 'S')
      then
         return False;
      end if;

      if Has (Text'First + Offset + 6, 'r') then
         Value := Value + 8#0004#;
      elsif not Has (Text'First + Offset + 6, '-') then
         return False;
      end if;
      if Has (Text'First + Offset + 7, 'w') then
         Value := Value + 8#0002#;
      elsif not Has (Text'First + Offset + 7, '-') then
         return False;
      end if;
      if not Parse_Execute
        (Text'First + Offset + 8, 8#0001#, 8#1000#, 't', 'T')
      then
         return False;
      end if;

      Mode := File_Mode_Value (Value);
      return True;
   end Parse_Symbolic_File_Mode;

   function Parse_File_Mode
     (Text : String;
      Mode : out File_Mode_Value;
      Kind : out File_Mode_Kind)
      return Humanize.Status.Status_Code
   is
   begin
      Mode := 0;
      Kind := Mode_Only;
      if Parse_Octal_File_Mode (Text, Mode) then
         return Humanize.Status.Ok;
      elsif Parse_Symbolic_File_Mode (Text, Mode, Kind) then
         return Humanize.Status.Ok;
      else
         return Humanize.Status.Invalid_Value;
      end if;
   end Parse_File_Mode;

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

      return Ok (To_String (Result));
   end Search_Key;

   function Padded_Natural
     (Value : Natural;
      Width : Positive)
      return String
   is
      Raw    : constant String := Natural'Image (Value);
      Image_Digits : constant String := Raw (Raw'First + 1 .. Raw'Last);
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

      return Ok (To_String (Result));
   end Natural_Sort_Key;

   function Natural_Less
     (Left  : String;
      Right : String)
      return Boolean
   is
      Left_Key  : constant String := To_String (Natural_Sort_Key (Left).Text);
      Right_Key : constant String := To_String (Natural_Sort_Key (Right).Text);
   begin
      return Left_Key < Right_Key;
   end Natural_Less;

   function Initials
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      New_Word : Boolean := True;
   begin
      for Ch of Text loop
         if Is_Alnum (Ch) then
            if New_Word then
               Append (Result, Upper (Ch));
               New_Word := False;
            end if;
         else
            New_Word := True;
         end if;
      end loop;
      return Ok (To_String (Result));
   end Initials;

   function Possessive
     (Text : String)
      return Humanize.Status.Text_Result is
   begin
      if Text'Length > 0 and then Lower (Text (Text'Last)) = 's' then
         return Ok (Text & "'");
      else
         return Ok (Text & "'s");
      end if;
   end Possessive;

   function Clean_Name
     (Text : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Normalize_Whitespace (Text);
   end Clean_Name;

   function Person_Initials
     (Text         : String;
      Max_Initials : Initial_Count_Limit := 3)
      return Humanize.Status.Text_Result
   is
      Clean : constant String := To_String (Clean_Name (Text).Text);
      Result : Unbounded_String;
      New_Word : Boolean := True;
      Count    : Natural := 0;
   begin
      for Ch of Clean loop
         if Is_Alnum (Ch) then
            if New_Word and then (Max_Initials = 0 or else Count < Max_Initials)
            then
               Append (Result, Upper (Ch));
               Count := Count + 1;
            end if;
            New_Word := False;
         else
            New_Word := True;
         end if;
      end loop;
      return Ok (To_String (Result));
   end Person_Initials;

   function Comma_Index (Text : String) return Natural is
   begin
      for Index in Text'Range loop
         if Text (Index) = ',' then
            return Index;
         end if;
      end loop;
      return 0;
   end Comma_Index;

   function First_Token (Text : String) return String is
   begin
      for Index in Text'Range loop
         if Text (Index) = ' ' then
            return Text (Text'First .. Index - 1);
         end if;
      end loop;
      return Text;
   end First_Token;

   function Last_Token (Text : String) return String is
   begin
      for Index in reverse Text'Range loop
         if Text (Index) = ' ' then
            return Text (Index + 1 .. Text'Last);
         end if;
      end loop;
      return Text;
   end Last_Token;

   function Reordered_Name
     (Text  : String;
      Order : Name_Order)
      return String
   is
      Comma : constant Natural := Comma_Index (Text);
   begin
      if Order = Family_Given_Order and then Comma > Text'First then
         declare
            Family : constant String := Text (Text'First .. Comma - 1);
            Given  : constant String :=
              (if Comma < Text'Last then Text (Comma + 1 .. Text'Last) else "");
         begin
            return To_String (Clean_Name (Given & " " & Family).Text);
         end;
      else
         return Text;
      end if;
   end Reordered_Name;

   function Name_Part
     (Text    : String;
      Style   : Name_Display_Style;
      Options : Person_Name_Options := Default_Person_Name_Options)
      return Humanize.Status.Text_Result
   is
      Clean : constant String := To_String (Clean_Name (Text).Text);
      Comma : constant Natural := Comma_Index (Clean);
      Full  : constant String := Reordered_Name (Clean, Options.Order);
   begin
      if Clean'Length = 0 then
         return Ok ("");
      end if;

      case Style is
         when Display_Full_Name =>
            return Ok (Full);
         when Display_Given_Name =>
            if Options.Order = Family_Given_Order and then Comma > 0 then
               return Ok
                 (First_Token
                    (To_String
                       (Clean_Name (Clean (Comma + 1 .. Clean'Last)).Text)));
            else
               return Ok (First_Token (Full));
            end if;
         when Display_Family_Name =>
            if Options.Order = Family_Given_Order and then Comma > 0 then
               return Ok
                 (To_String
                    (Clean_Name (Clean (Clean'First .. Comma - 1)).Text));
            else
               return Ok (Last_Token (Full));
            end if;
         when Display_Initials =>
            return Person_Initials (Full, Options.Max_Initials);
         when Display_Handle =>
            return Handle_Label (Clean, Options.Preserve_Handle_At);
      end case;
   end Name_Part;

   function Handle_Label
     (Handle      : String;
      Preserve_At : Boolean := True)
      return Humanize.Status.Text_Result
   is
      Clean : constant String := To_String (Clean_Name (Handle).Text);
   begin
      if Clean'Length = 0 then
         return Ok ("");
      elsif Preserve_At then
         if Clean (Clean'First) = '@' then
            return Ok (Clean);
         else
            return Ok ("@" & Clean);
         end if;
      elsif Clean (Clean'First) = '@' then
         if Clean'Length = 1 then
            return Ok ("");
         else
            return Ok (Clean (Clean'First + 1 .. Clean'Last));
         end if;
      else
         return Ok (Clean);
      end if;
   end Handle_Label;

   function Email_Local_Part
     (Email : String)
      return Humanize.Status.Text_Result
   is
      Clean : constant String := To_String (Clean_Name (Email).Text);
   begin
      for Index in Clean'Range loop
         if Clean (Index) = '@' then
            if Index = Clean'First then
               return Ok ("");
            else
               return Ok (Clean (Clean'First .. Index - 1));
            end if;
         end if;
      end loop;
      return Ok (Clean);
   end Email_Local_Part;

   function Display_Name
     (Name     : String;
      Handle   : String := "";
      Email    : String := "";
      Fallback : String := "Anonymous";
      Options  : Person_Name_Options := Default_Person_Name_Options)
      return Humanize.Status.Text_Result
   is
      Preferred : constant String :=
        (if Options.Style = Display_Handle then ""
         else To_String (Name_Part (Name, Options.Style, Options).Text));
      Handle_Text : constant String :=
        To_String (Handle_Label (Handle, Options.Preserve_Handle_At).Text);
      Email_Text : constant String := To_String (Email_Local_Part (Email).Text);
      Clean_Fallback : constant String :=
        To_String (Clean_Name (Fallback).Text);
   begin
      if Options.Style = Display_Handle and then Handle_Text'Length > 0 then
         return Ok (Handle_Text);
      elsif Preferred'Length > 0 then
         return Ok (Preferred);
      elsif Handle_Text'Length > 0 then
         return Ok (Handle_Text);
      elsif Email_Text'Length > 0 then
         return Ok (Email_Text);
      else
         return Ok (Clean_Fallback);
      end if;
   end Display_Name;

   function Possessive_Name
     (Name     : String;
      Fallback : String := "someone")
      return Humanize.Status.Text_Result
   is
      Clean : constant String := To_String (Clean_Name (Name).Text);
   begin
      if Clean'Length = 0 then
         return Possessive (To_String (Clean_Name (Fallback).Text));
      else
         return Possessive (Clean);
      end if;
   end Possessive_Name;

   procedure Append_Person_Separator
     (Result : in out Unbounded_String;
      Index  : Positive;
      Total  : Positive)
   is
   begin
      if Index = 1 then
         null;
      elsif Index = Total then
         Append (Result, " and ");
      else
         Append (Result, ", ");
      end if;
   end Append_Person_Separator;

   function Person_List
     (Names    : Name_List;
      Limit    : Positive := 2;
      Fallback : String := "no one")
      return Humanize.Status.Text_Result
   is
      Clean_Count : Natural := 0;
      Visible     : Natural;
      Hidden      : Natural;
      Written     : Natural := 0;
      Result      : Unbounded_String;
   begin
      for Name of Names loop
         if Length (Clean_Name (To_String (Name)).Text) > 0 then
            Clean_Count := Clean_Count + 1;
         end if;
      end loop;

      if Clean_Count = 0 then
         return Ok (To_String (Clean_Name (Fallback).Text));
      end if;

      Visible := Natural'Min (Clean_Count, Limit);
      Hidden := Clean_Count - Visible;

      for Name of Names loop
         declare
            Clean : constant String :=
              To_String (Clean_Name (To_String (Name)).Text);
         begin
            if Clean'Length > 0 and then Written < Visible then
               Written := Written + 1;
               if Hidden > 0 then
                  if Written > 1 then
                     Append (Result, ", ");
                  end if;
               else
                  Append_Person_Separator (Result, Written, Visible);
               end if;
               Append (Result, Clean);
            end if;
         end;
      end loop;

      if Hidden > 0 then
         Append
           (Result,
            " and " & Natural_Text (Hidden)
            & (if Hidden = 1 then " other" else " others"));
      end if;

      return Ok (To_String (Result));
   end Person_List;

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
      return Ok (To_String (Result));
   end Transliterate_ASCII;

   function Ends_With
     (Text   : String;
      Suffix : String)
      return Boolean
   is
   begin
      return Text'Length >= Suffix'Length
        and then Text (Text'Last - Suffix'Length + 1 .. Text'Last) = Suffix;
   end Ends_With;

   function Lower_ASCII (Text : String) return String is
      Result : String (Text'Range);
   begin
      for Index in Text'Range loop
         Result (Index) := Lower (Text (Index));
      end loop;
      return Result;
   end Lower_ASCII;

   function Upper_ASCII (Text : String) return String is
      Result : String (Text'Range);
   begin
      for Index in Text'Range loop
         if Text (Index) in 'a' .. 'z' then
            Result (Index) :=
              Character'Val
                (Character'Pos (Text (Index)) - Character'Pos ('a')
                 + Character'Pos ('A'));
         else
            Result (Index) := Text (Index);
         end if;
      end loop;
      return Result;
   end Upper_ASCII;

   function Is_ASCII_Letter (Ch : Character) return Boolean is
     ((Ch in 'a' .. 'z') or else (Ch in 'A' .. 'Z'));

   function Is_All_Upper_Word (Word : String) return Boolean is
      Has_Letter : Boolean := False;
   begin
      for Ch of Word loop
         if Ch in 'a' .. 'z' then
            return False;
         elsif Ch in 'A' .. 'Z' then
            Has_Letter := True;
         end if;
      end loop;
      return Has_Letter;
   end Is_All_Upper_Word;

   function Is_Title_Word (Word : String) return Boolean is
      Seen_First : Boolean := False;
   begin
      for Ch of Word loop
         if Is_ASCII_Letter (Ch) then
            if not Seen_First then
               if not (Ch in 'A' .. 'Z') then
                  return False;
               end if;
               Seen_First := True;
            elsif Ch in 'A' .. 'Z' then
               return False;
            end if;
         end if;
      end loop;
      return Seen_First;
   end Is_Title_Word;

   function Match_Case
     (Original : String;
      Lowered  : String)
      return String
   is
   begin
      if Is_All_Upper_Word (Original) then
         return Upper_ASCII (Lowered);
      elsif Is_Title_Word (Original) and then Lowered'Length > 0 then
         if Lowered'Length = 1 then
            return Upper_ASCII (Lowered);
         else
            return Upper_ASCII (Lowered (Lowered'First .. Lowered'First))
              & Lowered (Lowered'First + 1 .. Lowered'Last);
         end if;
      else
         return Lowered;
      end if;
   end Match_Case;

   function Inflection_Key (Word : String) return String is
     (Lower_ASCII (To_String (Parameterize (Word, '_').Text)));

   function Is_Uncountable_Noun (Word : String) return Boolean is
      Low : constant String := Inflection_Key (Word);
   begin
      return Low = "advice" or else Low = "aircraft" or else Low = "bison"
        or else Low = "bread" or else Low = "deer" or else Low = "equipment"
        or else Low = "fish" or else Low = "furniture"
        or else Low = "gold" or else Low = "information"
        or else Low = "jewelry" or else Low = "knowledge"
        or else Low = "luggage" or else Low = "metadata"
        or else Low = "money"
        or else Low = "moose" or else Low = "news"
        or else Low = "rice" or else Low = "series"
        or else Low = "sheep" or else Low = "species"
        or else Low = "software" or else Low = "swine"
        or else Low = "traffic";
   end Is_Uncountable_Noun;

   function Irregular_Plural (Word : String) return String is
      Low : constant String := Inflection_Key (Word);
   begin
      if Low = "person" then
         return Match_Case (Word, "people");
      elsif Low = "man" then
         return Match_Case (Word, "men");
      elsif Low = "woman" then
         return Match_Case (Word, "women");
      elsif Low = "child" then
         return Match_Case (Word, "children");
      elsif Low = "mouse" then
         return Match_Case (Word, "mice");
      elsif Low = "goose" then
         return Match_Case (Word, "geese");
      elsif Low = "tooth" then
         return Match_Case (Word, "teeth");
      elsif Low = "foot" then
         return Match_Case (Word, "feet");
      elsif Low = "ox" then
         return Match_Case (Word, "oxen");
      elsif Low = "louse" then
         return Match_Case (Word, "lice");
      elsif Low = "die" then
         return Match_Case (Word, "dice");
      elsif Low = "brother" then
         return Match_Case (Word, "brethren");
      elsif Low = "cow" then
         return Match_Case (Word, "kine");
      elsif Low = "salesman" then
         return Match_Case (Word, "salesmen");
      elsif Low = "policeman" then
         return Match_Case (Word, "policemen");
      elsif Low = "policewoman" then
         return Match_Case (Word, "policewomen");
      elsif Low = "fireman" then
         return Match_Case (Word, "firemen");
      elsif Low = "firewoman" then
         return Match_Case (Word, "firewomen");
      elsif Low = "corpus" then
         return Match_Case (Word, "corpora");
      elsif Low = "genus" then
         return Match_Case (Word, "genera");
      elsif Low = "opus" then
         return Match_Case (Word, "opera");
      elsif Low = "viscus" then
         return Match_Case (Word, "viscera");
      elsif Low = "schema" then
         return Match_Case (Word, "schemata");
      elsif Low = "stigma" then
         return Match_Case (Word, "stigmata");
      elsif Low = "lemma" then
         return Match_Case (Word, "lemmata");
      elsif Low = "nebula" then
         return Match_Case (Word, "nebulae");
      elsif Low = "vertebra" then
         return Match_Case (Word, "vertebrae");
      else
         return "";
      end if;
   end Irregular_Plural;

   function Irregular_Singular (Word : String) return String is
      Low : constant String := Inflection_Key (Word);
   begin
      if Low = "people" then
         return Match_Case (Word, "person");
      elsif Low = "men" then
         return Match_Case (Word, "man");
      elsif Low = "women" then
         return Match_Case (Word, "woman");
      elsif Low = "children" then
         return Match_Case (Word, "child");
      elsif Low = "mice" then
         return Match_Case (Word, "mouse");
      elsif Low = "geese" then
         return Match_Case (Word, "goose");
      elsif Low = "teeth" then
         return Match_Case (Word, "tooth");
      elsif Low = "feet" then
         return Match_Case (Word, "foot");
      elsif Low = "oxen" then
         return Match_Case (Word, "ox");
      elsif Low = "lice" then
         return Match_Case (Word, "louse");
      elsif Low = "dice" then
         return Match_Case (Word, "die");
      elsif Low = "brethren" then
         return Match_Case (Word, "brother");
      elsif Low = "kine" then
         return Match_Case (Word, "cow");
      elsif Low = "salesmen" then
         return Match_Case (Word, "salesman");
      elsif Low = "policemen" then
         return Match_Case (Word, "policeman");
      elsif Low = "policewomen" then
         return Match_Case (Word, "policewoman");
      elsif Low = "firemen" then
         return Match_Case (Word, "fireman");
      elsif Low = "firewomen" then
         return Match_Case (Word, "firewoman");
      elsif Low = "corpora" then
         return Match_Case (Word, "corpus");
      elsif Low = "genera" then
         return Match_Case (Word, "genus");
      elsif Low = "opera" then
         return Match_Case (Word, "opus");
      elsif Low = "viscera" then
         return Match_Case (Word, "viscus");
      elsif Low = "schemata" then
         return Match_Case (Word, "schema");
      elsif Low = "stigmata" then
         return Match_Case (Word, "stigma");
      elsif Low = "lemmata" then
         return Match_Case (Word, "lemma");
      elsif Low = "nebulae" then
         return Match_Case (Word, "nebula");
      elsif Low = "vertebrae" then
         return Match_Case (Word, "vertebra");
      else
         return "";
      end if;
   end Irregular_Singular;

   function Needs_Oes_Plural (Low : String) return Boolean is
     (Low = "echo" or else Low = "embargo" or else Low = "hero"
      or else Low = "potato" or else Low = "tomato" or else Low = "torpedo"
      or else Low = "veto");

   function Last_Character (Text : String) return Character is
   begin
      if Text'Length = 0 then
         return ASCII.NUL;
      else
         return Text (Text'Last);
      end if;
   end Last_Character;

   function Is_ASCII_Vowel (Ch : Character) return Boolean is
      Low : constant Character := Lower (Ch);
   begin
      return Low = 'a' or else Low = 'e' or else Low = 'i'
        or else Low = 'o' or else Low = 'u';
   end Is_ASCII_Vowel;

   function Remove_Last
     (Word  : String;
      Count : Natural)
      return String
   is
   begin
      if Count = 0 then
         return Word;
      elsif Count >= Word'Length then
         return "";
      else
         return Word (Word'First .. Word'Last - Count);
      end if;
   end Remove_Last;

   function Language_Irregular_Plural
     (Word     : String;
      Language : Inflection_Language)
      return String
   is
      Low : constant String := Inflection_Key (Word);
   begin
      case Language is
         when English_Inflection =>
            return Irregular_Plural (Word);
         when Danish_Inflection =>
            if Low = "barn" then
               return Match_Case (Word, "born");
            elsif Low = "mand" then
               return Match_Case (Word, "maend");
            end if;
         when German_Inflection =>
            if Low = "kind" then
               return Match_Case (Word, "kinder");
            elsif Low = "mann" then
               return Match_Case (Word, "maenner");
            elsif Low = "frau" then
               return Match_Case (Word, "frauen");
            elsif Low = "datum" then
               return Match_Case (Word, "daten");
            end if;
         when French_Inflection =>
            if Low = "cheval" then
               return Match_Case (Word, "chevaux");
            elsif Low = "travail" then
               return Match_Case (Word, "travaux");
            elsif Low = "oeil" then
               return Match_Case (Word, "yeux");
            end if;
         when Spanish_Inflection =>
            if Low = "luz" then
               return Match_Case (Word, "luces");
            elsif Low = "juez" then
               return Match_Case (Word, "jueces");
            end if;
         when Italian_Inflection =>
            if Low = "uomo" then
               return Match_Case (Word, "uomini");
            elsif Low = "uovo" then
               return Match_Case (Word, "uova");
            end if;
         when Portuguese_Inflection =>
            if Low = "mao" then
               return Match_Case (Word, "maos");
            elsif Low = "homem" then
               return Match_Case (Word, "homens");
            end if;
         when Dutch_Inflection =>
            if Low = "kind" then
               return Match_Case (Word, "kinderen");
            elsif Low = "stad" then
               return Match_Case (Word, "steden");
            end if;
         when Swedish_Inflection =>
            if Low = "barn" then
               return Match_Case (Word, "barn");
            elsif Low = "man" then
               return Match_Case (Word, "maen");
            end if;
         when Norwegian_Inflection | Norwegian_Bokmal_Inflection =>
            if Low = "barn" then
               return Match_Case (Word, "barn");
            elsif Low = "mann" then
               return Match_Case (Word, "menn");
            end if;
         when Finnish_Inflection | Turkish_Inflection =>
            null;
      end case;
      return "";
   end Language_Irregular_Plural;

   function Language_Irregular_Singular
     (Word     : String;
      Language : Inflection_Language)
      return String
   is
      Low : constant String := Inflection_Key (Word);
   begin
      case Language is
         when English_Inflection =>
            return Irregular_Singular (Word);
         when Danish_Inflection =>
            if Low = "born" then
               return Match_Case (Word, "barn");
            elsif Low = "maend" then
               return Match_Case (Word, "mand");
            end if;
         when German_Inflection =>
            if Low = "kinder" then
               return Match_Case (Word, "kind");
            elsif Low = "maenner" then
               return Match_Case (Word, "mann");
            elsif Low = "frauen" then
               return Match_Case (Word, "frau");
            elsif Low = "daten" then
               return Match_Case (Word, "datum");
            end if;
         when French_Inflection =>
            if Low = "chevaux" then
               return Match_Case (Word, "cheval");
            elsif Low = "travaux" then
               return Match_Case (Word, "travail");
            elsif Low = "yeux" then
               return Match_Case (Word, "oeil");
            end if;
         when Spanish_Inflection =>
            if Low = "luces" then
               return Match_Case (Word, "luz");
            elsif Low = "jueces" then
               return Match_Case (Word, "juez");
            end if;
         when Italian_Inflection =>
            if Low = "uomini" then
               return Match_Case (Word, "uomo");
            elsif Low = "uova" then
               return Match_Case (Word, "uovo");
            end if;
         when Portuguese_Inflection =>
            if Low = "maos" then
               return Match_Case (Word, "mao");
            elsif Low = "homens" then
               return Match_Case (Word, "homem");
            end if;
         when Dutch_Inflection =>
            if Low = "kinderen" then
               return Match_Case (Word, "kind");
            elsif Low = "steden" then
               return Match_Case (Word, "stad");
            end if;
         when Swedish_Inflection =>
            if Low = "barn" then
               return Match_Case (Word, "barn");
            elsif Low = "maen" then
               return Match_Case (Word, "man");
            end if;
         when Norwegian_Inflection | Norwegian_Bokmal_Inflection =>
            if Low = "barn" then
               return Match_Case (Word, "barn");
            elsif Low = "menn" then
               return Match_Case (Word, "mann");
            end if;
         when Finnish_Inflection | Turkish_Inflection =>
            null;
      end case;
      return "";
   end Language_Irregular_Singular;

   function Pluralize
     (Word : String)
      return Humanize.Status.Text_Result
   is
      Low : constant String := Inflection_Key (Word);
      Hit : constant String := Irregular_Plural (Word);
   begin
      if Hit'Length > 0 then
         return Ok (Hit);
      elsif Is_Uncountable_Noun (Word) then
         return Ok (Word);
      end if;

      if Ends_With (Low, "quiz") then
         return Ok (Word & "zes");
      elsif Ends_With (Low, "is") and then Word'Length > 2 then
         return Ok (Word (Word'First .. Word'Last - 2) & "es");
      elsif Ends_With (Low, "on") and then Word'Length > 2
        and then
          (Low = "criterion" or else Low = "phenomenon"
           or else Low = "automaton")
      then
         return Ok (Word (Word'First .. Word'Last - 2) & "a");
      elsif Ends_With (Low, "um") and then Word'Length > 2
        and then
          (Low = "bacterium" or else Low = "curriculum"
           or else Low = "datum" or else Low = "medium"
           or else Low = "memorandum" or else Low = "stratum")
      then
         return Ok (Word (Word'First .. Word'Last - 2) & "a");
      elsif Ends_With (Low, "us") and then Word'Length > 2
        and then
          (Low = "alumnus" or else Low = "cactus"
           or else Low = "focus" or else Low = "fungus"
           or else Low = "nucleus" or else Low = "radius"
           or else Low = "stimulus" or else Low = "syllabus")
      then
         return Ok (Word (Word'First .. Word'Last - 2) & "i");
      elsif (Ends_With (Low, "ex") or else Ends_With (Low, "ix"))
        and then Word'Length > 2
        and then
          (Low = "appendix" or else Low = "index"
           or else Low = "matrix" or else Low = "vertex")
      then
         return Ok (Word (Word'First .. Word'Last - 2) & "ices");
      elsif Ends_With (Low, "a") and then Low = "formula" then
         return Ok (Word & "e");
      end if;

      if Ends_With (Low, "y") and then Word'Length > 1 then
         declare
            Prev : constant Character := Low (Low'Last - 1);
         begin
            if Prev /= 'a' and then Prev /= 'e' and then Prev /= 'i'
              and then Prev /= 'o' and then Prev /= 'u'
            then
               return Ok (Word (Word'First .. Word'Last - 1) & "ies");
            end if;
         end;
      end if;

      if Ends_With (Low, "fe") and then Word'Length > 2
        and then
          (Low = "knife" or else Low = "life" or else Low = "wife")
      then
         return Ok (Word (Word'First .. Word'Last - 2) & "ves");
      elsif Ends_With (Low, "f") and then Word'Length > 1
        and then
          (Low = "calf" or else Low = "elf" or else Low = "half"
           or else Low = "leaf" or else Low = "loaf" or else Low = "self"
           or else Low = "shelf" or else Low = "thief" or else Low = "wolf")
      then
         return Ok (Word (Word'First .. Word'Last - 1) & "ves");
      elsif Needs_Oes_Plural (Low) then
         return Ok (Word & "es");
      elsif Ends_With (Low, "s") or else Ends_With (Low, "x")
        or else Ends_With (Low, "z") or else Ends_With (Low, "ch")
        or else Ends_With (Low, "sh")
      then
         return Ok (Word & "es");
      else
         return Ok (Word & "s");
      end if;
   end Pluralize;

   function Word_Position
     (List : String;
      Word : String)
      return Natural
   is
      Item : Unbounded_String;
      Pos  : Natural := 0;

      procedure Flush (Found : in out Natural) is
         Raw : constant String := To_String (Item);
         Low : Unbounded_String;
      begin
         if Raw'Length > 0 then
            Pos := Pos + 1;
            for Ch of Raw loop
               Append (Low, Lower (Ch));
            end loop;
            if To_String (Low) = Word then
               Found := Pos;
            end if;
         end if;
         Item := Null_Unbounded_String;
      end Flush;

      Found : Natural := 0;
   begin
      for Ch of List loop
         if Ch = ',' or else Ch = ' ' or else Ch = ASCII.HT or else Ch = ASCII.LF then
            Flush (Found);
            exit when Found /= 0;
         else
            Append (Item, Ch);
         end if;
      end loop;
      if Found = 0 then
         Flush (Found);
      end if;
      return Found;
   end Word_Position;

   function Word_At
     (List     : String;
      Position : Natural)
      return String
   is
      Item : Unbounded_String;
      Pos  : Natural := 0;

      procedure Flush (Result : in out Unbounded_String) is
      begin
         if Length (Item) > 0 then
            Pos := Pos + 1;
            if Pos = Position then
               Result := Item;
            end if;
         end if;
         Item := Null_Unbounded_String;
      end Flush;

      Result : Unbounded_String;
   begin
      if Position = 0 then
         return "";
      end if;

      for Ch of List loop
         if Ch = ',' or else Ch = ' ' or else Ch = ASCII.HT or else Ch = ASCII.LF then
            Flush (Result);
            exit when Length (Result) > 0;
         else
            Append (Item, Ch);
         end if;
      end loop;
      if Length (Result) = 0 then
         Flush (Result);
      end if;
      return To_String (Result);
   end Word_At;

   function Pluralize_With_Dictionary
     (Word      : String;
      Singulars : String;
      Plurals   : String)
      return Humanize.Status.Text_Result
   is
      Low : constant String := To_String (Parameterize (Word, '_').Text);
      Pos : constant Natural := Word_Position (Singulars, Low);
      Hit : constant String := Word_At (Plurals, Pos);
   begin
      if Hit'Length > 0 then
         return Ok (Hit);
      else
         return Pluralize (Word);
      end if;
   end Pluralize_With_Dictionary;

   function Singularize
     (Word : String)
      return Humanize.Status.Text_Result
   is
      Low : constant String := Inflection_Key (Word);
      Hit : constant String := Irregular_Singular (Word);
   begin
      if Hit'Length > 0 then
         return Ok (Hit);
      elsif Is_Uncountable_Noun (Word) then
         return Ok (Word);
      end if;

      if Ends_With (Low, "quizzes") and then Word'Length > 6 then
         return Ok (Word (Word'First .. Word'Last - 3));
      elsif Ends_With (Low, "yses") and then Word'Length > 4 then
         return Ok (Word (Word'First .. Word'Last - 2) & "is");
      elsif Ends_With (Low, "ses") and then Word'Length > 3
        and then
          (Low = "analyses" or else Low = "axes" or else Low = "bases"
           or else Low = "crises" or else Low = "diagnoses"
           or else Low = "emphases" or else Low = "oases"
           or else Low = "parentheses" or else Low = "synopses"
           or else Low = "theses")
      then
         return Ok (Word (Word'First .. Word'Last - 2) & "is");
      elsif Ends_With (Low, "a") and then Word'Length > 1
        and then
          (Low = "automata" or else Low = "bacteria"
           or else Low = "criteria" or else Low = "curricula"
           or else Low = "data" or else Low = "media"
           or else Low = "memoranda" or else Low = "phenomena"
           or else Low = "strata")
      then
         if Low = "criteria" then
            return Ok (Match_Case (Word, "criterion"));
         elsif Low = "phenomena" then
            return Ok (Match_Case (Word, "phenomenon"));
         elsif Low = "automata" then
            return Ok (Match_Case (Word, "automaton"));
         elsif Low = "media" then
            return Ok (Match_Case (Word, "medium"));
         else
            return Ok (Word (Word'First .. Word'Last - 1) & "um");
         end if;
      elsif Ends_With (Low, "i") and then Word'Length > 1
        and then
          (Low = "alumni" or else Low = "cacti"
           or else Low = "foci" or else Low = "fungi"
           or else Low = "nuclei" or else Low = "radii"
           or else Low = "stimuli" or else Low = "syllabi")
      then
         if Low = "alumni" then
            return Ok (Match_Case (Word, "alumnus"));
         elsif Low = "cacti" then
            return Ok (Match_Case (Word, "cactus"));
         elsif Low = "foci" then
            return Ok (Match_Case (Word, "focus"));
         elsif Low = "fungi" then
            return Ok (Match_Case (Word, "fungus"));
         elsif Low = "nuclei" then
            return Ok (Match_Case (Word, "nucleus"));
         elsif Low = "radii" then
            return Ok (Match_Case (Word, "radius"));
         elsif Low = "stimuli" then
            return Ok (Match_Case (Word, "stimulus"));
         else
            return Ok (Match_Case (Word, "syllabus"));
         end if;
      elsif Ends_With (Low, "ices") and then Word'Length > 4
        and then
          (Low = "appendices" or else Low = "indices"
           or else Low = "matrices" or else Low = "vertices")
      then
         if Low = "appendices" then
            return Ok (Match_Case (Word, "appendix"));
         elsif Low = "indices" then
            return Ok (Match_Case (Word, "index"));
         elsif Low = "matrices" then
            return Ok (Match_Case (Word, "matrix"));
         else
            return Ok (Match_Case (Word, "vertex"));
         end if;
      elsif Ends_With (Low, "formulae") and then Word'Length > 7 then
         return Ok (Word (Word'First .. Word'Last - 1));
      elsif Ends_With (Low, "ies") and then Word'Length > 3 then
         return Ok (Word (Word'First .. Word'Last - 3) & "y");
      elsif Ends_With (Low, "ves") and then Word'Length > 3 then
         declare
            Stem : constant String := Low (Low'First .. Low'Last - 3);
            Original_Stem : constant String := Word (Word'First .. Word'Last - 3);
         begin
            if Stem = "kni" then
               return Ok (Match_Case (Word, "knife"));
            elsif Stem = "li" then
               return Ok (Match_Case (Word, "life"));
            elsif Stem = "wi" then
               return Ok (Match_Case (Word, "wife"));
            elsif Stem = "cal" or else Stem = "el" or else Stem = "hal"
              or else Stem = "lea" or else Stem = "loa" or else Stem = "sel"
              or else Stem = "shel" or else Stem = "thie" or else Stem = "wol"
            then
               return Ok (Original_Stem & "f");
            end if;
         end;
      elsif Ends_With (Low, "oes") and then Word'Length > 3 then
         declare
            Stem : constant String := Low (Low'First .. Low'Last - 2);
         begin
            if Needs_Oes_Plural (Stem) then
               return Ok (Word (Word'First .. Word'Last - 2));
            end if;
         end;
      elsif Ends_With (Low, "es") and then Word'Length > 2 then
         declare
            Stem : constant String := Word (Word'First .. Word'Last - 2);
            Low_Stem : constant String := Low (Low'First .. Low'Last - 2);
         begin
            if Ends_With (Low_Stem, "s") or else Ends_With (Low_Stem, "x")
              or else Ends_With (Low_Stem, "z") or else Ends_With (Low_Stem, "ch")
              or else Ends_With (Low_Stem, "sh")
            then
               return Ok (Stem);
            end if;
         end;
      end if;

      if Ends_With (Low, "s") and then Word'Length > 1 then
         return Ok (Word (Word'First .. Word'Last - 1));
      else
         return Ok (Word);
      end if;
   end Singularize;

   function Pluralize_In_Language
     (Word     : String;
      Language : Inflection_Language)
      return Humanize.Status.Text_Result
   is
      Low : constant String := Inflection_Key (Word);
      Hit : constant String := Language_Irregular_Plural (Word, Language);
   begin
      if Hit'Length > 0 then
         return Ok (Hit);
      end if;

      case Language is
         when English_Inflection =>
            return Pluralize (Word);
         when Danish_Inflection | Norwegian_Inflection
            | Norwegian_Bokmal_Inflection =>
            if Ends_With (Low, "e") then
               return Ok (Word & "r");
            else
               return Ok (Word & "er");
            end if;
         when German_Inflection =>
            if Ends_With (Low, "e") then
               return Ok (Word & "n");
            elsif Ends_With (Low, "er") or else Ends_With (Low, "el")
              or else Ends_With (Low, "en") or else Ends_With (Low, "chen")
              or else Ends_With (Low, "lein")
            then
               return Ok (Word);
            elsif Ends_With (Low, "a") or else Ends_With (Low, "i")
              or else Ends_With (Low, "o") or else Ends_With (Low, "u")
              or else Ends_With (Low, "y")
            then
               return Ok (Word & "s");
            else
               return Ok (Word & "e");
            end if;
         when French_Inflection =>
            if Ends_With (Low, "s") or else Ends_With (Low, "x")
              or else Ends_With (Low, "z")
            then
               return Ok (Word);
            elsif Ends_With (Low, "al") and then Word'Length > 2 then
               return Ok (Remove_Last (Word, 2) & "aux");
            elsif Ends_With (Low, "au") or else Ends_With (Low, "eau")
              or else Ends_With (Low, "eu")
            then
               return Ok (Word & "x");
            else
               return Ok (Word & "s");
            end if;
         when Spanish_Inflection =>
            if Ends_With (Low, "z") and then Word'Length > 1 then
               return Ok (Remove_Last (Word, 1) & "ces");
            elsif Is_ASCII_Vowel (Last_Character (Low)) then
               return Ok (Word & "s");
            else
               return Ok (Word & "es");
            end if;
         when Italian_Inflection =>
            if Ends_With (Low, "ca") and then Word'Length > 2 then
               return Ok (Remove_Last (Word, 2) & "che");
            elsif Ends_With (Low, "ga") and then Word'Length > 2 then
               return Ok (Remove_Last (Word, 2) & "ghe");
            elsif Ends_With (Low, "co") and then Word'Length > 2 then
               return Ok (Remove_Last (Word, 2) & "chi");
            elsif Ends_With (Low, "go") and then Word'Length > 2 then
               return Ok (Remove_Last (Word, 2) & "ghi");
            elsif Ends_With (Low, "o") and then Word'Length > 1 then
               return Ok (Remove_Last (Word, 1) & "i");
            elsif Ends_With (Low, "a") and then Word'Length > 1 then
               return Ok (Remove_Last (Word, 1) & "e");
            elsif Ends_With (Low, "e") and then Word'Length > 1 then
               return Ok (Remove_Last (Word, 1) & "i");
            else
               return Ok (Word);
            end if;
         when Portuguese_Inflection =>
            if Ends_With (Low, "cao") and then Word'Length > 3 then
               return Ok (Remove_Last (Word, 3) & "coes");
            elsif Ends_With (Low, "al") or else Ends_With (Low, "el")
              or else Ends_With (Low, "ol") or else Ends_With (Low, "ul")
            then
               return Ok (Remove_Last (Word, 1) & "is");
            elsif Ends_With (Low, "m") and then Word'Length > 1 then
               return Ok (Remove_Last (Word, 1) & "ns");
            elsif Ends_With (Low, "r") or else Ends_With (Low, "z") then
               return Ok (Word & "es");
            elsif Is_ASCII_Vowel (Last_Character (Low)) then
               return Ok (Word & "s");
            else
               return Ok (Word & "es");
            end if;
         when Dutch_Inflection =>
            if Ends_With (Low, "s") or else Ends_With (Low, "x") then
               return Ok (Word);
            elsif Ends_With (Low, "e") then
               return Ok (Word & "n");
            else
               return Ok (Word & "en");
            end if;
         when Swedish_Inflection =>
            if Ends_With (Low, "a") and then Word'Length > 1 then
               return Ok (Remove_Last (Word, 1) & "or");
            elsif Ends_With (Low, "e") and then Word'Length > 1 then
               return Ok (Word & "r");
            else
               return Ok (Word & "ar");
            end if;
         when Finnish_Inflection =>
            if Ends_With (Low, "t") then
               return Ok (Word);
            else
               return Ok (Word & "t");
            end if;
         when Turkish_Inflection =>
            declare
               Last_Vowel : Character := ASCII.NUL;
            begin
               for Ch of Low loop
                  if Ch = 'a' or else Ch = 'e' or else Ch = 'i'
                    or else Ch = 'o' or else Ch = 'u'
                  then
                     Last_Vowel := Ch;
                  end if;
               end loop;

               if Last_Vowel = 'e' or else Last_Vowel = 'i' then
                  return Ok (Word & "ler");
               else
                  return Ok (Word & "lar");
               end if;
            end;
      end case;
   end Pluralize_In_Language;

   function Singularize_In_Language
     (Word     : String;
      Language : Inflection_Language)
      return Humanize.Status.Text_Result
   is
      Low : constant String := Inflection_Key (Word);
      Hit : constant String := Language_Irregular_Singular (Word, Language);
   begin
      if Hit'Length > 0 then
         return Ok (Hit);
      end if;

      case Language is
         when English_Inflection =>
            return Singularize (Word);
         when Danish_Inflection | Norwegian_Inflection
            | Norwegian_Bokmal_Inflection =>
            if Ends_With (Low, "er") and then Word'Length > 2 then
               return Ok (Remove_Last (Word, 2));
            elsif Ends_With (Low, "r") and then Word'Length > 1 then
               return Ok (Remove_Last (Word, 1));
            else
               return Ok (Word);
            end if;
         when German_Inflection =>
            if Ends_With (Low, "chen") or else Ends_With (Low, "lein") then
               return Ok (Word);
            elsif Ends_With (Low, "nen") and then Word'Length > 3 then
               return Ok (Remove_Last (Word, 1));
            elsif Ends_With (Low, "en") and then Word'Length > 2 then
               return Ok (Remove_Last (Word, 2));
            elsif Ends_With (Low, "e") and then Word'Length > 1 then
               return Ok (Remove_Last (Word, 1));
            elsif Ends_With (Low, "s") and then Word'Length > 1 then
               return Ok (Remove_Last (Word, 1));
            else
               return Ok (Word);
            end if;
         when French_Inflection =>
            if Ends_With (Low, "eaux") and then Word'Length > 4 then
               return Ok (Remove_Last (Word, 1));
            elsif Ends_With (Low, "aux") and then Word'Length > 3 then
               return Ok (Remove_Last (Word, 3) & "al");
            elsif Ends_With (Low, "x") and then Word'Length > 1 then
               return Ok (Remove_Last (Word, 1));
            elsif Ends_With (Low, "s") and then Word'Length > 1 then
               return Ok (Remove_Last (Word, 1));
            else
               return Ok (Word);
            end if;
         when Spanish_Inflection =>
            if Ends_With (Low, "ces") and then Word'Length > 3 then
               return Ok (Remove_Last (Word, 3) & "z");
            elsif Ends_With (Low, "es") and then Word'Length > 2
              and then not Is_ASCII_Vowel (Low (Low'Last - 2))
            then
               return Ok (Remove_Last (Word, 2));
            elsif Ends_With (Low, "s") and then Word'Length > 1 then
               return Ok (Remove_Last (Word, 1));
            else
               return Ok (Word);
            end if;
         when Italian_Inflection =>
            if Ends_With (Low, "che") and then Word'Length > 3 then
               return Ok (Remove_Last (Word, 3) & "ca");
            elsif Ends_With (Low, "ghe") and then Word'Length > 3 then
               return Ok (Remove_Last (Word, 3) & "ga");
            elsif Ends_With (Low, "chi") and then Word'Length > 3 then
               return Ok (Remove_Last (Word, 3) & "co");
            elsif Ends_With (Low, "ghi") and then Word'Length > 3 then
               return Ok (Remove_Last (Word, 3) & "go");
            elsif Ends_With (Low, "i") and then Word'Length > 1 then
               return Ok (Remove_Last (Word, 1) & "o");
            elsif Ends_With (Low, "e") and then Word'Length > 1 then
               return Ok (Remove_Last (Word, 1) & "a");
            else
               return Ok (Word);
            end if;
         when Portuguese_Inflection =>
            if Ends_With (Low, "coes") and then Word'Length > 4 then
               return Ok (Remove_Last (Word, 4) & "cao");
            elsif Ends_With (Low, "is") and then Word'Length > 2 then
               return Ok (Remove_Last (Word, 2) & "l");
            elsif Ends_With (Low, "ns") and then Word'Length > 2 then
               return Ok (Remove_Last (Word, 2) & "m");
            elsif Ends_With (Low, "es") and then Word'Length > 2 then
               return Ok (Remove_Last (Word, 2));
            elsif Ends_With (Low, "s") and then Word'Length > 1 then
               return Ok (Remove_Last (Word, 1));
            else
               return Ok (Word);
            end if;
         when Dutch_Inflection =>
            if Ends_With (Low, "en") and then Word'Length > 2 then
               return Ok (Remove_Last (Word, 2));
            elsif Ends_With (Low, "n") and then Word'Length > 1 then
               return Ok (Remove_Last (Word, 1));
            else
               return Ok (Word);
            end if;
         when Swedish_Inflection =>
            if Ends_With (Low, "or") and then Word'Length > 2 then
               return Ok (Remove_Last (Word, 2) & "a");
            elsif Ends_With (Low, "ar") and then Word'Length > 2 then
               return Ok (Remove_Last (Word, 2));
            elsif Ends_With (Low, "r") and then Word'Length > 1 then
               return Ok (Remove_Last (Word, 1));
            else
               return Ok (Word);
            end if;
         when Finnish_Inflection =>
            if Ends_With (Low, "t") and then Word'Length > 1 then
               return Ok (Remove_Last (Word, 1));
            else
               return Ok (Word);
            end if;
         when Turkish_Inflection =>
            if Ends_With (Low, "lar") or else Ends_With (Low, "ler") then
               return Ok (Remove_Last (Word, 3));
            else
               return Ok (Word);
            end if;
      end case;
   end Singularize_In_Language;

   function Inflection_Language_Label
     (Language : Inflection_Language)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok
        (case Language is
            when English_Inflection           => "en",
            when Danish_Inflection            => "da",
            when German_Inflection            => "de",
            when French_Inflection            => "fr",
            when Spanish_Inflection           => "es",
            when Italian_Inflection           => "it",
            when Portuguese_Inflection        => "pt",
            when Dutch_Inflection             => "nl",
            when Swedish_Inflection           => "sv",
            when Norwegian_Inflection         => "no",
            when Norwegian_Bokmal_Inflection  => "nb",
            when Finnish_Inflection           => "fi",
            when Turkish_Inflection           => "tr");
   end Inflection_Language_Label;

   function Singularize_With_Dictionary
     (Word      : String;
      Singulars : String;
      Plurals   : String)
      return Humanize.Status.Text_Result
   is
      Low : constant String := To_String (Parameterize (Word, '_').Text);
      Pos : constant Natural := Word_Position (Plurals, Low);
      Hit : constant String := Word_At (Singulars, Pos);
   begin
      if Hit'Length > 0 then
         return Ok (Hit);
      else
         return Singularize (Word);
      end if;
   end Singularize_With_Dictionary;

   function Dictionary_Plural
     (Word      : String;
      Singulars : String;
      Plurals   : String;
      Preserve  : Boolean)
      return String
   is
      Low : constant String := Inflection_Key (Word);
      Pos : constant Natural := Word_Position (Singulars, Low);
      Hit : constant String := Word_At (Plurals, Pos);
   begin
      if Hit'Length = 0 then
         return "";
      elsif Preserve then
         return Hit;
      else
         return Lower_ASCII (Hit);
      end if;
   end Dictionary_Plural;

   function Dictionary_Singular
     (Word      : String;
      Singulars : String;
      Plurals   : String;
      Preserve  : Boolean)
      return String
   is
      Low : constant String := Inflection_Key (Word);
      Pos : constant Natural := Word_Position (Plurals, Low);
      Hit : constant String := Word_At (Singulars, Pos);
   begin
      if Hit'Length = 0 then
         return "";
      elsif Preserve then
         return Hit;
      else
         return Lower_ASCII (Hit);
      end if;
   end Dictionary_Singular;

   function Pluralize_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Humanize.Status.Text_Result
   is
      Input : constant String :=
        (if Options.Preserve_Case then Word else Inflection_Key (Word));
      Dict  : constant String :=
        Dictionary_Plural (Word, Singulars, Plurals, Options.Preserve_Case);
   begin
      if Options.Rule_Order = Built_In_First
        and then (Irregular_Plural (Word)'Length > 0
                  or else Is_Uncountable_Noun (Word))
      then
         return Pluralize (Input);
      elsif Dict'Length > 0 then
         return Ok (Dict);
      else
         return Pluralize (Input);
      end if;
   end Pluralize_With_Options;

   function Singularize_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Humanize.Status.Text_Result
   is
      Input : constant String :=
        (if Options.Preserve_Case then Word else Inflection_Key (Word));
      Dict  : constant String :=
        Dictionary_Singular (Word, Singulars, Plurals, Options.Preserve_Case);
   begin
      if Options.Rule_Order = Built_In_First
        and then (Irregular_Singular (Word)'Length > 0
                  or else Is_Uncountable_Noun (Word))
      then
         return Singularize (Input);
      elsif Dict'Length > 0 then
         return Ok (Dict);
      else
         return Singularize (Input);
      end if;
   end Singularize_With_Options;

   function Is_Irregular_Singular (Word : String) return Boolean is
      Hit : constant String := Irregular_Plural (Word);
   begin
      return Hit'Length > 0;
   end Is_Irregular_Singular;

   function Is_Irregular_Plural (Word : String) return Boolean is
      Hit : constant String := Irregular_Singular (Word);
   begin
      return Hit'Length > 0;
   end Is_Irregular_Plural;

   function Pluralize_Source
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "")
      return Inflection_Source
   is
   begin
      return Pluralize_Source_With_Options
        (Word, Singulars, Plurals, Default_Inflection_Options);
   end Pluralize_Source;

   function Singularize_Source
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "")
      return Inflection_Source
   is
   begin
      return Singularize_Source_With_Options
        (Word, Singulars, Plurals, Default_Inflection_Options);
   end Singularize_Source;

   function Pluralize_Source_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Inflection_Source
   is
      Low : constant String := Inflection_Key (Word);
      Dict : constant Boolean := Word_Position (Singulars, Low) /= 0;
      Result : constant Humanize.Status.Text_Result :=
        Pluralize_With_Options (Word, Singulars, Plurals, Options);
   begin
      if Options.Rule_Order = Built_In_First and then Is_Irregular_Singular (Word) then
         return Irregular_Inflection;
      elsif Options.Rule_Order = Built_In_First and then Is_Uncountable_Noun (Word) then
         return Uncountable_Inflection;
      elsif Dict then
         return Dictionary_Inflection;
      elsif Is_Irregular_Singular (Word) then
         return Irregular_Inflection;
      elsif Is_Uncountable_Noun (Word) then
         return Uncountable_Inflection;
      elsif Result.Status = Humanize.Status.Ok
        and then To_String (Result.Text) = Word
      then
         return Unchanged_Inflection;
      else
         return Rule_Inflection;
      end if;
   end Pluralize_Source_With_Options;

   function Singularize_Source_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Inflection_Source
   is
      Low : constant String := Inflection_Key (Word);
      Dict : constant Boolean := Word_Position (Plurals, Low) /= 0;
      Result : constant Humanize.Status.Text_Result :=
        Singularize_With_Options (Word, Singulars, Plurals, Options);
   begin
      if Options.Rule_Order = Built_In_First and then Is_Irregular_Plural (Word) then
         return Irregular_Inflection;
      elsif Options.Rule_Order = Built_In_First and then Is_Uncountable_Noun (Word) then
         return Uncountable_Inflection;
      elsif Dict then
         return Dictionary_Inflection;
      elsif Is_Irregular_Plural (Word) then
         return Irregular_Inflection;
      elsif Is_Uncountable_Noun (Word) then
         return Uncountable_Inflection;
      elsif Result.Status = Humanize.Status.Ok
        and then To_String (Result.Text) = Word
      then
         return Unchanged_Inflection;
      else
         return Rule_Inflection;
      end if;
   end Singularize_Source_With_Options;

   function Inflection_Source_Label
     (Source : Inflection_Source)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok
        (case Source is
            when Dictionary_Inflection => "dictionary",
            when Irregular_Inflection  => "irregular",
            when Uncountable_Inflection => "uncountable",
            when Rule_Inflection       => "rule",
            when Unchanged_Inflection  => "unchanged");
   end Inflection_Source_Label;

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

      for Ch of To_String (Base.Text) loop
         Append (Result, Lower (Ch));
      end loop;
      return Ok (To_String (Result));
   end Casefold_ASCII;

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
         return Ok (Text);
      elsif Max_Chars = 0 then
         return Ok ("");
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
         return Ok (Ellipsis (Ellipsis'First .. Last_Keep));
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
      return Ok (Text (Text'First .. Last_Keep) & Ellipsis);
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
         return Ok (Text);
      elsif Max_Chars = 0 then
         return Ok ("");
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
      return Ok (Text (Text'First .. Last_Keep) & Ellipsis);
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
         return Ok (Text);
      elsif Max_Chars = 0 then
         return Ok ("");
      elsif Max_Chars <= Ellipsis_Length then
         Index := Ellipsis'First;
         while Index <= Ellipsis'Last and then Count < Max_Chars loop
            Count := Count + 1;
            Last_Keep := Next_Grapheme_Last (Ellipsis, Index);
            Index := Last_Keep + 1;
         end loop;
         return Ok (Ellipsis (Ellipsis'First .. Last_Keep));
      end if;

      Keep_Count := Max_Chars - Ellipsis_Length;
      Count := 0;
      Index := Text'First;
      while Index <= Text'Last and then Count < Keep_Count loop
         Count := Count + 1;
         Last_Keep := Next_Grapheme_Last (Text, Index);
         Index := Last_Keep + 1;
      end loop;
      return Ok (Text (Text'First .. Last_Keep) & Ellipsis);
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
         return Ok (Text);
      elsif Max_Width = 0 then
         return Ok ("");
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
         return Ok (Ellipsis);
      else
         return Ok (Text (Text'First .. Last_Keep) & Ellipsis);
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
         return Ok (Text);
      elsif Max_Width = 0 then
         return Ok ("");
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
      return Ok (To_String (Result));
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

      return Ok (To_String (Result));
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

   function Key_Value_Line
     (Key       : String;
      Value     : String;
      Separator : String := ": ")
      return Humanize.Status.Text_Result
   is
   begin
      return Ok (Key & Separator & Value);
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
      return Ok (Key & (1 .. Pad => ' ') & Separator & Value);
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
      return Ok
        (Pad_To_Display_Width (Left, Left_Width) & Separator & Right);
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
      return Ok
        (Pad_To_Display_Width (Left, Left_Width) & Separator
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
      return Ok (To_String (Result));
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
      return Ok (To_String (Result));
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
         return Ok ("");
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
         return Ok ("");
      elsif Last_Byte = 0 then
         Last_Byte := Text'Last;
      end if;

      return Ok (Text (First_Byte .. Last_Byte));
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
         return Ok ("");
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
         return Ok ("");
      elsif Last_Byte = 0 then
         Last_Byte := Text'Last;
      end if;

      return Ok (Text (First_Byte .. Last_Byte));
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
         return Ok (Text);
      elsif Max_Chars = 0 then
         return Ok ("");
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
      return Ok (Text (Text'First .. Last_Keep) & Ellipsis);
   end Truncate_Grapheme_Words;

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
   is
   begin
      Copy_Into (NL_To_BR (Text), Target, Written, Status);
   end NL_To_BR_Into;

   procedure BR_To_NL_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (BR_To_NL (Text), Target, Written, Status);
   end BR_To_NL_Into;

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

   procedure Escape_HTML_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Escape_HTML (Text), Target, Written, Status);
   end Escape_HTML_Into;

   procedure Preserve_Separator_Into
     (Text      : String;
      Separator : Character;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into
        (Preserve_Separator (Text, Separator), Target, Written, Status);
   end Preserve_Separator_Into;

   procedure Normalize_Whitespace_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Normalize_Whitespace (Text), Target, Written, Status);
   end Normalize_Whitespace_Into;

   procedure Squish_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Squish (Text), Target, Written, Status);
   end Squish_Into;

   procedure Strip_Tags_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Strip_Tags (Text), Target, Written, Status);
   end Strip_Tags_Into;

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
   is
   begin
      Copy_Into (Safe_Filename (Text, Separator), Target, Written, Status);
   end Safe_Filename_Into;

   procedure Safe_Filename_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Safe_Filename_Options)
   is
   begin
      Copy_Into (Safe_Filename (Text, Options), Target, Written, Status);
   end Safe_Filename_Into;

   procedure Path_Basename_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Path_Basename (Path), Target, Written, Status);
   end Path_Basename_Into;

   procedure Path_Title_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Path_Title (Path), Target, Written, Status);
   end Path_Title_Into;

   procedure Path_Title_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Path_Title_Options)
   is
   begin
      Copy_Into (Path_Title (Path, Options), Target, Written, Status);
   end Path_Title_Into;

   procedure Extension_Label_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Extension_Label (Path), Target, Written, Status);
   end Extension_Label_Into;

   procedure Extension_Label_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Extension_Label_Options)
   is
   begin
      Copy_Into (Extension_Label (Path, Options), Target, Written, Status);
   end Extension_Label_Into;

   procedure Shorten_Path_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Path_Shorten_Options := Default_Path_Shorten_Options)
   is
   begin
      Copy_Into (Shorten_Path (Path, Options), Target, Written, Status);
   end Shorten_Path_Into;

   procedure Symbolic_File_Mode_Into
     (Mode    : File_Mode_Value;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : File_Mode_Kind := Mode_Only)
   is
   begin
      Copy_Into (Symbolic_File_Mode (Mode, Kind), Target, Written, Status);
   end Symbolic_File_Mode_Into;

   procedure Octal_File_Mode_Into
     (Mode            : File_Mode_Value;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code;
      Include_Special : Boolean := False;
      Prefix          : Boolean := False)
   is
   begin
      Copy_Into
        (Octal_File_Mode (Mode, Include_Special, Prefix),
         Target, Written, Status);
   end Octal_File_Mode_Into;

   procedure File_Mode_Summary_Into
     (Mode    : File_Mode_Value;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : File_Mode_Kind := Mode_Only)
   is
   begin
      Copy_Into (File_Mode_Summary (Mode, Kind), Target, Written, Status);
   end File_Mode_Summary_Into;

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
   is
   begin
      Copy_Into (Word_Count_Summary (Text), Target, Written, Status);
   end Word_Count_Summary_Into;

   procedure Sentence_Count_Summary_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Sentence_Count_Summary (Text), Target, Written, Status);
   end Sentence_Count_Summary_Into;

   procedure Paragraph_Count_Summary_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Paragraph_Count_Summary (Text), Target, Written, Status);
   end Paragraph_Count_Summary_Into;

   procedure Reading_Time_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Text_Time_Options := Default_Text_Time_Options)
   is
   begin
      Copy_Into (Reading_Time (Text, Options), Target, Written, Status);
   end Reading_Time_Into;

   procedure Speaking_Time_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Text_Time_Options := Default_Text_Time_Options)
   is
   begin
      Copy_Into (Speaking_Time (Text, Options), Target, Written, Status);
   end Speaking_Time_Into;

   procedure Text_Summary_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Text_Summary_Options := Default_Text_Summary_Options)
   is
   begin
      Copy_Into (Text_Summary (Text, Options), Target, Written, Status);
   end Text_Summary_Into;

   procedure Text_Summary_With_Options_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Text_Summary_Composition_Options :=
        Default_Text_Summary_Composition_Options)
   is
   begin
      Copy_Into
        (Text_Summary_With_Options (Text, Options), Target, Written, Status);
   end Text_Summary_With_Options_Into;

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
   is
   begin
      Copy_Into (Initials (Text), Target, Written, Status);
   end Initials_Into;

   procedure Possessive_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Possessive (Text), Target, Written, Status);
   end Possessive_Into;

   procedure Clean_Name_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Clean_Name (Text), Target, Written, Status);
   end Clean_Name_Into;

   procedure Person_Initials_Into
     (Text         : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Max_Initials : Initial_Count_Limit := 3)
   is
   begin
      Copy_Into (Person_Initials (Text, Max_Initials), Target, Written, Status);
   end Person_Initials_Into;

   procedure Name_Part_Into
     (Text    : String;
      Style   : Name_Display_Style;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Person_Name_Options := Default_Person_Name_Options)
   is
   begin
      Copy_Into (Name_Part (Text, Style, Options), Target, Written, Status);
   end Name_Part_Into;

   procedure Handle_Label_Into
     (Handle      : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Preserve_At : Boolean := True)
   is
   begin
      Copy_Into (Handle_Label (Handle, Preserve_At), Target, Written, Status);
   end Handle_Label_Into;

   procedure Email_Local_Part_Into
     (Email   : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Email_Local_Part (Email), Target, Written, Status);
   end Email_Local_Part_Into;

   procedure Display_Name_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Handle   : String := "";
      Email    : String := "";
      Fallback : String := "Anonymous";
      Options  : Person_Name_Options := Default_Person_Name_Options)
   is
   begin
      Copy_Into
        (Display_Name (Name, Handle, Email, Fallback, Options),
         Target, Written, Status);
   end Display_Name_Into;

   procedure Possessive_Name_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Fallback : String := "someone")
   is
   begin
      Copy_Into (Possessive_Name (Name, Fallback), Target, Written, Status);
   end Possessive_Name_Into;

   procedure Person_List_Into
     (Names    : Name_List;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Limit    : Positive := 2;
      Fallback : String := "no one")
   is
   begin
      Copy_Into (Person_List (Names, Limit, Fallback), Target, Written, Status);
   end Person_List_Into;

   procedure Transliterate_ASCII_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Transliterate_ASCII (Text), Target, Written, Status);
   end Transliterate_ASCII_Into;

   procedure Pluralize_Into
     (Word    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Pluralize (Word), Target, Written, Status);
   end Pluralize_Into;

   procedure Singularize_Into
     (Word    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Singularize (Word), Target, Written, Status);
   end Singularize_Into;

   procedure Pluralize_In_Language_Into
     (Word     : String;
      Language : Inflection_Language;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into
        (Pluralize_In_Language (Word, Language), Target, Written, Status);
   end Pluralize_In_Language_Into;

   procedure Singularize_In_Language_Into
     (Word     : String;
      Language : Inflection_Language;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into
        (Singularize_In_Language (Word, Language), Target, Written, Status);
   end Singularize_In_Language_Into;

   procedure Casefold_ASCII_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Casefold_ASCII (Text), Target, Written, Status);
   end Casefold_ASCII_Into;

   procedure Pluralize_With_Dictionary_Into
     (Word      : String;
      Singulars : String;
      Plurals   : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into
        (Pluralize_With_Dictionary (Word, Singulars, Plurals),
         Target, Written, Status);
   end Pluralize_With_Dictionary_Into;

   procedure Singularize_With_Dictionary_Into
     (Word      : String;
      Singulars : String;
      Plurals   : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into
        (Singularize_With_Dictionary (Word, Singulars, Plurals),
         Target, Written, Status);
   end Singularize_With_Dictionary_Into;

   procedure Pluralize_With_Options_Into
     (Word      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
   is
   begin
      Copy_Into
        (Pluralize_With_Options (Word, Singulars, Plurals, Options),
         Target, Written, Status);
   end Pluralize_With_Options_Into;

   procedure Singularize_With_Options_Into
     (Word      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
   is
   begin
      Copy_Into
        (Singularize_With_Options (Word, Singulars, Plurals, Options),
         Target, Written, Status);
   end Singularize_With_Options_Into;

   procedure Inflection_Source_Label_Into
     (Source  : Inflection_Source;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Inflection_Source_Label (Source), Target, Written, Status);
   end Inflection_Source_Label_Into;

   procedure Inflection_Language_Label_Into
     (Language : Inflection_Language;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into
        (Inflection_Language_Label (Language), Target, Written, Status);
   end Inflection_Language_Label_Into;

   procedure Copy_Into
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Text : constant String := To_String (Result.Text);
   begin
      Written := 0;
      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
      elsif Result.Status /= Humanize.Status.Ok then
         Status := Result.Status;
      elsif Text'Length > Target'Length then
         if Target'Length > 0 then
            Target (Target'First .. Target'Last) :=
              Text (Text'First .. Text'First + Target'Length - 1);
         end if;
         Written := Target'Length;
         Status := Humanize.Status.Buffer_Overflow;
      else
         if Text'Length > 0 then
            Target (Target'First .. Target'First + Text'Length - 1) := Text;
         end if;
         Written := Text'Length;
         Status := Humanize.Status.Ok;
      end if;
   end Copy_Into;
end Humanize.Strings;
