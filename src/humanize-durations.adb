with Humanize.Durations.Business_Calendars;
with Humanize.Durations.Formatting;
with Humanize.Durations.Natural;
with Humanize.Durations.Schedules;

package body Humanize.Durations is

   procedure Clear_Business_Calendar_Rules
     (Rules : in out Business_Calendar_Rules)
      renames Humanize.Durations.Business_Calendars.Clear_Business_Calendar_Rules;

   function Add_One_Off_Holiday
     (Rules : in out Business_Calendar_Rules;
      Date  : Ada.Calendar.Time)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_One_Off_Holiday;

   function Add_Recurring_Holiday
     (Rules : in out Business_Calendar_Rules;
      Month : Ada.Calendar.Month_Number;
      Day   : Ada.Calendar.Day_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_Recurring_Holiday;

   function Add_Observed_Holiday
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number;
      Month : Ada.Calendar.Month_Number;
      Day   : Ada.Calendar.Day_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_Observed_Holiday;

   function Add_Nth_Weekday_Holiday
     (Rules   : in out Business_Calendar_Rules;
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Weekday : Standard.Natural;
      Ordinal : Integer)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_Nth_Weekday_Holiday;

   function Add_US_Federal_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_US_Federal_Holidays;

   function Add_TARGET2_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_TARGET2_Holidays;

   function Add_UK_Bank_Holidays_England_Wales
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_UK_Bank_Holidays_England_Wales;

   function Add_Canada_Federal_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_Canada_Federal_Holidays;

   function Add_Germany_Public_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_Germany_Public_Holidays;

   function Add_France_Public_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_France_Public_Holidays;

   function Add_NYSE_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_NYSE_Holidays;

   function Add_ASX_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_ASX_Holidays;

   function Add_JPX_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_JPX_Holidays;

   function Add_SIX_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_SIX_Holidays;

   function Add_SGX_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_SGX_Holidays;

   function Add_HKEX_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_HKEX_Holidays;

   function Add_NSE_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_NSE_Holidays;

   function Add_B3_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_B3_Holidays;

   function Add_BMV_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_BMV_Holidays;

   function Add_Australia_National_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_Australia_National_Holidays;

   function Add_Japan_Public_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_Japan_Public_Holidays;

   function Add_Switzerland_Common_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_Switzerland_Common_Holidays;

   function Add_Singapore_Public_Holidays
     (Rules : in out Business_Calendar_Rules;
      Year  : Ada.Calendar.Year_Number)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_Singapore_Public_Holidays;

   function Add_Half_Day
     (Rules    : in out Business_Calendar_Rules;
      Date     : Ada.Calendar.Time;
      End_Hour : Standard.Natural)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_Half_Day;

   function Add_Shutdown
     (Rules      : in out Business_Calendar_Rules;
      First_Date : Ada.Calendar.Time;
      Last_Date  : Ada.Calendar.Time)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Add_Shutdown;

   function Set_Business_Hours
     (Rules      : in out Business_Calendar_Rules;
      Weekday    : Standard.Natural;
      Start_Hour : Standard.Natural;
      End_Hour   : Standard.Natural)
      return Humanize.Status.Status_Code
      renames Humanize.Durations.Business_Calendars.Set_Business_Hours;

   function Rule_Holidays
     (Rules : Business_Calendar_Rules)
      return Holiday_List
      renames Humanize.Durations.Business_Calendars.Rule_Holidays;

   function Rule_Recurring_Holidays
     (Rules : Business_Calendar_Rules)
      return Recurring_Holiday_List
      renames Humanize.Durations.Business_Calendars.Rule_Recurring_Holidays;

   function Rule_Half_Days
     (Rules : Business_Calendar_Rules)
      return Half_Day_List
      renames Humanize.Durations.Business_Calendars.Rule_Half_Days;

   function Rule_Shutdowns
     (Rules : Business_Calendar_Rules)
      return Shutdown_Period_List
      renames Humanize.Durations.Business_Calendars.Rule_Shutdowns;

   function Business_Calendar_Options_For
     (Preset : Business_Calendar_Preset)
      return Advanced_Business_Calendar_Options
      renames Humanize.Durations.Business_Calendars.Business_Calendar_Options_For;

   function Business_Calendar_Rules_For
     (Preset : Business_Calendar_Preset)
      return Business_Calendar_Rules
      renames Humanize.Durations.Business_Calendars.Business_Calendar_Rules_For;

   function US_Federal_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
      renames Humanize.Durations.Business_Calendars.US_Federal_Business_Calendar_Rules;

   function TARGET2_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
      renames Humanize.Durations.Business_Calendars.TARGET2_Business_Calendar_Rules;

   function UK_England_Wales_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
      renames Humanize.Durations.Business_Calendars.UK_England_Wales_Business_Calendar_Rules;

   function Canada_Federal_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
      renames Humanize.Durations.Business_Calendars.Canada_Federal_Business_Calendar_Rules;

   function Germany_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
      renames Humanize.Durations.Business_Calendars.Germany_Business_Calendar_Rules;

   function France_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
      renames Humanize.Durations.Business_Calendars.France_Business_Calendar_Rules;

   function NYSE_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
      renames Humanize.Durations.Business_Calendars.NYSE_Business_Calendar_Rules;

   function ASX_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
      renames Humanize.Durations.Business_Calendars.ASX_Business_Calendar_Rules;

   function JPX_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
      renames Humanize.Durations.Business_Calendars.JPX_Business_Calendar_Rules;

   function SIX_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
      renames Humanize.Durations.Business_Calendars.SIX_Business_Calendar_Rules;

   function SGX_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
      renames Humanize.Durations.Business_Calendars.SGX_Business_Calendar_Rules;

   function HKEX_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
      renames Humanize.Durations.Business_Calendars.HKEX_Business_Calendar_Rules;

   function NSE_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
      renames Humanize.Durations.Business_Calendars.NSE_Business_Calendar_Rules;

   function B3_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
      renames Humanize.Durations.Business_Calendars.B3_Business_Calendar_Rules;

   function BMV_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
      renames Humanize.Durations.Business_Calendars.BMV_Business_Calendar_Rules;

   function Australia_National_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
      renames Humanize.Durations.Business_Calendars.Australia_National_Business_Calendar_Rules;

   function Japan_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
      renames Humanize.Durations.Business_Calendars.Japan_Business_Calendar_Rules;

   function Switzerland_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
      renames Humanize.Durations.Business_Calendars.Switzerland_Business_Calendar_Rules;

   function Singapore_Business_Calendar_Rules
     (Year : Ada.Calendar.Year_Number)
      return Business_Calendar_Rules
      renames Humanize.Durations.Business_Calendars.Singapore_Business_Calendar_Rules;

   function Add_Business_Days
     (Start   : Ada.Calendar.Time;
      Days    : Standard.Natural;
      Options : Business_Day_Options := Default_Business_Day_Options)
      return Ada.Calendar.Time
      renames Humanize.Durations.Business_Calendars.Add_Business_Days;

   function Add_Business_Days
     (Start    : Ada.Calendar.Time;
      Days     : Standard.Natural;
      Holidays : Holiday_List;
      Options  : Business_Day_Options := Default_Business_Day_Options)
      return Ada.Calendar.Time
      renames Humanize.Durations.Business_Calendars.Add_Business_Days;

   function Is_Business_Day
     (Value : Ada.Calendar.Time;
      Rules : Business_Calendar_Rules)
      return Boolean
      renames Humanize.Durations.Business_Calendars.Is_Business_Day;

   function Add_Business_Days
     (Start : Ada.Calendar.Time;
      Days  : Integer;
      Rules : Business_Calendar_Rules)
      return Ada.Calendar.Time
      renames Humanize.Durations.Business_Calendars.Add_Business_Days;

   function Business_Date_Label
     (Context : Humanize.Contexts.Context;
      Start   : Ada.Calendar.Time;
      Days    : Standard.Natural;
      Options : Business_Day_Options := Default_Business_Day_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Business_Calendars.Business_Date_Label;

   function Add_Business_Hours
     (Start   : Ada.Calendar.Time;
      Hours   : Standard.Natural;
      Options : Business_Hour_Options := Default_Business_Hour_Options)
      return Ada.Calendar.Time
      renames Humanize.Durations.Business_Calendars.Add_Business_Hours;

   function Add_Business_Hours
     (Start    : Ada.Calendar.Time;
      Hours    : Standard.Natural;
      Holidays : Holiday_List;
      Options  : Business_Calendar_Options :=
        Default_Business_Calendar_Options)
      return Ada.Calendar.Time
      renames Humanize.Durations.Business_Calendars.Add_Business_Hours;

   function Business_Hour_Label
     (Context : Humanize.Contexts.Context;
      Start   : Ada.Calendar.Time;
      Hours   : Standard.Natural;
      Options : Business_Hour_Options := Default_Business_Hour_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Business_Calendars.Business_Hour_Label;

   function Business_Calendar_Label
     (Context  : Humanize.Contexts.Context;
      Start    : Ada.Calendar.Time;
      Hours    : Standard.Natural;
      Holidays : Holiday_List;
      Options  : Business_Calendar_Options :=
        Default_Business_Calendar_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Business_Calendars.Business_Calendar_Label;

   function Add_Business_Hours
     (Start               : Ada.Calendar.Time;
      Hours               : Standard.Natural;
      Holidays            : Holiday_List;
      Recurring_Holidays  : Recurring_Holiday_List;
      Half_Days           : Half_Day_List;
      Shutdowns           : Shutdown_Period_List;
      Options             : Advanced_Business_Calendar_Options :=
        Default_Advanced_Business_Calendar_Options)
      return Ada.Calendar.Time
      renames Humanize.Durations.Business_Calendars.Add_Business_Hours;

   function Add_Business_Hours
     (Start : Ada.Calendar.Time;
      Hours : Standard.Natural;
      Rules : Business_Calendar_Rules)
      return Ada.Calendar.Time
      renames Humanize.Durations.Business_Calendars.Add_Business_Hours;

   function Business_Calendar_Label
     (Context             : Humanize.Contexts.Context;
      Start               : Ada.Calendar.Time;
      Hours               : Standard.Natural;
      Holidays            : Holiday_List;
      Recurring_Holidays  : Recurring_Holiday_List;
      Half_Days           : Half_Day_List;
      Shutdowns           : Shutdown_Period_List;
      Options             : Advanced_Business_Calendar_Options :=
        Default_Advanced_Business_Calendar_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Business_Calendars.Business_Calendar_Label;

   function Business_Calendar_Label
     (Context : Humanize.Contexts.Context;
      Start   : Ada.Calendar.Time;
      Hours   : Standard.Natural;
      Rules   : Business_Calendar_Rules)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Business_Calendars.Business_Calendar_Label;

   function Business_Date_Label
     (Context  : Humanize.Contexts.Context;
      Start    : Ada.Calendar.Time;
      Days     : Standard.Natural;
      Holidays : Holiday_List;
      Options  : Business_Day_Options := Default_Business_Day_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Business_Calendars.Business_Date_Label;

   procedure Business_Date_Label_Into
     (Context : Humanize.Contexts.Context;
      Start   : Ada.Calendar.Time;
      Days    : Standard.Natural;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Business_Day_Options := Default_Business_Day_Options)
      renames Humanize.Durations.Business_Calendars.Business_Date_Label_Into;

   procedure Business_Date_Label_Into
     (Context  : Humanize.Contexts.Context;
      Start    : Ada.Calendar.Time;
      Days     : Standard.Natural;
      Holidays : Holiday_List;
      Target   : in out String;
      Written  : out Standard.Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Business_Day_Options := Default_Business_Day_Options)
      renames Humanize.Durations.Business_Calendars.Business_Date_Label_Into;

   procedure Business_Hour_Label_Into
     (Context : Humanize.Contexts.Context;
      Start   : Ada.Calendar.Time;
      Hours   : Standard.Natural;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Business_Hour_Options := Default_Business_Hour_Options)
      renames Humanize.Durations.Business_Calendars.Business_Hour_Label_Into;

   procedure Business_Calendar_Label_Into
     (Context  : Humanize.Contexts.Context;
      Start    : Ada.Calendar.Time;
      Hours    : Standard.Natural;
      Holidays : Holiday_List;
      Target   : in out String;
      Written  : out Standard.Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Business_Calendar_Options :=
        Default_Business_Calendar_Options)
      renames Humanize.Durations.Business_Calendars.Business_Calendar_Label_Into;

   procedure Business_Calendar_Label_Into
     (Context             : Humanize.Contexts.Context;
      Start               : Ada.Calendar.Time;
      Hours               : Standard.Natural;
      Holidays            : Holiday_List;
      Recurring_Holidays  : Recurring_Holiday_List;
      Half_Days           : Half_Day_List;
      Shutdowns           : Shutdown_Period_List;
      Target              : in out String;
      Written             : out Standard.Natural;
      Status              : out Humanize.Status.Status_Code;
      Options             : Advanced_Business_Calendar_Options :=
        Default_Advanced_Business_Calendar_Options)
      renames Humanize.Durations.Business_Calendars.Business_Calendar_Label_Into;

   procedure Business_Calendar_Label_Into
     (Context : Humanize.Contexts.Context;
      Start   : Ada.Calendar.Time;
      Hours   : Standard.Natural;
      Rules   : Business_Calendar_Rules;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Durations.Business_Calendars.Business_Calendar_Label_Into;

   function Format_Metadata
     (Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Duration_Render_Metadata
      renames Humanize.Durations.Formatting.Format_Metadata;

   function Format
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Format;

   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
      renames Humanize.Durations.Formatting.Format_Into;

   function Format_Components
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive;
      Options        : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Format_Components;

   procedure Format_Components_Into
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive;
      Target         : in out String;
      Written        : out Standard.Natural;
      Status         : out Humanize.Status.Status_Code;
      Options        : Duration_Options := Default_Duration_Options)
      renames Humanize.Durations.Formatting.Format_Components_Into;

   function Format_Compact
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive := 2;
      Options        : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Format_Compact;

   procedure Format_Compact_Into
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive;
      Target         : in out String;
      Written        : out Standard.Natural;
      Status         : out Humanize.Status.Status_Code;
      Options        : Duration_Options := Default_Duration_Options)
      renames Humanize.Durations.Formatting.Format_Compact_Into;

   function Format_Clock
     (Context      : Humanize.Contexts.Context;
      Seconds      : Duration_Seconds;
      Always_Hours : Boolean := True)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Format_Clock;

   procedure Format_Clock_Into
     (Context      : Humanize.Contexts.Context;
      Seconds      : Duration_Seconds;
      Target       : in out String;
      Written      : out Standard.Natural;
      Status       : out Humanize.Status.Status_Code;
      Always_Hours : Boolean := True)
      renames Humanize.Durations.Formatting.Format_Clock_Into;

   function Format_Precise
     (Context           : Humanize.Contexts.Context;
      Microseconds      : Duration_Microseconds;
      Max_Components    : Positive;
      Minimum_Unit      : Precise_Duration_Unit)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Format_Precise;

   function Format_Precise
     (Context           : Humanize.Contexts.Context;
      Microseconds      : Duration_Microseconds;
      Max_Components    : Positive;
      Options           : Precise_Duration_Options :=
        Default_Precise_Duration_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Format_Precise;

   procedure Format_Precise_Into
     (Context           : Humanize.Contexts.Context;
      Microseconds      : Duration_Microseconds;
      Max_Components    : Positive;
      Target            : in out String;
      Written           : out Standard.Natural;
      Status            : out Humanize.Status.Status_Code;
      Minimum_Unit      : Precise_Duration_Unit)
      renames Humanize.Durations.Formatting.Format_Precise_Into;

   procedure Format_Precise_Into
     (Context           : Humanize.Contexts.Context;
      Microseconds      : Duration_Microseconds;
      Max_Components    : Positive;
      Target            : in out String;
      Written           : out Standard.Natural;
      Status            : out Humanize.Status.Status_Code;
      Options           : Precise_Duration_Options :=
        Default_Precise_Duration_Options)
      renames Humanize.Durations.Formatting.Format_Precise_Into;

   function Format_Range
     (Context : Humanize.Contexts.Context;
      Low     : Duration_Seconds;
      High    : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Format_Range;

   function Countdown
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Countdown;

   function SLA_Window
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.SLA_Window;

   function Interval
     (Context : Humanize.Contexts.Context;
      Low     : Duration_Seconds;
      High    : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options;
      Phrase  : Duration_Phrase_Options := Default_Duration_Phrase_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Interval;

   function Next_Window
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options;
      Phrase  : Duration_Phrase_Options := Default_Duration_Phrase_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Next_Window;

   function Age
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Age;

   function Stale_For
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Stale_For;

   function Expires_In
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Expires_In;

   function Modified_Ago
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Modified_Ago;

   function Synced_Ago
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Synced_Ago;

   function Backup_Age
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Backup_Age;

   function Complete_Count
     (Context  : Humanize.Contexts.Context;
      Done     : Standard.Natural;
      Total    : Standard.Natural)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Complete_Count;

   function Percent_Complete
     (Context : Humanize.Contexts.Context;
      Percent : Long_Float)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Percent_Complete;

   function Retry_In
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Retry_In;

   function Step_Count
     (Context : Humanize.Contexts.Context;
      Step    : Standard.Natural;
      Total   : Standard.Natural)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Step_Count;

   function Attempt_Count
     (Context : Humanize.Contexts.Context;
      Attempt : Standard.Natural;
      Total   : Standard.Natural)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Attempt_Count;

   function ETA
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.ETA;

   function Throughput_Remaining
     (Context   : Humanize.Contexts.Context;
      Remaining : Standard.Natural;
      Rate      : Standard.Natural;
      Unit_Name : String)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Throughput_Remaining;

   function Progress_Bar
     (Context : Humanize.Contexts.Context;
      Done    : Standard.Natural;
      Total   : Positive;
      Width   : Positive := 10)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Progress_Bar;

   function Accessible_Progress
     (Context : Humanize.Contexts.Context;
      Done    : Standard.Natural;
      Total   : Positive)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Accessible_Progress;

   function Business_Days
     (Context : Humanize.Contexts.Context;
      Days    : Standard.Natural)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Business_Days;

   function Working_Hours
     (Context : Humanize.Contexts.Context;
      Hours   : Standard.Natural)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.Working_Hours;

   function End_Of_Week
     (Context : Humanize.Contexts.Context)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.End_Of_Week;

   function End_Of_Month
     (Context : Humanize.Contexts.Context)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.End_Of_Month;

   function End_Of_Quarter
     (Context : Humanize.Contexts.Context)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Formatting.End_Of_Quarter;

   procedure Format_Range_Into
     (Context : Humanize.Contexts.Context;
      Low     : Duration_Seconds;
      High    : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
      renames Humanize.Durations.Formatting.Format_Range_Into;

   procedure Countdown_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
      renames Humanize.Durations.Formatting.Countdown_Into;

   procedure SLA_Window_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
      renames Humanize.Durations.Formatting.SLA_Window_Into;

   procedure Interval_Into
     (Context : Humanize.Contexts.Context;
      Low     : Duration_Seconds;
      High    : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options;
      Phrase  : Duration_Phrase_Options := Default_Duration_Phrase_Options)
      renames Humanize.Durations.Formatting.Interval_Into;

   procedure Age_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
      renames Humanize.Durations.Formatting.Age_Into;

   procedure Complete_Count_Into
     (Context  : Humanize.Contexts.Context;
      Done     : Standard.Natural;
      Total    : Standard.Natural;
      Target   : in out String;
      Written  : out Standard.Natural;
      Status   : out Humanize.Status.Status_Code)
      renames Humanize.Durations.Formatting.Complete_Count_Into;

   procedure Next_Window_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options;
      Phrase  : Duration_Phrase_Options := Default_Duration_Phrase_Options)
      renames Humanize.Durations.Formatting.Next_Window_Into;

   procedure Stale_For_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
      renames Humanize.Durations.Formatting.Stale_For_Into;

   procedure Expires_In_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
      renames Humanize.Durations.Formatting.Expires_In_Into;

   procedure Modified_Ago_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
      renames Humanize.Durations.Formatting.Modified_Ago_Into;

   procedure Synced_Ago_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
      renames Humanize.Durations.Formatting.Synced_Ago_Into;

   procedure Backup_Age_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
      renames Humanize.Durations.Formatting.Backup_Age_Into;

   procedure Percent_Complete_Into
     (Context : Humanize.Contexts.Context;
      Percent : Long_Float;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Durations.Formatting.Percent_Complete_Into;

   procedure Retry_In_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
      renames Humanize.Durations.Formatting.Retry_In_Into;

   procedure Step_Count_Into
     (Context : Humanize.Contexts.Context;
      Step    : Standard.Natural;
      Total   : Standard.Natural;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Durations.Formatting.Step_Count_Into;

   procedure Attempt_Count_Into
     (Context : Humanize.Contexts.Context;
      Attempt : Standard.Natural;
      Total   : Standard.Natural;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Durations.Formatting.Attempt_Count_Into;

   procedure ETA_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
      renames Humanize.Durations.Formatting.ETA_Into;

   procedure Throughput_Remaining_Into
     (Context   : Humanize.Contexts.Context;
      Remaining : Standard.Natural;
      Rate      : Standard.Natural;
      Unit_Name : String;
      Target    : in out String;
      Written   : out Standard.Natural;
      Status    : out Humanize.Status.Status_Code)
      renames Humanize.Durations.Formatting.Throughput_Remaining_Into;

   procedure Progress_Bar_Into
     (Context : Humanize.Contexts.Context;
      Done    : Standard.Natural;
      Total   : Positive;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Width   : Positive := 10)
      renames Humanize.Durations.Formatting.Progress_Bar_Into;

   procedure Accessible_Progress_Into
     (Context : Humanize.Contexts.Context;
      Done    : Standard.Natural;
      Total   : Positive;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Durations.Formatting.Accessible_Progress_Into;

   procedure Business_Days_Into
     (Context : Humanize.Contexts.Context;
      Days    : Standard.Natural;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Durations.Formatting.Business_Days_Into;

   procedure Working_Hours_Into
     (Context : Humanize.Contexts.Context;
      Hours   : Standard.Natural;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Durations.Formatting.Working_Hours_Into;

   procedure End_Of_Week_Into
     (Context : Humanize.Contexts.Context;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Durations.Formatting.End_Of_Week_Into;

   procedure End_Of_Month_Into
     (Context : Humanize.Contexts.Context;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Durations.Formatting.End_Of_Month_Into;

   procedure End_Of_Quarter_Into
     (Context : Humanize.Contexts.Context;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Durations.Formatting.End_Of_Quarter_Into;

   function Recurrence
     (Context : Humanize.Contexts.Context;
      Every   : Positive;
      Unit    : Recurrence_Unit)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Schedules.Recurrence;

   function Schedule
     (Context : Humanize.Contexts.Context;
      Options : Schedule_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Schedules.Schedule;

   function Weekly_Schedule
     (Context     : Humanize.Contexts.Context;
      Weekdays    : Weekday_Set;
      Every       : Positive := 1;
      Has_Time    : Boolean := False;
      Hour        : Standard.Natural := 0;
      Minute      : Standard.Natural := 0;
      Use_12_Hour : Boolean := False)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Schedules.Weekly_Schedule;

   function Every_Other_Weekday_Schedule
     (Context     : Humanize.Contexts.Context;
      Weekday     : Standard.Natural;
      Has_Time    : Boolean := False;
      Hour        : Standard.Natural := 0;
      Minute      : Standard.Natural := 0;
      Use_12_Hour : Boolean := False)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Schedules.Every_Other_Weekday_Schedule;

   function Monthly_Day_Schedule
     (Context     : Humanize.Contexts.Context;
      Day         : Standard.Natural;
      Has_Time    : Boolean := False;
      Hour        : Standard.Natural := 0;
      Minute      : Standard.Natural := 0;
      Use_12_Hour : Boolean := False)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Schedules.Monthly_Day_Schedule;

   function Last_Business_Day_Schedule
     (Context     : Humanize.Contexts.Context;
      Has_Time    : Boolean := False;
      Hour        : Standard.Natural := 0;
      Minute      : Standard.Natural := 0;
      Use_12_Hour : Boolean := False)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Schedules.Last_Business_Day_Schedule;

   function Business_Day_Schedule
     (Context     : Humanize.Contexts.Context;
      Ordinal     : Integer;
      Has_Time    : Boolean := False;
      Hour        : Standard.Natural := 0;
      Minute      : Standard.Natural := 0;
      Use_12_Hour : Boolean := False)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Schedules.Business_Day_Schedule;

   function Cron_Schedule
     (Context : Humanize.Contexts.Context;
      Minute  : String;
      Hour    : String;
      Day     : String;
      Month   : String;
      Weekday : String)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Schedules.Cron_Schedule;

   function Natural_Duration
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Natural_Duration_Options := Default_Natural_Duration_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Natural.Natural_Duration;

   function Natural_Duration
     (Context       : Humanize.Contexts.Context;
      Seconds       : Duration_Seconds;
      Options       : Natural_Duration_Options;
      Approximation : Natural_Duration_Approximation_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Natural.Natural_Duration;

   function Natural_Duration
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Preset  : Natural_Duration_Threshold_Preset)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Natural.Natural_Duration;

   function Duration_Distance
     (Context   : Humanize.Contexts.Context;
      Seconds   : Duration_Seconds;
      Direction : Duration_Distance_Direction := Duration_Distance_Plain;
      Preset    : Natural_Duration_Threshold_Preset := Threshold_Default)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Natural.Duration_Distance;

   function Natural_Duration_Detailed
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Detailed_Duration_Options :=
        Default_Detailed_Duration_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Durations.Natural.Natural_Duration_Detailed;

   procedure Natural_Duration_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Natural_Duration_Options := Default_Natural_Duration_Options)
      renames Humanize.Durations.Natural.Natural_Duration_Into;

   procedure Natural_Duration_Into
     (Context       : Humanize.Contexts.Context;
      Seconds       : Duration_Seconds;
      Target        : in out String;
      Written       : out Standard.Natural;
      Status        : out Humanize.Status.Status_Code;
      Options       : Natural_Duration_Options;
      Approximation : Natural_Duration_Approximation_Options)
      renames Humanize.Durations.Natural.Natural_Duration_Into;

   procedure Natural_Duration_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Preset  : Natural_Duration_Threshold_Preset)
      renames Humanize.Durations.Natural.Natural_Duration_Into;

   procedure Duration_Distance_Into
     (Context   : Humanize.Contexts.Context;
      Seconds   : Duration_Seconds;
      Target    : in out String;
      Written   : out Standard.Natural;
      Status    : out Humanize.Status.Status_Code;
      Direction : Duration_Distance_Direction := Duration_Distance_Plain;
      Preset    : Natural_Duration_Threshold_Preset := Threshold_Default)
      renames Humanize.Durations.Natural.Duration_Distance_Into;

   procedure Natural_Duration_Detailed_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Detailed_Duration_Options :=
        Default_Detailed_Duration_Options)
      renames Humanize.Durations.Natural.Natural_Duration_Detailed_Into;

   procedure Recurrence_Into
     (Context : Humanize.Contexts.Context;
      Every   : Positive;
      Unit    : Recurrence_Unit;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Durations.Schedules.Recurrence_Into;

   procedure Schedule_Into
     (Context : Humanize.Contexts.Context;
      Options : Schedule_Options;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Durations.Schedules.Schedule_Into;

   procedure Weekly_Schedule_Into
     (Context     : Humanize.Contexts.Context;
      Weekdays    : Weekday_Set;
      Target      : in out String;
      Written     : out Standard.Natural;
      Status      : out Humanize.Status.Status_Code;
      Every       : Positive := 1;
      Has_Time    : Boolean := False;
      Hour        : Standard.Natural := 0;
      Minute      : Standard.Natural := 0;
      Use_12_Hour : Boolean := False)
      renames Humanize.Durations.Schedules.Weekly_Schedule_Into;

   procedure Every_Other_Weekday_Schedule_Into
     (Context     : Humanize.Contexts.Context;
      Weekday     : Standard.Natural;
      Target      : in out String;
      Written     : out Standard.Natural;
      Status      : out Humanize.Status.Status_Code;
      Has_Time    : Boolean := False;
      Hour        : Standard.Natural := 0;
      Minute      : Standard.Natural := 0;
      Use_12_Hour : Boolean := False)
      renames Humanize.Durations.Schedules.Every_Other_Weekday_Schedule_Into;

   procedure Monthly_Day_Schedule_Into
     (Context     : Humanize.Contexts.Context;
      Day         : Standard.Natural;
      Target      : in out String;
      Written     : out Standard.Natural;
      Status      : out Humanize.Status.Status_Code;
      Has_Time    : Boolean := False;
      Hour        : Standard.Natural := 0;
      Minute      : Standard.Natural := 0;
      Use_12_Hour : Boolean := False)
      renames Humanize.Durations.Schedules.Monthly_Day_Schedule_Into;

   procedure Last_Business_Day_Schedule_Into
     (Context     : Humanize.Contexts.Context;
      Target      : in out String;
      Written     : out Standard.Natural;
      Status      : out Humanize.Status.Status_Code;
      Has_Time    : Boolean := False;
      Hour        : Standard.Natural := 0;
      Minute      : Standard.Natural := 0;
      Use_12_Hour : Boolean := False)
      renames Humanize.Durations.Schedules.Last_Business_Day_Schedule_Into;

   procedure Business_Day_Schedule_Into
     (Context     : Humanize.Contexts.Context;
      Ordinal     : Integer;
      Target      : in out String;
      Written     : out Standard.Natural;
      Status      : out Humanize.Status.Status_Code;
      Has_Time    : Boolean := False;
      Hour        : Standard.Natural := 0;
      Minute      : Standard.Natural := 0;
      Use_12_Hour : Boolean := False)
      renames Humanize.Durations.Schedules.Business_Day_Schedule_Into;

   procedure Cron_Schedule_Into
     (Context : Humanize.Contexts.Context;
      Minute  : String;
      Hour    : String;
      Day     : String;
      Month   : String;
      Weekday : String;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Durations.Schedules.Cron_Schedule_Into;

end Humanize.Durations;
