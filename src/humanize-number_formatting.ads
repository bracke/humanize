--  Locale number symbols and ASCII-to-locale value formatting.
--
--  Humanize formats numeric "{value}" arguments itself (i18n only substitutes
--  them as text). This package turns a locale-neutral ASCII number such as
--  "1234.5" into a locale-formatted one ("1,234.5" en, "1.234,5" de, "1 234,5"
--  fr) by applying the locale's decimal and grouping symbols. It is pure: no
--  i18n runtime calls and no localized prose (HUM-INV-001).
private package Humanize.Number_Formatting is

   type Number_Symbols is record
      Decimal  : Character := '.';
      Grouping : Character := ',';
      Group    : Boolean := True;
   end record;

   --  Symbols for a locale, resolved by its language subtag. Unknown locales
   --  use the root convention ('.' decimal, ',' grouping).
   function Symbols_For (Locale : String) return Number_Symbols;

   --  Reformat an ASCII decimal (optionally signed, '.' decimal point) using
   --  Symbols: replace the decimal point and group the integer digits.
   function Localize (Value : String; Symbols : Number_Symbols) return String;

end Humanize.Number_Formatting;
