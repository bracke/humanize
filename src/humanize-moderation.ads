with Humanize.Domain_Details;
with Humanize.Status;

--  Deterministic labels for review, moderation, reports, and appeals.
package Humanize.Moderation is
   type Moderation_Output_Mode is
     (Moderation_Detailed,
      Moderation_Compact,
      Moderation_Accessible,
      Moderation_Log);
   --  Output policy for moderation labels.

   type Moderation_Label_Options is record
      Mode             : Moderation_Output_Mode := Moderation_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;
   --  Moderation label output options.

   Default_Moderation_Label_Options : constant Moderation_Label_Options :=
     (Mode             => Moderation_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Moderation_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;
   --  Parsed moderation/review/report label metadata.

   type Review_State is
     (Pending_Review, Approved, Rejected, Needs_Changes, Escalated_Review);
   --  Caller-supplied review lifecycle state.

   type Moderation_Action is
     (No_Action, Flagged, Hidden, Restored, Marked_Spam, Removed, Escalated);
   --  Caller-supplied moderation action.

   type Report_State is
     (Open_Report, Triaged_Report, Actioned_Report, Dismissed_Report,
      Appealed_Report, Closed_Report);
   --  Caller-supplied report lifecycle state.

   function Review_State_Label
     (State : Review_State)
      return Humanize.Status.Text_Result;
   --  @param State Review lifecycle state.
   --  @return Human-readable review-state label.

   function Moderation_Action_Label
     (Action : Moderation_Action)
      return Humanize.Status.Text_Result;
   --  @param Action Moderation action.
   --  @return Human-readable moderation-action label.

   function Report_State_Label
     (State : Report_State)
      return Humanize.Status.Text_Result;
   --  @param State Report lifecycle state.
   --  @return Human-readable report-state label.

   function Review_Label
     (Item  : String;
      State : Review_State)
      return Humanize.Status.Text_Result;
   --  @param Item Reviewed item label.
   --  @param State Review lifecycle state.
   --  @return Human-readable review label.

   function Review_Label
     (Item    : String;
      State   : Review_State;
      Options : Moderation_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Item Reviewed item label.
   --  @param State Review lifecycle state.
   --  @param Options Moderation output policy.
   --  @return Human-readable review label with optional metadata.

   function Moderation_Label
     (Item   : String;
      Action : Moderation_Action)
      return Humanize.Status.Text_Result;
   --  @param Item Moderated item label.
   --  @param Action Moderation action.
   --  @return Human-readable moderation label.

   function Moderation_Label
     (Item    : String;
      Action  : Moderation_Action;
      Options : Moderation_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Item Moderated item label.
   --  @param Action Moderation action.
   --  @param Options Moderation output policy.
   --  @return Human-readable moderation label with optional metadata.

   function Report_Label
     (Item  : String;
      State : Report_State)
      return Humanize.Status.Text_Result;
   --  @param Item Reported item label.
   --  @param State Report lifecycle state.
   --  @return Human-readable report label.

   function Report_Label
     (Item    : String;
      State   : Report_State;
      Options : Moderation_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Item Reported item label.
   --  @param State Report lifecycle state.
   --  @param Options Moderation output policy.
   --  @return Human-readable report label with optional metadata.

   function Review_State_Metadata
     (State : Review_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Review lifecycle state.
   --  @return Stable metadata for State.

   function Moderation_Action_Metadata
     (Action : Moderation_Action)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param Action Moderation action.
   --  @return Stable metadata for Action.

   function Report_State_Metadata
     (State : Report_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Report lifecycle state.
   --  @return Stable metadata for State.

   function Parse_Review_Label
     (Text  : String;
      State : Review_State)
      return Moderation_Label_Parse_Result;
   --  @param Text Review label emitted by Review_Label.
   --  @param State Expected review state suffix.
   --  @return Parsed review label spans and metadata.

   function Scan_Review_Label
     (Text  : String;
      State : Review_State)
      return Moderation_Label_Parse_Result;
   --  @param Text Text beginning with a review label.
   --  @param State Expected review state suffix.
   --  @return Parsed review label prefix spans and metadata.

   function Parse_Moderation_Label
     (Text   : String;
      Action : Moderation_Action)
      return Moderation_Label_Parse_Result;
   --  @param Text Moderation label emitted by Moderation_Label.
   --  @param Action Expected moderation action suffix.
   --  @return Parsed moderation label spans and metadata.

   function Scan_Moderation_Label
     (Text   : String;
      Action : Moderation_Action)
      return Moderation_Label_Parse_Result;
   --  @param Text Text beginning with a moderation label.
   --  @param Action Expected moderation action suffix.
   --  @return Parsed moderation label prefix spans and metadata.

   function Parse_Report_Label
     (Text  : String;
      State : Report_State)
      return Moderation_Label_Parse_Result;
   --  @param Text Report label emitted by Report_Label.
   --  @param State Expected report state suffix.
   --  @return Parsed report label spans and metadata.

   function Scan_Report_Label
     (Text  : String;
      State : Report_State)
      return Moderation_Label_Parse_Result;
   --  @param Text Text beginning with a report label.
   --  @param State Expected report state suffix.
   --  @return Parsed report label prefix spans and metadata.

   function Moderation_Queue_Label
     (Pending   : Natural;
      Escalated : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Pending Pending review/report count.
   --  @param Escalated Escalated review/report count.
   --  @return Human-readable moderation queue summary.

   function Appeal_Label
     (Item  : String;
      State : Report_State)
      return Humanize.Status.Text_Result;
   --  @param Item Appealed item label.
   --  @param State Appeal/report lifecycle state.
   --  @return Human-readable appeal label.

   procedure Review_State_Label_Into
     (State   : Review_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Review lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Moderation_Action_Label_Into
     (Action  : Moderation_Action;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Action Moderation action.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Report_State_Label_Into
     (State   : Report_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Report lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Review_Label_Into
     (Item    : String;
      State   : Review_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Item Reviewed item label.
   --  @param State Review lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Review_Label_Into
     (Item    : String;
      State   : Review_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Moderation_Label_Options);
   --  @param Item Reviewed item label.
   --  @param State Review lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Moderation output policy.

   procedure Moderation_Label_Into
     (Item    : String;
      Action  : Moderation_Action;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Item Moderated item label.
   --  @param Action Moderation action.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Report_Label_Into
     (Item    : String;
      State   : Report_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Item Reported item label.
   --  @param State Report lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Moderation_Queue_Label_Into
     (Pending   : Natural;
      Escalated : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Pending Pending review/report count.
   --  @param Escalated Escalated review/report count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Appeal_Label_Into
     (Item    : String;
      State   : Report_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Item Appealed item label.
   --  @param State Appeal/report lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
end Humanize.Moderation;
