with Humanize.Contexts;

--  Reading back, in a context's locale, what humanize's localized formatters
--  write: numbers ("1.234,5", Arabic-Indic digits), durations ("2 Stunden,
--  30 Minuten", Swahili "dakika 5", Arabic "ساعتان"), relative times ("vor 3
--  Tagen", "gestern") and byte sizes ("1,5 KiB"). A locale's forms are learnt
--  by rendering known values with the formatters themselves, so a reading is
--  exactly what the locale writes.
package Humanize.Parsing.Localized is

   function Parse_Number
     (Context : Humanize.Contexts.Context;
      Text    : String)
      return Float_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A number as the locale writes it, with its digits, grouping
   --  and decimal separator; a leading '-' or the locale's minus sign.
   --  @return The number; Invalid_Argument when Text is not one.

   function Parse_Duration
     (Context : Humanize.Contexts.Context;
      Text    : String)
      return Duration_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A duration as Humanize.Durations.Format or Format_Components
   --  write it in the locale: one or more components joined as the locale
   --  joins them.
   --  @return The duration in seconds (Exact unless a component had a
   --  fraction); Invalid_Argument when Text is not one.

   function Parse_Relative
     (Context : Humanize.Contexts.Context;
      Text    : String)
      return Duration_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A relative time as Humanize.Datetimes.Relative writes it in
   --  the locale ("vor 3 Tagen", "in 2 hours", "gestern").
   --  @return Its offset from the reference time in seconds, negative for the
   --  past; a calendar word reads as its whole span ("yesterday" -86400).
   --  Not Exact where the locale writes two offsets alike (Hindi "कल" is
   --  yesterday and tomorrow); the past is read.

   function Parse_Bytes
     (Context : Humanize.Contexts.Context;
      Text    : String)
      return Byte_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A byte size as Humanize.Bytes.Format writes it in the
   --  locale, binary ("1,5 KiB") or decimal ("1,5 kB") units.
   --  @return The size in bytes, rounded to a whole byte (Exact when no
   --  rounding was needed).

end Humanize.Parsing.Localized;
