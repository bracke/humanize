private package Humanize.Durations.Business_Calendars is
   procedure Clear_Business_Calendar_Rules
     (Rules : in out Business_Calendar_Rules);
   --  @param Rules Business calendar rule set to reset in place.

   function Add_One_Off_Holiday
     (Rules : in out Business_Calendar_Rules;
      Date  : Ada.Calendar.Time)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Date Date-only holiday exclusion.
   --  @return Ok, or Buffer_Overflow if the rule set capacity is exhausted.

   function Add_Recurring_Holiday
     (Rules : in out Business_Calendar_Rules;
      Month : Ada.Calendar.Month_Number;
      Day   : Ada.Calendar.Day_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Month Month of the yearly recurring holiday.
   --  @param Day Day of the yearly recurring holiday.
   --  @return Ok, Invalid_Value, or Buffer_Overflow.

   function Add_Observed_Holiday
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number;
      Month : Ada.Calendar.Month_Number;
      Day   : Ada.Calendar.Day_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @param Month Fixed holiday month.
   --  @param Day Fixed holiday day.
   --  @return Adds Friday for Saturday holidays and Monday for Sunday holidays.

   function Add_Nth_Weekday_Holiday
     (Rules   : in out Business_Calendar_Rules;
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Weekday : Natural;
      Ordinal : Integer)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @param Month Holiday month.
   --  @param Weekday ISO weekday, Monday = 1.
   --  @param Ordinal 1 through 5, or -1 for the last weekday in the month.
   --  @return Adds the computed holiday date as a one-off holiday.

   function Add_US_Federal_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @return Adds observed US federal holidays for the given year.

   function Add_TARGET2_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @return Adds TARGET2 closing days for the given year.

   function Add_UK_Bank_Holidays_England_Wales
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @return Adds UK England/Wales bank holidays for the given year.

   function Add_Canada_Federal_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @return Adds common observed Canadian federal holidays.

   function Add_Germany_Public_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @return Adds common nationwide German public holidays.

   function Add_France_Public_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @return Adds common French public holidays.

   function Add_NYSE_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @return Adds common NYSE market holidays.

   function Add_ASX_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @return Adds common ASX market holidays.

   function Add_JPX_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @return Adds common JPX/TSE market holidays.

   function Add_SIX_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @return Adds common SIX Swiss Exchange market holidays.

   function Add_SGX_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @return Adds common SGX market holidays.

   function Add_HKEX_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @return Adds common HKEX market holidays.

   function Add_NSE_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @return Adds common NSE India market holidays.

   function Add_B3_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @return Adds common B3 Brazil market holidays.

   function Add_BMV_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @return Adds common BMV Mexico market holidays.

   function Add_Australia_National_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @return Adds common Australian national public holidays.

   function Add_Japan_Public_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @return Adds common Japanese public holidays.

   function Add_Switzerland_Common_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @return Adds common Swiss public holidays.

   function Add_Singapore_Public_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Year Holiday year.
   --  @return Adds common Singapore public holidays.

   function Add_Half_Day
     (Rules    : in out Business_Calendar_Rules;
      Date     : Ada.Calendar.Time;
      End_Hour : Natural)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Date Date with an earlier closing hour.
   --  @param End_Hour Closing hour for the half-day.
   --  @return Ok, Invalid_Value, or Buffer_Overflow.

   function Add_Shutdown
     (Rules      : in out Business_Calendar_Rules;
      First_Date : Ada.Calendar.Time;
      Last_Date  : Ada.Calendar.Time)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param First_Date First date in the inclusive shutdown period.
   --  @param Last_Date Last date in the inclusive shutdown period.
   --  @return Ok, Invalid_Value, or Buffer_Overflow.

   function Set_Business_Hours
     (Rules      : in out Business_Calendar_Rules;
      Weekday    : Natural;
      Start_Hour : Natural;
      End_Hour   : Natural)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Weekday 0 for every day, 1 Monday through 7 Sunday.
   --  @param Start_Hour Opening hour.
   --  @param End_Hour Closing hour.
   --  @return Ok or Invalid_Value.

   function Rule_Holidays
     (Rules : Business_Calendar_Rules)
      return Holiday_List;
   --  @param Rules Business calendar rules.
   --  @return Active one-off holiday slice.

   function Rule_Recurring_Holidays
     (Rules : Business_Calendar_Rules)
      return Recurring_Holiday_List;
   --  @param Rules Business calendar rules.
   --  @return Active recurring holiday slice.

   function Rule_Half_Days
     (Rules : Business_Calendar_Rules)
      return Half_Day_List;
   --  @param Rules Business calendar rules.
   --  @return Active half-day slice.

   function Rule_Shutdowns
     (Rules : Business_Calendar_Rules)
      return Shutdown_Period_List;
   --  @param Rules Business calendar rules.
   --  @return Active shutdown-period slice.

   function Business_Calendar_Options_For
     (Preset : Business_Calendar_Preset)
      return Advanced_Business_Calendar_Options;
   --  @param Preset Named business-hours preset.
   --  @return Advanced calendar options for the preset.

   function Business_Calendar_Rules_For
     (Preset : Business_Calendar_Preset)
      return Business_Calendar_Rules;
   --  @param Preset Named business-hours preset.
   --  @return Empty rule set using the preset's business-hours options.

   function US_Federal_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules;
   --  @param Year Holiday year.
   --  @return Weekday 9-to-5 rules with observed US federal holidays.

   function TARGET2_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules;
   --  @param Year Holiday year.
   --  @return Weekday 9-to-5 rules with TARGET2 closing days.

   function UK_England_Wales_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules;
   --  @param Year Holiday year.
   --  @return Weekday 9-to-5 rules with UK England/Wales bank holidays.

   function Canada_Federal_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules;
   --  @param Year Holiday year.
   --  @return Weekday 9-to-5 rules with Canadian federal holidays.

   function Germany_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules;
   --  @param Year Holiday year.
   --  @return Weekday 9-to-5 rules with common German public holidays.

   function France_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules;
   --  @param Year Holiday year.
   --  @return Weekday 9-to-5 rules with common French public holidays.

   function NYSE_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules;
   --  @param Year Holiday year.
   --  @return Weekday 9-to-5 rules with common NYSE market holidays.

   function ASX_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules;
   --  @param Year Holiday year.
   --  @return Weekday 9-to-5 rules with common ASX market holidays.

   function JPX_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules;
   --  @param Year Holiday year.
   --  @return Weekday 9-to-5 rules with common JPX/TSE market holidays.

   function SIX_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules;
   --  @param Year Holiday year.
   --  @return Weekday 9-to-5 rules with common SIX market holidays.

   function SGX_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules;
   --  @param Year Holiday year.
   --  @return Weekday 9-to-5 rules with common SGX market holidays.

   function HKEX_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules;
   --  @param Year Holiday year.
   --  @return Weekday 9-to-5 rules with common HKEX market holidays.

   function NSE_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules;
   --  @param Year Holiday year.
   --  @return Weekday 9-to-5 rules with common NSE India market holidays.

   function B3_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules;
   --  @param Year Holiday year.
   --  @return Weekday 9-to-5 rules with common B3 Brazil market holidays.

   function BMV_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules;
   --  @param Year Holiday year.
   --  @return Weekday 9-to-5 rules with common BMV Mexico market holidays.

   function Australia_National_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules;
   --  @param Year Holiday year.
   --  @return Weekday 9-to-5 rules with common Australian national holidays.

   function Japan_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules;
   --  @param Year Holiday year.
   --  @return Weekday 9-to-5 rules with common Japanese public holidays.

   function Switzerland_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules;
   --  @param Year Holiday year.
   --  @return Weekday 9-to-5 rules with common Swiss holidays.

   function Singapore_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules;
   --  @param Year Holiday year.
   --  @return Weekday 9-to-5 rules with common Singapore public holidays.
   function Add_Business_Days
     (Start   : Ada.Calendar.Time;
      Days    : Natural;
      Options : Business_Day_Options := Default_Business_Day_Options)
      return Ada.Calendar.Time;
   --  @param Start Starting calendar instant.
   --  @param Days Weekday count to add.
   --  @param Options Business-day counting policy.
   --  @return Calendar time advanced by weekdays, preserving time of day.

   function Add_Business_Days
     (Start    : Ada.Calendar.Time;
      Days     : Natural;
      Holidays : Holiday_List;
      Options  : Business_Day_Options := Default_Business_Day_Options)
      return Ada.Calendar.Time;
   --  @param Start Starting calendar instant.
   --  @param Days Business-day count to add.
   --  @param Holidays Date-only holiday exclusions.
   --  @param Options Business-day counting policy.
   --  @return Calendar time advanced by configured working days.

   function Is_Business_Day
     (Value : Ada.Calendar.Time;
      Rules : Business_Calendar_Rules)
      return Boolean;
   --  @param Value Calendar instant to classify by date.
   --  @param Rules Executable business calendar rules.
   --  @return True when the date is open under the rule set.

   function Add_Business_Days
     (Start : Ada.Calendar.Time;
      Days  : Integer;
      Rules : Business_Calendar_Rules)
      return Ada.Calendar.Time;
   --  @param Start Starting calendar instant.
   --  @param Days Signed business-day count to add.
   --  @param Rules Executable business calendar rules.
   --  @return Calendar time shifted by rule-aware business days.

   function Business_Date_Label
     (Context : Humanize.Contexts.Context;
      Start   : Ada.Calendar.Time;
      Days    : Natural;
      Options : Business_Day_Options := Default_Business_Day_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Start Starting calendar instant.
   --  @param Days Weekday count to add.
   --  @param Options Business-day counting policy.
   --  @return ISO date label for the resulting business date.

   function Add_Business_Hours
     (Start   : Ada.Calendar.Time;
      Hours   : Natural;
      Options : Business_Hour_Options := Default_Business_Hour_Options)
      return Ada.Calendar.Time;
   --  @param Start Starting calendar instant.
   --  @param Hours Working hours to add.
   --  @param Options Workday and work-hour policy.
   --  @return Calendar time advanced by configured business hours.

   function Add_Business_Hours
     (Start    : Ada.Calendar.Time;
      Hours    : Natural;
      Holidays : Holiday_List;
      Options  : Business_Calendar_Options :=
        Default_Business_Calendar_Options)
      return Ada.Calendar.Time;
   --  @param Start Starting calendar instant.
   --  @param Hours Working hours to add.
   --  @param Holidays Date-only holiday exclusions.
   --  @param Options Workday, work-hour, and break policy.
   --  @return Calendar time advanced by configured business hours.

   function Business_Hour_Label
     (Context : Humanize.Contexts.Context;
      Start   : Ada.Calendar.Time;
      Hours   : Natural;
      Options : Business_Hour_Options := Default_Business_Hour_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Start Starting calendar instant.
   --  @param Hours Working hours to add.
   --  @param Options Workday and work-hour policy.
   --  @return ISO date label for the computed business-hour date.

   function Business_Calendar_Label
     (Context  : Humanize.Contexts.Context;
      Start    : Ada.Calendar.Time;
      Hours    : Natural;
      Holidays : Holiday_List;
      Options  : Business_Calendar_Options :=
        Default_Business_Calendar_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Start Starting calendar instant.
   --  @param Hours Working hours to add.
   --  @param Holidays Date-only holiday exclusions.
   --  @param Options Workday, work-hour, and break policy.
   --  @return ISO date label for the computed business-hour date.

   function Add_Business_Hours
     (Start               : Ada.Calendar.Time;
      Hours               : Natural;
      Holidays            : Holiday_List;
      Recurring_Holidays  : Recurring_Holiday_List;
      Half_Days           : Half_Day_List;
      Shutdowns           : Shutdown_Period_List;
      Options             : Advanced_Business_Calendar_Options :=
        Default_Advanced_Business_Calendar_Options)
      return Ada.Calendar.Time;
   --  @param Start Starting calendar instant.
   --  @param Hours Working hours to add.
   --  @param Holidays Date-only one-off holiday exclusions.
   --  @param Recurring_Holidays Month/day holiday exclusions for every year.
   --  @param Half_Days Dates with an earlier closing hour.
   --  @param Shutdowns Inclusive date-only shutdown periods.
   --  @param Options Per-weekday work-hour and break policy.
   --  @return Calendar time advanced by configured business hours.

   function Add_Business_Hours
     (Start : Ada.Calendar.Time;
      Hours : Natural;
      Rules : Business_Calendar_Rules)
      return Ada.Calendar.Time;
   --  @param Start Starting calendar instant.
   --  @param Hours Working hours to add.
   --  @param Rules Executable business calendar rules.
   --  @return Calendar time advanced by the parsed/configured rule set.

   function Business_Calendar_Label
     (Context             : Humanize.Contexts.Context;
      Start               : Ada.Calendar.Time;
      Hours               : Natural;
      Holidays            : Holiday_List;
      Recurring_Holidays  : Recurring_Holiday_List;
      Half_Days           : Half_Day_List;
      Shutdowns           : Shutdown_Period_List;
      Options             : Advanced_Business_Calendar_Options :=
        Default_Advanced_Business_Calendar_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Start Starting calendar instant.
   --  @param Hours Working hours to add.
   --  @param Holidays Date-only one-off holiday exclusions.
   --  @param Recurring_Holidays Month/day holiday exclusions for every year.
   --  @param Half_Days Dates with an earlier closing hour.
   --  @param Shutdowns Inclusive date-only shutdown periods.
   --  @param Options Per-weekday work-hour and break policy.
   --  @return ISO date label for the computed business-hour date.

   function Business_Calendar_Label
     (Context : Humanize.Contexts.Context;
      Start   : Ada.Calendar.Time;
      Hours   : Natural;
      Rules   : Business_Calendar_Rules)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Start Starting calendar instant.
   --  @param Hours Working hours to add.
   --  @param Rules Executable business calendar rules.
   --  @return ISO date label for the computed business-hour date.

   function Business_Date_Label
     (Context  : Humanize.Contexts.Context;
      Start    : Ada.Calendar.Time;
      Days     : Natural;
      Holidays : Holiday_List;
      Options  : Business_Day_Options := Default_Business_Day_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Start Starting calendar instant.
   --  @param Days Weekday count to add.
   --  @param Holidays Date-only holiday exclusions.
   --  @param Options Business-day counting policy.
   --  @return ISO date label for the resulting business date.
   procedure Business_Date_Label_Into
     (Context : Humanize.Contexts.Context;
      Start   : Ada.Calendar.Time;
      Days    : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Business_Day_Options := Default_Business_Day_Options);
   --  @param Context Formatting context.
   --  @param Start Starting calendar instant.
   --  @param Days Weekday count to add.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Business-day counting policy.

   procedure Business_Date_Label_Into
     (Context  : Humanize.Contexts.Context;
      Start    : Ada.Calendar.Time;
      Days     : Natural;
      Holidays : Holiday_List;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Business_Day_Options := Default_Business_Day_Options);
   --  @param Context Formatting context.
   --  @param Start Starting calendar instant.
   --  @param Days Weekday count to add.
   --  @param Holidays Date-only holiday exclusions.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Business-day counting policy.

   procedure Business_Hour_Label_Into
     (Context : Humanize.Contexts.Context;
      Start   : Ada.Calendar.Time;
      Hours   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Business_Hour_Options := Default_Business_Hour_Options);
   --  @param Context Formatting context.
   --  @param Start Starting calendar instant.
   --  @param Hours Working hours to add.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Workday and work-hour policy.

   procedure Business_Calendar_Label_Into
     (Context  : Humanize.Contexts.Context;
      Start    : Ada.Calendar.Time;
      Hours    : Natural;
      Holidays : Holiday_List;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Business_Calendar_Options :=
        Default_Business_Calendar_Options);
   --  @param Context Formatting context.
   --  @param Start Starting calendar instant.
   --  @param Hours Working hours to add.
   --  @param Holidays Date-only holiday exclusions.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Workday, work-hour, and break policy.

   procedure Business_Calendar_Label_Into
     (Context             : Humanize.Contexts.Context;
      Start               : Ada.Calendar.Time;
      Hours               : Natural;
      Holidays            : Holiday_List;
      Recurring_Holidays  : Recurring_Holiday_List;
      Half_Days           : Half_Day_List;
      Shutdowns           : Shutdown_Period_List;
      Target              : in out String;
      Written             : out Natural;
      Status              : out Humanize.Status.Status_Code;
      Options             : Advanced_Business_Calendar_Options :=
        Default_Advanced_Business_Calendar_Options);
   --  @param Context Formatting context.
   --  @param Start Starting calendar instant.
   --  @param Hours Working hours to add.
   --  @param Holidays Date-only one-off holiday exclusions.
   --  @param Recurring_Holidays Month/day holiday exclusions for every year.
   --  @param Half_Days Dates with an earlier closing hour.
   --  @param Shutdowns Inclusive date-only shutdown periods.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Per-weekday work-hour and break policy.

   procedure Business_Calendar_Label_Into
     (Context : Humanize.Contexts.Context;
      Start   : Ada.Calendar.Time;
      Hours   : Natural;
      Rules   : Business_Calendar_Rules;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Start Starting calendar instant.
   --  @param Hours Working hours to add.
   --  @param Rules Executable business calendar rules.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
end Humanize.Durations.Business_Calendars;
