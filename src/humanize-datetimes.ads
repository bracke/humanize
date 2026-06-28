with Ada.Calendar;
with Humanize.Contexts;
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

   type Datetime_Options is record
      Style                 : Relative_Style := Auto;
      Now_Threshold_Seconds : Natural := 45;
      Use_Calendar_Words    : Boolean := True;
      Prefer_Weeks          : Boolean := True;
      Prefer_Months         : Boolean := True;
   end record;

   Default_Datetime_Options : constant Datetime_Options :=
     (Style                 => Auto,
      Now_Threshold_Seconds => 45,
      Use_Calendar_Words    => True,
      Prefer_Weeks          => True,
      Prefer_Months         => True);

   --  Convenience API: humanize Value relative to Reference, owned result.
   function Relative
     (Context   : Humanize.Contexts.Context;
      Value     : Ada.Calendar.Time;
      Reference : Ada.Calendar.Time;
      Options   : Datetime_Options := Default_Datetime_Options)
      return Humanize.Status.Text_Result;

   --  Bounded API: render into caller-owned Target. Target must be 1-based.
   procedure Relative_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Ada.Calendar.Time;
      Reference : Ada.Calendar.Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Datetime_Options := Default_Datetime_Options);

end Humanize.Datetimes;
