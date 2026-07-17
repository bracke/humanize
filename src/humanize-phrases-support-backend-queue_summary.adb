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
      pragma Unreferenced (Context);
      Details : Unbounded_String;
begin
      if Queued = 0 and then Running = 0
        and then Failed = 0 and then Completed = 0
      then
         return Ok_Text ("queue empty");
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

      return Ok_Text ("queue: " & To_String (Details));
end Queue_Summary;
