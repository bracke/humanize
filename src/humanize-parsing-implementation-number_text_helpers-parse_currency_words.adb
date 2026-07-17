separate (Humanize.Parsing.Implementation.Number_Text_Helpers)
function Parse_Currency_Words
     (Text : String)
      return Currency_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Join : constant Natural := Find_Substring (Item, " and ");
      Whole : Long_Long_Integer := 0;
      Minor : Long_Long_Integer := 0;
      Major_Unit : String (1 .. 16) := [others => ' '];
      Major_Length : Natural := 0;
      Minor_Unit : String (1 .. 16) := [others => ' '];
      Minor_Length : Natural := 0;
begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Empty_Input,
                 Error_Position => Text'First,
                 others => <>);
      elsif Join = 0 then
         if not Parse_Worded_Noun_Count
           (Item, Whole, Major_Unit, Major_Length)
         then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Expected_Number,
                    Error_Position => Text'First,
                    others => <>);
         end if;
      else
         if not Parse_Worded_Noun_Count
           (Item (Item'First .. Join - 1), Whole, Major_Unit, Major_Length)
           or else not Parse_Worded_Noun_Count
             (Item (Join + 5 .. Item'Last), Minor, Minor_Unit, Minor_Length)
         then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Expected_Number,
                    Error_Position => Join + 5,
                    others => <>);
         end if;
      end if;

      return
        (Status => Humanize.Status.Ok,
         Amount => Long_Float (Whole) + Long_Float (Minor) / 100.0,
         Code => Major_Unit,
         Code_Length => Major_Length,
         Approximate => False,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error,
         others => <>);
end Parse_Currency_Words;
