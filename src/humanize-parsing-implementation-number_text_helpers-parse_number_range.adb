separate (Humanize.Parsing.Implementation.Number_Text_Helpers)
function Parse_Number_Range
     (Text : String)
      return Number_Range_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Core_First : Natural := Item'First;
      Dash : Natural := 0;
      Join : Natural := 0;
      Low, High : Natural := 0;
begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Empty_Input,
            others => <>);
      end if;

      if Starts_With (Item, "about ") then
         Core_First := Item'First + 6;
      elsif Starts_With (Item, "approximately ") then
         Core_First := Item'First + 14;
      elsif Starts_With (Item, "under ") then
         if Parse_Two_Naturals
           ("0", Item (Item'First + 6 .. Item'Last), Low, High)
         then
            return (Status => Humanize.Status.Ok, Low => Long_Long_Integer (Low),
                    High => Long_Long_Integer (High), Exact => True,
                    Consumed => Item'Length, Error_Position => 0,
         Error => No_Parse_Error);
         end if;
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Item'First + 6,
            Error => Expected_Number,
            others => <>);
      elsif Starts_With (Item, "up to ") then
         if Parse_Two_Naturals
           ("0", Item (Item'First + 6 .. Item'Last), Low, High)
         then
            return (Status => Humanize.Status.Ok, Low => Long_Long_Integer (Low),
                    High => Long_Long_Integer (High), Exact => True,
                    Consumed => Item'Length, Error_Position => 0,
         Error => No_Parse_Error);
         end if;
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Item'First + 6,
            Error => Expected_Number,
            others => <>);
      elsif Starts_With (Item, "between ") then
         Join := Find_Substring (Item, " and ");
         if Join = 0
           or else not Parse_Two_Naturals
             (Item (Item'First + 8 .. Join - 1),
              Item (Join + 5 .. Item'Last), Low, High)
         then
            return
              (Status => Humanize.Status.Invalid_Argument,
               Error_Position =>
                 (if Join = 0 then Item'First + 8 else Join + 5),
               Error =>
                 (if Join = 0 then Expected_Separator
                  else Expected_Number),
               others => <>);
         end if;
         if High < Low then
            return
              (Status => Humanize.Status.Invalid_Value,
               Error => Out_Of_Range,
               others => <>);
         end if;
         return (Status => Humanize.Status.Ok, Low => Long_Long_Integer (Low),
                 High => Long_Long_Integer (High), Exact => True,
                 Consumed => Item'Length, Error_Position => 0,
         Error => No_Parse_Error);
      end if;

      for Index in Core_First .. Item'Last loop
         if Item (Index) = '-' then
            Dash := Index;
            exit;
         end if;
      end loop;

      if Dash = 0
        or else Dash = Core_First
        or else Dash = Item'Last
        or else not Parse_Two_Naturals
          (Item (Core_First .. Dash - 1), Item (Dash + 1 .. Item'Last),
           Low, High)
      then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position =>
              (if Dash = 0 then Core_First
               elsif Dash = Core_First then Dash
               elsif Dash = Item'Last then Dash
               else Core_First),
            Error =>
              (if Dash = 0 or else Dash = Core_First or else Dash = Item'Last
               then Expected_Separator
               else Expected_Number),
            others => <>);
      end if;

      if High < Low then
         return
           (Status => Humanize.Status.Invalid_Value,
            Error => Out_Of_Range,
            others => <>);
      end if;

      return (Status => Humanize.Status.Ok, Low => Long_Long_Integer (Low),
              High => Long_Long_Integer (High), Exact => True,
              Consumed => Item'Length, Error_Position => 0,
         Error => No_Parse_Error);
end Parse_Number_Range;
