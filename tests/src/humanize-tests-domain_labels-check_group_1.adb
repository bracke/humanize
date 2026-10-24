with Humanize.Accounts;
with Humanize.Attachments;
with Humanize.Badges;
with Humanize.Builds;
with Humanize.Changes;
with Humanize.Accounts.Localized;
with Humanize.Attachments.Localized;
with Humanize.Badges.Localized;
with Humanize.Builds.Localized;
with Humanize.Changes.Localized;

separate (Humanize.Tests.Domain_Labels)
procedure Check_Group_1 (Locale : String; C : Humanize.Contexts.Context) is
begin
   Check (Locale, "label.accounts.account_label", Phrase,
          Humanize.Accounts.Localized.Account_Label (C, Name => "plain", State => Humanize.Accounts.Active_Account),
          Humanize.Accounts.Account_Label (Name => "plain", State => Humanize.Accounts.Active_Account));
   Check (Locale, "label.accounts.account_label", Phrase,
          Humanize.Accounts.Localized.Account_Label (C, Name => "plain", State =>
            Humanize.Accounts.Unknown_Account),
          Humanize.Accounts.Account_Label (Name => "plain", State => Humanize.Accounts.Unknown_Account));
   Check (Locale, "label.accounts.account_label", Prefix,
          Humanize.Accounts.Localized.Account_Label (C, Name => "plain", State => Humanize.Accounts.Active_Account,
            Options => (Humanize.Accounts.Default_Account_Label_Options with delta Include_Surface => True)),
          Humanize.Accounts.Account_Label (Name => "plain", State => Humanize.Accounts.Active_Account, Options =>
            (Humanize.Accounts.Default_Account_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.accounts.account_state_label", Phrase,
          Humanize.Accounts.Localized.Account_State_Label (C, State => Humanize.Accounts.Active_Account),
          Humanize.Accounts.Account_State_Label (State => Humanize.Accounts.Active_Account));
   Check (Locale, "label.accounts.account_state_label", Phrase,
          Humanize.Accounts.Localized.Account_State_Label (C, State => Humanize.Accounts.Unknown_Account),
          Humanize.Accounts.Account_State_Label (State => Humanize.Accounts.Unknown_Account));
   Check (Locale, "label.accounts.device_trust_label", Phrase,
          Humanize.Accounts.Localized.Device_Trust_Label (C, State => Humanize.Accounts.Trusted_Device),
          Humanize.Accounts.Device_Trust_Label (State => Humanize.Accounts.Trusted_Device));
   Check (Locale, "label.accounts.device_trust_label", Phrase,
          Humanize.Accounts.Localized.Device_Trust_Label (C, State => Humanize.Accounts.Blocked_Device),
          Humanize.Accounts.Device_Trust_Label (State => Humanize.Accounts.Blocked_Device));
   Check (Locale, "label.accounts.last_active_label", Phrase,
          Humanize.Accounts.Localized.Last_Active_Label (C, Name => "plain", Time_Text => "plain"),
          Humanize.Accounts.Last_Active_Label (Name => "plain", Time_Text => "plain"));
   Check (Locale, "label.accounts.login_attempt_label", Phrase,
          Humanize.Accounts.Localized.Login_Attempt_Label (C, Name => "plain", Succeeded => False),
          Humanize.Accounts.Login_Attempt_Label (Name => "plain", Succeeded => False));
   Check (Locale, "label.accounts.login_attempt_label", Phrase,
          Humanize.Accounts.Localized.Login_Attempt_Label (C, Name => "plain", Succeeded => True),
          Humanize.Accounts.Login_Attempt_Label (Name => "plain", Succeeded => True));
   Check (Locale, "label.accounts.mfa_state_label", Phrase,
          Humanize.Accounts.Localized.MFA_State_Label (C, State => Humanize.Accounts.MFA_Enabled),
          Humanize.Accounts.MFA_State_Label (State => Humanize.Accounts.MFA_Enabled));
   Check (Locale, "label.accounts.mfa_state_label", Phrase,
          Humanize.Accounts.Localized.MFA_State_Label (C, State => Humanize.Accounts.MFA_Reset_Required),
          Humanize.Accounts.MFA_State_Label (State => Humanize.Accounts.MFA_Reset_Required));
   Check (Locale, "label.accounts.session_label", Phrase,
          Humanize.Accounts.Localized.Session_Label (C, Name => "plain", State => Humanize.Accounts.Active_Session),
          Humanize.Accounts.Session_Label (Name => "plain", State => Humanize.Accounts.Active_Session));
   Check (Locale, "label.accounts.session_label", Phrase,
          Humanize.Accounts.Localized.Session_Label (C, Name => "plain", State =>
            Humanize.Accounts.Unknown_Session),
          Humanize.Accounts.Session_Label (Name => "plain", State => Humanize.Accounts.Unknown_Session));
   Check (Locale, "label.accounts.session_label", Prefix,
          Humanize.Accounts.Localized.Session_Label (C, Name => "plain", State => Humanize.Accounts.Active_Session,
            Options => (Humanize.Accounts.Default_Account_Label_Options with delta Include_Surface => True)),
          Humanize.Accounts.Session_Label (Name => "plain", State => Humanize.Accounts.Active_Session, Options =>
            (Humanize.Accounts.Default_Account_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.accounts.session_state_label", Phrase,
          Humanize.Accounts.Localized.Session_State_Label (C, State => Humanize.Accounts.Active_Session),
          Humanize.Accounts.Session_State_Label (State => Humanize.Accounts.Active_Session));
   Check (Locale, "label.accounts.session_state_label", Phrase,
          Humanize.Accounts.Localized.Session_State_Label (C, State => Humanize.Accounts.Unknown_Session),
          Humanize.Accounts.Session_State_Label (State => Humanize.Accounts.Unknown_Session));
   Check (Locale, "label.attachments.attachment_count_label", Phrase,
          Humanize.Attachments.Localized.Attachment_Count_Label (C, Count => 3),
          Humanize.Attachments.Attachment_Count_Label (Count => 3));
   Check (Locale, "label.attachments.attachment_count_label", Phrase,
          Humanize.Attachments.Localized.Attachment_Count_Label (C, Count => 1),
          Humanize.Attachments.Attachment_Count_Label (Count => 1));
   Check (Locale, "label.attachments.attachment_group_label", Phrase,
          Humanize.Attachments.Localized.Attachment_Group_Label (C, Name => "plain", Count => 3),
          Humanize.Attachments.Attachment_Group_Label (Name => "plain", Count => 3));
   Check (Locale, "label.attachments.attachment_group_label", Phrase,
          Humanize.Attachments.Localized.Attachment_Group_Label (C, Name => "plain", Count => 1),
          Humanize.Attachments.Attachment_Group_Label (Name => "plain", Count => 1));
   Check (Locale, "label.attachments.attachment_kind_label", Phrase,
          Humanize.Attachments.Localized.Attachment_Kind_Label (C, Kind => Humanize.Attachments.File_Attachment),
          Humanize.Attachments.Attachment_Kind_Label (Kind => Humanize.Attachments.File_Attachment));
   Check (Locale, "label.attachments.attachment_kind_label", Phrase,
          Humanize.Attachments.Localized.Attachment_Kind_Label (C, Kind => Humanize.Attachments.Link_Attachment),
          Humanize.Attachments.Attachment_Kind_Label (Kind => Humanize.Attachments.Link_Attachment));
   Check (Locale, "label.attachments.attachment_label", Phrase,
          Humanize.Attachments.Localized.Attachment_Label (C, Name => "plain", Kind =>
            Humanize.Attachments.File_Attachment, State => Humanize.Attachments.Pending_Attachment),
          Humanize.Attachments.Attachment_Label (Name => "plain", Kind => Humanize.Attachments.File_Attachment,
            State => Humanize.Attachments.Pending_Attachment));
   Check (Locale, "label.attachments.attachment_label", Phrase,
          Humanize.Attachments.Localized.Attachment_Label (C, Name => "plain", Kind =>
            Humanize.Attachments.Link_Attachment, State => Humanize.Attachments.Blocked_Attachment),
          Humanize.Attachments.Attachment_Label (Name => "plain", Kind => Humanize.Attachments.Link_Attachment,
            State => Humanize.Attachments.Blocked_Attachment));
   Check (Locale, "label.attachments.attachment_label", Prefix,
          Humanize.Attachments.Localized.Attachment_Label (C, Name => "plain", Kind =>
            Humanize.Attachments.File_Attachment, State => Humanize.Attachments.Pending_Attachment, Options =>
            (Humanize.Attachments.Default_Attachment_Label_Options with delta Include_Surface => True)),
          Humanize.Attachments.Attachment_Label (Name => "plain", Kind => Humanize.Attachments.File_Attachment,
            State => Humanize.Attachments.Pending_Attachment, Options =>
            (Humanize.Attachments.Default_Attachment_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.attachments.attachment_size_label", Phrase,
          Humanize.Attachments.Localized.Attachment_Size_Label (C, Name => "plain", Size => "plain"),
          Humanize.Attachments.Attachment_Size_Label (Name => "plain", Size => "plain"));
   Check (Locale, "label.attachments.attachment_state_label", Phrase,
          Humanize.Attachments.Localized.Attachment_State_Label (C, State =>
            Humanize.Attachments.Pending_Attachment),
          Humanize.Attachments.Attachment_State_Label (State => Humanize.Attachments.Pending_Attachment));
   Check (Locale, "label.attachments.attachment_state_label", Phrase,
          Humanize.Attachments.Localized.Attachment_State_Label (C, State =>
            Humanize.Attachments.Blocked_Attachment),
          Humanize.Attachments.Attachment_State_Label (State => Humanize.Attachments.Blocked_Attachment));
   Check (Locale, "label.attachments.download_label", Phrase,
          Humanize.Attachments.Localized.Download_Label (C, Name => "plain"),
          Humanize.Attachments.Download_Label (Name => "plain"));
   Check (Locale, "label.attachments.expiring_link_label", Phrase,
          Humanize.Attachments.Localized.Expiring_Link_Label (C, Name => "plain", Time_Text => "plain"),
          Humanize.Attachments.Expiring_Link_Label (Name => "plain", Time_Text => "plain"));
   Check (Locale, "label.attachments.image_dimensions_label", Phrase,
          Humanize.Attachments.Localized.Image_Dimensions_Label (C, Name => "plain", Dimensions => "plain"),
          Humanize.Attachments.Image_Dimensions_Label (Name => "plain", Dimensions => "plain"));
   Check (Locale, "label.attachments.preview_label", Phrase,
          Humanize.Attachments.Localized.Preview_Label (C, Name => "plain"),
          Humanize.Attachments.Preview_Label (Name => "plain"));
   Check (Locale, "label.attachments.remove_label", Phrase,
          Humanize.Attachments.Localized.Remove_Label (C, Name => "plain"),
          Humanize.Attachments.Remove_Label (Name => "plain"));
   Check (Locale, "label.attachments.scan_result_label", Phrase,
          Humanize.Attachments.Localized.Scan_Result_Label (C, Name => "plain", State =>
            Humanize.Attachments.Not_Scanned),
          Humanize.Attachments.Scan_Result_Label (Name => "plain", State => Humanize.Attachments.Not_Scanned));
   Check (Locale, "label.attachments.scan_result_label", Phrase,
          Humanize.Attachments.Localized.Scan_Result_Label (C, Name => "plain", State =>
            Humanize.Attachments.Infected),
          Humanize.Attachments.Scan_Result_Label (Name => "plain", State => Humanize.Attachments.Infected));
   Check (Locale, "label.attachments.scan_result_label", Prefix,
          Humanize.Attachments.Localized.Scan_Result_Label (C, Name => "plain", State =>
            Humanize.Attachments.Not_Scanned, Options => (Humanize.Attachments.Default_Attachment_Label_Options with
            delta Include_Surface => True)),
          Humanize.Attachments.Scan_Result_Label (Name => "plain", State => Humanize.Attachments.Not_Scanned,
            Options => (Humanize.Attachments.Default_Attachment_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.attachments.scan_state_label", Phrase,
          Humanize.Attachments.Localized.Scan_State_Label (C, State => Humanize.Attachments.Not_Scanned),
          Humanize.Attachments.Scan_State_Label (State => Humanize.Attachments.Not_Scanned));
   Check (Locale, "label.attachments.scan_state_label", Phrase,
          Humanize.Attachments.Localized.Scan_State_Label (C, State => Humanize.Attachments.Infected),
          Humanize.Attachments.Scan_State_Label (State => Humanize.Attachments.Infected));
   Check (Locale, "label.attachments.upload_error_label", Phrase,
          Humanize.Attachments.Localized.Upload_Error_Label (C, Name => "plain", Reason => "plain"),
          Humanize.Attachments.Upload_Error_Label (Name => "plain", Reason => "plain"));
   Check (Locale, "label.attachments.upload_progress_label", Phrase,
          Humanize.Attachments.Localized.Upload_Progress_Label (C, Done => 7, Total => 9),
          Humanize.Attachments.Upload_Progress_Label (Done => 7, Total => 9));
   Check (Locale, "label.attachments.upload_progress_label", Phrase,
          Humanize.Attachments.Localized.Upload_Progress_Label (C, Done => 1, Total => 2),
          Humanize.Attachments.Upload_Progress_Label (Done => 1, Total => 2));
   Check (Locale, "label.badges.badge_label", Phrase,
          Humanize.Badges.Localized.Badge_Label (C, Name => "plain", Tone => Humanize.Badges.Neutral_Tone, State =>
            Humanize.Badges.Default_Badge),
          Humanize.Badges.Badge_Label (Name => "plain", Tone => Humanize.Badges.Neutral_Tone, State =>
            Humanize.Badges.Default_Badge));
   Check (Locale, "label.badges.badge_label", Phrase,
          Humanize.Badges.Localized.Badge_Label (C, Name => "plain", Tone => Humanize.Badges.Muted_Tone, State =>
            Humanize.Badges.Dismissible_Badge),
          Humanize.Badges.Badge_Label (Name => "plain", Tone => Humanize.Badges.Muted_Tone, State =>
            Humanize.Badges.Dismissible_Badge));
   Check (Locale, "label.badges.badge_label", Prefix,
          Humanize.Badges.Localized.Badge_Label (C, Name => "plain", Tone => Humanize.Badges.Neutral_Tone, State =>
            Humanize.Badges.Default_Badge, Options => (Humanize.Badges.Default_Badge_Label_Options with delta
            Include_Surface => True)),
          Humanize.Badges.Badge_Label (Name => "plain", Tone => Humanize.Badges.Neutral_Tone, State =>
            Humanize.Badges.Default_Badge, Options => (Humanize.Badges.Default_Badge_Label_Options with delta
            Include_Surface => True)));
   Check (Locale, "label.badges.badge_priority_label", Phrase,
          Humanize.Badges.Localized.Badge_Priority_Label (C, Priority => Humanize.Badges.Low_Priority),
          Humanize.Badges.Badge_Priority_Label (Priority => Humanize.Badges.Low_Priority));
   Check (Locale, "label.badges.badge_priority_label", Phrase,
          Humanize.Badges.Localized.Badge_Priority_Label (C, Priority => Humanize.Badges.Critical_Priority),
          Humanize.Badges.Badge_Priority_Label (Priority => Humanize.Badges.Critical_Priority));
   Check (Locale, "label.badges.badge_state_label", Phrase,
          Humanize.Badges.Localized.Badge_State_Label (C, State => Humanize.Badges.Default_Badge),
          Humanize.Badges.Badge_State_Label (State => Humanize.Badges.Default_Badge));
   Check (Locale, "label.badges.badge_state_label", Phrase,
          Humanize.Badges.Localized.Badge_State_Label (C, State => Humanize.Badges.Dismissible_Badge),
          Humanize.Badges.Badge_State_Label (State => Humanize.Badges.Dismissible_Badge));
   Check (Locale, "label.badges.badge_tone_label", Phrase,
          Humanize.Badges.Localized.Badge_Tone_Label (C, Tone => Humanize.Badges.Neutral_Tone),
          Humanize.Badges.Badge_Tone_Label (Tone => Humanize.Badges.Neutral_Tone));
   Check (Locale, "label.badges.badge_tone_label", Phrase,
          Humanize.Badges.Localized.Badge_Tone_Label (C, Tone => Humanize.Badges.Muted_Tone),
          Humanize.Badges.Badge_Tone_Label (Tone => Humanize.Badges.Muted_Tone));
   Check (Locale, "label.badges.chip_label", Phrase,
          Humanize.Badges.Localized.Chip_Label (C, Name => "plain", Selected => False),
          Humanize.Badges.Chip_Label (Name => "plain", Selected => False));
   Check (Locale, "label.badges.chip_label", Phrase,
          Humanize.Badges.Localized.Chip_Label (C, Name => "plain", Selected => True),
          Humanize.Badges.Chip_Label (Name => "plain", Selected => True));
   Check (Locale, "label.badges.count_badge_label", Phrase,
          Humanize.Badges.Localized.Count_Badge_Label (C, Name => "plain", Count => 3),
          Humanize.Badges.Count_Badge_Label (Name => "plain", Count => 3));
   Check (Locale, "label.badges.count_badge_label", Phrase,
          Humanize.Badges.Localized.Count_Badge_Label (C, Name => "plain", Count => 1),
          Humanize.Badges.Count_Badge_Label (Name => "plain", Count => 1));
   Check (Locale, "label.badges.deprecated_label", Phrase,
          Humanize.Badges.Localized.Deprecated_Label (C, Name => "plain"),
          Humanize.Badges.Deprecated_Label (Name => "plain"));
   Check (Locale, "label.badges.dismiss_label", Phrase,
          Humanize.Badges.Localized.Dismiss_Label (C, Name => "plain"),
          Humanize.Badges.Dismiss_Label (Name => "plain"));
   Check (Locale, "label.badges.new_label", Phrase,
          Humanize.Badges.Localized.New_Label (C, Name => "plain"),
          Humanize.Badges.New_Label (Name => "plain"));
   Check (Locale, "label.badges.overflow_badge_label", Phrase,
          Humanize.Badges.Localized.Overflow_Badge_Label (C, Hidden_Count => 3),
          Humanize.Badges.Overflow_Badge_Label (Hidden_Count => 3));
   Check (Locale, "label.badges.overflow_badge_label", Phrase,
          Humanize.Badges.Localized.Overflow_Badge_Label (C, Hidden_Count => 1),
          Humanize.Badges.Overflow_Badge_Label (Hidden_Count => 1));
   Check (Locale, "label.badges.priority_badge_label", Phrase,
          Humanize.Badges.Localized.Priority_Badge_Label (C, Priority => Humanize.Badges.Low_Priority, Name =>
            "plain"),
          Humanize.Badges.Priority_Badge_Label (Priority => Humanize.Badges.Low_Priority, Name => "plain"));
   Check (Locale, "label.badges.priority_badge_label", Phrase,
          Humanize.Badges.Localized.Priority_Badge_Label (C, Priority => Humanize.Badges.Critical_Priority, Name =>
            "plain"),
          Humanize.Badges.Priority_Badge_Label (Priority => Humanize.Badges.Critical_Priority, Name => "plain"));
   Check (Locale, "label.badges.status_badge_label", Phrase,
          Humanize.Badges.Localized.Status_Badge_Label (C, Name => "plain", Tone => Humanize.Badges.Neutral_Tone),
          Humanize.Badges.Status_Badge_Label (Name => "plain", Tone => Humanize.Badges.Neutral_Tone));
   Check (Locale, "label.badges.status_badge_label", Phrase,
          Humanize.Badges.Localized.Status_Badge_Label (C, Name => "plain", Tone => Humanize.Badges.Muted_Tone),
          Humanize.Badges.Status_Badge_Label (Name => "plain", Tone => Humanize.Badges.Muted_Tone));
   Check (Locale, "label.badges.status_badge_label", Prefix,
          Humanize.Badges.Localized.Status_Badge_Label (C, Name => "plain", Tone => Humanize.Badges.Neutral_Tone,
            Options => (Humanize.Badges.Default_Badge_Label_Options with delta Include_Surface => True)),
          Humanize.Badges.Status_Badge_Label (Name => "plain", Tone => Humanize.Badges.Neutral_Tone, Options =>
            (Humanize.Badges.Default_Badge_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.badges.tag_count_label", Phrase,
          Humanize.Badges.Localized.Tag_Count_Label (C, Count => 3),
          Humanize.Badges.Tag_Count_Label (Count => 3));
   Check (Locale, "label.badges.tag_count_label", Phrase,
          Humanize.Badges.Localized.Tag_Count_Label (C, Count => 1),
          Humanize.Badges.Tag_Count_Label (Count => 1));
   Check (Locale, "label.badges.tag_label", Phrase,
          Humanize.Badges.Localized.Tag_Label (C, Name => "plain"),
          Humanize.Badges.Tag_Label (Name => "plain"));
   Check (Locale, "label.badges.updated_label", Phrase,
          Humanize.Badges.Localized.Updated_Label (C, Name => "plain"),
          Humanize.Badges.Updated_Label (Name => "plain"));
   Check (Locale, "label.builds.artifact_state_label", Phrase,
          Humanize.Builds.Localized.Artifact_State_Label (C, State => Humanize.Builds.Artifact_Uploaded),
          Humanize.Builds.Artifact_State_Label (State => Humanize.Builds.Artifact_Uploaded));
   Check (Locale, "label.builds.artifact_state_label", Phrase,
          Humanize.Builds.Localized.Artifact_State_Label (C, State => Humanize.Builds.Artifact_Verified),
          Humanize.Builds.Artifact_State_Label (State => Humanize.Builds.Artifact_Verified));
   Check (Locale, "label.builds.benchmark_label", Phrase,
          Humanize.Builds.Localized.Benchmark_Label (C, Name => "plain", Result_Text => "plain"),
          Humanize.Builds.Benchmark_Label (Name => "plain", Result_Text => "plain"));
   Check (Locale, "label.builds.build_label", Phrase,
          Humanize.Builds.Localized.Build_Label (C, Name => "plain", State => Humanize.Builds.Build_Queued),
          Humanize.Builds.Build_Label (Name => "plain", State => Humanize.Builds.Build_Queued));
   Check (Locale, "label.builds.build_label", Phrase,
          Humanize.Builds.Localized.Build_Label (C, Name => "plain", State => Humanize.Builds.Release_Build),
          Humanize.Builds.Build_Label (Name => "plain", State => Humanize.Builds.Release_Build));
   Check (Locale, "label.builds.build_label", Prefix,
          Humanize.Builds.Localized.Build_Label (C, Name => "plain", State => Humanize.Builds.Build_Queued, Options
            => (Humanize.Builds.Default_Build_Label_Options with delta Include_Surface => True)),
          Humanize.Builds.Build_Label (Name => "plain", State => Humanize.Builds.Build_Queued, Options =>
            (Humanize.Builds.Default_Build_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.builds.build_state_label", Phrase,
          Humanize.Builds.Localized.Build_State_Label (C, State => Humanize.Builds.Build_Queued),
          Humanize.Builds.Build_State_Label (State => Humanize.Builds.Build_Queued));
   Check (Locale, "label.builds.build_state_label", Phrase,
          Humanize.Builds.Localized.Build_State_Label (C, State => Humanize.Builds.Release_Build),
          Humanize.Builds.Build_State_Label (State => Humanize.Builds.Release_Build));
   Check (Locale, "label.builds.coverage_label", Phrase,
          Humanize.Builds.Localized.Coverage_Label (C, Percent_Text => "plain"),
          Humanize.Builds.Coverage_Label (Percent_Text => "plain"));
   Check (Locale, "label.builds.gate_state_label", Phrase,
          Humanize.Builds.Localized.Gate_State_Label (C, State => Humanize.Builds.Gate_Passed),
          Humanize.Builds.Gate_State_Label (State => Humanize.Builds.Gate_Passed));
   Check (Locale, "label.builds.gate_state_label", Phrase,
          Humanize.Builds.Localized.Gate_State_Label (C, State => Humanize.Builds.Gate_Blocked),
          Humanize.Builds.Gate_State_Label (State => Humanize.Builds.Gate_Blocked));
   Check (Locale, "label.builds.test_count_label", Phrase,
          Humanize.Builds.Localized.Test_Count_Label (C, Count => 3, State => Humanize.Builds.Passed_Test),
          Humanize.Builds.Test_Count_Label (Count => 3, State => Humanize.Builds.Passed_Test));
   Check (Locale, "label.builds.test_count_label", Phrase,
          Humanize.Builds.Localized.Test_Count_Label (C, Count => 1, State =>
            Humanize.Builds.Expected_Failure_Test),
          Humanize.Builds.Test_Count_Label (Count => 1, State => Humanize.Builds.Expected_Failure_Test));
   Check (Locale, "label.builds.test_state_label", Phrase,
          Humanize.Builds.Localized.Test_State_Label (C, State => Humanize.Builds.Passed_Test),
          Humanize.Builds.Test_State_Label (State => Humanize.Builds.Passed_Test));
   Check (Locale, "label.builds.test_state_label", Phrase,
          Humanize.Builds.Localized.Test_State_Label (C, State => Humanize.Builds.Expected_Failure_Test),
          Humanize.Builds.Test_State_Label (State => Humanize.Builds.Expected_Failure_Test));
   Check (Locale, "label.changes.boolean_field_change_label", Phrase,
          Humanize.Changes.Localized.Boolean_Field_Change_Label (C, Field_Name => "plain", Old_Value => False,
            New_Value => False),
          Humanize.Changes.Boolean_Field_Change_Label (Field_Name => "plain", Old_Value => False, New_Value =>
            False));
   Check (Locale, "label.changes.boolean_field_change_label", Phrase,
          Humanize.Changes.Localized.Boolean_Field_Change_Label (C, Field_Name => "plain", Old_Value => True,
            New_Value => True),
          Humanize.Changes.Boolean_Field_Change_Label (Field_Name => "plain", Old_Value => True, New_Value =>
            True));
   Check (Locale, "label.changes.change_kind_label", Phrase,
          Humanize.Changes.Localized.Change_Kind_Label (C, Kind => Humanize.Changes.Added_Change),
          Humanize.Changes.Change_Kind_Label (Kind => Humanize.Changes.Added_Change));
   Check (Locale, "label.changes.change_kind_label", Phrase,
          Humanize.Changes.Localized.Change_Kind_Label (C, Kind => Humanize.Changes.Unknown_Change),
          Humanize.Changes.Change_Kind_Label (Kind => Humanize.Changes.Unknown_Change));
   Check (Locale, "label.changes.change_set_label", Plain,
          Humanize.Changes.Localized.Change_Set_Label (C, Added => 7, Removed => 9, Modified => 4, Unchanged => 6),
          Humanize.Changes.Change_Set_Label (Added => 7, Removed => 9, Modified => 4, Unchanged => 6));
   Check (Locale, "label.changes.change_set_label", Plain,
          Humanize.Changes.Localized.Change_Set_Label (C, Added => 2, Removed => 0, Modified => 0, Unchanged => 0),
          Humanize.Changes.Change_Set_Label (Added => 2, Removed => 0, Modified => 0, Unchanged => 0));
   Check (Locale, "label.changes.change_severity_label", Phrase,
          Humanize.Changes.Localized.Change_Severity_Label (C, Severity => Humanize.Changes.Informational_Change),
          Humanize.Changes.Change_Severity_Label (Severity => Humanize.Changes.Informational_Change));
   Check (Locale, "label.changes.change_severity_label", Phrase,
          Humanize.Changes.Localized.Change_Severity_Label (C, Severity => Humanize.Changes.Breaking_Change),
          Humanize.Changes.Change_Severity_Label (Severity => Humanize.Changes.Breaking_Change));
   Check (Locale, "label.changes.change_summary_label", Plain,
          Humanize.Changes.Localized.Change_Summary_Label (C, Total => 5, Added => 2, Renamed => 1),
          Humanize.Changes.Change_Summary_Label (Total => 5, Added => 2, Renamed => 1));
   Check (Locale, "label.changes.change_summary_label", Plain,
          Humanize.Changes.Localized.Change_Summary_Label (C, Total => 1),
          Humanize.Changes.Change_Summary_Label (Total => 1));
   Check (Locale, "label.changes.change_summary_label", Plain,
          Humanize.Changes.Localized.Change_Summary_Label (C, Total => 3, Unchanged => 3),
          Humanize.Changes.Change_Summary_Label (Total => 3, Unchanged => 3));
   Check (Locale, "label.changes.collection_field_change_label", Phrase,
          Humanize.Changes.Localized.Collection_Field_Change_Label (C, Field_Name => "plain", Added => 3, Removed =>
            3, Unchanged => 3),
          Humanize.Changes.Collection_Field_Change_Label (Field_Name => "plain", Added => 3, Removed => 3, Unchanged
            => 3));
   Check (Locale, "label.changes.collection_field_change_label", Phrase,
          Humanize.Changes.Localized.Collection_Field_Change_Label (C, Field_Name => "plain", Added => 1, Removed =>
            1, Unchanged => 1),
          Humanize.Changes.Collection_Field_Change_Label (Field_Name => "plain", Added => 1, Removed => 1, Unchanged
            => 1));
   Check (Locale, "label.changes.conflict_label", Phrase,
          Humanize.Changes.Localized.Conflict_Label (C, Count => 3),
          Humanize.Changes.Conflict_Label (Count => 3));
   Check (Locale, "label.changes.conflict_label", Phrase,
          Humanize.Changes.Localized.Conflict_Label (C, Count => 1),
          Humanize.Changes.Conflict_Label (Count => 1));
   Check (Locale, "label.changes.conflict_label", Prefix,
          Humanize.Changes.Localized.Conflict_Label (C, Count => 3, Options =>
            (Humanize.Changes.Default_Change_Label_Options with delta Include_Surface => True)),
          Humanize.Changes.Conflict_Label (Count => 3, Options => (Humanize.Changes.Default_Change_Label_Options
            with delta Include_Surface => True)));
   Check (Locale, "label.changes.date_field_change_label", Phrase,
          Humanize.Changes.Localized.Date_Field_Change_Label (C, Field_Name => "plain", Old_Label => "plain",
            New_Label => "plain", Earlier => False),
          Humanize.Changes.Date_Field_Change_Label (Field_Name => "plain", Old_Label => "plain", New_Label =>
            "plain", Earlier => False));
   Check (Locale, "label.changes.date_field_change_label", Phrase,
          Humanize.Changes.Localized.Date_Field_Change_Label (C, Field_Name => "plain", Old_Label => "plain",
            New_Label => "plain", Earlier => True),
          Humanize.Changes.Date_Field_Change_Label (Field_Name => "plain", Old_Label => "plain", New_Label =>
            "plain", Earlier => True));
   Check (Locale, "label.changes.duration_field_change_label", Phrase,
          Humanize.Changes.Localized.Duration_Field_Change_Label (C, Field_Name => "plain", Old_Label => "plain",
            New_Label => "plain"),
          Humanize.Changes.Duration_Field_Change_Label (Field_Name => "plain", Old_Label => "plain", New_Label =>
            "plain"));
   Check (Locale, "label.changes.field_change_label", Phrase,
          Humanize.Changes.Localized.Field_Change_Label (C, Field_Name => "plain", Old_Value => "plain", New_Value
            => "plain"),
          Humanize.Changes.Field_Change_Label (Field_Name => "plain", Old_Value => "plain", New_Value => "plain"));
   Check (Locale, "label.changes.item_change_label", Phrase,
          Humanize.Changes.Localized.Item_Change_Label (C, Name => "plain", Kind => Humanize.Changes.Added_Change),
          Humanize.Changes.Item_Change_Label (Name => "plain", Kind => Humanize.Changes.Added_Change));
   Check (Locale, "label.changes.item_change_label", Phrase,
          Humanize.Changes.Localized.Item_Change_Label (C, Name => "plain", Kind =>
            Humanize.Changes.Unknown_Change),
          Humanize.Changes.Item_Change_Label (Name => "plain", Kind => Humanize.Changes.Unknown_Change));
   Check (Locale, "label.changes.item_change_label", Prefix,
          Humanize.Changes.Localized.Item_Change_Label (C, Name => "plain", Kind => Humanize.Changes.Added_Change,
            Options => (Humanize.Changes.Default_Change_Label_Options with delta Include_Surface => True)),
          Humanize.Changes.Item_Change_Label (Name => "plain", Kind => Humanize.Changes.Added_Change, Options =>
            (Humanize.Changes.Default_Change_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.changes.metadata_only_label", Phrase,
          Humanize.Changes.Localized.Metadata_Only_Label (C, Count => 3),
          Humanize.Changes.Metadata_Only_Label (Count => 3));
   Check (Locale, "label.changes.metadata_only_label", Phrase,
          Humanize.Changes.Localized.Metadata_Only_Label (C, Count => 1),
          Humanize.Changes.Metadata_Only_Label (Count => 1));
   Check (Locale, "label.changes.move_label", Phrase,
          Humanize.Changes.Localized.Move_Label (C, Name => "plain", From => "plain", To => "plain"),
          Humanize.Changes.Move_Label (Name => "plain", From => "plain", To => "plain"));
   Check (Locale, "label.changes.net_change_label", Phrase,
          Humanize.Changes.Localized.Net_Change_Label (C, Added => 7, Removed => 9),
          Humanize.Changes.Net_Change_Label (Added => 7, Removed => 9));
   Check (Locale, "label.changes.net_change_label", Phrase,
          Humanize.Changes.Localized.Net_Change_Label (C, Added => 2, Removed => 0),
          Humanize.Changes.Net_Change_Label (Added => 2, Removed => 0));
   Check (Locale, "label.changes.no_changes_label", Phrase,
          Humanize.Changes.Localized.No_Changes_Label (C),
          Humanize.Changes.No_Changes_Label);
   Check (Locale, "label.changes.numeric_field_change_label", Phrase,
          Humanize.Changes.Localized.Numeric_Field_Change_Label (C, Field_Name => "plain", Old_Value => 7.25,
            New_Value => 9.75, Unit => "plain"),
          Humanize.Changes.Numeric_Field_Change_Label (Field_Name => "plain", Old_Value => 7.25, New_Value => 9.75,
            Unit => "plain"));
   Check (Locale, "label.changes.numeric_field_change_label", Phrase,
          Humanize.Changes.Localized.Numeric_Field_Change_Label (C, Field_Name => "plain", Old_Value => 7.25,
            New_Value => 0.0, Unit => "plain"),
          Humanize.Changes.Numeric_Field_Change_Label (Field_Name => "plain", Old_Value => 7.25, New_Value => 0.0,
            Unit => "plain"));
   Check (Locale, "label.changes.patch_size_label", Phrase,
          Humanize.Changes.Localized.Patch_Size_Label (C, Lines_Added => 3, Lines_Removed => 3),
          Humanize.Changes.Patch_Size_Label (Lines_Added => 3, Lines_Removed => 3));
   Check (Locale, "label.changes.patch_size_label", Phrase,
          Humanize.Changes.Localized.Patch_Size_Label (C, Lines_Added => 1, Lines_Removed => 1),
          Humanize.Changes.Patch_Size_Label (Lines_Added => 1, Lines_Removed => 1));
   Check (Locale, "label.changes.rename_label", Phrase,
          Humanize.Changes.Localized.Rename_Label (C, Old_Name => "plain", New_Name => "plain"),
          Humanize.Changes.Rename_Label (Old_Name => "plain", New_Name => "plain"));
   Check (Locale, "label.changes.review_progress_label", Phrase,
          Humanize.Changes.Localized.Review_Progress_Label (C, Reviewed => 7, Total => 9),
          Humanize.Changes.Review_Progress_Label (Reviewed => 7, Total => 9));
   Check (Locale, "label.changes.review_progress_label", Phrase,
          Humanize.Changes.Localized.Review_Progress_Label (C, Reviewed => 1, Total => 2),
          Humanize.Changes.Review_Progress_Label (Reviewed => 1, Total => 2));
   Check (Locale, "label.changes.sync_change_label", Plain,
          Humanize.Changes.Localized.Sync_Change_Label (C, Uploaded => 7, Downloaded => 9, Deleted => 4, Conflicts
            => 6),
          Humanize.Changes.Sync_Change_Label (Uploaded => 7, Downloaded => 9, Deleted => 4, Conflicts => 6));
   Check (Locale, "label.changes.sync_change_label", Plain,
          Humanize.Changes.Localized.Sync_Change_Label (C, Uploaded => 2, Downloaded => 0, Deleted => 0, Conflicts
            => 0),
          Humanize.Changes.Sync_Change_Label (Uploaded => 2, Downloaded => 0, Deleted => 0, Conflicts => 0));
end Check_Group_1;
