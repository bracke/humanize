with Humanize.Events;
with Humanize.Forms;
with Humanize.Markup;
with Humanize.Media;
with Humanize.Moderation;
with Humanize.Events.Localized;
with Humanize.Forms.Localized;
with Humanize.Markup.Localized;
with Humanize.Media.Localized;
with Humanize.Moderation.Localized;

separate (Humanize.Tests.Domain_Labels)
procedure Check_Group_3 (Locale : String; C : Humanize.Contexts.Context) is
begin
   Check (Locale, "label.events.all_day_label",
          Humanize.Events.Localized.All_Day_Label (C, Name => "plain"),
          Humanize.Events.All_Day_Label (Name => "plain"));
   Check (Locale, "label.events.attendance_state_label",
          Humanize.Events.Localized.Attendance_State_Label (C, State => Humanize.Events.Not_Responded),
          Humanize.Events.Attendance_State_Label (State => Humanize.Events.Not_Responded));
   Check (Locale, "label.events.attendance_state_label",
          Humanize.Events.Localized.Attendance_State_Label (C, State => Humanize.Events.Waitlisted),
          Humanize.Events.Attendance_State_Label (State => Humanize.Events.Waitlisted));
   Check (Locale, "label.events.attendee_count_label",
          Humanize.Events.Localized.Attendee_Count_Label (C, Count => 3),
          Humanize.Events.Attendee_Count_Label (Count => 3));
   Check (Locale, "label.events.attendee_count_label",
          Humanize.Events.Localized.Attendee_Count_Label (C, Count => 1),
          Humanize.Events.Attendee_Count_Label (Count => 1));
   Check (Locale, "label.events.canceled_label",
          Humanize.Events.Localized.Canceled_Label (C, Name => "plain"),
          Humanize.Events.Canceled_Label (Name => "plain"));
   Check (Locale, "label.events.check_in_label",
          Humanize.Events.Localized.Check_In_Label (C, Name => "plain"),
          Humanize.Events.Check_In_Label (Name => "plain"));
   Check (Locale, "label.events.conference_link_label",
          Humanize.Events.Localized.Conference_Link_Label (C, Name => "plain"),
          Humanize.Events.Conference_Link_Label (Name => "plain"));
   Check (Locale, "label.events.event_count_label",
          Humanize.Events.Localized.Event_Count_Label (C, Count => 3),
          Humanize.Events.Event_Count_Label (Count => 3));
   Check (Locale, "label.events.event_count_label",
          Humanize.Events.Localized.Event_Count_Label (C, Count => 1),
          Humanize.Events.Event_Count_Label (Count => 1));
   Check (Locale, "label.events.event_label",
          Humanize.Events.Localized.Event_Label (C, Name => "plain", State => Humanize.Events.Scheduled_Event),
          Humanize.Events.Event_Label (Name => "plain", State => Humanize.Events.Scheduled_Event));
   Check (Locale, "label.events.event_label",
          Humanize.Events.Localized.Event_Label (C, Name => "plain", State => Humanize.Events.Postponed_Event),
          Humanize.Events.Event_Label (Name => "plain", State => Humanize.Events.Postponed_Event));
   Check (Locale, "label.events.event_location_label",
          Humanize.Events.Localized.Event_Location_Label (C, Name => "plain", Location => "plain"),
          Humanize.Events.Event_Location_Label (Name => "plain", Location => "plain"));
   Check (Locale, "label.events.event_state_label",
          Humanize.Events.Localized.Event_State_Label (C, State => Humanize.Events.Scheduled_Event),
          Humanize.Events.Event_State_Label (State => Humanize.Events.Scheduled_Event));
   Check (Locale, "label.events.event_state_label",
          Humanize.Events.Localized.Event_State_Label (C, State => Humanize.Events.Postponed_Event),
          Humanize.Events.Event_State_Label (State => Humanize.Events.Postponed_Event));
   Check (Locale, "label.events.event_time_label",
          Humanize.Events.Localized.Event_Time_Label (C, Name => "plain", Time_Text => "plain"),
          Humanize.Events.Event_Time_Label (Name => "plain", Time_Text => "plain"));
   Check (Locale, "label.events.event_visibility_label",
          Humanize.Events.Localized.Event_Visibility_Label (C, Visibility => Humanize.Events.Public_Event),
          Humanize.Events.Event_Visibility_Label (Visibility => Humanize.Events.Public_Event));
   Check (Locale, "label.events.event_visibility_label",
          Humanize.Events.Localized.Event_Visibility_Label (C, Visibility => Humanize.Events.Free_Event),
          Humanize.Events.Event_Visibility_Label (Visibility => Humanize.Events.Free_Event));
   Check (Locale, "label.events.organizer_label",
          Humanize.Events.Localized.Organizer_Label (C, Name => "plain"),
          Humanize.Events.Organizer_Label (Name => "plain"));
   Check (Locale, "label.events.rsvp_label",
          Humanize.Events.Localized.RSVP_Label (C, State => Humanize.Events.Not_Responded),
          Humanize.Events.RSVP_Label (State => Humanize.Events.Not_Responded));
   Check (Locale, "label.events.rsvp_label",
          Humanize.Events.Localized.RSVP_Label (C, State => Humanize.Events.Waitlisted),
          Humanize.Events.RSVP_Label (State => Humanize.Events.Waitlisted));
   Check (Locale, "label.events.reminder_label",
          Humanize.Events.Localized.Reminder_Label (C, Time_Text => "plain"),
          Humanize.Events.Reminder_Label (Time_Text => "plain"));
   Check (Locale, "label.events.rescheduled_label",
          Humanize.Events.Localized.Rescheduled_Label (C, Name => "plain", Time_Text => "plain"),
          Humanize.Events.Rescheduled_Label (Name => "plain", Time_Text => "plain"));
   Check (Locale, "label.forms.character_count_label",
          Humanize.Forms.Localized.Character_Count_Label (C, Used => 3),
          Humanize.Forms.Character_Count_Label (Used => 3));
   Check (Locale, "label.forms.character_count_label",
          Humanize.Forms.Localized.Character_Count_Label (C, Used => 1),
          Humanize.Forms.Character_Count_Label (Used => 1));
   Check (Locale, "label.forms.character_limit_label",
          Humanize.Forms.Localized.Character_Limit_Label (C, Limit => 3),
          Humanize.Forms.Character_Limit_Label (Limit => 3));
   Check (Locale, "label.forms.character_limit_label",
          Humanize.Forms.Localized.Character_Limit_Label (C, Limit => 1),
          Humanize.Forms.Character_Limit_Label (Limit => 1));
   Check (Locale, "label.forms.character_usage_label",
          Humanize.Forms.Localized.Character_Usage_Label (C, Used => 3, Limit => 3),
          Humanize.Forms.Character_Usage_Label (Used => 3, Limit => 3));
   Check (Locale, "label.forms.character_usage_label",
          Humanize.Forms.Localized.Character_Usage_Label (C, Used => 1, Limit => 1),
          Humanize.Forms.Character_Usage_Label (Used => 1, Limit => 1));
   Check (Locale, "label.forms.field_label",
          Humanize.Forms.Localized.Field_Label (C, Name => "plain", Required => False),
          Humanize.Forms.Field_Label (Name => "plain", Required => False));
   Check (Locale, "label.forms.field_label",
          Humanize.Forms.Localized.Field_Label (C, Name => "plain", Required => True),
          Humanize.Forms.Field_Label (Name => "plain", Required => True));
   Check (Locale, "label.forms.field_state_label",
          Humanize.Forms.Localized.Field_State_Label (C, Name => "plain", State => Humanize.Forms.Valid_Input),
          Humanize.Forms.Field_State_Label (Name => "plain", State => Humanize.Forms.Valid_Input));
   Check (Locale, "label.forms.field_state_label",
          Humanize.Forms.Localized.Field_State_Label (C, Name => "plain", State => Humanize.Forms.Read_Only_Input),
          Humanize.Forms.Field_State_Label (Name => "plain", State => Humanize.Forms.Read_Only_Input));
   Check (Locale, "label.forms.form_error_summary_label",
          Humanize.Forms.Localized.Form_Error_Summary_Label (C, Errors => 3, Warnings => 3),
          Humanize.Forms.Form_Error_Summary_Label (Errors => 3, Warnings => 3));
   Check (Locale, "label.forms.form_error_summary_label",
          Humanize.Forms.Localized.Form_Error_Summary_Label (C, Errors => 1, Warnings => 1),
          Humanize.Forms.Form_Error_Summary_Label (Errors => 1, Warnings => 1));
   Check (Locale, "label.forms.form_state_label",
          Humanize.Forms.Localized.Form_State_Label (C, State => Humanize.Forms.Pristine_Form),
          Humanize.Forms.Form_State_Label (State => Humanize.Forms.Pristine_Form));
   Check (Locale, "label.forms.form_state_label",
          Humanize.Forms.Localized.Form_State_Label (C, State => Humanize.Forms.Failed_Form),
          Humanize.Forms.Form_State_Label (State => Humanize.Forms.Failed_Form));
   Check (Locale, "label.forms.input_state_label",
          Humanize.Forms.Localized.Input_State_Label (C, State => Humanize.Forms.Valid_Input),
          Humanize.Forms.Input_State_Label (State => Humanize.Forms.Valid_Input));
   Check (Locale, "label.forms.input_state_label",
          Humanize.Forms.Localized.Input_State_Label (C, State => Humanize.Forms.Read_Only_Input),
          Humanize.Forms.Input_State_Label (State => Humanize.Forms.Read_Only_Input));
   Check (Locale, "label.forms.submission_label",
          Humanize.Forms.Localized.Submission_Label (C, State => Humanize.Forms.Pristine_Form, Errors => 3),
          Humanize.Forms.Submission_Label (State => Humanize.Forms.Pristine_Form, Errors => 3));
   Check (Locale, "label.forms.submission_label",
          Humanize.Forms.Localized.Submission_Label (C, State => Humanize.Forms.Failed_Form, Errors => 1),
          Humanize.Forms.Submission_Label (State => Humanize.Forms.Failed_Form, Errors => 1));
   Check (Locale, "label.forms.unsaved_changes_label",
          Humanize.Forms.Localized.Unsaved_Changes_Label (C, Count => 3),
          Humanize.Forms.Unsaved_Changes_Label (Count => 3));
   Check (Locale, "label.forms.unsaved_changes_label",
          Humanize.Forms.Localized.Unsaved_Changes_Label (C, Count => 1),
          Humanize.Forms.Unsaved_Changes_Label (Count => 1));
   Check (Locale, "label.markup.accessibility_issue_label",
          Humanize.Markup.Localized.Accessibility_Issue_Label
            (C,
             Target => "plain",
             Issue => Humanize.Markup.Missing_Accessible_Name),
          Humanize.Markup.Accessibility_Issue_Label
            (Target => "plain",
             Issue => Humanize.Markup.Missing_Accessible_Name));
   Check (Locale, "label.markup.accessibility_issue_label",
          Humanize.Markup.Localized.Accessibility_Issue_Label
            (C,
             Target => "plain",
             Issue => Humanize.Markup.Unknown_Accessibility_Issue),
          Humanize.Markup.Accessibility_Issue_Label
            (Target => "plain",
             Issue => Humanize.Markup.Unknown_Accessibility_Issue));
   Check (Locale, "label.markup.accessibility_page_summary_label",
          Humanize.Markup.Localized.Accessibility_Page_Summary_Label
            (C,
             Title => "plain",
             Landmarks => 3,
             Headings => 3,
             Issues => 3),
          Humanize.Markup.Accessibility_Page_Summary_Label
            (Title => "plain",
             Landmarks => 3,
             Headings => 3,
             Issues => 3));
   Check (Locale, "label.markup.accessibility_page_summary_label",
          Humanize.Markup.Localized.Accessibility_Page_Summary_Label
            (C,
             Title => "plain",
             Landmarks => 1,
             Headings => 1,
             Issues => 1),
          Humanize.Markup.Accessibility_Page_Summary_Label
            (Title => "plain",
             Landmarks => 1,
             Headings => 1,
             Issues => 1));
   Check (Locale, "label.markup.accessibility_remediation_label",
          Humanize.Markup.Localized.Accessibility_Remediation_Label
            (C,
             Issue => Humanize.Markup.Missing_Accessible_Name),
          Humanize.Markup.Accessibility_Remediation_Label (Issue => Humanize.Markup.Missing_Accessible_Name));
   Check (Locale, "label.markup.accessibility_remediation_label",
          Humanize.Markup.Localized.Accessibility_Remediation_Label
            (C,
             Issue => Humanize.Markup.Unknown_Accessibility_Issue),
          Humanize.Markup.Accessibility_Remediation_Label (Issue => Humanize.Markup.Unknown_Accessibility_Issue));
   Check (Locale, "label.markup.accessibility_summary_label",
          Humanize.Markup.Localized.Accessibility_Summary_Label (C, Issues => 3, Target => "plain"),
          Humanize.Markup.Accessibility_Summary_Label (Issues => 3, Target => "plain"));
   Check (Locale, "label.markup.accessibility_summary_label",
          Humanize.Markup.Localized.Accessibility_Summary_Label (C, Issues => 1, Target => "plain"),
          Humanize.Markup.Accessibility_Summary_Label (Issues => 1, Target => "plain"));
   Check (Locale, "label.markup.attribute_kind_label",
          Humanize.Markup.Localized.Attribute_Kind_Label (C, Kind => Humanize.Markup.Id_Attribute),
          Humanize.Markup.Attribute_Kind_Label (Kind => Humanize.Markup.Id_Attribute));
   Check (Locale, "label.markup.attribute_kind_label",
          Humanize.Markup.Localized.Attribute_Kind_Label (C, Kind => Humanize.Markup.Unknown_Attribute),
          Humanize.Markup.Attribute_Kind_Label (Kind => Humanize.Markup.Unknown_Attribute));
   Check (Locale, "label.markup.form_error_summary_label",
          Humanize.Markup.Localized.Form_Error_Summary_Label (C, Form_Name => "plain", Errors => 3, Warnings => 3),
          Humanize.Markup.Form_Error_Summary_Label (Form_Name => "plain", Errors => 3, Warnings => 3));
   Check (Locale, "label.markup.form_error_summary_label",
          Humanize.Markup.Localized.Form_Error_Summary_Label (C, Form_Name => "plain", Errors => 1, Warnings => 1),
          Humanize.Markup.Form_Error_Summary_Label (Form_Name => "plain", Errors => 1, Warnings => 1));
   Check (Locale, "label.markup.landmark_label",
          Humanize.Markup.Localized.Landmark_Label (C, Role => Humanize.Markup.Banner_Role),
          Humanize.Markup.Landmark_Label (Role => Humanize.Markup.Banner_Role));
   Check (Locale, "label.markup.landmark_label",
          Humanize.Markup.Localized.Landmark_Label (C, Role => Humanize.Markup.Unknown_Role),
          Humanize.Markup.Landmark_Label (Role => Humanize.Markup.Unknown_Role));
   Check (Locale, "label.markup.live_region_update_label",
          Humanize.Markup.Localized.Live_Region_Update_Label
            (C,
             Region => "plain",
             Update => "plain",
             Polite => False),
          Humanize.Markup.Live_Region_Update_Label (Region => "plain", Update => "plain", Polite => False));
   Check (Locale, "label.markup.live_region_update_label",
          Humanize.Markup.Localized.Live_Region_Update_Label
            (C,
             Region => "plain",
             Update => "plain",
             Polite => True),
          Humanize.Markup.Live_Region_Update_Label (Region => "plain", Update => "plain", Polite => True));
   Check (Locale, "label.markup.mime_kind_label",
          Humanize.Markup.Localized.Mime_Kind_Label (C, Kind => Humanize.Markup.Text_Content),
          Humanize.Markup.Mime_Kind_Label (Kind => Humanize.Markup.Text_Content));
   Check (Locale, "label.markup.mime_kind_label",
          Humanize.Markup.Localized.Mime_Kind_Label (C, Kind => Humanize.Markup.Unknown_Content),
          Humanize.Markup.Mime_Kind_Label (Kind => Humanize.Markup.Unknown_Content));
   Check (Locale, "label.markup.tag_kind_label",
          Humanize.Markup.Localized.Tag_Kind_Label (C, Kind => Humanize.Markup.Document_Tag),
          Humanize.Markup.Tag_Kind_Label (Kind => Humanize.Markup.Document_Tag));
   Check (Locale, "label.markup.tag_kind_label",
          Humanize.Markup.Localized.Tag_Kind_Label (C, Kind => Humanize.Markup.Unknown_Tag),
          Humanize.Markup.Tag_Kind_Label (Kind => Humanize.Markup.Unknown_Tag));
   Check (Locale, "label.media.duration_label",
          Humanize.Media.Localized.Duration_Label (C, Duration_Text => "plain"),
          Humanize.Media.Duration_Label (Duration_Text => "plain"));
   Check (Locale, "label.media.media_kind_label",
          Humanize.Media.Localized.Media_Kind_Label (C, Kind => Humanize.Media.Image_Media),
          Humanize.Media.Media_Kind_Label (Kind => Humanize.Media.Image_Media));
   Check (Locale, "label.media.media_kind_label",
          Humanize.Media.Localized.Media_Kind_Label (C, Kind => Humanize.Media.Other_Media),
          Humanize.Media.Media_Kind_Label (Kind => Humanize.Media.Other_Media));
   Check (Locale, "label.media.media_state_label",
          Humanize.Media.Localized.Media_State_Label (C, State => Humanize.Media.Ready_Media),
          Humanize.Media.Media_State_Label (State => Humanize.Media.Ready_Media));
   Check (Locale, "label.media.media_state_label",
          Humanize.Media.Localized.Media_State_Label (C, State => Humanize.Media.Unavailable_Media),
          Humanize.Media.Media_State_Label (State => Humanize.Media.Unavailable_Media));
   Check (Locale, "label.media.media_summary",
          Humanize.Media.Localized.Media_Summary
            (C,
             Name => "plain",
             Kind => Humanize.Media.Image_Media,
             State => Humanize.Media.Ready_Media),
          Humanize.Media.Media_Summary
            (Name => "plain",
             Kind => Humanize.Media.Image_Media,
             State => Humanize.Media.Ready_Media));
   Check (Locale, "label.media.media_summary",
          Humanize.Media.Localized.Media_Summary
            (C,
             Name => "plain",
             Kind => Humanize.Media.Other_Media,
             State => Humanize.Media.Unavailable_Media),
          Humanize.Media.Media_Summary
            (Name => "plain",
             Kind => Humanize.Media.Other_Media,
             State => Humanize.Media.Unavailable_Media));
   Check (Locale, "label.media.page_count_label",
          Humanize.Media.Localized.Page_Count_Label (C, Pages => 3),
          Humanize.Media.Page_Count_Label (Pages => 3));
   Check (Locale, "label.media.page_count_label",
          Humanize.Media.Localized.Page_Count_Label (C, Pages => 1),
          Humanize.Media.Page_Count_Label (Pages => 1));
   Check (Locale, "label.media.resolution_label",
          Humanize.Media.Localized.Resolution_Label (C, Width => 3, Height => 3),
          Humanize.Media.Resolution_Label (Width => 3, Height => 3));
   Check (Locale, "label.media.resolution_label",
          Humanize.Media.Localized.Resolution_Label (C, Width => 1, Height => 1),
          Humanize.Media.Resolution_Label (Width => 1, Height => 1));
   Check (Locale, "label.moderation.appeal_label",
          Humanize.Moderation.Localized.Appeal_Label (C, Item => "plain", State => Humanize.Moderation.Open_Report),
          Humanize.Moderation.Appeal_Label (Item => "plain", State => Humanize.Moderation.Open_Report));
   Check (Locale, "label.moderation.appeal_label",
          Humanize.Moderation.Localized.Appeal_Label (C, Item => "plain", State => Humanize.Moderation.Closed_Report),
          Humanize.Moderation.Appeal_Label (Item => "plain", State => Humanize.Moderation.Closed_Report));
   Check (Locale, "label.moderation.moderation_action_label",
          Humanize.Moderation.Localized.Moderation_Action_Label (C, Action => Humanize.Moderation.No_Action),
          Humanize.Moderation.Moderation_Action_Label (Action => Humanize.Moderation.No_Action));
   Check (Locale, "label.moderation.moderation_action_label",
          Humanize.Moderation.Localized.Moderation_Action_Label (C, Action => Humanize.Moderation.Escalated),
          Humanize.Moderation.Moderation_Action_Label (Action => Humanize.Moderation.Escalated));
   Check (Locale, "label.moderation.moderation_label",
          Humanize.Moderation.Localized.Moderation_Label
            (C,
             Item => "plain",
             Action => Humanize.Moderation.No_Action),
          Humanize.Moderation.Moderation_Label (Item => "plain", Action => Humanize.Moderation.No_Action));
   Check (Locale, "label.moderation.moderation_label",
          Humanize.Moderation.Localized.Moderation_Label
            (C,
             Item => "plain",
             Action => Humanize.Moderation.Escalated),
          Humanize.Moderation.Moderation_Label (Item => "plain", Action => Humanize.Moderation.Escalated));
   Check (Locale, "label.moderation.moderation_queue_label",
          Humanize.Moderation.Localized.Moderation_Queue_Label (C, Pending => 3, Escalated => 3),
          Humanize.Moderation.Moderation_Queue_Label (Pending => 3, Escalated => 3));
   Check (Locale, "label.moderation.moderation_queue_label",
          Humanize.Moderation.Localized.Moderation_Queue_Label (C, Pending => 1, Escalated => 1),
          Humanize.Moderation.Moderation_Queue_Label (Pending => 1, Escalated => 1));
   Check (Locale, "label.moderation.report_label",
          Humanize.Moderation.Localized.Report_Label (C, Item => "plain", State => Humanize.Moderation.Open_Report),
          Humanize.Moderation.Report_Label (Item => "plain", State => Humanize.Moderation.Open_Report));
   Check (Locale, "label.moderation.report_label",
          Humanize.Moderation.Localized.Report_Label (C, Item => "plain", State => Humanize.Moderation.Closed_Report),
          Humanize.Moderation.Report_Label (Item => "plain", State => Humanize.Moderation.Closed_Report));
   Check (Locale, "label.moderation.report_state_label",
          Humanize.Moderation.Localized.Report_State_Label (C, State => Humanize.Moderation.Open_Report),
          Humanize.Moderation.Report_State_Label (State => Humanize.Moderation.Open_Report));
   Check (Locale, "label.moderation.report_state_label",
          Humanize.Moderation.Localized.Report_State_Label (C, State => Humanize.Moderation.Closed_Report),
          Humanize.Moderation.Report_State_Label (State => Humanize.Moderation.Closed_Report));
   Check (Locale, "label.moderation.review_label",
          Humanize.Moderation.Localized.Review_Label
            (C,
             Item => "plain",
             State => Humanize.Moderation.Pending_Review),
          Humanize.Moderation.Review_Label (Item => "plain", State => Humanize.Moderation.Pending_Review));
   Check (Locale, "label.moderation.review_label",
          Humanize.Moderation.Localized.Review_Label
            (C,
             Item => "plain",
             State => Humanize.Moderation.Escalated_Review),
          Humanize.Moderation.Review_Label (Item => "plain", State => Humanize.Moderation.Escalated_Review));
   Check (Locale, "label.moderation.review_state_label",
          Humanize.Moderation.Localized.Review_State_Label (C, State => Humanize.Moderation.Pending_Review),
          Humanize.Moderation.Review_State_Label (State => Humanize.Moderation.Pending_Review));
   Check (Locale, "label.moderation.review_state_label",
          Humanize.Moderation.Localized.Review_State_Label (C, State => Humanize.Moderation.Escalated_Review),
          Humanize.Moderation.Review_State_Label (State => Humanize.Moderation.Escalated_Review));
end Check_Group_3;
