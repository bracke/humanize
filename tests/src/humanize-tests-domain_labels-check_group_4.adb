with Humanize.Navigation;
with Humanize.Notification_Preferences;
with Humanize.Notifications;
with Humanize.Payments;
with Humanize.Navigation.Localized;
with Humanize.Notification_Preferences.Localized;
with Humanize.Notifications.Localized;
with Humanize.Payments.Localized;

separate (Humanize.Tests.Domain_Labels)
procedure Check_Group_4 (Locale : String; C : Humanize.Contexts.Context) is
begin
   Check (Locale, "label.navigation.back_label",
          Humanize.Navigation.Localized.Back_Label (C, Target => "plain"),
          Humanize.Navigation.Back_Label (Target => "plain"));
   Check (Locale, "label.navigation.breadcrumb_trail_label",
          Humanize.Navigation.Localized.Breadcrumb_Trail_Label (C, Depth => 3),
          Humanize.Navigation.Breadcrumb_Trail_Label (Depth => 3));
   Check (Locale, "label.navigation.breadcrumb_trail_label",
          Humanize.Navigation.Localized.Breadcrumb_Trail_Label (C, Depth => 1),
          Humanize.Navigation.Breadcrumb_Trail_Label (Depth => 1));
   Check (Locale, "label.navigation.current_page_label",
          Humanize.Navigation.Localized.Current_Page_Label (C, Name => "plain"),
          Humanize.Navigation.Current_Page_Label (Name => "plain"));
   Check (Locale, "label.navigation.external_link_label",
          Humanize.Navigation.Localized.External_Link_Label (C, Name => "plain"),
          Humanize.Navigation.External_Link_Label (Name => "plain"));
   Check (Locale, "label.navigation.first_label",
          Humanize.Navigation.Localized.First_Label (C, Target => "plain"),
          Humanize.Navigation.First_Label (Target => "plain"));
   Check (Locale, "label.navigation.last_label",
          Humanize.Navigation.Localized.Last_Label (C, Target => "plain"),
          Humanize.Navigation.Last_Label (Target => "plain"));
   Check (Locale, "label.navigation.menu_count_label",
          Humanize.Navigation.Localized.Menu_Count_Label (C, Count => 3),
          Humanize.Navigation.Menu_Count_Label (Count => 3));
   Check (Locale, "label.navigation.menu_count_label",
          Humanize.Navigation.Localized.Menu_Count_Label (C, Count => 1),
          Humanize.Navigation.Menu_Count_Label (Count => 1));
   Check (Locale, "label.navigation.navigation_item_kind_label",
          Humanize.Navigation.Localized.Navigation_Item_Kind_Label (C, Kind => Humanize.Navigation.Link_Item),
          Humanize.Navigation.Navigation_Item_Kind_Label (Kind => Humanize.Navigation.Link_Item));
   Check (Locale, "label.navigation.navigation_item_kind_label",
          Humanize.Navigation.Localized.Navigation_Item_Kind_Label (C, Kind => Humanize.Navigation.Separator_Item),
          Humanize.Navigation.Navigation_Item_Kind_Label (Kind => Humanize.Navigation.Separator_Item));
   Check (Locale, "label.navigation.navigation_item_label",
          Humanize.Navigation.Localized.Navigation_Item_Label
            (C,
             Name => "plain",
             Kind => Humanize.Navigation.Link_Item,
             State => Humanize.Navigation.Current_Item),
          Humanize.Navigation.Navigation_Item_Label
            (Name => "plain",
             Kind => Humanize.Navigation.Link_Item,
             State => Humanize.Navigation.Current_Item));
   Check (Locale, "label.navigation.navigation_item_label",
          Humanize.Navigation.Localized.Navigation_Item_Label
            (C,
             Name => "plain",
             Kind => Humanize.Navigation.Separator_Item,
             State => Humanize.Navigation.External_Item),
          Humanize.Navigation.Navigation_Item_Label
            (Name => "plain",
             Kind => Humanize.Navigation.Separator_Item,
             State => Humanize.Navigation.External_Item));
   Check (Locale, "label.navigation.navigation_state_label",
          Humanize.Navigation.Localized.Navigation_State_Label (C, State => Humanize.Navigation.Current_Item),
          Humanize.Navigation.Navigation_State_Label (State => Humanize.Navigation.Current_Item));
   Check (Locale, "label.navigation.navigation_state_label",
          Humanize.Navigation.Localized.Navigation_State_Label (C, State => Humanize.Navigation.External_Item),
          Humanize.Navigation.Navigation_State_Label (State => Humanize.Navigation.External_Item));
   Check (Locale, "label.navigation.next_label",
          Humanize.Navigation.Localized.Next_Label (C, Target => "plain"),
          Humanize.Navigation.Next_Label (Target => "plain"));
   Check (Locale, "label.navigation.section_state_label",
          Humanize.Navigation.Localized.Section_State_Label (C, Name => "plain", Expanded => False, Count => 3),
          Humanize.Navigation.Section_State_Label (Name => "plain", Expanded => False, Count => 3));
   Check (Locale, "label.navigation.section_state_label",
          Humanize.Navigation.Localized.Section_State_Label (C, Name => "plain", Expanded => True, Count => 1),
          Humanize.Navigation.Section_State_Label (Name => "plain", Expanded => True, Count => 1));
   Check (Locale, "label.navigation.skip_link_label",
          Humanize.Navigation.Localized.Skip_Link_Label (C, Target => "plain"),
          Humanize.Navigation.Skip_Link_Label (Target => "plain"));
   Check (Locale, "label.navigation.submenu_label",
          Humanize.Navigation.Localized.Submenu_Label (C, Name => "plain", Count => 3),
          Humanize.Navigation.Submenu_Label (Name => "plain", Count => 3));
   Check (Locale, "label.navigation.submenu_label",
          Humanize.Navigation.Localized.Submenu_Label (C, Name => "plain", Count => 1),
          Humanize.Navigation.Submenu_Label (Name => "plain", Count => 1));
   Check (Locale, "label.notification_preferences.alert_level_label",
          Humanize.Notification_Preferences.Localized.Alert_Level_Label
            (C,
             Level => Humanize.Notification_Preferences.All_Alerts),
          Humanize.Notification_Preferences.Alert_Level_Label (Level => Humanize.Notification_Preferences.All_Alerts));
   Check (Locale, "label.notification_preferences.alert_level_label",
          Humanize.Notification_Preferences.Localized.Alert_Level_Label
            (C,
             Level => Humanize.Notification_Preferences.No_Alerts),
          Humanize.Notification_Preferences.Alert_Level_Label (Level => Humanize.Notification_Preferences.No_Alerts));
   Check (Locale, "label.notification_preferences.channel_preference_label",
          Humanize.Notification_Preferences.Localized.Channel_Preference_Label
            (C,
             Channel => "plain",
             State => Humanize.Notification_Preferences.Preference_Enabled),
          Humanize.Notification_Preferences.Channel_Preference_Label
            (Channel => "plain",
             State => Humanize.Notification_Preferences.Preference_Enabled));
   Check (Locale, "label.notification_preferences.channel_preference_label",
          Humanize.Notification_Preferences.Localized.Channel_Preference_Label
            (C,
             Channel => "plain",
             State => Humanize.Notification_Preferences.Preference_Required),
          Humanize.Notification_Preferences.Channel_Preference_Label
            (Channel => "plain",
             State => Humanize.Notification_Preferences.Preference_Required));
   Check (Locale, "label.notification_preferences.digest_schedule_label",
          Humanize.Notification_Preferences.Localized.Digest_Schedule_Label
            (C,
             Schedule => Humanize.Notification_Preferences.No_Digest),
          Humanize.Notification_Preferences.Digest_Schedule_Label
            (Schedule => Humanize.Notification_Preferences.No_Digest));
   Check (Locale, "label.notification_preferences.digest_schedule_label",
          Humanize.Notification_Preferences.Localized.Digest_Schedule_Label
            (C,
             Schedule => Humanize.Notification_Preferences.Weekly_Digest),
          Humanize.Notification_Preferences.Digest_Schedule_Label
            (Schedule => Humanize.Notification_Preferences.Weekly_Digest));
   Check (Locale, "label.notification_preferences.preference_state_label",
          Humanize.Notification_Preferences.Localized.Preference_State_Label
            (C,
             State => Humanize.Notification_Preferences.Preference_Enabled),
          Humanize.Notification_Preferences.Preference_State_Label
            (State => Humanize.Notification_Preferences.Preference_Enabled));
   Check (Locale, "label.notification_preferences.preference_state_label",
          Humanize.Notification_Preferences.Localized.Preference_State_Label
            (C,
             State => Humanize.Notification_Preferences.Preference_Required),
          Humanize.Notification_Preferences.Preference_State_Label
            (State => Humanize.Notification_Preferences.Preference_Required));
   Check (Locale, "label.notification_preferences.quiet_hours_label",
          Humanize.Notification_Preferences.Localized.Quiet_Hours_Label (C, Time_Text => "plain"),
          Humanize.Notification_Preferences.Quiet_Hours_Label (Time_Text => "plain"));
   Check (Locale, "label.notification_preferences.subscription_label",
          Humanize.Notification_Preferences.Localized.Subscription_Label
            (C,
             Name => "plain",
             Scope => Humanize.Notification_Preferences.Thread_Subscription,
             State => Humanize.Notification_Preferences.Preference_Enabled),
          Humanize.Notification_Preferences.Subscription_Label
            (Name => "plain",
             Scope => Humanize.Notification_Preferences.Thread_Subscription,
             State => Humanize.Notification_Preferences.Preference_Enabled));
   Check (Locale, "label.notification_preferences.subscription_label",
          Humanize.Notification_Preferences.Localized.Subscription_Label
            (C,
             Name => "plain",
             Scope => Humanize.Notification_Preferences.Account_Subscription,
             State => Humanize.Notification_Preferences.Preference_Required),
          Humanize.Notification_Preferences.Subscription_Label
            (Name => "plain",
             Scope => Humanize.Notification_Preferences.Account_Subscription,
             State => Humanize.Notification_Preferences.Preference_Required));
   Check (Locale, "label.notification_preferences.subscription_scope_label",
          Humanize.Notification_Preferences.Localized.Subscription_Scope_Label
            (C,
             Scope => Humanize.Notification_Preferences.Thread_Subscription),
          Humanize.Notification_Preferences.Subscription_Scope_Label
            (Scope => Humanize.Notification_Preferences.Thread_Subscription));
   Check (Locale, "label.notification_preferences.subscription_scope_label",
          Humanize.Notification_Preferences.Localized.Subscription_Scope_Label
            (C,
             Scope => Humanize.Notification_Preferences.Account_Subscription),
          Humanize.Notification_Preferences.Subscription_Scope_Label
            (Scope => Humanize.Notification_Preferences.Account_Subscription));
   Check (Locale, "label.notifications.actor_event_label",
          Humanize.Notifications.Localized.Actor_Event_Label
            (C,
             Actor => "plain",
             Event => Humanize.Notifications.Mention_Event),
          Humanize.Notifications.Actor_Event_Label (Actor => "plain", Event => Humanize.Notifications.Mention_Event));
   Check (Locale, "label.notifications.actor_event_label",
          Humanize.Notifications.Localized.Actor_Event_Label
            (C,
             Actor => "plain",
             Event => Humanize.Notifications.System_Event),
          Humanize.Notifications.Actor_Event_Label (Actor => "plain", Event => Humanize.Notifications.System_Event));
   Check (Locale, "label.notifications.delivery_label",
          Humanize.Notifications.Localized.Delivery_Label
            (C,
             Channel => Humanize.Notifications.In_App_Channel,
             State => Humanize.Notifications.Pending_Delivery),
          Humanize.Notifications.Delivery_Label
            (Channel => Humanize.Notifications.In_App_Channel,
             State => Humanize.Notifications.Pending_Delivery));
   Check (Locale, "label.notifications.delivery_label",
          Humanize.Notifications.Localized.Delivery_Label
            (C,
             Channel => Humanize.Notifications.Digest_Channel,
             State => Humanize.Notifications.Canceled_Delivery),
          Humanize.Notifications.Delivery_Label
            (Channel => Humanize.Notifications.Digest_Channel,
             State => Humanize.Notifications.Canceled_Delivery));
   Check (Locale, "label.notifications.delivery_state_label",
          Humanize.Notifications.Localized.Delivery_State_Label (C, State => Humanize.Notifications.Pending_Delivery),
          Humanize.Notifications.Delivery_State_Label (State => Humanize.Notifications.Pending_Delivery));
   Check (Locale, "label.notifications.delivery_state_label",
          Humanize.Notifications.Localized.Delivery_State_Label
            (C,
             State => Humanize.Notifications.Canceled_Delivery),
          Humanize.Notifications.Delivery_State_Label (State => Humanize.Notifications.Canceled_Delivery));
   Check (Locale, "label.notifications.delivery_time_label",
          Humanize.Notifications.Localized.Delivery_Time_Label
            (C,
             State => Humanize.Notifications.Pending_Delivery,
             Time_Text => "plain"),
          Humanize.Notifications.Delivery_Time_Label
            (State => Humanize.Notifications.Pending_Delivery,
             Time_Text => "plain"));
   Check (Locale, "label.notifications.delivery_time_label",
          Humanize.Notifications.Localized.Delivery_Time_Label
            (C,
             State => Humanize.Notifications.Canceled_Delivery,
             Time_Text => "plain"),
          Humanize.Notifications.Delivery_Time_Label
            (State => Humanize.Notifications.Canceled_Delivery,
             Time_Text => "plain"));
   Check (Locale, "label.notifications.digest_label",
          Humanize.Notifications.Localized.Digest_Label (C, Count => 3, Name => "plain"),
          Humanize.Notifications.Digest_Label (Count => 3, Name => "plain"));
   Check (Locale, "label.notifications.digest_label",
          Humanize.Notifications.Localized.Digest_Label (C, Count => 1, Name => "plain"),
          Humanize.Notifications.Digest_Label (Count => 1, Name => "plain"));
   Check (Locale, "label.notifications.event_count_label",
          Humanize.Notifications.Localized.Event_Count_Label
            (C,
             Event => Humanize.Notifications.Mention_Event,
             Count => 3),
          Humanize.Notifications.Event_Count_Label (Event => Humanize.Notifications.Mention_Event, Count => 3));
   Check (Locale, "label.notifications.event_count_label",
          Humanize.Notifications.Localized.Event_Count_Label
            (C,
             Event => Humanize.Notifications.System_Event,
             Count => 1),
          Humanize.Notifications.Event_Count_Label (Event => Humanize.Notifications.System_Event, Count => 1));
   Check (Locale, "label.notifications.mark_read_label",
          Humanize.Notifications.Localized.Mark_Read_Label (C, Count => 3),
          Humanize.Notifications.Mark_Read_Label (Count => 3));
   Check (Locale, "label.notifications.mark_read_label",
          Humanize.Notifications.Localized.Mark_Read_Label (C, Count => 1),
          Humanize.Notifications.Mark_Read_Label (Count => 1));
   Check (Locale, "label.notifications.mark_unread_label",
          Humanize.Notifications.Localized.Mark_Unread_Label (C, Count => 3),
          Humanize.Notifications.Mark_Unread_Label (Count => 3));
   Check (Locale, "label.notifications.mark_unread_label",
          Humanize.Notifications.Localized.Mark_Unread_Label (C, Count => 1),
          Humanize.Notifications.Mark_Unread_Label (Count => 1));
   Check (Locale, "label.notifications.muted_label",
          Humanize.Notifications.Localized.Muted_Label (C, Name => "plain"),
          Humanize.Notifications.Muted_Label (Name => "plain"));
   Check (Locale, "label.notifications.new_event_label",
          Humanize.Notifications.Localized.New_Event_Label (C, Event => Humanize.Notifications.Mention_Event),
          Humanize.Notifications.New_Event_Label (Event => Humanize.Notifications.Mention_Event));
   Check (Locale, "label.notifications.new_event_label",
          Humanize.Notifications.Localized.New_Event_Label (C, Event => Humanize.Notifications.System_Event),
          Humanize.Notifications.New_Event_Label (Event => Humanize.Notifications.System_Event));
   Check (Locale, "label.notifications.notification_channel_label",
          Humanize.Notifications.Localized.Notification_Channel_Label
            (C,
             Channel => Humanize.Notifications.In_App_Channel),
          Humanize.Notifications.Notification_Channel_Label (Channel => Humanize.Notifications.In_App_Channel));
   Check (Locale, "label.notifications.notification_channel_label",
          Humanize.Notifications.Localized.Notification_Channel_Label
            (C,
             Channel => Humanize.Notifications.Digest_Channel),
          Humanize.Notifications.Notification_Channel_Label (Channel => Humanize.Notifications.Digest_Channel));
   Check (Locale, "label.notifications.notification_count_label",
          Humanize.Notifications.Localized.Notification_Count_Label (C, Count => 3),
          Humanize.Notifications.Notification_Count_Label (Count => 3));
   Check (Locale, "label.notifications.notification_count_label",
          Humanize.Notifications.Localized.Notification_Count_Label (C, Count => 1),
          Humanize.Notifications.Notification_Count_Label (Count => 1));
   Check (Locale, "label.notifications.notification_event_label",
          Humanize.Notifications.Localized.Notification_Event_Label
            (C,
             Event => Humanize.Notifications.Mention_Event),
          Humanize.Notifications.Notification_Event_Label (Event => Humanize.Notifications.Mention_Event));
   Check (Locale, "label.notifications.notification_event_label",
          Humanize.Notifications.Localized.Notification_Event_Label (C, Event => Humanize.Notifications.System_Event),
          Humanize.Notifications.Notification_Event_Label (Event => Humanize.Notifications.System_Event));
   Check (Locale, "label.notifications.notification_group_label",
          Humanize.Notifications.Localized.Notification_Group_Label (C, Name => "plain", Count => 3),
          Humanize.Notifications.Notification_Group_Label (Name => "plain", Count => 3));
   Check (Locale, "label.notifications.notification_group_label",
          Humanize.Notifications.Localized.Notification_Group_Label (C, Name => "plain", Count => 1),
          Humanize.Notifications.Notification_Group_Label (Name => "plain", Count => 1));
   Check (Locale, "label.notifications.notification_label",
          Humanize.Notifications.Localized.Notification_Label
            (C,
             Subject => "plain",
             Event => Humanize.Notifications.Mention_Event,
             State => Humanize.Notifications.Unread_State),
          Humanize.Notifications.Notification_Label
            (Subject => "plain",
             Event => Humanize.Notifications.Mention_Event,
             State => Humanize.Notifications.Unread_State));
   Check (Locale, "label.notifications.notification_label",
          Humanize.Notifications.Localized.Notification_Label
            (C,
             Subject => "plain",
             Event => Humanize.Notifications.System_Event,
             State => Humanize.Notifications.Suppressed_State),
          Humanize.Notifications.Notification_Label
            (Subject => "plain",
             Event => Humanize.Notifications.System_Event,
             State => Humanize.Notifications.Suppressed_State));
   Check (Locale, "label.notifications.notification_state_label",
          Humanize.Notifications.Localized.Notification_State_Label (C, State => Humanize.Notifications.Unread_State),
          Humanize.Notifications.Notification_State_Label (State => Humanize.Notifications.Unread_State));
   Check (Locale, "label.notifications.notification_state_label",
          Humanize.Notifications.Localized.Notification_State_Label
            (C,
             State => Humanize.Notifications.Suppressed_State),
          Humanize.Notifications.Notification_State_Label (State => Humanize.Notifications.Suppressed_State));
   Check (Locale, "label.notifications.snoozed_label",
          Humanize.Notifications.Localized.Snoozed_Label (C, Name => "plain"),
          Humanize.Notifications.Snoozed_Label (Name => "plain"));
   Check (Locale, "label.notifications.suppressed_label",
          Humanize.Notifications.Localized.Suppressed_Label (C, Count => 3),
          Humanize.Notifications.Suppressed_Label (Count => 3));
   Check (Locale, "label.notifications.suppressed_label",
          Humanize.Notifications.Localized.Suppressed_Label (C, Count => 1),
          Humanize.Notifications.Suppressed_Label (Count => 1));
   Check (Locale, "label.notifications.unread_label",
          Humanize.Notifications.Localized.Unread_Label (C, Count => 3),
          Humanize.Notifications.Unread_Label (Count => 3));
   Check (Locale, "label.notifications.unread_label",
          Humanize.Notifications.Localized.Unread_Label (C, Count => 1),
          Humanize.Notifications.Unread_Label (Count => 1));
   Check (Locale, "label.payments.amount_label",
          Humanize.Payments.Localized.Amount_Label (C, Amount_Text => "plain"),
          Humanize.Payments.Amount_Label (Amount_Text => "plain"));
   Check (Locale, "label.payments.balance_label",
          Humanize.Payments.Localized.Balance_Label (C, Amount_Text => "plain"),
          Humanize.Payments.Balance_Label (Amount_Text => "plain"));
   Check (Locale, "label.payments.chargeback_label",
          Humanize.Payments.Localized.Chargeback_Label (C, Amount_Text => "plain"),
          Humanize.Payments.Chargeback_Label (Amount_Text => "plain"));
   Check (Locale, "label.payments.discount_label",
          Humanize.Payments.Localized.Discount_Label (C, Amount_Text => "plain"),
          Humanize.Payments.Discount_Label (Amount_Text => "plain"));
   Check (Locale, "label.payments.due_label",
          Humanize.Payments.Localized.Due_Label (C, Amount_Text => "plain", Due_Text => "plain"),
          Humanize.Payments.Due_Label (Amount_Text => "plain", Due_Text => "plain"));
   Check (Locale, "label.payments.invoice_count_label",
          Humanize.Payments.Localized.Invoice_Count_Label (C, Count => 3),
          Humanize.Payments.Invoice_Count_Label (Count => 3));
   Check (Locale, "label.payments.invoice_count_label",
          Humanize.Payments.Localized.Invoice_Count_Label (C, Count => 1),
          Humanize.Payments.Invoice_Count_Label (Count => 1));
   Check (Locale, "label.payments.invoice_label",
          Humanize.Payments.Localized.Invoice_Label (C, Number => "plain", State => Humanize.Payments.Draft_Invoice),
          Humanize.Payments.Invoice_Label (Number => "plain", State => Humanize.Payments.Draft_Invoice));
   Check (Locale, "label.payments.invoice_label",
          Humanize.Payments.Localized.Invoice_Label (C, Number => "plain", State => Humanize.Payments.Void_Invoice),
          Humanize.Payments.Invoice_Label (Number => "plain", State => Humanize.Payments.Void_Invoice));
   Check (Locale, "label.payments.invoice_state_label",
          Humanize.Payments.Localized.Invoice_State_Label (C, State => Humanize.Payments.Draft_Invoice),
          Humanize.Payments.Invoice_State_Label (State => Humanize.Payments.Draft_Invoice));
   Check (Locale, "label.payments.invoice_state_label",
          Humanize.Payments.Localized.Invoice_State_Label (C, State => Humanize.Payments.Void_Invoice),
          Humanize.Payments.Invoice_State_Label (State => Humanize.Payments.Void_Invoice));
   Check (Locale, "label.payments.method_label",
          Humanize.Payments.Localized.Method_Label (C, Method => Humanize.Payments.Card_Method, Detail => "plain"),
          Humanize.Payments.Method_Label (Method => Humanize.Payments.Card_Method, Detail => "plain"));
   Check (Locale, "label.payments.method_label",
          Humanize.Payments.Localized.Method_Label (C, Method => Humanize.Payments.Other_Method, Detail => "plain"),
          Humanize.Payments.Method_Label (Method => Humanize.Payments.Other_Method, Detail => "plain"));
   Check (Locale, "label.payments.paid_label",
          Humanize.Payments.Localized.Paid_Label (C, Amount_Text => "plain", Paid_Text => "plain"),
          Humanize.Payments.Paid_Label (Amount_Text => "plain", Paid_Text => "plain"));
   Check (Locale, "label.payments.payment_count_label",
          Humanize.Payments.Localized.Payment_Count_Label (C, Count => 3),
          Humanize.Payments.Payment_Count_Label (Count => 3));
   Check (Locale, "label.payments.payment_count_label",
          Humanize.Payments.Localized.Payment_Count_Label (C, Count => 1),
          Humanize.Payments.Payment_Count_Label (Count => 1));
   Check (Locale, "label.payments.payment_label",
          Humanize.Payments.Localized.Payment_Label
            (C,
             Amount_Text => "plain",
             State => Humanize.Payments.Pending_Payment),
          Humanize.Payments.Payment_Label (Amount_Text => "plain", State => Humanize.Payments.Pending_Payment));
   Check (Locale, "label.payments.payment_label",
          Humanize.Payments.Localized.Payment_Label
            (C,
             Amount_Text => "plain",
             State => Humanize.Payments.Canceled_Payment),
          Humanize.Payments.Payment_Label (Amount_Text => "plain", State => Humanize.Payments.Canceled_Payment));
   Check (Locale, "label.payments.payment_link_label",
          Humanize.Payments.Localized.Payment_Link_Label (C, Name => "plain"),
          Humanize.Payments.Payment_Link_Label (Name => "plain"));
   Check (Locale, "label.payments.payment_method_label",
          Humanize.Payments.Localized.Payment_Method_Label (C, Method => Humanize.Payments.Card_Method),
          Humanize.Payments.Payment_Method_Label (Method => Humanize.Payments.Card_Method));
   Check (Locale, "label.payments.payment_method_label",
          Humanize.Payments.Localized.Payment_Method_Label (C, Method => Humanize.Payments.Other_Method),
          Humanize.Payments.Payment_Method_Label (Method => Humanize.Payments.Other_Method));
   Check (Locale, "label.payments.payment_state_label",
          Humanize.Payments.Localized.Payment_State_Label (C, State => Humanize.Payments.Pending_Payment),
          Humanize.Payments.Payment_State_Label (State => Humanize.Payments.Pending_Payment));
   Check (Locale, "label.payments.payment_state_label",
          Humanize.Payments.Localized.Payment_State_Label (C, State => Humanize.Payments.Canceled_Payment),
          Humanize.Payments.Payment_State_Label (State => Humanize.Payments.Canceled_Payment));
   Check (Locale, "label.payments.receipt_label",
          Humanize.Payments.Localized.Receipt_Label (C, Number => "plain"),
          Humanize.Payments.Receipt_Label (Number => "plain"));
   Check (Locale, "label.payments.refund_label",
          Humanize.Payments.Localized.Refund_Label
            (C,
             Amount_Text => "plain",
             State => Humanize.Payments.Pending_Payment),
          Humanize.Payments.Refund_Label (Amount_Text => "plain", State => Humanize.Payments.Pending_Payment));
   Check (Locale, "label.payments.refund_label",
          Humanize.Payments.Localized.Refund_Label
            (C,
             Amount_Text => "plain",
             State => Humanize.Payments.Canceled_Payment),
          Humanize.Payments.Refund_Label (Amount_Text => "plain", State => Humanize.Payments.Canceled_Payment));
   Check (Locale, "label.payments.subtotal_label",
          Humanize.Payments.Localized.Subtotal_Label (C, Amount_Text => "plain"),
          Humanize.Payments.Subtotal_Label (Amount_Text => "plain"));
   Check (Locale, "label.payments.tax_label",
          Humanize.Payments.Localized.Tax_Label (C, Amount_Text => "plain"),
          Humanize.Payments.Tax_Label (Amount_Text => "plain"));
   Check (Locale, "label.payments.total_label",
          Humanize.Payments.Localized.Total_Label (C, Amount_Text => "plain"),
          Humanize.Payments.Total_Label (Amount_Text => "plain"));
end Check_Group_4;
