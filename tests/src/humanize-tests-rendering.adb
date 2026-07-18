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
   is separate;

   procedure Test_Generated_Locale_Coverage
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   procedure Test_Locale_Quality_Audit
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

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
