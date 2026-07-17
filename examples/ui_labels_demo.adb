with Ada.Strings.Unbounded;
with Ada.Text_IO;

with Humanize.Badges;
with Humanize.Comments;
with Humanize.Forms;
with Humanize.Navigation;
with Humanize.Notifications;
with Humanize.Search;
with Humanize.Status;
with Humanize.Tables;
with Humanize.Tasks;

procedure UI_Labels_Demo is
   use Ada.Strings.Unbounded;

   procedure Put_Result (Label : String; Result : Humanize.Status.Text_Result) is
   begin
      Ada.Text_IO.Put_Line (Label & " : " & To_String (Result.Text));
   end Put_Result;
begin
   Put_Result ("form", Humanize.Forms.Required_Fields_Label (1, 5));
   Put_Result
     ("navigation",
      Humanize.Navigation.Breadcrumb_Position_Label (2, 4, "Settings"));
   Put_Result
     ("badge",
      Humanize.Badges.Status_Badge_Label
        ("build", Humanize.Badges.Success_Tone));
   Put_Result
     ("notification",
      Humanize.Notifications.Inbox_Label (Unread => 1, Total => 3));
   Put_Result
     ("search",
      Humanize.Search.Search_Result_Summary_Label ("cache", 12));
   Put_Result
     ("comment",
      Humanize.Comments.Thread_Label
        ("release checklist", Humanize.Comments.Open_Thread));
   Put_Result
     ("task",
      Humanize.Tasks.Task_Label
        ("publish package", Humanize.Tasks.Open_Task));
   Put_Result ("table", Humanize.Tables.Table_Size_Label (42, 6));
end UI_Labels_Demo;
