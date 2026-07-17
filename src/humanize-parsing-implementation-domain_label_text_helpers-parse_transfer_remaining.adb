separate (Humanize.Parsing.Implementation.Domain_Label_Text_Helpers)
function Parse_Transfer_Remaining
     (Text : String)
      return Transfer_Remaining_Parse_Result
   is
      Item : constant String := Trim (Text);
      Remaining_Mark : constant String := " remaining";
      Rate_Mark : constant String := " remaining at ";
      Stalled_Mark : constant String := " remaining, stalled";
      Rate_At : constant Natural := Find_Substring (Item, Rate_Mark);
      Stalled_At : constant Natural := Find_Substring (Item, Stalled_Mark);
      Remaining : Byte_Parse_Result;
      Rate : Byte_Parse_Result;
begin
      if Item = "transfer complete" then
         return
           (Status => Humanize.Status.Ok,
            Complete => True,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Rate_At /= 0 then
         Remaining := Parse_Bytes (Item (Item'First .. Rate_At - 1));
         declare
            Rate_Text : constant String :=
              Item (Rate_At + Rate_Mark'Length .. Item'Last);
         begin
            if not Ends_With (Rate_Text, "/s") then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Unit,
                       others => <>);
            end if;
            Rate := Parse_Bytes (Rate_Text (Rate_Text'First .. Rate_Text'Last - 2));
         end;
         if Remaining.Status /= Humanize.Status.Ok then
            return (Status => Remaining.Status, Error => Remaining.Error, others => <>);
         elsif Rate.Status /= Humanize.Status.Ok then
            return (Status => Rate.Status, Error => Rate.Error, others => <>);
         end if;
         return
           (Status => Humanize.Status.Ok,
            Remaining => Remaining.Value,
            Bytes_Per_Second => Rate.Value,
            Has_Rate => True,
            Complete => False,
            Stalled => False,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error);
      elsif Stalled_At /= 0 then
         Remaining := Parse_Bytes (Item (Item'First .. Stalled_At - 1));
         if Remaining.Status /= Humanize.Status.Ok then
            return (Status => Remaining.Status, Error => Remaining.Error, others => <>);
         end if;
         return
           (Status => Humanize.Status.Ok,
            Remaining => Remaining.Value,
            Stalled => True,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Ends_With (Item, Remaining_Mark) then
         Remaining :=
           Parse_Bytes (Item (Item'First .. Item'Last - Remaining_Mark'Length));
         if Remaining.Status /= Humanize.Status.Ok then
            return (Status => Remaining.Status, Error => Remaining.Error, others => <>);
         end if;
         return
           (Status => Humanize.Status.Ok,
            Remaining => Remaining.Value,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Unit,
                 others => <>);
      end if;
end Parse_Transfer_Remaining;
