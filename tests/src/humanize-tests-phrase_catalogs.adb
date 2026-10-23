with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with AUnit.Assertions;

with Messages.Arguments;
with Messages.Result;
with Messages.Runtime;

with Humanize.Catalogs;
with Humanize.Contexts;
with Humanize.Datetimes;
with Humanize.Lists;
with Humanize.Phrases;
with Humanize.Status;

package body Humanize.Tests.Phrase_Catalogs is

   function "+" (S : String) return Unbounded_String renames To_Unbounded_String;

   --  Every phrase a locale translates (docs/PHRASE_TEMPLATES.md).
   Keys : constant array (Positive range <>) of Unbounded_String :=
     [+"all_count", +"filtered_count.none", +"filtered_count.all", +"filtered_count.some",
      +"more_count", +"others_count", +"page_count", +"page_size", +"pagination_range",
      +"position_count", +"selection_count", +"showing_count", +"validation_count",
      +"collection.empty", +"collection.none_shown", +"collection.showing_hidden",
      +"collection.showing", +"collection.shown_hidden", +"collection.shown",
      +"collection.visible_out_of", +"complete_count", +"percent_complete", +"step_count",
      +"attempt_count", +"throughput_remaining", +"accessible_progress", +"business_days",
      +"working_hours", +"due.overdue", +"due.today", +"due.tomorrow", +"due.in",
      +"calendar_difference.future", +"calendar_difference.past", +"cpu_load", +"battery",
      +"screen_size", +"refresh_rate", +"editorial_percent.symbol", +"editorial_percent.word",
      +"recurrence.second", +"recurrence.minute", +"recurrence.hour", +"recurrence.day",
      +"recurrence.week", +"recurrence.month", +"recurrence.quarter", +"recurrence.year",
      +"cache_summary.empty", +"cache_summary", +"field_change_summary", +"field_diff",
      +"field_added", +"field_removed", +"field_unchanged", +"number_comparison.equal",
      +"number_comparison.higher", +"number_comparison.lower", +"percent_comparison.equal",
      +"percent_comparison.higher", +"percent_comparison.lower", +"file_size_comparison.same",
      +"file_size_comparison.larger", +"file_size_comparison.smaller", +"date_comparison.same",
      +"date_comparison.after", +"date_comparison.before", +"queue_summary", +"domain_summary",
      +"summary.none", +"summary.completed", +"summary.completed_of", +"summary.failed",
      +"summary.queued", +"summary.running", +"summary.complete", +"backup.backup_running",
      +"backup.backup_completed", +"backup.backup_failed", +"backup.backup_stale",
      +"incident.incident_investigating", +"incident.incident_identified",
      +"incident.incident_mitigated", +"incident.incident_resolved", +"release.release_drafting",
      +"release.release_ready", +"release.release_published", +"release.release_rolled_back",
      +"audit.audit_created", +"audit.audit_updated", +"audit.audit_deleted",
      +"audit.audit_restored", +"flag.flag_enabled", +"flag.flag_disabled",
      +"flag.flag_rolling_out", +"flag.flag_rolled_back", +"webhook.webhook_pending",
      +"webhook.webhook_delivered", +"webhook.webhook_failed", +"webhook.webhook_retrying",
      +"api_key.api_key_active", +"api_key.api_key_revoked", +"api_key.api_key_expired",
      +"api_key.api_key_rotated", +"quota.quota_available", +"quota.quota_near_limit",
      +"quota.quota_exceeded", +"quota.quota_reset", +"invoice.invoice_draft",
      +"invoice.invoice_sent", +"invoice.invoice_paid", +"invoice.invoice_refunded",
      +"invoice.invoice_overdue", +"invoice.refund_failed", +"page_navigation.only",
      +"page_navigation.first", +"page_navigation.last", +"page_navigation.middle",
      +"end_of_week", +"end_of_month", +"end_of_quarter", +"time_of_day.night",
      +"time_of_day.morning", +"time_of_day.afternoon", +"time_of_day.evening",
      +"calendar_difference.same_day", +"calendar_difference.zero", +"queue_summary.empty",
      +"access.allowed", +"access.denied", +"access.owner", +"access.admin", +"access.viewer",
      +"access.editor", +"auth.signed_in", +"auth.signed_out", +"auth.session_expired",
      +"auth.locked", +"auth.two_factor_required", +"billing.trialing", +"billing.payment_due",
      +"billing.payment_failed", +"billing.paid", +"billing.past_due", +"billing.canceled",
      +"ci.pipeline_pending", +"ci.pipeline_running", +"ci.pipeline_passed",
      +"ci.pipeline_failed", +"ci.review_required", +"ci.deploy_blocked",
      +"collaboration.active_now", +"collaboration.away", +"collaboration.do_not_disturb",
      +"collaboration.typing", +"collaboration.viewing", +"collaboration.editing",
      +"deployment.deploying", +"deployment.deployed", +"deployment.rolling_back",
      +"deployment.rolled_back", +"deployment.build_failed", +"deployment.checks_passed",
      +"empty.no_items", +"empty.no_results", +"empty.no_messages", +"empty.no_selection",
      +"empty.nothing_to_show", +"file.uploading", +"file.downloading", +"file.copying",
      +"file.moving", +"file.deleting", +"file.deleted", +"file.restoring", +"file.synced",
      +"form.valid_input", +"form.invalid_input", +"form.dirty", +"form.pristine",
      +"form.submitted", +"form.submission_failed", +"health.healthy", +"health.degraded",
      +"health.unhealthy", +"health.incident", +"health.maintenance", +"health.recovering",
      +"issue.open", +"issue.closed", +"issue.reopened", +"issue.assigned", +"issue.unassigned",
      +"issue.merged", +"network.offline", +"network.online", +"network.connecting",
      +"network.syncing", +"network.sync_failed", +"network.permission_denied",
      +"network.read_only", +"notification.unread", +"notification.read", +"notification.muted",
      +"notification.snoozed", +"notification.sent", +"notification.delivered",
      +"payment.payment_authorized", +"payment.payment_captured", +"payment.payment_refunded",
      +"payment.payment_disputed", +"payment.payment_requires_action",
      +"payment.payment_expired", +"ui.empty", +"ui.loading", +"ui.saving", +"ui.saved",
      +"ui.unsaved", +"ui.retrying", +"ui.paused", +"ui.complete", +"ui.failed", +"ui.due_soon",
      +"ui.overdue", +"ui.last_seen", +"ui.updated_just_now", +"queue.queued", +"queue.running",
      +"queue.waiting", +"queue.blocked", +"queue.canceled_job", +"queue.completed_job",
      +"search.filtering", +"search.filtered", +"search.no_matches", +"search.search_ready",
      +"search.search_failed", +"search.query_too_short", +"security.secure",
      +"security.insecure", +"security.vulnerable", +"security.encrypted",
      +"security.unencrypted", +"security.token_expired", +"sync.sync_idle", +"sync.syncing_now",
      +"sync.sync_queued", +"sync.sync_conflict", +"sync.sync_complete", +"sync.sync_error",
      +"task.todo", +"task.in_progress", +"task.done", +"task.skipped", +"task.blocked_task",
      +"task.waiting_on", +"ticket.ticket_new", +"ticket.ticket_open", +"ticket.ticket_waiting",
      +"ticket.ticket_escalated", +"ticket.ticket_resolved", +"ticket.ticket_closed",
      +"transfer.importing", +"transfer.imported", +"transfer.import_failed",
      +"transfer.exporting", +"transfer.exported", +"transfer.export_failed",
      +"validation.required", +"validation.optional", +"validation.invalid",
      +"validation.too_short", +"validation.too_long", +"validation.out_of_range",
      +"validation.already_exists", +"workflow.draft", +"workflow.in_review",
      +"workflow.approved", +"workflow.rejected", +"workflow.published", +"workflow.archived",
      +"database.database_online", +"database.database_offline", +"database.database_degraded",
      +"database.database_migrating", +"database.database_migration_failed",
      +"database.database_replicating", +"database.database_replication_lagging",
      +"database.database_backup_running", +"database.database_backup_failed"];

   --  Every shipped locale besides English.
   Locales : constant array (Positive range <>) of Unbounded_String :=
     [+"da", +"de", +"fr", +"es", +"it", +"pt", +"nl", +"sv", +"no", +"nb", +"fi", +"pl", +"cs",
      +"tr", +"ru", +"uk", +"ja", +"ko", +"zh", +"ar", +"hi", +"ro", +"lt", +"sl", +"id", +"ms",
      +"eo", +"vi", +"sw", +"af", +"hu", +"sk", +"zh-Hant", +"zh-TW", +"pt-PT", +"es-419"];

   --  The numeric arguments any phrase takes, and the text ones.
   Numbers : constant array (Positive range <>) of Unbounded_String :=
     [+"total", +"matching", +"visible", +"remaining", +"page", +"size", +"first", +"last", +"position",
      +"selected", +"showing", +"count", +"hidden", +"done", +"step", +"attempt", +"rate", +"days", +"hours",
      +"every", +"hits", +"misses", +"changed", +"added", +"removed"];

   procedure Test_Every_Locale_Renders_Every_Phrase
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Runtime : Messages.Runtime.Instance;
      Loaded  : Messages.Runtime.Load_Result;
      Missing : Unbounded_String;
      Failed  : Natural := 0;
   begin
      Humanize.Catalogs.Load_Defaults (Runtime, Loaded);
      AUnit.Assertions.Assert (Messages.Runtime."=" (Loaded.Status, Messages.Runtime.Loaded), "default catalogs load");
      for Pass in 1 .. 2 loop
         declare
            Count : constant String := (if Pass = 1 then "1" else "5");
            Args  : Messages.Arguments.Arguments;
         begin
            for Name of Numbers loop
               Messages.Arguments.Set (Args, To_String (Name), Count);
            end loop;
            Messages.Arguments.Set (Args, "one", "file");
            Messages.Arguments.Set (Args, "other", "files");
            Messages.Arguments.Set (Args, "zero", "files");
            Messages.Arguments.Set (Args, "two", "files");
            Messages.Arguments.Set (Args, "few", "files");
            Messages.Arguments.Set (Args, "many", "files");
            Messages.Arguments.Set (Args, "severity", "error");
            Messages.Arguments.Set (Args, "unit", "item");
            Messages.Arguments.Set (Args, "field", "name");
            Messages.Arguments.Set (Args, "before", "a");
            Messages.Arguments.Set (Args, "after", "b");
            Messages.Arguments.Set (Args, "value", "2.5");
            Messages.Arguments.Set (Args, "current", "A");
            Messages.Arguments.Set (Args, "baseline", "B");
            Messages.Arguments.Set (Args, "quantity", "5 MB");
            Messages.Arguments.Set (Args, "details", "d1, d2");
            Messages.Arguments.Set (Args, "domain", "queue");
            Messages.Arguments.Set (Args, "state", "running");
            Messages.Arguments.Set (Args, "difference", "2 X");
            Messages.Arguments.Set (Args, "measure", "12 %");
            Messages.Arguments.Set (Args, "percent", "50");
            for Locale of Locales loop
               for Key of Keys loop
                  declare
                     Result : constant Messages.Result.Render_Result :=
                       Messages.Runtime.Render
                         (Runtime, To_String (Locale), "humanize.phrase." & To_String (Key), Args);
                     Text   : constant String :=
                       (if Messages.Result."=" (Result.Status, Messages.Result.Success)
                        then Messages.Result.Output_Text (Result.Text) else "");
                  begin
                     if Text = ""
                       or else (for some C of Text => C = '{' or else C = '}')
                     then
                        Failed := Failed + 1;
                        if Failed <= 20 then
                           Append (Missing, " " & To_String (Locale) & ":" & To_String (Key));
                        end if;
                     end if;
                  end;
               end loop;
            end loop;
         end;
      end loop;
      AUnit.Assertions.Assert
        (Failed = 0, Natural'Image (Failed) & " phrase renders failed:" & To_String (Missing));
   end Test_Every_Locale_Renders_Every_Phrase;

   function Image (Result : Humanize.Status.Text_Result) return String is
     (To_String (Result.Text));

   --  A noun's extra forms registered on the context reach the phrase:
   --  Polish "5 plików", not the plural "pliki".
   procedure Test_Registered_Noun_Forms
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Runtime : aliased Messages.Runtime.Instance;
      Loaded  : Messages.Runtime.Load_Result;
   begin
      Humanize.Catalogs.Load_Defaults (Runtime, Loaded);
      declare
         Plain : constant Humanize.Contexts.Context :=
           Humanize.Contexts.Create (Runtime'Unchecked_Access, "pl");
         Forms : constant Humanize.Contexts.Context :=
           Humanize.Contexts.With_Noun_Forms (Plain, "pliki", Few => "pliki", Many => "plików");
         Five  : constant String := Image (Humanize.Lists.All_Count (Forms, 5, "plik", "pliki"));
         Three : constant String := Image (Humanize.Lists.All_Count (Forms, 3, "plik", "pliki"));
      begin
         AUnit.Assertions.Assert
           (Ada.Strings.Unbounded.Index (To_Unbounded_String (Five), "plików") > 0,
            "many form for 5: [" & Five & "]");
         AUnit.Assertions.Assert
           (Ada.Strings.Unbounded.Index (To_Unbounded_String (Three), "pliki") > 0
            and then Ada.Strings.Unbounded.Index (To_Unbounded_String (Three), "plików") = 0,
            "few form for 3: [" & Three & "]");
         AUnit.Assertions.Assert
           (Humanize.Contexts.Noun_Form (Plain, "pliki", "many") = "pliki",
            "unregistered form is the plural");
         AUnit.Assertions.Assert
           (Image (Humanize.Lists.Count (Forms, 5, "plik", "pliki")) = "5 plików"
            and then Image (Humanize.Lists.Count (Forms, 22, "plik", "pliki")) = "22 pliki"
            and then Image (Humanize.Lists.Count (Forms, 1, "plik", "pliki")) = "1 plik",
            "count by Polish categories: [" & Image (Humanize.Lists.Count (Forms, 5, "plik", "pliki")) & "]");
      end;
   end Test_Registered_Noun_Forms;

   --  A frame's governed case reaches the units: German "in 2 Jahren".
   procedure Test_Governed_Case
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Runtime : aliased Messages.Runtime.Instance;
      Loaded  : Messages.Runtime.Load_Result;
      Options : Humanize.Datetimes.Calendar_Difference_Options :=
        Humanize.Datetimes.Default_Calendar_Difference_Options;
      From    : constant Humanize.Datetimes.Civil_Date_Time := (Year => 2024, Month => 1, Day => 10, others => 0);
      Later   : constant Humanize.Datetimes.Civil_Date_Time := (Year => 2026, Month => 1, Day => 10, others => 0);
   begin
      Humanize.Catalogs.Load_Defaults (Runtime, Loaded);
      Options.Style := Humanize.Datetimes.Calendar_Difference_Relative;
      declare
         De : constant Humanize.Contexts.Context := Humanize.Contexts.Create (Runtime'Unchecked_Access, "de");
         Future : constant String := Image (Humanize.Datetimes.Calendar_Difference_Label (De, From, Later, Options));
         Past   : constant String := Image (Humanize.Datetimes.Calendar_Difference_Label (De, Later, From, Options));
      begin
         AUnit.Assertions.Assert (Future = "in 2 Jahren", "German future: [" & Future & "]");
         AUnit.Assertions.Assert (Past = "vor 2 Jahren", "German past: [" & Past & "]");
      end;
      declare
         Lt : constant Humanize.Contexts.Context := Humanize.Contexts.Create (Runtime'Unchecked_Access, "lt");
         Compared : constant String := Image (Humanize.Phrases.Date_Comparison (Lt, Later, From, "X", "Y"));
      begin
         --  Lithuanian "2 metais vėliau": the instrumental its comparison governs.
         AUnit.Assertions.Assert
           (Ada.Strings.Unbounded.Index (To_Unbounded_String (Compared), "2 metais") > 0,
            "Lithuanian comparison: [" & Compared & "]");
      end;
   end Test_Governed_Case;

   --  Loading one locale's phrases leaves the others English.
   procedure Test_Load_One_Locale
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Runtime : aliased Messages.Runtime.Instance;
      Loaded  : Messages.Runtime.Load_Result;
   begin
      Humanize.Catalogs.Load_Defaults (Runtime, Loaded, Locale => "de-AT");
      AUnit.Assertions.Assert (Messages.Runtime."=" (Loaded.Status, Messages.Runtime.Loaded), "loads");
      declare
         De : constant String :=
           Image (Humanize.Phrases.Backup_Phrase
                    (Humanize.Contexts.Create (Runtime'Unchecked_Access, "de"), Humanize.Phrases.Backup_Failed));
         Fr : constant String :=
           Image (Humanize.Phrases.Backup_Phrase
                    (Humanize.Contexts.Create (Runtime'Unchecked_Access, "fr"), Humanize.Phrases.Backup_Failed));
      begin
         AUnit.Assertions.Assert (De = "Sicherung fehlgeschlagen", "German loaded: [" & De & "]");
         AUnit.Assertions.Assert (Fr = "backup failed", "French not loaded: [" & Fr & "]");
      end;
      Humanize.Catalogs.Load_Phrases (Runtime, Loaded, Locale => "fr");
      Humanize.Catalogs.Load_Phrases (Runtime, Loaded, Locale => "fr-CA");
      AUnit.Assertions.Assert (Messages.Runtime."=" (Loaded.Status, Messages.Runtime.Loaded), "adds French");
      declare
         Fr : constant String :=
           Image (Humanize.Phrases.Backup_Phrase
                    (Humanize.Contexts.Create (Runtime'Unchecked_Access, "fr"), Humanize.Phrases.Backup_Failed));
      begin
         AUnit.Assertions.Assert (Fr /= "backup failed", "French added later: [" & Fr & "]");
      end;
   end Test_Load_One_Locale;

   --  Regional variants: zh-TW reaches Traditional Chinese, pt-PT overrides
   --  the Brazilian base where it differs, pt-BR keeps it.
   procedure Test_Regional_Variants
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Runtime : aliased Messages.Runtime.Instance;
      Loaded  : Messages.Runtime.Load_Result;

      function Loading (Locale : String) return String is
        (Image (Humanize.Phrases.Status_Phrase
                  (Humanize.Contexts.Create (Runtime'Unchecked_Access, Locale), Humanize.Phrases.Loading)));

      function Bytes (Hex : String) return String is
         Result : String (1 .. Hex'Length / 2);
      begin
         for I in Result'Range loop
            Result (I) :=
              Character'Val (Natural'Value ("16#" & Hex (Hex'First + 2 * (I - 1) .. Hex'First + 2 * I - 1) & "#"));
         end loop;
         return Result;
      end Bytes;
   begin
      Humanize.Catalogs.Load_Defaults (Runtime, Loaded);
      AUnit.Assertions.Assert
        (Loading ("zh-TW") = Bytes ("E8BC89E585A5E4B8AD"), "zh-TW Traditional: [" & Loading ("zh-TW") & "]");
      AUnit.Assertions.Assert (Loading ("pt-PT") = "a carregar", "pt-PT: [" & Loading ("pt-PT") & "]");
      AUnit.Assertions.Assert (Loading ("pt-BR") = "carregando", "pt-BR: [" & Loading ("pt-BR") & "]");
   end Test_Regional_Variants;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize phrase catalog tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Every_Locale_Renders_Every_Phrase'Access,
        "every locale renders every phrase");
      Register_Routine (T, Test_Registered_Noun_Forms'Access, "registered noun forms");
      Register_Routine (T, Test_Governed_Case'Access, "governed case in date differences");
      Register_Routine (T, Test_Load_One_Locale'Access, "load one locale's phrases");
      Register_Routine (T, Test_Regional_Variants'Access, "regional variants");
   end Register_Tests;

end Humanize.Tests.Phrase_Catalogs;
