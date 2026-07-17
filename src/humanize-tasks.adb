with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.Tasks is
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
     (Options : Task_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Task_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Task_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Task_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Task_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function State_Text (State : Task_State) return String is
   begin
      case State is
         when Open_Task        => return "open";
         when In_Progress_Task => return "in progress";
         when Blocked_Task     => return "blocked";
         when Done_Task        => return "done";
         when Canceled_Task    => return "canceled";
         when Deferred_Task    => return "deferred";
         when Overdue_Task     => return "overdue";
      end case;
   end State_Text;

   function Priority_Text (Priority : Task_Priority) return String is
   begin
      case Priority is
         when No_Priority       => return "no priority";
         when Low_Priority      => return "low priority";
         when Medium_Priority   => return "medium priority";
         when High_Priority     => return "high priority";
         when Critical_Priority => return "critical priority";
      end case;
   end Priority_Text;

   function Assignment_Text (State : Assignment_State) return String is
   begin
      case State is
         when Unassigned => return "unassigned";
         when Assigned   => return "assigned";
         when Reassigned => return "reassigned";
         when Watching   => return "watching";
         when Owned      => return "owner";
      end case;
   end Assignment_Text;

   function Task_State_Suffix (State : Task_State) return String is
   begin
      return State_Text (State);
   end Task_State_Suffix;

   function Priority_Suffix (Priority : Task_Priority) return String is
   begin
      return Priority_Text (Priority);
   end Priority_Suffix;

   function Task_Suffix
     (State    : Task_State;
      Priority : Task_Priority)
      return String
   is
   begin
      if Priority = No_Priority then
         return Task_State_Suffix (State) & " task";
      else
         return Task_State_Suffix (State) & " task, " & Priority_Suffix (Priority);
      end if;
   end Task_Suffix;

   function Assignment_Suffix (State : Assignment_State) return String is
   begin
      if State = Owned then
         return "owns task";
      else
         return Assignment_Text (State);
      end if;
   end Assignment_Suffix;

   function Task_Metadata
     (State    : Task_State;
      Priority : Task_Priority)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Tasks_Surface, Task_Suffix (State, Priority));
   end Task_Metadata;

   function Task_State_Metadata
     (State : Task_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Tasks_Surface, Task_State_Suffix (State));
   end Task_State_Metadata;

   function Task_Priority_Metadata
     (Priority : Task_Priority)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Tasks_Surface, Priority_Suffix (Priority));
   end Task_Priority_Metadata;

   function Assignment_State_Metadata
     (State : Assignment_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Tasks_Surface, Assignment_Suffix (State));
   end Assignment_State_Metadata;

   function Task_State_Label
     (State : Task_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Task_Suffix (State, No_Priority));
   end Task_State_Label;

   function Task_Priority_Label
     (Priority : Task_Priority)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Priority_Suffix (Priority));
   end Task_Priority_Label;

   function Assignment_State_Label
     (State : Assignment_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Assignment_Suffix (State));
   end Assignment_State_Label;

   function Task_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "task", "tasks"));
   end Task_Count_Label;

   function Open_Task_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "open task", "open tasks"));
   end Open_Task_Count_Label;

   function Completed_Task_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Count_Or_No_Text (Count, "completed task", "completed tasks"));
   end Completed_Task_Count_Label;

   function Task_Label
     (Name     : String;
      State    : Task_State := Open_Task;
      Priority : Task_Priority := No_Priority)
      return Humanize.Status.Text_Result
   is
      Task_Name : constant String := Clean (Name);
      Text      : Unbounded_String;
   begin
      if Task_Name'Length = 0 then
         return Invalid_Text ("invalid task name");
      end if;

      Text := To_Unbounded_String
        (Task_Name & " " & Task_Suffix (State, No_Priority));
      if Priority /= No_Priority then
         Append (Text, ", ");
         Append (Text, Priority_Suffix (Priority));
      end if;
      return Ok_Text (To_String (Text));
   end Task_Label;

   function Task_Label
     (Name     : String;
      State    : Task_State;
      Priority : Task_Priority;
      Options  : Task_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Task_Label (Name, State, Priority);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Task_Metadata (State, Priority), Domain_Options (Options));
   end Task_Label;

   function Assignment_Label
     (Assignee : String;
      State    : Assignment_State := Assigned)
      return Humanize.Status.Text_Result
   is
      Name : constant String := Clean (Assignee);
   begin
      if Name'Length = 0 then
         if State = Unassigned then
            return Ok_Text ("unassigned");
         else
            return Invalid_Text ("invalid assignee");
         end if;
      elsif State = Owned then
         return Ok_Text (Name & " owns task");
      else
         return Ok_Text (Name & " " & Assignment_Suffix (State));
      end if;
   end Assignment_Label;

   function Assignment_Label
     (Assignee : String;
      State    : Assignment_State;
      Options  : Task_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Assignment_Label (Assignee, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Assignment_State_Metadata (State), Domain_Options (Options));
   end Assignment_Label;

   function Parse_Task_Label
     (Text     : String;
      State    : Task_State;
      Priority : Task_Priority := No_Priority)
      return Task_Label_Parse_Result
   is
      Result : Task_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Tasks_Surface,
         Task_Suffix (State, Priority));
      Result.Metadata := Task_Metadata (State, Priority);
      return Result;
   end Parse_Task_Label;

   function Scan_Task_Label
     (Text     : String;
      State    : Task_State;
      Priority : Task_Priority := No_Priority)
      return Task_Label_Parse_Result
   is
      Result : Task_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Tasks_Surface,
         Task_Suffix (State, Priority));
      Result.Metadata := Task_Metadata (State, Priority);
      return Result;
   end Scan_Task_Label;

   function Parse_Assignment_Label
     (Text  : String;
      State : Assignment_State)
      return Task_Label_Parse_Result
   is
      Result : Task_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Tasks_Surface,
         Assignment_Suffix (State));
      Result.Metadata := Assignment_State_Metadata (State);
      return Result;
   end Parse_Assignment_Label;

   function Scan_Assignment_Label
     (Text  : String;
      State : Assignment_State)
      return Task_Label_Parse_Result
   is
      Result : Task_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Tasks_Surface,
         Assignment_Suffix (State));
      Result.Metadata := Assignment_State_Metadata (State);
      return Result;
   end Scan_Assignment_Label;

   function Due_Label
     (Due_Text : String)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Due_Text);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid due label");
      else
         return Ok_Text ("due " & Label);
      end if;
   end Due_Label;

   function Overdue_Label
     (Due_Text : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Due_Text);
   begin
      if Label'Length = 0 then
         return Ok_Text ("overdue");
      else
         return Ok_Text ("overdue since " & Label);
      end if;
   end Overdue_Label;

   function Checklist_Label
     (Done  : Natural;
      Total : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Done > Total then
         return Invalid_Text ("invalid checklist progress");
      elsif Total = 0 then
         return Ok_Text ("no checklist items");
      else
         return Ok_Text
           (Image (Done) & " of " & Count_Text (Total, "item", "items")
            & " complete");
      end if;
   end Checklist_Label;

   function Blocker_Label
     (Name : String)
      return Humanize.Status.Text_Result
   is
      Blocker : constant String := Clean (Name);
   begin
      if Blocker'Length = 0 then
         return Invalid_Text ("invalid blocker");
      else
         return Ok_Text ("blocked by " & Blocker);
      end if;
   end Blocker_Label;

   function Subtask_Label
     (Name  : String;
      Count : Natural)
      return Humanize.Status.Text_Result
   is
      Task_Name : constant String := Clean (Name);
   begin
      if Task_Name'Length = 0 then
         return Invalid_Text ("invalid task name");
      else
         return Ok_Text
           (Task_Name & ": " & Count_Text (Count, "subtask", "subtasks"));
      end if;
   end Subtask_Label;

   function Complete_Action_Label
     (Count : Natural := 1)
      return Humanize.Status.Text_Result
   is
   begin
      if Count = 1 then
         return Ok_Text ("complete task");
      else
         return Ok_Text ("complete " & Image (Count) & " tasks");
      end if;
   end Complete_Action_Label;

   function Reopen_Action_Label
     (Count : Natural := 1)
      return Humanize.Status.Text_Result
   is
   begin
      if Count = 1 then
         return Ok_Text ("reopen task");
      else
         return Ok_Text ("reopen " & Image (Count) & " tasks");
      end if;
   end Reopen_Action_Label;

   function Estimate_Label
     (Estimate_Text : String)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Estimate_Text);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid estimate");
      else
         return Ok_Text ("estimated " & Label);
      end if;
   end Estimate_Label;

   function Recurring_Task_Label
     (Schedule_Text : String)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Schedule_Text);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid task schedule");
      else
         return Ok_Text ("repeats " & Label);
      end if;
   end Recurring_Task_Label;

   function Backlog_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Count = 0 then
         return Ok_Text ("empty backlog");
      else
         return Ok_Text ("backlog: " & Count_Text (Count, "task", "tasks"));
      end if;
   end Backlog_Label;

   function Sprint_Label
     (Name  : String;
      Count : Natural)
      return Humanize.Status.Text_Result
   is
      Sprint_Name : constant String := Clean (Name);
   begin
      if Sprint_Name'Length = 0 then
         return Invalid_Text ("invalid sprint name");
      else
         return Ok_Text
           (Sprint_Name & ": " & Count_Text (Count, "task", "tasks"));
      end if;
   end Sprint_Label;

   procedure Task_State_Label_Into
     (State   : Task_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Task_State_Label (State), Target, Written, Status);
   end Task_State_Label_Into;

   procedure Task_Priority_Label_Into
     (Priority : Task_Priority;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Task_Priority_Label (Priority), Target, Written, Status);
   end Task_Priority_Label_Into;

   procedure Assignment_State_Label_Into
     (State   : Assignment_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Assignment_State_Label (State), Target, Written, Status);
   end Assignment_State_Label_Into;

   procedure Task_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Task_Count_Label (Count), Target, Written, Status);
   end Task_Count_Label_Into;

   procedure Open_Task_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Open_Task_Count_Label (Count), Target, Written, Status);
   end Open_Task_Count_Label_Into;

   procedure Completed_Task_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Completed_Task_Count_Label (Count), Target, Written, Status);
   end Completed_Task_Count_Label_Into;

   procedure Task_Label_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      State    : Task_State := Open_Task;
      Priority : Task_Priority := No_Priority)
   is
   begin
      Copy_Result (Task_Label (Name, State, Priority), Target, Written, Status);
   end Task_Label_Into;

   procedure Task_Label_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      State    : Task_State;
      Priority : Task_Priority;
      Options  : Task_Label_Options)
   is
   begin
      Copy_Result
        (Task_Label (Name, State, Priority, Options), Target, Written, Status);
   end Task_Label_Into;

   procedure Assignment_Label_Into
     (Assignee : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      State    : Assignment_State := Assigned)
   is
   begin
      Copy_Result (Assignment_Label (Assignee, State), Target, Written, Status);
   end Assignment_Label_Into;

   procedure Assignment_Label_Into
     (Assignee : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      State    : Assignment_State;
      Options  : Task_Label_Options)
   is
   begin
      Copy_Result
        (Assignment_Label (Assignee, State, Options), Target, Written, Status);
   end Assignment_Label_Into;

   procedure Due_Label_Into
     (Due_Text : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Due_Label (Due_Text), Target, Written, Status);
   end Due_Label_Into;

   procedure Overdue_Label_Into
     (Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Due_Text : String := "")
   is
   begin
      Copy_Result (Overdue_Label (Due_Text), Target, Written, Status);
   end Overdue_Label_Into;

   procedure Checklist_Label_Into
     (Done    : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Checklist_Label (Done, Total), Target, Written, Status);
   end Checklist_Label_Into;

   procedure Blocker_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Blocker_Label (Name), Target, Written, Status);
   end Blocker_Label_Into;

   procedure Subtask_Label_Into
     (Name    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Subtask_Label (Name, Count), Target, Written, Status);
   end Subtask_Label_Into;

   procedure Complete_Action_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Count   : Natural := 1)
   is
   begin
      Copy_Result (Complete_Action_Label (Count), Target, Written, Status);
   end Complete_Action_Label_Into;

   procedure Reopen_Action_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Count   : Natural := 1)
   is
   begin
      Copy_Result (Reopen_Action_Label (Count), Target, Written, Status);
   end Reopen_Action_Label_Into;

   procedure Estimate_Label_Into
     (Estimate_Text : String;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Estimate_Label (Estimate_Text), Target, Written, Status);
   end Estimate_Label_Into;

   procedure Recurring_Task_Label_Into
     (Schedule_Text : String;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Recurring_Task_Label (Schedule_Text), Target, Written, Status);
   end Recurring_Task_Label_Into;

   procedure Backlog_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Backlog_Label (Count), Target, Written, Status);
   end Backlog_Label_Into;

   procedure Sprint_Label_Into
     (Name    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Sprint_Label (Name, Count), Target, Written, Status);
   end Sprint_Label_Into;

end Humanize.Tasks;
