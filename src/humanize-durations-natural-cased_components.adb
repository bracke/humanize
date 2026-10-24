with Ada.Characters.Handling;

with Humanize.Duration_Classification;
with Humanize.Selections;

separate (Humanize.Durations.Natural)
function Cased_Components
  (Context        : Humanize.Contexts.Context;
   Seconds        : Duration_Seconds;
   Max_Components : Positive;
   Qualifier      : String;
   Nominative     : String)
   return String
is
   package DC renames Humanize.Duration_Classification;
   use type DC.Outcome_Kind;
   Case_Name : constant String :=
     Humanize.I18N_Rendering.Phrase_Text (Context, "duration.case.natural." & Qualifier);
   Outcome   : constant DC.Multi_Outcome :=
     DC.Classify_Multi (Seconds, (Largest_Unit => Year, Smallest_Unit => Second), Max_Components);
   Joined    : Unbounded_String;
begin
   if Case_Name = "" or else Outcome.Kind /= DC.Ok_Selection then
      return Nominative;
   end if;
   declare
      Conjunction : constant Humanize.Status.Text_Result :=
        Humanize.I18N_Rendering.Render
          (Context, Humanize.Selections.No_Arg (Humanize.Message_Keys.List_And));
      And_Word : constant String :=
        (if Conjunction.Status = Humanize.Status.Ok then To_String (Conjunction.Text) else "");
   begin
      if And_Word = "" then
         return Nominative;
      end if;
      for Index in 1 .. Outcome.Length loop
         declare
            Part : constant String :=
              Humanize.I18N_Rendering.Duration_Part
                (Context, Ada.Characters.Handling.To_Lower (Duration_Unit'Image (Outcome.Items (Index).Unit)),
                 Outcome.Items (Index).Count, Case_Name);
         begin
            if Part = "" then
               return Nominative;
            end if;
            if Index > 1 then
               Append (Joined, (if Index = Outcome.Length then " " & And_Word & " " else ", "));
            end if;
            Append (Joined, Part);
         end;
      end loop;
   end;
   return To_String (Joined);
end Cased_Components;
