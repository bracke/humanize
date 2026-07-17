with AUnit.Assertions;

with Humanize.Status;
with Humanize.Tasks;
with Humanize.Tests.Support;

package body Humanize.Tests.Tasks is
   use Humanize.Status;
   use Humanize.Tasks;

   procedure Check
     (Result   : Text_Result;
      Expected : String;
      Message  : String)
   is
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Test_State_Priority_And_Count_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Check (Task_State_Label (Open_Task), "open task", "open task state");
      Check
        (Task_State_Label (In_Progress_Task),
         "in progress task",
         "in-progress task state");
      Check
        (Task_Priority_Label (Critical_Priority),
         "critical priority",
         "critical priority");
      Check
        (Assignment_State_Label (Unassigned),
         "unassigned",
         "unassigned state");
      Check (Task_Count_Label (0), "no tasks", "no tasks");
      Check (Task_Count_Label (2), "2 tasks", "task count");
      Check (Open_Task_Count_Label (0), "no open tasks", "no open tasks");
      Check (Open_Task_Count_Label (3), "3 open tasks", "open task count");
      Check
        (Completed_Task_Count_Label (1),
         "1 completed task",
         "completed task count");
   end Test_State_Priority_And_Count_Labels;

   procedure Test_Task_Assignment_And_Due_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check (Task_Label ("Ship"), "Ship open task", "task label");
      Check
        (Task_Label ("Ship", Blocked_Task, High_Priority),
         "Ship blocked task, high priority",
         "priority task label");
      Check (Assignment_Label ("Ada"), "Ada assigned", "assignment");
      Check
        (Assignment_Label ("Ada", Owned),
         "Ada owns task",
         "owned assignment");
      Check (Assignment_Label ("", Unassigned), "unassigned", "unassigned");
      Check (Due_Label ("tomorrow"), "due tomorrow", "due label");
      Check (Overdue_Label, "overdue", "overdue");
      Check
        (Overdue_Label ("yesterday"),
         "overdue since yesterday",
         "overdue with due text");

      Invalid := Task_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid task name",
         "empty task rejected");
      Invalid := Assignment_Label (" ", Assigned);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid assignee",
         "empty assignee rejected");
      Invalid := Due_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid due label",
         "empty due rejected");
   end Test_Task_Assignment_And_Due_Labels;

   procedure Test_Checklist_Blocker_And_Action_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check (Checklist_Label (0, 0), "no checklist items", "no checklist");
      Check
        (Checklist_Label (2, 5),
         "2 of 5 items complete",
         "checklist progress");
      Check (Blocker_Label ("review"), "blocked by review", "blocker");
      Check (Subtask_Label ("Ship", 3), "Ship: 3 subtasks", "subtasks");
      Check (Complete_Action_Label, "complete task", "complete one");
      Check
        (Complete_Action_Label (3),
         "complete 3 tasks",
         "complete many");
      Check (Reopen_Action_Label, "reopen task", "reopen one");
      Check (Reopen_Action_Label (2), "reopen 2 tasks", "reopen many");
      Check (Estimate_Label ("2 hours"), "estimated 2 hours", "estimate");
      Check
        (Recurring_Task_Label ("every Friday"),
         "repeats every Friday",
         "recurring task");
      Check (Backlog_Label (0), "empty backlog", "empty backlog");
      Check (Backlog_Label (5), "backlog: 5 tasks", "backlog");
      Check (Sprint_Label ("Sprint 1", 8), "Sprint 1: 8 tasks", "sprint");

      Invalid := Checklist_Label (6, 5);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid checklist progress",
         "invalid checklist rejected");
      Invalid := Blocker_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid blocker",
         "empty blocker rejected");
      Invalid := Subtask_Label (" ", 1);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid task name",
         "empty subtask parent rejected");
      Invalid := Estimate_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid estimate",
         "empty estimate rejected");
      Invalid := Recurring_Task_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid task schedule",
         "empty task schedule rejected");
      Invalid := Sprint_Label (" ", 1);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid sprint name",
         "empty sprint rejected");
   end Test_Checklist_Blocker_And_Action_Labels;

   procedure Test_Bounded_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Exact  : String (1 .. 32);
      Tiny   : String (1 .. 10);
      Offset : String (2 .. 12);
      Written : Natural;
      Code : Status_Code;
   begin
      Task_Label_Into
        ("Ship", Exact, Written, Code, Blocked_Task, High_Priority);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 32
         and then Exact = "Ship blocked task, high priority",
         "task bounded exact text");

      Checklist_Label_Into (2, 5, Tiny, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 10
         and then Tiny = "2 of 5 ite",
         "checklist bounded overflow prefix");

      Task_State_Label_Into (Open_Task, Offset, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "task bounded rejects non-1-based buffers");

      Task_Label_Into (" ", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "task bounded returns validation status");

      Due_Label_Into ("tomorrow", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 12
         and then Exact (1 .. Written) = "due tomorrow",
         "due bounded exact text");

      Complete_Action_Label_Into (Exact, Written, Code, 3);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 16
         and then Exact (1 .. Written) = "complete 3 tasks",
         "complete action bounded exact text");

      Sprint_Label_Into ("Sprint 1", 8, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 17
         and then Exact (1 .. Written) = "Sprint 1: 8 tasks",
         "sprint bounded exact text");
   end Test_Bounded_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize task/todo tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_State_Priority_And_Count_Labels'Access,
        "state priority and count labels");
      Register_Routine (T, Test_Task_Assignment_And_Due_Labels'Access,
        "task assignment and due labels");
      Register_Routine (T, Test_Checklist_Blocker_And_Action_Labels'Access,
        "checklist blocker and action labels");
      Register_Routine (T, Test_Bounded_Labels'Access,
        "bounded labels");
   end Register_Tests;

end Humanize.Tests.Tasks;
