with Humanize.Bytes;
with Humanize.Selections;

--  Pure byte-size rule selection plus the deterministic ASCII numeric
--  formatter. Returns a semantic message selection; never localized text and
--  never touches the i18n runtime (HUM-INV-001, HUM-INV-008).
private package Humanize.Byte_Classification is

   function Classify
     (Bytes   : Humanize.Bytes.Byte_Count;
      Options : Humanize.Bytes.Byte_Options)
      return Humanize.Selections.Message_Selection;

end Humanize.Byte_Classification;
