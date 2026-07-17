with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.Comments is
   use type Humanize.Status.Status_Code;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Invalid_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Invalid_Text;

   function Clean (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function Image (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Count_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
      renames Humanize.Bounded_Text.Count_Text;
   function Count_Or_No_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
      renames Humanize.Bounded_Text.Count_Or_No_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Domain_Options
     (Options : Comment_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Comment_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Comment_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Comment_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Comment_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Comment_Text (State : Comment_State) return String is
   begin
      case State is
         when Draft_Comment      => return "draft";
         when Published_Comment  => return "published";
         when Edited_Comment     => return "edited";
         when Deleted_Comment    => return "deleted";
         when Resolved_Comment   => return "resolved";
         when Unresolved_Comment => return "unresolved";
         when Pinned_Comment     => return "pinned";
         when Hidden_Comment     => return "hidden";
      end case;
   end Comment_Text;

   function Thread_Text (State : Thread_State) return String is
   begin
      case State is
         when Open_Thread     => return "open";
         when Resolved_Thread => return "resolved";
         when Locked_Thread   => return "locked";
         when Archived_Thread => return "archived";
      end case;
   end Thread_Text;

   function Reaction_Text (Kind : Reaction_Kind) return String is
   begin
      case Kind is
         when Like_Reaction     => return "like";
         when Dislike_Reaction  => return "dislike";
         when Heart_Reaction    => return "heart";
         when Laugh_Reaction    => return "laugh";
         when Confused_Reaction => return "confused";
         when Hooray_Reaction   => return "hooray";
         when Rocket_Reaction   => return "rocket";
         when Eyes_Reaction     => return "eyes";
      end case;
   end Reaction_Text;

   function Reaction_Plural_Text (Kind : Reaction_Kind) return String is
   begin
      case Kind is
         when Like_Reaction     => return "likes";
         when Dislike_Reaction  => return "dislikes";
         when Heart_Reaction    => return "hearts";
         when Laugh_Reaction    => return "laughs";
         when Confused_Reaction => return "confused reactions";
         when Hooray_Reaction   => return "hoorays";
         when Rocket_Reaction   => return "rockets";
         when Eyes_Reaction     => return "eyes";
      end case;
   end Reaction_Plural_Text;

   function Action_Text (State : Comment_State) return String is
   begin
      case State is
         when Draft_Comment      => return "drafted a comment";
         when Published_Comment  => return "commented";
         when Edited_Comment     => return "edited a comment";
         when Deleted_Comment    => return "deleted a comment";
         when Resolved_Comment   => return "resolved a comment";
         when Unresolved_Comment => return "reopened a comment";
         when Pinned_Comment     => return "pinned a comment";
         when Hidden_Comment     => return "hid a comment";
      end case;
   end Action_Text;

   function Comment_State_Suffix (State : Comment_State) return String is
   begin
      return Comment_Text (State);
   end Comment_State_Suffix;

   function Comment_Label_Suffix (State : Comment_State) return String is
   begin
      return Comment_State_Suffix (State) & " comment";
   end Comment_Label_Suffix;

   function Thread_State_Suffix (State : Thread_State) return String is
   begin
      return Thread_Text (State);
   end Thread_State_Suffix;

   function Reaction_Suffix (Kind : Reaction_Kind) return String is
   begin
      return Reaction_Text (Kind);
   end Reaction_Suffix;

   function Thread_Suffix
     (State : Thread_State;
      Count : Natural)
      return String
   is
   begin
      if Count > 0 then
         return Thread_State_Suffix (State) & " thread, "
           & Count_Text (Count, "comment", "comments");
      else
         return Thread_State_Suffix (State) & " thread";
      end if;
   end Thread_Suffix;

   function Thread_Metadata
     (State : Thread_State;
      Count : Natural)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Comments_Surface, Thread_Suffix (State, Count));
   end Thread_Metadata;

   function Comment_State_Metadata
     (State : Comment_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Comments_Surface, Comment_State_Suffix (State));
   end Comment_State_Metadata;

   function Thread_State_Metadata
     (State : Thread_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Comments_Surface, Thread_State_Suffix (State));
   end Thread_State_Metadata;

   function Comment_State_Label
     (State : Comment_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Comment_Label_Suffix (State));
   end Comment_State_Label;

   function Thread_State_Label
     (State : Thread_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Thread_Suffix (State, 0));
   end Thread_State_Label;

   function Reaction_Kind_Label
     (Kind : Reaction_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Reaction_Suffix (Kind) & " reaction");
   end Reaction_Kind_Label;

   function Comment_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "comment", "comments"));
   end Comment_Count_Label;

   function Reply_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "reply", "replies"));
   end Reply_Count_Label;

   function Thread_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "thread", "threads"));
   end Thread_Count_Label;

   function Comment_Label
     (Author : String;
      State  : Comment_State := Published_Comment)
      return Humanize.Status.Text_Result
   is
      Name : constant String := Clean (Author);
   begin
      if Name'Length = 0 then
         return Invalid_Text ("invalid comment author");
      else
         return Ok_Text (Name & " " & Comment_Label_Suffix (State));
      end if;
   end Comment_Label;

   function Comment_Label
     (Author  : String;
      State   : Comment_State;
      Options : Comment_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Comment_Label (Author, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Comment_State_Metadata (State), Domain_Options (Options));
   end Comment_Label;

   function Parse_Comment_Label
     (Text  : String;
      State : Comment_State)
      return Comment_Label_Parse_Result
   is
      Result : Comment_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Comments_Surface,
         Comment_Label_Suffix (State));
      Result.Metadata := Comment_State_Metadata (State);
      return Result;
   end Parse_Comment_Label;

   function Scan_Comment_Label
     (Text  : String;
      State : Comment_State)
      return Comment_Label_Parse_Result
   is
      Result : Comment_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Comments_Surface,
         Comment_Label_Suffix (State));
      Result.Metadata := Comment_State_Metadata (State);
      return Result;
   end Scan_Comment_Label;

   function Thread_Label
     (Name  : String;
      State : Thread_State := Open_Thread;
      Count : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Thread_Name : constant String := Clean (Name);
      Text        : Unbounded_String;
   begin
      if Thread_Name'Length = 0 then
         return Invalid_Text ("invalid thread name");
      end if;

      Text := To_Unbounded_String (Thread_Name & " " & Thread_Suffix (State, Count));
      return Ok_Text (To_String (Text));
   end Thread_Label;

   function Thread_Label
     (Name    : String;
      State   : Thread_State;
      Count   : Natural;
      Options : Comment_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Thread_Label (Name, State, Count);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Thread_Metadata (State, Count), Domain_Options (Options));
   end Thread_Label;

   function Parse_Thread_Label
     (Text  : String;
      State : Thread_State;
      Count : Natural := 0)
      return Comment_Label_Parse_Result
   is
      Result : Comment_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Comments_Surface,
         Thread_Suffix (State, Count));
      Result.Metadata := Thread_Metadata (State, Count);
      return Result;
   end Parse_Thread_Label;

   function Scan_Thread_Label
     (Text  : String;
      State : Thread_State;
      Count : Natural := 0)
      return Comment_Label_Parse_Result
   is
      Result : Comment_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Comments_Surface,
         Thread_Suffix (State, Count));
      Result.Metadata := Thread_Metadata (State, Count);
      return Result;
   end Scan_Thread_Label;

   function Author_Action_Label
     (Author : String;
      State  : Comment_State)
      return Humanize.Status.Text_Result
   is
      Name : constant String := Clean (Author);
   begin
      if Name'Length = 0 then
         return Invalid_Text ("invalid comment author");
      else
         return Ok_Text (Name & " " & Action_Text (State));
      end if;
   end Author_Action_Label;

   function Edited_Label
     (Time_Text : String := "")
      return Humanize.Status.Text_Result
   is
      Time_Label : constant String := Clean (Time_Text);
   begin
      if Time_Label'Length = 0 then
         return Ok_Text ("edited");
      else
         return Ok_Text ("edited " & Time_Label);
      end if;
   end Edited_Label;

   function Deleted_Label
     (Author : String := "")
      return Humanize.Status.Text_Result
   is
      Name : constant String := Clean (Author);
   begin
      if Name'Length = 0 then
         return Ok_Text ("comment deleted");
      else
         return Ok_Text (Name & " deleted a comment");
      end if;
   end Deleted_Label;

   function Resolved_Label
     (Name : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Ok_Text ("resolved");
      else
         return Ok_Text (Label & " resolved");
      end if;
   end Resolved_Label;

   function Reaction_Label
     (Kind  : Reaction_Kind;
      Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Count_Or_No_Text
           (Count, Reaction_Suffix (Kind), Reaction_Plural_Text (Kind)));
   end Reaction_Label;

   function Participant_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "participant", "participants"));
   end Participant_Count_Label;

   function Mention_Label
     (Actor  : String;
      Target : String)
      return Humanize.Status.Text_Result
   is
      Actor_Name  : constant String := Clean (Actor);
      Target_Name : constant String := Clean (Target);
   begin
      if Actor_Name'Length = 0 then
         return Invalid_Text ("invalid mention actor");
      elsif Target_Name'Length = 0 then
         return Invalid_Text ("invalid mention target");
      else
         return Ok_Text (Actor_Name & " mentioned " & Target_Name);
      end if;
   end Mention_Label;

   function Subscribe_Label
     (Name : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Ok_Text ("subscribe to discussion");
      else
         return Ok_Text ("subscribe to " & Label);
      end if;
   end Subscribe_Label;

   function Unsubscribe_Label
     (Name : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Ok_Text ("unsubscribe from discussion");
      else
         return Ok_Text ("unsubscribe from " & Label);
      end if;
   end Unsubscribe_Label;

   function Pin_Label
     (Name : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Ok_Text ("pin comment");
      else
         return Ok_Text ("pin " & Label);
      end if;
   end Pin_Label;

   function Unpin_Label
     (Name : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Ok_Text ("unpin comment");
      else
         return Ok_Text ("unpin " & Label);
      end if;
   end Unpin_Label;

   function Lock_Thread_Label
     (Name : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Ok_Text ("lock thread");
      else
         return Ok_Text ("lock " & Label & " thread");
      end if;
   end Lock_Thread_Label;

   function Hide_Comment_Label
     (Reason : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Reason);
   begin
      if Label'Length = 0 then
         return Ok_Text ("hide comment");
      else
         return Ok_Text ("hide comment: " & Label);
      end if;
   end Hide_Comment_Label;

   procedure Comment_State_Label_Into
     (State   : Comment_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Comment_State_Label (State), Target, Written, Status);
   end Comment_State_Label_Into;

   procedure Thread_State_Label_Into
     (State   : Thread_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Thread_State_Label (State), Target, Written, Status);
   end Thread_State_Label_Into;

   procedure Reaction_Kind_Label_Into
     (Kind    : Reaction_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Reaction_Kind_Label (Kind), Target, Written, Status);
   end Reaction_Kind_Label_Into;

   procedure Comment_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Comment_Count_Label (Count), Target, Written, Status);
   end Comment_Count_Label_Into;

   procedure Reply_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Reply_Count_Label (Count), Target, Written, Status);
   end Reply_Count_Label_Into;

   procedure Thread_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Thread_Count_Label (Count), Target, Written, Status);
   end Thread_Count_Label_Into;

   procedure Comment_Label_Into
     (Author  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Comment_State := Published_Comment)
   is
   begin
      Copy_Result (Comment_Label (Author, State), Target, Written, Status);
   end Comment_Label_Into;

   procedure Comment_Label_Into
     (Author  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Comment_State;
      Options : Comment_Label_Options)
   is
   begin
      Copy_Result
        (Comment_Label (Author, State, Options), Target, Written, Status);
   end Comment_Label_Into;

   procedure Thread_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Thread_State := Open_Thread;
      Count   : Natural := 0)
   is
   begin
      Copy_Result (Thread_Label (Name, State, Count), Target, Written, Status);
   end Thread_Label_Into;

   procedure Thread_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Thread_State;
      Count   : Natural;
      Options : Comment_Label_Options)
   is
   begin
      Copy_Result
        (Thread_Label (Name, State, Count, Options), Target, Written, Status);
   end Thread_Label_Into;

   procedure Author_Action_Label_Into
     (Author  : String;
      State   : Comment_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Author_Action_Label (Author, State), Target, Written, Status);
   end Author_Action_Label_Into;

   procedure Edited_Label_Into
     (Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Time_Text : String := "")
   is
   begin
      Copy_Result (Edited_Label (Time_Text), Target, Written, Status);
   end Edited_Label_Into;

   procedure Deleted_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Author  : String := "")
   is
   begin
      Copy_Result (Deleted_Label (Author), Target, Written, Status);
   end Deleted_Label_Into;

   procedure Resolved_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
   begin
      Copy_Result (Resolved_Label (Name), Target, Written, Status);
   end Resolved_Label_Into;

   procedure Reaction_Label_Into
     (Kind    : Reaction_Kind;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Reaction_Label (Kind, Count), Target, Written, Status);
   end Reaction_Label_Into;

   procedure Participant_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Participant_Count_Label (Count), Target, Written, Status);
   end Participant_Count_Label_Into;

   procedure Mention_Label_Into
     (Actor   : String;
      Target_Name : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Mention_Label (Actor, Target_Name), Target, Written, Status);
   end Mention_Label_Into;

   procedure Subscribe_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
   begin
      Copy_Result (Subscribe_Label (Name), Target, Written, Status);
   end Subscribe_Label_Into;

   procedure Unsubscribe_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
   begin
      Copy_Result (Unsubscribe_Label (Name), Target, Written, Status);
   end Unsubscribe_Label_Into;

   procedure Pin_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
   begin
      Copy_Result (Pin_Label (Name), Target, Written, Status);
   end Pin_Label_Into;

   procedure Unpin_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
   begin
      Copy_Result (Unpin_Label (Name), Target, Written, Status);
   end Unpin_Label_Into;

   procedure Lock_Thread_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
   begin
      Copy_Result (Lock_Thread_Label (Name), Target, Written, Status);
   end Lock_Thread_Label_Into;

   procedure Hide_Comment_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Reason  : String := "")
   is
   begin
      Copy_Result (Hide_Comment_Label (Reason), Target, Written, Status);
   end Hide_Comment_Label_Into;

end Humanize.Comments;
