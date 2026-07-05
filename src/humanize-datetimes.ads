with Ada.Calendar;
with Humanize.Contexts;
with Humanize.Durations;
with Humanize.Status;

--  Relative datetime humanization.
--
--  Picks a semantic key (now / yesterday / "4 hours ago" / ...) from an
--  explicit Value and Reference time and renders it through the context's
--  i18n runtime. This package selects keys only; it must not call I18N.Runtime
--  directly (HUM-INV-002) -- rendering is delegated to Humanize.I18N_Rendering.
package Humanize.Datetimes is

   type Relative_Style is
     (Auto,
      Elapsed,
      Calendar);

   type Relative_Rounding_Mode is
     (Round_Down,
      Round_Nearest,
      Round_Up);

   subtype Relative_Unit_Count is Natural range 1 .. 2;

   type Datetime_Options is record
      Style                 : Relative_Style := Auto;
      Now_Threshold_Seconds : Natural := 45;
      Use_Calendar_Words    : Boolean := True;
      Prefer_Weeks          : Boolean := True;
      Prefer_Months         : Boolean := True;
      Rounding              : Relative_Rounding_Mode := Round_Down;
      Max_Units             : Relative_Unit_Count := 1;
      Calendar_Words_Only   : Boolean := False;
   end record;

   Default_Datetime_Options : constant Datetime_Options :=
     (Style                 => Auto,
      Now_Threshold_Seconds => 45,
      Use_Calendar_Words    => True,
      Prefer_Weeks          => True,
      Prefer_Months         => True,
      Rounding              => Round_Down,
      Max_Units             => 1,
      Calendar_Words_Only   => False);

   --  Convenience API: humanize Value relative to Reference, owned result.
   function Relative
     (Context   : Humanize.Contexts.Context;
      Value     : Ada.Calendar.Time;
      Reference : Ada.Calendar.Time;
      Options   : Datetime_Options := Default_Datetime_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Time to humanize.
   --  @param Reference Reference time used as "now".
   --  @param Options Relative datetime classification policy.
   --  @return Rendered relative datetime result.

   --  Bounded API: render into caller-owned Target. Target must be 1-based.
   procedure Relative_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Ada.Calendar.Time;
      Reference : Ada.Calendar.Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Datetime_Options := Default_Datetime_Options);
   --  @param Context Formatting context.
   --  @param Value Time to humanize.
   --  @param Reference Reference time used as "now".
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Relative datetime classification policy.

   --  Civil-component convenience API. Callers that hold broken-down civil
   --  date/time fields (rather than an Ada.Calendar.Time) can humanize directly.
   --  Impossible civil dates (for example February 30) yield Invalid_Value.
   --  Humanize v0.2 still does not own a time zone database; these components
   --  are interpreted in the local time zone via Ada.Calendar.
   subtype Hour_Number   is Natural range 0 .. 23;
   subtype Minute_Number is Natural range 0 .. 59;
   subtype Second_Number is Natural range 0 .. 59;

   type Civil_Date_Time is record
      Year   : Ada.Calendar.Year_Number := Ada.Calendar.Year_Number'First;
      Month  : Ada.Calendar.Month_Number := 1;
      Day    : Ada.Calendar.Day_Number := 1;
      Hour   : Hour_Number := 0;
      Minute : Minute_Number := 0;
      Second : Second_Number := 0;
   end record;

   type Day_Period is (Night, Morning, Afternoon, Evening);

   type Calendar_Label is
     (Previous_Week,
      Current_Week,
      Next_Week,
      Previous_Month,
      Current_Month,
      Next_Month,
      Previous_Year,
      Current_Year,
      Next_Year);

   type Range_Options is record
      Elide_Same_Month : Boolean := True;
      Elide_Same_Year  : Boolean := False;
      Include_Weekday  : Boolean := False;
      Separator        : Character := '-';
      Use_Month_Names  : Boolean := False;
      Use_12_Hour_Time : Boolean := False;
      Relative_When_Same_Day : Boolean := False;
   end record;

   Default_Range_Options : constant Range_Options :=
     (Elide_Same_Month => True,
      Elide_Same_Year  => False,
      Include_Weekday  => False,
      Separator        => '-',
      Use_Month_Names  => False,
      Use_12_Hour_Time => False,
      Relative_When_Same_Day => False);

   type Calendar_Date_Style is
     (Calendar_Date_ISO,
      Calendar_Date_Short,
      Calendar_Date_Medium,
      Calendar_Date_Long,
      Calendar_Date_Weekday,
      Calendar_Date_Month_Year,
      Calendar_Date_Year_Month,
      Calendar_Date_Quarter,
      Calendar_Date_Fiscal_Quarter,
      Calendar_Date_Month_Day_Ordinal,
      Calendar_Date_Weekday_Ordinal,
      Calendar_Date_Fiscal_Year,
      Calendar_Date_Fiscal_Half,
      Calendar_Date_Semester,
      Calendar_Date_Half_Year,
      Calendar_Date_Month_Phase,
      Calendar_Date_Quarter_Phase,
      Calendar_Date_Half_Year_Phrase,
      Calendar_Date_Fiscal_Year_End,
      Calendar_Date_Compact_Badge);

   type Calendar_Date_Options is record
      Style                   : Calendar_Date_Style := Calendar_Date_ISO;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1;
   end record;

   Default_Calendar_Date_Options : constant Calendar_Date_Options :=
     (Style                   => Calendar_Date_ISO,
      Fiscal_Year_Start_Month => 1);

   type Calendar_Range_Style is
     (Calendar_Range_Auto,
      Calendar_Range_Dates,
      Calendar_Range_Date_Times,
      Calendar_Range_Time_Today,
      Calendar_Range_Week,
      Calendar_Range_Weekend,
      Calendar_Range_Month,
      Calendar_Range_Quarter);

   type Calendar_Range_Options is record
      Style                   : Calendar_Range_Style := Calendar_Range_Auto;
      Use_Month_Names         : Boolean := True;
      Use_12_Hour_Time        : Boolean := False;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1;
   end record;

   Default_Calendar_Range_Options : constant Calendar_Range_Options :=
     (Style                   => Calendar_Range_Auto,
      Use_Month_Names         => True,
      Use_12_Hour_Time        => False,
      Fiscal_Year_Start_Month => 1);

   type Calendar_Difference_Direction is
     (Same_Date,
      Future_Date,
      Past_Date);

   type Calendar_Difference_Result is record
      Years     : Natural := 0;
      Months    : Natural := 0;
      Days      : Natural := 0;
      Direction : Calendar_Difference_Direction := Same_Date;
   end record;

   subtype Calendar_Difference_Component_Count is Natural range 1 .. 3;

   type Calendar_Difference_Style is
     (Calendar_Difference_Plain,
      Calendar_Difference_Relative);

   type Calendar_Difference_Options is record
      Max_Components  : Calendar_Difference_Component_Count := 3;
      Include_Zero    : Boolean := False;
      Style           : Calendar_Difference_Style :=
        Calendar_Difference_Plain;
   end record;

   Default_Calendar_Difference_Options : constant
     Calendar_Difference_Options :=
       (Max_Components => 3,
        Include_Zero   => False,
        Style          => Calendar_Difference_Plain);

   subtype Calendar_Relative_Weekday_Window is Natural range 0 .. 14;

   type Calendar_Relative_Options is record
      Include_Time_Of_Day : Boolean := True;
      Prefer_Weekend      : Boolean := True;
      Weekday_Window      : Calendar_Relative_Weekday_Window := 7;
      Use_Tonight         : Boolean := True;
      Use_Later_Today     : Boolean := True;
   end record;

   Default_Calendar_Relative_Options : constant Calendar_Relative_Options :=
     (Include_Time_Of_Day => True,
      Prefer_Weekend      => True,
      Weekday_Window      => 7,
      Use_Tonight         => True,
      Use_Later_Today     => True);

   function Relative_Civil
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Options   : Datetime_Options := Default_Datetime_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Civil date/time to humanize.
   --  @param Reference Civil date/time used as "now".
   --  @param Options Relative datetime classification policy.
   --  @return Rendered relative datetime result.

   function Natural_Day
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Civil date to humanize.
   --  @param Reference Civil date used as today.
   --  @return Today/yesterday/tomorrow, or an ISO date for distant days.

   function Natural_Time_Of_Day
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Civil date/time to classify.
   --  @return Morning/afternoon/evening/night label.

   function Calendar_Relation
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Civil date/time to classify.
   --  @param Reference Civil date/time used as the current period.
   --  @return Last/this/next week/month/year label when adjacent.

   function Date_Range
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Options : Range_Options := Default_Range_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param First First civil date in the range.
   --  @param Last Last civil date in the range.
   --  @param Options Range compaction and separator policy.
   --  @return Compact ISO-style date range.

   function Time_Range
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Options : Range_Options := Default_Range_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param First First civil time in the range.
   --  @param Last Last civil time in the range.
   --  @param Options Range compaction and time display policy.
   --  @return Compact 24-hour time range.

   function Date_Time_Range
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Options   : Range_Options := Default_Range_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param First First civil date/time in the range.
   --  @param Last Last civil date/time in the range.
   --  @param Reference Reference date used for relative same-day labels.
   --  @param Options Range compaction, weekday, relative, and time policy.
   --  @return Combined date/time interval label.

   function Business_Time_Range_Label
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Rules     : Humanize.Durations.Business_Calendar_Rules;
      Options   : Range_Options := Default_Range_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param First First civil date/time in the range.
   --  @param Last Last civil date/time in the range.
   --  @param Reference Reference date used for relative same-day labels.
   --  @param Rules Business calendar rules for open/closed classification.
   --  @param Options Range compaction, weekday, relative, and time policy.
   --  @return Combined date/time interval with business-hours status.

   function Calendar_Range_Label
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Options   : Calendar_Range_Options := Default_Calendar_Range_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param First First civil date/time in the range.
   --  @param Last Last civil date/time in the range.
   --  @param Reference Reference date used for this/next/last labels.
   --  @param Options Calendar-range preset policy.
   --  @return Semantic calendar range label.

   function Offset_Label
     (Context        : Humanize.Contexts.Context;
      Offset_Minutes : Integer)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Offset_Minutes Offset east of UTC, in minutes.
   --  @return Deterministic offset label such as "UTC+02:00".

   function Calendar_Date_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Options : Range_Options := Default_Range_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Civil date to format.
   --  @param Options Date display policy.
   --  @return Deterministic civil date label.

   function Calendar_Date_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Options : Calendar_Date_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Civil date to format.
   --  @param Options Calendar-date preset policy.
   --  @return Deterministic civil date label.

   function Month_Day_Ordinal_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Civil date to format.
   --  @return Compact month/day ordinal label such as "Jan 1st".

   function Weekday_Ordinal_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Civil date to format.
   --  @return Weekday ordinal phrase such as "Monday the 3rd".

   function Fiscal_Year_Label
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Civil date to classify.
   --  @param Fiscal_Year_Start_Month First month of the fiscal year.
   --  @return Fiscal year label such as "FY2027".

   function Fiscal_Half_Label
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Civil date to classify.
   --  @param Fiscal_Year_Start_Month First month of the fiscal year.
   --  @return Fiscal half-year label such as "FY2027 H1".

   function Semester_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Civil date to classify.
   --  @return Calendar semester label such as "S1 2026".

   function Half_Year_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Civil date to classify.
   --  @return Calendar half-year label such as "H1 2026".

   function Calendar_Badge_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Civil date to format.
   --  @return Compact calendar badge label such as "Jan 1".

   function Month_Phase_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Civil date to classify.
   --  @return Month-position phrase such as "early March 2026".

   function Quarter_Phase_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Civil date to classify.
   --  @return Quarter-position phrase such as "late Q2 2026".

   function Half_Year_Phrase_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Civil date to classify.
   --  @return Half-year phrase such as "first half of 2026".

   function Fiscal_Year_End_Label
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Civil date to classify.
   --  @param Fiscal_Year_Start_Month First month of the fiscal year.
   --  @return Fiscal boundary phrase such as "end of FY2027".

   function Due_Status
     (Context   : Humanize.Contexts.Context;
      Due       : Civil_Date_Time;
      Reference : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Due Due date.
   --  @param Reference Reference date used as today.
   --  @return Deterministic due/overdue/today phrase.

   function Calendar_Difference
     (First : Civil_Date_Time;
      Last  : Civil_Date_Time)
      return Calendar_Difference_Result;
   --  @param First First civil date.
   --  @param Last Last civil date.
   --  @return Exact calendar difference using real month lengths.

   function Calendar_Difference_Label
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Options : Calendar_Difference_Options :=
        Default_Calendar_Difference_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param First First civil date.
   --  @param Last Last civil date.
   --  @param Options Component count and relative wording policy.
   --  @return Deterministic exact calendar difference label.

   function Calendar_Relative_Label
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Options   : Calendar_Relative_Options :=
        Default_Calendar_Relative_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Civil date/time to label.
   --  @param Reference Civil date/time used as today/now.
   --  @param Options Weekday/weekend/time-of-day wording policy.
   --  @return Deterministic calendar-relative label such as "next Friday".

   procedure Natural_Day_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Civil date to humanize.
   --  @param Reference Civil date used as today.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Natural_Time_Of_Day_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Civil date/time to classify.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Calendar_Relation_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Civil date/time to classify.
   --  @param Reference Civil date/time used as the current period.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Date_Range_Into
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Range_Options := Default_Range_Options);
   --  @param Context Formatting context.
   --  @param First First civil date in the range.
   --  @param Last Last civil date in the range.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Range compaction and separator policy.

   procedure Time_Range_Into
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Range_Options := Default_Range_Options);
   --  @param Context Formatting context.
   --  @param First First civil time in the range.
   --  @param Last Last civil time in the range.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Range compaction and time display policy.

   procedure Date_Time_Range_Into
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Range_Options := Default_Range_Options);
   --  @param Context Formatting context.
   --  @param First First civil date/time in the range.
   --  @param Last Last civil date/time in the range.
   --  @param Reference Reference date used for relative same-day labels.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Range compaction, weekday, relative, and time policy.

   procedure Business_Time_Range_Label_Into
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Rules     : Humanize.Durations.Business_Calendar_Rules;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Range_Options := Default_Range_Options);
   --  @param Context Formatting context.
   --  @param First First civil date/time in the range.
   --  @param Last Last civil date/time in the range.
   --  @param Reference Reference date used for relative same-day labels.
   --  @param Rules Business calendar rules for open/closed classification.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Range compaction, weekday, relative, and time policy.

   procedure Calendar_Range_Label_Into
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Calendar_Range_Options := Default_Calendar_Range_Options);
   --  @param Context Formatting context.
   --  @param First First civil date/time in the range.
   --  @param Last Last civil date/time in the range.
   --  @param Reference Reference date used for this/next/last labels.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Calendar-range preset policy.

   procedure Relative_Civil_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Datetime_Options := Default_Datetime_Options);
   --  @param Context Formatting context.
   --  @param Value Civil date/time to humanize.
   --  @param Reference Civil date/time used as "now".
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Relative datetime classification policy.

   procedure Offset_Label_Into
     (Context        : Humanize.Contexts.Context;
      Offset_Minutes : Integer;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Offset_Minutes Offset east of UTC, in minutes.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Calendar_Date_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Range_Options := Default_Range_Options);
   --  @param Context Formatting context.
   --  @param Value Civil date to format.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Date display policy.

   procedure Calendar_Date_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Calendar_Date_Options);
   --  @param Context Formatting context.
   --  @param Value Civil date to format.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Calendar-date preset policy.

   procedure Month_Day_Ordinal_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Civil date to format.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Weekday_Ordinal_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Civil date to format.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Fiscal_Year_Label_Into
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Target                  : in out String;
      Written                 : out Natural;
      Status                  : out Humanize.Status.Status_Code;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1);
   --  @param Context Formatting context.
   --  @param Value Civil date to classify.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Fiscal_Year_Start_Month First month of the fiscal year.

   procedure Fiscal_Half_Label_Into
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Target                  : in out String;
      Written                 : out Natural;
      Status                  : out Humanize.Status.Status_Code;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1);
   --  @param Context Formatting context.
   --  @param Value Civil date to classify.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Fiscal_Year_Start_Month First month of the fiscal year.

   procedure Semester_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Civil date to classify.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Half_Year_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Civil date to classify.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Calendar_Badge_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Civil date to format.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Month_Phase_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Civil date to classify.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Quarter_Phase_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Civil date to classify.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Half_Year_Phrase_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Value Civil date to classify.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Fiscal_Year_End_Label_Into
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Target                  : in out String;
      Written                 : out Natural;
      Status                  : out Humanize.Status.Status_Code;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1);
   --  @param Context Formatting context.
   --  @param Value Civil date to classify.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Fiscal_Year_Start_Month First month of the fiscal year.

   procedure Due_Status_Into
     (Context   : Humanize.Contexts.Context;
      Due       : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Due Due date.
   --  @param Reference Reference date used as today.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Calendar_Difference_Label_Into
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Calendar_Difference_Options :=
        Default_Calendar_Difference_Options);
   --  @param Context Formatting context.
   --  @param First First civil date.
   --  @param Last Last civil date.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Component count and relative wording policy.

   procedure Calendar_Relative_Label_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Calendar_Relative_Options :=
        Default_Calendar_Relative_Options);
   --  @param Context Formatting context.
   --  @param Value Civil date/time to label.
   --  @param Reference Civil date/time used as today/now.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Weekday/weekend/time-of-day wording policy.

end Humanize.Datetimes;
