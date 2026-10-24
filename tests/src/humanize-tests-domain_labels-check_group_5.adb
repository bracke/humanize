with Humanize.Notifications;
with Humanize.Numbers.Statistics;
with Humanize.Payments;
with Humanize.Permissions;
with Humanize.Resources;
with Humanize.Notifications.Localized;
with Humanize.Numbers.Statistics.Localized;
with Humanize.Payments.Localized;
with Humanize.Permissions.Localized;
with Humanize.Resources.Localized;

separate (Humanize.Tests.Domain_Labels)
procedure Check_Group_5 (Locale : String; C : Humanize.Contexts.Context) is
begin
   Check (Locale, "label.notifications.actor_event_label", Phrase,
          Humanize.Notifications.Localized.Actor_Event_Label (C, Actor => "plain", Event =>
            Humanize.Notifications.Mention_Event),
          Humanize.Notifications.Actor_Event_Label (Actor => "plain", Event =>
            Humanize.Notifications.Mention_Event));
   Check (Locale, "label.notifications.actor_event_label", Phrase,
          Humanize.Notifications.Localized.Actor_Event_Label (C, Actor => "plain", Event =>
            Humanize.Notifications.System_Event),
          Humanize.Notifications.Actor_Event_Label (Actor => "plain", Event =>
            Humanize.Notifications.System_Event));
   Check (Locale, "label.notifications.delivery_attempt_label", Phrase,
          Humanize.Notifications.Localized.Delivery_Attempt_Label (C, Attempt => 7, Max_Attempts => 9),
          Humanize.Notifications.Delivery_Attempt_Label (Attempt => 7, Max_Attempts => 9));
   Check (Locale, "label.notifications.delivery_attempt_label", Phrase,
          Humanize.Notifications.Localized.Delivery_Attempt_Label (C, Attempt => 2, Max_Attempts => 2),
          Humanize.Notifications.Delivery_Attempt_Label (Attempt => 2, Max_Attempts => 2));
   Check (Locale, "label.notifications.delivery_label", Phrase,
          Humanize.Notifications.Localized.Delivery_Label (C, Channel => Humanize.Notifications.In_App_Channel,
            State => Humanize.Notifications.Pending_Delivery),
          Humanize.Notifications.Delivery_Label (Channel => Humanize.Notifications.In_App_Channel, State =>
            Humanize.Notifications.Pending_Delivery));
   Check (Locale, "label.notifications.delivery_label", Phrase,
          Humanize.Notifications.Localized.Delivery_Label (C, Channel => Humanize.Notifications.Digest_Channel,
            State => Humanize.Notifications.Canceled_Delivery),
          Humanize.Notifications.Delivery_Label (Channel => Humanize.Notifications.Digest_Channel, State =>
            Humanize.Notifications.Canceled_Delivery));
   Check (Locale, "label.notifications.delivery_label", Prefix,
          Humanize.Notifications.Localized.Delivery_Label (C, Channel => Humanize.Notifications.In_App_Channel,
            State => Humanize.Notifications.Pending_Delivery, Options =>
            (Humanize.Notifications.Default_Notification_Label_Options with delta Include_Surface => True)),
          Humanize.Notifications.Delivery_Label (Channel => Humanize.Notifications.In_App_Channel, State =>
            Humanize.Notifications.Pending_Delivery, Options =>
            (Humanize.Notifications.Default_Notification_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.notifications.delivery_state_label", Phrase,
          Humanize.Notifications.Localized.Delivery_State_Label (C, State =>
            Humanize.Notifications.Pending_Delivery),
          Humanize.Notifications.Delivery_State_Label (State => Humanize.Notifications.Pending_Delivery));
   Check (Locale, "label.notifications.delivery_state_label", Phrase,
          Humanize.Notifications.Localized.Delivery_State_Label (C, State =>
            Humanize.Notifications.Canceled_Delivery),
          Humanize.Notifications.Delivery_State_Label (State => Humanize.Notifications.Canceled_Delivery));
   Check (Locale, "label.notifications.delivery_time_label", Phrase,
          Humanize.Notifications.Localized.Delivery_Time_Label (C, State => Humanize.Notifications.Pending_Delivery,
            Time_Text => "plain"),
          Humanize.Notifications.Delivery_Time_Label (State => Humanize.Notifications.Pending_Delivery, Time_Text =>
            "plain"));
   Check (Locale, "label.notifications.delivery_time_label", Phrase,
          Humanize.Notifications.Localized.Delivery_Time_Label (C, State =>
            Humanize.Notifications.Canceled_Delivery, Time_Text => "plain"),
          Humanize.Notifications.Delivery_Time_Label (State => Humanize.Notifications.Canceled_Delivery, Time_Text
            => "plain"));
   Check (Locale, "label.notifications.digest_label", Phrase,
          Humanize.Notifications.Localized.Digest_Label (C, Count => 3, Name => "plain"),
          Humanize.Notifications.Digest_Label (Count => 3, Name => "plain"));
   Check (Locale, "label.notifications.digest_label", Phrase,
          Humanize.Notifications.Localized.Digest_Label (C, Count => 1, Name => "plain"),
          Humanize.Notifications.Digest_Label (Count => 1, Name => "plain"));
   Check (Locale, "label.notifications.event_count_label", Phrase,
          Humanize.Notifications.Localized.Event_Count_Label (C, Event => Humanize.Notifications.Mention_Event,
            Count => 3),
          Humanize.Notifications.Event_Count_Label (Event => Humanize.Notifications.Mention_Event, Count => 3));
   Check (Locale, "label.notifications.event_count_label", Phrase,
          Humanize.Notifications.Localized.Event_Count_Label (C, Event => Humanize.Notifications.System_Event, Count
            => 1),
          Humanize.Notifications.Event_Count_Label (Event => Humanize.Notifications.System_Event, Count => 1));
   Check (Locale, "label.notifications.inbox_label", Phrase,
          Humanize.Notifications.Localized.Inbox_Label (C, Unread => 7, Total => 9),
          Humanize.Notifications.Inbox_Label (Unread => 7, Total => 9));
   Check (Locale, "label.notifications.inbox_label", Phrase,
          Humanize.Notifications.Localized.Inbox_Label (C, Unread => 1, Total => 2),
          Humanize.Notifications.Inbox_Label (Unread => 1, Total => 2));
   Check (Locale, "label.notifications.mark_read_label", Phrase,
          Humanize.Notifications.Localized.Mark_Read_Label (C, Count => 3),
          Humanize.Notifications.Mark_Read_Label (Count => 3));
   Check (Locale, "label.notifications.mark_read_label", Phrase,
          Humanize.Notifications.Localized.Mark_Read_Label (C, Count => 1),
          Humanize.Notifications.Mark_Read_Label (Count => 1));
   Check (Locale, "label.notifications.mark_unread_label", Phrase,
          Humanize.Notifications.Localized.Mark_Unread_Label (C, Count => 3),
          Humanize.Notifications.Mark_Unread_Label (Count => 3));
   Check (Locale, "label.notifications.mark_unread_label", Phrase,
          Humanize.Notifications.Localized.Mark_Unread_Label (C, Count => 1),
          Humanize.Notifications.Mark_Unread_Label (Count => 1));
   Check (Locale, "label.notifications.muted_label", Phrase,
          Humanize.Notifications.Localized.Muted_Label (C, Name => "plain"),
          Humanize.Notifications.Muted_Label (Name => "plain"));
   Check (Locale, "label.notifications.new_event_label", Phrase,
          Humanize.Notifications.Localized.New_Event_Label (C, Event => Humanize.Notifications.Mention_Event),
          Humanize.Notifications.New_Event_Label (Event => Humanize.Notifications.Mention_Event));
   Check (Locale, "label.notifications.new_event_label", Phrase,
          Humanize.Notifications.Localized.New_Event_Label (C, Event => Humanize.Notifications.System_Event),
          Humanize.Notifications.New_Event_Label (Event => Humanize.Notifications.System_Event));
   Check (Locale, "label.notifications.notification_channel_label", Phrase,
          Humanize.Notifications.Localized.Notification_Channel_Label (C, Channel =>
            Humanize.Notifications.In_App_Channel),
          Humanize.Notifications.Notification_Channel_Label (Channel => Humanize.Notifications.In_App_Channel));
   Check (Locale, "label.notifications.notification_channel_label", Phrase,
          Humanize.Notifications.Localized.Notification_Channel_Label (C, Channel =>
            Humanize.Notifications.Digest_Channel),
          Humanize.Notifications.Notification_Channel_Label (Channel => Humanize.Notifications.Digest_Channel));
   Check (Locale, "label.notifications.notification_count_label", Phrase,
          Humanize.Notifications.Localized.Notification_Count_Label (C, Count => 3),
          Humanize.Notifications.Notification_Count_Label (Count => 3));
   Check (Locale, "label.notifications.notification_count_label", Phrase,
          Humanize.Notifications.Localized.Notification_Count_Label (C, Count => 1),
          Humanize.Notifications.Notification_Count_Label (Count => 1));
   Check (Locale, "label.notifications.notification_event_label", Phrase,
          Humanize.Notifications.Localized.Notification_Event_Label (C, Event =>
            Humanize.Notifications.Mention_Event),
          Humanize.Notifications.Notification_Event_Label (Event => Humanize.Notifications.Mention_Event));
   Check (Locale, "label.notifications.notification_event_label", Phrase,
          Humanize.Notifications.Localized.Notification_Event_Label (C, Event =>
            Humanize.Notifications.System_Event),
          Humanize.Notifications.Notification_Event_Label (Event => Humanize.Notifications.System_Event));
   Check (Locale, "label.notifications.notification_group_label", Phrase,
          Humanize.Notifications.Localized.Notification_Group_Label (C, Name => "plain", Count => 3),
          Humanize.Notifications.Notification_Group_Label (Name => "plain", Count => 3));
   Check (Locale, "label.notifications.notification_group_label", Phrase,
          Humanize.Notifications.Localized.Notification_Group_Label (C, Name => "plain", Count => 1),
          Humanize.Notifications.Notification_Group_Label (Name => "plain", Count => 1));
   Check (Locale, "label.notifications.notification_label", Phrase,
          Humanize.Notifications.Localized.Notification_Label (C, Subject => "plain", Event =>
            Humanize.Notifications.Mention_Event, State => Humanize.Notifications.Unread_State),
          Humanize.Notifications.Notification_Label (Subject => "plain", Event =>
            Humanize.Notifications.Mention_Event, State => Humanize.Notifications.Unread_State));
   Check (Locale, "label.notifications.notification_label", Phrase,
          Humanize.Notifications.Localized.Notification_Label (C, Subject => "plain", Event =>
            Humanize.Notifications.System_Event, State => Humanize.Notifications.Suppressed_State),
          Humanize.Notifications.Notification_Label (Subject => "plain", Event =>
            Humanize.Notifications.System_Event, State => Humanize.Notifications.Suppressed_State));
   Check (Locale, "label.notifications.notification_label", Prefix,
          Humanize.Notifications.Localized.Notification_Label (C, Subject => "plain", Event =>
            Humanize.Notifications.Mention_Event, State => Humanize.Notifications.Unread_State, Options =>
            (Humanize.Notifications.Default_Notification_Label_Options with delta Include_Surface => True)),
          Humanize.Notifications.Notification_Label (Subject => "plain", Event =>
            Humanize.Notifications.Mention_Event, State => Humanize.Notifications.Unread_State, Options =>
            (Humanize.Notifications.Default_Notification_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.notifications.notification_state_label", Phrase,
          Humanize.Notifications.Localized.Notification_State_Label (C, State =>
            Humanize.Notifications.Unread_State),
          Humanize.Notifications.Notification_State_Label (State => Humanize.Notifications.Unread_State));
   Check (Locale, "label.notifications.notification_state_label", Phrase,
          Humanize.Notifications.Localized.Notification_State_Label (C, State =>
            Humanize.Notifications.Suppressed_State),
          Humanize.Notifications.Notification_State_Label (State => Humanize.Notifications.Suppressed_State));
   Check (Locale, "label.notifications.snoozed_label", Phrase,
          Humanize.Notifications.Localized.Snoozed_Label (C, Name => "plain"),
          Humanize.Notifications.Snoozed_Label (Name => "plain"));
   Check (Locale, "label.notifications.suppressed_label", Phrase,
          Humanize.Notifications.Localized.Suppressed_Label (C, Count => 3),
          Humanize.Notifications.Suppressed_Label (Count => 3));
   Check (Locale, "label.notifications.suppressed_label", Phrase,
          Humanize.Notifications.Localized.Suppressed_Label (C, Count => 1),
          Humanize.Notifications.Suppressed_Label (Count => 1));
   Check (Locale, "label.notifications.unread_label", Phrase,
          Humanize.Notifications.Localized.Unread_Label (C, Count => 3),
          Humanize.Notifications.Unread_Label (Count => 3));
   Check (Locale, "label.notifications.unread_label", Phrase,
          Humanize.Notifications.Localized.Unread_Label (C, Count => 1),
          Humanize.Notifications.Unread_Label (Count => 1));
   Check (Locale, "label.statistics.distribution_summary_label", Phrase,
          Humanize.Numbers.Statistics.Localized.Distribution_Summary_Label (C, Count => 7, Minimum => 7.25, Median
            => 9.75, Maximum => 4.5, Unit => "plain"),
          Humanize.Numbers.Statistics.Distribution_Summary_Label (Count => 7, Minimum => 7.25, Median => 9.75,
            Maximum => 4.5, Unit => "plain"));
   Check (Locale, "label.statistics.distribution_summary_label", Phrase,
          Humanize.Numbers.Statistics.Localized.Distribution_Summary_Label (C, Count => 2, Minimum => 0.0, Median =>
            0.0, Maximum => 0.0, Unit => "plain"),
          Humanize.Numbers.Statistics.Distribution_Summary_Label (Count => 2, Minimum => 0.0, Median => 0.0, Maximum
            => 0.0, Unit => "plain"));
   Check (Locale, "label.statistics.outlier_summary_label", Phrase,
          Humanize.Numbers.Statistics.Localized.Outlier_Summary_Label (C, Outliers => 7, Total => 9),
          Humanize.Numbers.Statistics.Outlier_Summary_Label (Outliers => 7, Total => 9));
   Check (Locale, "label.statistics.outlier_summary_label", Phrase,
          Humanize.Numbers.Statistics.Localized.Outlier_Summary_Label (C, Outliers => 1, Total => 2),
          Humanize.Numbers.Statistics.Outlier_Summary_Label (Outliers => 1, Total => 2));
   Check (Locale, "label.statistics.percentile_summary_label", Phrase,
          Humanize.Numbers.Statistics.Localized.Percentile_Summary_Label (C, P50 => 7.25, P95 => 9.75, P99 => 4.5,
            Unit => "plain"),
          Humanize.Numbers.Statistics.Percentile_Summary_Label (P50 => 7.25, P95 => 9.75, P99 => 4.5, Unit =>
            "plain"));
   Check (Locale, "label.statistics.percentile_summary_label", Phrase,
          Humanize.Numbers.Statistics.Localized.Percentile_Summary_Label (C, P50 => 7.25, P95 => 0.0, P99 => 0.0,
            Unit => "plain"),
          Humanize.Numbers.Statistics.Percentile_Summary_Label (P50 => 7.25, P95 => 0.0, P99 => 0.0, Unit =>
            "plain"));
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
   Check (Locale, "label.resources.utilization_band_label", Phrase,
          Humanize.Resources.Localized.Utilization_Band_Label (C, Band => Humanize.Resources.Empty_Utilization),
          Humanize.Resources.Utilization_Band_Label (Band => Humanize.Resources.Empty_Utilization));
   Check (Locale, "label.resources.utilization_band_label", Phrase,
          Humanize.Resources.Localized.Utilization_Band_Label (C, Band =>
            Humanize.Resources.Over_Limit_Utilization),
          Humanize.Resources.Utilization_Band_Label (Band => Humanize.Resources.Over_Limit_Utilization));
end Check_Group_5;
