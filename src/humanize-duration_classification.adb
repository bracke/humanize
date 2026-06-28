with Humanize.Messages;

package body Humanize.Duration_Classification is

   use Humanize.Durations;
   use Humanize.Messages;

   function Size (Unit : Duration_Unit) return Duration_Seconds is
     (case Unit is
         when Second => 1,
         when Minute => 60,
         when Hour   => 3600,
         when Day    => 86_400);

   function Unit_Key (Unit : Duration_Unit) return Message_Id is
     (case Unit is
         when Second => Duration_Unit_Second,
         when Minute => Duration_Unit_Minute,
         when Hour   => Duration_Unit_Hour,
         when Day    => Duration_Unit_Day);

   function Selected
     (Unit  : Duration_Unit;
      Count : Duration_Seconds)
      return Outcome
   is
   begin
      return
        (Kind      => Ok_Selection,
         Selection =>
           Humanize.Selections.Count
             (Unit_Key (Unit),
              Humanize.Selections.Count_Value (Long_Long_Integer (Count))));
   end Selected;

   function Classify
     (Seconds : Duration_Seconds;
      Options : Duration_Options)
      return Outcome
   is
   begin
      if Seconds < 0 then
         return (Kind => Value_Invalid, others => <>);
      end if;

      if Options.Largest_Unit < Options.Smallest_Unit then
         return (Kind => Options_Invalid, others => <>);
      end if;

      if Seconds = 0 then
         return Selected (Options.Smallest_Unit, 0);
      end if;

      --  Largest unit in [Smallest, Largest] whose whole count is at least 1.
      for Unit in reverse Options.Smallest_Unit .. Options.Largest_Unit loop
         if Seconds / Size (Unit) >= 1 then
            return Selected (Unit, Seconds / Size (Unit));
         end if;
      end loop;

      --  No unit reaches a whole count of 1.
      return Selected (Options.Smallest_Unit, 0);
   end Classify;

end Humanize.Duration_Classification;
