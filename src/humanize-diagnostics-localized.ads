with Humanize.Contexts;

--  Diagnostics labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain
--  labels"): each is the parent's function of the same name with a Context first, and that function itself in
--  English, where the locale has no translation, and for every input the parent rejects.
package Humanize.Diagnostics.Localized is

   function Affected_Items_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Affected_Items_Label.
   --  @return The label in Context's locale.

   function Check_Duration_Label
      (Context    : Humanize.Contexts.Context;
       Name       : String;
       Status     : Check_Status;
       Duration_S : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Check_Duration_Label.
   --  @param Status As for the parent's Check_Duration_Label.
   --  @param Duration_S As for the parent's Check_Duration_Label.
   --  @return The label in Context's locale.

   function Check_Result_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Status  : Check_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Check_Result_Label.
   --  @param Status As for the parent's Check_Result_Label.
   --  @return The label in Context's locale.

   function Check_Result_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Status  : Check_Status;
       Options : Diagnostic_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Check_Result_Label.
   --  @param Status As for the parent's Check_Result_Label.
   --  @param Options As for the parent's Check_Result_Label.
   --  @return The label in Context's locale.

   function Check_Run_Summary_Label
      (Context  : Humanize.Contexts.Context;
       Passed   : Natural := 0;
       Failed   : Natural := 0;
       Warnings : Natural := 0;
       Skipped  : Natural := 0;
       Pending  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Passed As for the parent's Check_Run_Summary_Label.
   --  @param Failed As for the parent's Check_Run_Summary_Label.
   --  @param Warnings As for the parent's Check_Run_Summary_Label.
   --  @param Skipped As for the parent's Check_Run_Summary_Label.
   --  @param Pending As for the parent's Check_Run_Summary_Label.
   --  @return The label in Context's locale.

   function Check_Status_Label
      (Context : Humanize.Contexts.Context;
       Status  : Check_Status)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status As for the parent's Check_Status_Label.
   --  @return The label in Context's locale.

   function Diagnostic_Explanation_Label
      (Context    : Humanize.Contexts.Context;
       Kind       : Diagnostic_Explanation_Kind;
       Subject    : String := "";
       Position   : Natural := 0;
       Suggestion : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Diagnostic_Explanation_Label.
   --  @param Subject As for the parent's Diagnostic_Explanation_Label.
   --  @param Position As for the parent's Diagnostic_Explanation_Label.
   --  @param Suggestion As for the parent's Diagnostic_Explanation_Label.
   --  @return The label in Context's locale.

   function Diagnostic_Label
      (Context  : Humanize.Contexts.Context;
       Message  : String;
       Severity : Issue_Severity := Error_Severity;
       Path     : String := "";
       Line     : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Message As for the parent's Diagnostic_Label.
   --  @param Severity As for the parent's Diagnostic_Label.
   --  @param Path As for the parent's Diagnostic_Label.
   --  @param Line As for the parent's Diagnostic_Label.
   --  @return The label in Context's locale.

   function Diagnostic_Label
      (Context  : Humanize.Contexts.Context;
       Message  : String;
       Severity : Issue_Severity;
       Options  : Diagnostic_Label_Options;
       Path     : String := "";
       Line     : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Message As for the parent's Diagnostic_Label.
   --  @param Severity As for the parent's Diagnostic_Label.
   --  @param Options As for the parent's Diagnostic_Label.
   --  @param Path As for the parent's Diagnostic_Label.
   --  @param Line As for the parent's Diagnostic_Label.
   --  @return The label in Context's locale.

   function Failed_At_Label
      (Context : Humanize.Contexts.Context;
       Path    : String;
       Line    : Natural := 0;
       Column  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Path As for the parent's Failed_At_Label.
   --  @param Line As for the parent's Failed_At_Label.
   --  @param Column As for the parent's Failed_At_Label.
   --  @return The label in Context's locale.

   function Field_Problem_Label
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Message    : String;
       Severity   : Issue_Severity := Error_Severity)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Field_Name As for the parent's Field_Problem_Label.
   --  @param Message As for the parent's Field_Problem_Label.
   --  @param Severity As for the parent's Field_Problem_Label.
   --  @return The label in Context's locale.

   function Field_Problem_Label
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Message    : String;
       Severity   : Issue_Severity;
       Options    : Diagnostic_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Field_Name As for the parent's Field_Problem_Label.
   --  @param Message As for the parent's Field_Problem_Label.
   --  @param Severity As for the parent's Field_Problem_Label.
   --  @param Options As for the parent's Field_Problem_Label.
   --  @return The label in Context's locale.

   function First_Failure_Label
      (Context    : Humanize.Contexts.Context;
       Check_Name : String;
       Path       : String := "";
       Line       : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Check_Name As for the parent's First_Failure_Label.
   --  @param Path As for the parent's First_Failure_Label.
   --  @param Line As for the parent's First_Failure_Label.
   --  @return The label in Context's locale.

   function Issue_Count_Label
      (Context  : Humanize.Contexts.Context;
       Errors   : Natural := 0;
       Warnings : Natural := 0;
       Notices  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Errors As for the parent's Issue_Count_Label.
   --  @param Warnings As for the parent's Issue_Count_Label.
   --  @param Notices As for the parent's Issue_Count_Label.
   --  @return The label in Context's locale.

   function Issue_Summary_Label
      (Context  : Humanize.Contexts.Context;
       Errors   : Natural := 0;
       Warnings : Natural := 0;
       Notices  : Natural := 0;
       Blocking : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Errors As for the parent's Issue_Summary_Label.
   --  @param Warnings As for the parent's Issue_Summary_Label.
   --  @param Notices As for the parent's Issue_Summary_Label.
   --  @param Blocking As for the parent's Issue_Summary_Label.
   --  @return The label in Context's locale.

   function Location_Label
      (Context : Humanize.Contexts.Context;
       Path    : String := "";
       Line    : Natural := 0;
       Column  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Path As for the parent's Location_Label.
   --  @param Line As for the parent's Location_Label.
   --  @param Column As for the parent's Location_Label.
   --  @return The label in Context's locale.

   function Parser_Diagnostic_Explanation_Label
      (Context  : Humanize.Contexts.Context;
       Family   : Parser_Family;
       Error    : String;
       Position : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Family As for the parent's Parser_Diagnostic_Explanation_Label.
   --  @param Error As for the parent's Parser_Diagnostic_Explanation_Label.
   --  @param Position As for the parent's Parser_Diagnostic_Explanation_Label.
   --  @return The label in Context's locale.

   function Result_With_Notices_Label
      (Context : Humanize.Contexts.Context;
       Status  : Check_Status;
       Notices : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Status As for the parent's Result_With_Notices_Label.
   --  @param Notices As for the parent's Result_With_Notices_Label.
   --  @return The label in Context's locale.

   function Retry_Label
      (Context : Humanize.Contexts.Context;
       Attempt : Positive;
       Limit   : Positive)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Attempt As for the parent's Retry_Label.
   --  @param Limit As for the parent's Retry_Label.
   --  @return The label in Context's locale.

   function Severity_Label
      (Context  : Humanize.Contexts.Context;
       Severity : Issue_Severity)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Severity As for the parent's Severity_Label.
   --  @return The label in Context's locale.

   function Source_Label
      (Context : Humanize.Contexts.Context;
       Source  : Diagnostic_Source)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Source As for the parent's Source_Label.
   --  @return The label in Context's locale.

   function Source_Summary_Label
      (Context : Humanize.Contexts.Context;
       Source  : Diagnostic_Source;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Source As for the parent's Source_Summary_Label.
   --  @param Count As for the parent's Source_Summary_Label.
   --  @return The label in Context's locale.

   function Suggested_Action_Label
      (Context : Humanize.Contexts.Context;
       Action  : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Action As for the parent's Suggested_Action_Label.
   --  @return The label in Context's locale.

   procedure Affected_Items_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Affected_Items_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Check_Run_Summary_Label_Into
      (Context  : Humanize.Contexts.Context;
       Passed   : Natural := 0;
       Failed   : Natural := 0;
       Warnings : Natural := 0;
       Skipped  : Natural := 0;
       Pending  : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Passed As for the parent's Check_Run_Summary_Label.
   --  @param Failed As for the parent's Check_Run_Summary_Label.
   --  @param Warnings As for the parent's Check_Run_Summary_Label.
   --  @param Skipped As for the parent's Check_Run_Summary_Label.
   --  @param Pending As for the parent's Check_Run_Summary_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Diagnostic_Explanation_Label_Into
      (Context    : Humanize.Contexts.Context;
       Kind       : Diagnostic_Explanation_Kind;
       Subject    : String := "";
       Position   : Natural := 0;
       Suggestion : String := "";
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Diagnostic_Explanation_Label.
   --  @param Subject As for the parent's Diagnostic_Explanation_Label.
   --  @param Position As for the parent's Diagnostic_Explanation_Label.
   --  @param Suggestion As for the parent's Diagnostic_Explanation_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Diagnostic_Label_Into
      (Context  : Humanize.Contexts.Context;
       Message  : String;
       Severity : Issue_Severity := Error_Severity;
       Path     : String := "";
       Line     : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Message As for the parent's Diagnostic_Label.
   --  @param Severity As for the parent's Diagnostic_Label.
   --  @param Path As for the parent's Diagnostic_Label.
   --  @param Line As for the parent's Diagnostic_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Diagnostic_Label_Into
      (Context  : Humanize.Contexts.Context;
       Message  : String;
       Severity : Issue_Severity;
       Options  : Diagnostic_Label_Options;
       Path     : String := "";
       Line     : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Message As for the parent's Diagnostic_Label.
   --  @param Severity As for the parent's Diagnostic_Label.
   --  @param Options As for the parent's Diagnostic_Label.
   --  @param Path As for the parent's Diagnostic_Label.
   --  @param Line As for the parent's Diagnostic_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Failed_At_Label_Into
      (Context : Humanize.Contexts.Context;
       Path    : String;
       Line    : Natural := 0;
       Column  : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Path As for the parent's Failed_At_Label.
   --  @param Line As for the parent's Failed_At_Label.
   --  @param Column As for the parent's Failed_At_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Field_Problem_Label_Into
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Message    : String;
       Severity   : Issue_Severity := Error_Severity;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Field_Name As for the parent's Field_Problem_Label.
   --  @param Message As for the parent's Field_Problem_Label.
   --  @param Severity As for the parent's Field_Problem_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Field_Problem_Label_Into
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Message    : String;
       Severity   : Issue_Severity;
       Options    : Diagnostic_Label_Options;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Field_Name As for the parent's Field_Problem_Label.
   --  @param Message As for the parent's Field_Problem_Label.
   --  @param Severity As for the parent's Field_Problem_Label.
   --  @param Options As for the parent's Field_Problem_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure First_Failure_Label_Into
      (Context    : Humanize.Contexts.Context;
       Check_Name : String;
       Path       : String := "";
       Line       : Natural := 0;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Check_Name As for the parent's First_Failure_Label.
   --  @param Path As for the parent's First_Failure_Label.
   --  @param Line As for the parent's First_Failure_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Issue_Count_Label_Into
      (Context  : Humanize.Contexts.Context;
       Errors   : Natural := 0;
       Warnings : Natural := 0;
       Notices  : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Errors As for the parent's Issue_Count_Label.
   --  @param Warnings As for the parent's Issue_Count_Label.
   --  @param Notices As for the parent's Issue_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Issue_Summary_Label_Into
      (Context  : Humanize.Contexts.Context;
       Errors   : Natural := 0;
       Warnings : Natural := 0;
       Notices  : Natural := 0;
       Blocking : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Errors As for the parent's Issue_Summary_Label.
   --  @param Warnings As for the parent's Issue_Summary_Label.
   --  @param Notices As for the parent's Issue_Summary_Label.
   --  @param Blocking As for the parent's Issue_Summary_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Location_Label_Into
      (Context : Humanize.Contexts.Context;
       Path    : String := "";
       Line    : Natural := 0;
       Column  : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Path As for the parent's Location_Label.
   --  @param Line As for the parent's Location_Label.
   --  @param Column As for the parent's Location_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Parser_Diagnostic_Explanation_Label_Into
      (Context  : Humanize.Contexts.Context;
       Family   : Parser_Family;
       Error    : String;
       Position : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Family As for the parent's Parser_Diagnostic_Explanation_Label.
   --  @param Error As for the parent's Parser_Diagnostic_Explanation_Label.
   --  @param Position As for the parent's Parser_Diagnostic_Explanation_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Retry_Label_Into
      (Context : Humanize.Contexts.Context;
       Attempt : Positive;
       Limit   : Positive;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Attempt As for the parent's Retry_Label.
   --  @param Limit As for the parent's Retry_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Severity_Label_Into
      (Context  : Humanize.Contexts.Context;
       Severity : Issue_Severity;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Severity As for the parent's Severity_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Source_Label_Into
      (Context : Humanize.Contexts.Context;
       Source  : Diagnostic_Source;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Source As for the parent's Source_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Source_Summary_Label_Into
      (Context : Humanize.Contexts.Context;
       Source  : Diagnostic_Source;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Source As for the parent's Source_Summary_Label.
   --  @param Count As for the parent's Source_Summary_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Suggested_Action_Label_Into
      (Context : Humanize.Contexts.Context;
       Action  : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Action As for the parent's Suggested_Action_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Diagnostics.Localized;
