separate (Humanize.Catalogs.Phrase_Data.Locale_Pl)
procedure Labels_3 is
begin
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {nie rozpoczęto} in_progress_state "
      & "{w toku} waiting_state {oczekuje} waiting_approval_state {oczekuje na "
      & "zatwierdzenie} blocked_state {zablokowano} completed_state "
      & "{ukończono} failed_state {niepowodzenie} cancelled_state {anulowano} "
      & "skipped_state {pominięto} other {wstrzymano}}");
end Labels_3;
