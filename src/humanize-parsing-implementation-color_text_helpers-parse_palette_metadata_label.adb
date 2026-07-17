separate (Humanize.Parsing.Implementation.Color_Text_Helpers)
function Parse_Palette_Metadata_Label
     (Text : String)
      return Palette_Metadata_Parse_Result
   is
      Item : constant String := Trim (Text);
      Colors_Mark : constant String := " colors, ";
      Pairs_Mark : constant String := " pairs: ";
      Enhanced_Mark : constant String := " enhanced, ";
      Normal_Mark : constant String := " normal, ";
      Large_Mark : constant String := " large-only, ";
      Fail_Mark : constant String := " fail";
      A : constant Natural := Find_Substring (Item, Colors_Mark);
      B : constant Natural := Find_Substring (Item, Pairs_Mark);
      C : constant Natural := Find_Substring (Item, Enhanced_Mark);
      D : constant Natural := Find_Substring (Item, Normal_Mark);
      E : constant Natural := Find_Substring (Item, Large_Mark);
      F : constant Natural := Find_Substring (Item, Fail_Mark);
      Color_Count : Natural;
      Pair_Count : Natural;
      Enhanced : Natural;
      Normal : Natural;
      Large : Natural;
      Fail : Natural;
begin
      if A = 0 or else B = 0 or else C = 0 or else D = 0
        or else E = 0 or else F = 0
        or else not Parse_Natural_Field (Item (Item'First .. A - 1), Color_Count)
        or else not Parse_Natural_Field
          (Item (A + Colors_Mark'Length .. B - 1), Pair_Count)
        or else not Parse_Natural_Field
          (Item (B + Pairs_Mark'Length .. C - 1), Enhanced)
        or else not Parse_Natural_Field
          (Item (C + Enhanced_Mark'Length .. D - 1), Normal)
        or else not Parse_Natural_Field
          (Item (D + Normal_Mark'Length .. E - 1), Large)
        or else not Parse_Natural_Field
          (Item (E + Large_Mark'Length .. F - 1), Fail)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      if Enhanced + Normal + Large + Fail /= Pair_Count then
         return (Status => Humanize.Status.Invalid_Value,
                 Error => Out_Of_Range,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Color_Count => Color_Count,
         Pair_Count => Pair_Count,
         Enhanced => Enhanced,
         Normal => Normal,
         Large_Only => Large,
         Fail => Fail,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
end Parse_Palette_Metadata_Label;
