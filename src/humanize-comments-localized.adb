with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
with Humanize.Selections;

package body Humanize.Comments.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Author_Action_Label
      (Context : Humanize.Contexts.Context;
       Author  : String;
       State   : Comment_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Author_Action_Label (Author => Author, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.author_action_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Comment_State'Image (State)));
      Selection := Sel.With_Arg (Selection, "author", Humanize.Bounded_Text.Clean (Author));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Author_Action_Label;

   function Comment_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Comment_Count_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.comment_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Comment_Count_Label;

   function Comment_Label
      (Context : Humanize.Contexts.Context;
       Author  : String;
       State   : Comment_State := Published_Comment)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Comment_Label (Author => Author, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.comment_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Comment_State'Image (State)));
      Selection := Sel.With_Arg (Selection, "author", Humanize.Bounded_Text.Clean (Author));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Comment_Label;

   function Comment_Label
      (Context : Humanize.Contexts.Context;
       Author  : String;
       State   : Comment_State;
       Options : Comment_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Comment_Label (Author => Author, State => State, Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Comments.Comment_Label (Author => Author, State => State);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Comment_Label (Context, Author => Author, State
        => State));
   end Comment_Label;

   function Comment_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Comment_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Comment_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.comment_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Comment_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Comment_State_Label;

   function Deleted_Label
      (Context : Humanize.Contexts.Context;
       Author  : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Deleted_Label (Author => Author);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.deleted_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "author", Humanize.Bounded_Text.Clean (Author));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Deleted_Label;

   function Edited_Label
      (Context   : Humanize.Contexts.Context;
       Time_Text : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Edited_Label (Time_Text => Time_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.edited_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "time_text", Humanize.Bounded_Text.Clean (Time_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Edited_Label;

   function Hide_Comment_Label
      (Context : Humanize.Contexts.Context;
       Reason  : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Hide_Comment_Label (Reason => Reason);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.hide_comment_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "reason", Humanize.Bounded_Text.Clean (Reason));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Hide_Comment_Label;

   function Lock_Thread_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Lock_Thread_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.lock_thread_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Lock_Thread_Label;

   function Mention_Label
      (Context : Humanize.Contexts.Context;
       Actor   : String;
       Target  : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Mention_Label (Actor => Actor, Target => Target);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.mention_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "actor", Humanize.Bounded_Text.Clean (Actor));
      Selection := Sel.With_Arg (Selection, "target", Humanize.Bounded_Text.Clean (Target));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Mention_Label;

   function Participant_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Participant_Count_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.participant_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Participant_Count_Label;

   function Pin_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Pin_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.pin_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Pin_Label;

   function Reaction_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Reaction_Kind)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Reaction_Kind_Label (Kind => Kind);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.reaction_kind_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "kind", Lower (Reaction_Kind'Image (Kind)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Reaction_Kind_Label;

   function Reaction_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Reaction_Kind;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Reaction_Label (Kind => Kind, Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.reaction_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "kind", Lower (Reaction_Kind'Image (Kind)));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Reaction_Label;

   function Reply_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Reply_Count_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.reply_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Reply_Count_Label;

   function Resolved_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Resolved_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.resolved_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Resolved_Label;

   function Subscribe_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Subscribe_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.subscribe_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Subscribe_Label;

   function Thread_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Thread_Count_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.thread_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Thread_Count_Label;

   function Thread_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Thread_State := Open_Thread;
       Count   : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Thread_Label (Name => Name, State => State, Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.thread_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Thread_State'Image (State)));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Thread_Label;

   function Thread_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Thread_State;
       Count   : Natural;
       Options : Comment_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Thread_Label (Name => Name, State => State, Count => Count, Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Comments.Thread_Label (Name => Name, State => State, Count => Count);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Thread_Label (Context, Name => Name, State =>
        State, Count => Count));
   end Thread_Label;

   function Thread_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Thread_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Thread_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.thread_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Thread_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Thread_State_Label;

   function Unpin_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Unpin_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.unpin_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Unpin_Label;

   function Unsubscribe_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comments.Unsubscribe_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comments.unsubscribe_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Unsubscribe_Label;

   procedure Author_Action_Label_Into
      (Context : Humanize.Contexts.Context;
       Author  : String;
       State   : Comment_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Author_Action_Label (Context, Author => Author, State => State),
         Target, Written, Status);
   end Author_Action_Label_Into;

   procedure Comment_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Comment_Count_Label (Context, Count => Count), Target, Written, Status);
   end Comment_Count_Label_Into;

   procedure Comment_Label_Into
      (Context : Humanize.Contexts.Context;
       Author  : String;
       State   : Comment_State := Published_Comment;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Comment_Label (Context, Author => Author, State => State),
         Target, Written, Status);
   end Comment_Label_Into;

   procedure Comment_Label_Into
      (Context : Humanize.Contexts.Context;
       Author  : String;
       State   : Comment_State;
       Options : Comment_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Comment_Label (Context, Author => Author, State => State, Options => Options),
         Target, Written, Status);
   end Comment_Label_Into;

   procedure Comment_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Comment_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Comment_State_Label (Context, State => State), Target, Written, Status);
   end Comment_State_Label_Into;

   procedure Deleted_Label_Into
      (Context : Humanize.Contexts.Context;
       Author  : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Deleted_Label (Context, Author => Author), Target, Written, Status);
   end Deleted_Label_Into;

   procedure Edited_Label_Into
      (Context   : Humanize.Contexts.Context;
       Time_Text : String := "";
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Edited_Label (Context, Time_Text => Time_Text), Target, Written, Status);
   end Edited_Label_Into;

   procedure Hide_Comment_Label_Into
      (Context : Humanize.Contexts.Context;
       Reason  : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Hide_Comment_Label (Context, Reason => Reason), Target, Written, Status);
   end Hide_Comment_Label_Into;

   procedure Lock_Thread_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Lock_Thread_Label (Context, Name => Name), Target, Written, Status);
   end Lock_Thread_Label_Into;

   procedure Participant_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Participant_Count_Label (Context, Count => Count), Target, Written, Status);
   end Participant_Count_Label_Into;

   procedure Pin_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Pin_Label (Context, Name => Name), Target, Written, Status);
   end Pin_Label_Into;

   procedure Reaction_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Reaction_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Reaction_Kind_Label (Context, Kind => Kind), Target, Written, Status);
   end Reaction_Kind_Label_Into;

   procedure Reaction_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Reaction_Kind;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Reaction_Label (Context, Kind => Kind, Count => Count),
         Target, Written, Status);
   end Reaction_Label_Into;

   procedure Reply_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Reply_Count_Label (Context, Count => Count), Target, Written, Status);
   end Reply_Count_Label_Into;

   procedure Resolved_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Resolved_Label (Context, Name => Name), Target, Written, Status);
   end Resolved_Label_Into;

   procedure Subscribe_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Subscribe_Label (Context, Name => Name), Target, Written, Status);
   end Subscribe_Label_Into;

   procedure Thread_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Thread_Count_Label (Context, Count => Count), Target, Written, Status);
   end Thread_Count_Label_Into;

   procedure Thread_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Thread_State := Open_Thread;
       Count   : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Thread_Label (Context, Name => Name, State => State, Count => Count),
         Target, Written, Status);
   end Thread_Label_Into;

   procedure Thread_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Thread_State;
       Count   : Natural;
       Options : Comment_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Thread_Label (Context, Name => Name, State => State, Count => Count, Options => Options),
         Target, Written, Status);
   end Thread_Label_Into;

   procedure Thread_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Thread_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Thread_State_Label (Context, State => State), Target, Written, Status);
   end Thread_State_Label_Into;

   procedure Unpin_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Unpin_Label (Context, Name => Name), Target, Written, Status);
   end Unpin_Label_Into;

   procedure Unsubscribe_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Unsubscribe_Label (Context, Name => Name), Target, Written, Status);
   end Unsubscribe_Label_Into;

end Humanize.Comments.Localized;
