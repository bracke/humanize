with Humanize.Domain_Details;
with Humanize.Status;

--  Human-readable labels for forms, fields, and input-state metadata.
package Humanize.Forms is

   type Form_Output_Mode is (Form_Detailed, Form_Compact,
                             Form_Accessible, Form_Log);
   --  Output style for form labels with domain metadata.

   type Form_Label_Options is record
      Mode             : Form_Output_Mode := Form_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;
   --  Caller-selected metadata included around form labels.

   Default_Form_Label_Options : constant Form_Label_Options :=
     (Mode             => Form_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Form_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;

   type Form_State is
     (Pristine_Form,
      Editing_Form,
      Dirty_Form,
      Saving_Form,
      Saved_Form,
      Submitted_Form,
      Failed_Form);
   --  Caller-supplied form lifecycle state.

   type Input_State is
     (Valid_Input,
      Invalid_Input,
      Required_Input,
      Optional_Input,
      Disabled_Input,
      Read_Only_Input);
   --  Caller-supplied input display state.

   function Form_State_Label
     (State : Form_State)
      return Humanize.Status.Text_Result;
   --  @param State Form lifecycle state.
   --  @return Human-readable form-state label.

   function Input_State_Label
     (State : Input_State)
      return Humanize.Status.Text_Result;
   --  @param State Input display state.
   --  @return Human-readable input-state label.

   function Field_Label
     (Name     : String;
      Required : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Name Field name.
   --  @param Required Whether the field is required.
   --  @return Human-readable field label.

   function Field_Label
     (Name     : String;
      Required : Boolean;
      Options  : Form_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Field name.
   --  @param Required Whether the field is required.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable field label with optional metadata.

   function Field_State_Label
     (Name  : String;
      State : Input_State)
      return Humanize.Status.Text_Result;
   --  @param Name Field name.
   --  @param State Input display state.
   --  @return Human-readable field-state label.

   function Field_State_Label
     (Name    : String;
      State   : Input_State;
      Options : Form_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Field name.
   --  @param State Input display state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable field-state label with optional metadata.

   function Character_Count_Label
     (Used : Natural)
      return Humanize.Status.Text_Result;
   --  @param Used Character count.
   --  @return Human-readable character-count label.

   function Character_Limit_Label
     (Limit : Natural)
      return Humanize.Status.Text_Result;
   --  @param Limit Character limit.
   --  @return Human-readable character-limit label.

   function Character_Usage_Label
     (Used  : Natural;
      Limit : Natural)
      return Humanize.Status.Text_Result;
   --  @param Used Used character count.
   --  @param Limit Character limit.
   --  @return Human-readable character usage label.

   function Remaining_Characters_Label
     (Used  : Natural;
      Limit : Natural)
      return Humanize.Status.Text_Result;
   --  @param Used Used character count.
   --  @param Limit Character limit.
   --  @return Human-readable remaining-character label.

   function Required_Fields_Label
     (Missing : Natural;
      Total   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Missing Missing required field count.
   --  @param Total Total required field count.
   --  @return Human-readable required-field completion label.

   function Form_Progress_Label
     (Completed : Natural;
      Total     : Natural)
      return Humanize.Status.Text_Result;
   --  @param Completed Completed field count.
   --  @param Total Total field count.
   --  @return Human-readable form progress label.

   function Unsaved_Changes_Label
     (Count : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Count Optional unsaved change count.
   --  @return Human-readable unsaved-change label.

   function Submission_Label
     (State  : Form_State;
      Errors : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param State Form lifecycle state.
   --  @param Errors Error count for failed submissions.
   --  @return Human-readable submission-state label.

   function Submission_Label
     (State   : Form_State;
      Errors  : Natural;
      Options : Form_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param State Form lifecycle state.
   --  @param Errors Error count for failed submissions.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable submission-state label with optional metadata.

   function Form_State_Metadata
     (State : Form_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Form lifecycle state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Input_State_Metadata
     (State : Input_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Input display state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Parse_Field_Label
     (Text     : String;
      Required : Boolean)
      return Form_Label_Parse_Result;
   --  @param Text Label in rendered field-label form.
   --  @param Required Expected required/optional field state.
   --  @return Parsed field name span, field-state span, metadata, and consumed length.

   function Scan_Field_Label
     (Text     : String;
      Required : Boolean)
      return Form_Label_Parse_Result;
   --  @param Text Text beginning with a field label.
   --  @param Required Expected required/optional field state.
   --  @return Parsed label span and consumed prefix length.

   function Parse_Field_State_Label
     (Text  : String;
      State : Input_State)
      return Form_Label_Parse_Result;
   --  @param Text Label in rendered field-state form.
   --  @param State Expected input state.
   --  @return Parsed field name span, input-state span, metadata, and consumed length.

   function Scan_Field_State_Label
     (Text  : String;
      State : Input_State)
      return Form_Label_Parse_Result;
   --  @param Text Text beginning with a field-state label.
   --  @param State Expected input state.
   --  @return Parsed label span and consumed prefix length.

   function Parse_Submission_Label
     (Text   : String;
      State  : Form_State;
      Errors : Natural := 0)
      return Form_Label_Parse_Result;
   --  @param Text Submission label rendered by Submission_Label.
   --  @param State Expected form lifecycle state.
   --  @param Errors Expected error count for failed submissions.
   --  @return Parsed submission state span, metadata, and consumed length.

   function Scan_Submission_Label
     (Text   : String;
      State  : Form_State;
      Errors : Natural := 0)
      return Form_Label_Parse_Result;
   --  @param Text Text beginning with a submission label.
   --  @param State Expected form lifecycle state.
   --  @param Errors Expected error count for failed submissions.
   --  @return Parsed label span and consumed prefix length.

   function Section_Progress_Label
     (Name      : String;
      Completed : Natural;
      Total     : Natural)
      return Humanize.Status.Text_Result;
   --  @param Name Form section name.
   --  @param Completed Completed field count in the section.
   --  @param Total Total field count in the section.
   --  @return Human-readable section progress label.

   function Form_Step_Label
     (Current : Natural;
      Total   : Natural;
      Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Current Current 1-based form step.
   --  @param Total Total form step count.
   --  @param Name Optional step name.
   --  @return Human-readable form-step label.

   function Form_Error_Summary_Label
     (Errors   : Natural := 0;
      Warnings : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Errors Error count.
   --  @param Warnings Warning count.
   --  @return Human-readable form issue summary.

   procedure Form_State_Label_Into
     (State   : Form_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Form lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Input_State_Label_Into
     (State   : Input_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Input display state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Field_Label_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Required : Boolean := False);
   --  @param Name Field name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Required Whether the field is required.

   procedure Field_Label_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Required : Boolean;
      Options  : Form_Label_Options);
   --  @param Name Field name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Required Whether the field is required.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Field_State_Label_Into
     (Name    : String;
      State   : Input_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Field name.
   --  @param State Input display state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Field_State_Label_Into
     (Name    : String;
      State   : Input_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Form_Label_Options);
   --  @param Name Field name.
   --  @param State Input display state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Character_Count_Label_Into
     (Used    : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Used Character count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Character_Limit_Label_Into
     (Limit   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Limit Character limit.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Character_Usage_Label_Into
     (Used    : Natural;
      Limit   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Used Used character count.
   --  @param Limit Character limit.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Remaining_Characters_Label_Into
     (Used    : Natural;
      Limit   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Used Used character count.
   --  @param Limit Character limit.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Required_Fields_Label_Into
     (Missing : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Missing Missing required field count.
   --  @param Total Total required field count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Form_Progress_Label_Into
     (Completed : Natural;
      Total     : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Completed Completed field count.
   --  @param Total Total field count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Unsaved_Changes_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Count   : Natural := 0);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Count Optional unsaved change count.

   procedure Submission_Label_Into
     (State   : Form_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Errors  : Natural := 0);
   --  @param State Form lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Errors Error count for failed submissions.

   procedure Submission_Label_Into
     (State   : Form_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Errors  : Natural;
      Options : Form_Label_Options);
   --  @param State Form lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Errors Error count for failed submissions.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Section_Progress_Label_Into
     (Name      : String;
      Completed : Natural;
      Total     : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Name Form section name.
   --  @param Completed Completed field count in the section.
   --  @param Total Total field count in the section.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Form_Step_Label_Into
     (Current : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Current Current 1-based form step.
   --  @param Total Total form step count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional step name.

   procedure Form_Error_Summary_Label_Into
     (Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Errors   : Natural := 0;
      Warnings : Natural := 0);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Errors Error count.
   --  @param Warnings Warning count.

end Humanize.Forms;
