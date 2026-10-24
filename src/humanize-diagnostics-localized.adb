with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
with Humanize.Selections;

package body Humanize.Diagnostics.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Affected_Items_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Affected_Items_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.diagnostics.affected_items_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Affected_Items_Label;

   function Check_Duration_Label
      (Context    : Humanize.Contexts.Context;
       Name       : String;
       Status     : Check_Status;
       Duration_S : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Check_Duration_Label (Name => Name, Status => Status, Duration_S => Duration_S);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.diagnostics.check_duration_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "duration_s", Long_Long_Integer (Duration_S));
      Selection := Sel.With_Arg (Selection, "status", Lower (Check_Status'Image (Status)));
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Check_Duration_Label;

   function Check_Result_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Status  : Check_Status)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Check_Result_Label (Name => Name, Status => Status);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.diagnostics.check_result_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "status", Lower (Check_Status'Image (Status)));
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Check_Result_Label;

   function Check_Result_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Status  : Check_Status;
       Options : Diagnostic_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Check_Result_Label (Name => Name, Status => Status, Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Diagnostics.Check_Result_Label (Name => Name, Status => Status);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Check_Result_Label (Context, Name => Name,
        Status => Status));
   end Check_Result_Label;

   function Check_Run_Summary_Label
      (Context  : Humanize.Contexts.Context;
       Passed   : Natural := 0;
       Failed   : Natural := 0;
       Warnings : Natural := 0;
       Skipped  : Natural := 0;
       Pending  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Check_Run_Summary_Label
          (Passed => Passed,
           Failed => Failed,
           Warnings => Warnings,
           Skipped => Skipped,
           Pending => Pending);
      Text : Humanize.Status.Text_Result := Humanize.Label_Values.Nothing;
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      if Passed = 0 and then Failed = 0 and then Warnings = 0 and then Skipped = 0 and then Pending = 0 then
         return Humanize.I18N_Rendering.Phrase_Or
           (Context, Sel.Phrase ("label.diagnostics.check_run_summary_label.none"), English);
      end if;
      if Passed > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.diagnostics.check_run_summary_label.passed", Long_Long_Integer (Passed)));
      end if;
      if Failed > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.diagnostics.check_run_summary_label.failed", Long_Long_Integer (Failed)));
      end if;
      if Warnings > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.diagnostics.check_run_summary_label.warnings", Long_Long_Integer (Warnings)));
      end if;
      if Skipped > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.diagnostics.check_run_summary_label.skipped", Long_Long_Integer (Skipped)));
      end if;
      if Pending > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.diagnostics.check_run_summary_label.pending", Long_Long_Integer (Pending)));
      end if;
      return Humanize.Label_Values.Localized_Or (Context, Text, English);
   end Check_Run_Summary_Label;

   function Check_Status_Label
      (Context : Humanize.Contexts.Context;
       Status  : Check_Status)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Check_Status_Label (Status => Status);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.diagnostics.check_status_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "status", Lower (Check_Status'Image (Status)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Check_Status_Label;

   function Diagnostic_Explanation_Label
      (Context    : Humanize.Contexts.Context;
       Kind       : Diagnostic_Explanation_Kind;
       Subject    : String := "";
       Position   : Natural := 0;
       Suggestion : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Diagnostic_Explanation_Label
          (Kind => Kind,
           Subject => Subject,
           Position => Position,
           Suggestion => Suggestion);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.diagnostics.diagnostic_explanation_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "position", Long_Long_Integer (Position));
      Selection := Sel.With_Arg (Selection, "kind", Lower (Diagnostic_Explanation_Kind'Image (Kind)));
      Selection := Sel.With_Arg (Selection, "subject", Humanize.Bounded_Text.Clean (Subject));
      Selection := Sel.With_Arg (Selection, "suggestion", Humanize.Bounded_Text.Clean (Suggestion));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Diagnostic_Explanation_Label;

   function Diagnostic_Label
      (Context  : Humanize.Contexts.Context;
       Message  : String;
       Severity : Issue_Severity := Error_Severity;
       Path     : String := "";
       Line     : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Diagnostic_Label (Message => Message, Severity => Severity, Path => Path, Line => Line);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.diagnostics.diagnostic_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "line", Long_Long_Integer (Line));
      Selection := Sel.With_Arg (Selection, "severity", Lower (Issue_Severity'Image (Severity)));
      Selection := Sel.With_Arg (Selection, "path", Humanize.Bounded_Text.Clean (Path));
      Selection := Sel.With_Arg (Selection, "message", Humanize.Bounded_Text.Clean (Message));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Diagnostic_Label;

   function Diagnostic_Label
      (Context  : Humanize.Contexts.Context;
       Message  : String;
       Severity : Issue_Severity;
       Options  : Diagnostic_Label_Options;
       Path     : String := "";
       Line     : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Diagnostic_Label
          (Message => Message,
           Severity => Severity,
           Options => Options,
           Path => Path,
           Line => Line);
      Plain_English : constant Humanize.Status.Text_Result :=
        Diagnostics.Diagnostic_Label (Message => Message, Severity => Severity, Path => Path, Line => Line);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Diagnostic_Label (Context, Message => Message,
        Severity => Severity, Path => Path, Line => Line));
   end Diagnostic_Label;

   function Failed_At_Label
      (Context : Humanize.Contexts.Context;
       Path    : String;
       Line    : Natural := 0;
       Column  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Failed_At_Label (Path => Path, Line => Line, Column => Column);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.diagnostics.failed_at_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "line", Long_Long_Integer (Line));
      Selection := Sel.With_Arg (Selection, "path", Humanize.Bounded_Text.Clean (Path));
      Selection := Sel.With_Arg (Selection, "column", Long_Long_Integer (Column));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Failed_At_Label;

   function Field_Problem_Label
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Message    : String;
       Severity   : Issue_Severity := Error_Severity)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Field_Problem_Label (Field_Name => Field_Name, Message => Message, Severity => Severity);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.diagnostics.field_problem_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "severity", Lower (Issue_Severity'Image (Severity)));
      Selection := Sel.With_Arg (Selection, "field_name", Humanize.Bounded_Text.Clean (Field_Name));
      Selection := Sel.With_Arg (Selection, "message", Humanize.Bounded_Text.Clean (Message));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Field_Problem_Label;

   function Field_Problem_Label
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Message    : String;
       Severity   : Issue_Severity;
       Options    : Diagnostic_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Field_Problem_Label
          (Field_Name => Field_Name,
           Message => Message,
           Severity => Severity,
           Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Diagnostics.Field_Problem_Label (Field_Name => Field_Name, Message => Message, Severity => Severity);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Field_Problem_Label (Context, Field_Name =>
        Field_Name, Message => Message, Severity => Severity));
   end Field_Problem_Label;

   function First_Failure_Label
      (Context    : Humanize.Contexts.Context;
       Check_Name : String;
       Path       : String := "";
       Line       : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.First_Failure_Label (Check_Name => Check_Name, Path => Path, Line => Line);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.diagnostics.first_failure_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "line", Long_Long_Integer (Line));
      Selection := Sel.With_Arg (Selection, "check_name", Humanize.Bounded_Text.Clean (Check_Name));
      Selection := Sel.With_Arg (Selection, "path", Humanize.Bounded_Text.Clean (Path));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end First_Failure_Label;

   function Issue_Count_Label
      (Context  : Humanize.Contexts.Context;
       Errors   : Natural := 0;
       Warnings : Natural := 0;
       Notices  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Issue_Count_Label (Errors => Errors, Warnings => Warnings, Notices => Notices);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.diagnostics.issue_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "warnings", Long_Long_Integer (Warnings));
      Selection := Sel.With_Arg (Selection, "notices", Long_Long_Integer (Notices));
      Selection := Sel.With_Arg (Selection, "errors", Long_Long_Integer (Errors));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Issue_Count_Label;

   function Issue_Summary_Label
      (Context  : Humanize.Contexts.Context;
       Errors   : Natural := 0;
       Warnings : Natural := 0;
       Notices  : Natural := 0;
       Blocking : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Issue_Summary_Label
          (Errors => Errors,
           Warnings => Warnings,
           Notices => Notices,
           Blocking => Blocking);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.diagnostics.issue_summary_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", (if Blocking > 0 then (if Errors = 0 and then Warnings = 0 and
        then Notices = 0 then "blocking_only" else "blocking") elsif Errors = 0 and then (Warnings > 0 or else Notices
        > 0) then "only" else "plain"));
      Selection := Sel.With_Arg (Selection, "blocking", Long_Long_Integer (Blocking));
      Selection := Sel.With_Arg (Selection, "base", Humanize.Label_Values.Text_Of (Issue_Count_Label (Context, Errors,
        Warnings, Notices)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Issue_Summary_Label;

   function Location_Label
      (Context : Humanize.Contexts.Context;
       Path    : String := "";
       Line    : Natural := 0;
       Column  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Location_Label (Path => Path, Line => Line, Column => Column);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.diagnostics.location_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "line", Long_Long_Integer (Line));
      Selection := Sel.With_Arg (Selection, "path", Humanize.Bounded_Text.Clean (Path));
      Selection := Sel.With_Arg (Selection, "column", Long_Long_Integer (Column));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Location_Label;

   function Parser_Diagnostic_Explanation_Label
      (Context  : Humanize.Contexts.Context;
       Family   : Parser_Family;
       Error    : String;
       Position : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Parser_Diagnostic_Explanation_Label (Family => Family, Error => Error, Position => Position);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.diagnostics.parser_diagnostic_explanation_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "position", Long_Long_Integer (Position));
      Selection := Sel.With_Arg (Selection, "family", Lower (Parser_Family'Image (Family)));
      Selection := Sel.With_Arg (Selection, "error", Humanize.Bounded_Text.Clean (Error));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Parser_Diagnostic_Explanation_Label;

   function Result_With_Notices_Label
      (Context : Humanize.Contexts.Context;
       Status  : Check_Status;
       Notices : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Result_With_Notices_Label (Status => Status, Notices => Notices);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.diagnostics.result_with_notices_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "status", Lower (Check_Status'Image (Status)));
      Selection := Sel.With_Arg (Selection, "notices", Long_Long_Integer (Notices));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Result_With_Notices_Label;

   function Retry_Label
      (Context : Humanize.Contexts.Context;
       Attempt : Positive;
       Limit   : Positive)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Retry_Label (Attempt => Attempt, Limit => Limit);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.diagnostics.retry_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "limit", Long_Long_Integer (Limit));
      Selection := Sel.With_Arg (Selection, "attempt", Long_Long_Integer (Attempt));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Retry_Label;

   function Severity_Label
      (Context  : Humanize.Contexts.Context;
       Severity : Issue_Severity)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Severity_Label (Severity => Severity);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.diagnostics.severity_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "severity", Lower (Issue_Severity'Image (Severity)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Severity_Label;

   function Source_Label
      (Context : Humanize.Contexts.Context;
       Source  : Diagnostic_Source)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Source_Label (Source => Source);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.diagnostics.source_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "source", Lower (Diagnostic_Source'Image (Source)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Source_Label;

   function Source_Summary_Label
      (Context : Humanize.Contexts.Context;
       Source  : Diagnostic_Source;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Source_Summary_Label (Source => Source, Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.diagnostics.source_summary_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      Selection := Sel.With_Arg (Selection, "source", Lower (Diagnostic_Source'Image (Source)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Source_Summary_Label;

   function Suggested_Action_Label
      (Context : Humanize.Contexts.Context;
       Action  : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Diagnostics.Suggested_Action_Label (Action => Action);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.diagnostics.suggested_action_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "action", Humanize.Bounded_Text.Clean (Action));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Suggested_Action_Label;

   procedure Affected_Items_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Affected_Items_Label (Context, Count => Count), Target, Written, Status);
   end Affected_Items_Label_Into;

   procedure Check_Run_Summary_Label_Into
      (Context  : Humanize.Contexts.Context;
       Passed   : Natural := 0;
       Failed   : Natural := 0;
       Warnings : Natural := 0;
       Skipped  : Natural := 0;
       Pending  : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Check_Run_Summary_Label (Context, Passed => Passed, Failed => Failed, Warnings => Warnings, Skipped =>
         Skipped, Pending => Pending),
         Target, Written, Status);
   end Check_Run_Summary_Label_Into;

   procedure Diagnostic_Explanation_Label_Into
      (Context    : Humanize.Contexts.Context;
       Kind       : Diagnostic_Explanation_Kind;
       Subject    : String := "";
       Position   : Natural := 0;
       Suggestion : String := "";
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Diagnostic_Explanation_Label (Context, Kind => Kind, Subject => Subject, Position => Position, Suggestion =>
         Suggestion),
         Target, Written, Status);
   end Diagnostic_Explanation_Label_Into;

   procedure Diagnostic_Label_Into
      (Context  : Humanize.Contexts.Context;
       Message  : String;
       Severity : Issue_Severity := Error_Severity;
       Path     : String := "";
       Line     : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Diagnostic_Label (Context, Message => Message, Severity => Severity, Path => Path, Line => Line),
         Target, Written, Status);
   end Diagnostic_Label_Into;

   procedure Diagnostic_Label_Into
      (Context  : Humanize.Contexts.Context;
       Message  : String;
       Severity : Issue_Severity;
       Options  : Diagnostic_Label_Options;
       Path     : String := "";
       Line     : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Diagnostic_Label (Context, Message => Message, Severity => Severity, Options => Options, Path => Path, Line
         => Line),
         Target, Written, Status);
   end Diagnostic_Label_Into;

   procedure Failed_At_Label_Into
      (Context : Humanize.Contexts.Context;
       Path    : String;
       Line    : Natural := 0;
       Column  : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Failed_At_Label (Context, Path => Path, Line => Line, Column => Column),
         Target, Written, Status);
   end Failed_At_Label_Into;

   procedure Field_Problem_Label_Into
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Message    : String;
       Severity   : Issue_Severity := Error_Severity;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Field_Problem_Label (Context, Field_Name => Field_Name, Message => Message, Severity => Severity),
         Target, Written, Status);
   end Field_Problem_Label_Into;

   procedure Field_Problem_Label_Into
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Message    : String;
       Severity   : Issue_Severity;
       Options    : Diagnostic_Label_Options;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Field_Problem_Label (Context, Field_Name => Field_Name, Message => Message, Severity => Severity, Options =>
         Options),
         Target, Written, Status);
   end Field_Problem_Label_Into;

   procedure First_Failure_Label_Into
      (Context    : Humanize.Contexts.Context;
       Check_Name : String;
       Path       : String := "";
       Line       : Natural := 0;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (First_Failure_Label (Context, Check_Name => Check_Name, Path => Path, Line => Line),
         Target, Written, Status);
   end First_Failure_Label_Into;

   procedure Issue_Count_Label_Into
      (Context  : Humanize.Contexts.Context;
       Errors   : Natural := 0;
       Warnings : Natural := 0;
       Notices  : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Issue_Count_Label (Context, Errors => Errors, Warnings => Warnings, Notices => Notices),
         Target, Written, Status);
   end Issue_Count_Label_Into;

   procedure Issue_Summary_Label_Into
      (Context  : Humanize.Contexts.Context;
       Errors   : Natural := 0;
       Warnings : Natural := 0;
       Notices  : Natural := 0;
       Blocking : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Issue_Summary_Label (Context, Errors => Errors, Warnings => Warnings, Notices => Notices, Blocking =>
         Blocking),
         Target, Written, Status);
   end Issue_Summary_Label_Into;

   procedure Location_Label_Into
      (Context : Humanize.Contexts.Context;
       Path    : String := "";
       Line    : Natural := 0;
       Column  : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Location_Label (Context, Path => Path, Line => Line, Column => Column),
         Target, Written, Status);
   end Location_Label_Into;

   procedure Parser_Diagnostic_Explanation_Label_Into
      (Context  : Humanize.Contexts.Context;
       Family   : Parser_Family;
       Error    : String;
       Position : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Parser_Diagnostic_Explanation_Label (Context, Family => Family, Error => Error, Position => Position),
         Target, Written, Status);
   end Parser_Diagnostic_Explanation_Label_Into;

   procedure Retry_Label_Into
      (Context : Humanize.Contexts.Context;
       Attempt : Positive;
       Limit   : Positive;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Retry_Label (Context, Attempt => Attempt, Limit => Limit),
         Target, Written, Status);
   end Retry_Label_Into;

   procedure Severity_Label_Into
      (Context  : Humanize.Contexts.Context;
       Severity : Issue_Severity;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Severity_Label (Context, Severity => Severity), Target, Written, Status);
   end Severity_Label_Into;

   procedure Source_Label_Into
      (Context : Humanize.Contexts.Context;
       Source  : Diagnostic_Source;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Source_Label (Context, Source => Source), Target, Written, Status);
   end Source_Label_Into;

   procedure Source_Summary_Label_Into
      (Context : Humanize.Contexts.Context;
       Source  : Diagnostic_Source;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Source_Summary_Label (Context, Source => Source, Count => Count),
         Target, Written, Status);
   end Source_Summary_Label_Into;

   procedure Suggested_Action_Label_Into
      (Context : Humanize.Contexts.Context;
       Action  : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Suggested_Action_Label (Context, Action => Action), Target, Written, Status);
   end Suggested_Action_Label_Into;

end Humanize.Diagnostics.Localized;
