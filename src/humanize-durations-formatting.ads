with Humanize.Contexts;
with Humanize.Status;

--  Duration formatting helpers for clock-style, compact, and verbose labels.
package Humanize.Durations.Formatting is

   function Format_Metadata
     (Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Duration_Render_Metadata;
   --  @param Seconds Duration in seconds.
   --  @param Options Largest/smallest unit policy used for decomposition.
   --  @return Machine-readable duration decomposition metadata.

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

end Humanize.Durations.Formatting;
