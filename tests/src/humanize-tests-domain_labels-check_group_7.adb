with Humanize.Secrets;
with Humanize.Strings.Metrics;
with Humanize.Strings.Privacy;
with Humanize.Tables;
with Humanize.Tasks;
with Humanize.Secrets.Localized;
with Humanize.Strings.Metrics.Localized;
with Humanize.Strings.Privacy.Localized;
with Humanize.Tables.Localized;
with Humanize.Tasks.Localized;

separate (Humanize.Tests.Domain_Labels)
procedure Check_Group_7 (Locale : String; C : Humanize.Contexts.Context) is
begin
   Check (Locale, "label.secrets.credential_source_label", Phrase,
          Humanize.Secrets.Localized.Credential_Source_Label (C, Source => "plain", Count => 3),
          Humanize.Secrets.Credential_Source_Label (Source => "plain", Count => 3));
   Check (Locale, "label.secrets.credential_source_label", Phrase,
          Humanize.Secrets.Localized.Credential_Source_Label (C, Source => "plain", Count => 1),
          Humanize.Secrets.Credential_Source_Label (Source => "plain", Count => 1));
   Check (Locale, "label.secrets.environment_secret_label", Phrase,
          Humanize.Secrets.Localized.Environment_Secret_Label (C, Name => "GITHUB_TOKEN", Value =>
            "ghp_1234567890abcdef"),
          Humanize.Secrets.Environment_Secret_Label (Name => "GITHUB_TOKEN", Value => "ghp_1234567890abcdef"));
   Check (Locale, "label.secrets.environment_secret_label", Phrase,
          Humanize.Secrets.Localized.Environment_Secret_Label (C, Name => "DB_PASSWORD", Value => ""),
          Humanize.Secrets.Environment_Secret_Label (Name => "DB_PASSWORD", Value => ""));
   Check (Locale, "label.secrets.exposure_label", Phrase,
          Humanize.Secrets.Localized.Exposure_Label (C, Exposure => Humanize.Secrets.Hidden_Value),
          Humanize.Secrets.Exposure_Label (Exposure => Humanize.Secrets.Hidden_Value));
   Check (Locale, "label.secrets.exposure_label", Phrase,
          Humanize.Secrets.Localized.Exposure_Label (C, Exposure => Humanize.Secrets.Fingerprint_Only),
          Humanize.Secrets.Exposure_Label (Exposure => Humanize.Secrets.Fingerprint_Only));
   Check (Locale, "label.secrets.fingerprint_label", Phrase,
          Humanize.Secrets.Localized.Fingerprint_Label (C, Algorithm => "SHA256", Value =>
            "AB:CD:EF:01:23:45:67:89:AB"),
          Humanize.Secrets.Fingerprint_Label (Algorithm => "SHA256", Value => "AB:CD:EF:01:23:45:67:89:AB"));
   Check (Locale, "label.secrets.header_credential_label", Phrase,
          Humanize.Secrets.Localized.Header_Credential_Label (C, Name => "Authorization", Value =>
            "Bearer abc.def.ghi"),
          Humanize.Secrets.Header_Credential_Label (Name => "Authorization", Value => "Bearer abc.def.ghi"));
   Check (Locale, "label.secrets.header_credential_label", Phrase,
          Humanize.Secrets.Localized.Header_Credential_Label (C, Name => "X-Api-Key", Value => ""),
          Humanize.Secrets.Header_Credential_Label (Name => "X-Api-Key", Value => ""));
   Check (Locale, "label.secrets.privacy_profile_label", Phrase,
          Humanize.Secrets.Localized.Privacy_Profile_Label (C, Profile => Humanize.Secrets.Public_Profile),
          Humanize.Secrets.Privacy_Profile_Label (Profile => Humanize.Secrets.Public_Profile));
   Check (Locale, "label.secrets.privacy_profile_label", Phrase,
          Humanize.Secrets.Localized.Privacy_Profile_Label (C, Profile => Humanize.Secrets.Debug_Profile),
          Humanize.Secrets.Privacy_Profile_Label (Profile => Humanize.Secrets.Debug_Profile));
   Check (Locale, "label.secrets.rotation_status_label", Phrase,
          Humanize.Secrets.Localized.Rotation_Status_Label (C, Needs_Rotation => False, Days_Old => 3),
          Humanize.Secrets.Rotation_Status_Label (Needs_Rotation => False, Days_Old => 3));
   Check (Locale, "label.secrets.rotation_status_label", Phrase,
          Humanize.Secrets.Localized.Rotation_Status_Label (C, Needs_Rotation => True, Days_Old => 1),
          Humanize.Secrets.Rotation_Status_Label (Needs_Rotation => True, Days_Old => 1));
   Check (Locale, "label.secrets.safe_display_label", Phrase,
          Humanize.Secrets.Localized.Safe_Display_Label (C, Kind => Humanize.Secrets.Email_Value, Value =>
            "jane.doe@example.com/12345678", Profile => Humanize.Secrets.Public_Profile),
          Humanize.Secrets.Safe_Display_Label (Kind => Humanize.Secrets.Email_Value, Value =>
            "jane.doe@example.com/12345678", Profile => Humanize.Secrets.Public_Profile));
   Check (Locale, "label.secrets.safe_display_label", Phrase,
          Humanize.Secrets.Localized.Safe_Display_Label (C, Kind => Humanize.Secrets.Email_Value, Value =>
            "jane.doe@example.com/12345678", Profile => Humanize.Secrets.Support_Profile),
          Humanize.Secrets.Safe_Display_Label (Kind => Humanize.Secrets.Email_Value, Value =>
            "jane.doe@example.com/12345678", Profile => Humanize.Secrets.Support_Profile));
   Check (Locale, "label.secrets.safe_display_label", Phrase,
          Humanize.Secrets.Localized.Safe_Display_Label (C, Kind => Humanize.Secrets.Email_Value, Value =>
            "jane.doe@example.com/12345678", Profile => Humanize.Secrets.Audit_Profile),
          Humanize.Secrets.Safe_Display_Label (Kind => Humanize.Secrets.Email_Value, Value =>
            "jane.doe@example.com/12345678", Profile => Humanize.Secrets.Audit_Profile));
   Check (Locale, "label.secrets.secret_count_label", Phrase,
          Humanize.Secrets.Localized.Secret_Count_Label (C, Total => 7, Masked => 9, Unset => 4, Fingerprints => 6),
          Humanize.Secrets.Secret_Count_Label (Total => 7, Masked => 9, Unset => 4, Fingerprints => 6));
   Check (Locale, "label.secrets.secret_count_label", Phrase,
          Humanize.Secrets.Localized.Secret_Count_Label (C, Total => 2, Masked => 0, Unset => 0, Fingerprints => 0),
          Humanize.Secrets.Secret_Count_Label (Total => 2, Masked => 0, Unset => 0, Fingerprints => 0));
   Check (Locale, "label.secrets.secret_kind_label", Phrase,
          Humanize.Secrets.Localized.Secret_Kind_Label (C, Kind => Humanize.Secrets.Api_Key),
          Humanize.Secrets.Secret_Kind_Label (Kind => Humanize.Secrets.Api_Key));
   Check (Locale, "label.secrets.secret_kind_label", Phrase,
          Humanize.Secrets.Localized.Secret_Kind_Label (C, Kind => Humanize.Secrets.Unknown_Secret),
          Humanize.Secrets.Secret_Kind_Label (Kind => Humanize.Secrets.Unknown_Secret));
   Check (Locale, "label.secrets.secret_label", Phrase,
          Humanize.Secrets.Localized.Secret_Label (C, Name => "API_KEY", Value => "sk_live_abcdef123456"),
          Humanize.Secrets.Secret_Label (Name => "API_KEY", Value => "sk_live_abcdef123456"));
   Check (Locale, "label.secrets.secret_label", Phrase,
          Humanize.Secrets.Localized.Secret_Label (C, Name => "API_KEY", Value => ""),
          Humanize.Secrets.Secret_Label (Name => "API_KEY", Value => ""));
   Check (Locale, "label.secrets.secret_label", Phrase,
          Humanize.Secrets.Localized.Secret_Label (C, Name => "TOKEN", Value => "abcdef123456", Exposure =>
            Humanize.Secrets.Hidden_Value),
          Humanize.Secrets.Secret_Label (Name => "TOKEN", Value => "abcdef123456", Exposure =>
            Humanize.Secrets.Hidden_Value));
   Check (Locale, "label.secrets.secret_label", Prefix,
          Humanize.Secrets.Localized.Secret_Label (C, Name => "API_KEY", Value => "sk_live_abcdef123456", Options =>
            (Humanize.Secrets.Default_Secret_Label_Options with delta Include_Surface => True)),
          Humanize.Secrets.Secret_Label (Name => "API_KEY", Value => "sk_live_abcdef123456", Options =>
            (Humanize.Secrets.Default_Secret_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.secrets.sensitive_value_kind_label", Phrase,
          Humanize.Secrets.Localized.Sensitive_Value_Kind_Label (C, Kind => Humanize.Secrets.Email_Value),
          Humanize.Secrets.Sensitive_Value_Kind_Label (Kind => Humanize.Secrets.Email_Value));
   Check (Locale, "label.secrets.sensitive_value_kind_label", Phrase,
          Humanize.Secrets.Localized.Sensitive_Value_Kind_Label (C, Kind =>
            Humanize.Secrets.Unknown_Sensitive_Value),
          Humanize.Secrets.Sensitive_Value_Kind_Label (Kind => Humanize.Secrets.Unknown_Sensitive_Value));
   Check (Locale, "label.metrics.paragraph_count_summary", Phrase,
          Humanize.Strings.Metrics.Localized.Paragraph_Count_Summary (C,
            "The quick brown fox jumps. It runs far away!" & ASCII.LF & ASCII.LF & "A second paragraph."),
          Humanize.Strings.Metrics.Paragraph_Count_Summary ("The quick brown fox jumps. It runs far away!" &
            ASCII.LF & ASCII.LF & "A second paragraph."));
   Check (Locale, "label.metrics.paragraph_count_summary", Phrase,
          Humanize.Strings.Metrics.Localized.Paragraph_Count_Summary (C, "One word."),
          Humanize.Strings.Metrics.Paragraph_Count_Summary ("One word."));
   Check (Locale, "label.metrics.reading_time", Phrase,
          Humanize.Strings.Metrics.Localized.Reading_Time (C, "The quick brown fox jumps. It runs far away!" &
            ASCII.LF & ASCII.LF & "A second paragraph."),
          Humanize.Strings.Metrics.Reading_Time ("The quick brown fox jumps. It runs far away!" & ASCII.LF &
            ASCII.LF & "A second paragraph."));
   Check (Locale, "label.metrics.reading_time", Phrase,
          Humanize.Strings.Metrics.Localized.Reading_Time (C, "One word."),
          Humanize.Strings.Metrics.Reading_Time ("One word."));
   Check (Locale, "label.metrics.sentence_count_summary", Phrase,
          Humanize.Strings.Metrics.Localized.Sentence_Count_Summary (C,
            "The quick brown fox jumps. It runs far away!" & ASCII.LF & ASCII.LF & "A second paragraph."),
          Humanize.Strings.Metrics.Sentence_Count_Summary ("The quick brown fox jumps. It runs far away!" & ASCII.LF
            & ASCII.LF & "A second paragraph."));
   Check (Locale, "label.metrics.sentence_count_summary", Phrase,
          Humanize.Strings.Metrics.Localized.Sentence_Count_Summary (C, "One word."),
          Humanize.Strings.Metrics.Sentence_Count_Summary ("One word."));
   Check (Locale, "label.metrics.speaking_time", Phrase,
          Humanize.Strings.Metrics.Localized.Speaking_Time (C, "The quick brown fox jumps. It runs far away!" &
            ASCII.LF & ASCII.LF & "A second paragraph."),
          Humanize.Strings.Metrics.Speaking_Time ("The quick brown fox jumps. It runs far away!" & ASCII.LF &
            ASCII.LF & "A second paragraph."));
   Check (Locale, "label.metrics.speaking_time", Phrase,
          Humanize.Strings.Metrics.Localized.Speaking_Time (C, "One word."),
          Humanize.Strings.Metrics.Speaking_Time ("One word."));
   Check (Locale, "label.metrics.text_summary", Phrase,
          Humanize.Strings.Metrics.Localized.Text_Summary (C, "The quick brown fox jumps. It runs far away!" &
            ASCII.LF & ASCII.LF & "A second paragraph."),
          Humanize.Strings.Metrics.Text_Summary ("The quick brown fox jumps. It runs far away!" & ASCII.LF &
            ASCII.LF & "A second paragraph."));
   Check (Locale, "label.metrics.text_summary", Phrase,
          Humanize.Strings.Metrics.Localized.Text_Summary (C, "One word."),
          Humanize.Strings.Metrics.Text_Summary ("One word."));
   Check (Locale, "label.metrics.text_summary_with_options", Phrase,
          Humanize.Strings.Metrics.Localized.Text_Summary_With_Options (C,
            "The quick brown fox jumps. It runs far away!" & ASCII.LF & ASCII.LF & "A second paragraph."),
          Humanize.Strings.Metrics.Text_Summary_With_Options ("The quick brown fox jumps. It runs far away!" &
            ASCII.LF & ASCII.LF & "A second paragraph."));
   Check (Locale, "label.metrics.text_summary_with_options", Phrase,
          Humanize.Strings.Metrics.Localized.Text_Summary_With_Options (C, "One word."),
          Humanize.Strings.Metrics.Text_Summary_With_Options ("One word."));
   Check (Locale, "label.metrics.word_count_summary", Phrase,
          Humanize.Strings.Metrics.Localized.Word_Count_Summary (C, "The quick brown fox jumps. It runs far away!" &
            ASCII.LF & ASCII.LF & "A second paragraph."),
          Humanize.Strings.Metrics.Word_Count_Summary ("The quick brown fox jumps. It runs far away!" & ASCII.LF &
            ASCII.LF & "A second paragraph."));
   Check (Locale, "label.metrics.word_count_summary", Phrase,
          Humanize.Strings.Metrics.Localized.Word_Count_Summary (C, "One word."),
          Humanize.Strings.Metrics.Word_Count_Summary ("One word."));
   Check (Locale, "label.privacy.address_metadata_label", Phrase,
          Humanize.Strings.Privacy.Localized.Address_Metadata_Label (C, Address => (others => <>)),
          Humanize.Strings.Privacy.Address_Metadata_Label (Address => (others => <>)));
   Check (Locale, "label.privacy.address_metadata_label", Phrase,
          Humanize.Strings.Privacy.Localized.Address_Metadata_Label (C, Address => (Name => [others => 'J'],
            Name_Length => 4, City => [others => 'O'], City_Length => 4, others => <>)),
          Humanize.Strings.Privacy.Address_Metadata_Label (Address => (Name => [others => 'J'], Name_Length => 4,
            City => [others => 'O'], City_Length => 4, others => <>)));
   Check (Locale, "label.privacy.code_symbol_label", Phrase,
          Humanize.Strings.Privacy.Localized.Code_Symbol_Label (C, "Foo.Bar_Baz"),
          Humanize.Strings.Privacy.Code_Symbol_Label ("Foo.Bar_Baz"));
   Check (Locale, "label.privacy.code_symbol_label", Phrase,
          Humanize.Strings.Privacy.Localized.Code_Symbol_Label (C, ""),
          Humanize.Strings.Privacy.Code_Symbol_Label (""));
   Check (Locale, "label.privacy.safe_email_label", Phrase,
          Humanize.Strings.Privacy.Localized.Safe_Email_Label (C, "jane@example.com"),
          Humanize.Strings.Privacy.Safe_Email_Label ("jane@example.com"));
   Check (Locale, "label.privacy.safe_email_label", Phrase,
          Humanize.Strings.Privacy.Localized.Safe_Email_Label (C, ""),
          Humanize.Strings.Privacy.Safe_Email_Label (""));
   Check (Locale, "label.privacy.safe_email_label", Phrase,
          Humanize.Strings.Privacy.Localized.Safe_Email_Label (C, "jane"),
          Humanize.Strings.Privacy.Safe_Email_Label ("jane"));
   Check (Locale, "label.privacy.safe_handle_label", Phrase,
          Humanize.Strings.Privacy.Localized.Safe_Handle_Label (C, "@janedoe"),
          Humanize.Strings.Privacy.Safe_Handle_Label ("@janedoe"));
   Check (Locale, "label.privacy.safe_handle_label", Phrase,
          Humanize.Strings.Privacy.Localized.Safe_Handle_Label (C, ""),
          Humanize.Strings.Privacy.Safe_Handle_Label (""));
   Check (Locale, "label.privacy.safe_handle_label", Phrase,
          Humanize.Strings.Privacy.Localized.Safe_Handle_Label (C, "@ab"),
          Humanize.Strings.Privacy.Safe_Handle_Label ("@ab"));
   Check (Locale, "label.privacy.safe_phone_label", Phrase,
          Humanize.Strings.Privacy.Localized.Safe_Phone_Label (C, "+45 12 34 56 78"),
          Humanize.Strings.Privacy.Safe_Phone_Label ("+45 12 34 56 78"));
   Check (Locale, "label.privacy.safe_phone_label", Phrase,
          Humanize.Strings.Privacy.Localized.Safe_Phone_Label (C, "none"),
          Humanize.Strings.Privacy.Safe_Phone_Label ("none"));
   Check (Locale, "label.privacy.safe_phone_label", Phrase,
          Humanize.Strings.Privacy.Localized.Safe_Phone_Label (C, Phone => "12345678", Visible_Digits => 0),
          Humanize.Strings.Privacy.Safe_Phone_Label (Phone => "12345678", Visible_Digits => 0));
   Check (Locale, "label.tables.cell_label", Phrase,
          Humanize.Tables.Localized.Cell_Label (C, Row => 3, Column => 3, State => Humanize.Tables.Empty_Cell),
          Humanize.Tables.Cell_Label (Row => 3, Column => 3, State => Humanize.Tables.Empty_Cell));
   Check (Locale, "label.tables.cell_label", Phrase,
          Humanize.Tables.Localized.Cell_Label (C, Row => 1, Column => 1, State => Humanize.Tables.Read_Only_Cell),
          Humanize.Tables.Cell_Label (Row => 1, Column => 1, State => Humanize.Tables.Read_Only_Cell));
   Check (Locale, "label.tables.cell_label", Prefix,
          Humanize.Tables.Localized.Cell_Label (C, Row => 3, Column => 3, State => Humanize.Tables.Empty_Cell,
            Options => (Humanize.Tables.Default_Table_Label_Options with delta Include_Surface => True)),
          Humanize.Tables.Cell_Label (Row => 3, Column => 3, State => Humanize.Tables.Empty_Cell, Options =>
            (Humanize.Tables.Default_Table_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.tables.cell_position_label", Phrase,
          Humanize.Tables.Localized.Cell_Position_Label (C, Row => 3, Column => 3),
          Humanize.Tables.Cell_Position_Label (Row => 3, Column => 3));
   Check (Locale, "label.tables.cell_position_label", Phrase,
          Humanize.Tables.Localized.Cell_Position_Label (C, Row => 1, Column => 1),
          Humanize.Tables.Cell_Position_Label (Row => 1, Column => 1));
   Check (Locale, "label.tables.cell_state_label", Phrase,
          Humanize.Tables.Localized.Cell_State_Label (C, State => Humanize.Tables.Empty_Cell),
          Humanize.Tables.Cell_State_Label (State => Humanize.Tables.Empty_Cell));
   Check (Locale, "label.tables.cell_state_label", Phrase,
          Humanize.Tables.Localized.Cell_State_Label (C, State => Humanize.Tables.Read_Only_Cell),
          Humanize.Tables.Cell_State_Label (State => Humanize.Tables.Read_Only_Cell));
   Check (Locale, "label.tables.column_count_label", Phrase,
          Humanize.Tables.Localized.Column_Count_Label (C, Count => 3),
          Humanize.Tables.Column_Count_Label (Count => 3));
   Check (Locale, "label.tables.column_count_label", Phrase,
          Humanize.Tables.Localized.Column_Count_Label (C, Count => 1),
          Humanize.Tables.Column_Count_Label (Count => 1));
   Check (Locale, "label.tables.column_label", Phrase,
          Humanize.Tables.Localized.Column_Label (C, Name => "plain", Role => Humanize.Tables.Text_Column),
          Humanize.Tables.Column_Label (Name => "plain", Role => Humanize.Tables.Text_Column));
   Check (Locale, "label.tables.column_label", Phrase,
          Humanize.Tables.Localized.Column_Label (C, Name => "plain", Role => Humanize.Tables.Hidden_Column),
          Humanize.Tables.Column_Label (Name => "plain", Role => Humanize.Tables.Hidden_Column));
   Check (Locale, "label.tables.column_role_label", Phrase,
          Humanize.Tables.Localized.Column_Role_Label (C, Role => Humanize.Tables.Text_Column),
          Humanize.Tables.Column_Role_Label (Role => Humanize.Tables.Text_Column));
   Check (Locale, "label.tables.column_role_label", Phrase,
          Humanize.Tables.Localized.Column_Role_Label (C, Role => Humanize.Tables.Hidden_Column),
          Humanize.Tables.Column_Role_Label (Role => Humanize.Tables.Hidden_Column));
   Check (Locale, "label.tables.filter_label", Phrase,
          Humanize.Tables.Localized.Filter_Label (C, Visible => 7, Total => 9),
          Humanize.Tables.Filter_Label (Visible => 7, Total => 9));
   Check (Locale, "label.tables.filter_label", Phrase,
          Humanize.Tables.Localized.Filter_Label (C, Visible => 1, Total => 2),
          Humanize.Tables.Filter_Label (Visible => 1, Total => 2));
   Check (Locale, "label.tables.group_label", Phrase,
          Humanize.Tables.Localized.Group_Label (C, Name => "plain", Count => 3),
          Humanize.Tables.Group_Label (Name => "plain", Count => 3));
   Check (Locale, "label.tables.group_label", Phrase,
          Humanize.Tables.Localized.Group_Label (C, Name => "plain", Count => 1),
          Humanize.Tables.Group_Label (Name => "plain", Count => 1));
   Check (Locale, "label.tables.page_label", Phrase,
          Humanize.Tables.Localized.Page_Label (C, Page => 7, Pages => 9, Rows => 4),
          Humanize.Tables.Page_Label (Page => 7, Pages => 9, Rows => 4));
   Check (Locale, "label.tables.page_label", Phrase,
          Humanize.Tables.Localized.Page_Label (C, Page => 2, Pages => 0, Rows => 0),
          Humanize.Tables.Page_Label (Page => 2, Pages => 0, Rows => 0));
   Check (Locale, "label.tables.row_count_label", Phrase,
          Humanize.Tables.Localized.Row_Count_Label (C, Count => 3),
          Humanize.Tables.Row_Count_Label (Count => 3));
   Check (Locale, "label.tables.row_count_label", Phrase,
          Humanize.Tables.Localized.Row_Count_Label (C, Count => 1),
          Humanize.Tables.Row_Count_Label (Count => 1));
   Check (Locale, "label.tables.row_range_label", Phrase,
          Humanize.Tables.Localized.Row_Range_Label (C, First_Row => 2, Last_Row => 2, Total => 4),
          Humanize.Tables.Row_Range_Label (First_Row => 2, Last_Row => 2, Total => 4));
   Check (Locale, "label.tables.row_range_label", Phrase,
          Humanize.Tables.Localized.Row_Range_Label (C, First_Row => 1, Last_Row => 2, Total => 2),
          Humanize.Tables.Row_Range_Label (First_Row => 1, Last_Row => 2, Total => 2));
   Check (Locale, "label.tables.selection_label", Phrase,
          Humanize.Tables.Localized.Selection_Label (C, Selected => 7, Total => 9),
          Humanize.Tables.Selection_Label (Selected => 7, Total => 9));
   Check (Locale, "label.tables.selection_label", Phrase,
          Humanize.Tables.Localized.Selection_Label (C, Selected => 1, Total => 2),
          Humanize.Tables.Selection_Label (Selected => 1, Total => 2));
   Check (Locale, "label.tables.sort_direction_label", Phrase,
          Humanize.Tables.Localized.Sort_Direction_Label (C, Direction => Humanize.Tables.Unsorted),
          Humanize.Tables.Sort_Direction_Label (Direction => Humanize.Tables.Unsorted));
   Check (Locale, "label.tables.sort_direction_label", Phrase,
          Humanize.Tables.Localized.Sort_Direction_Label (C, Direction => Humanize.Tables.Descending_Sort),
          Humanize.Tables.Sort_Direction_Label (Direction => Humanize.Tables.Descending_Sort));
   Check (Locale, "label.tables.sort_label", Phrase,
          Humanize.Tables.Localized.Sort_Label (C, Column_Name => "plain", Direction => Humanize.Tables.Unsorted),
          Humanize.Tables.Sort_Label (Column_Name => "plain", Direction => Humanize.Tables.Unsorted));
   Check (Locale, "label.tables.sort_label", Phrase,
          Humanize.Tables.Localized.Sort_Label (C, Column_Name => "plain", Direction =>
            Humanize.Tables.Descending_Sort),
          Humanize.Tables.Sort_Label (Column_Name => "plain", Direction => Humanize.Tables.Descending_Sort));
   Check (Locale, "label.tables.sort_label", Prefix,
          Humanize.Tables.Localized.Sort_Label (C, Column_Name => "plain", Direction => Humanize.Tables.Unsorted,
            Options => (Humanize.Tables.Default_Table_Label_Options with delta Include_Surface => True)),
          Humanize.Tables.Sort_Label (Column_Name => "plain", Direction => Humanize.Tables.Unsorted, Options =>
            (Humanize.Tables.Default_Table_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.tables.subtotal_label", Phrase,
          Humanize.Tables.Localized.Subtotal_Label (C, Name => "plain", Value => "plain"),
          Humanize.Tables.Subtotal_Label (Name => "plain", Value => "plain"));
   Check (Locale, "label.tables.table_size_label", Phrase,
          Humanize.Tables.Localized.Table_Size_Label (C, Rows => 3, Columns => 3),
          Humanize.Tables.Table_Size_Label (Rows => 3, Columns => 3));
   Check (Locale, "label.tables.table_size_label", Phrase,
          Humanize.Tables.Localized.Table_Size_Label (C, Rows => 1, Columns => 1),
          Humanize.Tables.Table_Size_Label (Rows => 1, Columns => 1));
   Check (Locale, "label.tasks.assignment_label", Phrase,
          Humanize.Tasks.Localized.Assignment_Label (C, Assignee => "plain", State => Humanize.Tasks.Unassigned),
          Humanize.Tasks.Assignment_Label (Assignee => "plain", State => Humanize.Tasks.Unassigned));
   Check (Locale, "label.tasks.assignment_label", Phrase,
          Humanize.Tasks.Localized.Assignment_Label (C, Assignee => "plain", State => Humanize.Tasks.Owned),
          Humanize.Tasks.Assignment_Label (Assignee => "plain", State => Humanize.Tasks.Owned));
   Check (Locale, "label.tasks.assignment_label", Prefix,
          Humanize.Tasks.Localized.Assignment_Label (C, Assignee => "plain", State => Humanize.Tasks.Unassigned,
            Options => (Humanize.Tasks.Default_Task_Label_Options with delta Include_Surface => True)),
          Humanize.Tasks.Assignment_Label (Assignee => "plain", State => Humanize.Tasks.Unassigned, Options =>
            (Humanize.Tasks.Default_Task_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.tasks.assignment_state_label", Phrase,
          Humanize.Tasks.Localized.Assignment_State_Label (C, State => Humanize.Tasks.Unassigned),
          Humanize.Tasks.Assignment_State_Label (State => Humanize.Tasks.Unassigned));
   Check (Locale, "label.tasks.assignment_state_label", Phrase,
          Humanize.Tasks.Localized.Assignment_State_Label (C, State => Humanize.Tasks.Owned),
          Humanize.Tasks.Assignment_State_Label (State => Humanize.Tasks.Owned));
   Check (Locale, "label.tasks.backlog_label", Phrase,
          Humanize.Tasks.Localized.Backlog_Label (C, Count => 3),
          Humanize.Tasks.Backlog_Label (Count => 3));
   Check (Locale, "label.tasks.backlog_label", Phrase,
          Humanize.Tasks.Localized.Backlog_Label (C, Count => 1),
          Humanize.Tasks.Backlog_Label (Count => 1));
   Check (Locale, "label.tasks.blocker_label", Phrase,
          Humanize.Tasks.Localized.Blocker_Label (C, Name => "plain"),
          Humanize.Tasks.Blocker_Label (Name => "plain"));
   Check (Locale, "label.tasks.checklist_label", Phrase,
          Humanize.Tasks.Localized.Checklist_Label (C, Done => 7, Total => 9),
          Humanize.Tasks.Checklist_Label (Done => 7, Total => 9));
   Check (Locale, "label.tasks.checklist_label", Phrase,
          Humanize.Tasks.Localized.Checklist_Label (C, Done => 1, Total => 2),
          Humanize.Tasks.Checklist_Label (Done => 1, Total => 2));
   Check (Locale, "label.tasks.complete_action_label", Phrase,
          Humanize.Tasks.Localized.Complete_Action_Label (C, Count => 3),
          Humanize.Tasks.Complete_Action_Label (Count => 3));
   Check (Locale, "label.tasks.complete_action_label", Phrase,
          Humanize.Tasks.Localized.Complete_Action_Label (C, Count => 1),
          Humanize.Tasks.Complete_Action_Label (Count => 1));
   Check (Locale, "label.tasks.completed_task_count_label", Phrase,
          Humanize.Tasks.Localized.Completed_Task_Count_Label (C, Count => 3),
          Humanize.Tasks.Completed_Task_Count_Label (Count => 3));
   Check (Locale, "label.tasks.completed_task_count_label", Phrase,
          Humanize.Tasks.Localized.Completed_Task_Count_Label (C, Count => 1),
          Humanize.Tasks.Completed_Task_Count_Label (Count => 1));
   Check (Locale, "label.tasks.due_label", Phrase,
          Humanize.Tasks.Localized.Due_Label (C, Due_Text => "plain"),
          Humanize.Tasks.Due_Label (Due_Text => "plain"));
   Check (Locale, "label.tasks.estimate_label", Phrase,
          Humanize.Tasks.Localized.Estimate_Label (C, Estimate_Text => "plain"),
          Humanize.Tasks.Estimate_Label (Estimate_Text => "plain"));
   Check (Locale, "label.tasks.open_task_count_label", Phrase,
          Humanize.Tasks.Localized.Open_Task_Count_Label (C, Count => 3),
          Humanize.Tasks.Open_Task_Count_Label (Count => 3));
   Check (Locale, "label.tasks.open_task_count_label", Phrase,
          Humanize.Tasks.Localized.Open_Task_Count_Label (C, Count => 1),
          Humanize.Tasks.Open_Task_Count_Label (Count => 1));
   Check (Locale, "label.tasks.overdue_label", Phrase,
          Humanize.Tasks.Localized.Overdue_Label (C, Due_Text => "plain"),
          Humanize.Tasks.Overdue_Label (Due_Text => "plain"));
   Check (Locale, "label.tasks.recurring_task_label", Phrase,
          Humanize.Tasks.Localized.Recurring_Task_Label (C, Schedule_Text => "plain"),
          Humanize.Tasks.Recurring_Task_Label (Schedule_Text => "plain"));
   Check (Locale, "label.tasks.reopen_action_label", Phrase,
          Humanize.Tasks.Localized.Reopen_Action_Label (C, Count => 3),
          Humanize.Tasks.Reopen_Action_Label (Count => 3));
   Check (Locale, "label.tasks.reopen_action_label", Phrase,
          Humanize.Tasks.Localized.Reopen_Action_Label (C, Count => 1),
          Humanize.Tasks.Reopen_Action_Label (Count => 1));
   Check (Locale, "label.tasks.sprint_label", Phrase,
          Humanize.Tasks.Localized.Sprint_Label (C, Name => "plain", Count => 3),
          Humanize.Tasks.Sprint_Label (Name => "plain", Count => 3));
   Check (Locale, "label.tasks.sprint_label", Phrase,
          Humanize.Tasks.Localized.Sprint_Label (C, Name => "plain", Count => 1),
          Humanize.Tasks.Sprint_Label (Name => "plain", Count => 1));
   Check (Locale, "label.tasks.subtask_label", Phrase,
          Humanize.Tasks.Localized.Subtask_Label (C, Name => "plain", Count => 3),
          Humanize.Tasks.Subtask_Label (Name => "plain", Count => 3));
   Check (Locale, "label.tasks.subtask_label", Phrase,
          Humanize.Tasks.Localized.Subtask_Label (C, Name => "plain", Count => 1),
          Humanize.Tasks.Subtask_Label (Name => "plain", Count => 1));
   Check (Locale, "label.tasks.task_count_label", Phrase,
          Humanize.Tasks.Localized.Task_Count_Label (C, Count => 3),
          Humanize.Tasks.Task_Count_Label (Count => 3));
   Check (Locale, "label.tasks.task_count_label", Phrase,
          Humanize.Tasks.Localized.Task_Count_Label (C, Count => 1),
          Humanize.Tasks.Task_Count_Label (Count => 1));
   Check (Locale, "label.tasks.task_label", Phrase,
          Humanize.Tasks.Localized.Task_Label (C, Name => "plain", State => Humanize.Tasks.Open_Task, Priority =>
            Humanize.Tasks.No_Priority),
          Humanize.Tasks.Task_Label (Name => "plain", State => Humanize.Tasks.Open_Task, Priority =>
            Humanize.Tasks.No_Priority));
   Check (Locale, "label.tasks.task_label", Phrase,
          Humanize.Tasks.Localized.Task_Label (C, Name => "plain", State => Humanize.Tasks.Overdue_Task, Priority =>
            Humanize.Tasks.Critical_Priority),
          Humanize.Tasks.Task_Label (Name => "plain", State => Humanize.Tasks.Overdue_Task, Priority =>
            Humanize.Tasks.Critical_Priority));
   Check (Locale, "label.tasks.task_label", Prefix,
          Humanize.Tasks.Localized.Task_Label (C, Name => "plain", State => Humanize.Tasks.Open_Task, Priority =>
            Humanize.Tasks.No_Priority, Options => (Humanize.Tasks.Default_Task_Label_Options with delta
            Include_Surface => True)),
          Humanize.Tasks.Task_Label (Name => "plain", State => Humanize.Tasks.Open_Task, Priority =>
            Humanize.Tasks.No_Priority, Options => (Humanize.Tasks.Default_Task_Label_Options with delta
            Include_Surface => True)));
   Check (Locale, "label.tasks.task_priority_label", Phrase,
          Humanize.Tasks.Localized.Task_Priority_Label (C, Priority => Humanize.Tasks.No_Priority),
          Humanize.Tasks.Task_Priority_Label (Priority => Humanize.Tasks.No_Priority));
   Check (Locale, "label.tasks.task_priority_label", Phrase,
          Humanize.Tasks.Localized.Task_Priority_Label (C, Priority => Humanize.Tasks.Critical_Priority),
          Humanize.Tasks.Task_Priority_Label (Priority => Humanize.Tasks.Critical_Priority));
   Check (Locale, "label.tasks.task_state_label", Phrase,
          Humanize.Tasks.Localized.Task_State_Label (C, State => Humanize.Tasks.Open_Task),
          Humanize.Tasks.Task_State_Label (State => Humanize.Tasks.Open_Task));
   Check (Locale, "label.tasks.task_state_label", Phrase,
          Humanize.Tasks.Localized.Task_State_Label (C, State => Humanize.Tasks.Overdue_Task),
          Humanize.Tasks.Task_State_Label (State => Humanize.Tasks.Overdue_Task));
end Check_Group_7;
