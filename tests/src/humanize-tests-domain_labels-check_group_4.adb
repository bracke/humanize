with Humanize.Markup;
with Humanize.Media;
with Humanize.Moderation;
with Humanize.Navigation;
with Humanize.Notification_Preferences;
with Humanize.Markup.Localized;
with Humanize.Media.Localized;
with Humanize.Moderation.Localized;
with Humanize.Navigation.Localized;
with Humanize.Notification_Preferences.Localized;

separate (Humanize.Tests.Domain_Labels)
procedure Check_Group_4 (Locale : String; C : Humanize.Contexts.Context) is
begin
   Check (Locale, "label.markup.accessibility_issue_label", Phrase,
          Humanize.Markup.Localized.Accessibility_Issue_Label (C, Target => "plain", Issue =>
            Humanize.Markup.Missing_Accessible_Name),
          Humanize.Markup.Accessibility_Issue_Label (Target => "plain", Issue =>
            Humanize.Markup.Missing_Accessible_Name));
   Check (Locale, "label.markup.accessibility_issue_label", Phrase,
          Humanize.Markup.Localized.Accessibility_Issue_Label (C, Target => "plain", Issue =>
            Humanize.Markup.Unknown_Accessibility_Issue),
          Humanize.Markup.Accessibility_Issue_Label (Target => "plain", Issue =>
            Humanize.Markup.Unknown_Accessibility_Issue));
   Check (Locale, "label.markup.accessibility_page_summary_label", Phrase,
          Humanize.Markup.Localized.Accessibility_Page_Summary_Label (C, Title => "plain", Landmarks => 3, Headings
            => 3, Issues => 3),
          Humanize.Markup.Accessibility_Page_Summary_Label (Title => "plain", Landmarks => 3, Headings => 3, Issues
            => 3));
   Check (Locale, "label.markup.accessibility_page_summary_label", Phrase,
          Humanize.Markup.Localized.Accessibility_Page_Summary_Label (C, Title => "plain", Landmarks => 1, Headings
            => 1, Issues => 1),
          Humanize.Markup.Accessibility_Page_Summary_Label (Title => "plain", Landmarks => 1, Headings => 1, Issues
            => 1));
   Check (Locale, "label.markup.accessibility_remediation_label", Phrase,
          Humanize.Markup.Localized.Accessibility_Remediation_Label (C, Issue =>
            Humanize.Markup.Missing_Accessible_Name),
          Humanize.Markup.Accessibility_Remediation_Label (Issue => Humanize.Markup.Missing_Accessible_Name));
   Check (Locale, "label.markup.accessibility_remediation_label", Phrase,
          Humanize.Markup.Localized.Accessibility_Remediation_Label (C, Issue =>
            Humanize.Markup.Unknown_Accessibility_Issue),
          Humanize.Markup.Accessibility_Remediation_Label (Issue => Humanize.Markup.Unknown_Accessibility_Issue));
   Check (Locale, "label.markup.accessibility_summary_label", Phrase,
          Humanize.Markup.Localized.Accessibility_Summary_Label (C, Issues => 3, Target => "plain"),
          Humanize.Markup.Accessibility_Summary_Label (Issues => 3, Target => "plain"));
   Check (Locale, "label.markup.accessibility_summary_label", Phrase,
          Humanize.Markup.Localized.Accessibility_Summary_Label (C, Issues => 1, Target => "plain"),
          Humanize.Markup.Accessibility_Summary_Label (Issues => 1, Target => "plain"));
   Check (Locale, "label.markup.attribute_count_label", Plain,
          Humanize.Markup.Localized.Attribute_Count_Label (C, Total => 7, Data => 9, Aria => 4, Events => 6),
          Humanize.Markup.Attribute_Count_Label (Total => 7, Data => 9, Aria => 4, Events => 6));
   Check (Locale, "label.markup.attribute_count_label", Plain,
          Humanize.Markup.Localized.Attribute_Count_Label (C, Total => 2, Data => 0, Aria => 0, Events => 0),
          Humanize.Markup.Attribute_Count_Label (Total => 2, Data => 0, Aria => 0, Events => 0));
   Check (Locale, "label.markup.attribute_kind_label", Phrase,
          Humanize.Markup.Localized.Attribute_Kind_Label (C, Kind => Humanize.Markup.Id_Attribute),
          Humanize.Markup.Attribute_Kind_Label (Kind => Humanize.Markup.Id_Attribute));
   Check (Locale, "label.markup.attribute_kind_label", Phrase,
          Humanize.Markup.Localized.Attribute_Kind_Label (C, Kind => Humanize.Markup.Unknown_Attribute),
          Humanize.Markup.Attribute_Kind_Label (Kind => Humanize.Markup.Unknown_Attribute));
   Check (Locale, "label.markup.document_outline_label", Plain,
          Humanize.Markup.Localized.Document_Outline_Label (C, Headings => 7, Landmarks => 9, Forms => 4, Media =>
            6),
          Humanize.Markup.Document_Outline_Label (Headings => 7, Landmarks => 9, Forms => 4, Media => 6));
   Check (Locale, "label.markup.document_outline_label", Plain,
          Humanize.Markup.Localized.Document_Outline_Label (C, Headings => 2, Landmarks => 0, Forms => 0, Media =>
            0),
          Humanize.Markup.Document_Outline_Label (Headings => 2, Landmarks => 0, Forms => 0, Media => 0));
   Check (Locale, "label.markup.form_error_summary_label", Phrase,
          Humanize.Markup.Localized.Form_Error_Summary_Label (C, Form_Name => "plain", Errors => 3, Warnings => 3),
          Humanize.Markup.Form_Error_Summary_Label (Form_Name => "plain", Errors => 3, Warnings => 3));
   Check (Locale, "label.markup.form_error_summary_label", Phrase,
          Humanize.Markup.Localized.Form_Error_Summary_Label (C, Form_Name => "plain", Errors => 1, Warnings => 1),
          Humanize.Markup.Form_Error_Summary_Label (Form_Name => "plain", Errors => 1, Warnings => 1));
   Check (Locale, "label.markup.heading_label", Phrase,
          Humanize.Markup.Localized.Heading_Label (C, Level => 2),
          Humanize.Markup.Heading_Label (Level => 2));
   Check (Locale, "label.markup.landmark_label", Phrase,
          Humanize.Markup.Localized.Landmark_Label (C, Role => Humanize.Markup.Banner_Role),
          Humanize.Markup.Landmark_Label (Role => Humanize.Markup.Banner_Role));
   Check (Locale, "label.markup.landmark_label", Phrase,
          Humanize.Markup.Localized.Landmark_Label (C, Role => Humanize.Markup.Unknown_Role),
          Humanize.Markup.Landmark_Label (Role => Humanize.Markup.Unknown_Role));
   Check (Locale, "label.markup.landmark_label", Prefix,
          Humanize.Markup.Localized.Landmark_Label (C, Role => Humanize.Markup.Banner_Role, Options =>
            (Humanize.Markup.Default_Markup_Label_Options with delta Include_Surface => True)),
          Humanize.Markup.Landmark_Label (Role => Humanize.Markup.Banner_Role, Options =>
            (Humanize.Markup.Default_Markup_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.markup.live_region_update_label", Phrase,
          Humanize.Markup.Localized.Live_Region_Update_Label (C, Region => "plain", Update => "plain", Polite =>
            False),
          Humanize.Markup.Live_Region_Update_Label (Region => "plain", Update => "plain", Polite => False));
   Check (Locale, "label.markup.live_region_update_label", Phrase,
          Humanize.Markup.Localized.Live_Region_Update_Label (C, Region => "plain", Update => "plain", Polite =>
            True),
          Humanize.Markup.Live_Region_Update_Label (Region => "plain", Update => "plain", Polite => True));
   Check (Locale, "label.markup.mime_kind_label", Phrase,
          Humanize.Markup.Localized.Mime_Kind_Label (C, Kind => Humanize.Markup.Text_Content),
          Humanize.Markup.Mime_Kind_Label (Kind => Humanize.Markup.Text_Content));
   Check (Locale, "label.markup.mime_kind_label", Phrase,
          Humanize.Markup.Localized.Mime_Kind_Label (C, Kind => Humanize.Markup.Unknown_Content),
          Humanize.Markup.Mime_Kind_Label (Kind => Humanize.Markup.Unknown_Content));
   Check (Locale, "label.markup.table_navigation_label", Phrase,
          Humanize.Markup.Localized.Table_Navigation_Label (C, Caption => "plain", Row => 7, Column => 9, Rows => 4,
            Columns => 6),
          Humanize.Markup.Table_Navigation_Label (Caption => "plain", Row => 7, Column => 9, Rows => 4, Columns =>
            6));
   Check (Locale, "label.markup.table_navigation_label", Phrase,
          Humanize.Markup.Localized.Table_Navigation_Label (C, Caption => "plain", Row => 2, Column => 2, Rows => 2,
            Columns => 2),
          Humanize.Markup.Table_Navigation_Label (Caption => "plain", Row => 2, Column => 2, Rows => 2, Columns =>
            2));
   Check (Locale, "label.markup.tag_count_label", Plain,
          Humanize.Markup.Localized.Tag_Count_Label (C, Total => 7, Links => 9, Media => 4, Forms => 6),
          Humanize.Markup.Tag_Count_Label (Total => 7, Links => 9, Media => 4, Forms => 6));
   Check (Locale, "label.markup.tag_count_label", Plain,
          Humanize.Markup.Localized.Tag_Count_Label (C, Total => 2, Links => 0, Media => 0, Forms => 0),
          Humanize.Markup.Tag_Count_Label (Total => 2, Links => 0, Media => 0, Forms => 0));
   Check (Locale, "label.markup.tag_kind_label", Phrase,
          Humanize.Markup.Localized.Tag_Kind_Label (C, Kind => Humanize.Markup.Document_Tag),
          Humanize.Markup.Tag_Kind_Label (Kind => Humanize.Markup.Document_Tag));
   Check (Locale, "label.markup.tag_kind_label", Phrase,
          Humanize.Markup.Localized.Tag_Kind_Label (C, Kind => Humanize.Markup.Unknown_Tag),
          Humanize.Markup.Tag_Kind_Label (Kind => Humanize.Markup.Unknown_Tag));
   Check (Locale, "label.media.duration_label", Phrase,
          Humanize.Media.Localized.Duration_Label (C, Duration_Text => "plain"),
          Humanize.Media.Duration_Label (Duration_Text => "plain"));
   Check (Locale, "label.media.media_kind_label", Phrase,
          Humanize.Media.Localized.Media_Kind_Label (C, Kind => Humanize.Media.Image_Media),
          Humanize.Media.Media_Kind_Label (Kind => Humanize.Media.Image_Media));
   Check (Locale, "label.media.media_kind_label", Phrase,
          Humanize.Media.Localized.Media_Kind_Label (C, Kind => Humanize.Media.Other_Media),
          Humanize.Media.Media_Kind_Label (Kind => Humanize.Media.Other_Media));
   Check (Locale, "label.media.media_state_label", Phrase,
          Humanize.Media.Localized.Media_State_Label (C, State => Humanize.Media.Ready_Media),
          Humanize.Media.Media_State_Label (State => Humanize.Media.Ready_Media));
   Check (Locale, "label.media.media_state_label", Phrase,
          Humanize.Media.Localized.Media_State_Label (C, State => Humanize.Media.Unavailable_Media),
          Humanize.Media.Media_State_Label (State => Humanize.Media.Unavailable_Media));
   Check (Locale, "label.media.media_summary", Phrase,
          Humanize.Media.Localized.Media_Summary (C, Name => "plain", Kind => Humanize.Media.Image_Media, State =>
            Humanize.Media.Ready_Media),
          Humanize.Media.Media_Summary (Name => "plain", Kind => Humanize.Media.Image_Media, State =>
            Humanize.Media.Ready_Media));
   Check (Locale, "label.media.media_summary", Phrase,
          Humanize.Media.Localized.Media_Summary (C, Name => "plain", Kind => Humanize.Media.Other_Media, State =>
            Humanize.Media.Unavailable_Media),
          Humanize.Media.Media_Summary (Name => "plain", Kind => Humanize.Media.Other_Media, State =>
            Humanize.Media.Unavailable_Media));
   Check (Locale, "label.media.media_summary", Prefix,
          Humanize.Media.Localized.Media_Summary (C, Name => "plain", Kind => Humanize.Media.Image_Media, State =>
            Humanize.Media.Ready_Media, Options => (Humanize.Media.Default_Media_Label_Options with delta
            Include_Surface => True)),
          Humanize.Media.Media_Summary (Name => "plain", Kind => Humanize.Media.Image_Media, State =>
            Humanize.Media.Ready_Media, Options => (Humanize.Media.Default_Media_Label_Options with delta
            Include_Surface => True)));
   Check (Locale, "label.media.page_count_label", Phrase,
          Humanize.Media.Localized.Page_Count_Label (C, Pages => 3),
          Humanize.Media.Page_Count_Label (Pages => 3));
   Check (Locale, "label.media.page_count_label", Phrase,
          Humanize.Media.Localized.Page_Count_Label (C, Pages => 1),
          Humanize.Media.Page_Count_Label (Pages => 1));
   Check (Locale, "label.media.resolution_label", Phrase,
          Humanize.Media.Localized.Resolution_Label (C, Width => 3, Height => 3),
          Humanize.Media.Resolution_Label (Width => 3, Height => 3));
   Check (Locale, "label.media.resolution_label", Phrase,
          Humanize.Media.Localized.Resolution_Label (C, Width => 1, Height => 1),
          Humanize.Media.Resolution_Label (Width => 1, Height => 1));
   Check (Locale, "label.moderation.appeal_label", Phrase,
          Humanize.Moderation.Localized.Appeal_Label (C, Item => "plain", State => Humanize.Moderation.Open_Report),
          Humanize.Moderation.Appeal_Label (Item => "plain", State => Humanize.Moderation.Open_Report));
   Check (Locale, "label.moderation.appeal_label", Phrase,
          Humanize.Moderation.Localized.Appeal_Label (C, Item => "plain", State =>
            Humanize.Moderation.Closed_Report),
          Humanize.Moderation.Appeal_Label (Item => "plain", State => Humanize.Moderation.Closed_Report));
   Check (Locale, "label.moderation.moderation_action_label", Phrase,
          Humanize.Moderation.Localized.Moderation_Action_Label (C, Action => Humanize.Moderation.No_Action),
          Humanize.Moderation.Moderation_Action_Label (Action => Humanize.Moderation.No_Action));
   Check (Locale, "label.moderation.moderation_action_label", Phrase,
          Humanize.Moderation.Localized.Moderation_Action_Label (C, Action => Humanize.Moderation.Escalated),
          Humanize.Moderation.Moderation_Action_Label (Action => Humanize.Moderation.Escalated));
   Check (Locale, "label.moderation.moderation_label", Phrase,
          Humanize.Moderation.Localized.Moderation_Label (C, Item => "plain", Action =>
            Humanize.Moderation.No_Action),
          Humanize.Moderation.Moderation_Label (Item => "plain", Action => Humanize.Moderation.No_Action));
   Check (Locale, "label.moderation.moderation_label", Phrase,
          Humanize.Moderation.Localized.Moderation_Label (C, Item => "plain", Action =>
            Humanize.Moderation.Escalated),
          Humanize.Moderation.Moderation_Label (Item => "plain", Action => Humanize.Moderation.Escalated));
   Check (Locale, "label.moderation.moderation_label", Prefix,
          Humanize.Moderation.Localized.Moderation_Label (C, Item => "plain", Action =>
            Humanize.Moderation.No_Action, Options => (Humanize.Moderation.Default_Moderation_Label_Options with
            delta Include_Surface => True)),
          Humanize.Moderation.Moderation_Label (Item => "plain", Action => Humanize.Moderation.No_Action, Options =>
            (Humanize.Moderation.Default_Moderation_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.moderation.moderation_queue_label", Phrase,
          Humanize.Moderation.Localized.Moderation_Queue_Label (C, Pending => 3, Escalated => 3),
          Humanize.Moderation.Moderation_Queue_Label (Pending => 3, Escalated => 3));
   Check (Locale, "label.moderation.moderation_queue_label", Phrase,
          Humanize.Moderation.Localized.Moderation_Queue_Label (C, Pending => 1, Escalated => 1),
          Humanize.Moderation.Moderation_Queue_Label (Pending => 1, Escalated => 1));
   Check (Locale, "label.moderation.report_label", Phrase,
          Humanize.Moderation.Localized.Report_Label (C, Item => "plain", State => Humanize.Moderation.Open_Report),
          Humanize.Moderation.Report_Label (Item => "plain", State => Humanize.Moderation.Open_Report));
   Check (Locale, "label.moderation.report_label", Phrase,
          Humanize.Moderation.Localized.Report_Label (C, Item => "plain", State =>
            Humanize.Moderation.Closed_Report),
          Humanize.Moderation.Report_Label (Item => "plain", State => Humanize.Moderation.Closed_Report));
   Check (Locale, "label.moderation.report_label", Prefix,
          Humanize.Moderation.Localized.Report_Label (C, Item => "plain", State => Humanize.Moderation.Open_Report,
            Options => (Humanize.Moderation.Default_Moderation_Label_Options with delta Include_Surface => True)),
          Humanize.Moderation.Report_Label (Item => "plain", State => Humanize.Moderation.Open_Report, Options =>
            (Humanize.Moderation.Default_Moderation_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.moderation.report_state_label", Phrase,
          Humanize.Moderation.Localized.Report_State_Label (C, State => Humanize.Moderation.Open_Report),
          Humanize.Moderation.Report_State_Label (State => Humanize.Moderation.Open_Report));
   Check (Locale, "label.moderation.report_state_label", Phrase,
          Humanize.Moderation.Localized.Report_State_Label (C, State => Humanize.Moderation.Closed_Report),
          Humanize.Moderation.Report_State_Label (State => Humanize.Moderation.Closed_Report));
   Check (Locale, "label.moderation.review_label", Phrase,
          Humanize.Moderation.Localized.Review_Label (C, Item => "plain", State =>
            Humanize.Moderation.Pending_Review),
          Humanize.Moderation.Review_Label (Item => "plain", State => Humanize.Moderation.Pending_Review));
   Check (Locale, "label.moderation.review_label", Phrase,
          Humanize.Moderation.Localized.Review_Label (C, Item => "plain", State =>
            Humanize.Moderation.Escalated_Review),
          Humanize.Moderation.Review_Label (Item => "plain", State => Humanize.Moderation.Escalated_Review));
   Check (Locale, "label.moderation.review_label", Prefix,
          Humanize.Moderation.Localized.Review_Label (C, Item => "plain", State =>
            Humanize.Moderation.Pending_Review, Options => (Humanize.Moderation.Default_Moderation_Label_Options
            with delta Include_Surface => True)),
          Humanize.Moderation.Review_Label (Item => "plain", State => Humanize.Moderation.Pending_Review, Options =>
            (Humanize.Moderation.Default_Moderation_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.moderation.review_state_label", Phrase,
          Humanize.Moderation.Localized.Review_State_Label (C, State => Humanize.Moderation.Pending_Review),
          Humanize.Moderation.Review_State_Label (State => Humanize.Moderation.Pending_Review));
   Check (Locale, "label.moderation.review_state_label", Phrase,
          Humanize.Moderation.Localized.Review_State_Label (C, State => Humanize.Moderation.Escalated_Review),
          Humanize.Moderation.Review_State_Label (State => Humanize.Moderation.Escalated_Review));
   Check (Locale, "label.navigation.back_label", Phrase,
          Humanize.Navigation.Localized.Back_Label (C, Target => "plain"),
          Humanize.Navigation.Back_Label (Target => "plain"));
   Check (Locale, "label.navigation.breadcrumb_position_label", Phrase,
          Humanize.Navigation.Localized.Breadcrumb_Position_Label (C, Current => 7, Total => 9, Name => "plain"),
          Humanize.Navigation.Breadcrumb_Position_Label (Current => 7, Total => 9, Name => "plain"));
   Check (Locale, "label.navigation.breadcrumb_position_label", Phrase,
          Humanize.Navigation.Localized.Breadcrumb_Position_Label (C, Current => 2, Total => 0, Name => "plain"),
          Humanize.Navigation.Breadcrumb_Position_Label (Current => 2, Total => 0, Name => "plain"));
   Check (Locale, "label.navigation.breadcrumb_trail_label", Phrase,
          Humanize.Navigation.Localized.Breadcrumb_Trail_Label (C, Depth => 3),
          Humanize.Navigation.Breadcrumb_Trail_Label (Depth => 3));
   Check (Locale, "label.navigation.breadcrumb_trail_label", Phrase,
          Humanize.Navigation.Localized.Breadcrumb_Trail_Label (C, Depth => 1),
          Humanize.Navigation.Breadcrumb_Trail_Label (Depth => 1));
   Check (Locale, "label.navigation.current_page_label", Phrase,
          Humanize.Navigation.Localized.Current_Page_Label (C, Name => "plain"),
          Humanize.Navigation.Current_Page_Label (Name => "plain"));
   Check (Locale, "label.navigation.external_link_label", Phrase,
          Humanize.Navigation.Localized.External_Link_Label (C, Name => "plain"),
          Humanize.Navigation.External_Link_Label (Name => "plain"));
   Check (Locale, "label.navigation.first_label", Phrase,
          Humanize.Navigation.Localized.First_Label (C, Target => "plain"),
          Humanize.Navigation.First_Label (Target => "plain"));
   Check (Locale, "label.navigation.last_label", Phrase,
          Humanize.Navigation.Localized.Last_Label (C, Target => "plain"),
          Humanize.Navigation.Last_Label (Target => "plain"));
   Check (Locale, "label.navigation.menu_count_label", Phrase,
          Humanize.Navigation.Localized.Menu_Count_Label (C, Count => 3),
          Humanize.Navigation.Menu_Count_Label (Count => 3));
   Check (Locale, "label.navigation.menu_count_label", Phrase,
          Humanize.Navigation.Localized.Menu_Count_Label (C, Count => 1),
          Humanize.Navigation.Menu_Count_Label (Count => 1));
   Check (Locale, "label.navigation.navigation_item_kind_label", Phrase,
          Humanize.Navigation.Localized.Navigation_Item_Kind_Label (C, Kind => Humanize.Navigation.Link_Item),
          Humanize.Navigation.Navigation_Item_Kind_Label (Kind => Humanize.Navigation.Link_Item));
   Check (Locale, "label.navigation.navigation_item_kind_label", Phrase,
          Humanize.Navigation.Localized.Navigation_Item_Kind_Label (C, Kind => Humanize.Navigation.Separator_Item),
          Humanize.Navigation.Navigation_Item_Kind_Label (Kind => Humanize.Navigation.Separator_Item));
   Check (Locale, "label.navigation.navigation_item_label", Phrase,
          Humanize.Navigation.Localized.Navigation_Item_Label (C, Name => "plain", Kind =>
            Humanize.Navigation.Link_Item, State => Humanize.Navigation.Current_Item),
          Humanize.Navigation.Navigation_Item_Label (Name => "plain", Kind => Humanize.Navigation.Link_Item, State
            => Humanize.Navigation.Current_Item));
   Check (Locale, "label.navigation.navigation_item_label", Phrase,
          Humanize.Navigation.Localized.Navigation_Item_Label (C, Name => "plain", Kind =>
            Humanize.Navigation.Separator_Item, State => Humanize.Navigation.External_Item),
          Humanize.Navigation.Navigation_Item_Label (Name => "plain", Kind => Humanize.Navigation.Separator_Item,
            State => Humanize.Navigation.External_Item));
   Check (Locale, "label.navigation.navigation_item_label", Prefix,
          Humanize.Navigation.Localized.Navigation_Item_Label (C, Name => "plain", Kind =>
            Humanize.Navigation.Link_Item, State => Humanize.Navigation.Current_Item, Options =>
            (Humanize.Navigation.Default_Navigation_Label_Options with delta Include_Surface => True)),
          Humanize.Navigation.Navigation_Item_Label (Name => "plain", Kind => Humanize.Navigation.Link_Item, State
            => Humanize.Navigation.Current_Item, Options => (Humanize.Navigation.Default_Navigation_Label_Options
            with delta Include_Surface => True)));
   Check (Locale, "label.navigation.navigation_state_label", Phrase,
          Humanize.Navigation.Localized.Navigation_State_Label (C, State => Humanize.Navigation.Current_Item),
          Humanize.Navigation.Navigation_State_Label (State => Humanize.Navigation.Current_Item));
   Check (Locale, "label.navigation.navigation_state_label", Phrase,
          Humanize.Navigation.Localized.Navigation_State_Label (C, State => Humanize.Navigation.External_Item),
          Humanize.Navigation.Navigation_State_Label (State => Humanize.Navigation.External_Item));
   Check (Locale, "label.navigation.next_label", Phrase,
          Humanize.Navigation.Localized.Next_Label (C, Target => "plain"),
          Humanize.Navigation.Next_Label (Target => "plain"));
   Check (Locale, "label.navigation.section_state_label", Phrase,
          Humanize.Navigation.Localized.Section_State_Label (C, Name => "plain", Expanded => False, Count => 3),
          Humanize.Navigation.Section_State_Label (Name => "plain", Expanded => False, Count => 3));
   Check (Locale, "label.navigation.section_state_label", Phrase,
          Humanize.Navigation.Localized.Section_State_Label (C, Name => "plain", Expanded => True, Count => 1),
          Humanize.Navigation.Section_State_Label (Name => "plain", Expanded => True, Count => 1));
   Check (Locale, "label.navigation.skip_link_label", Phrase,
          Humanize.Navigation.Localized.Skip_Link_Label (C, Target => "plain"),
          Humanize.Navigation.Skip_Link_Label (Target => "plain"));
   Check (Locale, "label.navigation.submenu_label", Phrase,
          Humanize.Navigation.Localized.Submenu_Label (C, Name => "plain", Count => 3),
          Humanize.Navigation.Submenu_Label (Name => "plain", Count => 3));
   Check (Locale, "label.navigation.submenu_label", Phrase,
          Humanize.Navigation.Localized.Submenu_Label (C, Name => "plain", Count => 1),
          Humanize.Navigation.Submenu_Label (Name => "plain", Count => 1));
   Check (Locale, "label.navigation.tab_label", Phrase,
          Humanize.Navigation.Localized.Tab_Label (C, Current => 7, Total => 9, Name => "plain"),
          Humanize.Navigation.Tab_Label (Current => 7, Total => 9, Name => "plain"));
   Check (Locale, "label.navigation.tab_label", Phrase,
          Humanize.Navigation.Localized.Tab_Label (C, Current => 2, Total => 0, Name => "plain"),
          Humanize.Navigation.Tab_Label (Current => 2, Total => 0, Name => "plain"));
   Check (Locale, "label.notification_preferences.alert_level_label", Phrase,
          Humanize.Notification_Preferences.Localized.Alert_Level_Label (C, Level =>
            Humanize.Notification_Preferences.All_Alerts),
          Humanize.Notification_Preferences.Alert_Level_Label (Level =>
            Humanize.Notification_Preferences.All_Alerts));
   Check (Locale, "label.notification_preferences.alert_level_label", Phrase,
          Humanize.Notification_Preferences.Localized.Alert_Level_Label (C, Level =>
            Humanize.Notification_Preferences.No_Alerts),
          Humanize.Notification_Preferences.Alert_Level_Label (Level =>
            Humanize.Notification_Preferences.No_Alerts));
   Check (Locale, "label.notification_preferences.channel_preference_label", Phrase,
          Humanize.Notification_Preferences.Localized.Channel_Preference_Label (C, Channel => "plain", State =>
            Humanize.Notification_Preferences.Preference_Enabled),
          Humanize.Notification_Preferences.Channel_Preference_Label (Channel => "plain", State =>
            Humanize.Notification_Preferences.Preference_Enabled));
   Check (Locale, "label.notification_preferences.channel_preference_label", Phrase,
          Humanize.Notification_Preferences.Localized.Channel_Preference_Label (C, Channel => "plain", State =>
            Humanize.Notification_Preferences.Preference_Required),
          Humanize.Notification_Preferences.Channel_Preference_Label (Channel => "plain", State =>
            Humanize.Notification_Preferences.Preference_Required));
   Check (Locale, "label.notification_preferences.channel_preference_label", Prefix,
          Humanize.Notification_Preferences.Localized.Channel_Preference_Label (C, Channel => "plain", State =>
            Humanize.Notification_Preferences.Preference_Enabled, Options =>
            (Humanize.Notification_Preferences.Default_Notification_Preference_Label_Options with delta
            Include_Surface => True)),
          Humanize.Notification_Preferences.Channel_Preference_Label (Channel => "plain", State =>
            Humanize.Notification_Preferences.Preference_Enabled, Options =>
            (Humanize.Notification_Preferences.Default_Notification_Preference_Label_Options with delta
            Include_Surface => True)));
   Check (Locale, "label.notification_preferences.digest_schedule_label", Phrase,
          Humanize.Notification_Preferences.Localized.Digest_Schedule_Label (C, Schedule =>
            Humanize.Notification_Preferences.No_Digest),
          Humanize.Notification_Preferences.Digest_Schedule_Label (Schedule =>
            Humanize.Notification_Preferences.No_Digest));
   Check (Locale, "label.notification_preferences.digest_schedule_label", Phrase,
          Humanize.Notification_Preferences.Localized.Digest_Schedule_Label (C, Schedule =>
            Humanize.Notification_Preferences.Weekly_Digest),
          Humanize.Notification_Preferences.Digest_Schedule_Label (Schedule =>
            Humanize.Notification_Preferences.Weekly_Digest));
   Check (Locale, "label.notification_preferences.preference_state_label", Phrase,
          Humanize.Notification_Preferences.Localized.Preference_State_Label (C, State =>
            Humanize.Notification_Preferences.Preference_Enabled),
          Humanize.Notification_Preferences.Preference_State_Label (State =>
            Humanize.Notification_Preferences.Preference_Enabled));
   Check (Locale, "label.notification_preferences.preference_state_label", Phrase,
          Humanize.Notification_Preferences.Localized.Preference_State_Label (C, State =>
            Humanize.Notification_Preferences.Preference_Required),
          Humanize.Notification_Preferences.Preference_State_Label (State =>
            Humanize.Notification_Preferences.Preference_Required));
   Check (Locale, "label.notification_preferences.quiet_hours_label", Phrase,
          Humanize.Notification_Preferences.Localized.Quiet_Hours_Label (C, Time_Text => "plain"),
          Humanize.Notification_Preferences.Quiet_Hours_Label (Time_Text => "plain"));
   Check (Locale, "label.notification_preferences.subscription_label", Phrase,
          Humanize.Notification_Preferences.Localized.Subscription_Label (C, Name => "plain", Scope =>
            Humanize.Notification_Preferences.Thread_Subscription, State =>
            Humanize.Notification_Preferences.Preference_Enabled),
          Humanize.Notification_Preferences.Subscription_Label (Name => "plain", Scope =>
            Humanize.Notification_Preferences.Thread_Subscription, State =>
            Humanize.Notification_Preferences.Preference_Enabled));
   Check (Locale, "label.notification_preferences.subscription_label", Phrase,
          Humanize.Notification_Preferences.Localized.Subscription_Label (C, Name => "plain", Scope =>
            Humanize.Notification_Preferences.Account_Subscription, State =>
            Humanize.Notification_Preferences.Preference_Required),
          Humanize.Notification_Preferences.Subscription_Label (Name => "plain", Scope =>
            Humanize.Notification_Preferences.Account_Subscription, State =>
            Humanize.Notification_Preferences.Preference_Required));
   Check (Locale, "label.notification_preferences.subscription_label", Prefix,
          Humanize.Notification_Preferences.Localized.Subscription_Label (C, Name => "plain", Scope =>
            Humanize.Notification_Preferences.Thread_Subscription, State =>
            Humanize.Notification_Preferences.Preference_Enabled, Options =>
            (Humanize.Notification_Preferences.Default_Notification_Preference_Label_Options with delta
            Include_Surface => True)),
          Humanize.Notification_Preferences.Subscription_Label (Name => "plain", Scope =>
            Humanize.Notification_Preferences.Thread_Subscription, State =>
            Humanize.Notification_Preferences.Preference_Enabled, Options =>
            (Humanize.Notification_Preferences.Default_Notification_Preference_Label_Options with delta
            Include_Surface => True)));
   Check (Locale, "label.notification_preferences.subscription_scope_label", Phrase,
          Humanize.Notification_Preferences.Localized.Subscription_Scope_Label (C, Scope =>
            Humanize.Notification_Preferences.Thread_Subscription),
          Humanize.Notification_Preferences.Subscription_Scope_Label (Scope =>
            Humanize.Notification_Preferences.Thread_Subscription));
   Check (Locale, "label.notification_preferences.subscription_scope_label", Phrase,
          Humanize.Notification_Preferences.Localized.Subscription_Scope_Label (C, Scope =>
            Humanize.Notification_Preferences.Account_Subscription),
          Humanize.Notification_Preferences.Subscription_Scope_Label (Scope =>
            Humanize.Notification_Preferences.Account_Subscription));
end Check_Group_4;
