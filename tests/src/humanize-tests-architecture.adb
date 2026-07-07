with AUnit.Assertions;

with I18N.Runtime;

with Humanize.Capabilities;
with Humanize.Catalogs;
with Humanize.Contexts;
with Humanize.Durations;
with Humanize.I18N_Rendering;
with Humanize.Messages;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Architecture is

   use Humanize.Messages;
   use type I18N.Runtime.Load_Status;
   use type Humanize.Capabilities.Locale_Behavior;
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
           (Humanize.I18N_Rendering.Available (Support.Locale (Locale), Id),
            Label & " catalog missing " & Key (Id));
      end Check;
   begin
      for Id in Message_Id loop
         if Id /= No_Message then
            Check ("en", "English", Id);
            Check ("da-DK", "Danish", Id);
            Check ("de", "German", Id);
            Check ("fr", "French", Id);
            Check ("es", "Spanish", Id);
            Check ("it", "Italian", Id);
            Check ("pt", "Portuguese", Id);
            Check ("nl", "Dutch", Id);
            Check ("sv", "Swedish generated", Id);
            Check ("no", "Norwegian generated", Id);
            Check ("nb", "Norwegian Bokmal generated", Id);
            Check ("fi", "Finnish generated", Id);
            Check ("pl", "Polish generated", Id);
            Check ("cs", "Czech generated", Id);
            Check ("tr", "Turkish generated", Id);
            Check ("ro", "Romanian generated", Id);
            Check ("lt", "Lithuanian generated", Id);
            Check ("sl", "Slovenian generated", Id);
            Check ("id", "Indonesian generated", Id);
            Check ("ms", "Malay generated", Id);
            Check ("eo", "Esperanto generated", Id);
            Check ("vi", "Vietnamese generated", Id);
            Check ("sw", "Swahili generated", Id);
            Check ("af", "Afrikaans generated", Id);
            Check ("hu", "Hungarian generated", Id);
            Check ("sk", "Slovak generated", Id);
            Check ("ru", "Russian generated", Id);
            Check ("uk", "Ukrainian generated", Id);
            Check ("ja", "Japanese generated", Id);
            Check ("ko", "Korean generated", Id);
            Check ("zh", "Chinese generated", Id);
            Check ("ar", "Arabic generated", Id);
            Check ("hi", "Hindi generated", Id);
            Check ("sv-SE", "Swedish regional generated", Id);
            Check ("nb-NO", "Norwegian regional generated", Id);
            Check ("ja-JP", "Japanese regional generated", Id);
            Check ("ar-EG", "Arabic regional generated", Id);
         end if;
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
   begin
      AUnit.Assertions.Assert
        (Summary.Status = Humanize.Status.Ok
         and then Support.Text (Summary)
           = "datetimes durations bytes colors numbers strings lists frequencies rates units phrases parsing metadata",
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
        (Behavior.Status = Humanize.Status.Ok
         and then Support.Text (Behavior) = "mixed-localized-deterministic",
         "number area mixed locale behavior label");
      AUnit.Assertions.Assert
        (Behavior_Summary.Status = Humanize.Status.Ok
         and then Support.Text (Behavior_Summary)
           = "catalog-localized deterministic-locale-aware deterministic-english mixed-localized-deterministic",
         "locale behavior summary metadata");
   end Test_Capability_Metadata;

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
   end Register_Tests;

end Humanize.Tests.Architecture;
