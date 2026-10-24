separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Fr_Ca (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "fr-CA", Name, Template);
   end P;
   --  The domain labels (label.*), in nested subunits.
   procedure Labels_1 is separate;
begin
   P ("business_days", "{days} {days, plural, one {jour ouvrable} other {jours ouvrables}}");
   P ("file.uploading", "téléversement en cours");
   P ("flag.flag_enabled", "indicateur de fonctionnalité activé");
   P ("flag.flag_disabled", "indicateur de fonctionnalité désactivé");
   P ("flag.flag_rolling_out", "indicateur de fonctionnalité en cours de déploiement");
   P ("flag.flag_rolled_back", "indicateur de fonctionnalité annulé");
   P ("ticket.ticket_new", "nouveau billet");
   P ("ticket.ticket_open", "billet ouvert");
   P ("ticket.ticket_waiting", "billet en attente");
   P ("ticket.ticket_escalated", "billet transféré au palier supérieur");
   P ("ticket.ticket_resolved", "billet résolu");
   P ("ticket.ticket_closed", "billet fermé");
   P ("net_diagnostic.proxy", "{endpoint} : échec du serveur mandataire");
   P ("calendar_range.weekend.last", "la fin de semaine dernière");
   P ("calendar_range.weekend.this", "cette fin de semaine");
   P ("calendar_range.weekend.next", "la fin de semaine prochaine");
   P ("calendar_range.weekend_of", "fin de semaine du {date}");
   Labels_1;
end Locale_Fr_Ca;
