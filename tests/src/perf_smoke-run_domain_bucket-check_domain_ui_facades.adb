with Humanize.Attachments;
with Humanize.Badges;
with Humanize.Changes;
with Humanize.Comments;
with Humanize.Events;
with Humanize.Forms;
with Humanize.Navigation;
with Humanize.Notification_Preferences;
with Humanize.Notifications;
with Humanize.Payments;
with Humanize.Tables;
with Humanize.Tasks;
with Humanize.Workflows;

separate (Perf_Smoke.Run_Domain_Bucket)
   procedure Check_Domain_UI_Facades is
      Workflow : constant Humanize.Status.Text_Result :=
        Humanize.Workflows.Step_Status_Label
          ("deploy", Humanize.Workflows.Active_Step);
      Change : constant Humanize.Status.Text_Result :=
        Humanize.Changes.Change_Set_Label
          (Added => 2, Removed => 1, Modified => 3);
      Table : constant Humanize.Status.Text_Result :=
        Humanize.Tables.Table_Size_Label (Rows => 12, Columns => 4);
      Form : constant Humanize.Status.Text_Result :=
        Humanize.Forms.Field_State_Label
          ("email", Humanize.Forms.Invalid_Input);
      Navigation : constant Humanize.Status.Text_Result :=
        Humanize.Navigation.Navigation_Item_Label
          ("settings", State => Humanize.Navigation.Current_Item);
      Badge : constant Humanize.Status.Text_Result :=
        Humanize.Badges.Status_Badge_Label
          ("sync", Humanize.Badges.Info_Tone);
      Notification : constant Humanize.Status.Text_Result :=
        Humanize.Notifications.Notification_Label
          ("deploy", Humanize.Notifications.System_Event,
           Humanize.Notifications.Unread_State);
      Comment : constant Humanize.Status.Text_Result :=
        Humanize.Comments.Comment_Label
          ("Ada", Humanize.Comments.Published_Comment);
      Task_Text : constant Humanize.Status.Text_Result :=
        Humanize.Tasks.Task_Label
          ("review", Humanize.Tasks.In_Progress_Task,
           Humanize.Tasks.High_Priority);
      Attachment : constant Humanize.Status.Text_Result :=
        Humanize.Attachments.Attachment_Label
          ("report.pdf", State => Humanize.Attachments.Uploaded_Attachment);
      Event : constant Humanize.Status.Text_Result :=
        Humanize.Events.Event_Label
          ("planning", Humanize.Events.Scheduled_Event);
      Payment : constant Humanize.Status.Text_Result :=
        Humanize.Payments.Payment_Label
          ("invoice 42", Humanize.Payments.Paid_Payment);
      Notification_Preference : constant Humanize.Status.Text_Result :=
        Humanize.Notification_Preferences.Channel_Preference_Label
          ("email", Humanize.Notification_Preferences.Preference_Enabled);
   begin
      Check_Status (Workflow.Status, "workflow step status label");
      Check_Status (Change.Status, "change set label");
      Check_Status (Table.Status, "table size label");
      Check_Status (Form.Status, "form field state label");
      Check_Status (Navigation.Status, "navigation item label");
      Check_Status (Badge.Status, "badge status label");
      Check_Status (Notification.Status, "notification label");
      Check_Status (Comment.Status, "comment label");
      Check_Status (Task_Text.Status, "task label");
      Check_Status (Attachment.Status, "attachment label");
      Check_Status (Event.Status, "event label");
      Check_Status (Payment.Status, "payment label");
      Check_Status
        (Notification_Preference.Status, "notification preference label");
   end Check_Domain_UI_Facades;
