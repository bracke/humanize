with Humanize.Contexts;
with Humanize.Datetimes;

--  Reading back, in a context's locale, what humanize's localized formatters
--  write: numbers ("1.234,5", Arabic-Indic digits), durations ("2 Stunden,
--  30 Minuten", Swahili "dakika 5", Arabic "ساعتان"), relative times ("vor 3
--  Tagen", "gestern") and byte sizes ("1,5 KiB"). A locale's forms are learnt
--  by rendering known values with the formatters themselves, so a reading is
--  exactly what the locale writes.
package Humanize.Parsing.Localized is

   --  The measurement families Humanize.Units formats, each in its base
   --  unit: metres, grams, litres, square metres, metres per second, degrees
   --  Celsius, joules, watts, pascals, hertz, bytes per second, degrees,
   --  volts, amperes.
   type Measure_Family is
     (Length, Mass, Volume, Area, Speed, Temperature, Energy, Power, Pressure, Frequency, Data_Rate, Angle,
      Voltage, Current);

   type Civil_Date_Parse_Result is record
      Status         : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Value          : Humanize.Datetimes.Civil_Date_Time;
      Exact          : Boolean := False;
      Consumed       : Natural := 0;
   end record;

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

   function Parse_Measure
     (Context : Humanize.Contexts.Context;
      Family  : Measure_Family;
      Text    : String)
      return Float_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Family What Text measures.
   --  @param Text A measurement as Humanize.Units writes it in the locale,
   --  at any scale it picks ("1,5 km", "350 mi", "68 °F").
   --  @return The value in the family's base unit (metres, degrees Celsius,
   --  ...); as precise as the text, so a rounded "1.2 mi" reads as 1931 m.

   function Parse_Date
     (Context   : Humanize.Contexts.Context;
      Text      : String;
      Reference : Humanize.Datetimes.Civil_Date_Time)
      return Civil_Date_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A date as Humanize.Datetimes.Calendar_Date_Label writes it
   --  in the ISO, short, medium or long style ("23. Oktober 2087",
   --  "23.10.87"), or a day word Natural_Day writes ("gestern").
   --  @param Reference Today, for day words.
   --  @return The date; a two-digit year is read in the 2000s.

   function Parse_Percent (Context : Humanize.Contexts.Context; Text : String) return Float_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A percentage as Humanize.Numbers.Percent writes it ("12,5 %").
   --  @return The percentage (12.5).

   function Parse_Compact (Context : Humanize.Contexts.Context; Text : String) return Float_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A number as Humanize.Numbers.Compact writes it, short or
   --  long ("1,2 Mio.", "3 milliards").
   --  @return The number, as precise as the text (not Exact when rounded).

   function Parse_Ordinal (Context : Humanize.Contexts.Context; Text : String) return Float_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text An ordinal as Humanize.Numbers.Ordinal writes it ("3.", "3rd", "3e").
   --  @return The number.

   function Parse_Currency
     (Context : Humanize.Contexts.Context;
      Text    : String;
      Code    : String)
      return Float_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text An amount as Humanize.Numbers.Currency writes it ("1.234,50 €").
   --  @param Code The ISO 4217 code it is in ("EUR").
   --  @return The amount.

end Humanize.Parsing.Localized;
