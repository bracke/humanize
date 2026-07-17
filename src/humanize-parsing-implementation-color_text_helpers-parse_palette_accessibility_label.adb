separate (Humanize.Parsing.Implementation.Color_Text_Helpers)
function Parse_Palette_Accessibility_Label
     (Text : String)
      return Palette_Accessibility_Label_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Of_Mark : constant String := " of ";
      Normal_Mark : constant String := " pairs pass normal text contrast";
      Large_Mark : constant String := " pairs pass large text only";
      Of_At : constant Natural := Find_Substring (Item, Of_Mark);
      Passing : Natural := 0;
      Total : Natural := 0;
      Normal : Boolean := False;
      Large : Boolean := False;
      End_At : Natural := 0;
begin
      if Item = "no accessible text pairs" then
         return
           (Status => Humanize.Status.Ok,
            Has_Accessible_Pairs => False,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Ends_With (Item, Normal_Mark) then
         Normal := True;
         End_At := Item'Last - Normal_Mark'Length;
      elsif Ends_With (Item, Large_Mark) then
         Large := True;
         End_At := Item'Last - Large_Mark'Length;
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Unsupported_Form,
                 others => <>);
      end if;

      if Of_At = 0
        or else not Parse_Natural_Field (Item (Item'First .. Of_At - 1), Passing)
        or else not Parse_Natural_Field
          (Item (Of_At + Of_Mark'Length .. End_At), Total)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Passing => Passing,
         Total => Total,
         Normal_Text => Normal,
         Large_Text_Only => Large,
         Has_Accessible_Pairs => Passing > 0,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
end Parse_Palette_Accessibility_Label;
