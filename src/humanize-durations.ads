with Ada.Calendar;

with Humanize.Contexts;
with Humanize.Status;

--  Simple single-unit duration humanization.
--
--  Renders the largest useful whole unit (e.g. "1 hour", "90 seconds" ->
--  "1 minute"). Multi-unit lists are deferred. This package selects keys only;
--  it must not call I18N.Runtime directly (HUM-INV-002).
package Humanize.Durations is

   type Duration_Seconds is new Long_Long_Integer;
   type Duration_Microseconds is new Long_Long_Integer;

   type Duration_Unit is
     (Second,
      Minute,
      Hour,
      Day,
      Week,
      Month,
      Year);

   type Precise_Duration_Unit is
     (Microsecond,
      Millisecond,
      Precise_Second,
      Precise_Minute,
      Precise_Hour,
      Precise_Day);

   type Precise_Unit_Set is array (Precise_Duration_Unit) of Boolean;

   type Precise_Duration_Options is record
      Minimum_Unit     : Precise_Duration_Unit := Millisecond;
      Suppressed_Units : Precise_Unit_Set := [others => False];
   end record;

   Default_Precise_Duration_Options : constant Precise_Duration_Options :=
     (Minimum_Unit     => Millisecond,
      Suppressed_Units => [others => False]);

   type Duration_Options is record
      Largest_Unit  : Duration_Unit := Year;
      Smallest_Unit : Duration_Unit := Second;
   end record;

   Default_Duration_Options : constant Duration_Options :=
     (Largest_Unit  => Year,
      Smallest_Unit => Second);

   type Duration_Render_Metadata is record
      Status          : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Negative        : Boolean := False;
      Years           : Natural := 0;
      Months          : Natural := 0;
      Weeks           : Natural := 0;
      Days            : Natural := 0;
      Hours           : Natural := 0;
      Minutes         : Natural := 0;
      Seconds         : Natural := 0;
      Component_Count : Natural := 0;
   end record;

   function Format_Metadata
     (Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Duration_Render_Metadata;
   --  @param Seconds Duration in seconds.
   --  @param Options Largest/smallest unit policy used for decomposition.
   --  @return Machine-readable duration decomposition metadata.

   type Duration_Phrase_Style is (Natural_Wording, Compact_Label);

   type Duration_Phrase_Options is record
      Style : Duration_Phrase_Style := Natural_Wording;
   end record;

   Default_Duration_Phrase_Options : constant Duration_Phrase_Options :=
     (Style => Natural_Wording);

   type Recurrence_Unit is (Every_Second, Every_Minute, Every_Hour, Every_Day,
                            Every_Week, Every_Month, Every_Quarter,
                            Every_Year);

   type Schedule_Kind is
     (Schedule_Interval,
      Schedule_Weekday,
      Schedule_Weekday_Set,
      Schedule_Ordinal_Weekday,
      Schedule_Business_Day);

   type Weekday_Set is array (Positive range 1 .. 7) of Boolean;

   Weekdays : constant Weekday_Set :=
     [1 .. 5 => True, 6 .. 7 => False];
   Weekends : constant Weekday_Set :=
     [1 .. 5 => False, 6 .. 7 => True];
   Every_Day_Set : constant Weekday_Set := [others => True];

   type Schedule_Options is record
      Kind        : Schedule_Kind := Schedule_Interval;
      Every       : Positive := 1;
      Unit        : Recurrence_Unit := Every_Day;
      Weekday     : Natural range 0 .. 7 := 0;
      Weekdays    : Weekday_Set := Every_Day_Set;
      Ordinal     : Integer range -1 .. 5 := 0;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False;
   end record;

   Default_Schedule_Options : constant Schedule_Options :=
     (Kind        => Schedule_Interval,
      Every       => 1,
      Unit        => Every_Day,
      Weekday     => 0,
      Weekdays    => Every_Day_Set,
      Ordinal     => 0,
      Has_Time    => False,
      Hour        => 0,
      Minute      => 0,
      Use_12_Hour => False);

   type Natural_Duration_Style is
     (Plain_Duration,
      Approximate_Duration,
      Brief_Duration,
      Almost_Duration,
      Over_Duration,
      Just_Over_Duration,
      Little_Under_Duration,
      Few_Duration,
      Brief_Precise_Duration);

   type Natural_Duration_Approximation_Options is record
      Round_Up_Threshold_Percent : Natural range 1 .. 100 := 1;
      Larger_Unit_Threshold_Percent : Natural range 1 .. 100 := 70;
   end record;
   --  Round_Up_Threshold_Percent controls when almost-style wording advances
   --  to the next count within the selected unit. The default preserves the
   --  historical behavior where any remainder rounds up.
   --  Larger_Unit_Threshold_Percent controls when under-style wording may
   --  describe a value against the next larger unit, e.g. days as a month.

   Default_Natural_Duration_Approximation_Options :
     constant Natural_Duration_Approximation_Options :=
       (Round_Up_Threshold_Percent => 1,
        Larger_Unit_Threshold_Percent => 70);

   type Natural_Duration_Options is record
      Style : Natural_Duration_Style := Plain_Duration;
   end record;

   Default_Natural_Duration_Options : constant Natural_Duration_Options :=
     (Style => Plain_Duration);

   type Natural_Duration_Threshold_Preset is
     (Threshold_Default,
      Threshold_Rails,
      Threshold_Django,
      Threshold_Conversational);

   type Duration_Distance_Direction is
     (Duration_Distance_Plain,
      Duration_Distance_Past,
      Duration_Distance_Future);

   type Detailed_Duration_Options is record
      Max_Components   : Positive := 2;
      Round_To_Minutes : Boolean := False;
      Prefix           : Natural_Duration_Style := Plain_Duration;
   end record;

   Default_Detailed_Duration_Options : constant Detailed_Duration_Options :=
     (Max_Components   => 2,
      Round_To_Minutes => False,
      Prefix           => Plain_Duration);

   type Business_Day_Options is record
      Include_Start : Boolean := False;
      Work_Monday    : Boolean := True;
      Work_Tuesday   : Boolean := True;
      Work_Wednesday : Boolean := True;
      Work_Thursday  : Boolean := True;
      Work_Friday    : Boolean := True;
      Work_Saturday  : Boolean := False;
      Work_Sunday    : Boolean := False;
   end record;

   Default_Business_Day_Options : constant Business_Day_Options :=
     (Include_Start  => False,
      Work_Monday    => True,
      Work_Tuesday   => True,
      Work_Wednesday => True,
      Work_Thursday  => True,
      Work_Friday    => True,
      Work_Saturday  => False,
      Work_Sunday    => False);

   type Holiday_List is array (Positive range <>) of Ada.Calendar.Time;

   type Recurring_Holiday is record
      Month : Ada.Calendar.Month_Number := 1;
      Day   : Ada.Calendar.Day_Number := 1;
   end record;

   type Recurring_Holiday_List is array (Positive range <>) of Recurring_Holiday;

   type Half_Day is record
      Date     : Ada.Calendar.Time;
      End_Hour : Natural range 0 .. 24 := 12;
   end record;

   type Half_Day_List is array (Positive range <>) of Half_Day;

   type Shutdown_Period is record
      First_Date : Ada.Calendar.Time;
      Last_Date  : Ada.Calendar.Time;
   end record;

   type Shutdown_Period_List is array (Positive range <>) of Shutdown_Period;

   type Business_Hour_Options is record
      Start_Hour : Natural range 0 .. 23 := 9;
      End_Hour   : Natural range 1 .. 24 := 17;
      Days       : Business_Day_Options := Default_Business_Day_Options;
   end record;

   Default_Business_Hour_Options : constant Business_Hour_Options :=
     (Start_Hour => 9,
      End_Hour   => 17,
      Days       => Default_Business_Day_Options);

   type Business_Calendar_Options is record
      Hours            : Business_Hour_Options := Default_Business_Hour_Options;
      Break_Start_Hour : Natural range 0 .. 24 := 0;
      Break_End_Hour   : Natural range 0 .. 24 := 0;
   end record;

   Default_Business_Calendar_Options : constant Business_Calendar_Options :=
     (Hours            => Default_Business_Hour_Options,
      Break_Start_Hour => 0,
      Break_End_Hour   => 0);

   type Weekday_Business_Hours is record
      Monday_Start    : Natural range 0 .. 24 := 9;
      Monday_End      : Natural range 0 .. 24 := 17;
      Tuesday_Start   : Natural range 0 .. 24 := 9;
      Tuesday_End     : Natural range 0 .. 24 := 17;
      Wednesday_Start : Natural range 0 .. 24 := 9;
      Wednesday_End   : Natural range 0 .. 24 := 17;
      Thursday_Start  : Natural range 0 .. 24 := 9;
      Thursday_End    : Natural range 0 .. 24 := 17;
      Friday_Start    : Natural range 0 .. 24 := 9;
      Friday_End      : Natural range 0 .. 24 := 17;
      Saturday_Start  : Natural range 0 .. 24 := 0;
      Saturday_End    : Natural range 0 .. 24 := 0;
      Sunday_Start    : Natural range 0 .. 24 := 0;
      Sunday_End      : Natural range 0 .. 24 := 0;
   end record;

   Default_Weekday_Business_Hours : constant Weekday_Business_Hours :=
     (Monday_Start    => 9,
      Monday_End      => 17,
      Tuesday_Start   => 9,
      Tuesday_End     => 17,
      Wednesday_Start => 9,
      Wednesday_End   => 17,
      Thursday_Start  => 9,
      Thursday_End    => 17,
      Friday_Start    => 9,
      Friday_End      => 17,
      Saturday_Start  => 0,
      Saturday_End    => 0,
      Sunday_Start    => 0,
      Sunday_End      => 0);

   type Advanced_Business_Calendar_Options is record
      Weekday_Hours   : Weekday_Business_Hours :=
        Default_Weekday_Business_Hours;
      Break_Start_Hour : Natural range 0 .. 24 := 0;
      Break_End_Hour   : Natural range 0 .. 24 := 0;
   end record;

   Default_Advanced_Business_Calendar_Options :
     constant Advanced_Business_Calendar_Options :=
       (Weekday_Hours    => Default_Weekday_Business_Hours,
        Break_Start_Hour => 0,
        Break_End_Hour   => 0);

   type Business_Calendar_Preset is
     (Business_Weekdays_9_To_5,
      Business_Weekdays_8_To_4,
      Business_Extended_Weekdays,
      Business_Seven_Days,
      Business_Closed);

   subtype Business_Calendar_Rule_Capacity is Natural range 0 .. 256;

   type Business_Calendar_Rules
     (Max_Holidays           : Business_Calendar_Rule_Capacity := 16;
      Max_Recurring_Holidays : Business_Calendar_Rule_Capacity := 16;
      Max_Half_Days          : Business_Calendar_Rule_Capacity := 16;
      Max_Shutdowns          : Business_Calendar_Rule_Capacity := 16)
   is record
      Options                 : Advanced_Business_Calendar_Options :=
        Default_Advanced_Business_Calendar_Options;
      Holiday_Count           : Natural := 0;
      Recurring_Holiday_Count : Natural := 0;
      Half_Day_Count          : Natural := 0;
      Shutdown_Count          : Natural := 0;
      Holidays                : Holiday_List (1 .. Max_Holidays) :=
        [others => Ada.Calendar.Clock];
      Recurring_Holidays      :
        Recurring_Holiday_List (1 .. Max_Recurring_Holidays) :=
          [others => (Month => 1, Day => 1)];
      Half_Days               : Half_Day_List (1 .. Max_Half_Days) :=
        [others => (Date => Ada.Calendar.Clock, End_Hour => 12)];
      Shutdowns               : Shutdown_Period_List (1 .. Max_Shutdowns) :=
        [others =>
           (First_Date => Ada.Calendar.Clock,
            Last_Date  => Ada.Calendar.Clock)];
   end record;

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

   --  Convenience API: humanize Seconds, owned result.
   function Format
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Seconds Duration in seconds.
   --  @param Options Unit bounds for selecting the rendered unit.
   --  @return Rendered single-unit duration result.

   --  Bounded API: render into caller-owned Target. Target must be 1-based.
   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options);
   --  @param Context Formatting context.
   --  @param Seconds Duration in seconds.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Unit bounds for selecting the rendered unit.

   --  Multi-unit API: render up to Max_Components largest whole units joined by
   --  the locale's list separator (e.g. "1 hour, 30 minutes").
   function Format_Components
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive;
      Options        : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Seconds Duration in seconds.
   --  @param Max_Components Maximum number of non-zero unit components.
   --  @param Options Unit bounds for decomposing the duration.
   --  @return Rendered multi-unit duration result.

   procedure Format_Components_Into
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Options        : Duration_Options := Default_Duration_Options);
   --  @param Context Formatting context.
   --  @param Seconds Duration in seconds.
   --  @param Max_Components Maximum number of non-zero unit components.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Unit bounds for decomposing the duration.

   function Format_Compact
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive := 2;
      Options        : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Seconds Duration in seconds.
   --  @param Max_Components Maximum number of non-zero unit components.
   --  @param Options Unit bounds for decomposing the duration.
   --  @return Compact deterministic duration such as "1h 30m".

   procedure Format_Compact_Into
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Options        : Duration_Options := Default_Duration_Options);
   --  @param Context Formatting context.
   --  @param Seconds Duration in seconds.
   --  @param Max_Components Maximum number of non-zero unit components.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Unit bounds for decomposing the duration.

   function Format_Clock
     (Context      : Humanize.Contexts.Context;
      Seconds      : Duration_Seconds;
      Always_Hours : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Seconds Duration in seconds.
   --  @param Always_Hours Include a two-digit hour field when True.
   --  @return Clock-style duration such as "01:30:05" or "30:05".

   procedure Format_Clock_Into
     (Context      : Humanize.Contexts.Context;
      Seconds      : Duration_Seconds;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Always_Hours : Boolean := True);
   --  @param Context Formatting context.
   --  @param Seconds Duration in seconds.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Always_Hours Include a two-digit hour field when True.

   function Format_Precise
     (Context           : Humanize.Contexts.Context;
      Microseconds      : Duration_Microseconds;
      Max_Components    : Positive;
      Minimum_Unit      : Precise_Duration_Unit)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Microseconds Duration in microseconds.
   --  @param Max_Components Maximum number of non-zero unit components.
   --  @param Minimum_Unit Smallest unit to include.
   --  @return Rendered precise multi-unit duration result.

   function Format_Precise
     (Context           : Humanize.Contexts.Context;
      Microseconds      : Duration_Microseconds;
      Max_Components    : Positive;
      Options           : Precise_Duration_Options :=
        Default_Precise_Duration_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Microseconds Duration in microseconds.
   --  @param Max_Components Maximum number of non-zero unit components.
   --  @param Options Precise duration decomposition policy.
   --  @return Rendered precise multi-unit duration result.

   procedure Format_Precise_Into
     (Context           : Humanize.Contexts.Context;
      Microseconds      : Duration_Microseconds;
      Max_Components    : Positive;
      Target            : in out String;
      Written           : out Natural;
      Status            : out Humanize.Status.Status_Code;
      Minimum_Unit      : Precise_Duration_Unit);
   --  @param Context Formatting context.
   --  @param Microseconds Duration in microseconds.
   --  @param Max_Components Maximum number of non-zero unit components.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Minimum_Unit Smallest unit to include.

   procedure Format_Precise_Into
     (Context           : Humanize.Contexts.Context;
      Microseconds      : Duration_Microseconds;
      Max_Components    : Positive;
      Target            : in out String;
      Written           : out Natural;
      Status            : out Humanize.Status.Status_Code;
      Options           : Precise_Duration_Options :=
        Default_Precise_Duration_Options);
   --  @param Context Formatting context.
   --  @param Microseconds Duration in microseconds.
   --  @param Max_Components Maximum number of non-zero unit components.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Precise duration decomposition policy.

   function Format_Range
     (Context : Humanize.Contexts.Context;
      Low     : Duration_Seconds;
      High    : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Low Lower duration bound in seconds.
   --  @param High Upper duration bound in seconds.
   --  @param Options Unit bounds for selecting displayed units.
   --  @return Deterministic range such as "1-2 hours".

   function Countdown
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Seconds Remaining seconds.
   --  @param Options Unit bounds for selecting displayed units.
   --  @return Deterministic countdown phrase.

   function SLA_Window
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Seconds Window duration in seconds.
   --  @param Options Unit bounds for selecting displayed units.
   --  @return Deterministic SLA window phrase.

   function Interval
     (Context : Humanize.Contexts.Context;
      Low     : Duration_Seconds;
      High    : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options;
      Phrase  : Duration_Phrase_Options := Default_Duration_Phrase_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Low Lower duration bound in seconds.
   --  @param High Upper duration bound in seconds.
   --  @param Options Unit bounds for selecting displayed units.
   --  @param Phrase Phrase wording policy.
   --  @return Natural interval phrase such as "between 1 hour and 2 hours".

   function Next_Window
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options;
      Phrase  : Duration_Phrase_Options := Default_Duration_Phrase_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Seconds Upcoming window duration in seconds.
   --  @param Options Unit bounds for selecting displayed units.
   --  @param Phrase Phrase wording policy.
   --  @return Natural upcoming window phrase such as "next 2 weeks".

   function Age
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Seconds Age in seconds.
   --  @param Options Unit bounds for selecting displayed units.
   --  @return Age phrase such as "3 days old".

   function Stale_For
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Seconds Stale duration in seconds.
   --  @param Options Unit bounds for selecting displayed units.
   --  @return Staleness phrase such as "stale for 3 days".

   function Expires_In
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Seconds Expiry duration in seconds.
   --  @param Options Unit bounds for selecting displayed units.
   --  @return Expiry phrase such as "expires in 3 days".

   function Modified_Ago
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Seconds Elapsed duration since modification.
   --  @param Options Unit bounds for selecting displayed units.
   --  @return Freshness phrase such as "modified 2 hours ago".

   function Synced_Ago
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Seconds Elapsed duration since sync.
   --  @param Options Unit bounds for selecting displayed units.
   --  @return Freshness phrase such as "synced just now".

   function Backup_Age
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Seconds Backup age in seconds.
   --  @param Options Unit bounds for selecting displayed units.
   --  @return Backup freshness phrase such as "backup is 3 days old".

   function Complete_Count
     (Context  : Humanize.Contexts.Context;
      Done     : Natural;
      Total    : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Done Completed count.
   --  @param Total Total count.
   --  @return Progress phrase such as "3 of 10 complete".

   function Percent_Complete
     (Context : Humanize.Contexts.Context;
      Percent : Long_Float)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Percent Completion percentage.
   --  @return Progress phrase such as "75% complete".

   function Retry_In
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Seconds Delay before retry in seconds.
   --  @param Options Unit bounds for selecting displayed units.
   --  @return Retry phrase such as "retrying in 10 seconds".

   function Step_Count
     (Context : Humanize.Contexts.Context;
      Step    : Natural;
      Total   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Step Current step.
   --  @param Total Total step count.
   --  @return Progress phrase such as "step 2 of 5".

   function Attempt_Count
     (Context : Humanize.Contexts.Context;
      Attempt : Natural;
      Total   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Attempt Current attempt.
   --  @param Total Total attempt count.
   --  @return Retry phrase such as "attempt 2 of 3".

   function ETA
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Seconds Estimated remaining seconds.
   --  @param Options Unit bounds for selecting displayed units.
   --  @return ETA phrase such as "ETA 5 minutes".

   function Throughput_Remaining
     (Context   : Humanize.Contexts.Context;
      Remaining : Natural;
      Rate      : Natural;
      Unit_Name : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Remaining Remaining work items.
   --  @param Rate Work rate per second.
   --  @param Unit_Name Unit noun.
   --  @return Phrase such as "120 items remaining at 4 items/s".

   function Progress_Bar
     (Context : Humanize.Contexts.Context;
      Done    : Natural;
      Total   : Positive;
      Width   : Positive := 10)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Done Completed count.
   --  @param Total Total count.
   --  @param Width Character width of the bar.
   --  @return Text progress bar such as "[###-------] 30%".

   function Accessible_Progress
     (Context : Humanize.Contexts.Context;
      Done    : Natural;
      Total   : Positive)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Done Completed count.
   --  @param Total Total count.
   --  @return Verbose progress phrase without symbolic bar characters.

   function Business_Days
     (Context : Humanize.Contexts.Context;
      Days    : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Days Business-day count.
   --  @return Business-day phrase.

   function Working_Hours
     (Context : Humanize.Contexts.Context;
      Hours   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Hours Working-hour count.
   --  @return Working-hour phrase.

   function End_Of_Week
     (Context : Humanize.Contexts.Context)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @return End-of-week phrase.

   function End_Of_Month
     (Context : Humanize.Contexts.Context)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @return End-of-month phrase.

   function End_Of_Quarter
     (Context : Humanize.Contexts.Context)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @return End-of-quarter phrase.

   function Recurrence
     (Context : Humanize.Contexts.Context;
      Every   : Positive;
      Unit    : Recurrence_Unit)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Every Recurrence interval count.
   --  @param Unit Recurrence unit.
   --  @return Recurrence phrase such as "every 2 days".

   function Schedule
     (Context : Humanize.Contexts.Context;
      Options : Schedule_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Options Schedule phrase policy.
   --  @return Schedule phrase such as "every weekday at 09:00" or
   --    "first Monday of each month".

   function Weekly_Schedule
     (Context     : Humanize.Contexts.Context;
      Weekdays    : Weekday_Set;
      Every       : Positive := 1;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Weekdays Weekday set.
   --  @param Every Week interval count.
   --  @param Has_Time True to append a clock time.
   --  @param Hour Clock hour when Has_Time is True.
   --  @param Minute Clock minute when Has_Time is True.
   --  @param Use_12_Hour True to render 12-hour time.
   --  @return Weekly schedule phrase.

   function Every_Other_Weekday_Schedule
     (Context     : Humanize.Contexts.Context;
      Weekday     : Natural;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Weekday ISO weekday, Monday = 1.
   --  @param Has_Time True to append a clock time.
   --  @param Hour Clock hour when Has_Time is True.
   --  @param Minute Clock minute when Has_Time is True.
   --  @param Use_12_Hour True to render 12-hour time.
   --  @return Every-other-week schedule phrase for a weekday.

   function Monthly_Day_Schedule
     (Context     : Humanize.Contexts.Context;
      Day         : Natural;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Day Day of month.
   --  @param Has_Time True to append a clock time.
   --  @param Hour Clock hour when Has_Time is True.
   --  @param Minute Clock minute when Has_Time is True.
   --  @param Use_12_Hour True to render 12-hour time.
   --  @return Monthly day schedule phrase.

   function Last_Business_Day_Schedule
     (Context     : Humanize.Contexts.Context;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Has_Time True to append a clock time.
   --  @param Hour Clock hour when Has_Time is True.
   --  @param Minute Clock minute when Has_Time is True.
   --  @param Use_12_Hour True to render 12-hour time.
   --  @return Last-business-day schedule phrase.

   function Business_Day_Schedule
     (Context     : Humanize.Contexts.Context;
      Ordinal     : Integer;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Ordinal 1 through 5, or -1 for the last business day.
   --  @param Has_Time True to append a clock time.
   --  @param Hour Clock hour when Has_Time is True.
   --  @param Minute Clock minute when Has_Time is True.
   --  @param Use_12_Hour True to render 12-hour time.
   --  @return Ordinal-business-day schedule phrase.

   function Cron_Schedule
     (Context : Humanize.Contexts.Context;
      Minute  : String;
      Hour    : String;
      Day     : String;
      Month   : String;
      Weekday : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Minute Cron minute field.
   --  @param Hour Cron hour field.
   --  @param Day Cron day-of-month field.
   --  @param Month Cron month field.
   --  @param Weekday Cron day-of-week field.
   --  @return Deterministic schedule phrase for common cron forms.

   function Natural_Duration
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Natural_Duration_Options := Default_Natural_Duration_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Seconds Duration in seconds.
   --  @param Options Natural wording policy.
   --  @return Natural duration phrase such as "less than a minute",
   --    "almost 2 hours", or "just over 3 weeks".

   function Natural_Duration
     (Context       : Humanize.Contexts.Context;
      Seconds       : Duration_Seconds;
      Options       : Natural_Duration_Options;
      Approximation : Natural_Duration_Approximation_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Seconds Duration in seconds.
   --  @param Options Natural wording style.
   --  @param Approximation Threshold policy for approximate styles.
   --  @return Natural duration phrase using caller-selected thresholds.

   function Natural_Duration
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Preset  : Natural_Duration_Threshold_Preset)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Seconds Duration in seconds.
   --  @param Preset Named natural threshold policy.
   --  @return Natural duration phrase using a common threshold preset.

   function Duration_Distance
     (Context   : Humanize.Contexts.Context;
      Seconds   : Duration_Seconds;
      Direction : Duration_Distance_Direction := Duration_Distance_Plain;
      Preset    : Natural_Duration_Threshold_Preset := Threshold_Default)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Seconds Absolute duration in seconds.
   --  @param Direction Optional past/future wrapper.
   --  @param Preset Named natural threshold policy.
   --  @return Phrase such as "less than a minute", "3 days ago", or
   --    "in over a year".

   function Natural_Duration_Detailed
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Detailed_Duration_Options :=
        Default_Detailed_Duration_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Seconds Duration in seconds.
   --  @param Options Component and approximation policy.
   --  @return Multi-component natural duration phrase.

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

   procedure Format_Range_Into
     (Context : Humanize.Contexts.Context;
      Low     : Duration_Seconds;
      High    : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options);
   --  @param Context Formatting context.
   --  @param Low Lower duration bound in seconds.
   --  @param High Upper duration bound in seconds.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Unit bounds for selecting displayed units.

   procedure Countdown_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options);
   --  @param Context Formatting context.
   --  @param Seconds Remaining seconds.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Unit bounds for selecting displayed units.

   procedure SLA_Window_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options);
   --  @param Context Formatting context.
   --  @param Seconds Window duration in seconds.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Unit bounds for selecting displayed units.

   procedure Interval_Into
     (Context : Humanize.Contexts.Context;
      Low     : Duration_Seconds;
      High    : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options;
      Phrase  : Duration_Phrase_Options := Default_Duration_Phrase_Options);
   --  @param Context Formatting context.
   --  @param Low Lower duration bound in seconds.
   --  @param High Upper duration bound in seconds.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Unit bounds for selecting displayed units.
   --  @param Phrase Phrase wording policy.

   procedure Age_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options);
   --  @param Context Formatting context.
   --  @param Seconds Age in seconds.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Unit bounds for selecting displayed units.

   procedure Complete_Count_Into
     (Context  : Humanize.Contexts.Context;
      Done     : Natural;
      Total    : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Done Completed count.
   --  @param Total Total count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Next_Window_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options;
      Phrase  : Duration_Phrase_Options := Default_Duration_Phrase_Options);
   --  @param Context Formatting context.
   --  @param Seconds Upcoming window duration in seconds.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Unit bounds for selecting displayed units.
   --  @param Phrase Phrase wording policy.

   procedure Stale_For_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options);
   --  @param Context Formatting context.
   --  @param Seconds Stale duration in seconds.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Unit bounds for selecting displayed units.

   procedure Expires_In_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options);
   --  @param Context Formatting context.
   --  @param Seconds Expiry duration in seconds.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Unit bounds for selecting displayed units.

   procedure Modified_Ago_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options);
   --  @param Context Formatting context.
   --  @param Seconds Elapsed duration since modification.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Unit bounds for selecting displayed units.

   procedure Synced_Ago_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options);
   --  @param Context Formatting context.
   --  @param Seconds Elapsed duration since sync.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Unit bounds for selecting displayed units.

   procedure Backup_Age_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options);
   --  @param Context Formatting context.
   --  @param Seconds Backup age in seconds.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Unit bounds for selecting displayed units.

   procedure Percent_Complete_Into
     (Context : Humanize.Contexts.Context;
      Percent : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Percent Completion percentage.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Retry_In_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options);
   --  @param Context Formatting context.
   --  @param Seconds Delay before retry in seconds.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Unit bounds for selecting displayed units.

   procedure Step_Count_Into
     (Context : Humanize.Contexts.Context;
      Step    : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Step Current step.
   --  @param Total Total step count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Attempt_Count_Into
     (Context : Humanize.Contexts.Context;
      Attempt : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Attempt Current attempt.
   --  @param Total Total attempt count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure ETA_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options);
   --  @param Context Formatting context.
   --  @param Seconds Estimated remaining seconds.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Unit bounds for selecting displayed units.

   procedure Throughput_Remaining_Into
     (Context   : Humanize.Contexts.Context;
      Remaining : Natural;
      Rate      : Natural;
      Unit_Name : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Remaining Remaining work items.
   --  @param Rate Work rate per second.
   --  @param Unit_Name Unit noun.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Progress_Bar_Into
     (Context : Humanize.Contexts.Context;
      Done    : Natural;
      Total   : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Width   : Positive := 10);
   --  @param Context Formatting context.
   --  @param Done Completed count.
   --  @param Total Total count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Width Character width of the bar.

   procedure Natural_Duration_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Natural_Duration_Options := Default_Natural_Duration_Options);
   --  @param Context Formatting context.
   --  @param Seconds Duration in seconds.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Natural wording policy.

   procedure Natural_Duration_Into
     (Context       : Humanize.Contexts.Context;
      Seconds       : Duration_Seconds;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Options       : Natural_Duration_Options;
      Approximation : Natural_Duration_Approximation_Options);
   --  @param Context Formatting context.
   --  @param Seconds Duration in seconds.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Natural wording style.
   --  @param Approximation Threshold policy for approximate styles.

   procedure Natural_Duration_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Preset  : Natural_Duration_Threshold_Preset);
   --  @param Context Formatting context.
   --  @param Seconds Duration in seconds.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Preset Named natural threshold policy.

   procedure Duration_Distance_Into
     (Context   : Humanize.Contexts.Context;
      Seconds   : Duration_Seconds;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Direction : Duration_Distance_Direction := Duration_Distance_Plain;
      Preset    : Natural_Duration_Threshold_Preset := Threshold_Default);
   --  @param Context Formatting context.
   --  @param Seconds Absolute duration in seconds.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Direction Optional past/future wrapper.
   --  @param Preset Named natural threshold policy.

   procedure Natural_Duration_Detailed_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Detailed_Duration_Options :=
        Default_Detailed_Duration_Options);
   --  @param Context Formatting context.
   --  @param Seconds Duration in seconds.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Component and approximation policy.

   procedure Accessible_Progress_Into
     (Context : Humanize.Contexts.Context;
      Done    : Natural;
      Total   : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Done Completed count.
   --  @param Total Total count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Business_Days_Into
     (Context : Humanize.Contexts.Context;
      Days    : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Days Business-day count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Working_Hours_Into
     (Context : Humanize.Contexts.Context;
      Hours   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Hours Working-hour count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure End_Of_Week_Into
     (Context : Humanize.Contexts.Context;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure End_Of_Month_Into
     (Context : Humanize.Contexts.Context;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure End_Of_Quarter_Into
     (Context : Humanize.Contexts.Context;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Recurrence_Into
     (Context : Humanize.Contexts.Context;
      Every   : Positive;
      Unit    : Recurrence_Unit;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Every Recurrence interval count.
   --  @param Unit Recurrence unit.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Schedule_Into
     (Context : Humanize.Contexts.Context;
      Options : Schedule_Options;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Options Schedule phrase policy.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Weekly_Schedule_Into
     (Context     : Humanize.Contexts.Context;
      Weekdays    : Weekday_Set;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Every       : Positive := 1;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False);
   --  @param Context Formatting context.
   --  @param Weekdays Weekday set.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Every Week interval count.
   --  @param Has_Time True to append a clock time.
   --  @param Hour Clock hour when Has_Time is True.
   --  @param Minute Clock minute when Has_Time is True.
   --  @param Use_12_Hour True to render 12-hour time.

   procedure Every_Other_Weekday_Schedule_Into
     (Context     : Humanize.Contexts.Context;
      Weekday     : Natural;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False);
   --  @param Context Formatting context.
   --  @param Weekday ISO weekday, Monday = 1.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Has_Time True to append a clock time.
   --  @param Hour Clock hour when Has_Time is True.
   --  @param Minute Clock minute when Has_Time is True.
   --  @param Use_12_Hour True to render 12-hour time.

   procedure Monthly_Day_Schedule_Into
     (Context     : Humanize.Contexts.Context;
      Day         : Natural;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False);
   --  @param Context Formatting context.
   --  @param Day Day of month.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Has_Time True to append a clock time.
   --  @param Hour Clock hour when Has_Time is True.
   --  @param Minute Clock minute when Has_Time is True.
   --  @param Use_12_Hour True to render 12-hour time.

   procedure Last_Business_Day_Schedule_Into
     (Context     : Humanize.Contexts.Context;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False);
   --  @param Context Formatting context.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Has_Time True to append a clock time.
   --  @param Hour Clock hour when Has_Time is True.
   --  @param Minute Clock minute when Has_Time is True.
   --  @param Use_12_Hour True to render 12-hour time.

   procedure Business_Day_Schedule_Into
     (Context     : Humanize.Contexts.Context;
      Ordinal     : Integer;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False);
   --  @param Context Formatting context.
   --  @param Ordinal 1 through 5, or -1 for the last business day.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Has_Time True to append a clock time.
   --  @param Hour Clock hour when Has_Time is True.
   --  @param Minute Clock minute when Has_Time is True.
   --  @param Use_12_Hour True to render 12-hour time.

   procedure Cron_Schedule_Into
     (Context : Humanize.Contexts.Context;
      Minute  : String;
      Hour    : String;
      Day     : String;
      Month   : String;
      Weekday : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Minute Cron minute field.
   --  @param Hour Cron hour field.
   --  @param Day Cron day-of-month field.
   --  @param Month Cron month field.
   --  @param Weekday Cron day-of-week field.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

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
   --  @param Status Humanize status for the operation.

end Humanize.Durations;
