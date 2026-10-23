with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with AUnit.Assertions;

with Messages.Arguments;
with Messages.Result;
with Messages.Runtime;

with Humanize.Catalogs;

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
      +"audit.audit_restored", +"feature_flag.flag_enabled", +"feature_flag.flag_disabled",
      +"feature_flag.flag_rolling_out", +"feature_flag.flag_rolled_back",
      +"webhook.webhook_pending", +"webhook.webhook_delivered", +"webhook.webhook_failed",
      +"webhook.webhook_retrying", +"api_key.api_key_active", +"api_key.api_key_revoked",
      +"api_key.api_key_expired", +"api_key.api_key_rotated", +"quota.quota_available",
      +"quota.quota_near_limit", +"quota.quota_exceeded", +"quota.quota_reset",
      +"invoice.invoice_draft", +"invoice.invoice_sent", +"invoice.invoice_paid",
      +"invoice.invoice_refunded", +"invoice.invoice_overdue", +"invoice.refund_failed",
      +"page_navigation.only", +"page_navigation.first", +"page_navigation.last",
      +"page_navigation.middle", +"end_of_week", +"end_of_month", +"end_of_quarter",
      +"time_of_day.night", +"time_of_day.morning", +"time_of_day.afternoon",
      +"time_of_day.evening", +"calendar_difference.same_day", +"calendar_difference.zero",
      +"queue_summary.empty"];

   --  Every shipped locale besides English.
   Locales : constant array (Positive range <>) of Unbounded_String :=
     [+"da", +"de", +"fr", +"es", +"it", +"pt", +"nl", +"sv", +"no", +"nb", +"fi", +"pl", +"cs",
      +"tr", +"ru", +"uk", +"ja", +"ko", +"zh", +"ar", +"hi", +"ro", +"lt", +"sl", +"id", +"ms",
      +"eo", +"vi", +"sw", +"af", +"hu", +"sk"];

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
   end Register_Tests;

end Humanize.Tests.Phrase_Catalogs;
