separate (Humanize.Parsing.Implementation.Domain_Label_Text_Helpers)
function Parse_Validation_Summary
     (Text : String)
      return Validation_Summary_Parse_Result
   is
      Item : constant String := Trim (Text);
      Colon : constant Natural := Find_Substring (Item, ": ");
      Count : Natural;
      Severity : Validation_Severity_Label;
      Details_Buffer : String (1 .. 160);
      Details_Length : Natural := 0;
      Other_Count : Natural := 0;
begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Empty_Input,
                 others => <>);
      elsif Colon = 0 then
         if not Parse_Validation_Count_Header (Item, Count, Severity) then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Expected_Number,
                    others => <>);
         end if;
      else
         if not Parse_Validation_Count_Header
           (Item (Item'First .. Colon - 1), Count, Severity)
         then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Expected_Number,
                    others => <>);
         end if;
         Store (Trim (Item (Colon + 2 .. Item'Last)),
                Details_Buffer, Details_Length);
         Other_Count :=
           Parse_Other_Count_From_Details
             (Details_Buffer (1 .. Details_Length));
      end if;

      if Details_Length = 0 then
         Store ("", Details_Buffer, Details_Length);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Count => Count,
         Severity => Severity,
         Has_Details => Details_Length > 0,
         Details => Details_Buffer,
         Details_Length => Details_Length,
         Other_Count => Other_Count,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
exception
      when Constraint_Error => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Validation_Summary;
