separate (Humanize.Phrases.Support.Backend)
function Queue_Summary
     (Context   : Humanize.Contexts.Context;
      Queued    : Natural;
      Running   : Natural;
      Failed    : Natural := 0;
      Completed : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result
   is
      Details : Unbounded_String;
begin
      if Queued = 0 and then Running = 0
        and then Failed = 0 and then Completed = 0
      then
         return Humanize.I18N_Rendering.Phrase_Or
           (Context, Sel.Phrase ("queue_summary.empty"), Ok_Text ("queue empty"));
      end if;

      if Queued > 0 then
         Append_Segment
           (Details,
            Natural_Text (Queued) & " " & Unit_Noun (Queued, Singular, Plural)
            & " queued");
      end if;
      if Running > 0 then
         Append_Segment (Details, Natural_Text (Running) & " running");
      end if;
      if Failed > 0 then
         Append_Segment (Details, Failure_Segment (Failed));
      end if;
      if Completed > 0 then
         Append_Segment (Details, Natural_Text (Completed) & " complete");
      end if;

      declare
         Parts   : Unbounded_String;
         Missing : Boolean := False;

         procedure Add (Name : String; Count : Natural; Singular, Plural : String := "") is
            Text : constant String := Segment (Context, Name, Count, 0, Singular, Plural);
         begin
            if Count = 0 then
               return;
            elsif Text = "" then
               Missing := True;
            elsif Length (Parts) > 0 then
               Append (Parts, "|");
            end if;
            Append (Parts, Text);
         end Add;
      begin
         Add ("queued", Queued, Singular, Plural);
         Add ("running", Running);
         Add ("failed", Failed);
         Add ("complete", Completed);
         return Summary_Phrase
           (Context, Sel.Phrase ("queue_summary"), To_String (Parts), Missing,
            Ok_Text ("queue: " & To_String (Details)));
      end;
end Queue_Summary;
