with Humanize.Navigation;
with Humanize.Notification_Preferences;
with Humanize.Notifications;
with Humanize.Numbers.Statistics;
with Humanize.Navigation.Localized;
with Humanize.Notification_Preferences.Localized;
with Humanize.Notifications.Localized;
with Humanize.Numbers.Statistics.Localized;

separate (Humanize.Tests.Domain_Labels)
procedure Check_Group_5 (Locale : String; C : Humanize.Contexts.Context) is
begin
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
   Check (Locale, "label.statistics.distribution_shape_label", Phrase,
          Humanize.Numbers.Statistics.Localized.Distribution_Shape_Label (C, Metadata => (Kind =>
            Humanize.Numbers.Flat_Shape, Count => 10, others => <>), Median => 3.5),
          Humanize.Numbers.Statistics.Distribution_Shape_Label (Metadata => (Kind => Humanize.Numbers.Flat_Shape,
            Count => 10, others => <>), Median => 3.5));
   Check (Locale, "label.statistics.distribution_shape_label", Phrase,
          Humanize.Numbers.Statistics.Localized.Distribution_Shape_Label (C, Metadata => (Kind =>
            Humanize.Numbers.Wide_Spread_Shape, Count => 10, others => <>)),
          Humanize.Numbers.Statistics.Distribution_Shape_Label (Metadata => (Kind =>
            Humanize.Numbers.Wide_Spread_Shape, Count => 10, others => <>)));
   Check (Locale, "label.statistics.distribution_shape_label", Phrase,
          Humanize.Numbers.Statistics.Localized.Distribution_Shape_Label (C, Metadata => (Kind =>
            Humanize.Numbers.Sample_Too_Small_Shape, Count => 2, others => <>), Unit => "ms"),
          Humanize.Numbers.Statistics.Distribution_Shape_Label (Metadata => (Kind =>
            Humanize.Numbers.Sample_Too_Small_Shape, Count => 2, others => <>), Unit => "ms"));
   Check (Locale, "label.statistics.distribution_shape_label", Phrase,
          Humanize.Numbers.Statistics.Localized.Distribution_Shape_Label (C, 40, 1.0, 2.0, 3.0, 4.0, 10.0),
          Humanize.Numbers.Statistics.Distribution_Shape_Label (40, 1.0, 2.0, 3.0, 4.0, 10.0));
   Check (Locale, "label.statistics.distribution_shape_label", Phrase,
          Humanize.Numbers.Statistics.Localized.Distribution_Shape_Label (C, 0, 0.0, 0.0, 0.0, 0.0, 0.0),
          Humanize.Numbers.Statistics.Distribution_Shape_Label (0, 0.0, 0.0, 0.0, 0.0, 0.0));
   Check (Locale, "label.statistics.distribution_shape_label", Phrase,
          Humanize.Numbers.Statistics.Localized.Distribution_Shape_Label (C, 3, 1.0, 2.0, 3.0, 4.0, 5.0),
          Humanize.Numbers.Statistics.Distribution_Shape_Label (3, 1.0, 2.0, 3.0, 4.0, 5.0));
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
end Check_Group_5;
