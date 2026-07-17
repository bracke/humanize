with Humanize.Contexts;
with Humanize.Status;

package Humanize.Durations.Schedules is

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

end Humanize.Durations.Schedules;
