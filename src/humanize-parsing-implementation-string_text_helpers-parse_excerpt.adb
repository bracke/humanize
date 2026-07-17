separate (Humanize.Parsing.Implementation.String_Text_Helpers)
function Parse_Excerpt
     (Text : String;
      Ellipsis : String := "...")
      return Excerpt_Parse_Result
   is
      Item : constant String := Text;
      Starts : constant Boolean := Starts_With (Item, Ellipsis);
      Ends   : constant Boolean := Ends_With (Item, Ellipsis);
      First  : Natural := Item'First;
      Last   : Natural := Item'Last;
      Buffer : String (1 .. 160);
      Length : Natural;
      Ellipsis_Count : Natural := 0;
      Position : Natural := Item'First;
      Inner : Boolean := False;
begin
      while Position <= Item'Last loop
         declare
            Found : constant Natural :=
              Find_Substring (Item (Position .. Item'Last), Ellipsis);
         begin
            exit when Found = 0;
            Ellipsis_Count := Ellipsis_Count + 1;
            if not (Found = Item'First
                    or else Found + Ellipsis'Length - 1 = Item'Last)
            then
               Inner := True;
            end if;
            Position := Found + Natural'Max (Ellipsis'Length, 1);
         end;
      end loop;

      if Starts then
         First := First + Ellipsis'Length;
      end if;
      if Ends and then Last >= First + Ellipsis'Length - 1 then
         Last := Last - Ellipsis'Length;
      end if;
      if Item'Length = 0 or else First > Last then
         Store ("", Buffer, Length);
      else
         Store (Item (First .. Last), Buffer, Length);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Starts_With_Ellipsis => Starts,
         Ends_With_Ellipsis => Ends,
         Ellipsis_Length => Ellipsis'Length,
         Ellipsis_Count => Ellipsis_Count,
         Has_Inner_Ellipsis => Inner,
         Content => Buffer,
         Content_Length => Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
end Parse_Excerpt;
