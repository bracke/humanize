separate (Humanize.Phrases.Support.Backend)
function Number_Comparison
     (Context        : Humanize.Contexts.Context;
      Current        : Long_Float;
      Baseline       : Long_Float;
      Current_Label  : String := "value";
      Baseline_Label : String := "baseline";
      Unit_Singular  : String := "";
      Unit_Plural    : String := "";
      Options        : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Difference : constant Long_Float := Current - Baseline;
      Quantity   : constant String :=
        With_Optional_Unit
          (Humanize.Decimal_Images.Decimal_Image
             (abs Difference,
              Options.Maximum_Fraction_Digits,
              Options.Suppress_Trailing_Zero),
           Difference, Unit_Singular, Unit_Plural);
begin
      if Difference = 0.0 then
         return Ok_Text (Current_Label & " is equal to " & Baseline_Label);
      elsif Difference > 0.0 then
         return Ok_Text
           (Current_Label & " is " & Quantity & " higher than "
            & Baseline_Label);
      else
         return Ok_Text
           (Current_Label & " is " & Quantity & " lower than "
            & Baseline_Label);
      end if;
end Number_Comparison;
