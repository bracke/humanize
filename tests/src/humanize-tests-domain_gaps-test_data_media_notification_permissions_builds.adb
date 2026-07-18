separate (Humanize.Tests.Domain_Gaps)
   procedure Test_Data_Media_Notification_Permissions_Builds
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      use type Humanize.Domain_Details.Domain_Severity;
      Data_Detailed : constant Text_Result :=
        Humanize.Data_Quality.Import_Result_Label
          ("customers.csv", Humanize.Data_Quality.Import_Partial, 98, 2,
           (Mode             => Humanize.Data_Quality.Data_Quality_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Data :
        constant Humanize.Data_Quality.Data_Quality_Label_Parse_Result :=
          Humanize.Data_Quality.Parse_Import_Result_Label
            ("customers.csv partial import: 98 accepted, 2 rejected",
             Humanize.Data_Quality.Import_Partial, 98, 2);
      Media_Detailed : constant Text_Result :=
        Humanize.Media.Media_Summary
          ("manual.pdf", Humanize.Media.PDF_Document,
           Humanize.Media.Metadata_Missing,
           (Mode             => Humanize.Media.Media_Accessible,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Media : constant Humanize.Media.Media_Label_Parse_Result :=
        Humanize.Media.Parse_Media_Summary
          ("manual.pdf PDF document metadata missing",
           Humanize.Media.PDF_Document, Humanize.Media.Metadata_Missing);
      Permission_Detailed : constant Text_Result :=
        Humanize.Permissions.Permission_Label
          ("Ada", "deploy", Humanize.Permissions.Requires_Approval,
           (Mode             => Humanize.Permissions.Permission_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Permission :
        constant Humanize.Permissions.Permission_Label_Parse_Result :=
          Humanize.Permissions.Parse_Permission_Label
            ("Ada deploy requires approval",
             Humanize.Permissions.Requires_Approval);
      Build_Detailed : constant Text_Result :=
        Humanize.Builds.Build_Label
          ("release", Humanize.Builds.Build_Failed,
           (Mode             => Humanize.Builds.Build_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Build : constant Humanize.Builds.Build_Label_Parse_Result :=
        Humanize.Builds.Parse_Build_Label
          ("release build failed", Humanize.Builds.Build_Failed);
      Notification_Detailed : constant Text_Result :=
        Humanize.Notification_Preferences.Channel_Preference_Label
          ("email", Humanize.Notification_Preferences.Preference_Required,
           (Mode => Humanize.Notification_Preferences
              .Notification_Preference_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Notification : constant
        Humanize.Notification_Preferences
          .Notification_Preference_Label_Parse_Result :=
            Humanize.Notification_Preferences.Parse_Channel_Preference_Label
              ("email notifications required",
               Humanize.Notification_Preferences.Preference_Required);
      Inbox_Notification_Detailed : constant Text_Result :=
        Humanize.Notifications.Notification_Label
          ("Ada", Humanize.Notifications.Alert_Event,
           Humanize.Notifications.Unread_State,
           (Mode             => Humanize.Notifications.Notification_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Inbox_Notification : constant
        Humanize.Notifications.Notification_Label_Parse_Result :=
          Humanize.Notifications.Parse_Notification_Label
            ("Ada alert unread", Humanize.Notifications.Alert_Event,
             Humanize.Notifications.Unread_State);
      Delivery_Detailed : constant Text_Result :=
        Humanize.Notifications.Delivery_Label
          (Humanize.Notifications.Email_Channel,
           Humanize.Notifications.Failed_Delivery,
           (Mode             => Humanize.Notifications.Notification_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Delivery : constant
        Humanize.Notifications.Notification_Label_Parse_Result :=
          Humanize.Notifications.Parse_Delivery_Label
            ("email notification failed", Humanize.Notifications.Email_Channel,
             Humanize.Notifications.Failed_Delivery);
      Task_Detailed : constant Text_Result :=
        Humanize.Tasks.Task_Label
          ("ship release", Humanize.Tasks.Blocked_Task,
           Humanize.Tasks.Critical_Priority,
           (Mode             => Humanize.Tasks.Task_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Task : constant Humanize.Tasks.Task_Label_Parse_Result :=
        Humanize.Tasks.Parse_Task_Label
          ("ship release blocked task, critical priority",
           Humanize.Tasks.Blocked_Task,
           Humanize.Tasks.Critical_Priority);
      Payment_Detailed : constant Text_Result :=
        Humanize.Payments.Payment_Label
          ("$42.00", Humanize.Payments.Failed_Payment,
           (Mode             => Humanize.Payments.Payment_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Payment : constant Humanize.Payments.Payment_Label_Parse_Result :=
        Humanize.Payments.Parse_Payment_Label
          ("$42.00 failed payment", Humanize.Payments.Failed_Payment);
      Invoice_Detailed : constant Text_Result :=
        Humanize.Payments.Invoice_Label
          ("INV-42", Humanize.Payments.Overdue_Invoice,
           (Mode             => Humanize.Payments.Payment_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Invoice : constant Humanize.Payments.Payment_Label_Parse_Result :=
        Humanize.Payments.Parse_Invoice_Label
          ("invoice INV-42 overdue", Humanize.Payments.Overdue_Invoice);
      Attachment_Detailed : constant Text_Result :=
        Humanize.Attachments.Attachment_Label
          ("contract.pdf", Humanize.Attachments.Document_Attachment,
           Humanize.Attachments.Failed_Attachment,
           (Mode             => Humanize.Attachments.Attachment_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Attachment : constant
        Humanize.Attachments.Attachment_Label_Parse_Result :=
          Humanize.Attachments.Parse_Attachment_Label
            ("contract.pdf document failed",
             Humanize.Attachments.Document_Attachment,
             Humanize.Attachments.Failed_Attachment);
      Attachment_Scan_Detailed : constant Text_Result :=
        Humanize.Attachments.Scan_Result_Label
          ("contract.pdf", Humanize.Attachments.Infected,
           (Mode             => Humanize.Attachments.Attachment_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Attachment_Scan : constant
        Humanize.Attachments.Attachment_Label_Parse_Result :=
          Humanize.Attachments.Parse_Scan_Result_Label
            ("contract.pdf scan infected", Humanize.Attachments.Infected);
      Event_Detailed : constant Text_Result :=
        Humanize.Events.Event_Label
          ("launch", Humanize.Events.Canceled_Event,
           (Mode             => Humanize.Events.Event_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Event : constant Humanize.Events.Event_Label_Parse_Result :=
        Humanize.Events.Parse_Event_Label
          ("launch canceled event", Humanize.Events.Canceled_Event);
      RSVP_Detailed : constant Text_Result :=
        Humanize.Events.RSVP_Label
          (Humanize.Events.Declined,
           (Mode             => Humanize.Events.Event_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_RSVP : constant Humanize.Events.Event_Label_Parse_Result :=
        Humanize.Events.Parse_RSVP_Label
          ("RSVP declined", Humanize.Events.Declined);
      Badge_Detailed : constant Text_Result :=
        Humanize.Badges.Badge_Label
          ("beta", Humanize.Badges.Warning_Tone,
           Humanize.Badges.Deprecated_Badge,
           (Mode             => Humanize.Badges.Badge_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Badge : constant Humanize.Badges.Badge_Label_Parse_Result :=
        Humanize.Badges.Parse_Badge_Label
          ("beta warning deprecated badge", Humanize.Badges.Warning_Tone,
           Humanize.Badges.Deprecated_Badge);
      Comment_Detailed : constant Text_Result :=
        Humanize.Comments.Comment_Label
          ("Ada", Humanize.Comments.Hidden_Comment,
           (Mode             => Humanize.Comments.Comment_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Comment : constant Humanize.Comments.Comment_Label_Parse_Result :=
        Humanize.Comments.Parse_Comment_Label
          ("Ada hidden comment", Humanize.Comments.Hidden_Comment);
      Thread_Detailed : constant Text_Result :=
        Humanize.Comments.Thread_Label
          ("release", Humanize.Comments.Locked_Thread, 2,
           (Mode             => Humanize.Comments.Comment_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Thread : constant Humanize.Comments.Comment_Label_Parse_Result :=
        Humanize.Comments.Parse_Thread_Label
          ("release locked thread, 2 comments",
           Humanize.Comments.Locked_Thread, 2);
      Field_Detailed : constant Text_Result :=
        Humanize.Forms.Field_State_Label
          ("email", Humanize.Forms.Invalid_Input,
           (Mode             => Humanize.Forms.Form_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Field : constant Humanize.Forms.Form_Label_Parse_Result :=
        Humanize.Forms.Parse_Field_State_Label
          ("email invalid", Humanize.Forms.Invalid_Input);
      Nav_Detailed : constant Text_Result :=
        Humanize.Navigation.Navigation_Item_Label
          ("settings", Humanize.Navigation.Tab_Item,
           Humanize.Navigation.Disabled_Item,
           (Mode             => Humanize.Navigation.Navigation_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Nav : constant Humanize.Navigation.Navigation_Label_Parse_Result :=
        Humanize.Navigation.Parse_Navigation_Item_Label
          ("settings tab disabled", Humanize.Navigation.Tab_Item,
           Humanize.Navigation.Disabled_Item);
      Search_Detailed : constant Text_Result :=
        Humanize.Search.Filter_Label
          ("status", "open", Humanize.Search.Excluded_Filter,
           (Mode             => Humanize.Search.Search_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Search : constant Humanize.Search.Search_Label_Parse_Result :=
        Humanize.Search.Parse_Filter_Label
          ("status: open excluded filter", Humanize.Search.Excluded_Filter);
   begin
      Check
        (Humanize.Data_Quality.Issue_Count_Label
           (Humanize.Data_Quality.Duplicate_Record, 2),
         "2 duplicate records", "data issue count");
      Check
        (Humanize.Data_Quality.Row_Issue_Label
           (12, Humanize.Data_Quality.Skipped_Record),
         "row 12 skipped record", "row issue");
      Check
        (Humanize.Data_Quality.Import_Result_Label
           ("customers.csv", Humanize.Data_Quality.Import_Partial, 98, 2),
         "customers.csv partial import: 98 accepted, 2 rejected",
         "import result");
      Check
        (Data_Detailed,
         "[data-quality warning] customers.csv partial import: 98 accepted, 2 rejected",
         "data quality option metadata");
      AUnit.Assertions.Assert
        (Parsed_Data.Status = Ok
         and then Parsed_Data.Metadata.Severity =
           Humanize.Domain_Details.Warning_Severity
         and then Parsed_Data.Name_Length = 13,
         "parse import result");

      Check
        (Humanize.Media.Media_Summary
           ("trailer.mp4", Humanize.Media.Video_Media,
            Humanize.Media.Transcoding_Media),
         "trailer.mp4 video transcoding", "media summary");
      Check
        (Media_Detailed,
         "[media danger] manual.pdf P D F document metadata missing",
         "media option metadata");
      AUnit.Assertions.Assert
        (Parsed_Media.Status = Ok
         and then Parsed_Media.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Media.Name_Length = 10,
         "parse media summary");
      Check (Humanize.Media.Resolution_Label (1920, 1080), "1920x1080", "resolution");
      Check (Humanize.Media.Page_Count_Label (12), "12 pages", "page count");

      Check
        (Humanize.Notification_Preferences.Channel_Preference_Label
           ("email", Humanize.Notification_Preferences.Preference_Enabled),
         "email notifications enabled", "channel preference");
      Check
        (Humanize.Notification_Preferences.Quiet_Hours_Label ("22:00-07:00"),
         "quiet hours 22:00-07:00", "quiet hours");
      Check
        (Humanize.Notification_Preferences.Alert_Level_Label
           (Humanize.Notification_Preferences.Critical_Alerts_Only),
         "critical alerts only", "alert level");
      Check
        (Notification_Detailed,
         "[notification-preferences warning] email notifications required",
         "notification preference option metadata");
      AUnit.Assertions.Assert
        (Parsed_Notification.Status = Ok
         and then Parsed_Notification.Metadata.Severity =
           Humanize.Domain_Details.Warning_Severity
         and then Parsed_Notification.Name_Length = 5,
         "parse channel preference");

      Check
        (Inbox_Notification_Detailed,
         "[notifications info] Ada alert unread",
         "notification option metadata");
      AUnit.Assertions.Assert
        (Parsed_Inbox_Notification.Status = Ok
         and then Parsed_Inbox_Notification.Name_Length = 3,
         "parse notification label");
      Check
        (Delivery_Detailed,
         "[notifications danger] email notification failed",
         "delivery option metadata");
      AUnit.Assertions.Assert
        (Parsed_Delivery.Status = Ok
         and then Parsed_Delivery.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Delivery.Name_Length = 18,
         "parse delivery label");

      Check
        (Task_Detailed,
         "[tasks danger] ship release blocked task, critical priority",
         "task option metadata");
      AUnit.Assertions.Assert
        (Parsed_Task.Status = Ok
         and then Parsed_Task.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Task.Name_Length = 12,
         "parse task label");

      Check
        (Payment_Detailed,
         "[payments danger] $42.00 failed payment",
         "payment option metadata");
      AUnit.Assertions.Assert
        (Parsed_Payment.Status = Ok
         and then Parsed_Payment.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Payment.Name_Length = 6,
         "parse payment label");
      Check
        (Invoice_Detailed,
         "[payments danger] invoice INV-42 overdue",
         "invoice option metadata");
      AUnit.Assertions.Assert
        (Parsed_Invoice.Status = Ok
         and then Parsed_Invoice.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Invoice.Name_Length = 14,
         "parse invoice label");

      Check
        (Attachment_Detailed,
         "[attachments danger] contract.pdf document failed",
         "attachment option metadata");
      AUnit.Assertions.Assert
        (Parsed_Attachment.Status = Ok
         and then Parsed_Attachment.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Attachment.Name_Length = 12,
         "parse attachment label");
      Check
        (Attachment_Scan_Detailed,
         "[attachments danger] contract.pdf scan infected",
         "attachment scan option metadata");
      AUnit.Assertions.Assert
        (Parsed_Attachment_Scan.Status = Ok
         and then Parsed_Attachment_Scan.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Attachment_Scan.Name_Length = 12,
         "parse attachment scan label");

      Check
        (Event_Detailed,
         "[events info] launch canceled event",
         "event option metadata");
      AUnit.Assertions.Assert
        (Parsed_Event.Status = Ok
         and then Parsed_Event.Name_Length = 6,
         "parse event label");
      Check
        (RSVP_Detailed,
         "[events info] RSVP declined",
         "RSVP option metadata");
      AUnit.Assertions.Assert
        (Parsed_RSVP.Status = Ok
         and then Parsed_RSVP.Name_Length = 4,
         "parse RSVP label");

      Check
        (Badge_Detailed,
         "[badges warning] beta warning deprecated badge",
         "badge option metadata");
      AUnit.Assertions.Assert
        (Parsed_Badge.Status = Ok
         and then Parsed_Badge.Metadata.Severity =
           Humanize.Domain_Details.Warning_Severity
         and then Parsed_Badge.Name_Length = 4,
         "parse badge label");
      Check
        (Comment_Detailed,
         "[comments info] Ada hidden comment",
         "comment option metadata");
      AUnit.Assertions.Assert
        (Parsed_Comment.Status = Ok
         and then Parsed_Comment.Name_Length = 3,
         "parse comment label");
      Check
        (Thread_Detailed,
         "[comments danger] release locked thread, 2 comments",
         "thread option metadata");
      AUnit.Assertions.Assert
        (Parsed_Thread.Status = Ok
         and then Parsed_Thread.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Thread.Name_Length = 7,
         "parse thread label");
      Check
        (Field_Detailed,
         "[forms danger] email invalid",
         "field option metadata");
      AUnit.Assertions.Assert
        (Parsed_Field.Status = Ok
         and then Parsed_Field.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Field.Name_Length = 5,
         "parse field label");
      Check
        (Nav_Detailed,
         "[navigation info] settings tab disabled",
         "navigation option metadata");
      AUnit.Assertions.Assert
        (Parsed_Nav.Status = Ok
         and then Parsed_Nav.Name_Length = 8,
         "parse navigation label");
      Check
        (Search_Detailed,
         "[search info] status: open excluded filter",
         "search option metadata");
      AUnit.Assertions.Assert
        (Parsed_Search.Status = Ok
         and then Parsed_Search.Name_Length = 12,
         "parse search filter label");

      Check
        (Humanize.Permissions.Permission_Label
           ("Ada", "deploy", Humanize.Permissions.Requires_Approval),
         "Ada deploy requires approval", "permission label");
      Check
        (Humanize.Permissions.Access_Expiry_Label ("Ada", "tomorrow"),
         "Ada access expires tomorrow", "access expiry");
      Check
        (Humanize.Permissions.Grant_Label
           ("Ada", Humanize.Permissions.Owner_Role),
         "Ada granted owner", "grant label");
      Check
        (Permission_Detailed,
         "[permissions warning] Ada deploy requires approval",
         "permission option metadata");
      AUnit.Assertions.Assert
        (Parsed_Permission.Status = Ok
         and then Parsed_Permission.Metadata.Severity =
           Humanize.Domain_Details.Warning_Severity
         and then Parsed_Permission.Name_Length = 10,
         "parse permission label");

      Check
        (Humanize.Builds.Test_Count_Label
           (2, Humanize.Builds.Flaky_Test),
         "2 tests flaky", "flaky tests");
      Check (Humanize.Builds.Coverage_Label ("81%"), "coverage 81%", "coverage");
      Check
        (Humanize.Builds.Benchmark_Label ("parser", "regressed by 12%"),
         "parser benchmark regressed by 12%", "benchmark");
      Check
        (Humanize.Builds.Gate_State_Label (Humanize.Builds.Gate_Failed),
         "release gate failed", "gate state");
      Check
        (Build_Detailed,
         "[builds danger] release build failed",
         "build option metadata");
      AUnit.Assertions.Assert
        (Parsed_Build.Status = Ok
         and then Parsed_Build.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Build.Name_Length = 7,
         "parse build label");
   end Test_Data_Media_Notification_Permissions_Builds;
