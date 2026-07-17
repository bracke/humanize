with Humanize.Domain_Details.Support;

package body Humanize.Domain_Details is

   function Make_Label_Options
     (Mode             : Output_Mode;
      Include_Surface  : Boolean;
      Include_Severity : Boolean;
      Include_Tone     : Boolean)
      return Domain_Label_Options
      renames Humanize.Domain_Details.Support.Make_Label_Options;

   function Surface_Label
     (Surface : Domain_Surface)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Surface_Label;

   function Output_Mode_Label
     (Mode : Output_Mode)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Output_Mode_Label;

   function Severity_Label
     (Severity : Domain_Severity)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Severity_Label;

   function Tone_Label
     (Tone : Domain_Tone)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Tone_Label;

   function Surface_Default_Severity
     (Surface : Domain_Surface)
      return Domain_Severity
      renames Humanize.Domain_Details.Support.Surface_Default_Severity;

   function Surface_Default_Tone
     (Surface : Domain_Surface)
      return Domain_Tone
      renames Humanize.Domain_Details.Support.Surface_Default_Tone;

   function State_Metadata
     (Surface     : Domain_Surface;
      State_Label : String)
      return Domain_Label_Metadata
      renames Humanize.Domain_Details.Support.State_Metadata;

   function Domain_Label
     (Text     : String;
      Metadata : Domain_Label_Metadata;
      Options  : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Domain_Label;

   function Domain_Label
     (Base     : Humanize.Status.Text_Result;
      Metadata : Domain_Label_Metadata;
      Options  : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Domain_Label;

   function Domain_Render
     (Text     : String;
      Metadata : Domain_Label_Metadata;
      Options  : Domain_Label_Options := Default_Domain_Label_Options)
      return Domain_Render_Result
      renames Humanize.Domain_Details.Support.Domain_Render;

   function Metadata_Summary_Label
     (Metadata : Domain_Label_Metadata)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Metadata_Summary_Label;

   function Parse_Metadata_Summary_Label
     (Text : String)
      return Domain_Label_Parse_Result
      renames Humanize.Domain_Details.Support.Parse_Metadata_Summary_Label;

   function Scan_Metadata_Summary_Label
     (Text : String)
      return Domain_Label_Parse_Result
      renames Humanize.Domain_Details.Support.Scan_Metadata_Summary_Label;

   function Accessible_Label
     (Text     : String;
      Metadata : Domain_Label_Metadata)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Accessible_Label;

   function Cross_Domain_Summary
     (Primary_Label   : String;
      Secondary_Label : String;
      Metadata        : Domain_Label_Metadata;
      Options         : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Cross_Domain_Summary;

   function Narrative_Summary
     (Subject  : String;
      Action   : String;
      Result   : String;
      Detail   : String := "";
      Metadata : Domain_Label_Metadata := (others => <>);
      Options  : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Narrative_Summary;

   function Narrative_Summary
     (Input   : Narrative_Summary_Input;
      Options : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Narrative_Summary;

   function Event_Summary
     (Event_Label : String;
      Status_Label : String;
      Actor_Label : String := "";
      Time_Label  : String := "";
      Metadata    : Domain_Label_Metadata := (others => <>);
      Options     : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Event_Summary;

   function Make_Label_Part
     (Kind : Label_Part_Kind;
      Text : String)
      return Label_Part
      renames Humanize.Domain_Details.Support.Make_Label_Part;

   function Label_Part_Kind_Label
     (Kind : Label_Part_Kind)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Label_Part_Kind_Label;

   function Label_Parts_Summary
     (Parts : Label_Part_List)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Label_Parts_Summary;

   function Privacy_Aware_Label_Parts_Summary
     (Parts      : Label_Part_List;
      Redact_All : Boolean := False)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Privacy_Aware_Label_Parts_Summary;

   function Diff_Summary
     (Field_Name : String;
      Kind       : Diff_Kind;
      Old_Value  : String := "";
      New_Value  : String := "";
      Redacted   : Boolean := False)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Diff_Summary;

   function Diff_Summary
     (Input : Diff_Summary_Input)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Diff_Summary;

   function Text_Diff_Summary
     (Lines_Added   : Natural := 0;
      Lines_Removed : Natural := 0;
      Words_Changed : Natural := 0)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Text_Diff_Summary;

   function Profile_Options
     (Profile : Output_Profile)
      return Domain_Label_Options
      renames Humanize.Domain_Details.Support.Profile_Options;

   function Output_Profile_Label
     (Profile : Output_Profile)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Output_Profile_Label;

   function Aggregate_Summary
     (Subject  : String;
      Total    : Natural;
      Success  : Natural := 0;
      Warning  : Natural := 0;
      Failure  : Natural := 0)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Aggregate_Summary;

   function Aggregate_Summary
     (Input : Aggregate_Summary_Input)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Aggregate_Summary;

   function Top_Item_Summary
     (Subject : String;
      Item    : String;
      Count   : Natural)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Top_Item_Summary;

   function Combine_Metadata
     (Primary   : Domain_Label_Metadata;
      Secondary : Domain_Label_Metadata)
      return Domain_Label_Metadata
      renames Humanize.Domain_Details.Support.Combine_Metadata;

   function Aggregate_Metadata
     (Items : Metadata_List)
      return Domain_Label_Metadata
      renames Humanize.Domain_Details.Support.Aggregate_Metadata;

   function Aggregate_Metadata_Label
     (Items : Metadata_List)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Aggregate_Metadata_Label;

   function Combined_Metadata_Label
     (Primary   : Domain_Label_Metadata;
      Secondary : Domain_Label_Metadata)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Combined_Metadata_Label;

   function Validation_Report_Label
     (Subject  : String;
      Errors   : Natural := 0;
      Warnings : Natural := 0;
      Missing  : Natural := 0;
      Hint     : String := "")
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Validation_Report_Label;

   function Validation_Report_Label
     (Input : Validation_Report_Input)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Validation_Report_Label;

   function Remediation_Summary_Label
     (Primary_Action : String;
      Secondary_Action : String := "";
      Count : Natural := 1)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Remediation_Summary_Label;

   function Composition_Diagnostic_Label
     (API_Name : String;
      Field_Name : String;
      Problem : String)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Composition_Diagnostic_Label;

   function Label_Family_Stability
     (Area : Domain_Surface;
      Round_Trippable : Boolean := False;
      Bounded_Available : Boolean := True)
      return Label_Stability_Metadata
      renames Humanize.Domain_Details.Support.Label_Family_Stability;

   function Stability_Metadata_Label
     (Metadata : Label_Stability_Metadata)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Stability_Metadata_Label;

   function Example_Case_For
     (Area     : Domain_Surface;
      Name     : String;
      Input    : String;
      Expected : String;
      Stability : Label_Stability_Metadata := (others => <>))
      return Example_Case
      renames Humanize.Domain_Details.Support.Example_Case_For;

   function Example_Case_Label
     (Example : Example_Case)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Example_Case_Label;

   function Example_Case_For_Area
     (Area : Domain_Surface)
      return Example_Case
      renames Humanize.Domain_Details.Support.Example_Case_For_Area;

   function Parse_Narrative_Summary
     (Text : String)
      return Composition_Label_Parse_Result
      renames Humanize.Domain_Details.Support.Parse_Narrative_Summary;

   function Scan_Narrative_Summary
     (Text : String)
      return Composition_Label_Parse_Result
      renames Humanize.Domain_Details.Support.Scan_Narrative_Summary;

   function Parse_Event_Summary
     (Text : String)
      return Composition_Label_Parse_Result
      renames Humanize.Domain_Details.Support.Parse_Event_Summary;

   function Scan_Event_Summary
     (Text : String)
      return Composition_Label_Parse_Result
      renames Humanize.Domain_Details.Support.Scan_Event_Summary;

   function Parse_Diff_Summary
     (Text : String)
      return Diff_Label_Parse_Result
      renames Humanize.Domain_Details.Support.Parse_Diff_Summary;

   function Scan_Diff_Summary
     (Text : String)
      return Diff_Label_Parse_Result
      renames Humanize.Domain_Details.Support.Scan_Diff_Summary;

   function Parse_Text_Diff_Summary
     (Text : String)
      return Count_Label_Parse_Result
      renames Humanize.Domain_Details.Support.Parse_Text_Diff_Summary;

   function Scan_Text_Diff_Summary
     (Text : String)
      return Count_Label_Parse_Result
      renames Humanize.Domain_Details.Support.Scan_Text_Diff_Summary;

   function Parse_Aggregate_Summary
     (Text : String)
      return Count_Label_Parse_Result
      renames Humanize.Domain_Details.Support.Parse_Aggregate_Summary;

   function Scan_Aggregate_Summary
     (Text : String)
      return Count_Label_Parse_Result
      renames Humanize.Domain_Details.Support.Scan_Aggregate_Summary;

   function Parse_Validation_Report_Label
     (Text : String)
      return Count_Label_Parse_Result
      renames Humanize.Domain_Details.Support.Parse_Validation_Report_Label;

   function Scan_Validation_Report_Label
     (Text : String)
      return Count_Label_Parse_Result
      renames Humanize.Domain_Details.Support.Scan_Validation_Report_Label;

   function Parse_Stability_Metadata_Label
     (Text : String)
      return Stability_Label_Parse_Result
      renames Humanize.Domain_Details.Support.Parse_Stability_Metadata_Label;

   function Scan_Stability_Metadata_Label
     (Text : String)
      return Stability_Label_Parse_Result
      renames Humanize.Domain_Details.Support.Scan_Stability_Metadata_Label;

   function Parse_Example_Case_Label
     (Text : String)
      return Example_Case_Parse_Result
      renames Humanize.Domain_Details.Support.Parse_Example_Case_Label;

   function Scan_Example_Case_Label
     (Text : String)
      return Example_Case_Parse_Result
      renames Humanize.Domain_Details.Support.Scan_Example_Case_Label;

   function Three_Part_Summary
     (First_Label  : String;
      Second_Label : String;
      Third_Label  : String;
      Metadata     : Domain_Label_Metadata;
      Options      : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Three_Part_Summary;

   function Deployment_Build_Summary
     (Deployment_Label : String;
      Build_Label      : String;
      Gate_Label       : String;
      Options          : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Deployment_Build_Summary;

   function Account_Permission_Summary
     (Account_Label    : String;
      Permission_Label : String;
      Session_Label    : String;
      Options          : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Account_Permission_Summary;

   function Media_Attachment_Summary
     (Media_Label      : String;
      Attachment_Label : String;
      Options          : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Media_Attachment_Summary;

   function Operation_Status_Summary
     (Operation_Label : String;
      Status_Label    : String;
      Options         : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Operation_Status_Summary;

   function Data_Import_Summary
     (Quality_Label : String;
      Import_Label  : String;
      Options       : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Data_Import_Summary;

   function Moderation_Event_Summary
     (Review_Label : String;
      Report_Label : String;
      Options      : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Moderation_Event_Summary;

   function Payment_Event_Summary
     (Payment_Label : String;
      Invoice_Label : String;
      Options       : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Payment_Event_Summary;

   function Task_Event_Summary
     (Task_Label      : String;
      Checklist_Label : String;
      Options         : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Domain_Details.Support.Task_Event_Summary;

   function Parse_Domain_Label
     (Text : String)
      return Domain_Label_Parse_Result
      renames Humanize.Domain_Details.Support.Parse_Domain_Label;

   function Parse_Named_Label
     (Text          : String;
      Surface       : Domain_Surface;
      State_Suffix  : String)
      return Named_Label_Parse_Result
      renames Humanize.Domain_Details.Support.Parse_Named_Label;

   function Scan_Named_Label
     (Text          : String;
      Surface       : Domain_Surface;
      State_Suffix  : String)
      return Named_Label_Parse_Result
      renames Humanize.Domain_Details.Support.Scan_Named_Label;

   function Parse_Log_Field
     (Text : String)
      return Log_Field_Parse_Result
      renames Humanize.Domain_Details.Support.Parse_Log_Field;

   function Scan_Log_Field
     (Text : String)
      return Log_Field_Parse_Result
      renames Humanize.Domain_Details.Support.Scan_Log_Field;

   procedure Domain_Label_Into
     (Text     : String;
      Metadata : Domain_Label_Metadata;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Domain_Label_Options := Default_Domain_Label_Options)
      renames Humanize.Domain_Details.Support.Domain_Label_Into;

   procedure Metadata_Summary_Label_Into
     (Metadata : Domain_Label_Metadata;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
      renames Humanize.Domain_Details.Support.Metadata_Summary_Label_Into;

   procedure Cross_Domain_Summary_Into
     (Primary_Label   : String;
      Secondary_Label : String;
      Metadata        : Domain_Label_Metadata;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code;
      Options         : Domain_Label_Options := Default_Domain_Label_Options)
      renames Humanize.Domain_Details.Support.Cross_Domain_Summary_Into;

   procedure Event_Summary_Into
     (Event_Label  : String;
      Status_Label : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Actor_Label  : String := "";
      Time_Label   : String := "";
      Metadata     : Domain_Label_Metadata := (others => <>);
      Options      : Domain_Label_Options := Default_Domain_Label_Options)
      renames Humanize.Domain_Details.Support.Event_Summary_Into;

   procedure Label_Parts_Summary_Into
     (Parts   : Label_Part_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Domain_Details.Support.Label_Parts_Summary_Into;

   procedure Diff_Summary_Into
     (Field_Name : String;
      Kind       : Diff_Kind;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Old_Value  : String := "";
      New_Value  : String := "";
      Redacted   : Boolean := False)
      renames Humanize.Domain_Details.Support.Diff_Summary_Into;

   procedure Text_Diff_Summary_Into
     (Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Lines_Added   : Natural := 0;
      Lines_Removed : Natural := 0;
      Words_Changed : Natural := 0)
      renames Humanize.Domain_Details.Support.Text_Diff_Summary_Into;

   procedure Output_Profile_Label_Into
     (Profile : Output_Profile;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Domain_Details.Support.Output_Profile_Label_Into;

   procedure Aggregate_Summary_Into
     (Subject : String;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Success : Natural := 0;
      Warning : Natural := 0;
      Failure : Natural := 0)
      renames Humanize.Domain_Details.Support.Aggregate_Summary_Into;

   procedure Top_Item_Summary_Into
     (Subject : String;
      Item    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Domain_Details.Support.Top_Item_Summary_Into;

   procedure Combined_Metadata_Label_Into
     (Primary   : Domain_Label_Metadata;
      Secondary : Domain_Label_Metadata;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
      renames Humanize.Domain_Details.Support.Combined_Metadata_Label_Into;

   procedure Stability_Metadata_Label_Into
     (Metadata : Label_Stability_Metadata;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
      renames Humanize.Domain_Details.Support.Stability_Metadata_Label_Into;

   procedure Example_Case_Label_Into
     (Example : Example_Case;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Domain_Details.Support.Example_Case_Label_Into;

   procedure Narrative_Summary_Into
     (Subject  : String;
      Action   : String;
      Result   : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Detail   : String := "";
      Metadata : Domain_Label_Metadata := (others => <>);
      Options  : Domain_Label_Options := Default_Domain_Label_Options)
      renames Humanize.Domain_Details.Support.Narrative_Summary_Into;

   procedure Validation_Report_Label_Into
     (Subject  : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Errors   : Natural := 0;
      Warnings : Natural := 0;
      Missing  : Natural := 0;
      Hint     : String := "")
      renames Humanize.Domain_Details.Support.Validation_Report_Label_Into;

end Humanize.Domain_Details;
