with Ada.Calendar;

with Humanize.Bytes;
with Humanize.Datetimes;
with Humanize.Lists;
with Humanize.Numbers;
with Humanize.Units;

--  Higher-level presentation presets that combine common formatting choices
--  across Humanize domains.
package Humanize.Styles is

   type Style_Preset is
     (Compact_UI,
      Verbose,
      Technical,
      Casual,
      Screen_Reader,
      CLI,
      Logs,
      Dashboard,
      Accessibility,
      Telemetry,
      Mobile_UI);

   type Calendar_Date_Preset is
     (Calendar_Date_Default_Preset,
      Calendar_Date_Compact_Badge_Preset,
      Calendar_Date_Fiscal_Half_Preset,
      Calendar_Date_Fiscal_Year_End_Preset,
      Calendar_Date_Semester_Preset,
      Calendar_Date_Month_Phase_Preset,
      Calendar_Date_Quarter_Phase_Preset);

   function Number_Options
     (Preset : Style_Preset)
      return Humanize.Numbers.Number_Options;
   --  @param Preset Style preset.
   --  @return Number formatting options for the preset.

   function Byte_Options
     (Preset : Style_Preset)
      return Humanize.Bytes.Byte_Options;
   --  @param Preset Style preset.
   --  @return Byte formatting options for the preset.

   function Datetime_Options
     (Preset : Style_Preset)
      return Humanize.Datetimes.Datetime_Options;
   --  @param Preset Style preset.
   --  @return Relative datetime options for the preset.

   function Range_Options
     (Preset : Style_Preset)
      return Humanize.Datetimes.Range_Options;
   --  @param Preset Style preset.
   --  @return Date/time range options for the preset.

   function Calendar_Date_Options
     (Preset : Style_Preset)
      return Humanize.Datetimes.Calendar_Date_Options;
   --  @param Preset Style preset.
   --  @return Calendar-date formatting options for the preset.

   function Calendar_Date_Options
     (Preset                  : Calendar_Date_Preset;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
      return Humanize.Datetimes.Calendar_Date_Options;
   --  @param Preset Focused calendar-date preset.
   --  @param Fiscal_Year_Start_Month First month of the fiscal year.
   --  @return Calendar-date formatting options for the focused preset.

   function List_Options
     (Preset : Style_Preset)
      return Humanize.Lists.List_Options;
   --  @param Preset Style preset.
   --  @return List formatting options for the preset.

   function Unit_Style
     (Preset : Style_Preset)
      return Humanize.Units.Unit_Style;
   --  @param Preset Style preset.
   --  @return Unit style for the preset.

   function With_Number_Fraction_Digits
     (Preset                  : Style_Preset;
      Maximum_Fraction_Digits : Natural;
      Suppress_Trailing_Zero  : Boolean)
      return Humanize.Numbers.Number_Options;
   --  @param Preset Base style preset.
   --  @param Maximum_Fraction_Digits Override fraction digit count.
   --  @param Suppress_Trailing_Zero Override trailing-zero policy.
   --  @return Number options derived from the preset and overrides.

   function With_Byte_Fraction_Digits
     (Preset                  : Style_Preset;
      Maximum_Fraction_Digits : Natural;
      Suppress_Trailing_Zero  : Boolean)
      return Humanize.Bytes.Byte_Options;
   --  @param Preset Base style preset.
   --  @param Maximum_Fraction_Digits Override fraction digit count.
   --  @param Suppress_Trailing_Zero Override trailing-zero policy.
   --  @return Byte options derived from the preset and overrides.

   function With_Range_Separator
     (Preset    : Style_Preset;
      Separator : Character)
      return Humanize.Datetimes.Range_Options;
   --  @param Preset Base style preset.
   --  @param Separator Override range separator.
   --  @return Range options derived from the preset and separator override.

   function With_Datetime_Threshold
     (Preset                : Style_Preset;
      Now_Threshold_Seconds : Natural)
      return Humanize.Datetimes.Datetime_Options;
   --  @param Preset Base style preset.
   --  @param Now_Threshold_Seconds Override "now" threshold.
   --  @return Datetime options derived from the preset and threshold override.

   function With_Calendar_Date_Style
     (Preset                  : Style_Preset;
      Style                   : Humanize.Datetimes.Calendar_Date_Style;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
      return Humanize.Datetimes.Calendar_Date_Options;
   --  @param Preset Base style preset, accepted for API symmetry.
   --  @param Style Override calendar-date style.
   --  @param Fiscal_Year_Start_Month First month of the fiscal year.
   --  @return Caller-selected calendar-date style options.

   function With_Fiscal_Year_Start
     (Preset                  : Calendar_Date_Preset;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number)
      return Humanize.Datetimes.Calendar_Date_Options;
   --  @param Preset Focused calendar-date preset.
   --  @param Fiscal_Year_Start_Month First month of the fiscal year.
   --  @return Calendar-date preset with fiscal-year start override.

   function With_List_Oxford_Comma
     (Preset       : Style_Preset;
      Oxford_Comma : Boolean)
      return Humanize.Lists.List_Options;
   --  @param Preset Base style preset.
   --  @param Oxford_Comma Override Oxford-comma policy.
   --  @return List options derived from the preset and punctuation override.

   function With_Byte_Unit_System
     (Preset      : Style_Preset;
      Unit_System : Humanize.Bytes.Byte_Unit_System)
      return Humanize.Bytes.Byte_Options;
   --  @param Preset Base style preset.
   --  @param Unit_System Override byte unit system.
   --  @return Byte options derived from the preset and unit-system override.

   function Select_Unit_Style
     (Preset : Style_Preset;
      Style  : Humanize.Units.Unit_Style)
      return Humanize.Units.Unit_Style;
   --  @param Preset Base style preset, accepted for API symmetry.
   --  @param Style Override unit style.
   --  @return Caller-selected unit style.

end Humanize.Styles;
