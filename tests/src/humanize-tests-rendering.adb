with AUnit.Assertions;

with Ada.Calendar;
with Ada.Strings.Unbounded;
with I18N.Runtime;

with Humanize.Bytes;
with Humanize.Contexts;
with Humanize.Datetimes;
with Humanize.Durations;
with Humanize.Frequencies;
with Humanize.I18N_Rendering;
with Humanize.Lists;
with Humanize.Messages;
with Humanize.Numbers;
with Humanize.Phrases;
with Humanize.Rates;
with Humanize.Selections;
with Humanize.Status;
with Humanize.Styles;
with Humanize.Tests.Support;
with Humanize.Units;

package body Humanize.Tests.Rendering is

   use Humanize.Status;
   use Ada.Strings.Unbounded;
   use type Ada.Calendar.Time;
   use type Humanize.Bytes.Byte_Unit_System;
   use type Humanize.Phrases.Phrase_Severity;
   use type Humanize.Units.Unit_Style;

   LF : constant String := [1 => ASCII.LF];

   --  UTF-8 'å' for Danish expectations.
   AA : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A5#);
   --  UTF-8 Arabic-Indic digit two (U+0662) for Arabic number rendering.
   ARABIC_TWO : constant String :=
     Character'Val (16#D9#) & Character'Val (16#A2#);

   function B (Hex : String) return String is
      Result : String (1 .. Hex'Length / 2);

      function Nibble (C : Character) return Natural is
      begin
         case C is
            when '0' .. '9' =>
               return Character'Pos (C) - Character'Pos ('0');
            when 'A' .. 'F' =>
               return 10 + Character'Pos (C) - Character'Pos ('A');
            when 'a' .. 'f' =>
               return 10 + Character'Pos (C) - Character'Pos ('a');
            when others =>
               return 0;
         end case;
      end Nibble;
   begin
      for I in Result'Range loop
         Result (I) :=
           Character'Val
             (Nibble (Hex (Hex'First + 2 * (I - Result'First))) * 16
              + Nibble (Hex (Hex'First + 2 * (I - Result'First) + 1)));
      end loop;

      return Result;
   end B;

   function Contains (Text, Pattern : String) return Boolean is
   begin
      if Pattern'Length = 0 or else Text'Length < Pattern'Length then
         return False;
      end if;

      for Index in Text'First .. Text'Last - Pattern'Length + 1 loop
         if Text (Index .. Index + Pattern'Length - 1) = Pattern then
            return True;
         end if;
      end loop;
      return False;
   end Contains;

   function Has_Non_ASCII (Text : String) return Boolean is
   begin
      for C of Text loop
         if Character'Pos (C) > 127 then
            return True;
         end if;
      end loop;

      return False;
   end Has_Non_ASCII;

   procedure Check_Audit_Text
     (Locale : String;
      Label  : String;
      Result : Text_Result)
   is
      Text : constant String := Support.Text (Result);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok, Locale & " " & Label & " render status");
      AUnit.Assertions.Assert
        (Text'Length > 0, Locale & " " & Label & " rendered empty text");
      AUnit.Assertions.Assert
        (not Contains (Text, "humanize."),
         Locale & " " & Label & " leaked catalog key [" & Text & "]");
      AUnit.Assertions.Assert
        (not Contains (Text, "{") and then not Contains (Text, "}"),
         Locale & " " & Label & " leaked placeholder [" & Text & "]");
      AUnit.Assertions.Assert
        (not Contains (Text, "  "),
         Locale & " " & Label & " contains doubled spaces [" & Text & "]");
      AUnit.Assertions.Assert
        (Text (Text'First) /= ' ' and then Text (Text'Last) /= ' ',
         Locale & " " & Label & " has edge whitespace [" & Text & "]");
   end Check_Audit_Text;

   procedure Check_Native_Script_Text
     (Locale : String;
      Label  : String;
      Result : Text_Result)
   is
      Text : constant String := Support.Text (Result);
   begin
      Check_Audit_Text (Locale, Label, Result);
      AUnit.Assertions.Assert
        (Has_Non_ASCII (Text),
         Locale & " " & Label & " expected native-script text [" & Text & "]");
   end Check_Native_Script_Text;

   --  A runtime whose bytes.kb key is a plural on the (non-numeric) value
   --  argument, used to provoke an i18n Invalid_Argument.
   Inv_Runtime : aliased I18N.Runtime.Instance;
   Inv_Loaded  : Boolean := False;

   --  A runtime made invalid (Initialize on a missing file) to provoke an i18n
   --  Execution_Error -> Humanize Runtime_Error.
   Bad_Runtime : aliased I18N.Runtime.Instance;
   Bad_Ready   : Boolean := False;

   procedure Ensure_Bad is
   begin
      if not Bad_Ready then
         I18N.Runtime.Initialize
           (Bad_Runtime, "/humanize/no/such/catalog/file.catalog");
         Bad_Ready := True;
      end if;
   end Ensure_Bad;

   procedure Ensure_Inv is
      Result : I18N.Runtime.Load_Result;
   begin
      if not Inv_Loaded then
         I18N.Runtime.Load_Text
           (Inv_Runtime, "inv",
            "en.humanize.bytes.kb = {value, plural, one {one} other {many}}"
            & LF,
            Result);
         Inv_Loaded := True;
      end if;
   end Ensure_Inv;

   procedure Test_English (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Durations.Format (Support.En, 1)) = "1 second",
         "English duration one");
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Bytes.Format (Support.En, 1024)) = "1 KiB",
         "English bytes");
   end Test_English;

   procedure Test_Danish (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use Ada.Calendar;
      Ref   : constant Time := Time_Of (2026, 3, 21, Day_Duration (600));
      Value : constant Time := Time_Of (2026, 3, 20, Day_Duration (86_100));
   begin
      --  Danish CLDR one/other plural through i18n.
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Durations.Format (Support.Da, 1)) = "1 sekund",
         "Danish duration one");
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Durations.Format (Support.Da, 2))
           = "2 sekunder",
         "Danish duration other");
      --  Danish calendar word with UTF-8 'å'.
      AUnit.Assertions.Assert
        (Support.Text
           (Humanize.Datetimes.Relative (Support.Da, Value, Ref))
           = "i g" & AA & "r",
         "Danish yesterday is i g" & AA & "r");
   end Test_Danish;

   procedure Test_German (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use Ada.Calendar;
      Ref   : constant Time := Time_Of (2026, 3, 21, Day_Duration (600));
      Value : constant Time := Time_Of (2026, 3, 20, Day_Duration (86_100));
   begin
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Durations.Format (Support.De, 1)) = "1 Sekunde",
         "German duration one");
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Durations.Format (Support.De, 2))
           = "2 Sekunden",
         "German duration other");
      AUnit.Assertions.Assert
        (Support.Text
           (Humanize.Datetimes.Relative (Support.De, Value, Ref)) = "gestern",
         "German yesterday");
   end Test_German;

   procedure Test_French (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use Ada.Calendar;
      Ref     : constant Time := Time_Of (2026, 3, 21, Day_Duration (43_200));
      Earlier : constant Time := Ref - Duration (14_400);  --  4 hours
   begin
      --  French plural "one" covers 0 and 1.
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Durations.Format (Support.Fr, 1)) = "1 seconde",
         "French duration one");
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Durations.Format (Support.Fr, 0)) = "0 seconde",
         "French zero uses the one form");
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Durations.Format (Support.Fr, 2))
           = "2 secondes",
         "French duration other");
      AUnit.Assertions.Assert
        (Support.Text
           (Humanize.Datetimes.Relative (Support.Fr, Earlier, Ref))
           = "il y a 4 heures",
         "French relative hours");
   end Test_French;

   procedure Test_Spanish_Italian
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      use Ada.Calendar;
      Ref     : constant Time := Time_Of (2026, 3, 21, Day_Duration (43_200));
      Earlier : constant Time := Ref - Duration (14_400);  --  4 hours
   begin
      --  Spanish: plural one=1, comma decimal, "hace ..." past.
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Durations.Format (Support.Es, 1)) = "1 segundo",
         "Spanish duration one");
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Durations.Format (Support.Es, 2))
           = "2 segundos",
         "Spanish duration other");
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Datetimes.Relative (Support.Es, Earlier, Ref))
           = "hace 4 horas",
         "Spanish relative hours");
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Bytes.Format (Support.Es, 1536,
                       Humanize.Bytes.Default_Byte_Options)) = "1,5 KiB",
         "Spanish byte decimal");
      --  Italian: "... fa" past, comma decimal.
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Durations.Format (Support.It, 1)) = "1 secondo",
         "Italian duration one");
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Datetimes.Relative (Support.It, Earlier, Ref))
           = "4 ore fa",
         "Italian relative hours");
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Bytes.Format (Support.It, 1536,
                       Humanize.Bytes.Default_Byte_Options)) = "1,5 KiB",
         "Italian byte decimal");
   end Test_Spanish_Italian;

   procedure Test_Portuguese (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      AC      : constant String :=  --  'a' acute for B ("68C3A1")
        Character'Val (16#C3#) & Character'Val (16#A1#);
      use Ada.Calendar;
      Ref     : constant Time := Time_Of (2026, 3, 21, Day_Duration (43_200));
      Earlier : constant Time := Ref - Duration (14_400);  --  4 hours
   begin
      --  Portuguese: one iff i in {0,1}.
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Durations.Format (Support.Pt, 1)) = "1 segundo",
         "Portuguese duration one");
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Durations.Format (Support.Pt, 2))
           = "2 segundos",
         "Portuguese duration other");
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Datetimes.Relative (Support.Pt, Earlier, Ref))
           = "h" & AC & " 4 horas",
         "Portuguese relative hours");
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Bytes.Format (Support.Pt, 1536,
                       Humanize.Bytes.Default_Byte_Options)) = "1,5 KiB",
         "Portuguese byte decimal");
   end Test_Portuguese;

   procedure Test_Missing_Message (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Result : constant Text_Result :=
        Humanize.Durations.Format (Support.Empty, 5);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Missing_Message,
         "absent catalog key maps to Missing_Message, got "
         & Status_Image (Result.Status));
   end Test_Missing_Message;

   procedure Test_Missing_Argument (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      --  A count key rendered with no arguments -> i18n Missing_Argument.
      Result : constant Text_Result :=
        Humanize.I18N_Rendering.Render
          (Support.En,
           Humanize.Selections.No_Arg
             (Humanize.Messages.Duration_Unit_Second));
   begin
      AUnit.Assertions.Assert
        (Result.Status = Missing_Argument,
         "missing count maps to Missing_Argument, got "
         & Status_Image (Result.Status));
   end Test_Missing_Argument;

   procedure Test_Invalid_Argument (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Ensure_Inv;
      declare
         Ctx : constant Humanize.Contexts.Context :=
           Humanize.Contexts.Create (Inv_Runtime'Access, "en");
         Result : constant Text_Result :=
           Humanize.I18N_Rendering.Render
             (Ctx,
              Humanize.Selections.Text_Value
                (Humanize.Messages.Bytes_KB, "abc"));
      begin
         AUnit.Assertions.Assert
           (Result.Status = Invalid_Argument,
            "non-numeric plural selector maps to Invalid_Argument, got "
            & Status_Image (Result.Status));
      end;
   end Test_Invalid_Argument;

   procedure Test_Runtime_Error (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Ensure_Bad;
      declare
         Ctx : constant Humanize.Contexts.Context :=
           Humanize.Contexts.Create (Bad_Runtime'Access, "en");
         Result : constant Text_Result :=
           Humanize.Durations.Format (Ctx, 5);
      begin
         AUnit.Assertions.Assert
           (Result.Status = Runtime_Error,
            "an invalid runtime maps to Runtime_Error, got "
            & Status_Image (Result.Status));
      end;
   end Test_Runtime_Error;

   procedure Test_Value_Argument (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      --  A value-argument selection flows the deterministic formatter text
      --  through i18n's {value} substitution.
      Result : constant Text_Result :=
        Humanize.I18N_Rendering.Render
          (Support.En,
           Humanize.Selections.Text_Value
             (Humanize.Messages.Bytes_KiB, "1.5"));
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = "1.5 KiB",
         "value argument substitutes formatter text");
   end Test_Value_Argument;

   procedure Test_Count_Strict_Decimal (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      --  Count must serialize as a strict decimal with no leading space.
      Result : constant Text_Result :=
        Humanize.I18N_Rendering.Render
          (Support.En,
           Humanize.Selections.Count
             (Humanize.Messages.Duration_Unit_Second, 5));
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = "5 seconds",
         "count renders as strict decimal");
   end Test_Count_Strict_Decimal;

   procedure Test_Lists_Frequencies_Rates
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Items : constant Humanize.Lists.Text_List :=
        [To_Unbounded_String ("alpha"),
         To_Unbounded_String ("beta"),
         To_Unbounded_String ("gamma")];
      Joined : constant Text_Result := Humanize.Lists.Format (Support.En, Items);
      Oxford : constant Text_Result :=
        Humanize.Lists.Format
          (Support.En, Items,
           (Style => Humanize.Lists.Conjunction, Oxford_Comma => True));
      Choice : constant Text_Result :=
        Humanize.Lists.Format
          (Support.En, Items,
           (Style => Humanize.Lists.Disjunction, Oxford_Comma => False));
      Count : constant Text_Result :=
        Humanize.Lists.Count (Support.En, 0, "item");
      Article_Count : constant Text_Result :=
        Humanize.Lists.Counted_Noun
          (Support.En, 1, "file", Options =>
             (Number_Style => Humanize.Lists.Article_Count,
              Zero_Style => Humanize.Lists.No_Zero,
              Include_Noun => True,
              Compact_At => 1_000,
              Prefer_Article => False));
      Article_Vowel : constant Text_Result :=
        Humanize.Lists.Counted_Noun
          (Support.En, 1, "item", Options =>
             (Number_Style => Humanize.Lists.Article_Count,
              Zero_Style => Humanize.Lists.No_Zero,
              Include_Noun => True,
              Compact_At => 1_000,
              Prefer_Article => False));
      Word_Count : constant Text_Result :=
        Humanize.Lists.Counted_Noun
          (Support.En, 5, "box", Options =>
             (Number_Style => Humanize.Lists.Word_Count,
              Zero_Style => Humanize.Lists.No_Zero,
              Include_Noun => True,
              Compact_At => 1_000,
              Prefer_Article => False));
      Compact_Count : constant Text_Result :=
        Humanize.Lists.Counted_Noun
          (Support.En, 1_250, "file", Options =>
             (Number_Style => Humanize.Lists.Compact_Count,
              Zero_Style => Humanize.Lists.No_Zero,
              Include_Noun => True,
              Compact_At => 1_000,
              Prefer_Article => False));
      Zero_Word_Count : constant Text_Result :=
        Humanize.Lists.Counted_Noun
          (Support.En, 0, "entry", Options =>
             (Number_Style => Humanize.Lists.Word_Count,
              Zero_Style => Humanize.Lists.Word_Zero,
              Include_Noun => True,
              Compact_At => 1_000,
              Prefer_Article => False));
      Irregular_Count : constant Text_Result :=
        Humanize.Lists.Counted_Noun (Support.En, 2, "person", "people");
      Default_Plural_Count : constant Text_Result :=
        Humanize.Lists.Counted_Noun (Support.En, 2, "category");
      Count_Only : constant Text_Result :=
        Humanize.Lists.Counted_Noun
          (Support.En, 3, "file", Options =>
             (Number_Style => Humanize.Lists.Numeric_Count,
              Zero_Style => Humanize.Lists.No_Zero,
              Include_Noun => False,
              Compact_At => 1_000,
              Prefer_Article => False));
      Source_Label : constant Text_Result :=
        Humanize.Lists.Counted_Noun_Source_Label
          (Humanize.Lists.Counted_Noun_Source (2, "person", "people"));
      Selected : constant Text_Result :=
        Humanize.Lists.Selection_Count (Support.En, 3, 5, "item");
      Remaining : constant Text_Result :=
        Humanize.Lists.Remaining_Count (Support.En, 2, "item");
      Position : constant Text_Result :=
        Humanize.Lists.Position_Count (Support.En, 1, 5);
      All_Items : constant Text_Result :=
        Humanize.Lists.All_Count (Support.En, 5, "item");
      Result_Count : constant Text_Result :=
        Humanize.Lists.Result_Count (Support.En, 24);
      Showing : constant Text_Result :=
        Humanize.Lists.Showing_Count (Support.En, 20, 153);
      Page : constant Text_Result :=
        Humanize.Lists.Page_Count (Support.En, 2, 8);
      More : constant Text_Result :=
        Humanize.Lists.More_Count (Support.En, 3, 4);
      Others_Text : constant Text_Result :=
        Humanize.Lists.Others_Count (Support.En, "Ada", 4);
      Selection_Summary : constant Text_Result :=
        Humanize.Lists.Selection_Summary (Support.En, 0, 5, "item");
      Page_Range : constant Text_Result :=
        Humanize.Lists.Pagination_Range (Support.En, 21, 40, 153);
      Screen_Display : constant Text_Result :=
        Humanize.Lists.Collection_Display
          (Support.En, 3, 4, Options =>
             (Style => Humanize.Lists.Screen_Reader_Display));
      Limited_List : constant Text_Result :=
        Humanize.Lists.Format_Limited (Support.En, Items, 2);
      Validation_Issues : constant Humanize.Lists.Text_List :=
        [To_Unbounded_String ("email is invalid"),
         To_Unbounded_String ("password is too short"),
         To_Unbounded_String ("name is required")];
      Validation : constant Text_Result :=
        Humanize.Lists.Validation_Summary
          (Support.En, Validation_Issues,
           (Severity => Humanize.Lists.Validation_Error,
            Style => Humanize.Lists.Validation_Detailed,
            Max_Details => 2,
            Include_Ok => True,
            Detail_List_Options => Humanize.Lists.Default_List_Options));
      Validation_Headline : constant Text_Result :=
        Humanize.Lists.Validation_Summary
          (Support.En, Validation_Issues,
           (Severity => Humanize.Lists.Validation_Error,
            Style => Humanize.Lists.Validation_Headline,
            Max_Details => 3,
            Include_Ok => True,
            Detail_List_Options => Humanize.Lists.Default_List_Options));
      Validation_Ok : constant Text_Result :=
        Humanize.Lists.Validation_Count (Support.En, 0);
      Validation_Suppressed : constant Text_Result :=
        Humanize.Lists.Validation_Count
          (Support.En, 0,
           (Severity => Humanize.Lists.Validation_Error,
            Style => Humanize.Lists.Validation_Detailed,
            Max_Details => 3,
            Include_Ok => False,
            Detail_List_Options => Humanize.Lists.Default_List_Options));
      Validation_Warnings : constant Text_Result :=
        Humanize.Lists.Validation_Count
          (Support.En, 2,
           (Severity => Humanize.Lists.Validation_Warning,
            Style => Humanize.Lists.Validation_Detailed,
            Max_Details => 3,
            Include_Ok => True,
            Detail_List_Options => Humanize.Lists.Default_List_Options));
      Validation_Info : constant Text_Result :=
        Humanize.Lists.Validation_Count
          (Support.En, 1,
           (Severity => Humanize.Lists.Validation_Info,
            Style => Humanize.Lists.Validation_Detailed,
            Max_Details => 3,
            Include_Ok => True,
            Detail_List_Options => Humanize.Lists.Default_List_Options));
      Field_Issues : constant Humanize.Lists.Text_List :=
        [To_Unbounded_String ("is invalid"),
         To_Unbounded_String ("is already used")];
      Field_Problems : constant Text_Result :=
        Humanize.Lists.Field_Problem_Summary
          (Support.En, "email", Field_Issues);
      Never  : constant Text_Result := Humanize.Frequencies.Times (Support.En, 0);
      Once   : constant Text_Result := Humanize.Frequencies.Times (Support.En, 1);
      Many   : constant Text_Result := Humanize.Frequencies.Times (Support.En, 4);
      Custom : constant Text_Result :=
        Humanize.Frequencies.Times (Support.En, 4, "heartbeat", "heartbeats");
      Pace   : constant Text_Result :=
        Humanize.Rates.Pace (Support.En, 4, Humanize.Rates.Per_Week);
      Custom_Pace : constant Text_Result :=
        Humanize.Rates.Pace
          (Support.En, 4, Humanize.Rates.Per_Week, "heartbeat", "heartbeats");
      Less : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.En, 0, Humanize.Rates.Per_Week);
      Less_Custom : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.En, 0, Humanize.Rates.Per_Week, "heartbeat", "heartbeats");
      Buffer : String (1 .. 32);
      Validation_Buffer : String (1 .. 80);
      Written : Natural;
      Code : Status_Code;
   begin
      AUnit.Assertions.Assert
        (Joined.Status = Ok and then Support.Text (Joined) = "alpha, beta and gamma",
         "list joins with localized conjunction");
      AUnit.Assertions.Assert
        (Oxford.Status = Ok
         and then Support.Text (Oxford) = "alpha, beta, and gamma",
         "list supports Oxford comma");
      AUnit.Assertions.Assert
        (Choice.Status = Ok
         and then Support.Text (Choice) = "alpha, beta or gamma",
         "list supports disjunction");
      AUnit.Assertions.Assert
        (Count.Status = Ok and then Support.Text (Count) = "no items",
         "list count phrase");
      AUnit.Assertions.Assert
        (Article_Count.Status = Ok and then Support.Text (Article_Count) = "a file",
         "counted noun supports article style");
      AUnit.Assertions.Assert
        (Article_Vowel.Status = Ok and then Support.Text (Article_Vowel) = "an item",
         "counted noun supports vowel article");
      AUnit.Assertions.Assert
        (Word_Count.Status = Ok and then Support.Text (Word_Count) = "five boxes",
         "counted noun supports word counts and es plural");
      AUnit.Assertions.Assert
        (Compact_Count.Status = Ok
         and then Support.Text (Compact_Count) = "1.3K files",
         "counted noun supports compact counts");
      AUnit.Assertions.Assert
        (Zero_Word_Count.Status = Ok
         and then Support.Text (Zero_Word_Count) = "zero entries",
         "counted noun supports explicit zero word");
      AUnit.Assertions.Assert
        (Irregular_Count.Status = Ok
         and then Support.Text (Irregular_Count) = "2 people",
         "counted noun supports irregular plural");
      AUnit.Assertions.Assert
        (Default_Plural_Count.Status = Ok
         and then Support.Text (Default_Plural_Count) = "2 categories",
         "counted noun supports default y plural");
      AUnit.Assertions.Assert
        (Count_Only.Status = Ok and then Support.Text (Count_Only) = "3",
         "counted noun can omit noun");
      AUnit.Assertions.Assert
        (Source_Label.Status = Ok
         and then Support.Text (Source_Label) = "irregular-noun",
         "counted noun exposes noun source metadata");
      Humanize.Lists.Counted_Noun_Into
        (Support.En, 1_250, "file", Buffer, Written, Code,
         Options =>
           (Number_Style => Humanize.Lists.Compact_Count,
            Zero_Style => Humanize.Lists.No_Zero,
            Include_Noun => True,
            Compact_At => 1_000,
            Prefer_Article => False));
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "1.3K files",
         "bounded counted noun");
      AUnit.Assertions.Assert
        (Selected.Status = Ok
         and then Support.Text (Selected) = "3 of 5 items selected",
         "selection count phrase");
      AUnit.Assertions.Assert
        (Remaining.Status = Ok
         and then Support.Text (Remaining) = "2 items remaining",
         "remaining count phrase");
      AUnit.Assertions.Assert
        (Position.Status = Ok and then Support.Text (Position) = "1 of 5",
         "position count phrase");
      AUnit.Assertions.Assert
        (All_Items.Status = Ok and then Support.Text (All_Items) = "all 5 items",
         "all count phrase");
      AUnit.Assertions.Assert
        (Result_Count.Status = Ok
         and then Support.Text (Result_Count) = "24 results",
         "result count phrase");
      AUnit.Assertions.Assert
        (Showing.Status = Ok
         and then Support.Text (Showing) = "showing 20 of 153 results",
         "showing count phrase");
      AUnit.Assertions.Assert
        (Page.Status = Ok and then Support.Text (Page) = "page 2 of 8",
         "page count phrase");
      AUnit.Assertions.Assert
        (More.Status = Ok and then Support.Text (More) = "3 shown, +4 more",
         "more-count phrase");
      AUnit.Assertions.Assert
        (Others_Text.Status = Ok
         and then Support.Text (Others_Text) = "Ada and 4 others",
         "others-count phrase");
      AUnit.Assertions.Assert
        (Selection_Summary.Status = Ok
         and then Support.Text (Selection_Summary) = "no items selected",
         "selection summary phrase");
      AUnit.Assertions.Assert
        (Page_Range.Status = Ok
         and then Support.Text (Page_Range) = "21-40 of 153 results",
         "pagination range phrase");
      AUnit.Assertions.Assert
        (Screen_Display.Status = Ok
         and then Support.Text (Screen_Display)
           = "3 items shown, 4 items available",
         "collection display screen-reader phrase");
      AUnit.Assertions.Assert
        (Limited_List.Status = Ok
         and then Support.Text (Limited_List) = "alpha, beta and 1 other",
         "limited list shows hidden count");
      AUnit.Assertions.Assert
        (Validation.Status = Ok
         and then Support.Text (Validation)
           = "3 errors: email is invalid, password is too short and 1 other",
         "validation summary limits details");
      AUnit.Assertions.Assert
        (Validation_Headline.Status = Ok
         and then Support.Text (Validation_Headline) = "3 errors",
         "validation summary supports headline-only counts");
      AUnit.Assertions.Assert
        (Validation_Ok.Status = Ok
         and then Support.Text (Validation_Ok) = "no errors",
         "validation count supports empty ok text");
      AUnit.Assertions.Assert
        (Validation_Suppressed.Status = Ok
         and then Support.Text (Validation_Suppressed) = "",
         "validation count can suppress empty ok text");
      AUnit.Assertions.Assert
        (Validation_Warnings.Status = Ok
         and then Support.Text (Validation_Warnings) = "2 warnings",
         "validation count supports warning severity");
      AUnit.Assertions.Assert
        (Validation_Info.Status = Ok
         and then Support.Text (Validation_Info) = "1 notice",
         "validation count supports info severity");
      AUnit.Assertions.Assert
        (Field_Problems.Status = Ok
         and then Support.Text (Field_Problems)
           = "email: 2 errors: is invalid and is already used",
         "field problem summary prefixes validation details");
      Humanize.Lists.Validation_Summary_Into
        (Support.En, Field_Issues, Validation_Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok
         and then Validation_Buffer (1 .. Written)
           = "2 errors: is invalid and is already used",
         "bounded validation summary");
      AUnit.Assertions.Assert
        (Never.Status = Ok and then Support.Text (Never) = "never",
         "frequency never");
      AUnit.Assertions.Assert
        (Once.Status = Ok and then Support.Text (Once) = "once",
         "frequency once");
      AUnit.Assertions.Assert
        (Many.Status = Ok and then Support.Text (Many) = "4 times",
         "frequency many");
      AUnit.Assertions.Assert
        (Custom.Status = Ok and then Support.Text (Custom) = "4 heartbeats",
         "frequency custom noun");
      AUnit.Assertions.Assert
        (Pace.Status = Ok
         and then Support.Text (Pace) = "approximately 4 times per week",
         "rate pace per week");
      AUnit.Assertions.Assert
        (Custom_Pace.Status = Ok
         and then Support.Text (Custom_Pace)
           = "approximately 4 heartbeats per week",
         "rate custom noun per week");
      AUnit.Assertions.Assert
        (Less.Status = Ok
         and then Support.Text (Less) = "less than once per week",
         "rate less-than threshold");
      AUnit.Assertions.Assert
        (Less_Custom.Status = Ok
         and then Support.Text (Less_Custom)
           = "less than once heartbeat per week",
         "rate less-than custom noun threshold");
   end Test_Lists_Frequencies_Rates;

   procedure Test_Generated_Locale_Coverage
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Dutch : constant Text_Result :=
        Humanize.Durations.Format (Support.Nl, 2);
      Russian : constant Text_Result :=
        Humanize.Numbers.Compact (Support.Locale ("ru"), 1_200);
      Arabic : constant Text_Result :=
        Humanize.Bytes.Format (Support.Locale ("ar"), 1_024);
      Symbol_Unit : constant Text_Result :=
        Humanize.Units.Format
          (Support.Locale ("tr"), 2, Humanize.Units.Square_Meter);
      Swedish_Frequency : constant Text_Result :=
        Humanize.Frequencies.Times (Support.Locale ("sv"), 2);
      Finnish_Rate : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("fi"), 4, Humanize.Rates.Per_Minute);
      Turkish_Rate : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("tr"), 4, Humanize.Rates.Per_Week);
      Turkish_Less_Than : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("tr"), 0, Humanize.Rates.Per_Hour);
      Japanese_Rate : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("ja"), 4, Humanize.Rates.Per_Week);
      Japanese_Less_Than : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("ja"), 0, Humanize.Rates.Per_Hour);
      Korean_Rate : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("ko"), 4, Humanize.Rates.Per_Week);
      Korean_Daily_Rate : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("ko"), 4, Humanize.Rates.Per_Day);
      Chinese_Rate : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("zh"), 4, Humanize.Rates.Per_Week);
      Hindi_Rate : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("hi"), 4, Humanize.Rates.Per_Week);
      Hindi_Less_Than : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.Locale ("hi"), 0, Humanize.Rates.Per_Hour);
      Japanese_List : constant Text_Result :=
        Humanize.Lists.Format
          (Support.Locale ("ja"),
           [1 => To_Unbounded_String ("alpha"),
            2 => To_Unbounded_String ("beta")]);
      Chinese_Compact : constant Text_Result :=
        Humanize.Numbers.Compact (Support.Locale ("zh"), 1_200);
      Korean_Byte : constant Text_Result :=
        Humanize.Bytes.Format (Support.Locale ("ko"), 1);
      Swedish_Region : constant Text_Result :=
        Humanize.Durations.Format (Support.Locale ("sv-SE"), 2);
      Norwegian_Region : constant Text_Result :=
        Humanize.Durations.Format (Support.Locale ("nb-NO"), 2);
      Japanese_Region : constant Text_Result :=
        Humanize.Durations.Format (Support.Locale ("ja-JP"), 2);
      Arabic_Region : constant Text_Result :=
        Humanize.Durations.Format (Support.Locale ("ar-EG"), 2);
      Generated_Reference : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (2026, 3, 21, 12.0 * 3_600.0);
      Turkish_Now : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("tr"),
           Generated_Reference - Duration (10),
           Generated_Reference);
      Polish_Yesterday : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("pl"),
           Generated_Reference - Duration (86_400),
           Generated_Reference);
      Finnish_Tomorrow : constant Text_Result :=
        Humanize.Datetimes.Natural_Day
          (Support.Locale ("fi"),
           (Year => 2026, Month => 3, Day => 22, others => 0),
           (Year => 2026, Month => 3, Day => 21, others => 0));
      Finnish_Five_Hours_Future : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("fi"),
           Generated_Reference + Duration (5 * 3_600),
           Generated_Reference);
      Czech_Today : constant Text_Result :=
        Humanize.Datetimes.Natural_Day
          (Support.Locale ("cs"),
           (Year => 2026, Month => 3, Day => 21, others => 0),
           (Year => 2026, Month => 3, Day => 21, others => 0));
      Turkish_Five_Hours_Future : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("tr"),
           Generated_Reference + Duration (5 * 3_600),
           Generated_Reference);
      Russian_Hours_Ago : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("ru"),
           Generated_Reference - Duration (2 * 3_600),
           Generated_Reference);
      Polish_Five_Hours_Ago : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("pl"),
           Generated_Reference - Duration (5 * 3_600),
           Generated_Reference);
      Polish_Five_Hours_Future : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("pl"),
           Generated_Reference + Duration (5 * 3_600),
           Generated_Reference);
      Czech_Five_Hours_Ago : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("cs"),
           Generated_Reference - Duration (5 * 3_600),
           Generated_Reference);
      Czech_Five_Hours_Future : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("cs"),
           Generated_Reference + Duration (5 * 3_600),
           Generated_Reference);
      Russian_Five_Hours_Ago : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("ru"),
           Generated_Reference - Duration (5 * 3_600),
           Generated_Reference);
      Russian_Five_Hours_Future : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("ru"),
           Generated_Reference + Duration (5 * 3_600),
           Generated_Reference);
      Ukrainian_Five_Hours_Ago : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("uk"),
           Generated_Reference - Duration (5 * 3_600),
           Generated_Reference);
      Ukrainian_Five_Hours_Future : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("uk"),
           Generated_Reference + Duration (5 * 3_600),
           Generated_Reference);
      Hindi_Five_Hours_Future : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("hi"),
           Generated_Reference + Duration (5 * 3_600),
           Generated_Reference);
      Korean_Minutes_Future : constant Text_Result :=
        Humanize.Datetimes.Relative
          (Support.Locale ("ko"),
           Generated_Reference + Duration (2 * 60),
           Generated_Reference);

      procedure Check_Text
        (Result  : Text_Result;
         Expect  : String;
         Message : String)
      is
      begin
         AUnit.Assertions.Assert
           (Result.Status = Ok and then Support.Text (Result) = Expect,
            Message);
      end Check_Text;

      procedure Check_Duration
        (Locale : String;
         Expect : String)
      is
         Result : constant Text_Result :=
           Humanize.Durations.Format (Support.Locale (Locale), 2);
      begin
         AUnit.Assertions.Assert
           (Result.Status = Ok and then Support.Text (Result) = Expect,
            Locale & " generated catalog localizes core duration unit");
      end Check_Duration;

      procedure Check_Duration_5_Hours
        (Locale : String;
         Expect : String)
      is
         Result : constant Text_Result :=
           Humanize.Durations.Format (Support.Locale (Locale), 18_000);
      begin
         AUnit.Assertions.Assert
           (Result.Status = Ok and then Support.Text (Result) = Expect,
            Locale & " generated catalog selects Slavic duration many form");
      end Check_Duration_5_Hours;

      procedure Check_Unit_5
        (Locale : String;
         Unit   : Humanize.Units.Unit_Kind;
         Expect : String)
      is
         Result : constant Text_Result :=
           Humanize.Units.Format (Support.Locale (Locale), 5, Unit);
      begin
         AUnit.Assertions.Assert
           (Result.Status = Ok and then Support.Text (Result) = Expect,
            Locale & " generated catalog selects Slavic unit many form");
      end Check_Unit_5;
   begin
      Check_Text
        (Dutch, "2 seconden", "Dutch catalog localizes core duration unit");
      Check_Duration ("sv", "2 sekunder");
      Check_Duration ("no", "2 sekunder");
      Check_Duration ("nb", "2 sekunder");
      Check_Duration ("fi", "2 sekuntia");
      Check_Duration ("pl", "2 sekundy");
      Check_Duration ("cs", "2 sekundy");
      Check_Duration ("tr", "2 saniye");
      Check_Duration ("ru", B ("3220D181D0B5D0BAD183D0BDD0B4D18B"));
      Check_Duration ("uk", B ("3220D181D0B5D0BAD183D0BDD0B4D0B8"));
      Check_Duration ("ja", B ("3220E7A792"));
      Check_Duration ("ko", B ("3220ECB488"));
      Check_Duration ("zh", B ("3220E7A792"));
      Check_Duration ("ar", ARABIC_TWO & B ("20D8ABD988D8A7D986D98D"));
      Check_Duration ("hi", B ("3220E0A4B8E0A587E0A495E0A482E0A4A1"));
      Check_Duration_5_Hours ("pl", "5 godzin");
      Check_Duration_5_Hours ("cs", "5 hodin");
      Check_Duration_5_Hours ("ru", B ("3520D187D0B0D181D0BED0B2"));
      Check_Duration_5_Hours ("uk", B ("3520D0B3D0BED0B4D0B8D0BD"));
      Check_Unit_5
        ("pl", Humanize.Units.Meter, B ("35206D657472C3B377"));
      Check_Unit_5
        ("pl", Humanize.Units.Kilogram,
         B ("35206B696C6F6772616DC3B377"));
      Check_Unit_5
        ("cs", Humanize.Units.Meter, B ("35206D657472C5AF"));
      Check_Unit_5
        ("cs", Humanize.Units.Kilogram,
         B ("35206B696C6F6772616DC5AF"));
      Check_Unit_5
        ("ru", Humanize.Units.Meter,
         B ("3520D0BCD0B5D182D180D0BED0B2"));
      Check_Unit_5
        ("ru", Humanize.Units.Kilogram,
         B ("3520D0BAD0B8D0BBD0BED0B3D180D0B0D0BCD0BCD0BED0B2"));
      Check_Unit_5
        ("uk", Humanize.Units.Meter,
         B ("3520D0BCD0B5D182D180D196D0B2"));
      Check_Unit_5
        ("uk", Humanize.Units.Kilogram,
         B ("3520D0BAD196D0BBD0BED0B3D180D0B0D0BCD196D0B2"));
      AUnit.Assertions.Assert
        (Russian.Status = Ok and then Support.Text (Russian)'Length > 0,
         "Russian generated catalog renders number");
      AUnit.Assertions.Assert
        (Arabic.Status = Ok and then Support.Text (Arabic)'Length > 0,
         "Arabic generated catalog renders bytes");
      Check_Text
        (Symbol_Unit, "2 m2",
         "generated catalog renders broad engineering unit symbols");
      Check_Text
        (Swedish_Frequency, B ("7476C3A52067C3A56E676572"),
         "Swedish generated catalog renders frequency words");
      Check_Text
        (Finnish_Rate, "noin 4 kertaa minuutissa",
         "Finnish generated catalog renders rate words");
      Check_Text
        (Turkish_Rate, B ("686166746164612079616B6C61C59FC4B16B2034206B657A"),
         "Turkish generated catalog renders natural rate word order");
      Check_Text
        (Turkish_Less_Than, "saatte bir kezden az",
         "Turkish generated catalog renders less-than rate words");
      Check_Text
        (Japanese_Rate, B ("E6AF8EE980B1E7B484203420E59B9E"),
         "Japanese generated catalog renders natural rate word order");
      Check_Text
        (Japanese_Less_Than, B ("E6AF8EE69982203120E59B9EE69CAAE6BA80"),
         "Japanese generated catalog renders less-than rate words");
      Check_Text
        (Korean_Rate, B ("ECA3BCEB8BB920EC95BD2034EBB288"),
         "Korean generated catalog renders natural rate word order");
      Check_Text
        (Korean_Daily_Rate, B ("EC9DBCEB8BB920EC95BD2034EBB288"),
         "Korean generated catalog renders daily rate period");
      Check_Text
        (Chinese_Rate, B ("E6AF8FE591A8E7BAA6203420E6ACA1"),
         "Chinese generated catalog renders natural rate word order");
      Check_Text
        (Hindi_Rate,
         B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF")
         & " " & B ("E0A4B8E0A4AAE0A58DE0A4A4E0A4BEE0A4B9")
         & " " & B ("E0A4B2E0A497E0A4ADE0A497")
         & " 4 " & B ("E0A4ACE0A4BEE0A4B0"),
         "Hindi generated catalog renders natural rate word order");
      Check_Text
        (Hindi_Less_Than,
         B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF")
         & " " & B ("E0A498E0A482E0A49FE0A4BE")
         & " " & B ("E0A48FE0A49520E0A4ACE0A4BEE0A4B0")
         & " " & B ("E0A4B8E0A58720E0A495E0A4AE"),
         "Hindi generated catalog renders less-than rate words");
      Check_Text
        (Japanese_List, B ("616C70686120E381A82062657461"),
         "Japanese generated catalog renders list conjunction");
      Check_Text
        (Chinese_Compact, B ("312E3220E58D83"),
         "Chinese generated catalog renders compact-number suffix");
      Check_Text
        (Korean_Byte, B ("3120EBB094EC9DB4ED8AB8"),
         "Korean generated catalog renders byte word");
      Check_Text
        (Swedish_Region, "2 sekunder",
         "generated Swedish catalog resolves through region fallback");
      Check_Text
        (Norwegian_Region, "2 sekunder",
         "generated Norwegian catalog resolves through region fallback");
      Check_Text
        (Japanese_Region, B ("3220E7A792"),
         "generated Japanese catalog resolves through region fallback");
      Check_Text
        (Arabic_Region, ARABIC_TWO & B ("20D8ABD988D8A7D986D98D"),
         "generated Arabic catalog resolves through region fallback");
      Check_Text
        (Turkish_Now, B ("C59F696D6469"),
         "Turkish generated catalog renders now word");
      Check_Text
        (Polish_Yesterday, "wczoraj",
         "Polish generated catalog renders yesterday word");
      Check_Text
        (Finnish_Tomorrow, "huomenna",
         "Finnish generated catalog renders tomorrow word");
      Check_Text
        (Finnish_Five_Hours_Future, "5 tunnin kuluttua",
         "Finnish generated catalog renders explicit future relative words");
      Check_Text
        (Czech_Today, "dnes",
         "Czech generated catalog renders today word");
      Check_Text
        (Turkish_Five_Hours_Future, "5 saat sonra",
         "Turkish generated catalog renders explicit future relative words");
      Check_Text
        (Russian_Hours_Ago, B ("3220D187D0B0D181D0B020D0BDD0B0D0B7D0B0D0B4"),
         "Russian generated catalog renders relative time words");
      Check_Text
        (Polish_Five_Hours_Ago, "5 godzin temu",
         "Polish generated catalog selects Slavic relative past many form");
      Check_Text
        (Polish_Five_Hours_Future, "za 5 godzin",
         "Polish generated catalog selects Slavic relative future many form");
      Check_Text
        (Czech_Five_Hours_Ago, B ("3520686F64696E207A70C49B74"),
         "Czech generated catalog selects Slavic relative past many form");
      Check_Text
        (Czech_Five_Hours_Future, "za 5 hodin",
         "Czech generated catalog selects Slavic relative future many form");
      Check_Text
        (Russian_Five_Hours_Ago,
         B ("3520D187D0B0D181D0BED0B220D0BDD0B0D0B7D0B0D0B4"),
         "Russian generated catalog selects Slavic relative past many form");
      Check_Text
        (Russian_Five_Hours_Future,
         B ("D187D0B5D180D0B5D0B7203520D187D0B0D181D0BED0B2"),
         "Russian generated catalog selects Slavic relative future many form");
      Check_Text
        (Ukrainian_Five_Hours_Ago,
         B ("3520D0B3D0BED0B4D0B8D0BD20D182D0BED0BCD183"),
         "Ukrainian generated catalog selects Slavic relative past many form");
      Check_Text
        (Ukrainian_Five_Hours_Future,
         B ("D187D0B5D180D0B5D0B7203520D0B3D0BED0B4D0B8D0BD"),
         "Ukrainian generated catalog selects Slavic relative future many form");
      Check_Text
        (Hindi_Five_Hours_Future,
         B ("3520E0A498E0A482E0A49FE0A58720E0A4ACE0A4BEE0A4A6"),
         "Hindi generated catalog renders explicit future relative words");
      Check_Text
        (Korean_Minutes_Future, B ("3220EBB68420ED9B84"),
         "Korean generated catalog renders future relative time words");
      Check_Text
        (Humanize.Datetimes.Natural_Day
           (Support.Nl,
            (Year => 2026, Month => 3, Day => 21, others => 0),
            (Year => 2026, Month => 3, Day => 21, others => 0)),
         "vandaag",
         "Dutch native catalog renders today word");
      Check_Text
        (Humanize.Lists.Format
           (Support.Nl,
            [1 => To_Unbounded_String ("alpha"),
             2 => To_Unbounded_String ("beta")]),
         "alpha en beta",
         "Dutch native catalog renders list conjunction");
      Check_Text
        (Humanize.Frequencies.Times (Support.Da, 4),
         "4 gange",
         "Danish native catalog renders added frequency words");
      Check_Text
        (Humanize.Rates.Pace_Approximate
           (Support.Da, 4, Humanize.Rates.Per_Week),
         "cirka 4 gange per uge",
         "Danish native catalog renders added rate words");
      Check_Text
        (Humanize.Frequencies.Times (Support.De, 4),
         "4 Mal",
         "German native catalog renders added frequency words");
      Check_Text
        (Humanize.Rates.Pace_Approximate
           (Support.De, 4, Humanize.Rates.Per_Week),
         "ungefaehr 4 Mal pro Woche",
         "German native catalog renders added rate words");
      Check_Text
        (Humanize.Frequencies.Times (Support.Fr, 4),
         "4 fois",
         "French native catalog renders added frequency words");
      Check_Text
        (Humanize.Rates.Pace_Approximate
           (Support.Fr, 4, Humanize.Rates.Per_Week),
         "environ 4 fois par semaine",
         "French native catalog renders added rate words");
      Check_Text
        (Humanize.Frequencies.Times (Support.Es, 4),
         "4 veces",
         "Spanish native catalog renders added frequency words");
      Check_Text
        (Humanize.Rates.Pace_Approximate
           (Support.Es, 4, Humanize.Rates.Per_Week),
         "aproximadamente 4 veces por semana",
         "Spanish native catalog renders added rate words");
      Check_Text
        (Humanize.Frequencies.Times (Support.It, 4),
         "4 volte",
         "Italian native catalog renders added frequency words");
      Check_Text
        (Humanize.Rates.Pace_Approximate
           (Support.It, 4, Humanize.Rates.Per_Week),
         "circa 4 volte alla settimana",
         "Italian native catalog renders added rate words");
      Check_Text
        (Humanize.Frequencies.Times (Support.Pt, 4),
         "4 vezes",
         "Portuguese native catalog renders added frequency words");
      Check_Text
        (Humanize.Rates.Pace_Approximate
           (Support.Pt, 4, Humanize.Rates.Per_Week),
         "aproximadamente 4 vezes por semana",
         "Portuguese native catalog renders added rate words");
      declare
         Buffer  : String (1 .. 32);
         Written : Natural;
         Code    : Humanize.Status.Status_Code;
      begin
         Humanize.Durations.Format_Into
           (Support.Locale ("sv"), 2, Buffer, Written, Code);
         AUnit.Assertions.Assert
           (Code = Ok
            and then Buffer (1 .. Written) = "2 sekunder",
            "bounded generated duration");
      end;
      declare
         Buffer  : String (1 .. 32);
         Written : Natural;
         Code    : Humanize.Status.Status_Code;
      begin
         Humanize.Datetimes.Relative_Into
           (Support.Locale ("ru"),
            Generated_Reference - Duration (2 * 3_600),
            Generated_Reference,
            Buffer,
            Written,
            Code);
         AUnit.Assertions.Assert
           (Code = Ok
            and then Buffer (1 .. Written) = B ("3220D187D0B0D181D0B020D0BDD0B0D0B7D0B0D0B4"),
            "bounded generated relative datetime");
      end;
      declare
         Buffer  : String (1 .. 48);
         Written : Natural;
         Code    : Humanize.Status.Status_Code;
      begin
         Humanize.Rates.Pace_Approximate_Into
           (Support.Locale ("fi"),
            4,
            Humanize.Rates.Per_Minute,
            Buffer,
            Written,
            Code);
         AUnit.Assertions.Assert
           (Code = Ok
            and then Buffer (1 .. Written) = "noin 4 kertaa minuutissa",
            "bounded generated rate");
      end;
      declare
         Buffer  : String (1 .. 5);
         Written : Natural;
         Code    : Humanize.Status.Status_Code;
      begin
         Humanize.Durations.Format_Into
           (Support.Locale ("sv"), 2, Buffer, Written, Code);
         AUnit.Assertions.Assert
           (Code = Buffer_Overflow
            and then Written = Buffer'Length
            and then Buffer = "2 sek",
            "bounded generated duration overflow prefix");
      end;
   end Test_Generated_Locale_Coverage;

   procedure Test_Locale_Quality_Audit
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);

      type Locale_Audit_Code is
        (En, Da, De, Fr, Es, It, Pt, Nl, Sv, No, Nb, Fi, Pl, Cs, Tr, Ru, Uk,
         Ja, Ko, Zh, Ar, Hi);

      function Locale_Name (Code : Locale_Audit_Code) return String is
      begin
         case Code is
            when En => return "en";
            when Da => return "da";
            when De => return "de";
            when Fr => return "fr";
            when Es => return "es";
            when It => return "it";
            when Pt => return "pt";
            when Nl => return "nl";
            when Sv => return "sv";
            when No => return "no";
            when Nb => return "nb";
            when Fi => return "fi";
            when Pl => return "pl";
            when Cs => return "cs";
            when Tr => return "tr";
            when Ru => return "ru";
            when Uk => return "uk";
            when Ja => return "ja";
            when Ko => return "ko";
            when Zh => return "zh";
            when Ar => return "ar";
            when Hi => return "hi";
         end case;
      end Locale_Name;

      Reference : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (2026, 3, 21, 12.0 * 3_600.0);
      Today : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 21, others => 0);
      Tomorrow : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 22, others => 0);

      function Native_Script_Expected (Locale : String) return Boolean is
      begin
         return Locale = "ru" or else Locale = "uk" or else Locale = "ja"
           or else Locale = "ko" or else Locale = "zh" or else Locale = "ar"
           or else Locale = "hi";
      end Native_Script_Expected;

      procedure Audit_Locale (Locale : String) is
         Context : constant Humanize.Contexts.Context := Support.Locale (Locale);
      begin
         Check_Audit_Text
           (Locale, "duration-second",
            Humanize.Durations.Format (Context, 2));
         Check_Audit_Text
           (Locale, "duration-minute",
            Humanize.Durations.Format (Context, 120));
         Check_Audit_Text
           (Locale, "duration-hour",
            Humanize.Durations.Format (Context, 7_200));
         Check_Audit_Text
           (Locale, "duration-day",
            Humanize.Durations.Format (Context, 172_800));
         Check_Audit_Text
           (Locale, "duration-week",
            Humanize.Durations.Format (Context, 1_209_600));
         Check_Audit_Text
           (Locale, "duration-month",
            Humanize.Durations.Format (Context, 5_184_000));
         Check_Audit_Text
           (Locale, "duration-year",
            Humanize.Durations.Format (Context, 63_072_000));
         Check_Audit_Text
           (Locale, "bytes",
            Humanize.Bytes.Format (Context, 1_536));
         Check_Audit_Text
           (Locale, "compact-thousand",
            Humanize.Numbers.Compact (Context, 1_200));
         Check_Audit_Text
           (Locale, "compact-million",
            Humanize.Numbers.Compact (Context, 1_200_000));
         Check_Audit_Text
           (Locale, "percent",
            Humanize.Numbers.Percent (Context, 12.5));
         Check_Audit_Text
           (Locale, "frequency-count",
            Humanize.Frequencies.Times (Context, 4));
         Check_Audit_Text
           (Locale, "rate-second",
            Humanize.Rates.Pace_Approximate
              (Context, 4, Humanize.Rates.Per_Second));
         Check_Audit_Text
           (Locale, "rate-minute",
            Humanize.Rates.Pace_Approximate
              (Context, 4, Humanize.Rates.Per_Minute));
         Check_Audit_Text
           (Locale, "rate-hour",
            Humanize.Rates.Pace_Approximate
              (Context, 4, Humanize.Rates.Per_Hour));
         Check_Audit_Text
           (Locale, "rate-day",
            Humanize.Rates.Pace_Approximate
              (Context, 4, Humanize.Rates.Per_Day));
         Check_Audit_Text
           (Locale, "rate-week",
            Humanize.Rates.Pace_Approximate
              (Context, 4, Humanize.Rates.Per_Week));
         Check_Audit_Text
           (Locale, "rate-hour-less",
            Humanize.Rates.Pace_Approximate
              (Context, 0, Humanize.Rates.Per_Hour));
         Check_Audit_Text
           (Locale, "unit-meter",
            Humanize.Units.Format (Context, 5, Humanize.Units.Meter));
         Check_Audit_Text
           (Locale, "unit-kilometer",
            Humanize.Units.Format (Context, 5, Humanize.Units.Kilometer));
         Check_Audit_Text
           (Locale, "unit-centimeter",
            Humanize.Units.Format (Context, 5, Humanize.Units.Centimeter));
         Check_Audit_Text
           (Locale, "unit-millimeter",
            Humanize.Units.Format (Context, 5, Humanize.Units.Millimeter));
         Check_Audit_Text
           (Locale, "unit-gram",
            Humanize.Units.Format (Context, 5, Humanize.Units.Gram));
         Check_Audit_Text
           (Locale, "unit-kilogram",
            Humanize.Units.Format (Context, 5, Humanize.Units.Kilogram));
         Check_Audit_Text
           (Locale, "unit-milligram",
            Humanize.Units.Format (Context, 5, Humanize.Units.Milligram));
         Check_Audit_Text
           (Locale, "unit-liter",
            Humanize.Units.Format (Context, 5, Humanize.Units.Liter));
         Check_Audit_Text
           (Locale, "unit-milliliter",
            Humanize.Units.Format (Context, 5, Humanize.Units.Milliliter));
         Check_Audit_Text
           (Locale, "list",
            Humanize.Lists.Format
              (Context,
               [1 => To_Unbounded_String ("alpha"),
                2 => To_Unbounded_String ("beta"),
                3 => To_Unbounded_String ("gamma")]));
         Check_Audit_Text
           (Locale, "relative-past",
            Humanize.Datetimes.Relative
              (Context, Reference - Duration (2 * 3_600), Reference));
         Check_Audit_Text
           (Locale, "natural-today",
            Humanize.Datetimes.Natural_Day (Context, Today, Today));
         Check_Audit_Text
           (Locale, "natural-tomorrow",
            Humanize.Datetimes.Natural_Day (Context, Tomorrow, Today));

         if Native_Script_Expected (Locale) then
            Check_Native_Script_Text
              (Locale, "native-duration-hour",
               Humanize.Durations.Format (Context, 7_200));
            Check_Native_Script_Text
              (Locale, "native-duration-day",
               Humanize.Durations.Format (Context, 172_800));
            Check_Native_Script_Text
              (Locale, "native-duration-week",
               Humanize.Durations.Format (Context, 1_209_600));
            Check_Native_Script_Text
              (Locale, "native-duration-month",
               Humanize.Durations.Format (Context, 5_184_000));
            Check_Native_Script_Text
              (Locale, "native-duration-year",
               Humanize.Durations.Format (Context, 63_072_000));
            Check_Native_Script_Text
              (Locale, "native-frequency-count",
               Humanize.Frequencies.Times (Context, 4));
            Check_Native_Script_Text
              (Locale, "native-rate-week",
               Humanize.Rates.Pace_Approximate
                 (Context, 4, Humanize.Rates.Per_Week));
            Check_Native_Script_Text
              (Locale, "native-unit-meter",
               Humanize.Units.Format (Context, 5, Humanize.Units.Meter));
            Check_Native_Script_Text
              (Locale, "native-unit-kilometer",
               Humanize.Units.Format (Context, 5, Humanize.Units.Kilometer));
            Check_Native_Script_Text
              (Locale, "native-unit-centimeter",
               Humanize.Units.Format (Context, 5, Humanize.Units.Centimeter));
            Check_Native_Script_Text
              (Locale, "native-unit-millimeter",
               Humanize.Units.Format (Context, 5, Humanize.Units.Millimeter));
            Check_Native_Script_Text
              (Locale, "native-unit-gram",
               Humanize.Units.Format (Context, 5, Humanize.Units.Gram));
            Check_Native_Script_Text
              (Locale, "native-relative-past",
               Humanize.Datetimes.Relative
                 (Context, Reference - Duration (2 * 3_600), Reference));
            Check_Native_Script_Text
              (Locale, "native-natural-today",
               Humanize.Datetimes.Natural_Day (Context, Today, Today));
         end if;
      end Audit_Locale;
   begin
      for Code in Locale_Audit_Code loop
         Audit_Locale (Locale_Name (Code));
      end loop;
   end Test_Locale_Quality_Audit;

   procedure Test_Style_Presets (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use type Humanize.Datetimes.Calendar_Date_Style;
      Compact_Unit : constant Humanize.Units.Unit_Style :=
        Humanize.Styles.Unit_Style (Humanize.Styles.Compact_UI);
      Verbose_List : constant Humanize.Lists.List_Options :=
        Humanize.Styles.List_Options (Humanize.Styles.Verbose);
      Tech_Range : constant Humanize.Datetimes.Range_Options :=
        Humanize.Styles.Range_Options (Humanize.Styles.Technical);
      Compact_Date : constant Humanize.Datetimes.Calendar_Date_Options :=
        Humanize.Styles.Calendar_Date_Options (Humanize.Styles.Compact_UI);
      Verbose_Date : constant Humanize.Datetimes.Calendar_Date_Options :=
        Humanize.Styles.Calendar_Date_Options (Humanize.Styles.Verbose);
      Badge_Date : constant Humanize.Datetimes.Calendar_Date_Options :=
        Humanize.Styles.Calendar_Date_Options
          (Humanize.Styles.Calendar_Date_Compact_Badge_Preset);
      Fiscal_Date : constant Humanize.Datetimes.Calendar_Date_Options :=
        Humanize.Styles.Calendar_Date_Options
          (Humanize.Styles.Calendar_Date_Fiscal_Half_Preset, 4);
      Academic_Date : constant Humanize.Datetimes.Calendar_Date_Options :=
        Humanize.Styles.Calendar_Date_Options
          (Humanize.Styles.Calendar_Date_Semester_Preset);
      Month_Phase_Date : constant Humanize.Datetimes.Calendar_Date_Options :=
        Humanize.Styles.Calendar_Date_Options
          (Humanize.Styles.Calendar_Date_Month_Phase_Preset);
      Quarter_Phase_Date : constant Humanize.Datetimes.Calendar_Date_Options :=
        Humanize.Styles.Calendar_Date_Options
          (Humanize.Styles.Calendar_Date_Quarter_Phase_Preset);
      Fiscal_End_Date : constant Humanize.Datetimes.Calendar_Date_Options :=
        Humanize.Styles.With_Fiscal_Year_Start
          (Humanize.Styles.Calendar_Date_Fiscal_Year_End_Preset, 4);
      Override_Calendar_Date : constant Humanize.Datetimes.Calendar_Date_Options :=
        Humanize.Styles.With_Calendar_Date_Style
          (Humanize.Styles.Dashboard,
           Humanize.Datetimes.Calendar_Date_Quarter_Phase);
      Rendered_Badge : constant Text_Result :=
        Humanize.Datetimes.Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 21, others => 0),
           Badge_Date);
      Rendered_Fiscal : constant Text_Result :=
        Humanize.Datetimes.Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 10, Day => 1, others => 0),
           Fiscal_Date);
      Rendered_Academic : constant Text_Result :=
        Humanize.Datetimes.Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 9, Day => 1, others => 0),
           Academic_Date);
      Rendered_Month_Phase : constant Text_Result :=
        Humanize.Datetimes.Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 3, Day => 15, others => 0),
           Month_Phase_Date);
      Rendered_Quarter_Phase : constant Text_Result :=
        Humanize.Datetimes.Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 5, Day => 1, others => 0),
           Quarter_Phase_Date);
      Rendered_Fiscal_End : constant Text_Result :=
        Humanize.Datetimes.Calendar_Date_Label
          (Support.En,
           (Year => 2026, Month => 4, Day => 1, others => 0),
           Fiscal_End_Date);
      Telemetry_Number : constant Humanize.Numbers.Number_Options :=
        Humanize.Styles.Number_Options (Humanize.Styles.Telemetry);
      Mobile_Unit : constant Humanize.Units.Unit_Style :=
        Humanize.Styles.Unit_Style (Humanize.Styles.Mobile_UI);
      Accessible_List : constant Humanize.Lists.List_Options :=
        Humanize.Styles.List_Options (Humanize.Styles.Accessibility);
      Loading : constant Text_Result :=
        Humanize.Phrases.Status_Phrase (Support.En, Humanize.Phrases.Loading);
      Saved_De : constant Text_Result :=
        Humanize.Phrases.Status_Phrase (Support.De, Humanize.Phrases.Saved);
      Uploading : constant Text_Result :=
        Humanize.Phrases.File_Phrase (Support.En, Humanize.Phrases.Uploading);
      Required : constant Text_Result :=
        Humanize.Phrases.Validation_Phrase
          (Support.En, Humanize.Phrases.Required);
      Empty : constant Text_Result :=
        Humanize.Phrases.Empty_State_Phrase
          (Support.En, Humanize.Phrases.No_Results);
      Permission : constant Text_Result :=
        Humanize.Phrases.Network_Phrase
          (Support.En, Humanize.Phrases.Permission_Denied);
      Auth : constant Text_Result :=
        Humanize.Phrases.Auth_Phrase
          (Support.En, Humanize.Phrases.Session_Expired);
      Billing : constant Text_Result :=
        Humanize.Phrases.Billing_Phrase
          (Support.En, Humanize.Phrases.Payment_Due);
      Workflow : constant Text_Result :=
        Humanize.Phrases.Workflow_Phrase
          (Support.En, Humanize.Phrases.In_Review);
      Queue : constant Text_Result :=
        Humanize.Phrases.Queue_Phrase
          (Support.En, Humanize.Phrases.Queued);
      Domain_Label : constant Text_Result :=
        Humanize.Phrases.Domain_Label (Humanize.Phrases.Job_Domain);
      State_Label : constant Text_Result :=
        Humanize.Phrases.Summary_State_Label
          (Humanize.Phrases.Summary_Running);
      Domain_Summary : constant Text_Result :=
        Humanize.Phrases.Domain_Summary
          (Support.En, Humanize.Phrases.Job_Domain,
           Humanize.Phrases.Summary_Running, 3, 10, 1, "task", "tasks");
      Queue_Summary : constant Text_Result :=
        Humanize.Phrases.Queue_Summary
          (Support.En, 5, 2, 1, 4, "job", "jobs");
      Empty_Queue : constant Text_Result :=
        Humanize.Phrases.Queue_Summary (Support.En, 0, 0);
      Cache_Summary : constant Text_Result :=
        Humanize.Phrases.Cache_Summary (Support.En, 8, 2);
      Empty_Cache : constant Text_Result :=
        Humanize.Phrases.Cache_Summary (Support.En, 0, 0);
      Sync_Summary : constant Text_Result :=
        Humanize.Phrases.Sync_Summary (Support.En, 8, 10, 1);
      Import_Summary : constant Text_Result :=
        Humanize.Phrases.Import_Summary
          (Support.En, 1, 1, 0, "record", "records");
      Export_Summary : constant Text_Result :=
        Humanize.Phrases.Export_Summary
          (Support.En, 0, 0, 0, "file", "files");
      File_Comparison : constant Text_Result :=
        Humanize.Phrases.File_Size_Comparison
          (Support.En, 3_900_000, 1_600_000, "file A", "file B",
           Humanize.Bytes.Decimal_Byte_Options);
      File_Equal : constant Text_Result :=
        Humanize.Phrases.File_Size_Comparison
          (Support.En, 1_600_000, 1_600_000, "file A", "file B",
           Humanize.Bytes.Decimal_Byte_Options);
      Date_Before : constant Text_Result :=
        Humanize.Phrases.Date_Comparison
          (Support.En,
           (Year => 2026, Month => 3, Day => 18, others => 0),
           (Year => 2026, Month => 3, Day => 21, others => 0),
           "updated", "release");
      Date_After : constant Text_Result :=
        Humanize.Phrases.Date_Comparison
          (Support.En,
           (Year => 2026, Month => 3, Day => 24, others => 0),
           (Year => 2026, Month => 3, Day => 21, others => 0),
           "published", "release");
      Number_Comparison : constant Text_Result :=
        Humanize.Phrases.Number_Comparison
          (Support.En, 88.0, 100.0, "score", "baseline");
      Number_Unit_Comparison : constant Text_Result :=
        Humanize.Phrases.Number_Comparison
          (Support.En, 12.5, 10.0, "latency", "target", "ms", "ms");
      Percent_Comparison : constant Text_Result :=
        Humanize.Phrases.Percent_Comparison
          (Support.En, 88.0, 100.0, "score", "baseline");
      Percent_Invalid : constant Text_Result :=
        Humanize.Phrases.Percent_Comparison
          (Support.En, 88.0, 0.0, "score", "baseline");
      Security : constant Text_Result :=
        Humanize.Phrases.Security_Phrase
          (Support.En, Humanize.Phrases.Token_Expired);
      Deployment : constant Text_Result :=
        Humanize.Phrases.Deployment_Phrase
          (Support.En, Humanize.Phrases.Build_Failed);
      Health : constant Text_Result :=
        Humanize.Phrases.Health_Phrase
          (Support.En, Humanize.Phrases.Degraded);
      Notification : constant Text_Result :=
        Humanize.Phrases.Notification_Phrase
          (Support.En, Humanize.Phrases.Snoozed);
      Form : constant Text_Result :=
        Humanize.Phrases.Form_Phrase
          (Support.En, Humanize.Phrases.Invalid_Input);
      Access_Text : constant Text_Result :=
        Humanize.Phrases.Access_Phrase
          (Support.En, Humanize.Phrases.Denied);
      Sync : constant Text_Result :=
        Humanize.Phrases.Sync_Phrase
          (Support.En, Humanize.Phrases.Sync_Conflict);
      Transfer : constant Text_Result :=
        Humanize.Phrases.Transfer_Phrase
          (Support.En, Humanize.Phrases.Export_Failed);
      Search : constant Text_Result :=
        Humanize.Phrases.Search_Phrase
          (Support.En, Humanize.Phrases.No_Matches);
      Collaboration : constant Text_Result :=
        Humanize.Phrases.Collaboration_Phrase
          (Support.En, Humanize.Phrases.Typing);
      Issue : constant Text_Result :=
        Humanize.Phrases.Issue_Phrase
          (Support.En, Humanize.Phrases.Merged);
      Task_Text : constant Text_Result :=
        Humanize.Phrases.Task_Phrase
          (Support.En, Humanize.Phrases.In_Progress);
      Severity : constant Text_Result :=
        Humanize.Phrases.Severity_Label
          (Humanize.Phrases.Security_Severity
             (Humanize.Phrases.Token_Expired));
      CI : constant Text_Result :=
        Humanize.Phrases.CI_Phrase
          (Support.En, Humanize.Phrases.Pipeline_Failed);
      Ticket : constant Text_Result :=
        Humanize.Phrases.Ticket_Phrase
          (Support.En, Humanize.Phrases.Ticket_Escalated);
      Payment : constant Text_Result :=
        Humanize.Phrases.Payment_Lifecycle_Phrase
          (Support.En, Humanize.Phrases.Payment_Requires_Action);
      Spanish_Saved : constant Text_Result :=
        Humanize.Phrases.Status_Phrase
          (Support.Locale ("es"), Humanize.Phrases.Saved);
      Danish_Permission : constant Text_Result :=
        Humanize.Phrases.Network_Phrase
          (Support.Locale ("da"), Humanize.Phrases.Permission_Denied);
      Russian_CI : constant Text_Result :=
        Humanize.Phrases.CI_Phrase
          (Support.Locale ("ru"), Humanize.Phrases.Pipeline_Failed);
      Japanese_Payment : constant Text_Result :=
        Humanize.Phrases.Payment_Lifecycle_Phrase
          (Support.Locale ("ja"), Humanize.Phrases.Payment_Requires_Action);
      Phrase_Locales : constant Text_Result :=
        Humanize.Phrases.Supported_Phrase_Locales;
      Phrase_Packs : constant Text_Result :=
        Humanize.Phrases.Phrase_Pack_Summary;
      Phrase_Key : constant Text_Result :=
        Humanize.Phrases.CI_Key (Humanize.Phrases.Pipeline_Failed);
      Phrase_Tone : constant Text_Result :=
        Humanize.Phrases.Tone_Label
          (Humanize.Phrases.Tone_For_Severity
             (Humanize.Phrases.Danger_Severity));
      Override_Number : constant Humanize.Numbers.Number_Options :=
        Humanize.Styles.With_Number_Fraction_Digits
          (Humanize.Styles.Dashboard, 2, False);
      Override_Range : constant Humanize.Datetimes.Range_Options :=
        Humanize.Styles.With_Range_Separator
          (Humanize.Styles.Dashboard, '/');
      Override_Datetime : constant Humanize.Datetimes.Datetime_Options :=
        Humanize.Styles.With_Datetime_Threshold
          (Humanize.Styles.Dashboard, 5);
      Override_List : constant Humanize.Lists.List_Options :=
        Humanize.Styles.With_List_Oxford_Comma
          (Humanize.Styles.CLI, True);
      Override_Bytes : constant Humanize.Bytes.Byte_Options :=
        Humanize.Styles.With_Byte_Unit_System
          (Humanize.Styles.CLI, Humanize.Bytes.Binary);
      Override_Unit : constant Humanize.Units.Unit_Style :=
        Humanize.Styles.Select_Unit_Style
          (Humanize.Styles.Verbose, Humanize.Units.Abbreviated);
   begin
      AUnit.Assertions.Assert
        (Compact_Unit = Humanize.Units.Abbreviated,
         "compact style uses abbreviated units");
      AUnit.Assertions.Assert
        (Verbose_List.Oxford_Comma,
         "verbose style uses Oxford comma");
      AUnit.Assertions.Assert
        (not Tech_Range.Use_Month_Names and then Tech_Range.Separator = '/',
         "technical range style");
      AUnit.Assertions.Assert
        (Compact_Date.Style = Humanize.Datetimes.Calendar_Date_Medium
         and then Verbose_Date.Style = Humanize.Datetimes.Calendar_Date_Long,
         "calendar date styles");
      AUnit.Assertions.Assert
        (Badge_Date.Style = Humanize.Datetimes.Calendar_Date_Compact_Badge
         and then Fiscal_Date.Style = Humanize.Datetimes.Calendar_Date_Fiscal_Half
         and then Fiscal_Date.Fiscal_Year_Start_Month = 4
         and then Academic_Date.Style = Humanize.Datetimes.Calendar_Date_Semester
         and then Month_Phase_Date.Style =
           Humanize.Datetimes.Calendar_Date_Month_Phase
         and then Quarter_Phase_Date.Style =
           Humanize.Datetimes.Calendar_Date_Quarter_Phase
         and then Fiscal_End_Date.Style =
           Humanize.Datetimes.Calendar_Date_Fiscal_Year_End
         and then Override_Calendar_Date.Style =
           Humanize.Datetimes.Calendar_Date_Quarter_Phase,
         "focused calendar date style presets");
      AUnit.Assertions.Assert
        (Rendered_Badge.Status = Ok
         and then Support.Text (Rendered_Badge) = "Mar 21"
         and then Rendered_Fiscal.Status = Ok
         and then Support.Text (Rendered_Fiscal) = "FY2027 H2"
         and then Rendered_Academic.Status = Ok
         and then Support.Text (Rendered_Academic) = "S2 2026"
         and then Rendered_Month_Phase.Status = Ok
         and then Support.Text (Rendered_Month_Phase) = "mid-March 2026"
         and then Rendered_Quarter_Phase.Status = Ok
         and then Support.Text (Rendered_Quarter_Phase) = "mid Q2 2026"
         and then Rendered_Fiscal_End.Status = Ok
         and then Support.Text (Rendered_Fiscal_End) = "end of FY2027",
         "focused calendar date style rendering");
      AUnit.Assertions.Assert
        (Telemetry_Number.Maximum_Fraction_Digits = 3
         and then not Telemetry_Number.Suppress_Trailing_Zero,
         "telemetry number style");
      AUnit.Assertions.Assert
        (Mobile_Unit = Humanize.Units.Abbreviated,
         "mobile style uses abbreviated units");
      AUnit.Assertions.Assert
        (Accessible_List.Oxford_Comma,
         "accessibility style uses Oxford comma");
      AUnit.Assertions.Assert
        (Loading.Status = Ok and then Support.Text (Loading) = "loading",
         "English UI phrase");
      AUnit.Assertions.Assert
        (Saved_De.Status = Ok and then Support.Text (Saved_De) = "gespeichert",
         "German UI phrase");
      AUnit.Assertions.Assert
        (Uploading.Status = Ok and then Support.Text (Uploading) = "uploading",
         "file phrase");
      AUnit.Assertions.Assert
        (Required.Status = Ok and then Support.Text (Required) = "required",
         "validation phrase");
      AUnit.Assertions.Assert
        (Empty.Status = Ok and then Support.Text (Empty) = "no results",
         "empty state phrase");
      AUnit.Assertions.Assert
        (Permission.Status = Ok
         and then Support.Text (Permission) = "permission denied",
         "network permission phrase");
      AUnit.Assertions.Assert
        (Auth.Status = Ok and then Support.Text (Auth) = "session expired",
         "auth phrase");
      AUnit.Assertions.Assert
        (Billing.Status = Ok and then Support.Text (Billing) = "payment due",
         "billing phrase");
      AUnit.Assertions.Assert
        (Workflow.Status = Ok and then Support.Text (Workflow) = "in review",
         "workflow phrase");
      AUnit.Assertions.Assert
        (Queue.Status = Ok and then Support.Text (Queue) = "queued",
         "queue phrase");
      AUnit.Assertions.Assert
        (Domain_Label.Status = Ok and then Support.Text (Domain_Label) = "job"
         and then State_Label.Status = Ok
         and then Support.Text (State_Label) = "running",
         "generic summary labels");
      AUnit.Assertions.Assert
        (Domain_Summary.Status = Ok
         and then Support.Text (Domain_Summary)
           = "job running: 3 of 10 tasks complete, 1 failed",
         "generic domain progress summary");
      AUnit.Assertions.Assert
        (Queue_Summary.Status = Ok
         and then Support.Text (Queue_Summary)
           = "queue: 5 jobs queued, 2 running, 1 failed, 4 complete",
         "queue count summary");
      AUnit.Assertions.Assert
        (Empty_Queue.Status = Ok
         and then Support.Text (Empty_Queue) = "queue empty",
         "empty queue summary");
      AUnit.Assertions.Assert
        (Cache_Summary.Status = Ok
         and then Support.Text (Cache_Summary)
           = "cache: 8 hits, 2 misses, 80% hit rate",
         "cache hit-rate summary");
      AUnit.Assertions.Assert
        (Empty_Cache.Status = Ok
         and then Support.Text (Empty_Cache) = "cache: no requests",
         "empty cache summary");
      AUnit.Assertions.Assert
        (Sync_Summary.Status = Ok
         and then Support.Text (Sync_Summary)
           = "sync running: 8 of 10 items complete, 1 failed",
         "sync progress summary");
      AUnit.Assertions.Assert
        (Import_Summary.Status = Ok
         and then Support.Text (Import_Summary)
           = "import running: 1 of 1 record complete",
         "import progress summary");
      AUnit.Assertions.Assert
        (Export_Summary.Status = Ok
         and then Support.Text (Export_Summary)
           = "export running: no files",
         "export empty summary");
      AUnit.Assertions.Assert
        (File_Comparison.Status = Ok
         and then Support.Text (File_Comparison)
           = "file A is 2.3 MB larger than file B",
         "file size comparison summary");
      AUnit.Assertions.Assert
        (File_Equal.Status = Ok
         and then Support.Text (File_Equal)
           = "file A is the same size as file B",
         "equal file size comparison summary");
      AUnit.Assertions.Assert
        (Date_Before.Status = Ok
         and then Support.Text (Date_Before)
           = "updated is 3 days before release",
         "date before comparison summary");
      AUnit.Assertions.Assert
        (Date_After.Status = Ok
         and then Support.Text (Date_After)
           = "published is 3 days after release",
         "date after comparison summary");
      AUnit.Assertions.Assert
        (Number_Comparison.Status = Ok
         and then Support.Text (Number_Comparison)
           = "score is 12 lower than baseline",
         "absolute number comparison summary");
      AUnit.Assertions.Assert
        (Number_Unit_Comparison.Status = Ok
         and then Support.Text (Number_Unit_Comparison)
           = "latency is 2.5 ms higher than target",
         "unit number comparison summary");
      AUnit.Assertions.Assert
        (Percent_Comparison.Status = Ok
         and then Support.Text (Percent_Comparison)
           = "score is 12% lower than baseline",
         "relative percent comparison summary");
      AUnit.Assertions.Assert
        (Percent_Invalid.Status = Invalid_Value,
         "percent comparison rejects zero baseline");
      declare
         Buffer  : String (1 .. 80);
         Written : Natural;
         Code    : Humanize.Status.Status_Code;
      begin
         Humanize.Phrases.Cache_Summary_Into
           (Support.En, 8, 2, Buffer, Written, Code);
         AUnit.Assertions.Assert
           (Code = Ok
            and then Buffer (1 .. Written)
              = "cache: 8 hits, 2 misses, 80% hit rate",
            "bounded cache summary");
      end;
      declare
         Buffer  : String (1 .. 80);
         Written : Natural;
         Code    : Humanize.Status.Status_Code;
      begin
         Humanize.Phrases.Percent_Comparison_Into
           (Support.En, 88.0, 100.0, "score", "baseline",
            Buffer, Written, Code);
         AUnit.Assertions.Assert
           (Code = Ok
            and then Buffer (1 .. Written)
              = "score is 12% lower than baseline",
            "bounded percent comparison");
      end;
      declare
         Buffer  : String (1 .. 80);
         Written : Natural;
         Code    : Humanize.Status.Status_Code;
      begin
         Humanize.Phrases.Network_Phrase_Into
           (Support.Locale ("da"),
            Humanize.Phrases.Permission_Denied,
            Buffer,
            Written,
            Code);
         AUnit.Assertions.Assert
           (Code = Ok
            and then Buffer (1 .. Written)
              = B ("616467616E67206EC3A667746574"),
            "bounded generated-source phrase locale");
      end;
      AUnit.Assertions.Assert
        (Security.Status = Ok and then Support.Text (Security) = "token expired",
         "security phrase");
      AUnit.Assertions.Assert
        (Deployment.Status = Ok
         and then Support.Text (Deployment) = "build failed",
         "deployment phrase");
      AUnit.Assertions.Assert
        (Health.Status = Ok and then Support.Text (Health) = "degraded",
         "health phrase");
      AUnit.Assertions.Assert
        (Notification.Status = Ok
         and then Support.Text (Notification) = "snoozed",
         "notification phrase");
      AUnit.Assertions.Assert
        (Form.Status = Ok and then Support.Text (Form) = "invalid input",
         "form phrase");
      AUnit.Assertions.Assert
        (Access_Text.Status = Ok
         and then Support.Text (Access_Text) = "denied",
         "access phrase");
      AUnit.Assertions.Assert
        (Sync.Status = Ok and then Support.Text (Sync) = "sync conflict",
         "sync phrase");
      AUnit.Assertions.Assert
        (Transfer.Status = Ok
         and then Support.Text (Transfer) = "export failed",
         "transfer phrase");
      AUnit.Assertions.Assert
        (Search.Status = Ok and then Support.Text (Search) = "no matches",
         "search phrase");
      AUnit.Assertions.Assert
        (Collaboration.Status = Ok
         and then Support.Text (Collaboration) = "typing",
         "collaboration phrase");
      AUnit.Assertions.Assert
        (Issue.Status = Ok and then Support.Text (Issue) = "merged",
         "issue phrase");
      AUnit.Assertions.Assert
        (Task_Text.Status = Ok
         and then Support.Text (Task_Text) = "in progress",
         "task phrase");
      AUnit.Assertions.Assert
        (Severity.Status = Ok
         and then Support.Text (Severity) = "danger"
         and then Humanize.Phrases.Task_Severity
           (Humanize.Phrases.In_Progress) = Humanize.Phrases.Info_Severity,
         "phrase severity metadata");
      AUnit.Assertions.Assert
        (CI.Status = Ok
         and then Support.Text (CI) = "pipeline failed"
         and then Humanize.Phrases.CI_Severity
           (Humanize.Phrases.Pipeline_Failed) = Humanize.Phrases.Danger_Severity,
         "CI phrase pack");
      AUnit.Assertions.Assert
        (Ticket.Status = Ok
         and then Support.Text (Ticket) = "ticket escalated"
         and then Humanize.Phrases.Ticket_Severity
           (Humanize.Phrases.Ticket_Escalated) = Humanize.Phrases.Danger_Severity,
         "ticket phrase pack");
      AUnit.Assertions.Assert
        (Payment.Status = Ok
         and then Support.Text (Payment) = "payment requires action"
         and then Humanize.Phrases.Payment_Lifecycle_Severity
           (Humanize.Phrases.Payment_Requires_Action)
             = Humanize.Phrases.Warning_Severity,
         "payment phrase pack");
      AUnit.Assertions.Assert
        (Phrase_Locales.Status = Ok
         and then Support.Text (Phrase_Locales)
           = "en da de fr es it pt nl sv no nb fi pl cs tr ru uk ja ko zh ar hi",
         "phrase locale metadata");
      AUnit.Assertions.Assert
        (Spanish_Saved.Status = Ok
         and then Support.Text (Spanish_Saved) = B ("677561726461646F")
         and then Danish_Permission.Status = Ok
         and then Support.Text (Danish_Permission)
           = B ("616467616E67206EC3A667746574")
         and then Russian_CI.Status = Ok
         and then Support.Text (Russian_CI)
           = B ("D0BAD0BED0BDD0B2D0B5D0B9D0B5D18020D181D0B1D0BED0B9")
         and then Japanese_Payment.Status = Ok
         and then Support.Text (Japanese_Payment)
           = B ("E694AFE68995E38184E8A681E5AFBEE5BF9C"),
         "generated-source phrase locales");
      AUnit.Assertions.Assert
        (Phrase_Key.Status = Ok
         and then Support.Text (Phrase_Key) = "ci.pipeline_failed"
         and then Phrase_Tone.Status = Ok
         and then Support.Text (Phrase_Tone) = "critical",
         "phrase key and tone metadata");
      AUnit.Assertions.Assert
        (Phrase_Packs.Status = Ok
         and then Support.Text (Phrase_Packs)
           = "ui file validation empty network auth billing workflow queue security "
             & "deployment health notification form access sync transfer search "
             & "collaboration issue task ci ticket payment summaries "
             & "comparisons",
         "phrase pack summary metadata");
      AUnit.Assertions.Assert
        (Override_Number.Maximum_Fraction_Digits = 2
         and then not Override_Number.Suppress_Trailing_Zero,
         "style number override");
      AUnit.Assertions.Assert
        (Override_Range.Separator = '/'
         and then Override_Range.Use_Month_Names,
         "style range override");
      AUnit.Assertions.Assert
        (Override_Datetime.Now_Threshold_Seconds = 5,
         "style datetime threshold override");
      AUnit.Assertions.Assert
        (Override_List.Oxford_Comma,
         "style list override");
      AUnit.Assertions.Assert
        (Override_Bytes.Unit_System = Humanize.Bytes.Binary,
         "style byte unit-system override");
      AUnit.Assertions.Assert
        (Override_Unit = Humanize.Units.Abbreviated,
         "style unit override");
   end Test_Style_Presets;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize i18n integration tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_English'Access, "English output");
      Register_Routine (T, Test_Danish'Access, "Danish output (plurals + UTF-8)");
      Register_Routine (T, Test_German'Access, "German output");
      Register_Routine (T, Test_French'Access, "French output (plurals)");
      Register_Routine (T, Test_Spanish_Italian'Access, "Spanish/Italian output");
      Register_Routine (T, Test_Portuguese'Access, "Portuguese output");
      Register_Routine (T, Test_Missing_Message'Access, "missing key");
      Register_Routine (T, Test_Missing_Argument'Access, "missing argument");
      Register_Routine (T, Test_Invalid_Argument'Access, "invalid argument");
      Register_Routine (T, Test_Runtime_Error'Access, "runtime error");
      Register_Routine (T, Test_Value_Argument'Access, "value argument text");
      Register_Routine (T, Test_Count_Strict_Decimal'Access,
        "count is strict decimal");
      Register_Routine (T, Test_Lists_Frequencies_Rates'Access,
        "lists frequencies and rates");
      Register_Routine (T, Test_Generated_Locale_Coverage'Access,
        "generated locale catalog coverage");
      Register_Routine (T, Test_Locale_Quality_Audit'Access,
        "locale quality audit matrix");
      Register_Routine (T, Test_Style_Presets'Access,
        "style presets");
   end Register_Tests;

end Humanize.Tests.Rendering;
