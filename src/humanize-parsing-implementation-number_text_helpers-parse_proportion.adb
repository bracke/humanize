separate (Humanize.Parsing.Implementation.Number_Text_Helpers)
function Parse_Proportion
     (Text : String)
      return Proportion_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Join : Natural := 0;
      Count, Total : Natural := 0;
begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Empty_Input,
            others => <>);
      end if;

      Join := Find_Substring (Item, " out of ");
      if Join /= 0 then
         if Parse_Two_Naturals
           (Item (Item'First .. Join - 1), Item (Join + 8 .. Item'Last),
            Count, Total)
         then
            return (Status => Humanize.Status.Ok, Count => Count, Total => Total,
                    Exact => True, Consumed => Item'Length, Error_Position => 0,
         Error => No_Parse_Error);
         end if;
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position =>
              (if Join = Item'First then Item'First else Join + 8),
            Error => Expected_Number,
            others => <>);
      end if;

      Join := Find_Substring (Item, " in ");
      if Join /= 0 then
         if Parse_Two_Naturals
           (Item (Item'First .. Join - 1), Item (Join + 4 .. Item'Last),
            Count, Total)
         then
            return (Status => Humanize.Status.Ok, Count => Count, Total => Total,
                    Exact => True, Consumed => Item'Length, Error_Position => 0,
         Error => No_Parse_Error);
         end if;
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position =>
              (if Join = Item'First then Item'First else Join + 4),
            Error => Expected_Number,
            others => <>);
      end if;

      for Index in Item'Range loop
         if Item (Index) = ':' then
            Join := Index;
            exit;
         end if;
      end loop;

      if Join = 0
        or else Join = Item'First
        or else Join = Item'Last
        or else not Parse_Two_Naturals
          (Item (Item'First .. Join - 1), Item (Join + 1 .. Item'Last),
           Count, Total)
      then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position =>
              (if Join = 0 then Item'First else Join),
            Error =>
              (if Join = 0 then Expected_Separator else Expected_Number),
            others => <>);
      end if;

      return (Status => Humanize.Status.Ok, Count => Count, Total => Total,
              Exact => True, Consumed => Item'Length, Error_Position => 0,
         Error => No_Parse_Error);
end Parse_Proportion;
