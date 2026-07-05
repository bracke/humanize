with Humanize.Contexts;
with Humanize.Frequencies;
with Humanize.Status;

--  Rate/pace humanization ("approximately 4 times per week").
package Humanize.Rates is
   type Rate_Period is
     (Per_Second,
      Per_Minute,
      Per_Hour,
      Per_Day,
      Per_Week);

   type Rate_Options is record
      Less_Than_Threshold : Humanize.Frequencies.Occurrence_Count := 1;
   end record;

   Default_Rate_Options : constant Rate_Options :=
     (Less_Than_Threshold => 1);

   function Pace
     (Context : Humanize.Contexts.Context;
      Count   : Humanize.Frequencies.Occurrence_Count;
      Period  : Rate_Period)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count Number of occurrences in the period.
   --  @param Period Period over which Count occurs.
   --  @return Human-readable rate.

   function Pace
     (Context  : Humanize.Contexts.Context;
      Count    : Humanize.Frequencies.Occurrence_Count;
      Period   : Rate_Period;
      Singular : String;
      Plural   : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count Number of occurrences in the period.
   --  @param Period Period over which Count occurs.
   --  @param Singular Noun used when Count is one.
   --  @param Plural Noun used for all other counts.
   --  @return Human-readable rate with a custom noun.

   function Pace_Approximate
     (Context : Humanize.Contexts.Context;
      Count   : Humanize.Frequencies.Occurrence_Count;
      Period  : Rate_Period;
      Options : Rate_Options := Default_Rate_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count Number of occurrences in the period.
   --  @param Period Period over which Count occurs.
   --  @param Options Rate threshold policy.
   --  @return Human-readable approximate rate.

   function Pace_Approximate
     (Context  : Humanize.Contexts.Context;
      Count    : Humanize.Frequencies.Occurrence_Count;
      Period   : Rate_Period;
      Singular : String;
      Plural   : String;
      Options  : Rate_Options := Default_Rate_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count Number of occurrences in the period.
   --  @param Period Period over which Count occurs.
   --  @param Singular Noun used when Count is one.
   --  @param Plural Noun used for all other counts.
   --  @param Options Rate threshold policy.
   --  @return Human-readable approximate rate with a custom noun.

   procedure Pace_Into
     (Context : Humanize.Contexts.Context;
      Count   : Humanize.Frequencies.Occurrence_Count;
      Period  : Rate_Period;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count Number of occurrences in the period.
   --  @param Period Period over which Count occurs.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Pace_Approximate_Into
     (Context : Humanize.Contexts.Context;
      Count   : Humanize.Frequencies.Occurrence_Count;
      Period  : Rate_Period;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Rate_Options := Default_Rate_Options);
   --  @param Context Formatting context.
   --  @param Count Number of occurrences in the period.
   --  @param Period Period over which Count occurs.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Rate threshold policy.

   procedure Pace_Into
     (Context  : Humanize.Contexts.Context;
      Count    : Humanize.Frequencies.Occurrence_Count;
      Period   : Rate_Period;
      Singular : String;
      Plural   : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count Number of occurrences in the period.
   --  @param Period Period over which Count occurs.
   --  @param Singular Noun used when Count is one.
   --  @param Plural Noun used for all other counts.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
end Humanize.Rates;
