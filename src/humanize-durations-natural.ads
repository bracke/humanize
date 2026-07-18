with Humanize.Contexts;
with Humanize.Status;

--  Natural-language duration labels for prose-oriented user interfaces.
package Humanize.Durations.Natural is

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

   procedure Natural_Duration_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
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
      Written       : out Standard.Natural;
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
      Written : out Standard.Natural;
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
      Written   : out Standard.Natural;
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
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Detailed_Duration_Options :=
        Default_Detailed_Duration_Options);
   --  @param Context Formatting context.
   --  @param Seconds Duration in seconds.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Component and approximation policy.

end Humanize.Durations.Natural;
