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

   --  Multi-unit decomposition (e.g. "1 hour, 30 minutes").
   Max_Component_Count : constant := 7;

   type Component is record
      Unit  : Humanize.Durations.Duration_Unit := Humanize.Durations.Second;
      Count : Long_Long_Integer := 0;
   end record;

   type Component_List is array (1 .. Max_Component_Count) of Component;

   type Multi_Outcome is record
      Kind   : Outcome_Kind := Ok_Selection;
      Length : Natural := 0;
      Items  : Component_List;
   end record;

   --  Decompose Seconds into the largest Max_Components whole units between
   --  Smallest_Unit and Largest_Unit. Zero or sub-smallest values yield a single
   --  Smallest_Unit component with count 0.
   function Classify_Multi
     (Seconds        : Humanize.Durations.Duration_Seconds;
      Options        : Humanize.Durations.Duration_Options;
      Max_Components : Positive)
      return Multi_Outcome;

   --  Selection for one decomposed component.
   function Component_Selection
     (Item : Component)
      return Humanize.Selections.Message_Selection;

end Humanize.Duration_Classification;
