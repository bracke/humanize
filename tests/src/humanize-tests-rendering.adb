with AUnit.Assertions;

with Ada.Calendar;
with Ada.Strings.Unbounded;
with I18N.Runtime;

with Humanize.Bytes;
with Humanize.Contexts;
with Humanize.Datetimes;
with Humanize.Durations;
with Humanize.Frequencies;
with Humanize.Lists;
with Humanize.Locales;
with Humanize.Numbers;
with Humanize.Phrases;
with Humanize.Rates;
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

   function Expected_Phrase_Locale_Text return String is
      Result : Unbounded_String;
   begin
      for Locale of Humanize.Phrases.Phrase_Locales loop
         if Length (Result) > 0 then
            Append (Result, " ");
         end if;
         Append (Result, Locale.all);
      end loop;
      return To_String (Result);
   end Expected_Phrase_Locale_Text;

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
      Filtered : constant Text_Result :=
        Humanize.Lists.Filtered_Count (Support.En, 3, 10);
      Filtered_None : constant Text_Result :=
        Humanize.Lists.Filtered_Count (Support.En, 0, 10, "item", "items");
      Filtered_All : constant Text_Result :=
        Humanize.Lists.Filtered_Count (Support.En, 10, 10, "item", "items");
      Page_Range : constant Text_Result :=
        Humanize.Lists.Pagination_Range (Support.En, 21, 40, 153);
      Screen_Display : constant Text_Result :=
        Humanize.Lists.Collection_Display
          (Support.En, 3, 4, Options =>
             (Style => Humanize.Lists.Screen_Reader_Display));
      Collection_Count : constant Text_Result :=
        Humanize.Lists.Collection_Count_Label (Support.En, 0);
      Collection_Summary : constant Text_Result :=
        Humanize.Lists.Collection_Summary (Support.En, 3, 10);
      Compact_Collection : constant Text_Result :=
        Humanize.Lists.Collection_Summary
          (Support.En, 3, 10,
           Options =>
             (Style => Humanize.Lists.Collection_Compact_Summary,
              Include_Total => True,
              Include_Hidden => True));
      Accessible_Collection : constant Text_Result :=
        Humanize.Lists.Collection_Summary
          (Support.En, 3, 10,
           Options =>
             (Style => Humanize.Lists.Collection_Accessible_Summary,
              Include_Total => True,
              Include_Hidden => True));
      Empty_Collection : constant Text_Result :=
        Humanize.Lists.Empty_Collection_Label (Support.En, "message", "messages");
      Invalid_Collection : constant Text_Result :=
        Humanize.Lists.Collection_Summary (Support.En, 11, 10);
      Page_Position : constant Text_Result :=
        Humanize.Lists.Page_Position_Label (Support.En, 2, 8);
      Invalid_Page_Position : constant Text_Result :=
        Humanize.Lists.Page_Position_Label (Support.En, 9, 8);
      Page_Range_Label : constant Text_Result :=
        Humanize.Lists.Page_Range_Label (Support.En, 21, 40, 153);
      Invalid_Page_Range : constant Text_Result :=
        Humanize.Lists.Page_Range_Label (Support.En, 40, 21, 153);
      Page_Nav_First : constant Text_Result :=
        Humanize.Lists.Page_Navigation_Label (Support.En, 1, 8);
      Page_Nav_Middle : constant Text_Result :=
        Humanize.Lists.Page_Navigation_Label (Support.En, 4, 8);
      Page_Nav_Last : constant Text_Result :=
        Humanize.Lists.Page_Navigation_Label (Support.En, 8, 8);
      Page_Nav_Only : constant Text_Result :=
        Humanize.Lists.Page_Navigation_Label (Support.En, 1, 1);
      Page_Size : constant Text_Result :=
        Humanize.Lists.Page_Size_Label (Support.En, 50);
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
        (Filtered.Status = Ok
         and then Support.Text (Filtered) = "3 of 10 results match",
         "filtered count partial phrase");
      AUnit.Assertions.Assert
        (Filtered_None.Status = Ok
         and then Support.Text (Filtered_None) = "no items match",
         "filtered count none phrase");
      AUnit.Assertions.Assert
        (Filtered_All.Status = Ok
         and then Support.Text (Filtered_All) = "all 10 items match",
         "filtered count all phrase");
      Humanize.Lists.Filtered_Count_Into
        (Support.En, 3, 10, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "3 of 10 results match",
         "bounded filtered count");
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
        (Collection_Count.Status = Ok
         and then Support.Text (Collection_Count) = "no items",
         "collection count label");
      AUnit.Assertions.Assert
        (Collection_Summary.Status = Ok
         and then Support.Text (Collection_Summary)
           = "showing 3 of 10 items, 7 hidden",
         "collection summary detailed phrase");
      AUnit.Assertions.Assert
        (Compact_Collection.Status = Ok
         and then Support.Text (Compact_Collection) = "3/10",
         "collection summary compact phrase");
      AUnit.Assertions.Assert
        (Accessible_Collection.Status = Ok
         and then Support.Text (Accessible_Collection)
           = "3 items visible out of 10 items",
         "collection summary accessible phrase");
      AUnit.Assertions.Assert
        (Empty_Collection.Status = Ok
         and then Support.Text (Empty_Collection) = "no messages",
         "empty collection label");
      AUnit.Assertions.Assert
        (Invalid_Collection.Status = Invalid_Argument
         and then Support.Text (Invalid_Collection) =
           "invalid collection summary",
         "invalid collection summary");
      AUnit.Assertions.Assert
        (Page_Position.Status = Ok
         and then Support.Text (Page_Position) = "page 2 of 8",
         "validated page position");
      AUnit.Assertions.Assert
        (Invalid_Page_Position.Status = Invalid_Argument
         and then Support.Text (Invalid_Page_Position) =
           "invalid page position",
         "invalid page position");
      AUnit.Assertions.Assert
        (Page_Range_Label.Status = Ok
         and then Support.Text (Page_Range_Label) =
           "21-40 of 153 results",
         "validated page range");
      AUnit.Assertions.Assert
        (Invalid_Page_Range.Status = Invalid_Argument
         and then Support.Text (Invalid_Page_Range) = "invalid page range",
         "invalid page range");
      AUnit.Assertions.Assert
        (Page_Nav_First.Status = Ok
         and then Support.Text (Page_Nav_First) =
           "first page, next available",
         "page navigation first");
      AUnit.Assertions.Assert
        (Page_Nav_Middle.Status = Ok
         and then Support.Text (Page_Nav_Middle) =
           "previous and next available",
         "page navigation middle");
      AUnit.Assertions.Assert
        (Page_Nav_Last.Status = Ok
         and then Support.Text (Page_Nav_Last) =
           "last page, previous available",
         "page navigation last");
      AUnit.Assertions.Assert
        (Page_Nav_Only.Status = Ok
         and then Support.Text (Page_Nav_Only) = "only page",
         "page navigation only");
      AUnit.Assertions.Assert
        (Page_Size.Status = Ok
         and then Support.Text (Page_Size) = "50 results per page",
         "page size label");
      Humanize.Lists.Collection_Summary_Into
        (Support.En, 3, 10, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 31
         and then Buffer (1 .. Written) = "showing 3 of 10 items, 7 hidden",
         "bounded collection summary exact");
      Humanize.Lists.Page_Position_Label_Into
        (Support.En, 9, 8, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "bounded invalid page position");
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
   is separate;

   procedure Test_Locale_Quality_Audit
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);

      Reference : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (2026, 3, 21, 12.0 * 3_600.0);
      Today : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 21, others => 0);
      Tomorrow : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 22, others => 0);

      function Native_Script_Expected (Locale : String) return Boolean is
      begin
         return Locale = "ru" or else Locale = "uk"
           or else Humanize.Locales.Is_CJK (Locale)
           or else Locale = "ar" or else Locale = "hi";
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
      for Locale_Access of Humanize.Locales.Shipped_Locales loop
         Audit_Locale (Locale_Access.all);
      end loop;
   end Test_Locale_Quality_Audit;

   procedure Test_Style_Presets (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

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
      Register_Routine (T, Test_Runtime_Error'Access, "runtime error");
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
