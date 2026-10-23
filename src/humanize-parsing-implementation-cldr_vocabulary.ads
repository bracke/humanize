--  The words and patterns CLDR renders durations and relative times with, in
--  humanize's shipped locales, for the parser to read back what the
--  formatters write. A unit's words come after the hand-kept tables of the
--  other parsing helpers; a relative time is matched here first, as these
--  patterns are the ones humanize renders.
--
--  The tables are built from i18n on first use.
package Humanize.Parsing.Implementation.CLDR_Vocabulary is

   --  Seconds in one Word of a time unit (second .. year), by any of CLDR's
   --  names for it in any shipped locale, width or plural form ("sekundi",
   --  "dygn", "秒钟"); 0 for a word CLDR does not name, or names as
   --  different units in different locales.
   function Unit_Seconds (Word : String) return Long_Long_Integer;

   --  Bytes in one Word of a decimal digital unit (byte .. terabyte) by any of
   --  CLDR's names for it in a shipped locale ("Mo", "кБ", "Byte"); 0.0 for
   --  a word CLDR does not name so, or names as different units.
   function Byte_Multiplier (Word : String) return Long_Float;

   --  Text with CLDR's no-break, narrow no-break and thin spaces written as
   --  ASCII spaces of the same byte length, so what a parse consumes still
   --  counts the caller's bytes.
   function Spaced (Text : String) return String;

   --  A Word that names a count of a unit without a number, as Arabic
   --  "ساعتان" (two hours) does: Count and the unit's seconds. 0 seconds
   --  for any other word.
   procedure Counted
     (Word    : String;
      Count   : out Natural;
      Seconds : out Long_Long_Integer);

   --  Text, a relative time as CLDR writes it ("peste 3 zile", "قبل ساعتين",
   --  "gestern"), in the parser's canonical form: "in 3 zile", "2 hours
   --  ago", "yesterday". "" for text that matches no CLDR pattern.
   function Relative_Canonical (Text : String) return String;

   --  Text read as a number spelled out by CLDR's rules in a shipped locale
   --  ("zwei" SHY "und" SHY "vierzig", "kolmesataa"), as a cardinal or, with
   --  Ordinal, an ordinal: Value and how many of Text's bytes the longest
   --  reading took, 0 when none.
   procedure Spelled_Number
     (Text     : String;
      Ordinal  : Boolean;
      Value    : out Long_Long_Integer;
      Consumed : out Natural);

   --  True where CLDR spells ordinals for Locale (Czech has no such rules,
   --  so humanize's own words, which this parser reads, stand).
   function Has_Ordinal_Rules (Locale : String) return Boolean;

end Humanize.Parsing.Implementation.CLDR_Vocabulary;
