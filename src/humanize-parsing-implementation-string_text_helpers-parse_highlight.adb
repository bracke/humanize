separate (Humanize.Parsing.Implementation.String_Text_Helpers)
function Parse_Highlight
     (Text   : String;
      Before : String := "<mark>";
      After  : String := "</mark>")
      return Highlight_Parse_Result
   is
      Item : constant String := Text;
      Position : Natural := Item'First;
      Count : Natural := 0;
      Open_Count : Natural := 0;
      Close_Count : Natural := 0;
      Open_At : Natural;
      Close_At : Natural;
begin
      declare
         Scan : Natural := Item'First;
      begin
         while Scan <= Item'Last loop
            declare
               Found : constant Natural :=
                 Find_Substring (Item (Scan .. Item'Last), Before);
            begin
               exit when Found = 0;
               Open_Count := Open_Count + 1;
               Scan := Found + Natural'Max (Before'Length, 1);
            end;
         end loop;
      end;

      declare
         Scan : Natural := Item'First;
      begin
         while Scan <= Item'Last loop
            declare
               Found : constant Natural :=
                 Find_Substring (Item (Scan .. Item'Last), After);
            begin
               exit when Found = 0;
               Close_Count := Close_Count + 1;
               Scan := Found + Natural'Max (After'Length, 1);
            end;
         end loop;
      end;

      loop
         Open_At := Find_Substring (Item (Position .. Item'Last), Before);
         exit when Open_At = 0;
         Close_At := Find_Substring (Item (Open_At + Before'Length .. Item'Last), After);
         exit when Close_At = 0;
         Count := Count + 1;
         Position := Close_At + After'Length;
         exit when Position > Item'Last;
      end loop;

      return
        (Status => Humanize.Status.Ok,
         Match_Count => Count,
         Has_Markers => Count > 0,
         Text_Length => Item'Length,
         Before_Length => Before'Length,
         After_Length => After'Length,
         Unbalanced_Markers => Open_Count /= Close_Count,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
end Parse_Highlight;
