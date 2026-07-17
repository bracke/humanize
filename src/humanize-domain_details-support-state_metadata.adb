separate (Humanize.Domain_Details.Support)
function State_Metadata
  (Surface     : Domain_Surface;
   State_Label : String)
   return Domain_Label_Metadata
is
   Item : constant String := Clean (State_Label);
   Severity : Domain_Severity := Surface_Default_Severity (Surface);
   Tone : Domain_Tone := Surface_Default_Tone (Surface);
   Final : Boolean := False;
   Actionable : Boolean := False;
begin
   if Contains (Item, "failed")
     or else Contains (Item, "denied")
     or else Contains (Item, "blocked")
     or else Contains (Item, "missing")
     or else Contains (Item, "invalid")
     or else Contains (Item, "suspended")
     or else Contains (Item, "locked")
     or else Contains (Item, "regressed")
     or else Contains (Item, "rejected")
     or else Contains (Item, "revoked")
     or else Contains (Item, "unavailable")
     or else Contains (Item, "expired")
     or else Contains (Item, "error")
     or else Contains (Item, "critical")
     or else Contains (Item, "overdue")
     or else Contains (Item, "chargeback")
     or else Contains (Item, "infected")
     or else Contains (Item, "outage")
     or else Contains (Item, "offline")
     or else Contains (Item, "failing")
     or else Contains (Item, "timed out")
     or else Contains (Item, "breached")
     or else Contains (Item, "exceeded")
     or else Contains (Item, "conflict")
     or else Contains (Item, "breaking")
     or else Contains (Item, "over limit")
     or else Contains (Item, "over capacity")
     or else Contains (Item, "mismatch")
     or else Contains (Item, "secret")
     or else Contains (Item, "token")
     or else Contains (Item, "password")
     or else Contains (Item, "private key")
     or else Contains (Item, "api key")
     or else Contains (Item, "API key")
   then
      Severity := Danger_Severity;
      Tone := Critical_Tone;
      Actionable := True;
   elsif Contains (Item, "warning")
     or else Contains (Item, "pending")
     or else Contains (Item, "requires")
     or else Contains (Item, "required")
     or else Contains (Item, "retry")
     or else Contains (Item, "stale")
     or else Contains (Item, "partial")
     or else Contains (Item, "drifting")
     or else Contains (Item, "maintenance")
     or else Contains (Item, "muted")
     or else Contains (Item, "snoozed")
     or else Contains (Item, "waitlist")
     or else Contains (Item, "suspicious")
     or else Contains (Item, "draft")
     or else Contains (Item, "degraded")
     or else Contains (Item, "not ready")
     or else Contains (Item, "near limit")
     or else Contains (Item, "above expected range")
     or else Contains (Item, "below expected range")
     or else Contains (Item, "major")
     or else Contains (Item, "high utilization")
     or else Contains (Item, "full")
   then
      Severity := Warning_Severity;
      Tone := Caution_Tone;
      Actionable := True;
   elsif Contains (Item, "passed")
     or else Contains (Item, "enabled")
     or else Contains (Item, "deployed")
     or else Contains (Item, "approved")
     or else Contains (Item, "succeeded")
     or else Contains (Item, "verified")
     or else Contains (Item, "ready")
     or else Contains (Item, "active")
     or else Contains (Item, "paid")
     or else Contains (Item, "complete")
     or else Contains (Item, "resolved")
     or else Contains (Item, "granted")
     or else Contains (Item, "allowed")
   then
      Severity := Success_Severity;
      Tone := Positive_Tone;
      Final := True;
   end if;

   if Contains (Item, "closed")
     or else Contains (Item, "canceled")
     or else Contains (Item, "removed")
     or else Contains (Item, "expired")
     or else Contains (Item, "deleted")
     or else Contains (Item, "complete")
     or else Contains (Item, "resolved")
   then
      Final := True;
   end if;

   return
     (Surface    => Surface,
      Severity   => Severity,
      Tone       => Tone,
      Final      => Final,
      Actionable => Actionable);
end State_Metadata;
