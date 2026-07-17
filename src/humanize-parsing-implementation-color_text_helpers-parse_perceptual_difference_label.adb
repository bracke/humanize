separate (Humanize.Parsing.Implementation.Color_Text_Helpers)
function Parse_Perceptual_Difference_Label
     (Text : String)
      return Color_Difference_Label_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      OKLab_Prefix : constant String := "oklab delta ";
      CIE76_Prefix : constant String := "cie76 delta ";
      CIE94_Prefix : constant String := "cie94 delta ";
      CIE94_Textile_Prefix : constant String := "cie94 textile delta ";
      CIEDE2000_Prefix : constant String := "ciede2000 delta ";
      Comma : constant Natural := Find_Substring (Item, ", ");
      Difference : Long_Float;
      Label_Buffer : String (1 .. 48);
      Label_Length : Natural;
      Number_First : Natural := 0;
begin
      if Starts_With (Item, OKLab_Prefix) then
         Number_First := Item'First + OKLab_Prefix'Length;
      elsif Starts_With (Item, CIE76_Prefix) then
         Number_First := Item'First + CIE76_Prefix'Length;
      elsif Starts_With (Item, CIE94_Prefix) then
         Number_First := Item'First + CIE94_Prefix'Length;
      elsif Starts_With (Item, CIE94_Textile_Prefix) then
         Number_First := Item'First + CIE94_Textile_Prefix'Length;
      elsif Starts_With (Item, CIEDE2000_Prefix) then
         Number_First := Item'First + CIEDE2000_Prefix'Length;
      end if;

      if Number_First = 0 or else Comma = 0
        or else Number_First > Comma - 1
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      if not Parse_Float_Field
        (Item (Number_First .. Comma - 1), Difference)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      Store (Item (Comma + 2 .. Item'Last), Label_Buffer, Label_Length);
      return
        (Status => Humanize.Status.Ok,
         Value => Difference,
         Label => Label_Buffer,
         Label_Length => Label_Length,
         Perceptual => True,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
end Parse_Perceptual_Difference_Label;
