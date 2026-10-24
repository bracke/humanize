with Humanize.Permissions;
with Humanize.Resources;
with Humanize.Schema;
with Humanize.Search;
with Humanize.Secrets;
with Humanize.Tables;
with Humanize.Permissions.Localized;
with Humanize.Resources.Localized;
with Humanize.Schema.Localized;
with Humanize.Search.Localized;
with Humanize.Secrets.Localized;
with Humanize.Tables.Localized;

separate (Humanize.Tests.Domain_Labels)
procedure Check_Group_5 (Locale : String; C : Humanize.Contexts.Context) is
begin
   Check (Locale, "label.permissions.access_expiry_label",
          Humanize.Permissions.Localized.Access_Expiry_Label (C, Subject => "plain", Time_Text => "plain"),
          Humanize.Permissions.Access_Expiry_Label (Subject => "plain", Time_Text => "plain"));
   Check (Locale, "label.permissions.grant_label",
          Humanize.Permissions.Localized.Grant_Label (C, Subject => "plain", Role => Humanize.Permissions.Owner_Role),
          Humanize.Permissions.Grant_Label (Subject => "plain", Role => Humanize.Permissions.Owner_Role));
   Check (Locale, "label.permissions.grant_label",
          Humanize.Permissions.Localized.Grant_Label
            (C,
             Subject => "plain",
             Role => Humanize.Permissions.Custom_Role),
          Humanize.Permissions.Grant_Label (Subject => "plain", Role => Humanize.Permissions.Custom_Role));
   Check (Locale, "label.permissions.permission_label",
          Humanize.Permissions.Localized.Permission_Label
            (C,
             Subject => "plain",
             Action => "plain",
             State => Humanize.Permissions.Granted),
          Humanize.Permissions.Permission_Label
            (Subject => "plain",
             Action => "plain",
             State => Humanize.Permissions.Granted));
   Check (Locale, "label.permissions.permission_label",
          Humanize.Permissions.Localized.Permission_Label
            (C,
             Subject => "plain",
             Action => "plain",
             State => Humanize.Permissions.Requires_Approval),
          Humanize.Permissions.Permission_Label
            (Subject => "plain",
             Action => "plain",
             State => Humanize.Permissions.Requires_Approval));
   Check (Locale, "label.permissions.permission_state_label",
          Humanize.Permissions.Localized.Permission_State_Label (C, State => Humanize.Permissions.Granted),
          Humanize.Permissions.Permission_State_Label (State => Humanize.Permissions.Granted));
   Check (Locale, "label.permissions.permission_state_label",
          Humanize.Permissions.Localized.Permission_State_Label (C, State => Humanize.Permissions.Requires_Approval),
          Humanize.Permissions.Permission_State_Label (State => Humanize.Permissions.Requires_Approval));
   Check (Locale, "label.permissions.policy_result_label",
          Humanize.Permissions.Localized.Policy_Result_Label (C, Result => Humanize.Permissions.Policy_Allowed),
          Humanize.Permissions.Policy_Result_Label (Result => Humanize.Permissions.Policy_Allowed));
   Check (Locale, "label.permissions.policy_result_label",
          Humanize.Permissions.Localized.Policy_Result_Label
            (C,
             Result => Humanize.Permissions.Policy_Not_Applicable),
          Humanize.Permissions.Policy_Result_Label (Result => Humanize.Permissions.Policy_Not_Applicable));
   Check (Locale, "label.permissions.revoke_label",
          Humanize.Permissions.Localized.Revoke_Label
            (C,
             Subject => "plain",
             Role => Humanize.Permissions.Owner_Role),
          Humanize.Permissions.Revoke_Label (Subject => "plain", Role => Humanize.Permissions.Owner_Role));
   Check (Locale, "label.permissions.revoke_label",
          Humanize.Permissions.Localized.Revoke_Label
            (C,
             Subject => "plain",
             Role => Humanize.Permissions.Custom_Role),
          Humanize.Permissions.Revoke_Label (Subject => "plain", Role => Humanize.Permissions.Custom_Role));
   Check (Locale, "label.permissions.role_label",
          Humanize.Permissions.Localized.Role_Label (C, Role => Humanize.Permissions.Owner_Role),
          Humanize.Permissions.Role_Label (Role => Humanize.Permissions.Owner_Role));
   Check (Locale, "label.permissions.role_label",
          Humanize.Permissions.Localized.Role_Label (C, Role => Humanize.Permissions.Custom_Role),
          Humanize.Permissions.Role_Label (Role => Humanize.Permissions.Custom_Role));
   Check (Locale, "label.resources.utilization_band_label",
          Humanize.Resources.Localized.Utilization_Band_Label (C, Band => Humanize.Resources.Empty_Utilization),
          Humanize.Resources.Utilization_Band_Label (Band => Humanize.Resources.Empty_Utilization));
   Check (Locale, "label.resources.utilization_band_label",
          Humanize.Resources.Localized.Utilization_Band_Label (C, Band => Humanize.Resources.Over_Limit_Utilization),
          Humanize.Resources.Utilization_Band_Label (Band => Humanize.Resources.Over_Limit_Utilization));
   Check (Locale, "label.schema.array_shape_label",
          Humanize.Schema.Localized.Array_Shape_Label
            (C,
             Element_Type => Humanize.Schema.String_Field,
             Count => 3,
             Count_Known => False),
          Humanize.Schema.Array_Shape_Label
            (Element_Type => Humanize.Schema.String_Field,
             Count => 3,
             Count_Known => False));
   Check (Locale, "label.schema.array_shape_label",
          Humanize.Schema.Localized.Array_Shape_Label
            (C,
             Element_Type => Humanize.Schema.Unknown_Field_Type,
             Count => 1,
             Count_Known => True),
          Humanize.Schema.Array_Shape_Label
            (Element_Type => Humanize.Schema.Unknown_Field_Type,
             Count => 1,
             Count_Known => True));
   Check (Locale, "label.schema.constraint_label",
          Humanize.Schema.Localized.Constraint_Label (C, Name => "plain", Value => "plain"),
          Humanize.Schema.Constraint_Label (Name => "plain", Value => "plain"));
   Check (Locale, "label.schema.default_value_label",
          Humanize.Schema.Localized.Default_Value_Label (C, Field_Name => "plain", Value => "plain"),
          Humanize.Schema.Default_Value_Label (Field_Name => "plain", Value => "plain"));
   Check (Locale, "label.schema.deprecated_field_label",
          Humanize.Schema.Localized.Deprecated_Field_Label (C, Name => "plain", Replacement => "plain"),
          Humanize.Schema.Deprecated_Field_Label (Name => "plain", Replacement => "plain"));
   Check (Locale, "label.schema.enum_options_label",
          Humanize.Schema.Localized.Enum_Options_Label (C, Count => 3),
          Humanize.Schema.Enum_Options_Label (Count => 3));
   Check (Locale, "label.schema.enum_options_label",
          Humanize.Schema.Localized.Enum_Options_Label (C, Count => 1),
          Humanize.Schema.Enum_Options_Label (Count => 1));
   Check (Locale, "label.schema.example_value_label",
          Humanize.Schema.Localized.Example_Value_Label (C, Field_Name => "plain", Value => "plain"),
          Humanize.Schema.Example_Value_Label (Field_Name => "plain", Value => "plain"));
   Check (Locale, "label.schema.field_state_label",
          Humanize.Schema.Localized.Field_State_Label (C, State => Humanize.Schema.Normal_Field),
          Humanize.Schema.Field_State_Label (State => Humanize.Schema.Normal_Field));
   Check (Locale, "label.schema.field_state_label",
          Humanize.Schema.Localized.Field_State_Label (C, State => Humanize.Schema.Computed_Field),
          Humanize.Schema.Field_State_Label (State => Humanize.Schema.Computed_Field));
   Check (Locale, "label.schema.field_type_label",
          Humanize.Schema.Localized.Field_Type_Label (C, Kind => Humanize.Schema.String_Field),
          Humanize.Schema.Field_Type_Label (Kind => Humanize.Schema.String_Field));
   Check (Locale, "label.schema.field_type_label",
          Humanize.Schema.Localized.Field_Type_Label (C, Kind => Humanize.Schema.Unknown_Field_Type),
          Humanize.Schema.Field_Type_Label (Kind => Humanize.Schema.Unknown_Field_Type));
   Check (Locale, "label.schema.missing_required_label",
          Humanize.Schema.Localized.Missing_Required_Label (C, Count => 3),
          Humanize.Schema.Missing_Required_Label (Count => 3));
   Check (Locale, "label.schema.missing_required_label",
          Humanize.Schema.Localized.Missing_Required_Label (C, Count => 1),
          Humanize.Schema.Missing_Required_Label (Count => 1));
   Check (Locale, "label.schema.object_shape_label",
          Humanize.Schema.Localized.Object_Shape_Label (C, Fields => 3, Required => 3, Optional => 3),
          Humanize.Schema.Object_Shape_Label (Fields => 3, Required => 3, Optional => 3));
   Check (Locale, "label.schema.object_shape_label",
          Humanize.Schema.Localized.Object_Shape_Label (C, Fields => 1, Required => 1, Optional => 1),
          Humanize.Schema.Object_Shape_Label (Fields => 1, Required => 1, Optional => 1));
   Check (Locale, "label.schema.schema_source_label",
          Humanize.Schema.Localized.Schema_Source_Label (C, Name => "plain", Version => "plain"),
          Humanize.Schema.Schema_Source_Label (Name => "plain", Version => "plain"));
   Check (Locale, "label.schema.shape_label",
          Humanize.Schema.Localized.Shape_Label (C, Kind => Humanize.Schema.Scalar_Shape, Count => 3),
          Humanize.Schema.Shape_Label (Kind => Humanize.Schema.Scalar_Shape, Count => 3));
   Check (Locale, "label.schema.shape_label",
          Humanize.Schema.Localized.Shape_Label (C, Kind => Humanize.Schema.Unknown_Shape, Count => 1),
          Humanize.Schema.Shape_Label (Kind => Humanize.Schema.Unknown_Shape, Count => 1));
   Check (Locale, "label.schema.unknown_field_label",
          Humanize.Schema.Localized.Unknown_Field_Label (C, Name => "plain"),
          Humanize.Schema.Unknown_Field_Label (Name => "plain"));
   Check (Locale, "label.search.active_filter_count_label",
          Humanize.Search.Localized.Active_Filter_Count_Label (C, Count => 3),
          Humanize.Search.Active_Filter_Count_Label (Count => 3));
   Check (Locale, "label.search.active_filter_count_label",
          Humanize.Search.Localized.Active_Filter_Count_Label (C, Count => 1),
          Humanize.Search.Active_Filter_Count_Label (Count => 1));
   Check (Locale, "label.search.clear_filters_label",
          Humanize.Search.Localized.Clear_Filters_Label (C, Count => 3),
          Humanize.Search.Clear_Filters_Label (Count => 3));
   Check (Locale, "label.search.clear_filters_label",
          Humanize.Search.Localized.Clear_Filters_Label (C, Count => 1),
          Humanize.Search.Clear_Filters_Label (Count => 1));
   Check (Locale, "label.search.facet_label",
          Humanize.Search.Localized.Facet_Label (C, Name => "plain", Count => 3),
          Humanize.Search.Facet_Label (Name => "plain", Count => 3));
   Check (Locale, "label.search.facet_label",
          Humanize.Search.Localized.Facet_Label (C, Name => "plain", Count => 1),
          Humanize.Search.Facet_Label (Name => "plain", Count => 1));
   Check (Locale, "label.search.facet_value_label",
          Humanize.Search.Localized.Facet_Value_Label (C, Name => "plain", Count => 3, Selected => False),
          Humanize.Search.Facet_Value_Label (Name => "plain", Count => 3, Selected => False));
   Check (Locale, "label.search.facet_value_label",
          Humanize.Search.Localized.Facet_Value_Label (C, Name => "plain", Count => 1, Selected => True),
          Humanize.Search.Facet_Value_Label (Name => "plain", Count => 1, Selected => True));
   Check (Locale, "label.search.filter_label",
          Humanize.Search.Localized.Filter_Label
            (C,
             Name => "plain",
             Value => "plain",
             State => Humanize.Search.Active_Filter),
          Humanize.Search.Filter_Label (Name => "plain", Value => "plain", State => Humanize.Search.Active_Filter));
   Check (Locale, "label.search.filter_label",
          Humanize.Search.Localized.Filter_Label
            (C,
             Name => "plain",
             Value => "plain",
             State => Humanize.Search.Excluded_Filter),
          Humanize.Search.Filter_Label (Name => "plain", Value => "plain", State => Humanize.Search.Excluded_Filter));
   Check (Locale, "label.search.filter_state_label",
          Humanize.Search.Localized.Filter_State_Label (C, State => Humanize.Search.Active_Filter),
          Humanize.Search.Filter_State_Label (State => Humanize.Search.Active_Filter));
   Check (Locale, "label.search.filter_state_label",
          Humanize.Search.Localized.Filter_State_Label (C, State => Humanize.Search.Excluded_Filter),
          Humanize.Search.Filter_State_Label (State => Humanize.Search.Excluded_Filter));
   Check (Locale, "label.search.no_results_label",
          Humanize.Search.Localized.No_Results_Label (C, Query => "plain"),
          Humanize.Search.No_Results_Label (Query => "plain"));
   Check (Locale, "label.search.recent_search_label",
          Humanize.Search.Localized.Recent_Search_Label (C, Query => "plain"),
          Humanize.Search.Recent_Search_Label (Query => "plain"));
   Check (Locale, "label.search.saved_search_label",
          Humanize.Search.Localized.Saved_Search_Label (C, Name => "plain", Count => 3),
          Humanize.Search.Saved_Search_Label (Name => "plain", Count => 3));
   Check (Locale, "label.search.saved_search_label",
          Humanize.Search.Localized.Saved_Search_Label (C, Name => "plain", Count => 1),
          Humanize.Search.Saved_Search_Label (Name => "plain", Count => 1));
   Check (Locale, "label.search.search_history_count_label",
          Humanize.Search.Localized.Search_History_Count_Label (C, Count => 3),
          Humanize.Search.Search_History_Count_Label (Count => 3));
   Check (Locale, "label.search.search_history_count_label",
          Humanize.Search.Localized.Search_History_Count_Label (C, Count => 1),
          Humanize.Search.Search_History_Count_Label (Count => 1));
   Check (Locale, "label.search.search_query_label",
          Humanize.Search.Localized.Search_Query_Label (C, Query => "plain"),
          Humanize.Search.Search_Query_Label (Query => "plain"));
   Check (Locale, "label.search.search_result_count_label",
          Humanize.Search.Localized.Search_Result_Count_Label (C, Count => 3),
          Humanize.Search.Search_Result_Count_Label (Count => 3));
   Check (Locale, "label.search.search_result_count_label",
          Humanize.Search.Localized.Search_Result_Count_Label (C, Count => 1),
          Humanize.Search.Search_Result_Count_Label (Count => 1));
   Check (Locale, "label.search.search_result_summary_label",
          Humanize.Search.Localized.Search_Result_Summary_Label (C, Query => "plain", Count => 3),
          Humanize.Search.Search_Result_Summary_Label (Query => "plain", Count => 3));
   Check (Locale, "label.search.search_result_summary_label",
          Humanize.Search.Localized.Search_Result_Summary_Label (C, Query => "plain", Count => 1),
          Humanize.Search.Search_Result_Summary_Label (Query => "plain", Count => 1));
   Check (Locale, "label.search.search_scope_label",
          Humanize.Search.Localized.Search_Scope_Label (C, Name => "plain", Count => 3),
          Humanize.Search.Search_Scope_Label (Name => "plain", Count => 3));
   Check (Locale, "label.search.search_scope_label",
          Humanize.Search.Localized.Search_Scope_Label (C, Name => "plain", Count => 1),
          Humanize.Search.Search_Scope_Label (Name => "plain", Count => 1));
   Check (Locale, "label.search.search_state_label",
          Humanize.Search.Localized.Search_State_Label (C, State => Humanize.Search.Idle_Search),
          Humanize.Search.Search_State_Label (State => Humanize.Search.Idle_Search));
   Check (Locale, "label.search.search_state_label",
          Humanize.Search.Localized.Search_State_Label (C, State => Humanize.Search.Failed_Search),
          Humanize.Search.Search_State_Label (State => Humanize.Search.Failed_Search));
   Check (Locale, "label.search.sort_label",
          Humanize.Search.Localized.Sort_Label (C, Mode => Humanize.Search.Relevance_Sort),
          Humanize.Search.Sort_Label (Mode => Humanize.Search.Relevance_Sort));
   Check (Locale, "label.search.sort_label",
          Humanize.Search.Localized.Sort_Label (C, Mode => Humanize.Search.Oldest_First_Sort),
          Humanize.Search.Sort_Label (Mode => Humanize.Search.Oldest_First_Sort));
   Check (Locale, "label.search.sort_mode_label",
          Humanize.Search.Localized.Sort_Mode_Label (C, Mode => Humanize.Search.Relevance_Sort),
          Humanize.Search.Sort_Mode_Label (Mode => Humanize.Search.Relevance_Sort));
   Check (Locale, "label.search.sort_mode_label",
          Humanize.Search.Localized.Sort_Mode_Label (C, Mode => Humanize.Search.Oldest_First_Sort),
          Humanize.Search.Sort_Mode_Label (Mode => Humanize.Search.Oldest_First_Sort));
   Check (Locale, "label.search.suggestion_label",
          Humanize.Search.Localized.Suggestion_Label (C, Query => "plain"),
          Humanize.Search.Suggestion_Label (Query => "plain"));
   Check (Locale, "label.secrets.credential_source_label",
          Humanize.Secrets.Localized.Credential_Source_Label (C, Source => "plain", Count => 3),
          Humanize.Secrets.Credential_Source_Label (Source => "plain", Count => 3));
   Check (Locale, "label.secrets.credential_source_label",
          Humanize.Secrets.Localized.Credential_Source_Label (C, Source => "plain", Count => 1),
          Humanize.Secrets.Credential_Source_Label (Source => "plain", Count => 1));
   Check (Locale, "label.secrets.exposure_label",
          Humanize.Secrets.Localized.Exposure_Label (C, Exposure => Humanize.Secrets.Hidden_Value),
          Humanize.Secrets.Exposure_Label (Exposure => Humanize.Secrets.Hidden_Value));
   Check (Locale, "label.secrets.exposure_label",
          Humanize.Secrets.Localized.Exposure_Label (C, Exposure => Humanize.Secrets.Fingerprint_Only),
          Humanize.Secrets.Exposure_Label (Exposure => Humanize.Secrets.Fingerprint_Only));
   Check (Locale, "label.secrets.privacy_profile_label",
          Humanize.Secrets.Localized.Privacy_Profile_Label (C, Profile => Humanize.Secrets.Public_Profile),
          Humanize.Secrets.Privacy_Profile_Label (Profile => Humanize.Secrets.Public_Profile));
   Check (Locale, "label.secrets.privacy_profile_label",
          Humanize.Secrets.Localized.Privacy_Profile_Label (C, Profile => Humanize.Secrets.Debug_Profile),
          Humanize.Secrets.Privacy_Profile_Label (Profile => Humanize.Secrets.Debug_Profile));
   Check (Locale, "label.secrets.rotation_status_label",
          Humanize.Secrets.Localized.Rotation_Status_Label (C, Needs_Rotation => False, Days_Old => 3),
          Humanize.Secrets.Rotation_Status_Label (Needs_Rotation => False, Days_Old => 3));
   Check (Locale, "label.secrets.rotation_status_label",
          Humanize.Secrets.Localized.Rotation_Status_Label (C, Needs_Rotation => True, Days_Old => 1),
          Humanize.Secrets.Rotation_Status_Label (Needs_Rotation => True, Days_Old => 1));
   Check (Locale, "label.secrets.secret_kind_label",
          Humanize.Secrets.Localized.Secret_Kind_Label (C, Kind => Humanize.Secrets.Api_Key),
          Humanize.Secrets.Secret_Kind_Label (Kind => Humanize.Secrets.Api_Key));
   Check (Locale, "label.secrets.secret_kind_label",
          Humanize.Secrets.Localized.Secret_Kind_Label (C, Kind => Humanize.Secrets.Unknown_Secret),
          Humanize.Secrets.Secret_Kind_Label (Kind => Humanize.Secrets.Unknown_Secret));
   Check (Locale, "label.secrets.sensitive_value_kind_label",
          Humanize.Secrets.Localized.Sensitive_Value_Kind_Label (C, Kind => Humanize.Secrets.Email_Value),
          Humanize.Secrets.Sensitive_Value_Kind_Label (Kind => Humanize.Secrets.Email_Value));
   Check (Locale, "label.secrets.sensitive_value_kind_label",
          Humanize.Secrets.Localized.Sensitive_Value_Kind_Label (C, Kind => Humanize.Secrets.Unknown_Sensitive_Value),
          Humanize.Secrets.Sensitive_Value_Kind_Label (Kind => Humanize.Secrets.Unknown_Sensitive_Value));
   Check (Locale, "label.tables.cell_label",
          Humanize.Tables.Localized.Cell_Label (C, Row => 3, Column => 3, State => Humanize.Tables.Empty_Cell),
          Humanize.Tables.Cell_Label (Row => 3, Column => 3, State => Humanize.Tables.Empty_Cell));
   Check (Locale, "label.tables.cell_label",
          Humanize.Tables.Localized.Cell_Label (C, Row => 1, Column => 1, State => Humanize.Tables.Read_Only_Cell),
          Humanize.Tables.Cell_Label (Row => 1, Column => 1, State => Humanize.Tables.Read_Only_Cell));
   Check (Locale, "label.tables.cell_position_label",
          Humanize.Tables.Localized.Cell_Position_Label (C, Row => 3, Column => 3),
          Humanize.Tables.Cell_Position_Label (Row => 3, Column => 3));
   Check (Locale, "label.tables.cell_position_label",
          Humanize.Tables.Localized.Cell_Position_Label (C, Row => 1, Column => 1),
          Humanize.Tables.Cell_Position_Label (Row => 1, Column => 1));
   Check (Locale, "label.tables.cell_state_label",
          Humanize.Tables.Localized.Cell_State_Label (C, State => Humanize.Tables.Empty_Cell),
          Humanize.Tables.Cell_State_Label (State => Humanize.Tables.Empty_Cell));
   Check (Locale, "label.tables.cell_state_label",
          Humanize.Tables.Localized.Cell_State_Label (C, State => Humanize.Tables.Read_Only_Cell),
          Humanize.Tables.Cell_State_Label (State => Humanize.Tables.Read_Only_Cell));
   Check (Locale, "label.tables.column_count_label",
          Humanize.Tables.Localized.Column_Count_Label (C, Count => 3),
          Humanize.Tables.Column_Count_Label (Count => 3));
   Check (Locale, "label.tables.column_count_label",
          Humanize.Tables.Localized.Column_Count_Label (C, Count => 1),
          Humanize.Tables.Column_Count_Label (Count => 1));
   Check (Locale, "label.tables.column_label",
          Humanize.Tables.Localized.Column_Label (C, Name => "plain", Role => Humanize.Tables.Text_Column),
          Humanize.Tables.Column_Label (Name => "plain", Role => Humanize.Tables.Text_Column));
   Check (Locale, "label.tables.column_label",
          Humanize.Tables.Localized.Column_Label (C, Name => "plain", Role => Humanize.Tables.Hidden_Column),
          Humanize.Tables.Column_Label (Name => "plain", Role => Humanize.Tables.Hidden_Column));
   Check (Locale, "label.tables.column_role_label",
          Humanize.Tables.Localized.Column_Role_Label (C, Role => Humanize.Tables.Text_Column),
          Humanize.Tables.Column_Role_Label (Role => Humanize.Tables.Text_Column));
   Check (Locale, "label.tables.column_role_label",
          Humanize.Tables.Localized.Column_Role_Label (C, Role => Humanize.Tables.Hidden_Column),
          Humanize.Tables.Column_Role_Label (Role => Humanize.Tables.Hidden_Column));
   Check (Locale, "label.tables.group_label",
          Humanize.Tables.Localized.Group_Label (C, Name => "plain", Count => 3),
          Humanize.Tables.Group_Label (Name => "plain", Count => 3));
   Check (Locale, "label.tables.group_label",
          Humanize.Tables.Localized.Group_Label (C, Name => "plain", Count => 1),
          Humanize.Tables.Group_Label (Name => "plain", Count => 1));
   Check (Locale, "label.tables.row_count_label",
          Humanize.Tables.Localized.Row_Count_Label (C, Count => 3),
          Humanize.Tables.Row_Count_Label (Count => 3));
   Check (Locale, "label.tables.row_count_label",
          Humanize.Tables.Localized.Row_Count_Label (C, Count => 1),
          Humanize.Tables.Row_Count_Label (Count => 1));
   Check (Locale, "label.tables.sort_direction_label",
          Humanize.Tables.Localized.Sort_Direction_Label (C, Direction => Humanize.Tables.Unsorted),
          Humanize.Tables.Sort_Direction_Label (Direction => Humanize.Tables.Unsorted));
   Check (Locale, "label.tables.sort_direction_label",
          Humanize.Tables.Localized.Sort_Direction_Label (C, Direction => Humanize.Tables.Descending_Sort),
          Humanize.Tables.Sort_Direction_Label (Direction => Humanize.Tables.Descending_Sort));
   Check (Locale, "label.tables.sort_label",
          Humanize.Tables.Localized.Sort_Label (C, Column_Name => "plain", Direction => Humanize.Tables.Unsorted),
          Humanize.Tables.Sort_Label (Column_Name => "plain", Direction => Humanize.Tables.Unsorted));
   Check (Locale, "label.tables.sort_label",
          Humanize.Tables.Localized.Sort_Label
            (C,
             Column_Name => "plain",
             Direction => Humanize.Tables.Descending_Sort),
          Humanize.Tables.Sort_Label (Column_Name => "plain", Direction => Humanize.Tables.Descending_Sort));
   Check (Locale, "label.tables.subtotal_label",
          Humanize.Tables.Localized.Subtotal_Label (C, Name => "plain", Value => "plain"),
          Humanize.Tables.Subtotal_Label (Name => "plain", Value => "plain"));
   Check (Locale, "label.tables.table_size_label",
          Humanize.Tables.Localized.Table_Size_Label (C, Rows => 3, Columns => 3),
          Humanize.Tables.Table_Size_Label (Rows => 3, Columns => 3));
   Check (Locale, "label.tables.table_size_label",
          Humanize.Tables.Localized.Table_Size_Label (C, Rows => 1, Columns => 1),
          Humanize.Tables.Table_Size_Label (Rows => 1, Columns => 1));
end Check_Group_5;
