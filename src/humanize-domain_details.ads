with Humanize.Status;

--  Shared metadata, display policy, and cross-domain summaries for typed domains.
package Humanize.Domain_Details is
   type Domain_Surface is
     (Operations_Surface,
      Comparisons_Surface,
      Moderation_Surface,
      Accounts_Surface,
      Deployments_Surface,
      Data_Quality_Surface,
      Media_Surface,
      Notification_Preferences_Surface,
      Permissions_Surface,
      Builds_Surface,
      Values_Surface,
      Endpoints_Surface,
      Resources_Surface,
      Versions_Surface,
      Geo_Surface,
      Markup_Surface,
      Secrets_Surface,
      Schema_Surface,
      Diagnostics_Surface,
      Thresholds_Surface,
      Workflows_Surface,
      Changes_Surface,
      Tables_Surface,
      Forms_Surface,
      Navigation_Surface,
      Badges_Surface,
      Notifications_Surface,
      Search_Surface,
      Comments_Surface,
      Tasks_Surface,
      Attachments_Surface,
      Events_Surface,
      Payments_Surface,
      System_Status_Surface);
   --  Typed Humanize domain surface added for admin, operational, and UI labels.

   type Output_Mode is
     (Compact_Output,
      Detailed_Output,
      Accessible_Output,
      Log_Output);
   --  Display policy for deterministic domain labels.

   type Domain_Severity is
     (Neutral_Severity,
      Info_Severity,
      Success_Severity,
      Warning_Severity,
      Danger_Severity);
   --  Stable severity metadata for domain labels.

   type Domain_Tone is
     (Plain_Tone,
      Positive_Tone,
      Caution_Tone,
      Critical_Tone,
      Muted_Tone);
   --  Stable tone metadata for UI styling.

   type Domain_Label_Metadata is record
      Surface  : Domain_Surface := Operations_Surface;
      Severity : Domain_Severity := Neutral_Severity;
      Tone     : Domain_Tone := Plain_Tone;
      Final    : Boolean := False;
      Actionable : Boolean := False;
   end record;
   --  Machine-readable metadata accompanying a deterministic domain label.

   type Domain_Label_Options is record
      Mode             : Output_Mode := Detailed_Output;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;
   --  Common output options for cross-domain labels.

   Default_Domain_Label_Options : constant Domain_Label_Options :=
     (Mode             => Detailed_Output,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   function Make_Label_Options
     (Mode             : Output_Mode;
      Include_Surface  : Boolean;
      Include_Severity : Boolean;
      Include_Tone     : Boolean)
      return Domain_Label_Options;
   --  @param Mode Output style for the rendered label.
   --  @param Include_Surface Whether to include the domain surface prefix.
   --  @param Include_Severity Whether to include severity metadata in text.
   --  @param Include_Tone Whether to include tone metadata in text.
   --  @return Common domain label options built from adapter fields.

   type Domain_Label_Parse_Result is record
      Status          : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Surface         : Domain_Surface := Operations_Surface;
      Severity        : Domain_Severity := Neutral_Severity;
      Tone            : Domain_Tone := Plain_Tone;
      Consumed        : Natural := 0;
      Has_Surface     : Boolean := False;
      Has_Severity    : Boolean := False;
      Has_Tone        : Boolean := False;
      Body_First      : Natural := 0;
      Body_Length     : Natural := 0;
   end record;
   --  Metadata parsed from labels rendered with Domain_Label.

   type Domain_Render_Result is record
      Status   : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Text     : Humanize.Status.Text_Result;
      Metadata : Domain_Label_Metadata;
   end record;
   --  Rendered label and the machine-readable metadata used to produce it.

   type Named_Label_Parse_Result is record
      Status      : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Surface     : Domain_Surface := Operations_Surface;
      Metadata    : Domain_Label_Metadata;
      Consumed    : Natural := 0;
      Name_First  : Natural := 0;
      Name_Length : Natural := 0;
      State_First : Natural := 0;
      State_Length : Natural := 0;
   end record;
   --  Parsed name/body and state span from common "name state" labels.

   type Log_Field_Parse_Result is record
      Status       : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Consumed     : Natural := 0;
      Key_First    : Natural := 0;
      Key_Length   : Natural := 0;
      Value_First  : Natural := 0;
      Value_Length : Natural := 0;
   end record;
   --  Parsed key/value span from a common log-mode "key=value" field.

   type Label_Part_Kind is
     (Primary_Part,
      Qualifier_Part,
      Count_Part,
      Unit_Part,
      Severity_Part,
      Safe_Value_Part,
      Action_Part,
      Metadata_Part);
   --  Semantic role for a stable part of a humanized label.

   type Label_Part is record
      Kind        : Label_Part_Kind := Primary_Part;
      Text        : String (1 .. 96) := [others => ' '];
      Text_Length : Natural := 0;
   end record;
   --  Bounded label part for renderers that need styling or accessibility spans.

   type Label_Part_List is array (Positive range <>) of Label_Part;
   --  Caller-owned list of semantic label parts.

   type Diff_Kind is
     (No_Diff,
      Added_Diff,
      Removed_Diff,
      Changed_Diff,
      Renamed_Diff,
      Moved_Diff,
      Redacted_Diff);
   --  Stable diff categories for humanized change explanations.

   type Output_Profile is record
      Mode             : Output_Mode := Detailed_Output;
      Include_Metadata : Boolean := False;
      Accessible       : Boolean := False;
      Log_Safe         : Boolean := False;
      Compact          : Boolean := False;
      Terminal_Width   : Natural := 0;
   end record;
   --  Cross-package output policy for callers rendering several label families.

   Default_Output_Profile : constant Output_Profile :=
     (Mode             => Detailed_Output,
      Include_Metadata => False,
      Accessible       => False,
      Log_Safe         => False,
      Compact          => False,
      Terminal_Width   => 0);

   type Label_Stability_Metadata is record
      Round_Trippable  : Boolean := False;
      Lossless         : Boolean := True;
      Approximate      : Boolean := False;
      Locale_Dependent : Boolean := False;
      Privacy_Safe     : Boolean := True;
      Stable_For_Logs  : Boolean := True;
      Bounded_Available : Boolean := False;
   end record;
   --  Machine-readable stability and safety metadata for a public label API.

   type Example_Case is record
      Area       : Domain_Surface := Operations_Surface;
      Name       : String (1 .. 64) := [others => ' '];
      Name_Length : Natural := 0;
      Input      : String (1 .. 96) := [others => ' '];
      Input_Length : Natural := 0;
      Expected   : String (1 .. 96) := [others => ' '];
      Expected_Length : Natural := 0;
      Stability  : Label_Stability_Metadata := (others => <>);
   end record;
   --  Bounded public example/corpus descriptor for documentation and snapshots.

   type Composition_Label_Parse_Result is record
      Status            : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Consumed          : Natural := 0;
      Subject_First     : Natural := 0;
      Subject_Length    : Natural := 0;
      Action_First      : Natural := 0;
      Action_Length     : Natural := 0;
      Result_First      : Natural := 0;
      Result_Length     : Natural := 0;
      Detail_First      : Natural := 0;
      Detail_Length     : Natural := 0;
   end record;
   --  Parsed spans from narrative, event, aggregate, and validation labels.

   type Diff_Label_Parse_Result is record
      Status           : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Kind             : Diff_Kind := No_Diff;
      Consumed         : Natural := 0;
      Field_First      : Natural := 0;
      Field_Length     : Natural := 0;
      Old_Value_First  : Natural := 0;
      Old_Value_Length : Natural := 0;
      New_Value_First  : Natural := 0;
      New_Value_Length : Natural := 0;
      Redacted         : Boolean := False;
   end record;
   --  Parsed spans and kind from a deterministic diff label.

   type Count_Label_Parse_Result is record
      Status        : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Consumed      : Natural := 0;
      Subject_First : Natural := 0;
      Subject_Length : Natural := 0;
      Total         : Natural := 0;
      Success       : Natural := 0;
      Warning       : Natural := 0;
      Failure       : Natural := 0;
      Lines_Added   : Natural := 0;
      Lines_Removed : Natural := 0;
      Words_Changed : Natural := 0;
   end record;
   --  Parsed counts from aggregate and text-diff labels.

   type Stability_Label_Parse_Result is record
      Status   : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Consumed : Natural := 0;
      Metadata : Label_Stability_Metadata := (others => <>);
   end record;
   --  Parsed stability metadata from Stability_Metadata_Label.

   type Example_Case_Parse_Result is record
      Status          : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Consumed        : Natural := 0;
      Area            : Domain_Surface := Operations_Surface;
      Name_First      : Natural := 0;
      Name_Length     : Natural := 0;
      Input_First     : Natural := 0;
      Input_Length    : Natural := 0;
      Expected_First  : Natural := 0;
      Expected_Length : Natural := 0;
   end record;
   --  Parsed spans from Example_Case_Label.

   type Narrative_Summary_Input is record
      Subject  : String (1 .. 96) := [others => ' '];
      Subject_Length : Natural := 0;
      Action   : String (1 .. 96) := [others => ' '];
      Action_Length : Natural := 0;
      Result   : String (1 .. 96) := [others => ' '];
      Result_Length : Natural := 0;
      Detail   : String (1 .. 160) := [others => ' '];
      Detail_Length : Natural := 0;
      Metadata : Domain_Label_Metadata := (others => <>);
   end record;
   --  Structured narrative summary facts for storage and later rendering.

   type Diff_Summary_Input is record
      Field_Name : String (1 .. 96) := [others => ' '];
      Field_Length : Natural := 0;
      Kind       : Diff_Kind := No_Diff;
      Old_Value  : String (1 .. 96) := [others => ' '];
      Old_Length : Natural := 0;
      New_Value  : String (1 .. 96) := [others => ' '];
      New_Length : Natural := 0;
      Redacted   : Boolean := False;
   end record;
   --  Structured diff facts for privacy-aware rendering.

   type Aggregate_Summary_Input is record
      Subject  : String (1 .. 64) := [others => ' '];
      Subject_Length : Natural := 0;
      Total    : Natural := 0;
      Success  : Natural := 0;
      Warning  : Natural := 0;
      Failure  : Natural := 0;
   end record;
   --  Structured aggregate facts for status rollups.

   type Validation_Report_Input is record
      Subject  : String (1 .. 96) := [others => ' '];
      Subject_Length : Natural := 0;
      Errors   : Natural := 0;
      Warnings : Natural := 0;
      Missing  : Natural := 0;
      Hint     : String (1 .. 160) := [others => ' '];
      Hint_Length : Natural := 0;
   end record;
   --  Structured validation report facts.

   type Metadata_List is array (Positive range <>) of Domain_Label_Metadata;
   --  Caller-owned list of domain metadata for severity/tone rollups.

   function Surface_Label
     (Surface : Domain_Surface)
      return Humanize.Status.Text_Result;
   --  @param Surface Domain surface.
   --  @return Stable domain-surface label.

   function Output_Mode_Label
     (Mode : Output_Mode)
      return Humanize.Status.Text_Result;
   --  @param Mode Output display policy.
   --  @return Stable output-mode label.

   function Severity_Label
     (Severity : Domain_Severity)
      return Humanize.Status.Text_Result;
   --  @param Severity Domain severity metadata.
   --  @return Stable severity label.

   function Tone_Label
     (Tone : Domain_Tone)
      return Humanize.Status.Text_Result;
   --  @param Tone Domain tone metadata.
   --  @return Stable tone label.

   function Surface_Default_Severity
     (Surface : Domain_Surface)
      return Domain_Severity;
   --  @param Surface Domain surface.
   --  @return Default severity for neutral labels in the surface.

   function Surface_Default_Tone
     (Surface : Domain_Surface)
      return Domain_Tone;
   --  @param Surface Domain surface.
   --  @return Default tone for neutral labels in the surface.

   function State_Metadata
     (Surface     : Domain_Surface;
      State_Label : String)
      return Domain_Label_Metadata;
   --  @param Surface Domain surface that owns State_Label.
   --  @param State_Label Human-readable state label.
   --  @return Best-effort metadata inferred from common state wording.

   function Domain_Label
     (Text     : String;
      Metadata : Domain_Label_Metadata;
      Options  : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Text Caller-supplied base label.
   --  @param Metadata Machine-readable label metadata.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable label with optional metadata prefix.

   function Domain_Label
     (Base     : Humanize.Status.Text_Result;
      Metadata : Domain_Label_Metadata;
      Options  : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Base Prevalidated label result.
   --  @param Metadata Machine-readable label metadata.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Base when invalid, otherwise rendered domain label.

   function Domain_Render
     (Text     : String;
      Metadata : Domain_Label_Metadata;
      Options  : Domain_Label_Options := Default_Domain_Label_Options)
      return Domain_Render_Result;
   --  @param Text Caller-supplied base label.
   --  @param Metadata Machine-readable label metadata.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Text result and the metadata used to produce it.

   function Metadata_Summary_Label
     (Metadata : Domain_Label_Metadata)
      return Humanize.Status.Text_Result;
   --  @param Metadata Machine-readable label metadata.
   --  @return Stable text summary of surface, severity, tone, final, and actionable flags.

   function Parse_Metadata_Summary_Label
     (Text : String)
      return Domain_Label_Parse_Result;
   --  @param Text Label rendered by Metadata_Summary_Label.
   --  @return Parsed metadata values.

   function Scan_Metadata_Summary_Label
     (Text : String)
      return Domain_Label_Parse_Result;
   --  @param Text Text beginning with a metadata summary label.
   --  @return Parsed metadata-summary prefix.

   function Accessible_Label
     (Text     : String;
      Metadata : Domain_Label_Metadata)
      return Humanize.Status.Text_Result;
   --  @param Text Caller-supplied base label.
   --  @param Metadata Machine-readable label metadata.
   --  @return Screen-reader-oriented label.

   function Cross_Domain_Summary
     (Primary_Label   : String;
      Secondary_Label : String;
      Metadata        : Domain_Label_Metadata;
      Options         : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Primary_Label First domain label.
   --  @param Secondary_Label Second domain label.
   --  @param Metadata Machine-readable combined summary metadata.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable cross-domain summary.

   function Narrative_Summary
     (Subject  : String;
      Action   : String;
      Result   : String;
      Detail   : String := "";
      Metadata : Domain_Label_Metadata := (others => <>);
      Options  : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Subject Main actor, object, or record label.
   --  @param Action Human-readable action phrase.
   --  @param Result Human-readable outcome phrase.
   --  @param Detail Optional supporting detail phrase.
   --  @param Metadata Machine-readable summary metadata.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Cross-package narrative sentence.

   function Narrative_Summary
     (Input   : Narrative_Summary_Input;
      Options : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Input Structured narrative facts.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Cross-package narrative sentence.

   function Event_Summary
     (Event_Label : String;
      Status_Label : String;
      Actor_Label : String := "";
      Time_Label  : String := "";
      Metadata    : Domain_Label_Metadata := (others => <>);
      Options     : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Event_Label Main event label.
   --  @param Status_Label Event status or result label.
   --  @param Actor_Label Optional actor label.
   --  @param Time_Label Optional time or duration label.
   --  @param Metadata Machine-readable event metadata.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable event summary.

   function Make_Label_Part
     (Kind : Label_Part_Kind;
      Text : String)
      return Label_Part;
   --  @param Kind Semantic role for Text.
   --  @param Text Label part text, truncated to the public bounded field.
   --  @return Bounded semantic label part.

   function Label_Part_Kind_Label
     (Kind : Label_Part_Kind)
      return Humanize.Status.Text_Result;
   --  @param Kind Label part role.
   --  @return Stable label part role text.

   function Label_Parts_Summary
     (Parts : Label_Part_List)
      return Humanize.Status.Text_Result;
   --  @param Parts Semantic label parts to summarize.
   --  @return Deterministic label-parts summary.

   function Privacy_Aware_Label_Parts_Summary
     (Parts      : Label_Part_List;
      Redact_All : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Parts Semantic label parts to summarize.
   --  @param Redact_All True to redact safe-value parts.
   --  @return Deterministic privacy-aware label-parts summary.

   function Diff_Summary
     (Field_Name : String;
      Kind       : Diff_Kind;
      Old_Value  : String := "";
      New_Value  : String := "";
      Redacted   : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Field_Name Changed field or object name.
   --  @param Kind Diff category.
   --  @param Old_Value Optional previous display value.
   --  @param New_Value Optional new display value.
   --  @param Redacted True when values must not be exposed.
   --  @return Human-readable diff summary.

   function Diff_Summary
     (Input : Diff_Summary_Input)
      return Humanize.Status.Text_Result;
   --  @param Input Structured diff facts.
   --  @return Human-readable diff summary.

   function Text_Diff_Summary
     (Lines_Added   : Natural := 0;
      Lines_Removed : Natural := 0;
      Words_Changed : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Lines_Added Count of added lines.
   --  @param Lines_Removed Count of removed lines.
   --  @param Words_Changed Count of changed words.
   --  @return Human-readable text diff rollup.

   function Profile_Options
     (Profile : Output_Profile)
      return Domain_Label_Options;
   --  @param Profile Cross-package output profile.
   --  @return Domain label options derived from Profile.

   function Output_Profile_Label
     (Profile : Output_Profile)
      return Humanize.Status.Text_Result;
   --  @param Profile Cross-package output profile.
   --  @return Stable output-profile summary.

   function Aggregate_Summary
     (Subject  : String;
      Total    : Natural;
      Success  : Natural := 0;
      Warning  : Natural := 0;
      Failure  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Subject Collection subject label.
   --  @param Total Total item count.
   --  @param Success Successful item count.
   --  @param Warning Warning item count.
   --  @param Failure Failed item count.
   --  @return Human-readable aggregate status summary.

   function Aggregate_Summary
     (Input : Aggregate_Summary_Input)
      return Humanize.Status.Text_Result;
   --  @param Input Structured aggregate facts.
   --  @return Human-readable aggregate status summary.

   function Top_Item_Summary
     (Subject : String;
      Item    : String;
      Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Subject Collection subject label.
   --  @param Item Top item label.
   --  @param Count Top item count.
   --  @return Human-readable top-item summary.

   function Combine_Metadata
     (Primary   : Domain_Label_Metadata;
      Secondary : Domain_Label_Metadata)
      return Domain_Label_Metadata;
   --  @param Primary First metadata item.
   --  @param Secondary Second metadata item.
   --  @return Conservative combined metadata.

   function Aggregate_Metadata
     (Items : Metadata_List)
      return Domain_Label_Metadata;
   --  @param Items Metadata values to aggregate.
   --  @return Conservative aggregate metadata.

   function Aggregate_Metadata_Label
     (Items : Metadata_List)
      return Humanize.Status.Text_Result;
   --  @param Items Metadata values to aggregate.
   --  @return Human-readable aggregate metadata summary.

   function Combined_Metadata_Label
     (Primary   : Domain_Label_Metadata;
      Secondary : Domain_Label_Metadata)
      return Humanize.Status.Text_Result;
   --  @param Primary First metadata item.
   --  @param Secondary Second metadata item.
   --  @return Human-readable combined metadata summary.

   function Validation_Report_Label
     (Subject  : String;
      Errors   : Natural := 0;
      Warnings : Natural := 0;
      Missing  : Natural := 0;
      Hint     : String := "")
      return Humanize.Status.Text_Result;
   --  @param Subject Validated object or form label.
   --  @param Errors Error count.
   --  @param Warnings Warning count.
   --  @param Missing Missing required item count.
   --  @param Hint Optional remediation hint.
   --  @return Human-readable validation report summary.

   function Validation_Report_Label
     (Input : Validation_Report_Input)
      return Humanize.Status.Text_Result;
   --  @param Input Structured validation report facts.
   --  @return Human-readable validation report summary.

   function Remediation_Summary_Label
     (Primary_Action : String;
      Secondary_Action : String := "";
      Count : Natural := 1)
      return Humanize.Status.Text_Result;
   --  @param Primary_Action First caller-supplied remediation action.
   --  @param Secondary_Action Optional follow-up remediation action.
   --  @param Count Number of findings the action addresses.
   --  @return Human-readable remediation summary.

   function Composition_Diagnostic_Label
     (API_Name : String;
      Field_Name : String;
      Problem : String)
      return Humanize.Status.Text_Result;
   --  @param API_Name Composition API family.
   --  @param Field_Name Invalid or missing field name.
   --  @param Problem Human-readable problem text.
   --  @return Human-readable diagnostic for composition helpers.

   function Label_Family_Stability
     (Area : Domain_Surface;
      Round_Trippable : Boolean := False;
      Bounded_Available : Boolean := True)
      return Label_Stability_Metadata;
   --  @param Area Public domain surface.
   --  @param Round_Trippable Whether labels in this family can be parsed.
   --  @param Bounded_Available Whether bounded APIs are available.
   --  @return Default stability metadata for a domain label family.

   function Stability_Metadata_Label
     (Metadata : Label_Stability_Metadata)
      return Humanize.Status.Text_Result;
   --  @param Metadata Label stability and safety metadata.
   --  @return Stable metadata summary for a label API.

   function Example_Case_For
     (Area     : Domain_Surface;
      Name     : String;
      Input    : String;
      Expected : String;
      Stability : Label_Stability_Metadata := (others => <>))
      return Example_Case;
   --  @param Area Public domain surface.
   --  @param Name Example case name.
   --  @param Input Example input descriptor.
   --  @param Expected Expected stable label.
   --  @param Stability Label stability and safety metadata.
   --  @return Bounded example/corpus descriptor.

   function Example_Case_Label
     (Example : Example_Case)
      return Humanize.Status.Text_Result;
   --  @param Example Public example/corpus descriptor.
   --  @return Human-readable example/corpus label.

   function Example_Case_For_Area
     (Area : Domain_Surface)
      return Example_Case;
   --  @param Area Public domain surface.
   --  @return Curated example/corpus descriptor for Area.

   function Parse_Narrative_Summary
     (Text : String)
      return Composition_Label_Parse_Result;
   --  @param Text Label rendered by Narrative_Summary.
   --  @return Parsed narrative spans.

   function Scan_Narrative_Summary
     (Text : String)
      return Composition_Label_Parse_Result;
   --  @param Text Text beginning with a narrative summary.
   --  @return Parsed narrative prefix.

   function Parse_Event_Summary
     (Text : String)
      return Composition_Label_Parse_Result;
   --  @param Text Label rendered by Event_Summary.
   --  @return Parsed event summary spans.

   function Scan_Event_Summary
     (Text : String)
      return Composition_Label_Parse_Result;
   --  @param Text Text beginning with an event summary.
   --  @return Parsed event summary prefix.

   function Parse_Diff_Summary
     (Text : String)
      return Diff_Label_Parse_Result;
   --  @param Text Label rendered by Diff_Summary.
   --  @return Parsed diff label.

   function Scan_Diff_Summary
     (Text : String)
      return Diff_Label_Parse_Result;
   --  @param Text Text beginning with a diff summary.
   --  @return Parsed diff summary prefix.

   function Parse_Text_Diff_Summary
     (Text : String)
      return Count_Label_Parse_Result;
   --  @param Text Label rendered by Text_Diff_Summary.
   --  @return Parsed text-diff counts.

   function Scan_Text_Diff_Summary
     (Text : String)
      return Count_Label_Parse_Result;
   --  @param Text Text beginning with a text-diff summary.
   --  @return Parsed text-diff prefix.

   function Parse_Aggregate_Summary
     (Text : String)
      return Count_Label_Parse_Result;
   --  @param Text Label rendered by Aggregate_Summary.
   --  @return Parsed aggregate counts.

   function Scan_Aggregate_Summary
     (Text : String)
      return Count_Label_Parse_Result;
   --  @param Text Text beginning with an aggregate summary.
   --  @return Parsed aggregate prefix.

   function Parse_Validation_Report_Label
     (Text : String)
      return Count_Label_Parse_Result;
   --  @param Text Label rendered by Validation_Report_Label.
   --  @return Parsed validation counts.

   function Scan_Validation_Report_Label
     (Text : String)
      return Count_Label_Parse_Result;
   --  @param Text Text beginning with a validation report label.
   --  @return Parsed validation report prefix.

   function Parse_Stability_Metadata_Label
     (Text : String)
      return Stability_Label_Parse_Result;
   --  @param Text Label rendered by Stability_Metadata_Label.
   --  @return Parsed stability metadata.

   function Scan_Stability_Metadata_Label
     (Text : String)
      return Stability_Label_Parse_Result;
   --  @param Text Text beginning with a stability metadata label.
   --  @return Parsed stability metadata prefix.

   function Parse_Example_Case_Label
     (Text : String)
      return Example_Case_Parse_Result;
   --  @param Text Label rendered by Example_Case_Label.
   --  @return Parsed example/corpus descriptor.

   function Scan_Example_Case_Label
     (Text : String)
      return Example_Case_Parse_Result;
   --  @param Text Text beginning with an example/corpus label.
   --  @return Parsed example/corpus prefix.

   function Three_Part_Summary
     (First_Label  : String;
      Second_Label : String;
      Third_Label  : String;
      Metadata     : Domain_Label_Metadata;
      Options      : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param First_Label First domain label.
   --  @param Second_Label Second domain label.
   --  @param Third_Label Third domain label.
   --  @param Metadata Machine-readable combined summary metadata.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable three-part domain summary.

   function Deployment_Build_Summary
     (Deployment_Label : String;
      Build_Label      : String;
      Gate_Label       : String;
      Options          : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Deployment_Label Deployment domain label.
   --  @param Build_Label Build/test domain label.
   --  @param Gate_Label Release gate label.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable deployment/build summary.

   function Account_Permission_Summary
     (Account_Label    : String;
      Permission_Label : String;
      Session_Label    : String;
      Options          : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Account_Label Account domain label.
   --  @param Permission_Label Permission domain label.
   --  @param Session_Label Session domain label.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable account/permission summary.

   function Media_Attachment_Summary
     (Media_Label      : String;
      Attachment_Label : String;
      Options          : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Media_Label Media domain label.
   --  @param Attachment_Label Attachment domain label.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable media/attachment summary.

   function Operation_Status_Summary
     (Operation_Label : String;
      Status_Label    : String;
      Options         : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Operation_Label Operation domain label.
   --  @param Status_Label System/status domain label.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable operation/status summary.

   function Data_Import_Summary
     (Quality_Label : String;
      Import_Label  : String;
      Options       : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Quality_Label Data-quality domain label.
   --  @param Import_Label Import/operation domain label.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable data-quality/import summary.

   function Moderation_Event_Summary
     (Review_Label : String;
      Report_Label : String;
      Options      : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Review_Label Review/moderation label.
   --  @param Report_Label Report or queue label.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable moderation/report summary.

   function Payment_Event_Summary
     (Payment_Label : String;
      Invoice_Label : String;
      Options       : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Payment_Label Payment label.
   --  @param Invoice_Label Invoice or balance label.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable payment/invoice summary.

   function Task_Event_Summary
     (Task_Label      : String;
      Checklist_Label : String;
      Options         : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Task_Label Task label.
   --  @param Checklist_Label Checklist or blocker label.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable task/checklist summary.

   function Parse_Domain_Label
     (Text : String)
      return Domain_Label_Parse_Result;
   --  @param Text Domain label rendered by Domain_Label.
   --  @return Parsed optional surface, severity, and tone metadata.

   function Parse_Named_Label
     (Text          : String;
      Surface       : Domain_Surface;
      State_Suffix  : String)
      return Named_Label_Parse_Result;
   --  @param Text Label in common "name state" form.
   --  @param Surface Domain surface that owns the label.
   --  @param State_Suffix Expected state suffix to parse.
   --  @return Parsed name span, state span, metadata, and consumed length.

   function Scan_Named_Label
     (Text          : String;
      Surface       : Domain_Surface;
      State_Suffix  : String)
      return Named_Label_Parse_Result;
   --  @param Text Text beginning with a common "name state" label.
   --  @param Surface Domain surface that owns the label.
   --  @param State_Suffix Expected state suffix to parse.
   --  @return Parsed prefix metadata and consumed length.

   function Parse_Log_Field
     (Text : String)
      return Log_Field_Parse_Result;
   --  @param Text Log field in "key=value" form.
   --  @return Parsed key/value spans and consumed length.

   function Scan_Log_Field
     (Text : String)
      return Log_Field_Parse_Result;
   --  @param Text Text beginning with a "key=value" log field.
   --  @return Parsed key/value prefix spans and consumed length.

   procedure Domain_Label_Into
     (Text     : String;
      Metadata : Domain_Label_Metadata;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Domain_Label_Options := Default_Domain_Label_Options);
   --  @param Text Caller-supplied base label.
   --  @param Metadata Machine-readable label metadata.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Metadata_Summary_Label_Into
     (Metadata : Domain_Label_Metadata;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Metadata Machine-readable label metadata.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Cross_Domain_Summary_Into
     (Primary_Label   : String;
      Secondary_Label : String;
      Metadata        : Domain_Label_Metadata;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code;
      Options         : Domain_Label_Options := Default_Domain_Label_Options);
   --  @param Primary_Label First domain label.
   --  @param Secondary_Label Second domain label.
   --  @param Metadata Machine-readable combined summary metadata.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Event_Summary_Into
     (Event_Label  : String;
      Status_Label : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Actor_Label  : String := "";
      Time_Label   : String := "";
      Metadata     : Domain_Label_Metadata := (others => <>);
      Options      : Domain_Label_Options := Default_Domain_Label_Options);
   --  @param Event_Label Main event label.
   --  @param Status_Label Event status or result label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Actor_Label Optional actor label.
   --  @param Time_Label Optional time or duration label.
   --  @param Metadata Machine-readable event metadata.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Label_Parts_Summary_Into
     (Parts   : Label_Part_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Parts Semantic label parts to summarize.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Diff_Summary_Into
     (Field_Name : String;
      Kind       : Diff_Kind;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Old_Value  : String := "";
      New_Value  : String := "";
      Redacted   : Boolean := False);
   --  @param Field_Name Changed field or object name.
   --  @param Kind Diff category.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Old_Value Optional previous display value.
   --  @param New_Value Optional new display value.
   --  @param Redacted True when values must not be exposed.

   procedure Text_Diff_Summary_Into
     (Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Lines_Added   : Natural := 0;
      Lines_Removed : Natural := 0;
      Words_Changed : Natural := 0);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Lines_Added Count of added lines.
   --  @param Lines_Removed Count of removed lines.
   --  @param Words_Changed Count of changed words.

   procedure Output_Profile_Label_Into
     (Profile : Output_Profile;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Profile Cross-package output profile.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Aggregate_Summary_Into
     (Subject : String;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Success : Natural := 0;
      Warning : Natural := 0;
      Failure : Natural := 0);
   --  @param Subject Collection subject label.
   --  @param Total Total item count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Success Successful item count.
   --  @param Warning Warning item count.
   --  @param Failure Failed item count.

   procedure Top_Item_Summary_Into
     (Subject : String;
      Item    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Subject Collection subject label.
   --  @param Item Top item label.
   --  @param Count Top item count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Combined_Metadata_Label_Into
     (Primary   : Domain_Label_Metadata;
      Secondary : Domain_Label_Metadata;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Primary First metadata item.
   --  @param Secondary Second metadata item.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Stability_Metadata_Label_Into
     (Metadata : Label_Stability_Metadata;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Metadata Label stability and safety metadata.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Example_Case_Label_Into
     (Example : Example_Case;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Example Public example/corpus descriptor.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Narrative_Summary_Into
     (Subject  : String;
      Action   : String;
      Result   : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Detail   : String := "";
      Metadata : Domain_Label_Metadata := (others => <>);
      Options  : Domain_Label_Options := Default_Domain_Label_Options);
   --  @param Subject Main actor, object, or record label.
   --  @param Action Human-readable action phrase.
   --  @param Result Human-readable outcome phrase.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Detail Optional supporting detail phrase.
   --  @param Metadata Machine-readable summary metadata.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Validation_Report_Label_Into
     (Subject  : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Errors   : Natural := 0;
      Warnings : Natural := 0;
      Missing  : Natural := 0;
      Hint     : String := "");
   --  @param Subject Validated object or form label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Errors Error count.
   --  @param Warnings Warning count.
   --  @param Missing Missing required item count.
   --  @param Hint Optional remediation hint.
end Humanize.Domain_Details;
