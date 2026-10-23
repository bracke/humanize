separate (Humanize.Catalogs.Phrase_Data)
function Locale_Fr_Be return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("fr-BE", Name, Template));
begin
   return
     P ("business_days", "{days} {days, plural, one {jour ouvrable} other {jours ouvrables}}");
end Locale_Fr_Be;
