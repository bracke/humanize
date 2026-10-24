with Humanize.Forms;
with Humanize.Markup;
with Humanize.Media;
with Humanize.Moderation;
with Humanize.Forms.Localized;
with Humanize.Markup.Localized;
with Humanize.Media.Localized;
with Humanize.Moderation.Localized;

separate (Humanize.Tests.Domain_Labels)
procedure Check_Group_4 (Locale : String; C : Humanize.Contexts.Context) is
begin
   Check (Locale, "label.forms.character_count_label", Phrase,
          Humanize.Forms.Localized.Character_Count_Label (C, Used => 3),
          Humanize.Forms.Character_Count_Label (Used => 3));
   Check (Locale, "label.forms.character_count_label", Phrase,
          Humanize.Forms.Localized.Character_Count_Label (C, Used => 1),
          Humanize.Forms.Character_Count_Label (Used => 1));
   Check (Locale, "label.forms.character_limit_label", Phrase,
          Humanize.Forms.Localized.Character_Limit_Label (C, Limit => 3),
          Humanize.Forms.Character_Limit_Label (Limit => 3));
   Check (Locale, "label.forms.character_limit_label", Phrase,
          Humanize.Forms.Localized.Character_Limit_Label (C, Limit => 1),
          Humanize.Forms.Character_Limit_Label (Limit => 1));
   Check (Locale, "label.forms.character_usage_label", Phrase,
          Humanize.Forms.Localized.Character_Usage_Label (C, Used => 3, Limit => 3),
          Humanize.Forms.Character_Usage_Label (Used => 3, Limit => 3));
   Check (Locale, "label.forms.character_usage_label", Phrase,
          Humanize.Forms.Localized.Character_Usage_Label (C, Used => 1, Limit => 1),
          Humanize.Forms.Character_Usage_Label (Used => 1, Limit => 1));
   Check (Locale, "label.forms.field_label", Phrase,
          Humanize.Forms.Localized.Field_Label (C, Name => "plain", Required => False),
          Humanize.Forms.Field_Label (Name => "plain", Required => False));
   Check (Locale, "label.forms.field_label", Phrase,
          Humanize.Forms.Localized.Field_Label (C, Name => "plain", Required => True),
          Humanize.Forms.Field_Label (Name => "plain", Required => True));
   Check (Locale, "label.forms.field_label", Prefix,
          Humanize.Forms.Localized.Field_Label (C, Name => "plain", Required => False, Options =>
            (Humanize.Forms.Default_Form_Label_Options with delta Include_Surface => True)),
          Humanize.Forms.Field_Label (Name => "plain", Required => False, Options =>
            (Humanize.Forms.Default_Form_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.forms.field_state_label", Phrase,
          Humanize.Forms.Localized.Field_State_Label (C, Name => "plain", State => Humanize.Forms.Valid_Input),
          Humanize.Forms.Field_State_Label (Name => "plain", State => Humanize.Forms.Valid_Input));
   Check (Locale, "label.forms.field_state_label", Phrase,
          Humanize.Forms.Localized.Field_State_Label (C, Name => "plain", State => Humanize.Forms.Read_Only_Input),
          Humanize.Forms.Field_State_Label (Name => "plain", State => Humanize.Forms.Read_Only_Input));
   Check (Locale, "label.forms.field_state_label", Prefix,
          Humanize.Forms.Localized.Field_State_Label (C, Name => "plain", State => Humanize.Forms.Valid_Input,
            Options => (Humanize.Forms.Default_Form_Label_Options with delta Include_Surface => True)),
          Humanize.Forms.Field_State_Label (Name => "plain", State => Humanize.Forms.Valid_Input, Options =>
            (Humanize.Forms.Default_Form_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.forms.form_error_summary_label", Phrase,
          Humanize.Forms.Localized.Form_Error_Summary_Label (C, Errors => 3, Warnings => 3),
          Humanize.Forms.Form_Error_Summary_Label (Errors => 3, Warnings => 3));
   Check (Locale, "label.forms.form_error_summary_label", Phrase,
          Humanize.Forms.Localized.Form_Error_Summary_Label (C, Errors => 1, Warnings => 1),
          Humanize.Forms.Form_Error_Summary_Label (Errors => 1, Warnings => 1));
   Check (Locale, "label.forms.form_progress_label", Phrase,
          Humanize.Forms.Localized.Form_Progress_Label (C, Completed => 7, Total => 9),
          Humanize.Forms.Form_Progress_Label (Completed => 7, Total => 9));
   Check (Locale, "label.forms.form_progress_label", Phrase,
          Humanize.Forms.Localized.Form_Progress_Label (C, Completed => 1, Total => 2),
          Humanize.Forms.Form_Progress_Label (Completed => 1, Total => 2));
   Check (Locale, "label.forms.form_state_label", Phrase,
          Humanize.Forms.Localized.Form_State_Label (C, State => Humanize.Forms.Pristine_Form),
          Humanize.Forms.Form_State_Label (State => Humanize.Forms.Pristine_Form));
   Check (Locale, "label.forms.form_state_label", Phrase,
          Humanize.Forms.Localized.Form_State_Label (C, State => Humanize.Forms.Failed_Form),
          Humanize.Forms.Form_State_Label (State => Humanize.Forms.Failed_Form));
   Check (Locale, "label.forms.form_step_label", Phrase,
          Humanize.Forms.Localized.Form_Step_Label (C, Current => 7, Total => 9, Name => "plain"),
          Humanize.Forms.Form_Step_Label (Current => 7, Total => 9, Name => "plain"));
   Check (Locale, "label.forms.form_step_label", Phrase,
          Humanize.Forms.Localized.Form_Step_Label (C, Current => 2, Total => 0, Name => "plain"),
          Humanize.Forms.Form_Step_Label (Current => 2, Total => 0, Name => "plain"));
   Check (Locale, "label.forms.input_state_label", Phrase,
          Humanize.Forms.Localized.Input_State_Label (C, State => Humanize.Forms.Valid_Input),
          Humanize.Forms.Input_State_Label (State => Humanize.Forms.Valid_Input));
   Check (Locale, "label.forms.input_state_label", Phrase,
          Humanize.Forms.Localized.Input_State_Label (C, State => Humanize.Forms.Read_Only_Input),
          Humanize.Forms.Input_State_Label (State => Humanize.Forms.Read_Only_Input));
   Check (Locale, "label.forms.remaining_characters_label", Phrase,
          Humanize.Forms.Localized.Remaining_Characters_Label (C, Used => 7, Limit => 9),
          Humanize.Forms.Remaining_Characters_Label (Used => 7, Limit => 9));
   Check (Locale, "label.forms.remaining_characters_label", Phrase,
          Humanize.Forms.Localized.Remaining_Characters_Label (C, Used => 2, Limit => 0),
          Humanize.Forms.Remaining_Characters_Label (Used => 2, Limit => 0));
   Check (Locale, "label.forms.required_fields_label", Phrase,
          Humanize.Forms.Localized.Required_Fields_Label (C, Missing => 7, Total => 9),
          Humanize.Forms.Required_Fields_Label (Missing => 7, Total => 9));
   Check (Locale, "label.forms.required_fields_label", Phrase,
          Humanize.Forms.Localized.Required_Fields_Label (C, Missing => 1, Total => 2),
          Humanize.Forms.Required_Fields_Label (Missing => 1, Total => 2));
   Check (Locale, "label.forms.section_progress_label", Phrase,
          Humanize.Forms.Localized.Section_Progress_Label (C, Name => "plain", Completed => 7, Total => 9),
          Humanize.Forms.Section_Progress_Label (Name => "plain", Completed => 7, Total => 9));
   Check (Locale, "label.forms.section_progress_label", Phrase,
          Humanize.Forms.Localized.Section_Progress_Label (C, Name => "plain", Completed => 1, Total => 2),
          Humanize.Forms.Section_Progress_Label (Name => "plain", Completed => 1, Total => 2));
   Check (Locale, "label.forms.submission_label", Phrase,
          Humanize.Forms.Localized.Submission_Label (C, State => Humanize.Forms.Pristine_Form, Errors => 3),
          Humanize.Forms.Submission_Label (State => Humanize.Forms.Pristine_Form, Errors => 3));
   Check (Locale, "label.forms.submission_label", Phrase,
          Humanize.Forms.Localized.Submission_Label (C, State => Humanize.Forms.Failed_Form, Errors => 1),
          Humanize.Forms.Submission_Label (State => Humanize.Forms.Failed_Form, Errors => 1));
   Check (Locale, "label.forms.submission_label", Prefix,
          Humanize.Forms.Localized.Submission_Label (C, State => Humanize.Forms.Pristine_Form, Errors => 3, Options
            => (Humanize.Forms.Default_Form_Label_Options with delta Include_Surface => True)),
          Humanize.Forms.Submission_Label (State => Humanize.Forms.Pristine_Form, Errors => 3, Options =>
            (Humanize.Forms.Default_Form_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.forms.unsaved_changes_label", Phrase,
          Humanize.Forms.Localized.Unsaved_Changes_Label (C, Count => 3),
          Humanize.Forms.Unsaved_Changes_Label (Count => 3));
   Check (Locale, "label.forms.unsaved_changes_label", Phrase,
          Humanize.Forms.Localized.Unsaved_Changes_Label (C, Count => 1),
          Humanize.Forms.Unsaved_Changes_Label (Count => 1));
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
   Check (Locale, "label.markup.accessible_control_label", Phrase,
          Humanize.Markup.Localized.Accessible_Control_Label (C, Name => "Save", Role =>
            Humanize.Markup.Button_Control),
          Humanize.Markup.Accessible_Control_Label (Name => "Save", Role => Humanize.Markup.Button_Control));
   Check (Locale, "label.markup.accessible_control_label", Phrase,
          Humanize.Markup.Localized.Accessible_Control_Label (C, Name => "", Role => Humanize.Markup.Tab_Control,
            State => (Selected => True, Current => True, others => <>)),
          Humanize.Markup.Accessible_Control_Label (Name => "", Role => Humanize.Markup.Tab_Control, State =>
            (Selected => True, Current => True, others => <>)));
   Check (Locale, "label.markup.accessible_control_label", Phrase,
          Humanize.Markup.Localized.Accessible_Control_Label (C, Name => "Inbox", Role =>
            Humanize.Markup.Region_Control, State => (Count => 3, Position => 2, Total => 5, Issues => 1, others =>
            <>)),
          Humanize.Markup.Accessible_Control_Label (Name => "Inbox", Role => Humanize.Markup.Region_Control, State
            => (Count => 3, Position => 2, Total => 5, Issues => 1, others => <>)));
   Check (Locale, "label.markup.attribute_count_label", Phrase,
          Humanize.Markup.Localized.Attribute_Count_Label (C, Total => 7, Data => 9, Aria => 4, Events => 6),
          Humanize.Markup.Attribute_Count_Label (Total => 7, Data => 9, Aria => 4, Events => 6));
   Check (Locale, "label.markup.attribute_count_label", Phrase,
          Humanize.Markup.Localized.Attribute_Count_Label (C, Total => 2, Data => 0, Aria => 0, Events => 0),
          Humanize.Markup.Attribute_Count_Label (Total => 2, Data => 0, Aria => 0, Events => 0));
   Check (Locale, "label.markup.attribute_kind_label", Phrase,
          Humanize.Markup.Localized.Attribute_Kind_Label (C, Kind => Humanize.Markup.Id_Attribute),
          Humanize.Markup.Attribute_Kind_Label (Kind => Humanize.Markup.Id_Attribute));
   Check (Locale, "label.markup.attribute_kind_label", Phrase,
          Humanize.Markup.Localized.Attribute_Kind_Label (C, Kind => Humanize.Markup.Unknown_Attribute),
          Humanize.Markup.Attribute_Kind_Label (Kind => Humanize.Markup.Unknown_Attribute));
   Check (Locale, "label.markup.attribute_label", Phrase,
          Humanize.Markup.Localized.Attribute_Label (C, Name => "href"),
          Humanize.Markup.Attribute_Label (Name => "href"));
   Check (Locale, "label.markup.attribute_label", Phrase,
          Humanize.Markup.Localized.Attribute_Label (C, Name => "onclick", Value => "go()"),
          Humanize.Markup.Attribute_Label (Name => "onclick", Value => "go()"));
   Check (Locale, "label.markup.attribute_label", Phrase,
          Humanize.Markup.Localized.Attribute_Label (C, Name => "Title", Value => "Hi"),
          Humanize.Markup.Attribute_Label (Name => "Title", Value => "Hi"));
   Check (Locale, "label.markup.attribute_label", Prefix,
          Humanize.Markup.Localized.Attribute_Label (C, Name => "href", Options =>
            (Humanize.Markup.Default_Markup_Label_Options with delta Include_Surface => True)),
          Humanize.Markup.Attribute_Label (Name => "href", Options => (Humanize.Markup.Default_Markup_Label_Options
            with delta Include_Surface => True)));
   Check (Locale, "label.markup.content_type_label", Phrase,
          Humanize.Markup.Localized.Content_Type_Label (C, "text/html; charset=utf-8"),
          Humanize.Markup.Content_Type_Label ("text/html; charset=utf-8"));
   Check (Locale, "label.markup.content_type_label", Phrase,
          Humanize.Markup.Localized.Content_Type_Label (C, "application/json"),
          Humanize.Markup.Content_Type_Label ("application/json"));
   Check (Locale, "label.markup.content_type_label", Phrase,
          Humanize.Markup.Localized.Content_Type_Label (C, "image/png"),
          Humanize.Markup.Content_Type_Label ("image/png"));
   Check (Locale, "label.markup.content_type_label", Prefix,
          Humanize.Markup.Localized.Content_Type_Label (C, "text/html; charset=utf-8", Options =>
            (Humanize.Markup.Default_Markup_Label_Options with delta Include_Surface => True)),
          Humanize.Markup.Content_Type_Label ("text/html; charset=utf-8", Options =>
            (Humanize.Markup.Default_Markup_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.markup.document_outline_label", Phrase,
          Humanize.Markup.Localized.Document_Outline_Label (C, Headings => 7, Landmarks => 9, Forms => 4, Media =>
            6),
          Humanize.Markup.Document_Outline_Label (Headings => 7, Landmarks => 9, Forms => 4, Media => 6));
   Check (Locale, "label.markup.document_outline_label", Phrase,
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
   Check (Locale, "label.markup.tag_count_label", Phrase,
          Humanize.Markup.Localized.Tag_Count_Label (C, Total => 7, Links => 9, Media => 4, Forms => 6),
          Humanize.Markup.Tag_Count_Label (Total => 7, Links => 9, Media => 4, Forms => 6));
   Check (Locale, "label.markup.tag_count_label", Phrase,
          Humanize.Markup.Localized.Tag_Count_Label (C, Total => 2, Links => 0, Media => 0, Forms => 0),
          Humanize.Markup.Tag_Count_Label (Total => 2, Links => 0, Media => 0, Forms => 0));
   Check (Locale, "label.markup.tag_kind_label", Phrase,
          Humanize.Markup.Localized.Tag_Kind_Label (C, Kind => Humanize.Markup.Document_Tag),
          Humanize.Markup.Tag_Kind_Label (Kind => Humanize.Markup.Document_Tag));
   Check (Locale, "label.markup.tag_kind_label", Phrase,
          Humanize.Markup.Localized.Tag_Kind_Label (C, Kind => Humanize.Markup.Unknown_Tag),
          Humanize.Markup.Tag_Kind_Label (Kind => Humanize.Markup.Unknown_Tag));
   Check (Locale, "label.markup.tag_label", Phrase,
          Humanize.Markup.Localized.Tag_Label (C, "a"),
          Humanize.Markup.Tag_Label ("a"));
   Check (Locale, "label.markup.tag_label", Phrase,
          Humanize.Markup.Localized.Tag_Label (C, "<img/>"),
          Humanize.Markup.Tag_Label ("<img/>"));
   Check (Locale, "label.markup.tag_label", Phrase,
          Humanize.Markup.Localized.Tag_Label (C, "h3"),
          Humanize.Markup.Tag_Label ("h3"));
   Check (Locale, "label.markup.tag_label", Prefix,
          Humanize.Markup.Localized.Tag_Label (C, "a", Options => (Humanize.Markup.Default_Markup_Label_Options with
            delta Include_Surface => True)),
          Humanize.Markup.Tag_Label ("a", Options => (Humanize.Markup.Default_Markup_Label_Options with delta
            Include_Surface => True)));
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
end Check_Group_4;
