package body Humanize.Styles is

   function Number_Options
     (Preset : Style_Preset)
      return Humanize.Numbers.Number_Options
   is
   begin
      case Preset is
         when Compact_UI | Dashboard | Mobile_UI =>
            return (Maximum_Fraction_Digits => 1, Suppress_Trailing_Zero => True);
         when Verbose | Screen_Reader | Accessibility | CLI =>
            return (Maximum_Fraction_Digits => 2, Suppress_Trailing_Zero => True);
         when Technical | Logs | Telemetry =>
            return (Maximum_Fraction_Digits => 3, Suppress_Trailing_Zero => False);
         when Casual =>
            return (Maximum_Fraction_Digits => 0, Suppress_Trailing_Zero => True);
      end case;
   end Number_Options;

   function Byte_Options
     (Preset : Style_Preset)
      return Humanize.Bytes.Byte_Options
   is
   begin
      case Preset is
         when Technical | Logs | Telemetry =>
            return
              (Unit_System => Humanize.Bytes.Binary,
               Maximum_Fraction_Digits => 3,
               Suppress_Trailing_Zero => False);
         when Verbose | Screen_Reader | Accessibility | CLI =>
            return
              (Unit_System => Humanize.Bytes.Decimal,
               Maximum_Fraction_Digits => 2,
               Suppress_Trailing_Zero => True);
         when others =>
            return Humanize.Bytes.Default_Byte_Options;
      end case;
   end Byte_Options;

   function Datetime_Options
     (Preset : Style_Preset)
      return Humanize.Datetimes.Datetime_Options
   is
   begin
      case Preset is
         when Technical | Logs | Telemetry =>
            return
              (Style => Humanize.Datetimes.Elapsed,
               Now_Threshold_Seconds => 0,
               Use_Calendar_Words => False,
               Prefer_Weeks => True,
               Prefer_Months => False,
               Rounding => Humanize.Datetimes.Round_Down,
               Max_Units => 1,
               Calendar_Words_Only => False);
         when Screen_Reader | Accessibility | Verbose =>
            return
              (Style => Humanize.Datetimes.Auto,
               Now_Threshold_Seconds => 30,
               Use_Calendar_Words => True,
               Prefer_Weeks => False,
               Prefer_Months => False,
               Rounding => Humanize.Datetimes.Round_Down,
               Max_Units => 1,
               Calendar_Words_Only => False);
         when others =>
            return Humanize.Datetimes.Default_Datetime_Options;
      end case;
   end Datetime_Options;

   function Range_Options
     (Preset : Style_Preset)
      return Humanize.Datetimes.Range_Options
   is
   begin
      case Preset is
         when Compact_UI | Dashboard | Mobile_UI =>
            return
              (Elide_Same_Month => True,
               Separator => '-',
               Use_Month_Names => True,
               Use_12_Hour_Time => True,
               others => False);
         when Technical | Logs | Telemetry | CLI =>
            return
              (Elide_Same_Month => False,
               Separator => '/',
               Use_Month_Names => False,
               Use_12_Hour_Time => False,
               others => False);
         when others =>
            return Humanize.Datetimes.Default_Range_Options;
      end case;
   end Range_Options;

   function Calendar_Date_Options
     (Preset : Style_Preset)
      return Humanize.Datetimes.Calendar_Date_Options
   is
   begin
      case Preset is
         when Compact_UI | Dashboard | Mobile_UI =>
            return
              (Style => Humanize.Datetimes.Calendar_Date_Medium,
               Fiscal_Year_Start_Month => 1);
         when Screen_Reader | Accessibility | Verbose =>
            return
              (Style => Humanize.Datetimes.Calendar_Date_Long,
               Fiscal_Year_Start_Month => 1);
         when Technical | Logs | Telemetry | CLI =>
            return Humanize.Datetimes.Default_Calendar_Date_Options;
         when Casual =>
            return
              (Style => Humanize.Datetimes.Calendar_Date_Weekday,
               Fiscal_Year_Start_Month => 1);
      end case;
   end Calendar_Date_Options;

   function Calendar_Date_Options
     (Preset                  : Calendar_Date_Preset;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
      return Humanize.Datetimes.Calendar_Date_Options
   is
   begin
      case Preset is
         when Calendar_Date_Default_Preset =>
            return
              (Style => Humanize.Datetimes.Calendar_Date_ISO,
               Fiscal_Year_Start_Month => Fiscal_Year_Start_Month);
         when Calendar_Date_Compact_Badge_Preset =>
            return
              (Style => Humanize.Datetimes.Calendar_Date_Compact_Badge,
               Fiscal_Year_Start_Month => Fiscal_Year_Start_Month);
         when Calendar_Date_Fiscal_Half_Preset =>
            return
              (Style => Humanize.Datetimes.Calendar_Date_Fiscal_Half,
               Fiscal_Year_Start_Month => Fiscal_Year_Start_Month);
         when Calendar_Date_Fiscal_Year_End_Preset =>
            return
              (Style => Humanize.Datetimes.Calendar_Date_Fiscal_Year_End,
               Fiscal_Year_Start_Month => Fiscal_Year_Start_Month);
         when Calendar_Date_Semester_Preset =>
            return
              (Style => Humanize.Datetimes.Calendar_Date_Semester,
               Fiscal_Year_Start_Month => Fiscal_Year_Start_Month);
         when Calendar_Date_Month_Phase_Preset =>
            return
              (Style => Humanize.Datetimes.Calendar_Date_Month_Phase,
               Fiscal_Year_Start_Month => Fiscal_Year_Start_Month);
         when Calendar_Date_Quarter_Phase_Preset =>
            return
              (Style => Humanize.Datetimes.Calendar_Date_Quarter_Phase,
               Fiscal_Year_Start_Month => Fiscal_Year_Start_Month);
      end case;
   end Calendar_Date_Options;

   function List_Options
     (Preset : Style_Preset)
      return Humanize.Lists.List_Options
   is
   begin
      case Preset is
         when Verbose | Screen_Reader | Accessibility =>
            return
              (Style => Humanize.Lists.Conjunction,
               Oxford_Comma => True);
         when others =>
            return Humanize.Lists.Default_List_Options;
      end case;
   end List_Options;

   function Unit_Style
     (Preset : Style_Preset)
      return Humanize.Units.Unit_Style
   is
   begin
      case Preset is
         when Compact_UI | Technical | Logs | Telemetry | Dashboard | Mobile_UI =>
            return Humanize.Units.Abbreviated;
         when others =>
            return Humanize.Units.Long;
      end case;
   end Unit_Style;

   function Clamp_Fraction_Digits (Value : Natural) return Natural is
   begin
      if Value > 3 then
         return 3;
      else
         return Value;
      end if;
   end Clamp_Fraction_Digits;

   function With_Number_Fraction_Digits
     (Preset                  : Style_Preset;
      Maximum_Fraction_Digits : Natural;
      Suppress_Trailing_Zero  : Boolean)
      return Humanize.Numbers.Number_Options
   is
      Base : Humanize.Numbers.Number_Options := Number_Options (Preset);
   begin
      Base.Maximum_Fraction_Digits := Clamp_Fraction_Digits (Maximum_Fraction_Digits);
      Base.Suppress_Trailing_Zero := Suppress_Trailing_Zero;
      return Base;
   end With_Number_Fraction_Digits;

   function With_Byte_Fraction_Digits
     (Preset                  : Style_Preset;
      Maximum_Fraction_Digits : Natural;
      Suppress_Trailing_Zero  : Boolean)
      return Humanize.Bytes.Byte_Options
   is
      Base : Humanize.Bytes.Byte_Options := Byte_Options (Preset);
   begin
      Base.Maximum_Fraction_Digits := Clamp_Fraction_Digits (Maximum_Fraction_Digits);
      Base.Suppress_Trailing_Zero := Suppress_Trailing_Zero;
      return Base;
   end With_Byte_Fraction_Digits;

   function With_Range_Separator
     (Preset    : Style_Preset;
      Separator : Character)
      return Humanize.Datetimes.Range_Options
   is
      Base : Humanize.Datetimes.Range_Options := Range_Options (Preset);
   begin
      Base.Separator := Separator;
      return Base;
   end With_Range_Separator;

   function With_Datetime_Threshold
     (Preset                : Style_Preset;
      Now_Threshold_Seconds : Natural)
      return Humanize.Datetimes.Datetime_Options
   is
      Base : Humanize.Datetimes.Datetime_Options := Datetime_Options (Preset);
   begin
      Base.Now_Threshold_Seconds := Now_Threshold_Seconds;
      return Base;
   end With_Datetime_Threshold;

   function With_Calendar_Date_Style
     (Preset                  : Style_Preset;
      Style                   : Humanize.Datetimes.Calendar_Date_Style;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
      return Humanize.Datetimes.Calendar_Date_Options
   is
      pragma Unreferenced (Preset);
   begin
      return
        (Style                   => Style,
         Fiscal_Year_Start_Month => Fiscal_Year_Start_Month);
   end With_Calendar_Date_Style;

   function With_Fiscal_Year_Start
     (Preset                  : Calendar_Date_Preset;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number)
      return Humanize.Datetimes.Calendar_Date_Options
   is
   begin
      return Calendar_Date_Options (Preset, Fiscal_Year_Start_Month);
   end With_Fiscal_Year_Start;

   function With_List_Oxford_Comma
     (Preset       : Style_Preset;
      Oxford_Comma : Boolean)
      return Humanize.Lists.List_Options
   is
      Base : Humanize.Lists.List_Options := List_Options (Preset);
   begin
      Base.Oxford_Comma := Oxford_Comma;
      return Base;
   end With_List_Oxford_Comma;

   function With_Byte_Unit_System
     (Preset      : Style_Preset;
      Unit_System : Humanize.Bytes.Byte_Unit_System)
      return Humanize.Bytes.Byte_Options
   is
      Base : Humanize.Bytes.Byte_Options := Byte_Options (Preset);
   begin
      Base.Unit_System := Unit_System;
      return Base;
   end With_Byte_Unit_System;

   function Select_Unit_Style
     (Preset : Style_Preset;
      Style  : Humanize.Units.Unit_Style)
      return Humanize.Units.Unit_Style
   is
      pragma Unreferenced (Preset);
   begin
      return Style;
   end Select_Unit_Style;

end Humanize.Styles;
