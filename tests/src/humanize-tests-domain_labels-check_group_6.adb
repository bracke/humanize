with Humanize.Payments;
with Humanize.Permissions;
with Humanize.Resources;
with Humanize.Schema;
with Humanize.Search;
with Humanize.Payments.Localized;
with Humanize.Permissions.Localized;
with Humanize.Resources.Localized;
with Humanize.Schema.Localized;
with Humanize.Search.Localized;

separate (Humanize.Tests.Domain_Labels)
procedure Check_Group_6 (Locale : String; C : Humanize.Contexts.Context) is
begin
   Check (Locale, "label.payments.amount_label", Phrase,
          Humanize.Payments.Localized.Amount_Label (C, Amount_Text => "plain"),
          Humanize.Payments.Amount_Label (Amount_Text => "plain"));
   Check (Locale, "label.payments.balance_label", Phrase,
          Humanize.Payments.Localized.Balance_Label (C, Amount_Text => "plain"),
          Humanize.Payments.Balance_Label (Amount_Text => "plain"));
   Check (Locale, "label.payments.chargeback_label", Phrase,
          Humanize.Payments.Localized.Chargeback_Label (C, Amount_Text => "plain"),
          Humanize.Payments.Chargeback_Label (Amount_Text => "plain"));
   Check (Locale, "label.payments.discount_label", Phrase,
          Humanize.Payments.Localized.Discount_Label (C, Amount_Text => "plain"),
          Humanize.Payments.Discount_Label (Amount_Text => "plain"));
   Check (Locale, "label.payments.due_label", Phrase,
          Humanize.Payments.Localized.Due_Label (C, Amount_Text => "plain", Due_Text => "plain"),
          Humanize.Payments.Due_Label (Amount_Text => "plain", Due_Text => "plain"));
   Check (Locale, "label.payments.invoice_count_label", Phrase,
          Humanize.Payments.Localized.Invoice_Count_Label (C, Count => 3),
          Humanize.Payments.Invoice_Count_Label (Count => 3));
   Check (Locale, "label.payments.invoice_count_label", Phrase,
          Humanize.Payments.Localized.Invoice_Count_Label (C, Count => 1),
          Humanize.Payments.Invoice_Count_Label (Count => 1));
   Check (Locale, "label.payments.invoice_label", Phrase,
          Humanize.Payments.Localized.Invoice_Label (C, Number => "plain", State =>
            Humanize.Payments.Draft_Invoice),
          Humanize.Payments.Invoice_Label (Number => "plain", State => Humanize.Payments.Draft_Invoice));
   Check (Locale, "label.payments.invoice_label", Phrase,
          Humanize.Payments.Localized.Invoice_Label (C, Number => "plain", State => Humanize.Payments.Void_Invoice),
          Humanize.Payments.Invoice_Label (Number => "plain", State => Humanize.Payments.Void_Invoice));
   Check (Locale, "label.payments.invoice_label", Prefix,
          Humanize.Payments.Localized.Invoice_Label (C, Number => "plain", State => Humanize.Payments.Draft_Invoice,
            Options => (Humanize.Payments.Default_Payment_Label_Options with delta Include_Surface => True)),
          Humanize.Payments.Invoice_Label (Number => "plain", State => Humanize.Payments.Draft_Invoice, Options =>
            (Humanize.Payments.Default_Payment_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.payments.invoice_state_label", Phrase,
          Humanize.Payments.Localized.Invoice_State_Label (C, State => Humanize.Payments.Draft_Invoice),
          Humanize.Payments.Invoice_State_Label (State => Humanize.Payments.Draft_Invoice));
   Check (Locale, "label.payments.invoice_state_label", Phrase,
          Humanize.Payments.Localized.Invoice_State_Label (C, State => Humanize.Payments.Void_Invoice),
          Humanize.Payments.Invoice_State_Label (State => Humanize.Payments.Void_Invoice));
   Check (Locale, "label.payments.method_label", Phrase,
          Humanize.Payments.Localized.Method_Label (C, Method => Humanize.Payments.Card_Method, Detail => "plain"),
          Humanize.Payments.Method_Label (Method => Humanize.Payments.Card_Method, Detail => "plain"));
   Check (Locale, "label.payments.method_label", Phrase,
          Humanize.Payments.Localized.Method_Label (C, Method => Humanize.Payments.Other_Method, Detail => "plain"),
          Humanize.Payments.Method_Label (Method => Humanize.Payments.Other_Method, Detail => "plain"));
   Check (Locale, "label.payments.paid_label", Phrase,
          Humanize.Payments.Localized.Paid_Label (C, Amount_Text => "plain", Paid_Text => "plain"),
          Humanize.Payments.Paid_Label (Amount_Text => "plain", Paid_Text => "plain"));
   Check (Locale, "label.payments.payment_count_label", Phrase,
          Humanize.Payments.Localized.Payment_Count_Label (C, Count => 3),
          Humanize.Payments.Payment_Count_Label (Count => 3));
   Check (Locale, "label.payments.payment_count_label", Phrase,
          Humanize.Payments.Localized.Payment_Count_Label (C, Count => 1),
          Humanize.Payments.Payment_Count_Label (Count => 1));
   Check (Locale, "label.payments.payment_label", Phrase,
          Humanize.Payments.Localized.Payment_Label (C, Amount_Text => "plain", State =>
            Humanize.Payments.Pending_Payment),
          Humanize.Payments.Payment_Label (Amount_Text => "plain", State => Humanize.Payments.Pending_Payment));
   Check (Locale, "label.payments.payment_label", Phrase,
          Humanize.Payments.Localized.Payment_Label (C, Amount_Text => "plain", State =>
            Humanize.Payments.Canceled_Payment),
          Humanize.Payments.Payment_Label (Amount_Text => "plain", State => Humanize.Payments.Canceled_Payment));
   Check (Locale, "label.payments.payment_label", Prefix,
          Humanize.Payments.Localized.Payment_Label (C, Amount_Text => "plain", State =>
            Humanize.Payments.Pending_Payment, Options => (Humanize.Payments.Default_Payment_Label_Options with
            delta Include_Surface => True)),
          Humanize.Payments.Payment_Label (Amount_Text => "plain", State => Humanize.Payments.Pending_Payment,
            Options => (Humanize.Payments.Default_Payment_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.payments.payment_link_label", Phrase,
          Humanize.Payments.Localized.Payment_Link_Label (C, Name => "plain"),
          Humanize.Payments.Payment_Link_Label (Name => "plain"));
   Check (Locale, "label.payments.payment_method_label", Phrase,
          Humanize.Payments.Localized.Payment_Method_Label (C, Method => Humanize.Payments.Card_Method),
          Humanize.Payments.Payment_Method_Label (Method => Humanize.Payments.Card_Method));
   Check (Locale, "label.payments.payment_method_label", Phrase,
          Humanize.Payments.Localized.Payment_Method_Label (C, Method => Humanize.Payments.Other_Method),
          Humanize.Payments.Payment_Method_Label (Method => Humanize.Payments.Other_Method));
   Check (Locale, "label.payments.payment_state_label", Phrase,
          Humanize.Payments.Localized.Payment_State_Label (C, State => Humanize.Payments.Pending_Payment),
          Humanize.Payments.Payment_State_Label (State => Humanize.Payments.Pending_Payment));
   Check (Locale, "label.payments.payment_state_label", Phrase,
          Humanize.Payments.Localized.Payment_State_Label (C, State => Humanize.Payments.Canceled_Payment),
          Humanize.Payments.Payment_State_Label (State => Humanize.Payments.Canceled_Payment));
   Check (Locale, "label.payments.receipt_label", Phrase,
          Humanize.Payments.Localized.Receipt_Label (C, Number => "plain"),
          Humanize.Payments.Receipt_Label (Number => "plain"));
   Check (Locale, "label.payments.refund_label", Phrase,
          Humanize.Payments.Localized.Refund_Label (C, Amount_Text => "plain", State =>
            Humanize.Payments.Pending_Payment),
          Humanize.Payments.Refund_Label (Amount_Text => "plain", State => Humanize.Payments.Pending_Payment));
   Check (Locale, "label.payments.refund_label", Phrase,
          Humanize.Payments.Localized.Refund_Label (C, Amount_Text => "plain", State =>
            Humanize.Payments.Canceled_Payment),
          Humanize.Payments.Refund_Label (Amount_Text => "plain", State => Humanize.Payments.Canceled_Payment));
   Check (Locale, "label.payments.subtotal_label", Phrase,
          Humanize.Payments.Localized.Subtotal_Label (C, Amount_Text => "plain"),
          Humanize.Payments.Subtotal_Label (Amount_Text => "plain"));
   Check (Locale, "label.payments.tax_label", Phrase,
          Humanize.Payments.Localized.Tax_Label (C, Amount_Text => "plain"),
          Humanize.Payments.Tax_Label (Amount_Text => "plain"));
   Check (Locale, "label.payments.total_label", Phrase,
          Humanize.Payments.Localized.Total_Label (C, Amount_Text => "plain"),
          Humanize.Payments.Total_Label (Amount_Text => "plain"));
   Check (Locale, "label.permissions.access_expiry_label", Phrase,
          Humanize.Permissions.Localized.Access_Expiry_Label (C, Subject => "plain", Time_Text => "plain"),
          Humanize.Permissions.Access_Expiry_Label (Subject => "plain", Time_Text => "plain"));
   Check (Locale, "label.permissions.grant_label", Phrase,
          Humanize.Permissions.Localized.Grant_Label (C, Subject => "plain", Role =>
            Humanize.Permissions.Owner_Role),
          Humanize.Permissions.Grant_Label (Subject => "plain", Role => Humanize.Permissions.Owner_Role));
   Check (Locale, "label.permissions.grant_label", Phrase,
          Humanize.Permissions.Localized.Grant_Label (C, Subject => "plain", Role =>
            Humanize.Permissions.Custom_Role),
          Humanize.Permissions.Grant_Label (Subject => "plain", Role => Humanize.Permissions.Custom_Role));
   Check (Locale, "label.permissions.permission_label", Phrase,
          Humanize.Permissions.Localized.Permission_Label (C, Subject => "plain", Action => "plain", State =>
            Humanize.Permissions.Granted),
          Humanize.Permissions.Permission_Label (Subject => "plain", Action => "plain", State =>
            Humanize.Permissions.Granted));
   Check (Locale, "label.permissions.permission_label", Phrase,
          Humanize.Permissions.Localized.Permission_Label (C, Subject => "plain", Action => "plain", State =>
            Humanize.Permissions.Requires_Approval),
          Humanize.Permissions.Permission_Label (Subject => "plain", Action => "plain", State =>
            Humanize.Permissions.Requires_Approval));
   Check (Locale, "label.permissions.permission_label", Prefix,
          Humanize.Permissions.Localized.Permission_Label (C, Subject => "plain", Action => "plain", State =>
            Humanize.Permissions.Granted, Options => (Humanize.Permissions.Default_Permission_Label_Options with
            delta Include_Surface => True)),
          Humanize.Permissions.Permission_Label (Subject => "plain", Action => "plain", State =>
            Humanize.Permissions.Granted, Options => (Humanize.Permissions.Default_Permission_Label_Options with
            delta Include_Surface => True)));
   Check (Locale, "label.permissions.permission_state_label", Phrase,
          Humanize.Permissions.Localized.Permission_State_Label (C, State => Humanize.Permissions.Granted),
          Humanize.Permissions.Permission_State_Label (State => Humanize.Permissions.Granted));
   Check (Locale, "label.permissions.permission_state_label", Phrase,
          Humanize.Permissions.Localized.Permission_State_Label (C, State =>
            Humanize.Permissions.Requires_Approval),
          Humanize.Permissions.Permission_State_Label (State => Humanize.Permissions.Requires_Approval));
   Check (Locale, "label.permissions.policy_result_label", Phrase,
          Humanize.Permissions.Localized.Policy_Result_Label (C, Result => Humanize.Permissions.Policy_Allowed),
          Humanize.Permissions.Policy_Result_Label (Result => Humanize.Permissions.Policy_Allowed));
   Check (Locale, "label.permissions.policy_result_label", Phrase,
          Humanize.Permissions.Localized.Policy_Result_Label (C, Result =>
            Humanize.Permissions.Policy_Not_Applicable),
          Humanize.Permissions.Policy_Result_Label (Result => Humanize.Permissions.Policy_Not_Applicable));
   Check (Locale, "label.permissions.revoke_label", Phrase,
          Humanize.Permissions.Localized.Revoke_Label (C, Subject => "plain", Role =>
            Humanize.Permissions.Owner_Role),
          Humanize.Permissions.Revoke_Label (Subject => "plain", Role => Humanize.Permissions.Owner_Role));
   Check (Locale, "label.permissions.revoke_label", Phrase,
          Humanize.Permissions.Localized.Revoke_Label (C, Subject => "plain", Role =>
            Humanize.Permissions.Custom_Role),
          Humanize.Permissions.Revoke_Label (Subject => "plain", Role => Humanize.Permissions.Custom_Role));
   Check (Locale, "label.permissions.role_label", Phrase,
          Humanize.Permissions.Localized.Role_Label (C, Role => Humanize.Permissions.Owner_Role),
          Humanize.Permissions.Role_Label (Role => Humanize.Permissions.Owner_Role));
   Check (Locale, "label.permissions.role_label", Phrase,
          Humanize.Permissions.Localized.Role_Label (C, Role => Humanize.Permissions.Custom_Role),
          Humanize.Permissions.Role_Label (Role => Humanize.Permissions.Custom_Role));
   Check (Locale, "label.resources.cache_hit_rate_label", Phrase,
          Humanize.Resources.Localized.Cache_Hit_Rate_Label (C, Hits => 7, Misses => 9),
          Humanize.Resources.Cache_Hit_Rate_Label (Hits => 7, Misses => 9));
   Check (Locale, "label.resources.cache_hit_rate_label", Phrase,
          Humanize.Resources.Localized.Cache_Hit_Rate_Label (C, Hits => 2, Misses => 0),
          Humanize.Resources.Cache_Hit_Rate_Label (Hits => 2, Misses => 0));
   Check (Locale, "label.resources.quota_label", Phrase,
          Humanize.Resources.Localized.Quota_Label (C, Used => 7, Limit => 9, Unit => "plain"),
          Humanize.Resources.Quota_Label (Used => 7, Limit => 9, Unit => "plain"));
   Check (Locale, "label.resources.quota_label", Phrase,
          Humanize.Resources.Localized.Quota_Label (C, Used => 2, Limit => 1, Unit => "plain"),
          Humanize.Resources.Quota_Label (Used => 2, Limit => 1, Unit => "plain"));
   Check (Locale, "label.resources.remaining_label", Phrase,
          Humanize.Resources.Localized.Remaining_Label (C, Used => 7, Total => 9, Unit => "plain"),
          Humanize.Resources.Remaining_Label (Used => 7, Total => 9, Unit => "plain"));
   Check (Locale, "label.resources.remaining_label", Phrase,
          Humanize.Resources.Localized.Remaining_Label (C, Used => 2, Total => 1, Unit => "plain"),
          Humanize.Resources.Remaining_Label (Used => 2, Total => 1, Unit => "plain"));
   Check (Locale, "label.resources.saturation_label", Phrase,
          Humanize.Resources.Localized.Saturation_Label (C, Name => "CPU", Percent => 85.0),
          Humanize.Resources.Saturation_Label (Name => "CPU", Percent => 85.0));
   Check (Locale, "label.resources.saturation_label", Phrase,
          Humanize.Resources.Localized.Saturation_Label (C, Name => "", Percent => 10.0),
          Humanize.Resources.Saturation_Label (Name => "", Percent => 10.0));
   Check (Locale, "label.resources.saturation_label", Phrase,
          Humanize.Resources.Localized.Saturation_Label (C, Name => "disk", Percent => 100.0),
          Humanize.Resources.Saturation_Label (Name => "disk", Percent => 100.0));
   Check (Locale, "label.resources.utilization_band_label", Phrase,
          Humanize.Resources.Localized.Utilization_Band_Label (C, Band => Humanize.Resources.Empty_Utilization),
          Humanize.Resources.Utilization_Band_Label (Band => Humanize.Resources.Empty_Utilization));
   Check (Locale, "label.resources.utilization_band_label", Phrase,
          Humanize.Resources.Localized.Utilization_Band_Label (C, Band =>
            Humanize.Resources.Over_Limit_Utilization),
          Humanize.Resources.Utilization_Band_Label (Band => Humanize.Resources.Over_Limit_Utilization));
   Check (Locale, "label.resources.utilization_label", Phrase,
          Humanize.Resources.Localized.Utilization_Label (C, Used => 50, Total => 100),
          Humanize.Resources.Utilization_Label (Used => 50, Total => 100));
   Check (Locale, "label.resources.utilization_label", Phrase,
          Humanize.Resources.Localized.Utilization_Label (C, Used => 99, Total => 100, Unit => "GB"),
          Humanize.Resources.Utilization_Label (Used => 99, Total => 100, Unit => "GB"));
   Check (Locale, "label.resources.utilization_label", Phrase,
          Humanize.Resources.Localized.Utilization_Label (C, Used => 0, Total => 10),
          Humanize.Resources.Utilization_Label (Used => 0, Total => 10));
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
   Check (Locale, "label.schema.field_label", Phrase,
          Humanize.Schema.Localized.Field_Label (C, Name => "email", Kind => Humanize.Schema.String_Field),
          Humanize.Schema.Field_Label (Name => "email", Kind => Humanize.Schema.String_Field));
   Check (Locale, "label.schema.field_label", Phrase,
          Humanize.Schema.Localized.Field_Label (C, Name => "id", Kind => Humanize.Schema.Integer_Field, Presence =>
            Humanize.Schema.Required_Field, Nullable => Humanize.Schema.Non_Nullable, State =>
            Humanize.Schema.Read_Only_Field),
          Humanize.Schema.Field_Label (Name => "id", Kind => Humanize.Schema.Integer_Field, Presence =>
            Humanize.Schema.Required_Field, Nullable => Humanize.Schema.Non_Nullable, State =>
            Humanize.Schema.Read_Only_Field));
   Check (Locale, "label.schema.field_label", Phrase,
          Humanize.Schema.Localized.Field_Label (C, Name => "x", Kind => Humanize.Schema.Any_Field, Presence =>
            Humanize.Schema.Unknown_Presence, Nullable => Humanize.Schema.Nullable, State =>
            Humanize.Schema.Deprecated_Field),
          Humanize.Schema.Field_Label (Name => "x", Kind => Humanize.Schema.Any_Field, Presence =>
            Humanize.Schema.Unknown_Presence, Nullable => Humanize.Schema.Nullable, State =>
            Humanize.Schema.Deprecated_Field));
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
   Check (Locale, "label.schema.schema_summary_label", Phrase,
          Humanize.Schema.Localized.Schema_Summary_Label (C, Fields => 10, Required => 3, Optional => 7),
          Humanize.Schema.Schema_Summary_Label (Fields => 10, Required => 3, Optional => 7));
   Check (Locale, "label.schema.schema_summary_label", Phrase,
          Humanize.Schema.Localized.Schema_Summary_Label (C, Fields => 1),
          Humanize.Schema.Schema_Summary_Label (Fields => 1));
   Check (Locale, "label.schema.schema_summary_label", Phrase,
          Humanize.Schema.Localized.Schema_Summary_Label (C, Fields => 4, Unknown => 1),
          Humanize.Schema.Schema_Summary_Label (Fields => 4, Unknown => 1));
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
end Check_Group_6;
