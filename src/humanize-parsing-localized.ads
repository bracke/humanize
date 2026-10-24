with Ada.Strings.Unbounded;

with Humanize.Contexts;
with Humanize.Datetimes;
with Humanize.Durations;
with Humanize.Geo;
with Humanize.Lists;
with Humanize.Numbers;

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

   function Parse_Clock_Label
     (Context   : Humanize.Contexts.Context;
      Text      : String;
      Reference : Humanize.Datetimes.Civil_Date_Time)
      return Civil_Date_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A label as Humanize.Datetimes.Calendar_Clock_Label writes it
   --  in the locale ("heute 14:47", "Montag 2:47 PM", "09.10.2026 14:47").
   --  @param Reference Today, as the label was written against.
   --  @return The day and time; a weekday reads as the past one.

   Max_List_Items : constant := 32;

   type List_Item_Array is array (1 .. Max_List_Items) of Ada.Strings.Unbounded.Unbounded_String;

   type List_Read_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Invalid_Argument;
      Count  : Natural := 0;
      Items  : List_Item_Array;
   end record;

   function Parse_List
     (Context : Humanize.Contexts.Context;
      Text    : String;
      Style   : Humanize.Lists.List_Style := Humanize.Lists.Conjunction)
      return List_Read_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A list as Humanize.Lists.Format writes it in the locale
   --  ("a, b und c", "a、b、c", "a وb وc").
   --  @param Style The list's style: "and" or "or".
   --  @return Its items in order; one item for a text with no connector.

   function Parse_Spellout (Context : Humanize.Contexts.Context; Text : String) return Float_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A number in words as Humanize.Numbers.Spellout writes it in
   --  the locale ("vierunddreißig", "mille deux cent", "千二百三十四").
   --  @return The number.

   function Parse_Ordinal_Words (Context : Humanize.Contexts.Context; Text : String) return Float_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text An ordinal in words as Humanize.Numbers.Spellout.Ordinal_Words
   --  writes it ("dreiundzwanzigste", "vingt-troisième"), humanize's own words
   --  where CLDR has no ordinal rules ("tisíc dvě stě třicet čtvrtý"), and
   --  the numeric ordinal it writes beyond them ("2.345.").
   --  @return The number.

   --  Which way a difference points: the relative style says ("in 2 Jahren",
   --  "vor 2 Jahren"), the plain one does not.
   type Difference_Direction is (Unstated, Past, Future, Same_Day);

   type Calendar_Difference_Parse_Result is record
      Status    : Humanize.Status.Status_Code := Humanize.Status.Invalid_Argument;
      Years     : Natural := 0;
      Months    : Natural := 0;
      Days      : Natural := 0;
      Direction : Difference_Direction := Unstated;
   end record;

   function Parse_Calendar_Difference
     (Context : Humanize.Contexts.Context;
      Text    : String)
      return Calendar_Difference_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A difference as Humanize.Datetimes.Calendar_Difference_Label
   --  writes it, plain ("2 Jahre, 2 Monate und 4 Tage", Arabic "سنتان، وشهران")
   --  or relative ("vor 2 Jahren", "in 3 Tagen", "am selben Tag").
   --  @return Its years, months and days, and its direction where it says.

   type Calendar_Period is (Week_Period, Month_Period, Year_Period);
   subtype Period_Offset is Integer range -1 .. 1;

   type Calendar_Relation_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Invalid_Argument;
      Period : Calendar_Period := Week_Period;
      Offset : Period_Offset := 0;
   end record;

   function Parse_Calendar_Relation
     (Context : Humanize.Contexts.Context;
      Text    : String)
      return Calendar_Relation_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A label as Humanize.Datetimes.Calendar_Relation writes it
   --  ("letzten Monat", "来週", "cette année").
   --  @return The period and its offset from the current one (-1 last, 0
   --  this, 1 next).

   type Number_Range_Parse_Result is record
      Status      : Humanize.Status.Status_Code := Humanize.Status.Invalid_Argument;
      Low         : Long_Float := 0.0;
      High        : Long_Float := 0.0;
      Approximate : Boolean := False;
   end record;

   function Parse_Number_Range
     (Context : Humanize.Contexts.Context;
      Text    : String)
      return Number_Range_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A range as Humanize.Numbers.Number_Range, Approximate_Range
   --  or Decimal_Range writes it ("1.200–5.000", "≈10–20", "1,2–3,4").
   --  @return Its bounds, and whether it was approximate.

   type Date_Range_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Invalid_Argument;
      First  : Humanize.Datetimes.Civil_Date_Time;
      Last   : Humanize.Datetimes.Civil_Date_Time;
   end record;

   function Parse_Date_Range
     (Context : Humanize.Contexts.Context;
      Text    : String)
      return Date_Range_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A range as Humanize.Datetimes.Date_Range writes it with
   --  month names and no weekdays ("9.–15. Okt. 2026", "2026年10月9日～15日").
   --  @return Its first and last day.

   function Parse_Duration_Range
     (Context : Humanize.Contexts.Context;
      Text    : String;
      Low     : out Humanize.Durations.Duration_Seconds;
      High    : out Humanize.Durations.Duration_Seconds)
      return Humanize.Status.Status_Code;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A range as Humanize.Durations.Format_Range writes it ("1
   --  Stunde-2 Stunden").
   --  @param Low Its lower bound in seconds.
   --  @param High Its upper bound in seconds.
   --  @return Ok, else Invalid_Argument.

   function Parse_Times (Context : Humanize.Contexts.Context; Text : String) return Float_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A count as Humanize.Frequencies.Times writes it ("3 Mal",
   --  Arabic "٣ مرات").
   --  @return The count.

   --  The duration labels Humanize.Durations writes around a length of time.
   type Duration_Label_Kind is
     (Countdown_Label, Within_Label, Next_Label, Between_Label, Age_Label, Stale_Label, Backup_Age_Label,
      ETA_Label, Expires_Label, Retry_Label, Modified_Label, Synced_Label);

   type Duration_Label_Parse_Result is record
      Status  : Humanize.Status.Status_Code := Humanize.Status.Invalid_Argument;
      Kind    : Duration_Label_Kind := Countdown_Label;
      Seconds : Humanize.Durations.Duration_Seconds := 0;
      High    : Humanize.Durations.Duration_Seconds := 0;
   end record;

   function Parse_Duration_Label
     (Context : Humanize.Contexts.Context;
      Text    : String)
      return Duration_Label_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A label as Countdown, SLA_Window, Next_Window, Interval,
   --  Age, Stale_For, Backup_Age, ETA, Expires_In, Retry_In, Modified_Ago or
   --  Synced_Ago writes it ("seit 2 Tagen veraltet", "изменено 2 часа назад").
   --  @return Which label, and its duration in seconds (Interval: Seconds
   --  to High).

   type Natural_Duration_Parse_Result is record
      Status    : Humanize.Status.Status_Code := Humanize.Status.Invalid_Argument;
      Style     : Humanize.Durations.Natural_Duration_Style := Humanize.Durations.Plain_Duration;
      Direction : Humanize.Durations.Duration_Distance_Direction := Humanize.Durations.Duration_Distance_Plain;
      Seconds   : Humanize.Durations.Duration_Seconds := 0;
   end record;

   function Parse_Natural_Duration
     (Context : Humanize.Contexts.Context;
      Text    : String)
      return Natural_Duration_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A duration as Natural_Duration or Duration_Distance writes
   --  it ("etwa 2 Stunden", "vor weniger als einer Minute", "3日後").
   --  @return Its wording style, direction, and a length of time it words
   --  so (approximate by nature: "about 2 hours" reads as 7200).

   type Coordinate_Parse_Result is record
      Status    : Humanize.Status.Status_Code := Humanize.Status.Invalid_Argument;
      Latitude  : Long_Float := 0.0;
      Longitude : Long_Float := 0.0;
   end record;

   function Parse_Latitude (Context : Humanize.Contexts.Context; Text : String) return Float_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A latitude as Humanize.Geo.Localized writes it ("52,5200° N").
   --  @return The latitude, negative south of the equator.

   function Parse_Longitude (Context : Humanize.Contexts.Context; Text : String) return Float_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A longitude as Humanize.Geo.Localized writes it ("西経13.4050°").
   --  @return The longitude, negative west of Greenwich.

   function Parse_Coordinate (Context : Humanize.Contexts.Context; Text : String) return Coordinate_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A coordinate as Humanize.Geo.Localized.Coordinate_Label writes it.
   --  @return Its latitude and longitude.

   type Bounding_Box_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Invalid_Argument;
      Box    : Humanize.Geo.Bounding_Box := (others => 0.0);
   end record;

   function Parse_Bounding_Box (Context : Humanize.Contexts.Context; Text : String) return Bounding_Box_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A box as Humanize.Geo.Localized.Bounding_Box_Label writes it.
   --  @return Its corners.

   type Direction_Parse_Result is record
      Status  : Humanize.Status.Status_Code := Humanize.Status.Invalid_Argument;
      Point   : Humanize.Geo.Direction_Point := Humanize.Geo.North;
      Bearing : Long_Float := 0.0;
   end record;

   function Parse_Direction (Context : Humanize.Contexts.Context; Text : String) return Direction_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A compass point as Humanize.Geo.Localized.Direction_Label
   --  writes it, in full or abbreviated ("Nord-Nordost", "NNO").
   --  @return The point and its bearing in degrees.

   function Parse_Bearing (Context : Humanize.Contexts.Context; Text : String) return Direction_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A bearing as Humanize.Geo.Localized.Bearing_Label writes it
   --  ("45° Nordost", "北東 45°").
   --  @return Its degrees and compass point.

   type Approximation_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Invalid_Argument;
      Kind   : Humanize.Numbers.Approximation_Kind := Humanize.Numbers.About;
      Value  : Long_Long_Integer := 0;
   end record;

   function Parse_Approximation (Context : Humanize.Contexts.Context; Text : String) return Approximation_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A number as Humanize.Numbers.Scales.Approximate writes it
   --  ("fast 1.200", "около 300").
   --  @return The approximation's kind and number.

   type Uncertainty_Parse_Result is record
      Status      : Humanize.Status.Status_Code := Humanize.Status.Invalid_Argument;
      Value       : Long_Float := 0.0;
      Uncertainty : Long_Float := 0.0;
   end record;

   function Parse_Uncertainty (Context : Humanize.Contexts.Context; Text : String) return Uncertainty_Parse_Result;
   --  @param Context Context whose locale wrote Text.
   --  @param Text A tolerance as Humanize.Numbers.Ranges.Uncertainty_Label or
   --  Tolerance_Range writes it ("12,5 ± 0,25", "12.5 (+/- 0.25)").
   --  @return Its value and the uncertainty either side.

end Humanize.Parsing.Localized;
