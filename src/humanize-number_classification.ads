with Humanize.Numbers;
with Humanize.Selections;

--  Pure number rule selection (ordinals and compact magnitudes) plus the
--  deterministic ASCII numeric formatter. Returns a semantic message selection;
--  never localized text (HUM-INV-001).
private package Humanize.Number_Classification is

   function Ordinal
     (Value  : Natural;
      Gender : Humanize.Numbers.Ordinal_Gender)
      return Humanize.Selections.Message_Selection;

   function Compact
     (Value   : Long_Long_Integer;
      Options : Humanize.Numbers.Number_Options;
      Locale  : String;
      Style   : Humanize.Numbers.Compact_Style)
      return Humanize.Selections.Message_Selection;

   --  Percentage rendering: Value is the percent number (50.0 -> "50%").
   function Percent
     (Value   : Long_Float;
      Options : Humanize.Numbers.Number_Options;
      Locale  : String)
      return Humanize.Selections.Message_Selection;

end Humanize.Number_Classification;
