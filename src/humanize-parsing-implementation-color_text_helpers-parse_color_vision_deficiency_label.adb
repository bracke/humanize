separate (Humanize.Parsing.Implementation.Color_Text_Helpers)
function Parse_Color_Vision_Deficiency_Label
     (Text : String)
      return Color_Vision_Deficiency_Parse_Result
   is
      Item : constant String := Trim (Text);
      Space : constant Natural := Find_Substring (Item, " ");
      Delta_Mark : constant String := ", delta ";
      Delta_At : constant Natural := Find_Substring (Item, Delta_Mark);
      Deficiency : Humanize.Colors.Color_Vision_Deficiency;
      Risk_Buffer : String (1 .. 32);
      Risk_Length : Natural;
      Difference : Long_Float := 0.0;
      Has_Delta : Boolean := False;
begin
      if Space = 0
        or else not Deficiency_From_Text
          (Item (Item'First .. Space - 1), Deficiency)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Unit,
                 others => <>);
      end if;

      if Delta_At = 0 then
         Store (Trim (Item (Space + 1 .. Item'Last)), Risk_Buffer, Risk_Length);
      else
         Store (Trim (Item (Space + 1 .. Delta_At - 1)),
                Risk_Buffer, Risk_Length);
         if not Numeric_Value
           (Item (Delta_At + Delta_Mark'Length .. Item'Last), Difference)
         then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Expected_Number,
                    others => <>);
         end if;
         Has_Delta := True;
      end if;

      return
        (Status => Humanize.Status.Ok,
         Deficiency => Deficiency,
         Risk => Risk_Buffer,
         Risk_Length => Risk_Length,
         Difference => Difference,
         Has_Delta => Has_Delta,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
exception
      when others => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Color_Vision_Deficiency_Label;
