with AUnit.Assertions;

with Ada.Strings.Fixed;
with Ada.Text_IO;

with Humanize.I18N_Rendering;
with Humanize.Messages;
with Humanize.Tests.Support;

package body Humanize.Tests.Architecture is

   use Humanize.Messages;

   --  HUM-INV-004: every Message_Id except No_Message maps to exactly one
   --  non-empty catalog key.
   procedure Test_Unique_Keys (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      AUnit.Assertions.Assert (Key (No_Message) = "", "No_Message is empty");
      for A in Message_Id loop
         if A /= No_Message then
            AUnit.Assertions.Assert
              (Key (A)'Length > 0, "key for " & Message_Id'Image (A));
            for B in Message_Id loop
               if B /= No_Message and then A < B then
                  AUnit.Assertions.Assert
                    (Key (A) /= Key (B),
                     "duplicate key " & Key (A) & " for "
                     & Message_Id'Image (A) & " and " & Message_Id'Image (B));
               end if;
            end loop;
         end if;
      end loop;
   end Test_Unique_Keys;

   --  HUM-INV-005: every key resolves in every shipped locale after
   --  Load_Defaults (English, Danish, German).
   procedure Test_Locale_Coverage (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      for Id in Message_Id loop
         if Id /= No_Message then
            AUnit.Assertions.Assert
              (Humanize.I18N_Rendering.Available (Support.En, Id),
               "English catalog missing " & Key (Id));
            AUnit.Assertions.Assert
              (Humanize.I18N_Rendering.Available (Support.Da, Id),
               "Danish catalog missing " & Key (Id));
            AUnit.Assertions.Assert
              (Humanize.I18N_Rendering.Available (Support.De, Id),
               "German catalog missing " & Key (Id));
         end if;
      end loop;
   end Test_Locale_Coverage;

   --  True when the code (comment-stripped) of the file at Path contains Needle.
   function File_Code_Contains (Path : String; Needle : String) return Boolean is
      File  : Ada.Text_IO.File_Type;
      Found : Boolean := False;
   begin
      Ada.Text_IO.Open (File, Ada.Text_IO.In_File, Path);
      while not Ada.Text_IO.End_Of_File (File) loop
         declare
            Line : constant String := Ada.Text_IO.Get_Line (File);
            --  Ignore the comment portion so prose does not count.
            Cut  : constant Natural := Ada.Strings.Fixed.Index (Line, "--");
            Code : constant String :=
              (if Cut = 0 then Line else Line (Line'First .. Cut - 1));
         begin
            if Ada.Strings.Fixed.Index (Code, Needle) /= 0 then
               Found := True;
            end if;
         end;
      end loop;
      Ada.Text_IO.Close (File);
      return Found;
   end File_Code_Contains;

   --  HUM-INV-002: domain packages must not import I18N.Runtime directly.
   procedure Check_No_Runtime (Path : String) is
   begin
      AUnit.Assertions.Assert
        (not File_Code_Contains (Path, "I18N.Runtime"),
         "domain source must not reference I18N.Runtime: " & Path);
   exception
      when Ada.Text_IO.Name_Error =>
         AUnit.Assertions.Assert
           (False, "could not open domain source for scan: " & Path);
   end Check_No_Runtime;

   --  HUM-INV-001: classifiers must not embed localized text. These catalog-only
   --  tokens never occur in Ada identifiers (English unit words are capitalized
   --  enum names like Duration_Unit_Second) or in numeric format literals, so
   --  finding any of them means localized text leaked into rule selection.
   procedure Check_No_Localized (Path : String) is
      procedure No (Token : String) is
      begin
         AUnit.Assertions.Assert
           (not File_Code_Contains (Path, Token),
            "classifier embeds localized text """ & Token & """ in " & Path);
      exception
         when Ada.Text_IO.Name_Error =>
            AUnit.Assertions.Assert
              (False, "could not open classifier source: " & Path);
      end No;
   begin
      No ("yesterday");
      No ("tomorrow");
      No (" ago");
      No ("siden");
      No ("sekund");
   end Check_No_Localized;

   procedure Test_Domain_Boundary (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Base : constant String := "../src/";
   begin
      Check_No_Runtime (Base & "humanize-datetimes.ads");
      Check_No_Runtime (Base & "humanize-datetimes.adb");
      Check_No_Runtime (Base & "humanize-durations.ads");
      Check_No_Runtime (Base & "humanize-durations.adb");
      Check_No_Runtime (Base & "humanize-bytes.ads");
      Check_No_Runtime (Base & "humanize-bytes.adb");
      Check_No_Runtime (Base & "humanize-numbers.ads");
      Check_No_Runtime (Base & "humanize-numbers.adb");
   end Test_Domain_Boundary;

   procedure Test_No_Localized_Strings (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Base : constant String := "../src/";
   begin
      Check_No_Localized (Base & "humanize-datetime_classification.adb");
      Check_No_Localized (Base & "humanize-duration_classification.adb");
      Check_No_Localized (Base & "humanize-byte_classification.adb");
   end Test_No_Localized_Strings;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize architecture/invariant tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Unique_Keys'Access,
        "every Message_Id maps to a unique key");
      Register_Routine (T, Test_Locale_Coverage'Access,
        "every key exists in en, da and de");
      Register_Routine (T, Test_Domain_Boundary'Access,
        "domain packages do not import I18N.Runtime");
      Register_Routine (T, Test_No_Localized_Strings'Access,
        "classifiers contain no localized text");
   end Register_Tests;

end Humanize.Tests.Architecture;
