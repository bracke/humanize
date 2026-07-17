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
   is
      pragma Unreferenced (T);
      Summary : constant Humanize.Status.Text_Result :=
        Humanize.Capabilities.Capability_Summary;
      Source : constant Humanize.Status.Text_Result :=
        Humanize.Capabilities.Rendering_Source_Label
          (Humanize.Capabilities.Area_Rendering_Source
             (Humanize.Capabilities.Phrase_Area));
      Behavior : constant Humanize.Status.Text_Result :=
        Humanize.Capabilities.Locale_Behavior_Label
          (Humanize.Capabilities.Area_Locale_Behavior
             (Humanize.Capabilities.Number_Area));
      Behavior_Summary : constant Humanize.Status.Text_Result :=
        Humanize.Capabilities.Locale_Behavior_Summary;
      Account_Features : constant Humanize.Capabilities.Feature_Support :=
        Humanize.Capabilities.Area_Features
          (Humanize.Capabilities.Account_Area);
      Domain_Features : constant Humanize.Capabilities.Feature_Support :=
        Humanize.Capabilities.Area_Features
          (Humanize.Capabilities.Domain_Detail_Area);
      Feature_Label : constant Humanize.Status.Text_Result :=
        Humanize.Capabilities.Feature_Support_Label (Domain_Features);
      Coverage : constant Humanize.Capabilities.Capability_Coverage :=
        Humanize.Capabilities.Capability_Coverage_For_All;
      Coverage_Label : constant Humanize.Status.Text_Result :=
        Humanize.Capabilities.Capability_Matrix_Summary;
      Buffer : String (1 .. 48);
      Written : Natural;
      Bounded_Status : Humanize.Status.Status_Code;
   begin
      AUnit.Assertions.Assert
        (Summary.Status = Humanize.Status.Ok
         and then Support.Text (Summary)
           = "datetimes durations bytes colors numbers strings values endpoints resources "
             & "versions geo markup secrets schema diagnostics thresholds workflows "
             & "changes tables forms navigation badges notifications search "
             & "comments tasks attachments events payments system-status "
             & "operations comparisons moderation accounts deployments data-quality "
             & "media notification-preferences permissions builds domain-details "
             & "lists frequencies "
             & "rates units phrases parsing metadata",
         "capability summary metadata");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Number_Area) = Humanize.Locale_Rendered,
         "number area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Color_Area)
            = Humanize.Deterministic_Text,
         "color area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Value_Area)
            = Humanize.Deterministic_Text,
         "value area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Endpoint_Area)
            = Humanize.Deterministic_Text,
         "endpoint area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Resource_Area)
            = Humanize.Deterministic_Text,
         "resource area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Version_Area)
            = Humanize.Deterministic_Text,
         "version area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Geo_Area)
            = Humanize.Deterministic_Text,
         "geo area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Markup_Area)
            = Humanize.Deterministic_Text,
         "markup area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Secret_Area)
            = Humanize.Deterministic_Text,
         "secret area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Schema_Area)
            = Humanize.Deterministic_Text,
         "schema area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Diagnostic_Area)
            = Humanize.Deterministic_Text,
         "diagnostic area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Threshold_Area)
            = Humanize.Deterministic_Text,
         "threshold area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Workflow_Area)
            = Humanize.Deterministic_Text,
         "workflow area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Change_Area)
            = Humanize.Deterministic_Text,
         "change area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Table_Area)
            = Humanize.Deterministic_Text,
         "table area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Form_Area)
            = Humanize.Deterministic_Text,
         "form area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Navigation_Area)
            = Humanize.Deterministic_Text,
         "navigation area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Badge_Area)
            = Humanize.Deterministic_Text,
         "badge area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Notification_Area)
            = Humanize.Deterministic_Text,
         "notification area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Search_Area)
            = Humanize.Deterministic_Text,
         "search area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Comment_Area)
            = Humanize.Deterministic_Text,
         "comment area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Task_Area)
            = Humanize.Deterministic_Text,
         "task area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Attachment_Area)
            = Humanize.Deterministic_Text,
         "attachment area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Event_Area)
            = Humanize.Deterministic_Text,
         "event area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Payment_Area)
            = Humanize.Deterministic_Text,
         "payment area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.System_Status_Area)
            = Humanize.Deterministic_Text,
         "system status area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Operation_Area)
            = Humanize.Deterministic_Text,
         "operation area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Domain_Detail_Area)
            = Humanize.Deterministic_Text,
         "domain detail area rendering source");
      AUnit.Assertions.Assert
        (Source.Status = Humanize.Status.Ok
         and then Support.Text (Source) = "deterministic-text",
         "rendering source label");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Unit_Area)
            = Humanize.Capabilities.Catalog_Localized,
         "unit area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Phrase_Area)
            = Humanize.Capabilities.Deterministic_Locale_Aware,
         "phrase area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Parsing_Area)
            = Humanize.Capabilities.Deterministic_English,
         "parsing area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Value_Area)
            = Humanize.Capabilities.Deterministic_English,
         "value area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Endpoint_Area)
            = Humanize.Capabilities.Deterministic_English,
         "endpoint area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Resource_Area)
            = Humanize.Capabilities.Deterministic_English,
         "resource area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Version_Area)
            = Humanize.Capabilities.Deterministic_English,
         "version area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Geo_Area)
            = Humanize.Capabilities.Deterministic_English,
         "geo area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Markup_Area)
            = Humanize.Capabilities.Deterministic_English,
         "markup area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Secret_Area)
            = Humanize.Capabilities.Deterministic_English,
         "secret area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Schema_Area)
            = Humanize.Capabilities.Deterministic_English,
         "schema area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Diagnostic_Area)
            = Humanize.Capabilities.Deterministic_English,
         "diagnostic area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Threshold_Area)
            = Humanize.Capabilities.Deterministic_English,
         "threshold area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Workflow_Area)
            = Humanize.Capabilities.Deterministic_English,
         "workflow area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Change_Area)
            = Humanize.Capabilities.Deterministic_English,
         "change area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Table_Area)
            = Humanize.Capabilities.Deterministic_English,
         "table area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Form_Area)
            = Humanize.Capabilities.Deterministic_English,
         "form area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Navigation_Area)
            = Humanize.Capabilities.Deterministic_English,
         "navigation area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Badge_Area)
            = Humanize.Capabilities.Deterministic_English,
         "badge area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Notification_Area)
            = Humanize.Capabilities.Deterministic_English,
         "notification area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Search_Area)
            = Humanize.Capabilities.Deterministic_English,
         "search area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Comment_Area)
            = Humanize.Capabilities.Deterministic_English,
         "comment area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Task_Area)
            = Humanize.Capabilities.Deterministic_English,
         "task area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Attachment_Area)
            = Humanize.Capabilities.Deterministic_English,
         "attachment area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Event_Area)
            = Humanize.Capabilities.Deterministic_English,
         "event area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Payment_Area)
            = Humanize.Capabilities.Deterministic_English,
         "payment area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.System_Status_Area)
            = Humanize.Capabilities.Deterministic_English,
         "system status area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Operation_Area)
            = Humanize.Capabilities.Deterministic_English,
         "operation area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Domain_Detail_Area)
            = Humanize.Capabilities.Deterministic_English,
         "domain detail area locale behavior");
      AUnit.Assertions.Assert
        (Behavior.Status = Humanize.Status.Ok
         and then Support.Text (Behavior) = "mixed-localized-deterministic",
         "number area mixed locale behavior label");
      AUnit.Assertions.Assert
        (Behavior_Summary.Status = Humanize.Status.Ok
         and then Support.Text (Behavior_Summary)
           = "catalog-localized deterministic-locale-aware deterministic-english mixed-localized-deterministic",
         "locale behavior summary metadata");
      AUnit.Assertions.Assert
        (Account_Features.Has_Bounded_Api
         and then Account_Features.Has_Options
         and then Account_Features.Has_Parse
         and then Account_Features.Has_Scan
         and then Account_Features.Has_Metadata
         and then Account_Features.Has_Accessible_Mode
         and then not Account_Features.Has_Cross_Domain
         and then Account_Features.Has_Privacy_Policy,
         "account feature support metadata");
      AUnit.Assertions.Assert
        (Domain_Features.Has_Narrative
         and then Domain_Features.Has_Label_Parts
         and then Domain_Features.Has_Diff
         and then Domain_Features.Has_Validation
         and then Domain_Features.Has_Stability,
         "domain detail composition feature metadata");
      AUnit.Assertions.Assert
        (Feature_Label.Status = Humanize.Status.Ok
         and then Support.Text (Feature_Label)
           = "bounded options parse scan metadata accessible cross-domain "
             & "privacy narrative label-parts diff validation stability",
         "domain detail feature support label");
      AUnit.Assertions.Assert
        (Coverage.Areas = 48
         and then Coverage.Bounded = 47
         and then Coverage.Parse >= 35
         and then Coverage.Scan >= 35
         and then Coverage.Metadata >= 45,
         "capability coverage counts");
      AUnit.Assertions.Assert
        (Coverage_Label.Status = Humanize.Status.Ok
         and then Support.Text (Coverage_Label)'Length > 40
         and then Support.Text (Coverage_Label)
           (Support.Text (Coverage_Label)'First
            .. Support.Text (Coverage_Label)'First + 19)
           = "capability coverage:",
         "capability matrix summary label");
      Humanize.Capabilities.Capability_Matrix_Summary_Into
        (Buffer, Written, Bounded_Status);
      AUnit.Assertions.Assert
        (Bounded_Status = Humanize.Status.Buffer_Overflow
         and then Written = Buffer'Length
         and then Buffer = "capability coverage: 48 areas, 47 bounded, 38 pa",
         "bounded capability matrix summary");

      declare
         procedure Check_Area
           (Area     : Humanize.Capabilities.Capability_Area;
            Bounded  : Boolean;
            Parse    : Boolean;
            Scan     : Boolean;
            Metadata : Boolean)
         is
            Features : constant Humanize.Capabilities.Feature_Support :=
              Humanize.Capabilities.Area_Features (Area);
         begin
            AUnit.Assertions.Assert
              (Features.Has_Bounded_Api = Bounded
               and then Features.Has_Parse = Parse
               and then Features.Has_Scan = Scan
               and then Features.Has_Metadata = Metadata,
               "capability feature drift for "
               & Humanize.Capabilities.Capability_Area'Image (Area));
         end Check_Area;
      begin
         Check_Area
           (Humanize.Capabilities.Datetime_Area, True, False, False, True);
         Check_Area
           (Humanize.Capabilities.Bytes_Area, True, False, False, True);
         Check_Area
           (Humanize.Capabilities.Color_Area, True, True, False, True);
         Check_Area
           (Humanize.Capabilities.Value_Area, True, False, False, True);
         Check_Area
           (Humanize.Capabilities.Endpoint_Area, True, True, True, True);
         Check_Area
           (Humanize.Capabilities.Account_Area, True, True, True, True);
         Check_Area
           (Humanize.Capabilities.Metadata_Area, False, False, False, True);

         for Area in Humanize.Capabilities.Capability_Area loop
            declare
               Features : constant Humanize.Capabilities.Feature_Support :=
                 Humanize.Capabilities.Area_Features (Area);
            begin
               AUnit.Assertions.Assert
                 ((not Features.Has_Scan) or else Features.Has_Parse,
                  "scan support requires parse support for "
                  & Humanize.Capabilities.Capability_Area'Image (Area));
            end;
         end loop;
      end;
   end Test_Capability_Metadata;

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
