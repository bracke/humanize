with Humanize.Schema;
with Humanize.Search;
with Humanize.Secrets;
with Humanize.Strings.Metrics;
with Humanize.Tables;
with Humanize.Schema.Localized;
with Humanize.Search.Localized;
with Humanize.Secrets.Localized;
with Humanize.Strings.Metrics.Localized;
with Humanize.Tables.Localized;

separate (Humanize.Tests.Domain_Labels)
procedure Check_Group_6 (Locale : String; C : Humanize.Contexts.Context) is
begin
   Check (Locale, "label.schema.array_shape_label", Phrase,
          Humanize.Schema.Localized.Array_Shape_Label (C, Element_Type => Humanize.Schema.String_Field, Count => 3,
            Count_Known => False),
          Humanize.Schema.Array_Shape_Label (Element_Type => Humanize.Schema.String_Field, Count => 3, Count_Known
            => False));
   Check (Locale, "label.schema.array_shape_label", Phrase,
          Humanize.Schema.Localized.Array_Shape_Label (C, Element_Type => Humanize.Schema.Unknown_Field_Type, Count
            => 1, Count_Known => True),
          Humanize.Schema.Array_Shape_Label (Element_Type => Humanize.Schema.Unknown_Field_Type, Count => 1,
            Count_Known => True));
   Check (Locale, "label.schema.constraint_label", Phrase,
          Humanize.Schema.Localized.Constraint_Label (C, Name => "plain", Value => "plain"),
          Humanize.Schema.Constraint_Label (Name => "plain", Value => "plain"));
   Check (Locale, "label.schema.default_value_label", Phrase,
          Humanize.Schema.Localized.Default_Value_Label (C, Field_Name => "plain", Value => "plain"),
          Humanize.Schema.Default_Value_Label (Field_Name => "plain", Value => "plain"));
   Check (Locale, "label.schema.deprecated_field_label", Phrase,
          Humanize.Schema.Localized.Deprecated_Field_Label (C, Name => "plain", Replacement => "plain"),
          Humanize.Schema.Deprecated_Field_Label (Name => "plain", Replacement => "plain"));
   Check (Locale, "label.schema.enum_options_label", Phrase,
          Humanize.Schema.Localized.Enum_Options_Label (C, Count => 3),
          Humanize.Schema.Enum_Options_Label (Count => 3));
   Check (Locale, "label.schema.enum_options_label", Phrase,
          Humanize.Schema.Localized.Enum_Options_Label (C, Count => 1),
          Humanize.Schema.Enum_Options_Label (Count => 1));
   Check (Locale, "label.schema.example_value_label", Phrase,
          Humanize.Schema.Localized.Example_Value_Label (C, Field_Name => "plain", Value => "plain"),
          Humanize.Schema.Example_Value_Label (Field_Name => "plain", Value => "plain"));
   Check (Locale, "label.schema.field_state_label", Phrase,
          Humanize.Schema.Localized.Field_State_Label (C, State => Humanize.Schema.Normal_Field),
          Humanize.Schema.Field_State_Label (State => Humanize.Schema.Normal_Field));
   Check (Locale, "label.schema.field_state_label", Phrase,
          Humanize.Schema.Localized.Field_State_Label (C, State => Humanize.Schema.Computed_Field),
          Humanize.Schema.Field_State_Label (State => Humanize.Schema.Computed_Field));
   Check (Locale, "label.schema.field_type_label", Phrase,
          Humanize.Schema.Localized.Field_Type_Label (C, Kind => Humanize.Schema.String_Field),
          Humanize.Schema.Field_Type_Label (Kind => Humanize.Schema.String_Field));
   Check (Locale, "label.schema.field_type_label", Phrase,
          Humanize.Schema.Localized.Field_Type_Label (C, Kind => Humanize.Schema.Unknown_Field_Type),
          Humanize.Schema.Field_Type_Label (Kind => Humanize.Schema.Unknown_Field_Type));
   Check (Locale, "label.schema.missing_required_label", Phrase,
          Humanize.Schema.Localized.Missing_Required_Label (C, Count => 3),
          Humanize.Schema.Missing_Required_Label (Count => 3));
   Check (Locale, "label.schema.missing_required_label", Phrase,
          Humanize.Schema.Localized.Missing_Required_Label (C, Count => 1),
          Humanize.Schema.Missing_Required_Label (Count => 1));
   Check (Locale, "label.schema.object_shape_label", Phrase,
          Humanize.Schema.Localized.Object_Shape_Label (C, Fields => 3, Required => 3, Optional => 3),
          Humanize.Schema.Object_Shape_Label (Fields => 3, Required => 3, Optional => 3));
   Check (Locale, "label.schema.object_shape_label", Phrase,
          Humanize.Schema.Localized.Object_Shape_Label (C, Fields => 1, Required => 1, Optional => 1),
          Humanize.Schema.Object_Shape_Label (Fields => 1, Required => 1, Optional => 1));
   Check (Locale, "label.schema.schema_source_label", Phrase,
          Humanize.Schema.Localized.Schema_Source_Label (C, Name => "plain", Version => "plain"),
          Humanize.Schema.Schema_Source_Label (Name => "plain", Version => "plain"));
   Check (Locale, "label.schema.shape_label", Phrase,
          Humanize.Schema.Localized.Shape_Label (C, Kind => Humanize.Schema.Scalar_Shape, Count => 3),
          Humanize.Schema.Shape_Label (Kind => Humanize.Schema.Scalar_Shape, Count => 3));
   Check (Locale, "label.schema.shape_label", Phrase,
          Humanize.Schema.Localized.Shape_Label (C, Kind => Humanize.Schema.Unknown_Shape, Count => 1),
          Humanize.Schema.Shape_Label (Kind => Humanize.Schema.Unknown_Shape, Count => 1));
   Check (Locale, "label.schema.type_mismatch_label", Phrase,
          Humanize.Schema.Localized.Type_Mismatch_Label (C, Field_Name => "plain", Expected =>
            Humanize.Schema.Unknown_Field_Type, Actual => Humanize.Schema.Unknown_Field_Type),
          Humanize.Schema.Type_Mismatch_Label (Field_Name => "plain", Expected =>
            Humanize.Schema.Unknown_Field_Type, Actual => Humanize.Schema.Unknown_Field_Type));
   Check (Locale, "label.schema.type_mismatch_label", Phrase,
          Humanize.Schema.Localized.Type_Mismatch_Label (C, Field_Name => "plain", Expected =>
            Humanize.Schema.Object_Field, Actual => Humanize.Schema.Object_Field),
          Humanize.Schema.Type_Mismatch_Label (Field_Name => "plain", Expected => Humanize.Schema.Object_Field,
            Actual => Humanize.Schema.Object_Field));
   Check (Locale, "label.schema.type_mismatch_label", Prefix,
          Humanize.Schema.Localized.Type_Mismatch_Label (C, Field_Name => "plain", Expected =>
            Humanize.Schema.Unknown_Field_Type, Actual => Humanize.Schema.Unknown_Field_Type, Options =>
            (Humanize.Schema.Default_Schema_Label_Options with delta Include_Surface => True)),
          Humanize.Schema.Type_Mismatch_Label (Field_Name => "plain", Expected =>
            Humanize.Schema.Unknown_Field_Type, Actual => Humanize.Schema.Unknown_Field_Type, Options =>
            (Humanize.Schema.Default_Schema_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.schema.unknown_field_label", Phrase,
          Humanize.Schema.Localized.Unknown_Field_Label (C, Name => "plain"),
          Humanize.Schema.Unknown_Field_Label (Name => "plain"));
   Check (Locale, "label.search.active_filter_count_label", Phrase,
          Humanize.Search.Localized.Active_Filter_Count_Label (C, Count => 3),
          Humanize.Search.Active_Filter_Count_Label (Count => 3));
   Check (Locale, "label.search.active_filter_count_label", Phrase,
          Humanize.Search.Localized.Active_Filter_Count_Label (C, Count => 1),
          Humanize.Search.Active_Filter_Count_Label (Count => 1));
   Check (Locale, "label.search.clear_filters_label", Phrase,
          Humanize.Search.Localized.Clear_Filters_Label (C, Count => 3),
          Humanize.Search.Clear_Filters_Label (Count => 3));
   Check (Locale, "label.search.clear_filters_label", Phrase,
          Humanize.Search.Localized.Clear_Filters_Label (C, Count => 1),
          Humanize.Search.Clear_Filters_Label (Count => 1));
   Check (Locale, "label.search.facet_label", Phrase,
          Humanize.Search.Localized.Facet_Label (C, Name => "plain", Count => 3),
          Humanize.Search.Facet_Label (Name => "plain", Count => 3));
   Check (Locale, "label.search.facet_label", Phrase,
          Humanize.Search.Localized.Facet_Label (C, Name => "plain", Count => 1),
          Humanize.Search.Facet_Label (Name => "plain", Count => 1));
   Check (Locale, "label.search.facet_value_label", Phrase,
          Humanize.Search.Localized.Facet_Value_Label (C, Name => "plain", Count => 3, Selected => False),
          Humanize.Search.Facet_Value_Label (Name => "plain", Count => 3, Selected => False));
   Check (Locale, "label.search.facet_value_label", Phrase,
          Humanize.Search.Localized.Facet_Value_Label (C, Name => "plain", Count => 1, Selected => True),
          Humanize.Search.Facet_Value_Label (Name => "plain", Count => 1, Selected => True));
   Check (Locale, "label.search.filter_label", Phrase,
          Humanize.Search.Localized.Filter_Label (C, Name => "plain", Value => "plain", State =>
            Humanize.Search.Active_Filter),
          Humanize.Search.Filter_Label (Name => "plain", Value => "plain", State => Humanize.Search.Active_Filter));
   Check (Locale, "label.search.filter_label", Phrase,
          Humanize.Search.Localized.Filter_Label (C, Name => "plain", Value => "plain", State =>
            Humanize.Search.Excluded_Filter),
          Humanize.Search.Filter_Label (Name => "plain", Value => "plain", State =>
            Humanize.Search.Excluded_Filter));
   Check (Locale, "label.search.filter_label", Prefix,
          Humanize.Search.Localized.Filter_Label (C, Name => "plain", Value => "plain", State =>
            Humanize.Search.Active_Filter, Options => (Humanize.Search.Default_Search_Label_Options with delta
            Include_Surface => True)),
          Humanize.Search.Filter_Label (Name => "plain", Value => "plain", State => Humanize.Search.Active_Filter,
            Options => (Humanize.Search.Default_Search_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.search.filter_state_label", Phrase,
          Humanize.Search.Localized.Filter_State_Label (C, State => Humanize.Search.Active_Filter),
          Humanize.Search.Filter_State_Label (State => Humanize.Search.Active_Filter));
   Check (Locale, "label.search.filter_state_label", Phrase,
          Humanize.Search.Localized.Filter_State_Label (C, State => Humanize.Search.Excluded_Filter),
          Humanize.Search.Filter_State_Label (State => Humanize.Search.Excluded_Filter));
   Check (Locale, "label.search.no_results_label", Phrase,
          Humanize.Search.Localized.No_Results_Label (C, Query => "plain"),
          Humanize.Search.No_Results_Label (Query => "plain"));
   Check (Locale, "label.search.recent_search_label", Phrase,
          Humanize.Search.Localized.Recent_Search_Label (C, Query => "plain"),
          Humanize.Search.Recent_Search_Label (Query => "plain"));
   Check (Locale, "label.search.saved_search_label", Phrase,
          Humanize.Search.Localized.Saved_Search_Label (C, Name => "plain", Count => 3),
          Humanize.Search.Saved_Search_Label (Name => "plain", Count => 3));
   Check (Locale, "label.search.saved_search_label", Phrase,
          Humanize.Search.Localized.Saved_Search_Label (C, Name => "plain", Count => 1),
          Humanize.Search.Saved_Search_Label (Name => "plain", Count => 1));
   Check (Locale, "label.search.search_history_count_label", Phrase,
          Humanize.Search.Localized.Search_History_Count_Label (C, Count => 3),
          Humanize.Search.Search_History_Count_Label (Count => 3));
   Check (Locale, "label.search.search_history_count_label", Phrase,
          Humanize.Search.Localized.Search_History_Count_Label (C, Count => 1),
          Humanize.Search.Search_History_Count_Label (Count => 1));
   Check (Locale, "label.search.search_query_label", Phrase,
          Humanize.Search.Localized.Search_Query_Label (C, Query => "plain"),
          Humanize.Search.Search_Query_Label (Query => "plain"));
   Check (Locale, "label.search.search_result_count_label", Phrase,
          Humanize.Search.Localized.Search_Result_Count_Label (C, Count => 3),
          Humanize.Search.Search_Result_Count_Label (Count => 3));
   Check (Locale, "label.search.search_result_count_label", Phrase,
          Humanize.Search.Localized.Search_Result_Count_Label (C, Count => 1),
          Humanize.Search.Search_Result_Count_Label (Count => 1));
   Check (Locale, "label.search.search_result_summary_label", Phrase,
          Humanize.Search.Localized.Search_Result_Summary_Label (C, Query => "plain", Count => 3),
          Humanize.Search.Search_Result_Summary_Label (Query => "plain", Count => 3));
   Check (Locale, "label.search.search_result_summary_label", Phrase,
          Humanize.Search.Localized.Search_Result_Summary_Label (C, Query => "plain", Count => 1),
          Humanize.Search.Search_Result_Summary_Label (Query => "plain", Count => 1));
   Check (Locale, "label.search.search_scope_label", Phrase,
          Humanize.Search.Localized.Search_Scope_Label (C, Name => "plain", Count => 3),
          Humanize.Search.Search_Scope_Label (Name => "plain", Count => 3));
   Check (Locale, "label.search.search_scope_label", Phrase,
          Humanize.Search.Localized.Search_Scope_Label (C, Name => "plain", Count => 1),
          Humanize.Search.Search_Scope_Label (Name => "plain", Count => 1));
   Check (Locale, "label.search.search_state_label", Phrase,
          Humanize.Search.Localized.Search_State_Label (C, State => Humanize.Search.Idle_Search),
          Humanize.Search.Search_State_Label (State => Humanize.Search.Idle_Search));
   Check (Locale, "label.search.search_state_label", Phrase,
          Humanize.Search.Localized.Search_State_Label (C, State => Humanize.Search.Failed_Search),
          Humanize.Search.Search_State_Label (State => Humanize.Search.Failed_Search));
   Check (Locale, "label.search.sort_label", Phrase,
          Humanize.Search.Localized.Sort_Label (C, Mode => Humanize.Search.Relevance_Sort),
          Humanize.Search.Sort_Label (Mode => Humanize.Search.Relevance_Sort));
   Check (Locale, "label.search.sort_label", Phrase,
          Humanize.Search.Localized.Sort_Label (C, Mode => Humanize.Search.Oldest_First_Sort),
          Humanize.Search.Sort_Label (Mode => Humanize.Search.Oldest_First_Sort));
   Check (Locale, "label.search.sort_mode_label", Phrase,
          Humanize.Search.Localized.Sort_Mode_Label (C, Mode => Humanize.Search.Relevance_Sort),
          Humanize.Search.Sort_Mode_Label (Mode => Humanize.Search.Relevance_Sort));
   Check (Locale, "label.search.sort_mode_label", Phrase,
          Humanize.Search.Localized.Sort_Mode_Label (C, Mode => Humanize.Search.Oldest_First_Sort),
          Humanize.Search.Sort_Mode_Label (Mode => Humanize.Search.Oldest_First_Sort));
   Check (Locale, "label.search.suggestion_label", Phrase,
          Humanize.Search.Localized.Suggestion_Label (C, Query => "plain"),
          Humanize.Search.Suggestion_Label (Query => "plain"));
   Check (Locale, "label.secrets.credential_source_label", Phrase,
          Humanize.Secrets.Localized.Credential_Source_Label (C, Source => "plain", Count => 3),
          Humanize.Secrets.Credential_Source_Label (Source => "plain", Count => 3));
   Check (Locale, "label.secrets.credential_source_label", Phrase,
          Humanize.Secrets.Localized.Credential_Source_Label (C, Source => "plain", Count => 1),
          Humanize.Secrets.Credential_Source_Label (Source => "plain", Count => 1));
   Check (Locale, "label.secrets.exposure_label", Phrase,
          Humanize.Secrets.Localized.Exposure_Label (C, Exposure => Humanize.Secrets.Hidden_Value),
          Humanize.Secrets.Exposure_Label (Exposure => Humanize.Secrets.Hidden_Value));
   Check (Locale, "label.secrets.exposure_label", Phrase,
          Humanize.Secrets.Localized.Exposure_Label (C, Exposure => Humanize.Secrets.Fingerprint_Only),
          Humanize.Secrets.Exposure_Label (Exposure => Humanize.Secrets.Fingerprint_Only));
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
   Check (Locale, "label.secrets.secret_count_label", Plain,
          Humanize.Secrets.Localized.Secret_Count_Label (C, Total => 7, Masked => 9, Unset => 4, Fingerprints => 6),
          Humanize.Secrets.Secret_Count_Label (Total => 7, Masked => 9, Unset => 4, Fingerprints => 6));
   Check (Locale, "label.secrets.secret_count_label", Plain,
          Humanize.Secrets.Localized.Secret_Count_Label (C, Total => 2, Masked => 0, Unset => 0, Fingerprints => 0),
          Humanize.Secrets.Secret_Count_Label (Total => 2, Masked => 0, Unset => 0, Fingerprints => 0));
   Check (Locale, "label.secrets.secret_kind_label", Phrase,
          Humanize.Secrets.Localized.Secret_Kind_Label (C, Kind => Humanize.Secrets.Api_Key),
          Humanize.Secrets.Secret_Kind_Label (Kind => Humanize.Secrets.Api_Key));
   Check (Locale, "label.secrets.secret_kind_label", Phrase,
          Humanize.Secrets.Localized.Secret_Kind_Label (C, Kind => Humanize.Secrets.Unknown_Secret),
          Humanize.Secrets.Secret_Kind_Label (Kind => Humanize.Secrets.Unknown_Secret));
   Check (Locale, "label.secrets.sensitive_value_kind_label", Phrase,
          Humanize.Secrets.Localized.Sensitive_Value_Kind_Label (C, Kind => Humanize.Secrets.Email_Value),
          Humanize.Secrets.Sensitive_Value_Kind_Label (Kind => Humanize.Secrets.Email_Value));
   Check (Locale, "label.secrets.sensitive_value_kind_label", Phrase,
          Humanize.Secrets.Localized.Sensitive_Value_Kind_Label (C, Kind =>
            Humanize.Secrets.Unknown_Sensitive_Value),
          Humanize.Secrets.Sensitive_Value_Kind_Label (Kind => Humanize.Secrets.Unknown_Sensitive_Value));
   Check (Locale, "label.metrics.paragraph_count_summary", Plain,
          Humanize.Strings.Metrics.Localized.Paragraph_Count_Summary (C,
            "The quick brown fox jumps. It runs far away!" & ASCII.LF & ASCII.LF & "A second paragraph."),
          Humanize.Strings.Metrics.Paragraph_Count_Summary ("The quick brown fox jumps. It runs far away!" &
            ASCII.LF & ASCII.LF & "A second paragraph."));
   Check (Locale, "label.metrics.paragraph_count_summary", Plain,
          Humanize.Strings.Metrics.Localized.Paragraph_Count_Summary (C, "One word."),
          Humanize.Strings.Metrics.Paragraph_Count_Summary ("One word."));
   Check (Locale, "label.metrics.reading_time", Plain,
          Humanize.Strings.Metrics.Localized.Reading_Time (C, "The quick brown fox jumps. It runs far away!" &
            ASCII.LF & ASCII.LF & "A second paragraph."),
          Humanize.Strings.Metrics.Reading_Time ("The quick brown fox jumps. It runs far away!" & ASCII.LF &
            ASCII.LF & "A second paragraph."));
   Check (Locale, "label.metrics.reading_time", Plain,
          Humanize.Strings.Metrics.Localized.Reading_Time (C, "One word."),
          Humanize.Strings.Metrics.Reading_Time ("One word."));
   Check (Locale, "label.metrics.sentence_count_summary", Plain,
          Humanize.Strings.Metrics.Localized.Sentence_Count_Summary (C,
            "The quick brown fox jumps. It runs far away!" & ASCII.LF & ASCII.LF & "A second paragraph."),
          Humanize.Strings.Metrics.Sentence_Count_Summary ("The quick brown fox jumps. It runs far away!" & ASCII.LF
            & ASCII.LF & "A second paragraph."));
   Check (Locale, "label.metrics.sentence_count_summary", Plain,
          Humanize.Strings.Metrics.Localized.Sentence_Count_Summary (C, "One word."),
          Humanize.Strings.Metrics.Sentence_Count_Summary ("One word."));
   Check (Locale, "label.metrics.speaking_time", Plain,
          Humanize.Strings.Metrics.Localized.Speaking_Time (C, "The quick brown fox jumps. It runs far away!" &
            ASCII.LF & ASCII.LF & "A second paragraph."),
          Humanize.Strings.Metrics.Speaking_Time ("The quick brown fox jumps. It runs far away!" & ASCII.LF &
            ASCII.LF & "A second paragraph."));
   Check (Locale, "label.metrics.speaking_time", Plain,
          Humanize.Strings.Metrics.Localized.Speaking_Time (C, "One word."),
          Humanize.Strings.Metrics.Speaking_Time ("One word."));
   Check (Locale, "label.metrics.text_summary", Plain,
          Humanize.Strings.Metrics.Localized.Text_Summary (C, "The quick brown fox jumps. It runs far away!" &
            ASCII.LF & ASCII.LF & "A second paragraph."),
          Humanize.Strings.Metrics.Text_Summary ("The quick brown fox jumps. It runs far away!" & ASCII.LF &
            ASCII.LF & "A second paragraph."));
   Check (Locale, "label.metrics.text_summary", Plain,
          Humanize.Strings.Metrics.Localized.Text_Summary (C, "One word."),
          Humanize.Strings.Metrics.Text_Summary ("One word."));
   Check (Locale, "label.metrics.text_summary_with_options", Plain,
          Humanize.Strings.Metrics.Localized.Text_Summary_With_Options (C,
            "The quick brown fox jumps. It runs far away!" & ASCII.LF & ASCII.LF & "A second paragraph."),
          Humanize.Strings.Metrics.Text_Summary_With_Options ("The quick brown fox jumps. It runs far away!" &
            ASCII.LF & ASCII.LF & "A second paragraph."));
   Check (Locale, "label.metrics.text_summary_with_options", Plain,
          Humanize.Strings.Metrics.Localized.Text_Summary_With_Options (C, "One word."),
          Humanize.Strings.Metrics.Text_Summary_With_Options ("One word."));
   Check (Locale, "label.metrics.word_count_summary", Plain,
          Humanize.Strings.Metrics.Localized.Word_Count_Summary (C, "The quick brown fox jumps. It runs far away!" &
            ASCII.LF & ASCII.LF & "A second paragraph."),
          Humanize.Strings.Metrics.Word_Count_Summary ("The quick brown fox jumps. It runs far away!" & ASCII.LF &
            ASCII.LF & "A second paragraph."));
   Check (Locale, "label.metrics.word_count_summary", Plain,
          Humanize.Strings.Metrics.Localized.Word_Count_Summary (C, "One word."),
          Humanize.Strings.Metrics.Word_Count_Summary ("One word."));
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
end Check_Group_6;
