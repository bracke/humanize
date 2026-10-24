with Ada.Characters.Handling;

separate (Humanize.Durations.Formatting)
function Cased_Duration
  (Context : Humanize.Contexts.Context;
   Seconds : Duration_Seconds;
   Options : Duration_Options;
   Frame   : String)
   return String
is
   Case_Name  : constant String := Humanize.I18N_Rendering.Phrase_Text (Context, "duration.case." & Frame);
   Base       : constant Humanize.Status.Text_Result := Format (Context, Seconds, Options);
   Nominative : constant String := (if Base.Status = Humanize.Status.Ok then To_String (Base.Text) else "");
begin
   if Case_Name = "" or else Nominative = "" then
      return Nominative;
   end if;
   --  The unit Format chooses -- the largest with a whole count -- in the
   --  case the frame governs.
   for Unit in reverse Options.Smallest_Unit .. Options.Largest_Unit loop
      if Seconds / Unit_Seconds (Unit) >= 1 or else Unit = Options.Smallest_Unit then
         declare
            Text : constant String :=
              Humanize.I18N_Rendering.Duration_Part
                (Context, Ada.Characters.Handling.To_Lower (Duration_Unit'Image (Unit)),
                 Long_Long_Integer (Seconds / Unit_Seconds (Unit)), Case_Name);
         begin
            return (if Text = "" then Nominative else Text);
         end;
      end if;
   end loop;
   return Nominative;
end Cased_Duration;
