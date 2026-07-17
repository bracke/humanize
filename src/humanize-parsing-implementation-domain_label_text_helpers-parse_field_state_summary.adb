separate (Humanize.Parsing.Implementation.Domain_Label_Text_Helpers)
function Parse_Field_State_Summary
     (Text : String)
      return Field_State_Summary_Parse_Result
   is
      Item : constant String := Trim (Text);

      function Result
        (Kind : Field_State_Change_Kind;
         Mark : String;
         Tail_Adjust : Natural := 0)
         return Field_State_Summary_Parse_Result
      is
         Marker_Pos : constant Natural := Find_Substring (Item, Mark);
         Field_Buffer : String (1 .. 64) := [others => ' '];
         Value_Buffer : String (1 .. 160) := [others => ' '];
         Field_Length : Natural := 0;
         Value_Length : Natural := 0;
         Last : Natural := Item'Last;
      begin
         if Marker_Pos = 0 or else Marker_Pos = Item'First then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Expected_Separator,
                    Error_Position => Item'First,
                    others => <>);
         end if;

         if Tail_Adjust > 0 then
            if Last < Tail_Adjust or else Item (Last) /= ')' then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Separator,
                       Error_Position => Item'Last,
                       others => <>);
            end if;
            Last := Last - Tail_Adjust;
         end if;

         Store (Trim (Item (Item'First .. Marker_Pos - 1)),
                Field_Buffer, Field_Length);
         Store (Trim (Item (Marker_Pos + Mark'Length .. Last)),
                Value_Buffer, Value_Length);

         return
           (Status => Humanize.Status.Ok,
            Kind => Kind,
            Field => Field_Buffer,
            Field_Length => Field_Length,
            Value => Value_Buffer,
            Value_Length => Value_Length,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error);
      end Result;
begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Empty_Input,
                 others => <>);
      elsif Find_Substring (Item, " added as ") /= 0 then
         return Result (Field_State_Added, " added as ");
      elsif Find_Substring (Item, " removed (was ") /= 0 then
         return Result (Field_State_Removed, " removed (was ", 1);
      elsif Find_Substring (Item, " unchanged at ") /= 0 then
         return Result (Field_State_Unchanged, " unchanged at ");
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Unsupported_Form,
                 Error_Position => Item'First,
                 others => <>);
      end if;
end Parse_Field_State_Summary;
