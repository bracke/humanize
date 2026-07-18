separate (Humanize.Tests.Rendering.Test_Style_Presets)
   procedure Check_Phrase_Style_Presets is
      Loading : constant Text_Result :=
        Humanize.Phrases.Status_Phrase (Support.En, Humanize.Phrases.Loading);
      Saved_De : constant Text_Result :=
        Humanize.Phrases.Status_Phrase (Support.De, Humanize.Phrases.Saved);
      Uploading : constant Text_Result :=
        Humanize.Phrases.File_Phrase (Support.En, Humanize.Phrases.Uploading);
      Required : constant Text_Result :=
        Humanize.Phrases.Validation_Phrase
          (Support.En, Humanize.Phrases.Required);
      Empty : constant Text_Result :=
        Humanize.Phrases.Empty_State_Phrase
          (Support.En, Humanize.Phrases.No_Results);
      Permission : constant Text_Result :=
        Humanize.Phrases.Network_Phrase
          (Support.En, Humanize.Phrases.Permission_Denied);
      Auth : constant Text_Result :=
        Humanize.Phrases.Auth_Phrase
          (Support.En, Humanize.Phrases.Session_Expired);
      Billing : constant Text_Result :=
        Humanize.Phrases.Billing_Phrase
          (Support.En, Humanize.Phrases.Payment_Due);
      Workflow : constant Text_Result :=
        Humanize.Phrases.Workflow_Phrase
          (Support.En, Humanize.Phrases.In_Review);
      Queue : constant Text_Result :=
        Humanize.Phrases.Queue_Phrase
          (Support.En, Humanize.Phrases.Queued);
      Domain_Label : constant Text_Result :=
        Humanize.Phrases.Domain_Label (Humanize.Phrases.Job_Domain);
      State_Label : constant Text_Result :=
        Humanize.Phrases.Summary_State_Label
          (Humanize.Phrases.Summary_Running);
      Domain_Summary : constant Text_Result :=
        Humanize.Phrases.Domain_Summary
          (Support.En, Humanize.Phrases.Job_Domain,
           Humanize.Phrases.Summary_Running, 3, 10, 1, "task", "tasks");
      Queue_Summary : constant Text_Result :=
        Humanize.Phrases.Queue_Summary
          (Support.En, 5, 2, 1, 4, "job", "jobs");
      Empty_Queue : constant Text_Result :=
        Humanize.Phrases.Queue_Summary (Support.En, 0, 0);
      Cache_Summary : constant Text_Result :=
        Humanize.Phrases.Cache_Summary (Support.En, 8, 2);
      Empty_Cache : constant Text_Result :=
        Humanize.Phrases.Cache_Summary (Support.En, 0, 0);
      Sync_Summary : constant Text_Result :=
        Humanize.Phrases.Sync_Summary (Support.En, 8, 10, 1);
      Import_Summary : constant Text_Result :=
        Humanize.Phrases.Import_Summary
          (Support.En, 1, 1, 0, "record", "records");
      Export_Summary : constant Text_Result :=
        Humanize.Phrases.Export_Summary
          (Support.En, 0, 0, 0, "file", "files");
      File_Comparison : constant Text_Result :=
        Humanize.Phrases.File_Size_Comparison
          (Support.En, 3_900_000, 1_600_000, "file A", "file B",
           Humanize.Bytes.Decimal_Byte_Options);
      File_Equal : constant Text_Result :=
        Humanize.Phrases.File_Size_Comparison
          (Support.En, 1_600_000, 1_600_000, "file A", "file B",
           Humanize.Bytes.Decimal_Byte_Options);
      Date_Before : constant Text_Result :=
        Humanize.Phrases.Date_Comparison
          (Support.En,
           (Year => 2026, Month => 3, Day => 18, others => 0),
           (Year => 2026, Month => 3, Day => 21, others => 0),
           "updated", "release");
      Date_After : constant Text_Result :=
        Humanize.Phrases.Date_Comparison
          (Support.En,
           (Year => 2026, Month => 3, Day => 24, others => 0),
           (Year => 2026, Month => 3, Day => 21, others => 0),
           "published", "release");
      Number_Comparison : constant Text_Result :=
        Humanize.Phrases.Number_Comparison
          (Support.En, 88.0, 100.0, "score", "baseline");
      Number_Unit_Comparison : constant Text_Result :=
        Humanize.Phrases.Number_Comparison
          (Support.En, 12.5, 10.0, "latency", "target", "ms", "ms");
      Percent_Comparison : constant Text_Result :=
        Humanize.Phrases.Percent_Comparison
          (Support.En, 88.0, 100.0, "score", "baseline");
      Percent_Invalid : constant Text_Result :=
        Humanize.Phrases.Percent_Comparison
          (Support.En, 88.0, 0.0, "score", "baseline");
      Security : constant Text_Result :=
        Humanize.Phrases.Security_Phrase
          (Support.En, Humanize.Phrases.Token_Expired);
      Deployment : constant Text_Result :=
        Humanize.Phrases.Deployment_Phrase
          (Support.En, Humanize.Phrases.Build_Failed);
      Health : constant Text_Result :=
        Humanize.Phrases.Health_Phrase
          (Support.En, Humanize.Phrases.Degraded);
      Notification : constant Text_Result :=
        Humanize.Phrases.Notification_Phrase
          (Support.En, Humanize.Phrases.Snoozed);
      Form : constant Text_Result :=
        Humanize.Phrases.Form_Phrase
          (Support.En, Humanize.Phrases.Invalid_Input);
      Access_Text : constant Text_Result :=
        Humanize.Phrases.Access_Phrase
          (Support.En, Humanize.Phrases.Denied);
      Sync : constant Text_Result :=
        Humanize.Phrases.Sync_Phrase
          (Support.En, Humanize.Phrases.Sync_Conflict);
      Transfer : constant Text_Result :=
        Humanize.Phrases.Transfer_Phrase
          (Support.En, Humanize.Phrases.Export_Failed);
      Search : constant Text_Result :=
        Humanize.Phrases.Search_Phrase
          (Support.En, Humanize.Phrases.No_Matches);
      Collaboration : constant Text_Result :=
        Humanize.Phrases.Collaboration_Phrase
          (Support.En, Humanize.Phrases.Typing);
      Issue : constant Text_Result :=
        Humanize.Phrases.Issue_Phrase
          (Support.En, Humanize.Phrases.Merged);
      Task_Text : constant Text_Result :=
        Humanize.Phrases.Task_Phrase
          (Support.En, Humanize.Phrases.In_Progress);
      Severity : constant Text_Result :=
        Humanize.Phrases.Severity_Label
          (Humanize.Phrases.Security_Severity
             (Humanize.Phrases.Token_Expired));
      CI : constant Text_Result :=
        Humanize.Phrases.CI_Phrase
          (Support.En, Humanize.Phrases.Pipeline_Failed);
      Ticket : constant Text_Result :=
        Humanize.Phrases.Ticket_Phrase
          (Support.En, Humanize.Phrases.Ticket_Escalated);
      Payment : constant Text_Result :=
        Humanize.Phrases.Payment_Lifecycle_Phrase
          (Support.En, Humanize.Phrases.Payment_Requires_Action);
      Backup : constant Text_Result :=
        Humanize.Phrases.Backup_Phrase
          (Support.En, Humanize.Phrases.Backup_Stale);
      Incident : constant Text_Result :=
        Humanize.Phrases.Incident_Phrase
          (Support.En, Humanize.Phrases.Incident_Mitigated);
      Release : constant Text_Result :=
        Humanize.Phrases.Release_Phrase
          (Support.En, Humanize.Phrases.Release_Published);
      Audit : constant Text_Result :=
        Humanize.Phrases.Audit_Phrase
          (Support.En, Humanize.Phrases.Audit_Deleted);
      Flag : constant Text_Result :=
        Humanize.Phrases.Feature_Flag_Phrase
          (Support.En, Humanize.Phrases.Flag_Rolling_Out);
      Webhook : constant Text_Result :=
        Humanize.Phrases.Webhook_Phrase
          (Support.En, Humanize.Phrases.Webhook_Failed);
      API_Key : constant Text_Result :=
        Humanize.Phrases.API_Key_Phrase
          (Support.En, Humanize.Phrases.API_Key_Rotated);
      Quota : constant Text_Result :=
        Humanize.Phrases.Quota_Phrase
          (Support.En, Humanize.Phrases.Quota_Exceeded);
      Invoice : constant Text_Result :=
        Humanize.Phrases.Invoice_Phrase
          (Support.En, Humanize.Phrases.Refund_Failed);
      Database : constant Text_Result :=
        Humanize.Phrases.Database_Phrase
          (Support.En, Humanize.Phrases.Database_Replication_Lagging);
      Spanish_Database : constant Text_Result :=
        Humanize.Phrases.Database_Phrase
          (Support.Locale ("es"),
           Humanize.Phrases.Database_Replication_Lagging);
      Spanish_Database_Regional : constant Text_Result :=
        Humanize.Phrases.Database_Phrase
          (Support.Locale ("ES_mx"),
           Humanize.Phrases.Database_Replication_Lagging);
      Swedish_Database : constant Text_Result :=
        Humanize.Phrases.Database_Phrase
          (Support.Locale ("sv"),
           Humanize.Phrases.Database_Replication_Lagging);
      Swedish_Database_Regional : constant Text_Result :=
        Humanize.Phrases.Database_Phrase
          (Support.Locale ("SV_se"),
           Humanize.Phrases.Database_Replication_Lagging);
      Norwegian_Database_Regional : constant Text_Result :=
        Humanize.Phrases.Database_Phrase
          (Support.Locale ("NB_no"),
           Humanize.Phrases.Database_Replication_Lagging);
      Field_Change : constant Text_Result :=
        Humanize.Phrases.Field_Change_Summary (Support.En, 2, 1, 1);
      Field_Diff : constant Text_Result :=
        Humanize.Phrases.Field_Diff_Summary
          (Support.En, "title", "draft", "final");
      Field_Unchanged : constant Text_Result :=
        Humanize.Phrases.Field_Unchanged_Summary
          (Support.En, "status", "open");
      Backup_Key : constant Text_Result :=
        Humanize.Phrases.Backup_Key (Humanize.Phrases.Backup_Stale);
      Spanish_Saved : constant Text_Result :=
        Humanize.Phrases.Status_Phrase
          (Support.Locale ("es"), Humanize.Phrases.Saved);
      Spanish_Saved_Regional : constant Text_Result :=
        Humanize.Phrases.Status_Phrase
          (Support.Locale ("ES_mx"), Humanize.Phrases.Saved);
      Danish_Permission : constant Text_Result :=
        Humanize.Phrases.Network_Phrase
          (Support.Locale ("da"), Humanize.Phrases.Permission_Denied);
      Russian_CI : constant Text_Result :=
        Humanize.Phrases.CI_Phrase
          (Support.Locale ("ru"), Humanize.Phrases.Pipeline_Failed);
      Japanese_Payment : constant Text_Result :=
        Humanize.Phrases.Payment_Lifecycle_Phrase
          (Support.Locale ("ja"), Humanize.Phrases.Payment_Requires_Action);
      Japanese_Payment_Regional : constant Text_Result :=
        Humanize.Phrases.Payment_Lifecycle_Phrase
          (Support.Locale ("JA_jp"), Humanize.Phrases.Payment_Requires_Action);
      Phrase_Locales : constant Text_Result :=
        Humanize.Phrases.Supported_Phrase_Locales;
      Phrase_Packs : constant Text_Result :=
        Humanize.Phrases.Phrase_Pack_Summary;
      Phrase_Key : constant Text_Result :=
        Humanize.Phrases.CI_Key (Humanize.Phrases.Pipeline_Failed);
      Phrase_Tone : constant Text_Result :=
        Humanize.Phrases.Tone_Label
          (Humanize.Phrases.Tone_For_Severity
             (Humanize.Phrases.Danger_Severity));
   begin
      AUnit.Assertions.Assert
        (Loading.Status = Ok and then Support.Text (Loading) = "loading",
         "English UI phrase");
      AUnit.Assertions.Assert
        (Saved_De.Status = Ok and then Support.Text (Saved_De) = "gespeichert",
         "German UI phrase");
      AUnit.Assertions.Assert
        (Uploading.Status = Ok and then Support.Text (Uploading) = "uploading",
         "file phrase");
      AUnit.Assertions.Assert
        (Required.Status = Ok and then Support.Text (Required) = "required",
         "validation phrase");
      AUnit.Assertions.Assert
        (Empty.Status = Ok and then Support.Text (Empty) = "no results",
         "empty state phrase");
      AUnit.Assertions.Assert
        (Permission.Status = Ok
         and then Support.Text (Permission) = "permission denied",
         "network permission phrase");
      AUnit.Assertions.Assert
        (Auth.Status = Ok and then Support.Text (Auth) = "session expired",
         "auth phrase");
      AUnit.Assertions.Assert
        (Billing.Status = Ok and then Support.Text (Billing) = "payment due",
         "billing phrase");
      AUnit.Assertions.Assert
        (Workflow.Status = Ok and then Support.Text (Workflow) = "in review",
         "workflow phrase");
      AUnit.Assertions.Assert
        (Queue.Status = Ok and then Support.Text (Queue) = "queued",
         "queue phrase");
      AUnit.Assertions.Assert
        (Domain_Label.Status = Ok and then Support.Text (Domain_Label) = "job"
         and then State_Label.Status = Ok
         and then Support.Text (State_Label) = "running",
         "generic summary labels");
      AUnit.Assertions.Assert
        (Domain_Summary.Status = Ok
         and then Support.Text (Domain_Summary)
           = "job running: 3 of 10 tasks complete, 1 failed",
         "generic domain progress summary");
      AUnit.Assertions.Assert
        (Queue_Summary.Status = Ok
         and then Support.Text (Queue_Summary)
           = "queue: 5 jobs queued, 2 running, 1 failed, 4 complete",
         "queue count summary");
      AUnit.Assertions.Assert
        (Empty_Queue.Status = Ok
         and then Support.Text (Empty_Queue) = "queue empty",
         "empty queue summary");
      AUnit.Assertions.Assert
        (Cache_Summary.Status = Ok
         and then Support.Text (Cache_Summary)
           = "cache: 8 hits, 2 misses, 80% hit rate",
         "cache hit-rate summary");
      AUnit.Assertions.Assert
        (Empty_Cache.Status = Ok
         and then Support.Text (Empty_Cache) = "cache: no requests",
         "empty cache summary");
      AUnit.Assertions.Assert
        (Sync_Summary.Status = Ok
         and then Support.Text (Sync_Summary)
           = "sync running: 8 of 10 items complete, 1 failed",
         "sync progress summary");
      AUnit.Assertions.Assert
        (Import_Summary.Status = Ok
         and then Support.Text (Import_Summary)
           = "import running: 1 of 1 record complete",
         "import progress summary");
      AUnit.Assertions.Assert
        (Export_Summary.Status = Ok
         and then Support.Text (Export_Summary)
           = "export running: no files",
         "export empty summary");
      AUnit.Assertions.Assert
        (File_Comparison.Status = Ok
         and then Support.Text (File_Comparison)
           = "file A is 2.3 MB larger than file B",
         "file size comparison summary");
      AUnit.Assertions.Assert
        (File_Equal.Status = Ok
         and then Support.Text (File_Equal)
           = "file A is the same size as file B",
         "equal file size comparison summary");
      AUnit.Assertions.Assert
        (Date_Before.Status = Ok
         and then Support.Text (Date_Before)
           = "updated is 3 days before release",
         "date before comparison summary");
      AUnit.Assertions.Assert
        (Date_After.Status = Ok
         and then Support.Text (Date_After)
           = "published is 3 days after release",
         "date after comparison summary");
      AUnit.Assertions.Assert
        (Number_Comparison.Status = Ok
         and then Support.Text (Number_Comparison)
           = "score is 12 lower than baseline",
         "absolute number comparison summary");
      AUnit.Assertions.Assert
        (Number_Unit_Comparison.Status = Ok
         and then Support.Text (Number_Unit_Comparison)
           = "latency is 2.5 ms higher than target",
         "unit number comparison summary");
      AUnit.Assertions.Assert
        (Percent_Comparison.Status = Ok
         and then Support.Text (Percent_Comparison)
           = "score is 12% lower than baseline",
         "relative percent comparison summary");
      AUnit.Assertions.Assert
        (Percent_Invalid.Status = Invalid_Value,
         "percent comparison rejects zero baseline");
      declare
         Buffer  : String (1 .. 80);
         Written : Natural;
         Code    : Humanize.Status.Status_Code;
      begin
         Humanize.Phrases.Cache_Summary_Into
           (Support.En, 8, 2, Buffer, Written, Code);
         AUnit.Assertions.Assert
           (Code = Ok
            and then Buffer (1 .. Written)
              = "cache: 8 hits, 2 misses, 80% hit rate",
            "bounded cache summary");
      end;
      declare
         Buffer  : String (1 .. 80);
         Written : Natural;
         Code    : Humanize.Status.Status_Code;
      begin
         Humanize.Phrases.Percent_Comparison_Into
           (Support.En, 88.0, 100.0, "score", "baseline",
            Buffer, Written, Code);
         AUnit.Assertions.Assert
           (Code = Ok
            and then Buffer (1 .. Written)
              = "score is 12% lower than baseline",
            "bounded percent comparison");
      end;
      declare
         Buffer  : String (1 .. 80);
         Written : Natural;
         Code    : Humanize.Status.Status_Code;
      begin
         Humanize.Phrases.Network_Phrase_Into
           (Support.Locale ("da"),
            Humanize.Phrases.Permission_Denied,
            Buffer,
            Written,
            Code);
         AUnit.Assertions.Assert
           (Code = Ok
            and then Buffer (1 .. Written)
              = B ("616467616E67206EC3A667746574"),
            "bounded generated-source phrase locale");
      end;
      AUnit.Assertions.Assert
        (Security.Status = Ok and then Support.Text (Security) = "token expired",
         "security phrase");
      AUnit.Assertions.Assert
        (Deployment.Status = Ok
         and then Support.Text (Deployment) = "build failed",
         "deployment phrase");
      AUnit.Assertions.Assert
        (Health.Status = Ok and then Support.Text (Health) = "degraded",
         "health phrase");
      AUnit.Assertions.Assert
        (Notification.Status = Ok
         and then Support.Text (Notification) = "snoozed",
         "notification phrase");
      AUnit.Assertions.Assert
        (Form.Status = Ok and then Support.Text (Form) = "invalid input",
         "form phrase");
      AUnit.Assertions.Assert
        (Access_Text.Status = Ok
         and then Support.Text (Access_Text) = "denied",
         "access phrase");
      AUnit.Assertions.Assert
        (Sync.Status = Ok and then Support.Text (Sync) = "sync conflict",
         "sync phrase");
      AUnit.Assertions.Assert
        (Transfer.Status = Ok
         and then Support.Text (Transfer) = "export failed",
         "transfer phrase");
      AUnit.Assertions.Assert
        (Search.Status = Ok and then Support.Text (Search) = "no matches",
         "search phrase");
      AUnit.Assertions.Assert
        (Collaboration.Status = Ok
         and then Support.Text (Collaboration) = "typing",
         "collaboration phrase");
      AUnit.Assertions.Assert
        (Issue.Status = Ok and then Support.Text (Issue) = "merged",
         "issue phrase");
      AUnit.Assertions.Assert
        (Task_Text.Status = Ok
         and then Support.Text (Task_Text) = "in progress",
         "task phrase");
      AUnit.Assertions.Assert
        (Severity.Status = Ok
         and then Support.Text (Severity) = "danger"
         and then Humanize.Phrases.Task_Severity
           (Humanize.Phrases.In_Progress) = Humanize.Phrases.Info_Severity,
         "phrase severity metadata");
      AUnit.Assertions.Assert
        (CI.Status = Ok
         and then Support.Text (CI) = "pipeline failed"
         and then Humanize.Phrases.CI_Severity
           (Humanize.Phrases.Pipeline_Failed) = Humanize.Phrases.Danger_Severity,
         "CI phrase pack");
      AUnit.Assertions.Assert
        (Ticket.Status = Ok
         and then Support.Text (Ticket) = "ticket escalated"
         and then Humanize.Phrases.Ticket_Severity
           (Humanize.Phrases.Ticket_Escalated) = Humanize.Phrases.Danger_Severity,
         "ticket phrase pack");
      AUnit.Assertions.Assert
        (Backup.Status = Ok
         and then Support.Text (Backup) = "backup stale"
         and then Humanize.Phrases.Backup_Severity
           (Humanize.Phrases.Backup_Stale) = Humanize.Phrases.Warning_Severity
         and then Backup_Key.Status = Ok
         and then Support.Text (Backup_Key) = "backup.backup_stale"
         and then Incident.Status = Ok
         and then Support.Text (Incident) = "incident mitigated"
         and then Humanize.Phrases.Incident_Severity
           (Humanize.Phrases.Incident_Mitigated)
             = Humanize.Phrases.Warning_Severity
         and then Release.Status = Ok
         and then Support.Text (Release) = "release published"
         and then Humanize.Phrases.Release_Severity
           (Humanize.Phrases.Release_Published)
             = Humanize.Phrases.Success_Severity,
         "operational phrase packs");
      AUnit.Assertions.Assert
        (Audit.Status = Ok
         and then Support.Text (Audit) = "audit entry deleted"
         and then Humanize.Phrases.Audit_Severity
           (Humanize.Phrases.Audit_Deleted) =
             Humanize.Phrases.Warning_Severity
         and then Flag.Status = Ok
         and then Support.Text (Flag) = "feature flag rolling out"
         and then Humanize.Phrases.Feature_Flag_Severity
           (Humanize.Phrases.Flag_Rolling_Out) =
             Humanize.Phrases.Info_Severity
         and then Webhook.Status = Ok
         and then Support.Text (Webhook) = "webhook failed"
         and then Humanize.Phrases.Webhook_Severity
           (Humanize.Phrases.Webhook_Failed) =
             Humanize.Phrases.Danger_Severity
         and then API_Key.Status = Ok
         and then Support.Text (API_Key) = "API key rotated"
         and then Humanize.Phrases.API_Key_Severity
           (Humanize.Phrases.API_Key_Rotated) =
             Humanize.Phrases.Success_Severity
         and then Quota.Status = Ok
         and then Support.Text (Quota) = "quota exceeded"
         and then Humanize.Phrases.Quota_Severity
           (Humanize.Phrases.Quota_Exceeded) =
             Humanize.Phrases.Danger_Severity
         and then Invoice.Status = Ok
         and then Support.Text (Invoice) = "refund failed"
         and then Humanize.Phrases.Invoice_Severity
           (Humanize.Phrases.Refund_Failed) =
             Humanize.Phrases.Danger_Severity,
         "SaaS phrase packs");
      declare
         Buffer  : String (1 .. 80);
         Written : Natural;
         Code    : Humanize.Status.Status_Code;
      begin
         Humanize.Phrases.Database_Phrase_Into
           (Support.En, Humanize.Phrases.Database_Replication_Lagging,
            Buffer, Written, Code);
         AUnit.Assertions.Assert
           (Database.Status = Ok
            and then Support.Text (Database)
              = "database replication lagging"
            and then Humanize.Phrases.Database_Severity
              (Humanize.Phrases.Database_Replication_Lagging)
                = Humanize.Phrases.Warning_Severity
            and then Code = Ok
            and then Buffer (1 .. Written)
              = "database replication lagging",
            "database phrase pack");
      end;
      AUnit.Assertions.Assert
        (Spanish_Database.Status = Ok
         and then Support.Text (Spanish_Database)
           = "base de datos replicacion retrasada",
         "generated database phrase locale");
      AUnit.Assertions.Assert
        (Spanish_Database_Regional.Status = Ok
         and then Support.Text (Spanish_Database_Regional)
           = Support.Text (Spanish_Database),
         "generated database phrase regional language fallback");
      AUnit.Assertions.Assert
        (Swedish_Database.Status = Ok
         and then Swedish_Database_Regional.Status = Ok
         and then Support.Text (Swedish_Database_Regional)
           = Support.Text (Swedish_Database),
         "regional Swedish database phrase uses normalized shared branch");
      AUnit.Assertions.Assert
        (Field_Change.Status = Ok
         and then Support.Text (Field_Change)
           = "4 fields: 2 changed, 1 added, 1 removed",
         "field change summary");
      AUnit.Assertions.Assert
        (Field_Diff.Status = Ok
         and then Support.Text (Field_Diff)
           = "title changed from draft to final",
         "field diff summary");
      AUnit.Assertions.Assert
        (Field_Unchanged.Status = Ok
         and then Support.Text (Field_Unchanged)
           = "status unchanged at open",
         "field unchanged summary");
      AUnit.Assertions.Assert
        (Payment.Status = Ok
         and then Support.Text (Payment) = "payment requires action"
         and then Humanize.Phrases.Payment_Lifecycle_Severity
           (Humanize.Phrases.Payment_Requires_Action)
             = Humanize.Phrases.Warning_Severity,
         "payment phrase pack");
      AUnit.Assertions.Assert
        (Phrase_Locales.Status = Ok
         and then Support.Text (Phrase_Locales) = Expected_Phrase_Locale_Text
         and then Humanize.Phrases.Is_Supported_Phrase_Locale ("en")
         and then Humanize.Phrases.Is_Supported_Phrase_Locale ("EN_us")
         and then Humanize.Phrases.Is_Supported_Phrase_Locale ("hi")
         and then Humanize.Phrases.Is_Supported_Phrase_Locale ("HI-in")
         and then not Humanize.Phrases.Is_Supported_Phrase_Locale ("ro")
         and then not Humanize.Phrases.Is_Supported_Phrase_Locale ("RO_ro")
         and then not Humanize.Phrases.Is_Generated_Phrase_Locale ("en")
         and then not Humanize.Phrases.Is_Generated_Phrase_Locale ("EN_us")
         and then Humanize.Phrases.Is_Generated_Phrase_Locale ("ja")
         and then Humanize.Phrases.Is_Generated_Phrase_Locale ("JA_jp"),
         "phrase locale metadata");
      AUnit.Assertions.Assert
        (Norwegian_Database_Regional.Status = Ok
         and then Contains
           (Support.Text (Norwegian_Database_Regional), "database")
         and then Contains
           (Support.Text (Norwegian_Database_Regional), "replikering")
         and then Contains
           (Support.Text (Norwegian_Database_Regional), "forsinket"),
         "regional Norwegian generated phrase tokens use normalized predicate");
      AUnit.Assertions.Assert
        (Japanese_Payment_Regional.Status = Ok
         and then Support.Text (Japanese_Payment_Regional) =
           Support.Text (Japanese_Payment),
         "regional Japanese generated phrase separator uses normalized predicate");
      AUnit.Assertions.Assert
        (Spanish_Saved.Status = Ok
         and then Support.Text (Spanish_Saved) = B ("677561726461646F")
         and then Spanish_Saved_Regional.Status = Ok
         and then Support.Text (Spanish_Saved_Regional) =
           Support.Text (Spanish_Saved)
         and then Danish_Permission.Status = Ok
         and then Support.Text (Danish_Permission)
           = B ("616467616E67206EC3A667746574")
         and then Russian_CI.Status = Ok
         and then Support.Text (Russian_CI)
           = B ("D0BAD0BED0BDD0B2D0B5D0B9D0B5D18020D181D0B1D0BED0B9")
         and then Japanese_Payment.Status = Ok
         and then Support.Text (Japanese_Payment)
           = B ("E694AFE68995E38184E8A681E5AFBEE5BF9C"),
         "generated-source phrase locales");
      AUnit.Assertions.Assert
        (Phrase_Key.Status = Ok
         and then Support.Text (Phrase_Key) = "ci.pipeline_failed"
         and then Phrase_Tone.Status = Ok
         and then Support.Text (Phrase_Tone) = "critical",
         "phrase key and tone metadata");
      AUnit.Assertions.Assert
        (Phrase_Packs.Status = Ok
         and then Support.Text (Phrase_Packs)
           = "ui file validation empty network auth billing workflow queue security "
             & "deployment health notification form access sync transfer search "
             & "collaboration issue task ci ticket payment backup incident release "
             & "audit flag webhook api_key quota invoice database summaries "
             & "comparisons",
         "phrase pack summary metadata");
   end Check_Phrase_Style_Presets;
