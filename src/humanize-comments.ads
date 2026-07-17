with Humanize.Domain_Details;
with Humanize.Status;

--  Human-readable labels for comments, discussion threads, and reactions.
package Humanize.Comments is

   type Comment_Output_Mode is (Comment_Detailed, Comment_Compact,
                                Comment_Accessible, Comment_Log);

   type Comment_Label_Options is record
      Mode             : Comment_Output_Mode := Comment_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;

   Default_Comment_Label_Options : constant Comment_Label_Options :=
     (Mode             => Comment_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Comment_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;

   type Comment_State is
     (Draft_Comment,
      Published_Comment,
      Edited_Comment,
      Deleted_Comment,
      Resolved_Comment,
      Unresolved_Comment,
      Pinned_Comment,
      Hidden_Comment);
   --  Caller-supplied comment state.

   type Thread_State is
     (Open_Thread,
      Resolved_Thread,
      Locked_Thread,
      Archived_Thread);
   --  Caller-supplied discussion thread state.

   type Reaction_Kind is
     (Like_Reaction,
      Dislike_Reaction,
      Heart_Reaction,
      Laugh_Reaction,
      Confused_Reaction,
      Hooray_Reaction,
      Rocket_Reaction,
      Eyes_Reaction);
   --  Caller-supplied reaction kind.

   function Comment_State_Label
     (State : Comment_State)
      return Humanize.Status.Text_Result;
   --  @param State Comment state.
   --  @return Human-readable comment-state label.

   function Thread_State_Label
     (State : Thread_State)
      return Humanize.Status.Text_Result;
   --  @param State Discussion thread state.
   --  @return Human-readable thread-state label.

   function Reaction_Kind_Label
     (Kind : Reaction_Kind)
      return Humanize.Status.Text_Result;
   --  @param Kind Reaction kind.
   --  @return Human-readable reaction-kind label.

   function Comment_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Comment count.
   --  @return Human-readable comment count label.

   function Reply_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Reply count.
   --  @return Human-readable reply count label.

   function Thread_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Discussion thread count.
   --  @return Human-readable thread count label.

   function Comment_Label
     (Author : String;
      State  : Comment_State := Published_Comment)
      return Humanize.Status.Text_Result;
   --  @param Author Comment author display name.
   --  @param State Comment state.
   --  @return Human-readable comment label.

   function Comment_Label
     (Author  : String;
      State   : Comment_State;
      Options : Comment_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Author Comment author display name.
   --  @param State Comment state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable comment label with optional metadata.

   function Thread_Label
     (Name  : String;
      State : Thread_State := Open_Thread;
      Count : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Name Discussion thread name.
   --  @param State Discussion thread state.
   --  @param Count Optional comment count in the thread.
   --  @return Human-readable thread label.

   function Thread_Label
     (Name    : String;
      State   : Thread_State;
      Count   : Natural;
      Options : Comment_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Discussion thread name.
   --  @param State Discussion thread state.
   --  @param Count Optional comment count in the thread.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable thread label with optional metadata.

   function Comment_State_Metadata
     (State : Comment_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Comment state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Thread_State_Metadata
     (State : Thread_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Discussion thread state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Parse_Comment_Label
     (Text  : String;
      State : Comment_State)
      return Comment_Label_Parse_Result;
   --  @param Text Label in rendered comment-label form.
   --  @param State Expected comment state.
   --  @return Parsed author span, state span, metadata, and consumed length.

   function Scan_Comment_Label
     (Text  : String;
      State : Comment_State)
      return Comment_Label_Parse_Result;
   --  @param Text Text beginning with a comment label.
   --  @param State Expected comment state.
   --  @return Parsed label span and consumed prefix length.

   function Parse_Thread_Label
     (Text  : String;
      State : Thread_State;
      Count : Natural := 0)
      return Comment_Label_Parse_Result;
   --  @param Text Label in rendered thread-label form.
   --  @param State Expected discussion thread state.
   --  @param Count Expected optional comment count.
   --  @return Parsed thread name span, state span, metadata, and consumed length.

   function Scan_Thread_Label
     (Text  : String;
      State : Thread_State;
      Count : Natural := 0)
      return Comment_Label_Parse_Result;
   --  @param Text Text beginning with a thread label.
   --  @param State Expected discussion thread state.
   --  @param Count Expected optional comment count.
   --  @return Parsed label span and consumed prefix length.

   function Author_Action_Label
     (Author : String;
      State  : Comment_State)
      return Humanize.Status.Text_Result;
   --  @param Author Comment author display name.
   --  @param State Comment state.
   --  @return Human-readable author/comment action label.

   function Edited_Label
     (Time_Text : String := "")
      return Humanize.Status.Text_Result;
   --  @param Time_Text Optional caller-supplied edit time/distance label.
   --  @return Human-readable edited label.

   function Deleted_Label
     (Author : String := "")
      return Humanize.Status.Text_Result;
   --  @param Author Optional comment author display name.
   --  @return Human-readable deleted comment label.

   function Resolved_Label
     (Name : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Optional comment or thread name.
   --  @return Human-readable resolved comment/thread label.

   function Reaction_Label
     (Kind  : Reaction_Kind;
      Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Kind Reaction kind.
   --  @param Count Reaction count.
   --  @return Human-readable reaction label.

   function Participant_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Discussion participant count.
   --  @return Human-readable participant count label.

   function Mention_Label
     (Actor  : String;
      Target : String)
      return Humanize.Status.Text_Result;
   --  @param Actor Mentioning actor display name.
   --  @param Target Mention target display name.
   --  @return Human-readable mention label.

   function Subscribe_Label
     (Name : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Optional discussion name.
   --  @return Human-readable subscribe action label.

   function Unsubscribe_Label
     (Name : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Optional discussion name.
   --  @return Human-readable unsubscribe action label.

   function Pin_Label
     (Name : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Optional comment or thread name.
   --  @return Human-readable pin action label.

   function Unpin_Label
     (Name : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Optional comment or thread name.
   --  @return Human-readable unpin action label.

   function Lock_Thread_Label
     (Name : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Optional discussion thread name.
   --  @return Human-readable lock-thread action label.

   function Hide_Comment_Label
     (Reason : String := "")
      return Humanize.Status.Text_Result;
   --  @param Reason Optional moderation reason.
   --  @return Human-readable hide-comment moderation label.

   procedure Comment_State_Label_Into
     (State   : Comment_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Comment state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Thread_State_Label_Into
     (State   : Thread_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Discussion thread state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Reaction_Kind_Label_Into
     (Kind    : Reaction_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Kind Reaction kind.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Comment_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Comment count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Reply_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Reply count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Thread_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Discussion thread count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Comment_Label_Into
     (Author  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Comment_State := Published_Comment);
   --  @param Author Comment author display name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param State Comment state.

   procedure Comment_Label_Into
     (Author  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Comment_State;
      Options : Comment_Label_Options);
   --  @param Author Comment author display name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param State Comment state.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Thread_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Thread_State := Open_Thread;
      Count   : Natural := 0);
   --  @param Name Discussion thread name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param State Discussion thread state.
   --  @param Count Optional comment count in the thread.

   procedure Thread_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Thread_State;
      Count   : Natural;
      Options : Comment_Label_Options);
   --  @param Name Discussion thread name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param State Discussion thread state.
   --  @param Count Optional comment count in the thread.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Author_Action_Label_Into
     (Author  : String;
      State   : Comment_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Author Comment author display name.
   --  @param State Comment state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Edited_Label_Into
     (Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Time_Text : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Time_Text Optional caller-supplied edit time/distance label.

   procedure Deleted_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Author  : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Author Optional comment author display name.

   procedure Resolved_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional comment or thread name.

   procedure Reaction_Label_Into
     (Kind    : Reaction_Kind;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Kind Reaction kind.
   --  @param Count Reaction count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Participant_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Discussion participant count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Mention_Label_Into
     (Actor   : String;
      Target_Name : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Actor Mentioning actor display name.
   --  @param Target_Name Mention target display name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Subscribe_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional discussion name.

   procedure Unsubscribe_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional discussion name.

   procedure Pin_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional comment or thread name.

   procedure Unpin_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional comment or thread name.

   procedure Lock_Thread_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional discussion thread name.

   procedure Hide_Comment_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Reason  : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Reason Optional moderation reason.

end Humanize.Comments;
