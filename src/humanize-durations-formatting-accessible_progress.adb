separate (Humanize.Durations.Formatting)
function Accessible_Progress
  (Context : Humanize.Contexts.Context;
   Done    : Standard.Natural;
   Total   : Positive)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
      Percent : constant Standard.Natural := Standard.Natural'Min (100, Done * 100 / Total);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (No_Space (Standard.Natural'Image (Done)) & " of "
            & No_Space (Positive'Image (Total)) & " complete, "
            & No_Space (Standard.Natural'Image (Percent)) & " percent"),
         Key => Humanize.Message_Keys.No_Message);
   end English;
begin
   return Humanize.I18N_Rendering.Phrase_Or
     (Context,
      Num (Num (Num (Sel.Phrase ("accessible_progress"), "done", Done), "total", Total), "percent",
        Standard.Natural'Min (100, Done * 100 / Total)),
      English);
end Accessible_Progress;
