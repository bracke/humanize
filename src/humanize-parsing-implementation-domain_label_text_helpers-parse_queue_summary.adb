separate (Humanize.Parsing.Implementation.Domain_Label_Text_Helpers)
function Parse_Queue_Summary
     (Text : String)
      return Queue_Summary_Parse_Result
   is
      Item : constant String := Trim (Text);
      Details : constant String :=
        (if Starts_With (Item, "queue: ") then
           Item (Item'First + 7 .. Item'Last)
         else "");
      Position : Natural := Details'First;
      Queued : Natural := 0;
      Running : Natural := 0;
      Failed : Natural := 0;
      Completed : Natural := 0;
      Unit_Buffer : String (1 .. 32) := [others => ' '];
      Unit_Length : Natural := 0;

      function Parse_Part (Part : String) return Boolean is
         Segment : constant String := Trim (Part);
         Amount : Long_Float;
         Tail : Unbounded_String;
         Mark : constant String := " queued";
      begin
         if Ends_With (Segment, Mark) then
            if not Parse_Number_And_Tail
              (Segment (Segment'First .. Segment'Last - Mark'Length),
               Amount, Tail)
            then
               return False;
            end if;
            Queued := Natural (Long_Float'Rounding (Amount));
            Store (To_String (Tail), Unit_Buffer, Unit_Length);
         elsif Ends_With (Segment, " running") then
            if not Parse_Natural_Field
              (Segment (Segment'First .. Segment'Last - 8), Running)
            then
               return False;
            end if;
         elsif Ends_With (Segment, " failed") then
            if not Parse_Natural_Field
              (Segment (Segment'First .. Segment'Last - 7), Failed)
            then
               return False;
            end if;
         elsif Ends_With (Segment, " complete") then
            if not Parse_Natural_Field
              (Segment (Segment'First .. Segment'Last - 9), Completed)
            then
               return False;
            end if;
         else
            return False;
         end if;
         return True;
      end Parse_Part;
begin
      if Item = "queue empty" then
         return
           (Status => Humanize.Status.Ok,
            Empty => True,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif not Starts_With (Item, "queue: ") or else Details'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      while Position <= Details'Last loop
         declare
            Next : constant Natural :=
              Find_Substring (Details (Position .. Details'Last), ", ");
            Last : Natural;
         begin
            if Next = 0 then
               Last := Details'Last;
            else
               Last := Next - 1;
            end if;

            if not Parse_Part (Details (Position .. Last)) then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Number,
                       others => <>);
            end if;
            exit when Last = Details'Last;
            Position := Last + 3;
         end;
      end loop;

      return
        (Status => Humanize.Status.Ok,
         Queued => Queued,
         Running => Running,
         Failed => Failed,
         Completed => Completed,
         Unit => Unit_Buffer,
         Unit_Length => Unit_Length,
         Empty => False,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
exception
      when Constraint_Error => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Queue_Summary;
