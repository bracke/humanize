separate (Humanize.Strings.Support.Backend)
function Source_Location_Label
  (Path   : String;
   Line   : Natural := 0;
   Column : Natural := 0)
   return Humanize.Status.Text_Result
is
   Base : constant String :=
     (if Path'Length = 0 then "source"
      else Result_Text (Path_Basename (Path)));
begin
   if Line = 0 then
      return Ok_Text (Base);
   elsif Column = 0 then
      return Ok_Text (Base & ":" & Natural_Text (Line));
   else
      return Ok_Text (Base & ":" & Natural_Text (Line) & ":"
         & Natural_Text (Column));
   end if;
end Source_Location_Label;
