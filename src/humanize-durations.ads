with Humanize.Contexts;
with Humanize.Status;

--  Simple single-unit duration humanization.
--
--  Renders the largest useful whole unit (e.g. "1 hour", "90 seconds" ->
--  "1 minute"). Multi-unit lists are deferred. This package selects keys only;
--  it must not call I18N.Runtime directly (HUM-INV-002).
package Humanize.Durations is

   type Duration_Seconds is new Long_Long_Integer;

   type Duration_Unit is
     (Second,
      Minute,
      Hour,
      Day);

   type Duration_Options is record
      Largest_Unit  : Duration_Unit := Day;
      Smallest_Unit : Duration_Unit := Second;
   end record;

   Default_Duration_Options : constant Duration_Options :=
     (Largest_Unit  => Day,
      Smallest_Unit => Second);

   --  Convenience API: humanize Seconds, owned result.
   function Format
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result;

   --  Bounded API: render into caller-owned Target. Target must be 1-based.
   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options);

   --  Multi-unit API: render up to Max_Components largest whole units joined by
   --  the locale's list separator (e.g. "1 hour, 30 minutes").
   function Format_Components
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive;
      Options        : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result;

   procedure Format_Components_Into
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Options        : Duration_Options := Default_Duration_Options);

end Humanize.Durations;
