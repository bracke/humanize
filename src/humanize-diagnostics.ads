with Humanize.Domain_Details;
with Humanize.Status;

--  Human-readable labels for diagnostics, issues, and check summaries.
package Humanize.Diagnostics is
   type Diagnostic_Output_Mode is
     (Diagnostic_Detailed,
      Diagnostic_Compact,
      Diagnostic_Accessible,
      Diagnostic_Log);

   type Diagnostic_Label_Options is record
      Mode             : Diagnostic_Output_Mode := Diagnostic_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;

   Default_Diagnostic_Label_Options : constant Diagnostic_Label_Options :=
     (Mode             => Diagnostic_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Diagnostic_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;

   type Issue_Severity is
     (Info_Severity,
      Notice_Severity,
      Warning_Severity,
      Error_Severity,
      Critical_Severity,
      Blocking_Severity);
   --  Caller-supplied issue severity.

   type Check_Status is
     (Passed_Check,
      Failed_Check,
      Warning_Check,
      Skipped_Check,
      Pending_Check,
      Running_Check);
   --  Caller-supplied check result state.

   type Diagnostic_Source is
     (Build_Source,
      Test_Source,
      Lint_Source,
      Import_Source,
      Validation_Source,
      Runtime_Source,
      Security_Source,
      Unknown_Source);
   --  Broad source category for diagnostics.

   type Diagnostic_Explanation_Kind is
     (Expected_Value,
      Expected_Unit,
      Invalid_Range,
      End_Before_Start,
      Unknown_Field,
      Unsafe_Redacted_Value,
      Unsupported_Syntax,
      Unknown_Diagnostic_Explanation);
   --  Stable explanation categories for actionable diagnostic labels.

   type Parser_Family is
     (Byte_Parser,
      Duration_Parser,
      Date_Time_Parser,
      Color_Parser,
      URL_Parser,
      Unit_Parser,
      Recurrence_Parser,
      Domain_Label_Parser,
      Unknown_Parser);
   --  Parser families used for parser-specific diagnostic explanations.

   type Diagnostic_Explanation_Parse_Result is record
      Status         : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Kind           : Diagnostic_Explanation_Kind :=
        Unknown_Diagnostic_Explanation;
      Consumed       : Natural := 0;
      Subject_First  : Natural := 0;
      Subject_Length : Natural := 0;
      Suggestion_First  : Natural := 0;
      Suggestion_Length : Natural := 0;
   end record;

   function Severity_Label
     (Severity : Issue_Severity)
      return Humanize.Status.Text_Result;
   --  @param Severity Issue severity.
   --  @return Human-readable severity label.

   function Check_Status_Label
     (Status : Check_Status)
      return Humanize.Status.Text_Result;
   --  @param Status Check result state.
   --  @return Human-readable check-status label.

   function Source_Label
     (Source : Diagnostic_Source)
      return Humanize.Status.Text_Result;
   --  @param Source Diagnostic source category.
   --  @return Human-readable source label.

   function Issue_Count_Label
     (Errors   : Natural := 0;
      Warnings : Natural := 0;
      Notices  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Errors Error count.
   --  @param Warnings Warning count.
   --  @param Notices Notice/info count.
   --  @return Compact issue-count label.

   function Issue_Summary_Label
     (Errors   : Natural := 0;
      Warnings : Natural := 0;
      Notices  : Natural := 0;
      Blocking : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Errors Error count.
   --  @param Warnings Warning count.
   --  @param Notices Notice/info count.
   --  @param Blocking Blocking issue count.
   --  @return Human-readable issue summary.

   function Check_Result_Label
     (Name   : String;
      Status : Check_Status)
      return Humanize.Status.Text_Result;
   --  @param Name Check name.
   --  @param Status Check result state.
   --  @return Human-readable check result label.

   function Check_Result_Label
     (Name    : String;
      Status  : Check_Status;
      Options : Diagnostic_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Check name.
   --  @param Status Check result state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable check result label with optional metadata.

   function Location_Label
     (Path   : String := "";
      Line   : Natural := 0;
      Column : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Path Optional file/path label supplied by caller.
   --  @param Line Optional 1-based line number.
   --  @param Column Optional 1-based column number.
   --  @return Human-readable diagnostic location label.

   function Failed_At_Label
     (Path   : String;
      Line   : Natural := 0;
      Column : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Path File/path label supplied by caller.
   --  @param Line Optional line number.
   --  @param Column Optional column number.
   --  @return Human-readable failure location label.

   function First_Failure_Label
     (Check_Name : String;
      Path       : String := "";
      Line       : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Check_Name Name of first failing check or phase.
   --  @param Path Optional file/path label.
   --  @param Line Optional line number.
   --  @return Human-readable first-failure label.

   function Diagnostic_Label
     (Message  : String;
      Severity : Issue_Severity := Error_Severity;
      Path     : String := "";
      Line     : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Message Caller-provided diagnostic message.
   --  @param Severity Issue severity.
   --  @param Path Optional file/path label.
   --  @param Line Optional line number.
   --  @return Human-readable single diagnostic label.

   function Diagnostic_Label
     (Message  : String;
      Severity : Issue_Severity;
      Options  : Diagnostic_Label_Options;
      Path     : String := "";
      Line     : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Message Caller-provided diagnostic message.
   --  @param Severity Issue severity.
   --  @param Options Output mode and metadata inclusion policy.
   --  @param Path Optional file/path label.
   --  @param Line Optional line number.
   --  @return Human-readable single diagnostic label with optional metadata.

   function Source_Summary_Label
     (Source : Diagnostic_Source;
      Count  : Natural)
      return Humanize.Status.Text_Result;
   --  @param Source Diagnostic source category.
   --  @param Count Diagnostic count.
   --  @return Human-readable source summary label.

   function Check_Run_Summary_Label
     (Passed   : Natural := 0;
      Failed   : Natural := 0;
      Warnings : Natural := 0;
      Skipped  : Natural := 0;
      Pending  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Passed Passed check count.
   --  @param Failed Failed check count.
   --  @param Warnings Checks with warnings.
   --  @param Skipped Skipped check count.
   --  @param Pending Pending check count.
   --  @return Human-readable check-run summary.

   function Check_Duration_Label
     (Name       : String;
      Status     : Check_Status;
      Duration_S : Natural)
      return Humanize.Status.Text_Result;
   --  @param Name Check name.
   --  @param Status Check result state.
   --  @param Duration_S Duration in seconds supplied by caller.
   --  @return Human-readable check result with duration.

   function Retry_Label
     (Attempt : Positive;
      Limit   : Positive)
      return Humanize.Status.Text_Result;
   --  @param Attempt Current retry attempt.
   --  @param Limit Maximum retry attempts.
   --  @return Human-readable retry-attempt label.

   function Suggested_Action_Label
     (Action : String)
      return Humanize.Status.Text_Result;
   --  @param Action Caller-provided next action.
   --  @return Human-readable suggested-action label.

   function Affected_Items_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Affected item count.
   --  @return Human-readable affected-items label.

   function Field_Problem_Label
     (Field_Name : String;
      Message    : String;
      Severity   : Issue_Severity := Error_Severity)
      return Humanize.Status.Text_Result;
   --  @param Field_Name Field name.
   --  @param Message Caller-provided problem summary.
   --  @param Severity Issue severity.
   --  @return Human-readable field-problem label.

   function Field_Problem_Label
     (Field_Name : String;
      Message    : String;
      Severity   : Issue_Severity;
      Options    : Diagnostic_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Field_Name Field name.
   --  @param Message Caller-provided problem summary.
   --  @param Severity Issue severity.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable field-problem label with optional metadata.

   function Issue_Severity_Metadata
     (Severity : Issue_Severity)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param Severity Issue severity.
   --  @return Severity, tone, and final/actionable metadata for Severity.

   function Check_Status_Metadata
     (Status : Check_Status)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param Status Check result state.
   --  @return Severity, tone, and final/actionable metadata for Status.

   function Parse_Check_Result_Label
     (Text   : String;
      Status : Check_Status)
      return Diagnostic_Label_Parse_Result;
   --  @param Text Label in rendered check-result form.
   --  @param Status Expected check result state.
   --  @return Parsed check name span, status span, metadata, and consumed length.

   function Scan_Check_Result_Label
     (Text   : String;
      Status : Check_Status)
      return Diagnostic_Label_Parse_Result;
   --  @param Text Text beginning with a check-result label.
   --  @param Status Expected check result state.
   --  @return Parsed check-result prefix and consumed length.

   function Parse_Diagnostic_Label
     (Text     : String;
      Severity : Issue_Severity)
      return Diagnostic_Label_Parse_Result;
   --  @param Text Label in rendered no-location diagnostic form.
   --  @param Severity Expected issue severity.
   --  @return Parsed message span, severity span, metadata, and consumed length.

   function Scan_Diagnostic_Label
     (Text     : String;
      Severity : Issue_Severity)
      return Diagnostic_Label_Parse_Result;
   --  @param Text Text beginning with a no-location diagnostic label.
   --  @param Severity Expected issue severity.
   --  @return Parsed diagnostic prefix and consumed length.

   function Result_With_Notices_Label
     (Status  : Check_Status;
      Notices : Natural)
      return Humanize.Status.Text_Result;
   --  @param Status Check/result status.
   --  @param Notices Notice count.
   --  @return Human-readable result-with-notices label.

   function Diagnostic_Explanation_Label
     (Kind       : Diagnostic_Explanation_Kind;
      Subject    : String := "";
      Position   : Natural := 0;
      Suggestion : String := "")
      return Humanize.Status.Text_Result;
   --  @param Kind Explanation category.
   --  @param Subject Optional field, parser, or value label.
   --  @param Position Optional 1-based input position.
   --  @param Suggestion Optional caller-provided safe suggestion.
   --  @return Human-readable actionable diagnostic explanation.

   function Parser_Diagnostic_Explanation_Label
     (Family   : Parser_Family;
      Error    : String;
      Position : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Family Parser family that produced the diagnostic.
   --  @param Error Caller-supplied stable error label.
   --  @param Position Optional 1-based input position.
   --  @return Parser-specific actionable diagnostic explanation.

   function Parse_Diagnostic_Explanation_Label
     (Text : String)
      return Diagnostic_Explanation_Parse_Result;
   --  @param Text Label rendered by Diagnostic_Explanation_Label.
   --  @return Parsed explanation kind and optional spans.

   function Scan_Diagnostic_Explanation_Label
     (Text : String)
      return Diagnostic_Explanation_Parse_Result;
   --  @param Text Text beginning with a diagnostic explanation.
   --  @return Parsed explanation prefix and consumed length.

   procedure Diagnostic_Explanation_Label_Into
     (Kind       : Diagnostic_Explanation_Kind;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Subject    : String := "";
      Position   : Natural := 0;
      Suggestion : String := "");
   --  @param Kind Explanation category.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Subject Optional field, parser, or value label.
   --  @param Position Optional 1-based input position.
   --  @param Suggestion Optional caller-provided safe suggestion.

   procedure Issue_Summary_Label_Into
     (Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Errors   : Natural := 0;
      Warnings : Natural := 0;
      Notices  : Natural := 0;
      Blocking : Natural := 0);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Errors Error count.
   --  @param Warnings Warning count.
   --  @param Notices Notice/info count.
   --  @param Blocking Blocking issue count.

   procedure Location_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Path    : String := "";
      Line    : Natural := 0;
      Column  : Natural := 0);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Path Optional file/path label.
   --  @param Line Optional line number.
   --  @param Column Optional column number.

   procedure Diagnostic_Label_Into
     (Message  : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Severity : Issue_Severity := Error_Severity;
      Path     : String := "";
      Line     : Natural := 0);
   --  @param Message Caller-provided diagnostic message.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Severity Issue severity.
   --  @param Path Optional file/path label.
   --  @param Line Optional line number.

   procedure Check_Result_Label_Into
     (Name    : String;
      Status  : Check_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code;
      Options : Diagnostic_Label_Options);
   --  @param Name Check name.
   --  @param Status Check result state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Code Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Diagnostic_Label_Into
     (Message  : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Severity : Issue_Severity;
      Options  : Diagnostic_Label_Options;
      Path     : String := "";
      Line     : Natural := 0);
   --  @param Message Caller-provided diagnostic message.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Severity Issue severity.
   --  @param Options Output mode and metadata inclusion policy.
   --  @param Path Optional file/path label.
   --  @param Line Optional line number.

   procedure Field_Problem_Label_Into
     (Field_Name : String;
      Message    : String;
      Severity   : Issue_Severity;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Options    : Diagnostic_Label_Options);
   --  @param Field_Name Field name.
   --  @param Message Caller-provided problem summary.
   --  @param Severity Issue severity.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

end Humanize.Diagnostics;
