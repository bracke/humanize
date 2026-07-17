separate (Humanize.Parsing.Implementation.Color_Text_Helpers)
function Parse_Palette_Contrast_Matrix
     (Text : String)
      return Palette_Contrast_Matrix_Parse_Result
   is
      Item : constant String := Trim (Text);
      Enhanced_Mark : constant String := " enhanced, ";
      Normal_Mark : constant String := " normal, ";
      Large_Mark : constant String := " large-only, ";
      Fail_Mark : constant String := " fail out of ";
      Pairs_Mark : constant String := " pairs";
      A : constant Natural := Find_Substring (Item, Enhanced_Mark);
      B : constant Natural := Find_Substring (Item, Normal_Mark);
      C : constant Natural := Find_Substring (Item, Large_Mark);
      D : constant Natural := Find_Substring (Item, Fail_Mark);
      E : constant Natural := Find_Substring (Item, Pairs_Mark);
      Enhanced : Natural;
      Normal : Natural;
      Large : Natural;
      Fail : Natural;
      Total : Natural;
begin
      if A = 0 or else B = 0 or else C = 0 or else D = 0 or else E = 0
        or else not Parse_Natural_Field (Item (Item'First .. A - 1), Enhanced)
        or else not Parse_Natural_Field
          (Item (A + Enhanced_Mark'Length .. B - 1), Normal)
        or else not Parse_Natural_Field
          (Item (B + Normal_Mark'Length .. C - 1), Large)
        or else not Parse_Natural_Field
          (Item (C + Large_Mark'Length .. D - 1), Fail)
        or else not Parse_Natural_Field
          (Item (D + Fail_Mark'Length .. E - 1), Total)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      if Enhanced + Normal + Large + Fail /= Total then
         return (Status => Humanize.Status.Invalid_Value,
                 Error => Out_Of_Range,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Enhanced => Enhanced,
         Normal => Normal,
         Large_Only => Large,
         Fail => Fail,
         Total => Total,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
end Parse_Palette_Contrast_Matrix;
