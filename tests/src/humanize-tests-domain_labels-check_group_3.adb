with Humanize.Deployments;
with Humanize.Diagnostics;
with Humanize.Endpoints;
with Humanize.Events;
with Humanize.Deployments.Localized;
with Humanize.Diagnostics.Localized;
with Humanize.Endpoints.Localized;
with Humanize.Events.Localized;

separate (Humanize.Tests.Domain_Labels)
procedure Check_Group_3 (Locale : String; C : Humanize.Contexts.Context) is
begin
   Check (Locale, "label.deployments.artifact_state_label", Phrase,
          Humanize.Deployments.Localized.Artifact_State_Label (C, State => Humanize.Deployments.Artifact_Ready),
          Humanize.Deployments.Artifact_State_Label (State => Humanize.Deployments.Artifact_Ready));
   Check (Locale, "label.deployments.artifact_state_label", Phrase,
          Humanize.Deployments.Localized.Artifact_State_Label (C, State => Humanize.Deployments.Artifact_Expired),
          Humanize.Deployments.Artifact_State_Label (State => Humanize.Deployments.Artifact_Expired));
   Check (Locale, "label.deployments.deployment_label", Phrase,
          Humanize.Deployments.Localized.Deployment_Label (C, Name => "plain", Environment => "plain", State =>
            Humanize.Deployments.Queued_Deployment),
          Humanize.Deployments.Deployment_Label (Name => "plain", Environment => "plain", State =>
            Humanize.Deployments.Queued_Deployment));
   Check (Locale, "label.deployments.deployment_label", Phrase,
          Humanize.Deployments.Localized.Deployment_Label (C, Name => "plain", Environment => "plain", State =>
            Humanize.Deployments.Canceled_Deployment),
          Humanize.Deployments.Deployment_Label (Name => "plain", Environment => "plain", State =>
            Humanize.Deployments.Canceled_Deployment));
   Check (Locale, "label.deployments.deployment_label", Prefix,
          Humanize.Deployments.Localized.Deployment_Label (C, Name => "plain", Environment => "plain", State =>
            Humanize.Deployments.Queued_Deployment, Options =>
            (Humanize.Deployments.Default_Deployment_Label_Options with delta Include_Surface => True)),
          Humanize.Deployments.Deployment_Label (Name => "plain", Environment => "plain", State =>
            Humanize.Deployments.Queued_Deployment, Options =>
            (Humanize.Deployments.Default_Deployment_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.deployments.deployment_state_label", Phrase,
          Humanize.Deployments.Localized.Deployment_State_Label (C, State =>
            Humanize.Deployments.Queued_Deployment),
          Humanize.Deployments.Deployment_State_Label (State => Humanize.Deployments.Queued_Deployment));
   Check (Locale, "label.deployments.deployment_state_label", Phrase,
          Humanize.Deployments.Localized.Deployment_State_Label (C, State =>
            Humanize.Deployments.Canceled_Deployment),
          Humanize.Deployments.Deployment_State_Label (State => Humanize.Deployments.Canceled_Deployment));
   Check (Locale, "label.deployments.environment_state_label", Phrase,
          Humanize.Deployments.Localized.Environment_State_Label (C, State =>
            Humanize.Deployments.Healthy_Environment),
          Humanize.Deployments.Environment_State_Label (State => Humanize.Deployments.Healthy_Environment));
   Check (Locale, "label.deployments.environment_state_label", Phrase,
          Humanize.Deployments.Localized.Environment_State_Label (C, State =>
            Humanize.Deployments.Unknown_Environment),
          Humanize.Deployments.Environment_State_Label (State => Humanize.Deployments.Unknown_Environment));
   Check (Locale, "label.deployments.migration_state_label", Phrase,
          Humanize.Deployments.Localized.Migration_State_Label (C, State => Humanize.Deployments.No_Migration),
          Humanize.Deployments.Migration_State_Label (State => Humanize.Deployments.No_Migration));
   Check (Locale, "label.deployments.migration_state_label", Phrase,
          Humanize.Deployments.Localized.Migration_State_Label (C, State => Humanize.Deployments.Migration_Failed),
          Humanize.Deployments.Migration_State_Label (State => Humanize.Deployments.Migration_Failed));
   Check (Locale, "label.deployments.promotion_label", Phrase,
          Humanize.Deployments.Localized.Promotion_Label (C, Name => "plain", From_Environment => "plain",
            To_Environment => "plain"),
          Humanize.Deployments.Promotion_Label (Name => "plain", From_Environment => "plain", To_Environment =>
            "plain"));
   Check (Locale, "label.deployments.rollback_label", Phrase,
          Humanize.Deployments.Localized.Rollback_Label (C, Name => "plain", Target => "plain"),
          Humanize.Deployments.Rollback_Label (Name => "plain", Target => "plain"));
   Check (Locale, "label.deployments.rollout_label", Phrase,
          Humanize.Deployments.Localized.Rollout_Label (C, Name => "plain", Percent_Text => "plain"),
          Humanize.Deployments.Rollout_Label (Name => "plain", Percent_Text => "plain"));
   Check (Locale, "label.diagnostics.affected_items_label", Phrase,
          Humanize.Diagnostics.Localized.Affected_Items_Label (C, Count => 3),
          Humanize.Diagnostics.Affected_Items_Label (Count => 3));
   Check (Locale, "label.diagnostics.affected_items_label", Phrase,
          Humanize.Diagnostics.Localized.Affected_Items_Label (C, Count => 1),
          Humanize.Diagnostics.Affected_Items_Label (Count => 1));
   Check (Locale, "label.diagnostics.check_duration_label", Phrase,
          Humanize.Diagnostics.Localized.Check_Duration_Label (C, Name => "plain", Status =>
            Humanize.Diagnostics.Passed_Check, Duration_S => 3),
          Humanize.Diagnostics.Check_Duration_Label (Name => "plain", Status => Humanize.Diagnostics.Passed_Check,
            Duration_S => 3));
   Check (Locale, "label.diagnostics.check_duration_label", Phrase,
          Humanize.Diagnostics.Localized.Check_Duration_Label (C, Name => "plain", Status =>
            Humanize.Diagnostics.Running_Check, Duration_S => 1),
          Humanize.Diagnostics.Check_Duration_Label (Name => "plain", Status => Humanize.Diagnostics.Running_Check,
            Duration_S => 1));
   Check (Locale, "label.diagnostics.check_result_label", Phrase,
          Humanize.Diagnostics.Localized.Check_Result_Label (C, Name => "plain", Status =>
            Humanize.Diagnostics.Passed_Check),
          Humanize.Diagnostics.Check_Result_Label (Name => "plain", Status => Humanize.Diagnostics.Passed_Check));
   Check (Locale, "label.diagnostics.check_result_label", Phrase,
          Humanize.Diagnostics.Localized.Check_Result_Label (C, Name => "plain", Status =>
            Humanize.Diagnostics.Running_Check),
          Humanize.Diagnostics.Check_Result_Label (Name => "plain", Status => Humanize.Diagnostics.Running_Check));
   Check (Locale, "label.diagnostics.check_result_label", Prefix,
          Humanize.Diagnostics.Localized.Check_Result_Label (C, Name => "plain", Status =>
            Humanize.Diagnostics.Passed_Check, Options => (Humanize.Diagnostics.Default_Diagnostic_Label_Options
            with delta Include_Surface => True)),
          Humanize.Diagnostics.Check_Result_Label (Name => "plain", Status => Humanize.Diagnostics.Passed_Check,
            Options => (Humanize.Diagnostics.Default_Diagnostic_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.diagnostics.check_run_summary_label", Plain,
          Humanize.Diagnostics.Localized.Check_Run_Summary_Label (C, Passed => 3, Failed => 1, Warnings => 2),
          Humanize.Diagnostics.Check_Run_Summary_Label (Passed => 3, Failed => 1, Warnings => 2));
   Check (Locale, "label.diagnostics.check_run_summary_label", Plain,
          Humanize.Diagnostics.Localized.Check_Run_Summary_Label (C),
          Humanize.Diagnostics.Check_Run_Summary_Label);
   Check (Locale, "label.diagnostics.check_run_summary_label", Plain,
          Humanize.Diagnostics.Localized.Check_Run_Summary_Label (C, Pending => 1),
          Humanize.Diagnostics.Check_Run_Summary_Label (Pending => 1));
   Check (Locale, "label.diagnostics.check_status_label", Phrase,
          Humanize.Diagnostics.Localized.Check_Status_Label (C, Status => Humanize.Diagnostics.Passed_Check),
          Humanize.Diagnostics.Check_Status_Label (Status => Humanize.Diagnostics.Passed_Check));
   Check (Locale, "label.diagnostics.check_status_label", Phrase,
          Humanize.Diagnostics.Localized.Check_Status_Label (C, Status => Humanize.Diagnostics.Running_Check),
          Humanize.Diagnostics.Check_Status_Label (Status => Humanize.Diagnostics.Running_Check));
   Check (Locale, "label.diagnostics.diagnostic_explanation_label", Phrase,
          Humanize.Diagnostics.Localized.Diagnostic_Explanation_Label (C, Kind =>
            Humanize.Diagnostics.Expected_Value, Subject => "plain", Position => 3, Suggestion => "plain"),
          Humanize.Diagnostics.Diagnostic_Explanation_Label (Kind => Humanize.Diagnostics.Expected_Value, Subject =>
            "plain", Position => 3, Suggestion => "plain"));
   Check (Locale, "label.diagnostics.diagnostic_explanation_label", Phrase,
          Humanize.Diagnostics.Localized.Diagnostic_Explanation_Label (C, Kind =>
            Humanize.Diagnostics.Unknown_Diagnostic_Explanation, Subject => "plain", Position => 1, Suggestion =>
            "plain"),
          Humanize.Diagnostics.Diagnostic_Explanation_Label (Kind =>
            Humanize.Diagnostics.Unknown_Diagnostic_Explanation, Subject => "plain", Position => 1, Suggestion =>
            "plain"));
   Check (Locale, "label.diagnostics.diagnostic_label", Phrase,
          Humanize.Diagnostics.Localized.Diagnostic_Label (C, Message => "plain", Severity =>
            Humanize.Diagnostics.Info_Severity, Path => "plain", Line => 3),
          Humanize.Diagnostics.Diagnostic_Label (Message => "plain", Severity => Humanize.Diagnostics.Info_Severity,
            Path => "plain", Line => 3));
   Check (Locale, "label.diagnostics.diagnostic_label", Phrase,
          Humanize.Diagnostics.Localized.Diagnostic_Label (C, Message => "plain", Severity =>
            Humanize.Diagnostics.Blocking_Severity, Path => "plain", Line => 1),
          Humanize.Diagnostics.Diagnostic_Label (Message => "plain", Severity =>
            Humanize.Diagnostics.Blocking_Severity, Path => "plain", Line => 1));
   Check (Locale, "label.diagnostics.diagnostic_label", Prefix,
          Humanize.Diagnostics.Localized.Diagnostic_Label (C, Message => "plain", Severity =>
            Humanize.Diagnostics.Info_Severity, Path => "plain", Line => 3, Options =>
            (Humanize.Diagnostics.Default_Diagnostic_Label_Options with delta Include_Surface => True)),
          Humanize.Diagnostics.Diagnostic_Label (Message => "plain", Severity => Humanize.Diagnostics.Info_Severity,
            Path => "plain", Line => 3, Options => (Humanize.Diagnostics.Default_Diagnostic_Label_Options with delta
            Include_Surface => True)));
   Check (Locale, "label.diagnostics.failed_at_label", Phrase,
          Humanize.Diagnostics.Localized.Failed_At_Label (C, Path => "plain", Line => 3, Column => 3),
          Humanize.Diagnostics.Failed_At_Label (Path => "plain", Line => 3, Column => 3));
   Check (Locale, "label.diagnostics.failed_at_label", Phrase,
          Humanize.Diagnostics.Localized.Failed_At_Label (C, Path => "plain", Line => 1, Column => 1),
          Humanize.Diagnostics.Failed_At_Label (Path => "plain", Line => 1, Column => 1));
   Check (Locale, "label.diagnostics.field_problem_label", Phrase,
          Humanize.Diagnostics.Localized.Field_Problem_Label (C, Field_Name => "plain", Message => "plain", Severity
            => Humanize.Diagnostics.Info_Severity),
          Humanize.Diagnostics.Field_Problem_Label (Field_Name => "plain", Message => "plain", Severity =>
            Humanize.Diagnostics.Info_Severity));
   Check (Locale, "label.diagnostics.field_problem_label", Phrase,
          Humanize.Diagnostics.Localized.Field_Problem_Label (C, Field_Name => "plain", Message => "plain", Severity
            => Humanize.Diagnostics.Blocking_Severity),
          Humanize.Diagnostics.Field_Problem_Label (Field_Name => "plain", Message => "plain", Severity =>
            Humanize.Diagnostics.Blocking_Severity));
   Check (Locale, "label.diagnostics.field_problem_label", Prefix,
          Humanize.Diagnostics.Localized.Field_Problem_Label (C, Field_Name => "plain", Message => "plain", Severity
            => Humanize.Diagnostics.Info_Severity, Options => (Humanize.Diagnostics.Default_Diagnostic_Label_Options
            with delta Include_Surface => True)),
          Humanize.Diagnostics.Field_Problem_Label (Field_Name => "plain", Message => "plain", Severity =>
            Humanize.Diagnostics.Info_Severity, Options => (Humanize.Diagnostics.Default_Diagnostic_Label_Options
            with delta Include_Surface => True)));
   Check (Locale, "label.diagnostics.first_failure_label", Phrase,
          Humanize.Diagnostics.Localized.First_Failure_Label (C, Check_Name => "plain", Path => "plain", Line => 3),
          Humanize.Diagnostics.First_Failure_Label (Check_Name => "plain", Path => "plain", Line => 3));
   Check (Locale, "label.diagnostics.first_failure_label", Phrase,
          Humanize.Diagnostics.Localized.First_Failure_Label (C, Check_Name => "plain", Path => "plain", Line => 1),
          Humanize.Diagnostics.First_Failure_Label (Check_Name => "plain", Path => "plain", Line => 1));
   Check (Locale, "label.diagnostics.issue_count_label", Phrase,
          Humanize.Diagnostics.Localized.Issue_Count_Label (C, Errors => 3, Warnings => 3, Notices => 3),
          Humanize.Diagnostics.Issue_Count_Label (Errors => 3, Warnings => 3, Notices => 3));
   Check (Locale, "label.diagnostics.issue_count_label", Phrase,
          Humanize.Diagnostics.Localized.Issue_Count_Label (C, Errors => 1, Warnings => 1, Notices => 1),
          Humanize.Diagnostics.Issue_Count_Label (Errors => 1, Warnings => 1, Notices => 1));
   Check (Locale, "label.diagnostics.issue_summary_label", Phrase,
          Humanize.Diagnostics.Localized.Issue_Summary_Label (C, Errors => 7, Warnings => 9, Notices => 4, Blocking
            => 6),
          Humanize.Diagnostics.Issue_Summary_Label (Errors => 7, Warnings => 9, Notices => 4, Blocking => 6));
   Check (Locale, "label.diagnostics.issue_summary_label", Phrase,
          Humanize.Diagnostics.Localized.Issue_Summary_Label (C, Errors => 2, Warnings => 0, Notices => 0, Blocking
            => 0),
          Humanize.Diagnostics.Issue_Summary_Label (Errors => 2, Warnings => 0, Notices => 0, Blocking => 0));
   Check (Locale, "label.diagnostics.location_label", Phrase,
          Humanize.Diagnostics.Localized.Location_Label (C, Path => "plain", Line => 3, Column => 3),
          Humanize.Diagnostics.Location_Label (Path => "plain", Line => 3, Column => 3));
   Check (Locale, "label.diagnostics.location_label", Phrase,
          Humanize.Diagnostics.Localized.Location_Label (C, Path => "plain", Line => 1, Column => 1),
          Humanize.Diagnostics.Location_Label (Path => "plain", Line => 1, Column => 1));
   Check (Locale, "label.diagnostics.parser_diagnostic_explanation_label", Phrase,
          Humanize.Diagnostics.Localized.Parser_Diagnostic_Explanation_Label (C, Family =>
            Humanize.Diagnostics.Byte_Parser, Error => "plain", Position => 3),
          Humanize.Diagnostics.Parser_Diagnostic_Explanation_Label (Family => Humanize.Diagnostics.Byte_Parser,
            Error => "plain", Position => 3));
   Check (Locale, "label.diagnostics.parser_diagnostic_explanation_label", Phrase,
          Humanize.Diagnostics.Localized.Parser_Diagnostic_Explanation_Label (C, Family =>
            Humanize.Diagnostics.Unknown_Parser, Error => "plain", Position => 1),
          Humanize.Diagnostics.Parser_Diagnostic_Explanation_Label (Family => Humanize.Diagnostics.Unknown_Parser,
            Error => "plain", Position => 1));
   Check (Locale, "label.diagnostics.result_with_notices_label", Phrase,
          Humanize.Diagnostics.Localized.Result_With_Notices_Label (C, Status => Humanize.Diagnostics.Passed_Check,
            Notices => 3),
          Humanize.Diagnostics.Result_With_Notices_Label (Status => Humanize.Diagnostics.Passed_Check, Notices =>
            3));
   Check (Locale, "label.diagnostics.result_with_notices_label", Phrase,
          Humanize.Diagnostics.Localized.Result_With_Notices_Label (C, Status => Humanize.Diagnostics.Running_Check,
            Notices => 1),
          Humanize.Diagnostics.Result_With_Notices_Label (Status => Humanize.Diagnostics.Running_Check, Notices =>
            1));
   Check (Locale, "label.diagnostics.retry_label", Phrase,
          Humanize.Diagnostics.Localized.Retry_Label (C, Attempt => 3, Limit => 3),
          Humanize.Diagnostics.Retry_Label (Attempt => 3, Limit => 3));
   Check (Locale, "label.diagnostics.retry_label", Phrase,
          Humanize.Diagnostics.Localized.Retry_Label (C, Attempt => 1, Limit => 1),
          Humanize.Diagnostics.Retry_Label (Attempt => 1, Limit => 1));
   Check (Locale, "label.diagnostics.severity_label", Phrase,
          Humanize.Diagnostics.Localized.Severity_Label (C, Severity => Humanize.Diagnostics.Info_Severity),
          Humanize.Diagnostics.Severity_Label (Severity => Humanize.Diagnostics.Info_Severity));
   Check (Locale, "label.diagnostics.severity_label", Phrase,
          Humanize.Diagnostics.Localized.Severity_Label (C, Severity => Humanize.Diagnostics.Blocking_Severity),
          Humanize.Diagnostics.Severity_Label (Severity => Humanize.Diagnostics.Blocking_Severity));
   Check (Locale, "label.diagnostics.source_label", Phrase,
          Humanize.Diagnostics.Localized.Source_Label (C, Source => Humanize.Diagnostics.Build_Source),
          Humanize.Diagnostics.Source_Label (Source => Humanize.Diagnostics.Build_Source));
   Check (Locale, "label.diagnostics.source_label", Phrase,
          Humanize.Diagnostics.Localized.Source_Label (C, Source => Humanize.Diagnostics.Unknown_Source),
          Humanize.Diagnostics.Source_Label (Source => Humanize.Diagnostics.Unknown_Source));
   Check (Locale, "label.diagnostics.source_summary_label", Phrase,
          Humanize.Diagnostics.Localized.Source_Summary_Label (C, Source => Humanize.Diagnostics.Build_Source, Count
            => 3),
          Humanize.Diagnostics.Source_Summary_Label (Source => Humanize.Diagnostics.Build_Source, Count => 3));
   Check (Locale, "label.diagnostics.source_summary_label", Phrase,
          Humanize.Diagnostics.Localized.Source_Summary_Label (C, Source => Humanize.Diagnostics.Unknown_Source,
            Count => 1),
          Humanize.Diagnostics.Source_Summary_Label (Source => Humanize.Diagnostics.Unknown_Source, Count => 1));
   Check (Locale, "label.diagnostics.suggested_action_label", Phrase,
          Humanize.Diagnostics.Localized.Suggested_Action_Label (C, Action => "plain"),
          Humanize.Diagnostics.Suggested_Action_Label (Action => "plain"));
   Check (Locale, "label.endpoints.cidr_label", Phrase,
          Humanize.Endpoints.Localized.CIDR_Label (C, "10.0.0.0/8"),
          Humanize.Endpoints.CIDR_Label ("10.0.0.0/8"));
   Check (Locale, "label.endpoints.cidr_label", Phrase,
          Humanize.Endpoints.Localized.CIDR_Label (C, "2001:db8::/32"),
          Humanize.Endpoints.CIDR_Label ("2001:db8::/32"));
   Check (Locale, "label.endpoints.cidr_label", Phrase,
          Humanize.Endpoints.Localized.CIDR_Label (C, "bogus"),
          Humanize.Endpoints.CIDR_Label ("bogus"));
   Check (Locale, "label.endpoints.endpoint_label", Phrase,
          Humanize.Endpoints.Localized.Endpoint_Label (C, Host => "example.com"),
          Humanize.Endpoints.Endpoint_Label (Host => "example.com"));
   Check (Locale, "label.endpoints.endpoint_label", Phrase,
          Humanize.Endpoints.Localized.Endpoint_Label (C, Host => "example.com", Port => 8443, Scheme => "HTTPS"),
          Humanize.Endpoints.Endpoint_Label (Host => "example.com", Port => 8443, Scheme => "HTTPS"));
   Check (Locale, "label.endpoints.endpoint_label", Phrase,
          Humanize.Endpoints.Localized.Endpoint_Label (C, Host => "[2001:db8::1]", Port => 80),
          Humanize.Endpoints.Endpoint_Label (Host => "[2001:db8::1]", Port => 80));
   Check (Locale, "label.endpoints.endpoint_label", Prefix,
          Humanize.Endpoints.Localized.Endpoint_Label (C, Host => "example.com", Options =>
            (Humanize.Endpoints.Default_Endpoint_Label_Options with delta Include_Surface => True)),
          Humanize.Endpoints.Endpoint_Label (Host => "example.com", Options =>
            (Humanize.Endpoints.Default_Endpoint_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.endpoints.host_kind_label", Phrase,
          Humanize.Endpoints.Localized.Host_Kind_Label (C, Kind => Humanize.Endpoints.Domain_Host),
          Humanize.Endpoints.Host_Kind_Label (Kind => Humanize.Endpoints.Domain_Host));
   Check (Locale, "label.endpoints.host_kind_label", Phrase,
          Humanize.Endpoints.Localized.Host_Kind_Label (C, Kind => Humanize.Endpoints.Unknown_Host),
          Humanize.Endpoints.Host_Kind_Label (Kind => Humanize.Endpoints.Unknown_Host));
   Check (Locale, "label.endpoints.host_label", Phrase,
          Humanize.Endpoints.Localized.Host_Label (C, "example.com"),
          Humanize.Endpoints.Host_Label ("example.com"));
   Check (Locale, "label.endpoints.host_label", Phrase,
          Humanize.Endpoints.Localized.Host_Label (C, "[::1]"),
          Humanize.Endpoints.Host_Label ("[::1]"));
   Check (Locale, "label.endpoints.host_label", Phrase,
          Humanize.Endpoints.Localized.Host_Label (C, "10.0.0.5"),
          Humanize.Endpoints.Host_Label ("10.0.0.5"));
   Check (Locale, "label.endpoints.host_label", Prefix,
          Humanize.Endpoints.Localized.Host_Label (C, "example.com", Options =>
            (Humanize.Endpoints.Default_Endpoint_Label_Options with delta Include_Surface => True)),
          Humanize.Endpoints.Host_Label ("example.com", Options =>
            (Humanize.Endpoints.Default_Endpoint_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.endpoints.ip_address_label", Phrase,
          Humanize.Endpoints.Localized.IP_Address_Label (C, "8.8.8.8"),
          Humanize.Endpoints.IP_Address_Label ("8.8.8.8"));
   Check (Locale, "label.endpoints.ip_address_label", Phrase,
          Humanize.Endpoints.Localized.IP_Address_Label (C, "10.1.2.3"),
          Humanize.Endpoints.IP_Address_Label ("10.1.2.3"));
   Check (Locale, "label.endpoints.ip_address_label", Phrase,
          Humanize.Endpoints.Localized.IP_Address_Label (C, "[::1]"),
          Humanize.Endpoints.IP_Address_Label ("[::1]"));
   Check (Locale, "label.endpoints.query_summary", Phrase,
          Humanize.Endpoints.Localized.Query_Summary (C, "https://x/?a=1&b=2"),
          Humanize.Endpoints.Query_Summary ("https://x/?a=1&b=2"));
   Check (Locale, "label.endpoints.query_summary", Phrase,
          Humanize.Endpoints.Localized.Query_Summary (C, "https://x/"),
          Humanize.Endpoints.Query_Summary ("https://x/"));
   Check (Locale, "label.endpoints.query_summary", Phrase,
          Humanize.Endpoints.Localized.Query_Summary (C, "https://x/?a=1"),
          Humanize.Endpoints.Query_Summary ("https://x/?a=1"));
   Check (Locale, "label.endpoints.url_component_summary", Phrase,
          Humanize.Endpoints.Localized.URL_Component_Summary (C, "https://example.com/a?b=1#c"),
          Humanize.Endpoints.URL_Component_Summary ("https://example.com/a?b=1#c"));
   Check (Locale, "label.endpoints.url_component_summary", Phrase,
          Humanize.Endpoints.Localized.URL_Component_Summary (C, ""),
          Humanize.Endpoints.URL_Component_Summary (""));
   Check (Locale, "label.endpoints.url_component_summary", Phrase,
          Humanize.Endpoints.Localized.URL_Component_Summary (C, "example"),
          Humanize.Endpoints.URL_Component_Summary ("example"));
   Check (Locale, "label.events.all_day_label", Phrase,
          Humanize.Events.Localized.All_Day_Label (C, Name => "plain"),
          Humanize.Events.All_Day_Label (Name => "plain"));
   Check (Locale, "label.events.attendance_state_label", Phrase,
          Humanize.Events.Localized.Attendance_State_Label (C, State => Humanize.Events.Not_Responded),
          Humanize.Events.Attendance_State_Label (State => Humanize.Events.Not_Responded));
   Check (Locale, "label.events.attendance_state_label", Phrase,
          Humanize.Events.Localized.Attendance_State_Label (C, State => Humanize.Events.Waitlisted),
          Humanize.Events.Attendance_State_Label (State => Humanize.Events.Waitlisted));
   Check (Locale, "label.events.attendee_count_label", Phrase,
          Humanize.Events.Localized.Attendee_Count_Label (C, Count => 3),
          Humanize.Events.Attendee_Count_Label (Count => 3));
   Check (Locale, "label.events.attendee_count_label", Phrase,
          Humanize.Events.Localized.Attendee_Count_Label (C, Count => 1),
          Humanize.Events.Attendee_Count_Label (Count => 1));
   Check (Locale, "label.events.canceled_label", Phrase,
          Humanize.Events.Localized.Canceled_Label (C, Name => "plain"),
          Humanize.Events.Canceled_Label (Name => "plain"));
   Check (Locale, "label.events.capacity_label", Phrase,
          Humanize.Events.Localized.Capacity_Label (C, Reserved => 7, Capacity => 9),
          Humanize.Events.Capacity_Label (Reserved => 7, Capacity => 9));
   Check (Locale, "label.events.capacity_label", Phrase,
          Humanize.Events.Localized.Capacity_Label (C, Reserved => 1, Capacity => 2),
          Humanize.Events.Capacity_Label (Reserved => 1, Capacity => 2));
   Check (Locale, "label.events.check_in_label", Phrase,
          Humanize.Events.Localized.Check_In_Label (C, Name => "plain"),
          Humanize.Events.Check_In_Label (Name => "plain"));
   Check (Locale, "label.events.conference_link_label", Phrase,
          Humanize.Events.Localized.Conference_Link_Label (C, Name => "plain"),
          Humanize.Events.Conference_Link_Label (Name => "plain"));
   Check (Locale, "label.events.event_count_label", Phrase,
          Humanize.Events.Localized.Event_Count_Label (C, Count => 3),
          Humanize.Events.Event_Count_Label (Count => 3));
   Check (Locale, "label.events.event_count_label", Phrase,
          Humanize.Events.Localized.Event_Count_Label (C, Count => 1),
          Humanize.Events.Event_Count_Label (Count => 1));
   Check (Locale, "label.events.event_label", Phrase,
          Humanize.Events.Localized.Event_Label (C, Name => "plain", State => Humanize.Events.Scheduled_Event),
          Humanize.Events.Event_Label (Name => "plain", State => Humanize.Events.Scheduled_Event));
   Check (Locale, "label.events.event_label", Phrase,
          Humanize.Events.Localized.Event_Label (C, Name => "plain", State => Humanize.Events.Postponed_Event),
          Humanize.Events.Event_Label (Name => "plain", State => Humanize.Events.Postponed_Event));
   Check (Locale, "label.events.event_label", Prefix,
          Humanize.Events.Localized.Event_Label (C, Name => "plain", State => Humanize.Events.Scheduled_Event,
            Options => (Humanize.Events.Default_Event_Label_Options with delta Include_Surface => True)),
          Humanize.Events.Event_Label (Name => "plain", State => Humanize.Events.Scheduled_Event, Options =>
            (Humanize.Events.Default_Event_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.events.event_location_label", Phrase,
          Humanize.Events.Localized.Event_Location_Label (C, Name => "plain", Location => "plain"),
          Humanize.Events.Event_Location_Label (Name => "plain", Location => "plain"));
   Check (Locale, "label.events.event_state_label", Phrase,
          Humanize.Events.Localized.Event_State_Label (C, State => Humanize.Events.Scheduled_Event),
          Humanize.Events.Event_State_Label (State => Humanize.Events.Scheduled_Event));
   Check (Locale, "label.events.event_state_label", Phrase,
          Humanize.Events.Localized.Event_State_Label (C, State => Humanize.Events.Postponed_Event),
          Humanize.Events.Event_State_Label (State => Humanize.Events.Postponed_Event));
   Check (Locale, "label.events.event_time_label", Phrase,
          Humanize.Events.Localized.Event_Time_Label (C, Name => "plain", Time_Text => "plain"),
          Humanize.Events.Event_Time_Label (Name => "plain", Time_Text => "plain"));
   Check (Locale, "label.events.event_visibility_label", Phrase,
          Humanize.Events.Localized.Event_Visibility_Label (C, Visibility => Humanize.Events.Public_Event),
          Humanize.Events.Event_Visibility_Label (Visibility => Humanize.Events.Public_Event));
   Check (Locale, "label.events.event_visibility_label", Phrase,
          Humanize.Events.Localized.Event_Visibility_Label (C, Visibility => Humanize.Events.Free_Event),
          Humanize.Events.Event_Visibility_Label (Visibility => Humanize.Events.Free_Event));
   Check (Locale, "label.events.organizer_label", Phrase,
          Humanize.Events.Localized.Organizer_Label (C, Name => "plain"),
          Humanize.Events.Organizer_Label (Name => "plain"));
   Check (Locale, "label.events.rsvp_label", Phrase,
          Humanize.Events.Localized.RSVP_Label (C, State => Humanize.Events.Not_Responded),
          Humanize.Events.RSVP_Label (State => Humanize.Events.Not_Responded));
   Check (Locale, "label.events.rsvp_label", Phrase,
          Humanize.Events.Localized.RSVP_Label (C, State => Humanize.Events.Waitlisted),
          Humanize.Events.RSVP_Label (State => Humanize.Events.Waitlisted));
   Check (Locale, "label.events.rsvp_label", Prefix,
          Humanize.Events.Localized.RSVP_Label (C, State => Humanize.Events.Not_Responded, Options =>
            (Humanize.Events.Default_Event_Label_Options with delta Include_Surface => True)),
          Humanize.Events.RSVP_Label (State => Humanize.Events.Not_Responded, Options =>
            (Humanize.Events.Default_Event_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.events.reminder_label", Phrase,
          Humanize.Events.Localized.Reminder_Label (C, Time_Text => "plain"),
          Humanize.Events.Reminder_Label (Time_Text => "plain"));
   Check (Locale, "label.events.rescheduled_label", Phrase,
          Humanize.Events.Localized.Rescheduled_Label (C, Name => "plain", Time_Text => "plain"),
          Humanize.Events.Rescheduled_Label (Name => "plain", Time_Text => "plain"));
   Check (Locale, "label.events.waitlist_label", Phrase,
          Humanize.Events.Localized.Waitlist_Label (C, Position => 7, Total => 9),
          Humanize.Events.Waitlist_Label (Position => 7, Total => 9));
   Check (Locale, "label.events.waitlist_label", Phrase,
          Humanize.Events.Localized.Waitlist_Label (C, Position => 2, Total => 0),
          Humanize.Events.Waitlist_Label (Position => 2, Total => 0));
end Check_Group_3;
