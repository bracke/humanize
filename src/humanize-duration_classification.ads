with Humanize.Durations;
with Humanize.Selections;

--  Pure duration rule selection. Returns a semantic message selection or a
--  validation error kind; never localized text and never touches the i18n
--  runtime (HUM-INV-001).
private package Humanize.Duration_Classification is

   type Outcome_Kind is
     (Ok_Selection,
      Value_Invalid,     --  Seconds < 0
      Options_Invalid);  --  Largest_Unit < Smallest_Unit

   type Outcome is record
      Kind      : Outcome_Kind := Ok_Selection;
      Selection : Humanize.Selections.Message_Selection;  --  valid when Ok
   end record;

   function Classify
     (Seconds : Humanize.Durations.Duration_Seconds;
      Options : Humanize.Durations.Duration_Options)
      return Outcome;

end Humanize.Duration_Classification;
