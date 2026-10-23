separate (Humanize.Durations.Formatting)
function Throughput_Remaining
  (Context   : Humanize.Contexts.Context;
   Remaining : Standard.Natural;
   Rate      : Standard.Natural;
   Unit_Name : String)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
      Noun : constant String :=
        (if Remaining = 1 then Unit_Name else Unit_Name & "s");
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (No_Space (Standard.Natural'Image (Remaining)) & " " & Noun
            & " remaining at " & No_Space (Standard.Natural'Image (Rate)) & " "
            & Unit_Name & "/s"),
         Key => Humanize.Message_Keys.No_Message);
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Sel.With_Arg (Num (Num (Sel.Phrase ("throughput_remaining"), "remaining", Remaining), "rate", Rate), "unit",
        Unit_Name),
      English);
end Throughput_Remaining;
