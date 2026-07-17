with AUnit.Assertions;

with Humanize.Comments;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Comments is
   use Humanize.Comments;
   use Humanize.Status;

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

   procedure Test_State_And_Count_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Check
        (Comment_State_Label (Draft_Comment),
         "draft comment",
         "draft comment state");
      Check
        (Comment_State_Label (Resolved_Comment),
         "resolved comment",
         "resolved comment state");
      Check
        (Thread_State_Label (Locked_Thread),
         "locked thread",
         "locked thread state");
      Check
        (Reaction_Kind_Label (Heart_Reaction),
         "heart reaction",
         "heart reaction kind");
      Check (Comment_Count_Label (0), "no comments", "no comments");
      Check (Comment_Count_Label (1), "1 comment", "one comment");
      Check (Comment_Count_Label (4), "4 comments", "many comments");
      Check (Reply_Count_Label (0), "no replies", "no replies");
      Check (Reply_Count_Label (2), "2 replies", "reply count");
      Check (Thread_Count_Label (3), "3 threads", "thread count");
   end Test_State_And_Count_Labels;

   procedure Test_Comment_Thread_And_Action_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check
        (Comment_Label ("Ada", Published_Comment),
         "Ada published comment",
         "comment label");
      Check
        (Comment_Label (" Ada ", Edited_Comment),
         "Ada edited comment",
         "trimmed comment label");
      Check
        (Thread_Label ("Release", Open_Thread),
         "Release open thread",
         "thread label");
      Check
        (Thread_Label ("Release", Resolved_Thread, 3),
         "Release resolved thread, 3 comments",
         "thread label with count");
      Check
        (Author_Action_Label ("Ada", Published_Comment),
         "Ada commented",
         "comment author action");
      Check
        (Author_Action_Label ("Ada", Pinned_Comment),
         "Ada pinned a comment",
         "pinned author action");

      Invalid := Comment_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid comment author",
         "empty comment author rejected");
      Invalid := Thread_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid thread name",
         "empty thread rejected");
      Invalid := Author_Action_Label (" ", Edited_Comment);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid comment author",
         "empty action author rejected");
   end Test_Comment_Thread_And_Action_Labels;

   procedure Test_Status_Reaction_And_Mention_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check (Edited_Label, "edited", "edited");
      Check (Edited_Label ("2 minutes ago"), "edited 2 minutes ago", "edited time");
      Check (Deleted_Label, "comment deleted", "deleted");
      Check
        (Deleted_Label ("Ada"),
         "Ada deleted a comment",
         "deleted by author");
      Check (Resolved_Label, "resolved", "resolved");
      Check (Resolved_Label ("Release"), "Release resolved", "named resolved");
      Check (Reaction_Label (Like_Reaction, 0), "no likes", "no likes");
      Check (Reaction_Label (Like_Reaction, 1), "1 like", "one like");
      Check (Reaction_Label (Heart_Reaction, 3), "3 hearts", "heart count");
      Check
        (Participant_Count_Label (0),
         "no participants",
         "no participants");
      Check
        (Participant_Count_Label (2),
         "2 participants",
         "participant count");
      Check (Mention_Label ("Ada", "Bob"), "Ada mentioned Bob", "mention");

      Invalid := Mention_Label (" ", "Bob");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid mention actor",
         "empty mention actor rejected");
      Invalid := Mention_Label ("Ada", " ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid mention target",
         "empty mention target rejected");
   end Test_Status_Reaction_And_Mention_Labels;

   procedure Test_Subscription_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Check
        (Subscribe_Label,
         "subscribe to discussion",
         "subscribe generic");
      Check
        (Subscribe_Label ("Release"),
         "subscribe to Release",
         "subscribe named");
      Check
        (Unsubscribe_Label,
         "unsubscribe from discussion",
         "unsubscribe generic");
      Check
        (Unsubscribe_Label ("Release"),
         "unsubscribe from Release",
         "unsubscribe named");
      Check (Pin_Label, "pin comment", "pin generic");
      Check (Pin_Label ("Release"), "pin Release", "pin named");
      Check (Unpin_Label, "unpin comment", "unpin generic");
      Check (Unpin_Label ("Release"), "unpin Release", "unpin named");
      Check (Lock_Thread_Label, "lock thread", "lock thread generic");
      Check
        (Lock_Thread_Label ("Release"),
         "lock Release thread",
         "lock thread named");
      Check (Hide_Comment_Label, "hide comment", "hide generic");
      Check
        (Hide_Comment_Label ("off topic"),
         "hide comment: off topic",
         "hide reason");
   end Test_Subscription_Labels;

   procedure Test_Bounded_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Exact  : String (1 .. 35);
      Tiny   : String (1 .. 10);
      Offset : String (2 .. 12);
      Written : Natural;
      Code : Status_Code;
   begin
      Thread_Label_Into
        ("Release", Exact, Written, Code, Resolved_Thread, 3);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 35
         and then Exact = "Release resolved thread, 3 comments",
         "thread bounded exact text");

      Deleted_Label_Into (Tiny, Written, Code, "Ada");
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 10
         and then Tiny = "Ada delete",
         "deleted bounded overflow prefix");

      Comment_State_Label_Into (Edited_Comment, Offset, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "comment bounded rejects non-1-based buffers");

      Comment_Label_Into (" ", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "comment bounded returns validation status");

      Mention_Label_Into ("Ada", "Bob", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 17
         and then Exact (1 .. Written) = "Ada mentioned Bob",
         "mention bounded exact text");

      Unsubscribe_Label_Into (Exact, Written, Code, "Release");
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 24
         and then Exact (1 .. Written) = "unsubscribe from Release",
         "unsubscribe bounded exact text");

      Hide_Comment_Label_Into (Exact, Written, Code, "off topic");
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 23
         and then Exact (1 .. Written) = "hide comment: off topic",
         "hide comment bounded exact text");
   end Test_Bounded_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize comment/discussion tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_State_And_Count_Labels'Access,
        "state and count labels");
      Register_Routine (T, Test_Comment_Thread_And_Action_Labels'Access,
        "comment thread and action labels");
      Register_Routine (T, Test_Status_Reaction_And_Mention_Labels'Access,
        "status reaction and mention labels");
      Register_Routine (T, Test_Subscription_Labels'Access,
        "subscription labels");
      Register_Routine (T, Test_Bounded_Labels'Access,
        "bounded labels");
   end Register_Tests;

end Humanize.Tests.Comments;
