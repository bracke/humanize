with AUnit.Assertions;

with I18N.Runtime;

with Humanize.Capabilities;
with Humanize.Bytes;
with Humanize.Catalogs;
with Humanize.Contexts;
with Humanize.Durations;
with Humanize.Locales;
with Humanize.Messages;
with Humanize.Phrases;
with Humanize.Status;
with Humanize.Tests.Support;
with Humanize.Values;

package body Humanize.Tests.Architecture is

   use Humanize.Messages;
   use type I18N.Runtime.Load_Status;
   use type Humanize.Capabilities.Locale_Behavior;
   use type Humanize.Locales.Locale_Code_Array;
   use type Humanize.Rendering_Source;
   use type Humanize.Status.Status_Code;

   Duplicate_Runtime : aliased I18N.Runtime.Instance;

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
   --  Load_Defaults.
   procedure Test_Locale_Coverage (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);

      procedure Check (Locale : String; Label : String; Id : Message_Id) is
      begin
         AUnit.Assertions.Assert
            (Humanize.Catalogs.Available (Support.Locale (Locale), Id),
            Label & " catalog missing " & Key (Id));
      end Check;

      Shipped : constant Humanize.Locales.Shipped_Locale_List :=
        Humanize.Locales.Shipped_Locales;
      Regional : constant Humanize.Locales.Regional_Locale_List :=
        Humanize.Locales.Regional_Shipped_Locales;
      All_Locales : constant Humanize.Locales.All_Shipped_Locale_List :=
        Humanize.Locales.All_Shipped_Locales;
      Phrase_Locales : constant Humanize.Phrases.Phrase_Locale_List :=
        Humanize.Phrases.Phrase_Locales;
      Generated_Phrase_Locales : constant
        Humanize.Phrases.Generated_Phrase_Locale_List :=
          Humanize.Phrases.Generated_Phrase_Locales;
   begin
      AUnit.Assertions.Assert
        (Shipped'Length = Humanize.Locales.Shipped_Locale_Count,
         "shipped locale list length matches declared count");
      AUnit.Assertions.Assert
        (Regional'Length = Humanize.Locales.Regional_Shipped_Locale_Count,
         "regional shipped locale list length matches declared count");
      AUnit.Assertions.Assert
        (All_Locales'Length = Humanize.Locales.All_Shipped_Locale_Count,
         "all shipped locale list length matches declared count");
      AUnit.Assertions.Assert
        (Humanize.Catalogs.Shipped_Locales = Shipped
         and then Humanize.Catalogs.Regional_Shipped_Locales = Regional
         and then Humanize.Catalogs.All_Shipped_Locales = All_Locales,
         "catalog locale aliases delegate to neutral locale metadata");
      AUnit.Assertions.Assert
        (Phrase_Locales'Length = Humanize.Phrases.Phrase_Locale_Count,
         "phrase locale list length matches declared count");
      AUnit.Assertions.Assert
        (Generated_Phrase_Locales'Length =
           Humanize.Phrases.Generated_Phrase_Locale_Count,
         "generated phrase locale list length matches declared count");

      for I in Shipped'Range loop
         AUnit.Assertions.Assert
           (All_Locales (I).all = Shipped (I).all,
            "all shipped locales preserve base locale order at"
            & Positive'Image (I));
         AUnit.Assertions.Assert
           (Humanize.Locales.Base_Locale (Shipped (I).all) = Shipped (I).all,
            "base locale helper preserves base tag " & Shipped (I).all);
         AUnit.Assertions.Assert
           (Humanize.Locales.Locale_Prefix (Shipped (I).all) = Shipped (I).all,
            "locale prefix helper preserves two-letter base tag "
            & Shipped (I).all);
         AUnit.Assertions.Assert
           (Humanize.Locales.Is_Base_Shipped_Locale (Shipped (I).all)
            and then Humanize.Locales.Is_Shipped_Locale (Shipped (I).all)
            and then Humanize.Catalogs.Is_Base_Shipped_Locale (Shipped (I).all)
            and then Humanize.Catalogs.Is_Shipped_Locale (Shipped (I).all),
            "shipped locale predicates accept base tag " & Shipped (I).all);
      end loop;

      for I in Regional'Range loop
         AUnit.Assertions.Assert
           (All_Locales (Shipped'Length + I).all = Regional (I).all,
            "all shipped locales append regional locale order at"
            & Positive'Image (I));
         AUnit.Assertions.Assert
           (Humanize.Locales.Is_Regional_Shipped_Locale (Regional (I).all)
            and then Humanize.Locales.Is_Shipped_Locale (Regional (I).all)
            and then Humanize.Catalogs.Is_Regional_Shipped_Locale
              (Regional (I).all)
            and then Humanize.Catalogs.Is_Shipped_Locale (Regional (I).all),
            "shipped locale predicates accept regional tag "
            & Regional (I).all);
      end loop;

      AUnit.Assertions.Assert
        (Humanize.Locales.Locale_Prefix ("sv-SE") = "sv"
         and then Humanize.Locales.Locale_Prefix ("SV_se") = "sv"
         and then Humanize.Locales.Locale_Prefix ("EN") = "en"
         and then Humanize.Locales.Locale_Prefix ("ABC") = "ab"
         and then Humanize.Locales.Locale_Prefix ("") = ""
         and then Humanize.Locales.Locale_Prefix ("X") = "x",
         "locale prefix helper normalizes case and short tags");
      AUnit.Assertions.Assert
        (Humanize.Locales.Base_Locale ("DA-dk") = "da"
         and then Humanize.Locales.Base_Locale ("en_US") = "en"
         and then Humanize.Locales.Base_Locale ("en-US-posix") = "en"
         and then Humanize.Locales.Base_Locale ("fr") = "fr"
         and then Humanize.Locales.Base_Locale ("") = "",
         "base locale helper normalizes case and regional separators");
      AUnit.Assertions.Assert
        (Humanize.Locales.Language_Code ("DA-dk") = "da"
         and then Humanize.Locales.Language_Code ("en_US") = "en"
         and then Humanize.Locales.Language_Code ("fr") = "fr"
         and then Humanize.Locales.Language_Code ("") = "",
         "language code helper handles case and regional separators");
      AUnit.Assertions.Assert
        (Humanize.Locales.Region_Code ("DA-dk") = "dk"
         and then Humanize.Locales.Region_Code ("en_US") = "us"
         and then Humanize.Locales.Region_Code ("en-US-posix") = "us"
         and then Humanize.Locales.Region_Code ("fr") = ""
         and then Humanize.Locales.Region_Code ("") = "",
         "region code helper handles case, variants, and base locales");
      AUnit.Assertions.Assert
        (Humanize.Locales.Is_Base_Shipped_Locale ("EN")
         and then not Humanize.Locales.Is_Base_Shipped_Locale ("en-US")
         and then Humanize.Locales.Is_Regional_Shipped_Locale ("SV_se")
         and then not Humanize.Locales.Is_Regional_Shipped_Locale ("sv-FI")
         and then Humanize.Locales.Is_Shipped_Locale ("nb_no")
         and then not Humanize.Locales.Is_Shipped_Locale ("zz")
         and then Humanize.Catalogs.Is_Shipped_Locale ("ja_JP")
         and then not Humanize.Catalogs.Is_Shipped_Locale ("ja-US"),
         "shipped locale predicates normalize case and separators");
      AUnit.Assertions.Assert
        (Humanize.Locales.Canonical_Shipped_Locale ("EN") = "en"
         and then Humanize.Locales.Canonical_Shipped_Locale ("SV_se") = "sv-SE"
         and then Humanize.Locales.Canonical_Shipped_Locale ("nb-NO") = "nb-NO"
         and then Humanize.Locales.Canonical_Shipped_Locale ("ja_JP_posix") =
           "ja-JP"
         and then Humanize.Locales.Canonical_Shipped_Locale ("sv-FI") = ""
         and then Humanize.Locales.Canonical_Shipped_Locale ("zz") = ""
         and then Humanize.Catalogs.Canonical_Shipped_Locale ("AR_eg") =
           "ar-EG",
         "canonical shipped locale helper normalizes accepted shipped tags");

      AUnit.Assertions.Assert
        (Humanize.Locales.Is_Norwegian ("no")
         and then Humanize.Locales.Is_Norwegian ("NO")
         and then Humanize.Locales.Is_Norwegian ("nb")
         and then Humanize.Locales.Is_Norwegian ("nb-NO")
         and then Humanize.Locales.Is_Norwegian ("NB_no")
         and then not Humanize.Locales.Is_Norwegian ("nn")
         and then not Humanize.Locales.Is_Norwegian ("da-DK"),
         "Norwegian locale family predicate normalizes language tags");
      AUnit.Assertions.Assert
        (Humanize.Locales.Is_CJK ("ja")
         and then Humanize.Locales.Is_CJK ("JA")
         and then Humanize.Locales.Is_CJK ("ja-JP")
         and then Humanize.Locales.Is_CJK ("ko")
         and then Humanize.Locales.Is_CJK ("ko-KR")
         and then Humanize.Locales.Is_CJK ("zh")
         and then Humanize.Locales.Is_CJK ("zh_CN")
         and then not Humanize.Locales.Is_CJK ("ar")
         and then not Humanize.Locales.Is_CJK ("ar-EG"),
         "CJK locale family predicate normalizes language tags");

      for Id in Message_Id loop
         if Id /= No_Message then
            for Locale of All_Locales loop
               Check (Locale.all, Locale.all, Id);
            end loop;
         end if;
      end loop;

      for I in Shipped'Range loop
         declare
            Candidate : constant String := Shipped (I).all;
         begin
            for J in I + 1 .. Shipped'Last loop
               AUnit.Assertions.Assert
                 (Candidate /= Shipped (J).all,
                  "duplicate shipped locale " & Candidate);
            end loop;
         end;
      end loop;

      for I in Regional'Range loop
         declare
            Candidate : constant String := Regional (I).all;
         begin
            for J in I + 1 .. Regional'Last loop
               AUnit.Assertions.Assert
                 (Candidate /= Regional (J).all,
                  "duplicate regional shipped locale " & Candidate);
            end loop;
         end;
      end loop;

      for I in Shipped'Range loop
         declare
            Candidate : constant String := Shipped (I).all;
         begin
            for Regional_Candidate of Regional loop
               AUnit.Assertions.Assert
                 (Candidate /= Regional_Candidate.all,
                  "shipped locale overlaps regional locale " & Candidate);
            end loop;
         end;
      end loop;

      for Regional_Candidate of Regional loop
         declare
            Base : constant String :=
              Humanize.Locales.Base_Locale (Regional_Candidate.all);
            Found : Boolean := False;
         begin
            for S of Shipped loop
               if Base = S.all then
                  Found := True;
                  exit;
               end if;
            end loop;

            AUnit.Assertions.Assert
              (Found, "regional locale base missing in shipped locales: " &
                 Regional_Candidate.all);
         end;
      end loop;

      for I in All_Locales'Range loop
         declare
            Candidate : constant String := All_Locales (I).all;
         begin
            for J in I + 1 .. All_Locales'Last loop
               AUnit.Assertions.Assert
                 (Candidate /= All_Locales (J).all,
                  "duplicate all shipped locale " & Candidate);
            end loop;
         end;
      end loop;

      for I in Phrase_Locales'Range loop
         declare
            Candidate : constant String := Phrase_Locales (I).all;
            Found : Boolean := False;
         begin
            for J in I + 1 .. Phrase_Locales'Last loop
               AUnit.Assertions.Assert
                 (Candidate /= Phrase_Locales (J).all,
                  "duplicate phrase locale " & Candidate);
            end loop;

            for Shipped_Candidate of Shipped loop
               if Candidate = Shipped_Candidate.all then
                  Found := True;
                  exit;
               end if;
            end loop;

            AUnit.Assertions.Assert
              (Found, "phrase locale missing in shipped locales: " & Candidate);
            AUnit.Assertions.Assert
              (Humanize.Phrases.Is_Supported_Phrase_Locale (Candidate),
               "phrase locale predicate rejects " & Candidate);
         end;
      end loop;

      for I in Generated_Phrase_Locales'Range loop
         declare
            Candidate : constant String := Generated_Phrase_Locales (I).all;
            Found : Boolean := False;
         begin
            for J in I + 1 .. Generated_Phrase_Locales'Last loop
               AUnit.Assertions.Assert
                 (Candidate /= Generated_Phrase_Locales (J).all,
                  "duplicate generated phrase locale " & Candidate);
            end loop;

            for Phrase_Candidate of Phrase_Locales loop
               if Candidate = Phrase_Candidate.all then
                  Found := True;
                  exit;
               end if;
            end loop;

            AUnit.Assertions.Assert
              (Found,
               "generated phrase locale missing in phrase locales: "
               & Candidate);
            AUnit.Assertions.Assert
              (Humanize.Phrases.Is_Generated_Phrase_Locale (Candidate),
               "generated phrase locale predicate rejects " & Candidate);
         end;
      end loop;
   end Test_Locale_Coverage;

   procedure Test_Catalog_Duplicate_Policy
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      First   : I18N.Runtime.Load_Result;
      Reject  : I18N.Runtime.Load_Result;
      Keep    : I18N.Runtime.Load_Result;
      Replace : I18N.Runtime.Load_Result;
      Swedish : Humanize.Status.Text_Result;
   begin
      Humanize.Catalogs.Load_Defaults (Duplicate_Runtime, First);
      AUnit.Assertions.Assert
        (First.Status = I18N.Runtime.Loaded
         and then First.Entries_Added > 0,
         "initial built-in catalog load");

      Humanize.Catalogs.Load_Defaults (Duplicate_Runtime, Reject);
      AUnit.Assertions.Assert
        (Reject.Status = I18N.Runtime.Duplicate_Rejected,
         "default duplicate policy rejects second built-in catalog load");

      Swedish :=
        Humanize.Durations.Format
          (Humanize.Contexts.Create (Duplicate_Runtime'Access, "sv"), 2);
      AUnit.Assertions.Assert
        (Swedish.Status = Humanize.Status.Ok
         and then Support.Text (Swedish) = "2 sekunder",
         "rejected duplicate load leaves generated catalog usable");

      Humanize.Catalogs.Load_Defaults
        (Duplicate_Runtime, Keep, I18N.Runtime.Keep_First);
      AUnit.Assertions.Assert
        (Keep.Status = I18N.Runtime.Loaded
         and then Keep.Entries_Added = 0
         and then Keep.Entries_Ignored > 0,
         "explicit duplicate policy can keep existing built-in catalog keys");

      Humanize.Catalogs.Load_Defaults
        (Duplicate_Runtime, Replace, I18N.Runtime.Override_Previous);
      AUnit.Assertions.Assert
        (Replace.Status = I18N.Runtime.Loaded
         and then Replace.Entries_Added = 0
         and then Replace.Entries_Replaced > 0,
         "explicit duplicate policy can replace built-in catalog keys");

      Swedish :=
        Humanize.Durations.Format
          (Humanize.Contexts.Create (Duplicate_Runtime'Access, "sv"), 2);
      AUnit.Assertions.Assert
        (Swedish.Status = Humanize.Status.Ok
         and then Support.Text (Swedish) = "2 sekunder",
         "replaced duplicate load leaves generated catalog usable");
   end Test_Catalog_Duplicate_Policy;

   procedure Test_Capability_Metadata
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   procedure Test_Public_API_Consistency
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Buffer  : String (1 .. 256);
      Written : Natural;
      Code    : Humanize.Status.Status_Code;

      procedure Check
        (Owned : Humanize.Status.Text_Result;
         Label : String)
      is
      begin
         AUnit.Assertions.Assert
           (Owned.Status = Humanize.Status.Ok,
            Label & " owned result status");
         AUnit.Assertions.Assert
           (Code = Humanize.Status.Ok
            and then Buffer (Buffer'First .. Buffer'First + Written - 1) =
              Support.Text (Owned),
            Label & " bounded result matches owned result");
      end Check;
   begin
      Humanize.Bytes.Format_Into
        (Support.En, 1_536, Buffer, Written, Code);
      Check (Humanize.Bytes.Format (Support.En, 1_536), "byte format");

      Humanize.Durations.Format_Into
        (Support.En, 90, Buffer, Written, Code);
      Check (Humanize.Durations.Format (Support.En, 90), "duration format");

      Humanize.Values.Boolean_Label_Into
        (True, Buffer, Written, Code, Humanize.Values.Enabled_Disabled);
      Check
        (Humanize.Values.Boolean_Label
           (True, Humanize.Values.Enabled_Disabled),
         "boolean label");

      Humanize.Capabilities.Capability_Matrix_Summary_Into
        (Buffer, Written, Code);
      Check
        (Humanize.Capabilities.Capability_Matrix_Summary,
         "capability matrix summary");

      AUnit.Assertions.Assert
        (Humanize.Capabilities.Capability_Coverage_For_All.Bounded >= 47
         and then Humanize.Capabilities.Capability_Coverage_For_All.Parse >= 35
         and then Humanize.Capabilities.Capability_Coverage_For_All.Scan >= 35,
         "public capability metadata exposes bounded parse scan coverage");
   end Test_Public_API_Consistency;

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
        "every key exists in each shipped locale");
      Register_Routine (T, Test_Catalog_Duplicate_Policy'Access,
        "catalog duplicate policy");
      Register_Routine (T, Test_Capability_Metadata'Access,
        "capability metadata");
      Register_Routine (T, Test_Public_API_Consistency'Access,
        "public API consistency");
   end Register_Tests;

end Humanize.Tests.Architecture;
