
with Humanize.Bounded_Text;

package body Humanize.Moderation is
   use type Humanize.Status.Status_Code;

   function Image (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Review_Text (State : Review_State) return String is
   begin
      case State is
         when Pending_Review   => return "pending review";
         when Approved         => return "approved";
         when Rejected         => return "rejected";
         when Needs_Changes    => return "needs changes";
         when Escalated_Review => return "escalated review";
      end case;
   end Review_Text;

   function Action_Text (Action : Moderation_Action) return String is
   begin
      case Action is
         when No_Action   => return "no moderation action";
         when Flagged     => return "flagged";
         when Hidden      => return "hidden by moderator";
         when Restored    => return "restored";
         when Marked_Spam => return "marked as spam";
         when Removed     => return "removed";
         when Escalated   => return "escalated";
      end case;
   end Action_Text;

   function Report_Text (State : Report_State) return String is
   begin
      case State is
         when Open_Report      => return "open report";
         when Triaged_Report   => return "triaged report";
         when Actioned_Report  => return "action taken";
         when Dismissed_Report => return "dismissed report";
         when Appealed_Report  => return "appealed report";
         when Closed_Report    => return "closed report";
      end case;
   end Report_Text;

   function Review_State_Label (State : Review_State) return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Review_Text (State));
   end Review_State_Label;

   function Moderation_Action_Label (Action : Moderation_Action) return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Action_Text (Action));
   end Moderation_Action_Label;

   function Report_State_Label (State : Report_State) return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Report_Text (State));
   end Report_State_Label;

   function Domain_Options
     (Options : Moderation_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Moderation_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Moderation_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Moderation_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Moderation_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Review_Label_Suffix
     (State : Review_State)
      return String
   is
   begin
      return Review_Text (State);
   end Review_Label_Suffix;

   function Moderation_Label_Suffix
     (Action : Moderation_Action)
      return String
   is
   begin
      return Action_Text (Action);
   end Moderation_Label_Suffix;

   function Report_Label_Suffix
     (State : Report_State)
      return String
   is
   begin
      return Report_Text (State);
   end Report_Label_Suffix;

   function Review_State_Metadata
     (State : Review_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Moderation_Surface, Review_Label_Suffix (State));
   end Review_State_Metadata;

   function Moderation_Action_Metadata
     (Action : Moderation_Action)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Moderation_Surface,
         Moderation_Label_Suffix (Action));
   end Moderation_Action_Metadata;

   function Report_State_Metadata
     (State : Report_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Moderation_Surface, Report_Label_Suffix (State));
   end Report_State_Metadata;

   function Item_Label (Item, Text, Message : String) return Humanize.Status.Text_Result is
   begin
      return Humanize.Bounded_Text.Nonempty_Label_Text
        (Item, Message, Suffix => " " & Text);
   end Item_Label;

   function Review_Label (Item : String; State : Review_State) return Humanize.Status.Text_Result is
   begin
      return Item_Label (Item, Review_Label_Suffix (State), "invalid review item");
   end Review_Label;

   function Review_Label
     (Item    : String;
      State   : Review_State;
      Options : Moderation_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Review_Label (Item, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Review_State_Metadata (State), Domain_Options (Options));
   end Review_Label;

   function Moderation_Label (Item : String; Action : Moderation_Action) return Humanize.Status.Text_Result is
   begin
      return Item_Label
        (Item, Moderation_Label_Suffix (Action), "invalid moderation item");
   end Moderation_Label;

   function Moderation_Label
     (Item    : String;
      Action  : Moderation_Action;
      Options : Moderation_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Moderation_Label (Item, Action);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Moderation_Action_Metadata (Action), Domain_Options (Options));
   end Moderation_Label;

   function Report_Label (Item : String; State : Report_State) return Humanize.Status.Text_Result is
   begin
      return Item_Label (Item, Report_Label_Suffix (State), "invalid report item");
   end Report_Label;

   function Report_Label
     (Item    : String;
      State   : Report_State;
      Options : Moderation_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Report_Label (Item, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Report_State_Metadata (State), Domain_Options (Options));
   end Report_Label;

   function Parse_Review_Label
     (Text  : String;
      State : Review_State)
      return Moderation_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Moderation_Surface,
         Review_Label_Suffix (State));
   end Parse_Review_Label;

   function Scan_Review_Label
     (Text  : String;
      State : Review_State)
      return Moderation_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Moderation_Surface,
         Review_Label_Suffix (State));
   end Scan_Review_Label;

   function Parse_Moderation_Label
     (Text   : String;
      Action : Moderation_Action)
      return Moderation_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Moderation_Surface,
         Moderation_Label_Suffix (Action));
   end Parse_Moderation_Label;

   function Scan_Moderation_Label
     (Text   : String;
      Action : Moderation_Action)
      return Moderation_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Moderation_Surface,
         Moderation_Label_Suffix (Action));
   end Scan_Moderation_Label;

   function Parse_Report_Label
     (Text  : String;
      State : Report_State)
      return Moderation_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Moderation_Surface,
         Report_Label_Suffix (State));
   end Parse_Report_Label;

   function Scan_Report_Label
     (Text  : String;
      State : Report_State)
      return Moderation_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Moderation_Surface,
         Report_Label_Suffix (State));
   end Scan_Report_Label;

   function Moderation_Queue_Label (Pending : Natural; Escalated : Natural := 0) return Humanize.Status.Text_Result is
   begin
      if Pending = 0 and then Escalated = 0 then
         return Ok_Text ("moderation queue empty");
      elsif Escalated = 0 then
         return Ok_Text (Image (Pending) & " pending review");
      else
         return Ok_Text (Image (Pending) & " pending review, " & Image (Escalated) & " escalated");
      end if;
   end Moderation_Queue_Label;

   function Appeal_Label (Item : String; State : Report_State) return Humanize.Status.Text_Result is
   begin
      return Item_Label
        (Item, "appeal " & Report_Label_Suffix (State), "invalid appeal item");
   end Appeal_Label;

   procedure Review_State_Label_Into
     (State : Review_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Review_State_Label (State), Target, Written, Status);
   end Review_State_Label_Into;

   procedure Moderation_Action_Label_Into
     (Action : Moderation_Action;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Moderation_Action_Label (Action), Target, Written, Status);
   end Moderation_Action_Label_Into;

   procedure Report_State_Label_Into
     (State : Report_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Report_State_Label (State), Target, Written, Status);
   end Report_State_Label_Into;

   procedure Review_Label_Into
     (Item : String;
     State : Review_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Review_Label (Item, State), Target, Written, Status);
   end Review_Label_Into;

   procedure Review_Label_Into
     (Item    : String;
      State   : Review_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Moderation_Label_Options)
   is
   begin
      Copy_Result (Review_Label (Item, State, Options), Target, Written, Status);
   end Review_Label_Into;

   procedure Moderation_Label_Into
     (Item : String;
     Action : Moderation_Action;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Moderation_Label (Item, Action), Target, Written, Status);
   end Moderation_Label_Into;

   procedure Report_Label_Into
     (Item : String;
     State : Report_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Report_Label (Item, State), Target, Written, Status);
   end Report_Label_Into;

   procedure Moderation_Queue_Label_Into
     (Pending : Natural;
     Escalated : Natural;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Moderation_Queue_Label (Pending, Escalated), Target, Written, Status);
   end Moderation_Queue_Label_Into;

   procedure Appeal_Label_Into
     (Item : String;
     State : Report_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Appeal_Label (Item, State), Target, Written, Status);
   end Appeal_Label_Into;
end Humanize.Moderation;
