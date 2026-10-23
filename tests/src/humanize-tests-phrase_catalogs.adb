with Ada.Calendar;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with AUnit.Assertions;

with Messages.Arguments;
with Messages.Result;
with Messages.Runtime;

with Humanize.Catalogs;
with Humanize.Contexts;
with Humanize.Datetimes;
with Humanize.Lists;
with Humanize.Operations;
with Humanize.Resources;
with Humanize.Parsing.Phrases;
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
      +"database.database_backup_running", +"database.database_backup_failed", +"times_noun",
      +"availability.all", +"availability.none", +"availability.partial", +"operation_progress",
      +"operation.queued", +"operation.running", +"operation.blocked", +"operation.retrying",
      +"operation.succeeded", +"operation.partially_succeeded", +"operation.failed",
      +"operation.canceled", +"operation.skipped", +"operation.stale",
      +"operation.unknown_state", +"operation.last_success", +"operation.next_retry",
      +"operation.stale_run", +"summary.skipped", +"summary.retried", +"summary.canceled"];

   --  Every shipped locale besides English.
   Locales : constant array (Positive range <>) of Unbounded_String :=
     [+"da", +"de", +"fr", +"es", +"it", +"pt", +"nl", +"sv", +"no", +"nb", +"fi", +"pl", +"cs",
      +"tr", +"ru", +"uk", +"ja", +"ko", +"zh", +"ar", +"hi", +"ro", +"lt", +"sl", +"id", +"ms",
      +"eo", +"vi", +"sw", +"af", +"hu", +"sk", +"zh-Hant", +"zh-TW", +"pt-PT", +"es-419", +"fr-CA",
      +"de-CH", +"de-LI", +"en-GB", +"en-AU", +"en-CA", +"fr-CH", +"fr-BE", +"zh-HK"];

   --  The numeric arguments any phrase takes, and the text ones.
   Numbers : constant array (Positive range <>) of Unbounded_String :=
     [+"total", +"matching", +"visible", +"remaining", +"page", +"size", +"first", +"last", +"position",
      +"selected", +"showing", +"count", +"hidden", +"done", +"step", +"attempt", +"rate", +"days", +"hours",
      +"every", +"hits", +"misses", +"changed", +"added", +"removed", +"available", +"unavailable"];

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
            Messages.Arguments.Set (Args, "genitive_one", "file");
            Messages.Arguments.Set (Args, "genitive_other", "files");
            Messages.Arguments.Set (Args, "accusative_one", "file");
            Messages.Arguments.Set (Args, "accusative_other", "files");
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
            Messages.Arguments.Set (Args, "name", "import");
            Messages.Arguments.Set (Args, "state", "running");
            Messages.Arguments.Set (Args, "time", "2 h");
            Messages.Arguments.Set (Args, "available", Count);
            Messages.Arguments.Set (Args, "unavailable", Count);
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
           Humanize.Contexts.With_Noun_Forms
             (Plain, "pliki", Few => "pliki", Genitive_One => "pliku", Genitive_Other => "plików");
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
      declare
         function Canceled (Locale : String) return String is
           (Image (Humanize.Phrases.Billing_Phrase
                     (Humanize.Contexts.Create (Runtime'Unchecked_Access, Locale), Humanize.Phrases.Canceled)));
      begin
         AUnit.Assertions.Assert (Canceled ("en-GB") = "cancelled", "en-GB: [" & Canceled ("en-GB") & "]");
         AUnit.Assertions.Assert (Canceled ("en-AU") = "cancelled", "en-AU: [" & Canceled ("en-AU") & "]");
         AUnit.Assertions.Assert (Canceled ("en-IN") = "cancelled", "en-IN: [" & Canceled ("en-IN") & "]");
         AUnit.Assertions.Assert (Canceled ("en-US") = "canceled", "en-US: [" & Canceled ("en-US") & "]");
         AUnit.Assertions.Assert (Canceled ("en-CA") = "cancelled", "en-CA: [" & Canceled ("en-CA") & "]");
      end;
      declare
         function Uploading (Locale : String) return String is
           (Image (Humanize.Phrases.File_Phrase
                     (Humanize.Contexts.Create (Runtime'Unchecked_Access, Locale), Humanize.Phrases.Uploading)));
      begin
         AUnit.Assertions.Assert
           (Uploading ("zh-HK") = Bytes ("E4B88AE8BC89E4B8AD"), "zh-HK: [" & Uploading ("zh-HK") & "]");
         AUnit.Assertions.Assert
           (Uploading ("zh-MO") = Bytes ("E4B88AE8BC89E4B8AD"), "zh-MO: [" & Uploading ("zh-MO") & "]");
         AUnit.Assertions.Assert (Uploading ("zh-TW") /= Bytes ("E4B88AE8BC89E4B8AD"), "zh-TW keeps Taiwan wording");
      end;
   end Test_Regional_Variants;

   Read_Back_Locales : constant array (Positive range <>) of Unbounded_String :=
     [+"en", +"de", +"ru", +"ja", +"ar"];
   Noun_Arguments : constant array (Positive range <>) of Unbounded_String :=
     [+"one", +"other", +"zero", +"two", +"few", +"many", +"genitive_one", +"genitive_other",
      +"accusative_one", +"accusative_other"];
   Text_Arguments : constant array (Positive range <>) of Unbounded_String :=
     [+"unit", +"field", +"before", +"after", +"current", +"baseline", +"quantity",
      +"details", +"difference", +"measure", +"name", +"time"];

   function Digits_Of (Value : Natural) return String is
     (Natural'Image (Value) (2 .. Natural'Image (Value)'Last));

   --  Phrases read back by the catalog that wrote them.
   procedure Test_Read_Phrases_Back
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      package P renames Humanize.Parsing.Phrases;
      use type Humanize.Status.Status_Code;
      Runtime : aliased Messages.Runtime.Instance;
      Loaded  : Messages.Runtime.Load_Result;

      function Ctx (Locale : String) return Humanize.Contexts.Context is
        (Humanize.Contexts.Create (Runtime'Unchecked_Access, Locale));
   begin
      Humanize.Catalogs.Load_Defaults (Runtime, Loaded);
      declare
         Page   : constant P.Phrase_Parse_Result :=
           P.Parse (Ctx ("de"), "page_count", Image (Humanize.Lists.Page_Count (Ctx ("de"), 3, 5)));
         En     : constant P.Phrase_Parse_Result :=
           P.Parse (Ctx ("en"), "page_count", Image (Humanize.Lists.Page_Count (Ctx ("en"), 3, 5)));
         Picked : constant P.Phrase_Parse_Result :=
           P.Parse (Ctx ("ja"), "selection_count",
                    Image (Humanize.Lists.Selection_Count (Ctx ("ja"), 2, 5, "file-noun", "file-noun")));
         Status : constant P.Phrase_Parse_Result :=
           P.Parse_Any (Ctx ("fr"), "backup.",
                        Image (Humanize.Phrases.Backup_Phrase (Ctx ("fr"), Humanize.Phrases.Backup_Failed)));
         Warnings : constant P.Phrase_Parse_Result :=
           P.Parse (Ctx ("de"), "validation_count",
                    Image (Humanize.Lists.Validation_Count
                             (Ctx ("de"), 4,
                              (Humanize.Lists.Default_Validation_Summary_Options with delta
                                 Severity => Humanize.Lists.Validation_Warning))));
      begin
         AUnit.Assertions.Assert
           (Page.Status = Humanize.Status.Ok and then P.Number (Page, "page") = 3 and then P.Number (Page, "total") = 5,
            "German page count read back");
         AUnit.Assertions.Assert
           (En.Status = Humanize.Status.Ok and then P.Number (En, "page") = 3, "English page count read back");
         AUnit.Assertions.Assert
           (Picked.Status = Humanize.Status.Ok and then P.Number (Picked, "selected") = 2
            and then P.Number (Picked, "total") = 5
            and then (for some I in 1 .. Picked.Text_Count => To_String (Picked.Texts (I)) = "file-noun"),
            "Japanese selection read back with its noun");
         AUnit.Assertions.Assert
           (Status.Status = Humanize.Status.Ok and then To_String (Status.Name) = "backup.backup_failed",
            "French status label identified: [" & To_String (Status.Name) & "]");
         AUnit.Assertions.Assert
           (Warnings.Status = Humanize.Status.Ok and then P.Number (Warnings, "count") = 4
            and then To_String (Warnings.Choices (1)) = "warning",
            "German validation count read back with its severity");
         AUnit.Assertions.Assert
           (P.Parse (Ctx ("de"), "page_count", "Kapitel 3 von 5").Status /= Humanize.Status.Ok,
            "text the phrase does not render is rejected");
      end;
      --  The operations and availability labels speak the locale and read back.
      declare
         Progress : constant String :=
           Image (Humanize.Operations.Progress_Summary
                    (Ctx ("de"), "Import", Humanize.Operations.Running, 3, 10, Failed => 1,
                     Singular => "Datei", Plural => "Dateien"));
         Avail : constant String :=
           Image (Humanize.Resources.Availability_Label (Ctx ("de"), 2, 5, "Replik", "Repliken"));
      begin
         AUnit.Assertions.Assert
           (Progress = "Import " & Character'Val (16#E2#) & Character'Val (16#80#) & Character'Val (16#93#)
                       & " l" & Character'Val (16#C3#) & Character'Val (16#A4#)
                       & "uft: 3 von 10 Dateien abgeschlossen und 1 fehlgeschlagen",
            "German operation progress: [" & Progress & "]");
         AUnit.Assertions.Assert
           (Avail = "2 von 5 Repliken verf" & Character'Val (16#C3#) & Character'Val (16#BC#) & "gbar, 3 nicht verf"
                    & Character'Val (16#C3#) & Character'Val (16#BC#) & "gbar",
            "German availability: [" & Avail & "]");
         AUnit.Assertions.Assert
           (P.Parse (Ctx ("de"), "availability.partial", Avail).Status = Humanize.Status.Ok
            and then P.Number (P.Parse (Ctx ("de"), "availability.partial", Avail), "unavailable") = 3,
            "German availability reads back");
      end;
      --  The locale's own digits and grouping read back too.
      declare
         Grouped : constant P.Phrase_Parse_Result := P.Parse (Ctx ("de"), "page_count", "Seite 1.234 von 5.000");
         --  Arabic page_count with Arabic-Indic digits for 3 and 9.
         Arabic  : constant String :=
           Image (Humanize.Lists.Page_Count (Ctx ("ar"), 3, 9));
         function Indic (Text : String) return String is
            Result : Unbounded_String;
         begin
            for C of Text loop
               if C in '0' .. '9' then
                  --  U+0660 + digit: D9 A0 .. D9 A9.
                  Append (Result, Character'Val (16#D9#) & Character'Val (16#A0# + Character'Pos (C) - 48));
               else
                  Append (Result, C);
               end if;
            end loop;
            return To_String (Result);
         end Indic;
         Read_Arabic : constant P.Phrase_Parse_Result := P.Parse (Ctx ("ar"), "page_count", Indic (Arabic));
         Started : constant Ada.Calendar.Time := Ada.Calendar.Clock;
         Fields  : P.Phrase_Parse_Result;
         use type Ada.Calendar.Time;
      begin
         AUnit.Assertions.Assert
           (Grouped.Status = Humanize.Status.Ok and then P.Number (Grouped, "page") = 1234
            and then P.Number (Grouped, "total") = 5000,
            "German grouped numbers read back");
         AUnit.Assertions.Assert
           (Read_Arabic.Status = Humanize.Status.Ok and then P.Number (Read_Arabic, "page") = 3
            and then P.Number (Read_Arabic, "total") = 9,
            "Arabic-Indic digits read back: [" & Indic (Arabic) & "]");
         for Repeat in 1 .. 20 loop
            Fields := P.Parse
              (Ctx ("de"), "field_change_summary",
               Image (Humanize.Phrases.Field_Change_Summary (Ctx ("de"), 4, 3, 2)));
         end loop;
         AUnit.Assertions.Assert
           (Fields.Status = Humanize.Status.Ok and then P.Number (Fields, "changed") = 4
            and then P.Number (Fields, "removed") = 2,
            "four numbers read back in order");
         AUnit.Assertions.Assert
           (Ada.Calendar.Clock - Started < 2.0, "four-number phrases read back quickly");
      end;
      --  Every phrase, rendered with distinct numbers, reads back in these
      --  locales.
      for Locale of Read_Back_Locales loop
         for Key of Keys loop
            declare
               Args : Messages.Arguments.Arguments;
               Next : Natural := 2;
            begin
               for Name of Numbers loop
                  Next := Next + 1;
                  Messages.Arguments.Set (Args, To_String (Name), Digits_Of (Next * 3));
               end loop;
               for Noun of Noun_Arguments loop
                  Messages.Arguments.Set (Args, To_String (Noun), "thing");
               end loop;
               for Name of Text_Arguments loop
                  Messages.Arguments.Set (Args, To_String (Name), "TXT");
               end loop;
               Messages.Arguments.Set (Args, "percent", "50");
               Messages.Arguments.Set (Args, "value", "2.5");
               Messages.Arguments.Set (Args, "severity", "warning");
               Messages.Arguments.Set (Args, "domain", "sync");
               Messages.Arguments.Set (Args, "state", "running");
               declare
                  Rendered : constant Messages.Result.Render_Result :=
                    Messages.Runtime.Render
                      (Runtime, To_String (Locale), "humanize.phrase." & To_String (Key), Args);
                  Text : constant String := Messages.Result.Output_Text (Rendered.Text);
                  Read : constant P.Phrase_Parse_Result := P.Parse (Ctx (To_String (Locale)), To_String (Key), Text);
               begin
                  AUnit.Assertions.Assert
                    (Read.Status = Humanize.Status.Ok,
                     To_String (Locale) & ":" & To_String (Key) & " does not read back: [" & Text & "]");
               end;
            end;
         end loop;
      end loop;
   end Test_Read_Phrases_Back;

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
      Register_Routine (T, Test_Read_Phrases_Back'Access, "read phrases back");
   end Register_Tests;

end Humanize.Tests.Phrase_Catalogs;
