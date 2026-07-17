with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Status;

package body Humanize.Strings.Metrics is
   use type Humanize.Status.Status_Code;

   function Natural_Text (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   procedure Copy_Into
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

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
         return Natural_Text (Count) & " " & Plural;
      end if;
   end Count_Label;

   function Word_Count_Summary
     (Text : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Label (Word_Count (Text), "word", "words"));
   end Word_Count_Summary;

   function Sentence_Count_Summary
     (Text : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Label (Sentence_Count (Text), "sentence", "sentences"));
   end Sentence_Count_Summary;

   function Paragraph_Count_Summary
     (Text : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Label (Paragraph_Count (Text), "paragraph", "paragraphs"));
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
         return Natural_Text (Minutes) & " minutes " & Suffix;
      end if;
   end Minutes_Label;

   function Reading_Time
     (Text    : String;
      Options : Text_Time_Options := Default_Text_Time_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Minutes_Label
           (Word_Count (Text), Options.Reading_Words_Per_Minute, "read"));
   end Reading_Time;

   function Speaking_Time
     (Text    : String;
      Options : Text_Time_Options := Default_Text_Time_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Minutes_Label
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
            return Natural_Text (Count) & " " & Compact;
         when Minimal_Labels =>
            return Natural_Text (Count);
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
            return Natural_Text (Minutes)
              & (if Suffix = "read" then " min read" else " min spoken");
         when Minimal_Labels =>
            return Natural_Text (Minutes);
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
         return Ok_Text ([1 => Options.Empty_Text]);
      else
         return Ok_Text (To_String (Summary));
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
end Humanize.Strings.Metrics;
