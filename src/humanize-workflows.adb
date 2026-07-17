with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.Workflows is
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
     (Options : Workflow_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Workflow_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Workflow_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Workflow_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Workflow_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Workflow_State_Text (State : Workflow_State) return String is
   begin
      case State is
         when Not_Started_State => return "not started";
         when In_Progress_State => return "in progress";
         when Waiting_State => return "waiting";
         when Waiting_Approval_State => return "waiting for approval";
         when Blocked_State => return "blocked";
         when Completed_State => return "completed";
         when Failed_State => return "failed";
         when Cancelled_State => return "cancelled";
         when Skipped_State => return "skipped";
         when Paused_State => return "paused";
      end case;
   end Workflow_State_Text;

   function Step_State_Text (State : Step_State) return String is
   begin
      case State is
         when Pending_Step => return "pending";
         when Active_Step => return "active";
         when Waiting_Step => return "waiting";
         when Blocked_Step => return "blocked";
         when Done_Step => return "done";
         when Failed_Step => return "failed";
         when Skipped_Step => return "skipped";
      end case;
   end Step_State_Text;

   function Milestone_State_Text (State : Milestone_State) return String is
   begin
      case State is
         when Upcoming_Milestone => return "upcoming";
         when Current_Milestone => return "current";
         when Complete_Milestone => return "complete";
         when Missed_Milestone => return "missed";
         when Blocked_Milestone => return "blocked";
      end case;
   end Milestone_State_Text;

   function Workflow_State_Suffix (State : Workflow_State) return String is
   begin
      return Workflow_State_Text (State);
   end Workflow_State_Suffix;

   function Step_State_Suffix (State : Step_State) return String is
   begin
      return Step_State_Text (State);
   end Step_State_Suffix;

   function Milestone_State_Suffix (State : Milestone_State) return String is
   begin
      return Milestone_State_Text (State);
   end Milestone_State_Suffix;

   function Milestone_Label_Suffix (State : Milestone_State) return String is
   begin
      return Milestone_State_Suffix (State) & " milestone";
   end Milestone_Label_Suffix;

   function Workflow_State_Metadata
     (State : Workflow_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Workflows_Surface,
         Workflow_State_Suffix (State));
   end Workflow_State_Metadata;

   function Step_State_Metadata
     (State : Step_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Workflows_Surface, Step_State_Suffix (State));
   end Step_State_Metadata;

   function Milestone_State_Metadata
     (State : Milestone_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Workflows_Surface,
         Milestone_State_Suffix (State));
   end Milestone_State_Metadata;

   function Workflow_State_Label
     (State : Workflow_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Workflow_State_Suffix (State));
   end Workflow_State_Label;

   function Step_State_Label
     (State : Step_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Step_State_Suffix (State));
   end Step_State_Label;

   function Milestone_State_Label
     (State : Milestone_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Milestone_Label_Suffix (State));
   end Milestone_State_Label;

   function Step_Label
     (Current : Positive;
      Total   : Positive;
      Name    : String := "")
      return Humanize.Status.Text_Result
   is
      Step_Name : constant String := Clean (Name);
      Base : constant String := "step " & Image (Current) & " of " & Image (Total);
   begin
      if Current > Total then
         return Invalid_Text ("invalid step position");
      elsif Step_Name'Length = 0 then
         return Ok_Text (Base);
      else
         return Ok_Text (Base & ": " & Step_Name);
      end if;
   end Step_Label;

   function Step_Status_Label
     (Name  : String;
      State : Step_State)
      return Humanize.Status.Text_Result
   is
      Step_Name : constant String := Clean (Name);
   begin
      if Step_Name'Length = 0 then
         return Invalid_Text ("invalid step name");
      end if;
      return Ok_Text (Step_Name & " " & Step_State_Suffix (State));
   end Step_Status_Label;

   function Step_Status_Label
     (Name    : String;
      State   : Step_State;
      Options : Workflow_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Step_Status_Label (Name, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Step_State_Metadata (State), Domain_Options (Options));
   end Step_Status_Label;

   function Milestone_Label
     (Current : Natural;
      Total   : Natural;
      Name    : String := "")
      return Humanize.Status.Text_Result
   is
      Milestone_Name : constant String := Clean (Name);
      Base : constant String := Image (Current) & " of " & Image (Total) & " milestones complete";
   begin
      if Current > Total then
         return Invalid_Text ("invalid milestone position");
      elsif Milestone_Name'Length = 0 then
         return Ok_Text (Base);
      else
         return Ok_Text (Base & ": " & Milestone_Name);
      end if;
   end Milestone_Label;

   function Milestone_Status_Label
     (Name  : String;
      State : Milestone_State)
      return Humanize.Status.Text_Result
   is
      Milestone_Name : constant String := Clean (Name);
   begin
      if Milestone_Name'Length = 0 then
         return Invalid_Text ("invalid milestone name");
      end if;
      return Ok_Text (Milestone_Name & " " & Milestone_State_Suffix (State));
   end Milestone_Status_Label;

   function Milestone_Status_Label
     (Name    : String;
      State   : Milestone_State;
      Options : Workflow_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Milestone_Status_Label (Name, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Milestone_State_Metadata (State), Domain_Options (Options));
   end Milestone_Status_Label;

   function Workflow_Summary_Label
     (Total     : Natural;
      Completed : Natural := 0;
      Active    : Natural := 0;
      Blocked   : Natural := 0;
      Failed    : Natural := 0;
      Skipped   : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Text : Unbounded_String := To_Unbounded_String (Count_Text (Total, "item", "items"));
   begin
      if Completed > 0 then
         Append (Text, ", " & Count_Text (Completed, "completed", "completed"));
      end if;
      if Active > 0 then
         Append (Text, ", " & Count_Text (Active, "active", "active"));
      end if;
      if Blocked > 0 then
         Append (Text, ", " & Count_Text (Blocked, "blocked", "blocked"));
      end if;
      if Failed > 0 then
         Append (Text, ", " & Count_Text (Failed, "failed", "failed"));
      end if;
      if Skipped > 0 then
         Append (Text, ", " & Count_Text (Skipped, "skipped", "skipped"));
      end if;
      return Ok_Text (To_String (Text));
   end Workflow_Summary_Label;

   function Workflow_Progress_Label
     (Completed : Natural;
      Total     : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Completed > Total then
         return Invalid_Text ("invalid workflow progress");
      elsif Total = 0 then
         return Ok_Text ("no workflow items");
      elsif Completed * 2 = Total then
         return Ok_Text ("halfway through workflow");
      else
         return Ok_Text (Image (Completed) & " of " & Image (Total) & " complete");
      end if;
   end Workflow_Progress_Label;

   function Approval_Label
     (Approver : String := "";
      Waiting  : Boolean := True)
      return Humanize.Status.Text_Result
   is
      Name : constant String := Clean (Approver);
   begin
      if Waiting and then Name'Length > 0 then
         return Ok_Text ("waiting for approval from " & Name);
      elsif Waiting then
         return Ok_Text ("waiting for approval");
      elsif Name'Length > 0 then
         return Ok_Text ("approved by " & Name);
      else
         return Ok_Text ("approved");
      end if;
   end Approval_Label;

   function Blocker_Label
     (Reason : String)
      return Humanize.Status.Text_Result
   is
      Clean_Reason : constant String := Clean (Reason);
   begin
      if Clean_Reason'Length = 0 then
         return Invalid_Text ("invalid blocker reason");
      end if;
      return Ok_Text ("blocked: " & Clean_Reason);
   end Blocker_Label;

   function Next_Action_Label
     (Action : String)
      return Humanize.Status.Text_Result
   is
      Clean_Action : constant String := Clean (Action);
   begin
      if Clean_Action'Length = 0 then
         return Invalid_Text ("invalid next action");
      end if;
      return Ok_Text ("next: " & Clean_Action);
   end Next_Action_Label;

   function Queue_Position_Label
     (Position : Positive;
      Total    : Natural := 0)
      return Humanize.Status.Text_Result
   is
   begin
      if Total > 0 and then Position > Total then
         return Invalid_Text ("invalid queue position");
      elsif Total > 0 then
         return Ok_Text ("queue position " & Image (Position) & " of " & Image (Total));
      else
         return Ok_Text ("queue position " & Image (Position));
      end if;
   end Queue_Position_Label;

   function Waiting_Label
     (Reason : String := "")
      return Humanize.Status.Text_Result
   is
      Clean_Reason : constant String := Clean (Reason);
   begin
      if Clean_Reason'Length = 0 then
         return Ok_Text ("waiting");
      else
         return Ok_Text ("waiting for " & Clean_Reason);
      end if;
   end Waiting_Label;

   function Owner_Label
     (Owner : String)
      return Humanize.Status.Text_Result
   is
      Clean_Owner : constant String := Clean (Owner);
   begin
      if Clean_Owner'Length = 0 then
         return Invalid_Text ("invalid owner");
      end if;
      return Ok_Text ("owned by " & Clean_Owner);
   end Owner_Label;

   function Handoff_Label
     (From : String;
      To   : String)
      return Humanize.Status.Text_Result
   is
      Clean_From : constant String := Clean (From);
      Clean_To   : constant String := Clean (To);
   begin
      if Clean_From'Length = 0 or else Clean_To'Length = 0 then
         return Invalid_Text ("invalid handoff");
      end if;
      return Ok_Text ("handoff from " & Clean_From & " to " & Clean_To);
   end Handoff_Label;

   function Dependency_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Count_Or_No_Text
           (Count, "blocking dependency", "blocking dependencies"));
   end Dependency_Label;

   function Attempt_Label
     (Attempt : Positive;
      Limit   : Positive)
      return Humanize.Status.Text_Result
   is
   begin
      if Attempt > Limit then
         return Ok_Text ("attempt " & Image (Attempt) & " of " & Image (Limit) & " exceeded");
      else
         return Ok_Text ("attempt " & Image (Attempt) & " of " & Image (Limit));
      end if;
   end Attempt_Label;

   function Workflow_Result_Label
     (State : Workflow_State;
      Name  : String := "")
      return Humanize.Status.Text_Result
   is
      Workflow_Name : constant String := Clean (Name);
   begin
      if Workflow_Name'Length = 0 then
         return Ok_Text ("workflow " & Workflow_State_Suffix (State));
      else
         return Ok_Text (Workflow_Name & " " & Workflow_State_Suffix (State));
      end if;
   end Workflow_Result_Label;

   function Workflow_Result_Label
     (State   : Workflow_State;
      Options : Workflow_Label_Options;
      Name    : String := "")
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Workflow_Result_Label (State, Name);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Workflow_State_Metadata (State), Domain_Options (Options));
   end Workflow_Result_Label;

   function Parse_Workflow_Result_Label
     (Text  : String;
      State : Workflow_State)
      return Workflow_Label_Parse_Result
   is
      Result : Workflow_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Workflows_Surface,
         Workflow_State_Suffix (State));
      Result.Metadata := Workflow_State_Metadata (State);
      return Result;
   end Parse_Workflow_Result_Label;

   function Scan_Workflow_Result_Label
     (Text  : String;
      State : Workflow_State)
      return Workflow_Label_Parse_Result
   is
      Result : Workflow_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Workflows_Surface,
         Workflow_State_Suffix (State));
      Result.Metadata := Workflow_State_Metadata (State);
      return Result;
   end Scan_Workflow_Result_Label;

   function Parse_Step_Status_Label
     (Text  : String;
      State : Step_State)
      return Workflow_Label_Parse_Result
   is
      Result : Workflow_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Workflows_Surface,
         Step_State_Suffix (State));
      Result.Metadata := Step_State_Metadata (State);
      return Result;
   end Parse_Step_Status_Label;

   function Scan_Step_Status_Label
     (Text  : String;
      State : Step_State)
      return Workflow_Label_Parse_Result
   is
      Result : Workflow_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Workflows_Surface,
         Step_State_Suffix (State));
      Result.Metadata := Step_State_Metadata (State);
      return Result;
   end Scan_Step_Status_Label;

   function Parse_Milestone_Status_Label
     (Text  : String;
      State : Milestone_State)
      return Workflow_Label_Parse_Result
   is
      Result : Workflow_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Workflows_Surface,
         Milestone_State_Suffix (State));
      Result.Metadata := Milestone_State_Metadata (State);
      return Result;
   end Parse_Milestone_Status_Label;

   function Scan_Milestone_Status_Label
     (Text  : String;
      State : Milestone_State)
      return Workflow_Label_Parse_Result
   is
      Result : Workflow_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Workflows_Surface,
         Milestone_State_Suffix (State));
      Result.Metadata := Milestone_State_Metadata (State);
      return Result;
   end Scan_Milestone_Status_Label;

   function Resume_Label
     (Name : String := "")
      return Humanize.Status.Text_Result
   is
      Workflow_Name : constant String := Clean (Name);
   begin
      if Workflow_Name'Length = 0 then
         return Ok_Text ("resume workflow");
      else
         return Ok_Text ("resume " & Workflow_Name);
      end if;
   end Resume_Label;

   procedure Step_Label_Into
     (Current : Positive;
      Total   : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
      Result : constant Humanize.Status.Text_Result := Step_Label (Current, Total, Name);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Step_Label_Into;

   procedure Workflow_Summary_Label_Into
     (Total     : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Completed : Natural := 0;
      Active    : Natural := 0;
      Blocked   : Natural := 0;
      Failed    : Natural := 0;
      Skipped   : Natural := 0)
   is
      Result : constant Humanize.Status.Text_Result :=
        Workflow_Summary_Label (Total, Completed, Active, Blocked, Failed, Skipped);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Workflow_Summary_Label_Into;

   procedure Next_Action_Label_Into
     (Action  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Next_Action_Label (Action);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Next_Action_Label_Into;

   procedure Step_Status_Label_Into
     (Name    : String;
      State   : Step_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Workflow_Label_Options)
   is
   begin
      Copy_Result
        (Step_Status_Label (Name, State, Options), Target, Written, Status);
   end Step_Status_Label_Into;

   procedure Milestone_Status_Label_Into
     (Name    : String;
      State   : Milestone_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Workflow_Label_Options)
   is
   begin
      Copy_Result
        (Milestone_Status_Label (Name, State, Options), Target, Written,
         Status);
   end Milestone_Status_Label_Into;

   procedure Workflow_Result_Label_Into
     (State   : Workflow_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Workflow_Label_Options;
      Name    : String := "")
   is
   begin
      Copy_Result
        (Workflow_Result_Label (State, Options, Name), Target, Written,
         Status);
   end Workflow_Result_Label_Into;

end Humanize.Workflows;
