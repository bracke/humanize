with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.Capabilities is

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Area_Label
     (Area : Capability_Area)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Area is
            when Datetime_Area  => "datetimes",
            when Duration_Area  => "durations",
            when Bytes_Area     => "bytes",
            when Color_Area     => "colors",
            when Number_Area    => "numbers",
            when String_Area    => "strings",
            when Value_Area     => "values",
            when Endpoint_Area  => "endpoints",
            when Resource_Area  => "resources",
            when Version_Area   => "versions",
            when Geo_Area       => "geo",
            when Markup_Area    => "markup",
            when Secret_Area    => "secrets",
            when Schema_Area    => "schema",
            when Diagnostic_Area => "diagnostics",
            when Threshold_Area => "thresholds",
            when Workflow_Area  => "workflows",
            when Change_Area    => "changes",
            when Table_Area     => "tables",
            when Form_Area      => "forms",
            when Navigation_Area => "navigation",
            when Badge_Area     => "badges",
            when Notification_Area => "notifications",
            when Search_Area    => "search",
            when Comment_Area   => "comments",
            when Task_Area      => "tasks",
            when Attachment_Area => "attachments",
            when Event_Area     => "events",
            when Payment_Area   => "payments",
            when System_Status_Area => "system-status",
            when Operation_Area => "operations",
            when Comparison_Area => "comparisons",
            when Moderation_Area => "moderation",
            when Account_Area => "accounts",
            when Deployment_Area => "deployments",
            when Data_Quality_Area => "data-quality",
            when Media_Area => "media",
            when Notification_Preference_Area => "notification-preferences",
            when Permission_Area => "permissions",
            when Build_Area => "builds",
            when Domain_Detail_Area => "domain-details",
            when List_Area      => "lists",
            when Frequency_Area => "frequencies",
            when Rate_Area      => "rates",
            when Unit_Area      => "units",
            when Phrase_Area    => "phrases",
            when Parsing_Area   => "parsing",
            when Metadata_Area  => "metadata");
   end Area_Label;

   function Area_Rendering_Source
     (Area : Capability_Area)
      return Humanize.Rendering_Source
   is
   begin
      case Area is
         when Datetime_Area | Duration_Area | Bytes_Area | Number_Area
            | List_Area | Frequency_Area | Rate_Area | Unit_Area =>
            return Humanize.Locale_Rendered;
         when Color_Area | String_Area | Value_Area | Endpoint_Area
            | Resource_Area | Version_Area | Geo_Area | Markup_Area | Secret_Area
            | Schema_Area | Diagnostic_Area | Threshold_Area | Workflow_Area
            | Change_Area | Table_Area | Form_Area | Navigation_Area
            | Badge_Area | Notification_Area | Search_Area
            | Comment_Area | Task_Area | Attachment_Area | System_Status_Area
            | Event_Area | Payment_Area | Operation_Area | Comparison_Area
            | Moderation_Area | Account_Area | Deployment_Area
            | Data_Quality_Area | Media_Area | Notification_Preference_Area
            | Permission_Area | Build_Area | Domain_Detail_Area
            | Phrase_Area | Parsing_Area
            | Metadata_Area =>
            return Humanize.Deterministic_Text;
      end case;
   end Area_Rendering_Source;

   function Area_Locale_Behavior
     (Area : Capability_Area)
      return Locale_Behavior
   is
   begin
      case Area is
         when Frequency_Area | Rate_Area | Unit_Area =>
            return Catalog_Localized;
         when Phrase_Area =>
            return Deterministic_Locale_Aware;
         when Color_Area | String_Area | Value_Area | Endpoint_Area
            | Resource_Area | Version_Area | Geo_Area | Markup_Area | Secret_Area
            | Schema_Area | Diagnostic_Area | Threshold_Area | Workflow_Area
            | Change_Area | Table_Area | Form_Area | Navigation_Area
            | Badge_Area | Notification_Area | Search_Area | Comment_Area
            | Task_Area | Attachment_Area | Event_Area | System_Status_Area
            | Payment_Area | Operation_Area | Comparison_Area
            | Moderation_Area | Account_Area | Deployment_Area
            | Data_Quality_Area | Media_Area | Notification_Preference_Area
            | Permission_Area | Build_Area | Domain_Detail_Area
            | Parsing_Area | Metadata_Area =>
            return Deterministic_English;
         when Datetime_Area | Duration_Area | Bytes_Area | Number_Area
            | List_Area =>
            return Mixed_Localized_Deterministic;
      end case;
   end Area_Locale_Behavior;

   function Area_Features
     (Area : Capability_Area)
      return Feature_Support
   is
      Bounded : constant Boolean := Area /= Metadata_Area;
      Options : constant Boolean :=
        Area in Datetime_Area | Duration_Area | Bytes_Area | Number_Area
          | String_Area | List_Area | Rate_Area | Unit_Area
          | Endpoint_Area | Resource_Area | Version_Area | Geo_Area
          | Markup_Area | Operation_Area
          | Comparison_Area | Account_Area | Deployment_Area
          | Moderation_Area | Data_Quality_Area | Media_Area
          | Diagnostic_Area | Threshold_Area | Workflow_Area | Change_Area
          | Table_Area
          | Notification_Area | Notification_Preference_Area
          | Permission_Area | Build_Area | Task_Area | Payment_Area
          | Attachment_Area | Event_Area | Badge_Area | Comment_Area
          | Form_Area | Navigation_Area | Search_Area | System_Status_Area
          | Domain_Detail_Area;
      Parse : constant Boolean :=
        Area in Color_Area | Number_Area | String_Area | Version_Area
          | Endpoint_Area | Resource_Area | Geo_Area | Markup_Area
          | Secret_Area | Schema_Area
          | Operation_Area | Comparison_Area | Account_Area
          | Deployment_Area | Moderation_Area | Data_Quality_Area
          | Diagnostic_Area | Threshold_Area | Workflow_Area | Change_Area
          | Table_Area
          | Media_Area | Notification_Area | Notification_Preference_Area
          | Permission_Area | Build_Area | Task_Area | Payment_Area
          | Attachment_Area | Event_Area | Badge_Area | Comment_Area
          | Form_Area | Navigation_Area | Search_Area | System_Status_Area
          | Domain_Detail_Area | Parsing_Area;
      Scan : constant Boolean :=
        Area in Endpoint_Area | Resource_Area | Version_Area | Geo_Area
          | Markup_Area | Secret_Area | Schema_Area
          | Operation_Area
          | Comparison_Area | Account_Area
          | Deployment_Area | Moderation_Area | Data_Quality_Area
          | Diagnostic_Area | Threshold_Area | Workflow_Area | Change_Area
          | Table_Area
          | Media_Area | Notification_Area | Notification_Preference_Area
          | Permission_Area | Build_Area | Task_Area | Payment_Area
          | Attachment_Area | Event_Area | Badge_Area | Comment_Area
          | Form_Area | Navigation_Area | Search_Area | System_Status_Area
          | Domain_Detail_Area | Parsing_Area;
      Metadata : constant Boolean :=
        Area not in Frequency_Area | Rate_Area;
      Accessible : constant Boolean :=
        Area in String_Area | Endpoint_Area | Resource_Area | Version_Area
          | Geo_Area | Markup_Area | Secret_Area | Schema_Area
          | Operation_Area | Account_Area
          | Deployment_Area | Moderation_Area | Data_Quality_Area
          | Diagnostic_Area | Threshold_Area | Workflow_Area | Change_Area
          | Table_Area
          | Media_Area | Notification_Area | Notification_Preference_Area
          | Permission_Area | Build_Area | Task_Area | Payment_Area
          | Attachment_Area | Event_Area | Badge_Area | Comment_Area
          | Form_Area | Navigation_Area | Search_Area | System_Status_Area
          | Domain_Detail_Area;
      Cross_Domain : constant Boolean := Area = Domain_Detail_Area;
      Privacy : constant Boolean :=
        Area in Secret_Area | Endpoint_Area | String_Area | Account_Area
          | Payment_Area | Domain_Detail_Area;
      Terminal : constant Boolean := Area in String_Area | Diagnostic_Area;
      Scheduling : constant Boolean := Area in Parsing_Area | Duration_Area;
      Statistical : constant Boolean := Area in Number_Area;
      Narrative : constant Boolean := Area in Domain_Detail_Area | Event_Area
        | Operation_Area | Deployment_Area | System_Status_Area;
      Label_Parts : constant Boolean := Area in Domain_Detail_Area | String_Area;
      Diff : constant Boolean := Area in Domain_Detail_Area | Change_Area
        | String_Area;
      Validation : constant Boolean := Area in Domain_Detail_Area | Form_Area
        | Schema_Area | Diagnostic_Area | Data_Quality_Area;
      Stability : constant Boolean := Area in Domain_Detail_Area | Metadata_Area
        | Parsing_Area;
   begin
      return
        (Has_Bounded_Api     => Bounded,
         Has_Options         => Options,
         Has_Parse           => Parse,
         Has_Scan            => Scan,
         Has_Metadata        => Metadata,
         Has_Accessible_Mode => Accessible,
         Has_Cross_Domain    => Cross_Domain,
         Has_Privacy_Policy  => Privacy,
         Has_Terminal_Layout => Terminal,
         Has_Scheduling      => Scheduling,
         Has_Statistical_Shape => Statistical,
         Has_Narrative       => Narrative,
         Has_Label_Parts     => Label_Parts,
         Has_Diff            => Diff,
         Has_Validation      => Validation,
         Has_Stability       => Stability);
   end Area_Features;

   function Feature_Support_Label
     (Features : Feature_Support)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;

      procedure Add (Enabled : Boolean; Label : String) is
      begin
         if Enabled then
            if Length (Result) > 0 then
               Append (Result, " ");
            end if;
            Append (Result, Label);
         end if;
      end Add;
   begin
      Add (Features.Has_Bounded_Api, "bounded");
      Add (Features.Has_Options, "options");
      Add (Features.Has_Parse, "parse");
      Add (Features.Has_Scan, "scan");
      Add (Features.Has_Metadata, "metadata");
      Add (Features.Has_Accessible_Mode, "accessible");
      Add (Features.Has_Cross_Domain, "cross-domain");
      Add (Features.Has_Privacy_Policy, "privacy");
      Add (Features.Has_Terminal_Layout, "terminal");
      Add (Features.Has_Scheduling, "scheduling");
      Add (Features.Has_Statistical_Shape, "statistical-shape");
      Add (Features.Has_Narrative, "narrative");
      Add (Features.Has_Label_Parts, "label-parts");
      Add (Features.Has_Diff, "diff");
      Add (Features.Has_Validation, "validation");
      Add (Features.Has_Stability, "stability");

      if Length (Result) = 0 then
         return Ok_Text ("none");
      else
         return Ok_Text (To_String (Result));
      end if;
   end Feature_Support_Label;

   function Image (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Capability_Coverage_For_All
      return Capability_Coverage
   is
      Result : Capability_Coverage;

      procedure Count (Features : Feature_Support) is
      begin
         Result.Areas := Result.Areas + 1;
         if Features.Has_Bounded_Api then
            Result.Bounded := Result.Bounded + 1;
         end if;
         if Features.Has_Options then
            Result.Options := Result.Options + 1;
         end if;
         if Features.Has_Parse then
            Result.Parse := Result.Parse + 1;
         end if;
         if Features.Has_Scan then
            Result.Scan := Result.Scan + 1;
         end if;
         if Features.Has_Metadata then
            Result.Metadata := Result.Metadata + 1;
         end if;
         if Features.Has_Privacy_Policy then
            Result.Privacy := Result.Privacy + 1;
         end if;
         if Features.Has_Terminal_Layout then
            Result.Terminal := Result.Terminal + 1;
         end if;
         if Features.Has_Diff then
            Result.Diff := Result.Diff + 1;
         end if;
         if Features.Has_Validation then
            Result.Validation := Result.Validation + 1;
         end if;
         if Features.Has_Stability then
            Result.Stability := Result.Stability + 1;
         end if;
      end Count;
   begin
      for Area in Capability_Area loop
         Count (Area_Features (Area));
      end loop;
      return Result;
   end Capability_Coverage_For_All;

   function Capability_Coverage_Label
     (Coverage : Capability_Coverage)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        ("capability coverage: " & Image (Coverage.Areas) & " areas, "
         & Image (Coverage.Bounded) & " bounded, "
         & Image (Coverage.Parse) & " parseable, "
         & Image (Coverage.Scan) & " scannable, "
         & Image (Coverage.Metadata) & " with metadata, "
         & Image (Coverage.Privacy) & " privacy-aware, "
         & Image (Coverage.Terminal) & " terminal-aware, "
         & Image (Coverage.Diff) & " diff-aware, "
         & Image (Coverage.Validation) & " validation-aware, "
         & Image (Coverage.Stability) & " stability-aware");
   end Capability_Coverage_Label;

   function Capability_Matrix_Summary
      return Humanize.Status.Text_Result
   is
   begin
      return Capability_Coverage_Label (Capability_Coverage_For_All);
   end Capability_Matrix_Summary;

   function Rendering_Source_Label
     (Source : Humanize.Rendering_Source)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Source is
            when Humanize.Locale_Rendered     => "locale-rendered",
            when Humanize.Deterministic_Text  => "deterministic-text");
   end Rendering_Source_Label;

   function Locale_Behavior_Label
     (Behavior : Locale_Behavior)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Behavior is
            when Catalog_Localized =>
               "catalog-localized",
            when Deterministic_Locale_Aware =>
               "deterministic-locale-aware",
            when Deterministic_English =>
               "deterministic-english",
            when Mixed_Localized_Deterministic =>
               "mixed-localized-deterministic");
   end Locale_Behavior_Label;

   function Capability_Summary
     return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        ("datetimes durations bytes colors numbers strings values endpoints resources "
         & "versions geo markup secrets schema diagnostics thresholds workflows changes "
         & "tables forms navigation badges notifications search comments "
         & "tasks attachments events payments system-status operations comparisons "
         & "moderation accounts deployments data-quality media "
         & "notification-preferences permissions builds domain-details "
         & "lists frequencies "
         & "rates units phrases parsing metadata");
   end Capability_Summary;

   function Locale_Behavior_Summary
     return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        ("catalog-localized deterministic-locale-aware "
         & "deterministic-english mixed-localized-deterministic");
   end Locale_Behavior_Summary;

   procedure Area_Label_Into
     (Area    : Capability_Area;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Area_Label (Area);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Area_Label_Into;

   procedure Rendering_Source_Label_Into
     (Source  : Humanize.Rendering_Source;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Rendering_Source_Label (Source);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Rendering_Source_Label_Into;

   procedure Locale_Behavior_Label_Into
     (Behavior : Locale_Behavior;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Locale_Behavior_Label (Behavior);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Locale_Behavior_Label_Into;

   procedure Capability_Summary_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Capability_Summary;
   begin
      Copy_Result (Result, Target, Written, Status);
   end Capability_Summary_Into;

   procedure Locale_Behavior_Summary_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Locale_Behavior_Summary;
   begin
      Copy_Result (Result, Target, Written, Status);
   end Locale_Behavior_Summary_Into;

   procedure Capability_Matrix_Summary_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Capability_Matrix_Summary;
   begin
      Copy_Result (Result, Target, Written, Status);
   end Capability_Matrix_Summary_Into;
end Humanize.Capabilities;
