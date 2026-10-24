separate (Humanize.Numbers.Ranges)
function Uncertainty_Label
  (Context     : Humanize.Contexts.Context;
   Value       : Long_Float;
   Uncertainty : Long_Float;
   Options     : Number_Options := Default_Number_Options;
   Style       : Uncertainty_Style := Plus_Minus_Uncertainty)
   return Humanize.Status.Text_Result
is
   Center : constant String := Decimal_Text (Value, Options);
   Delta_Text  : constant String := Decimal_Text (Uncertainty, Options);

   --  Image in the locale's numbers, as it is in English.
   function Local (Image : String) return String is
      Rendered : constant Humanize.Status.Text_Result := CLDR_Range (Context, Image);
   begin
      return (if Rendered.Status = Humanize.Status.Ok and then Ada.Strings.Unbounded.Length (Rendered.Text) > 0
              then Ada.Strings.Unbounded.To_String (Rendered.Text) else Image);
   end Local;
begin
   if Uncertainty < 0.0 then
      return (Status => Humanize.Status.Invalid_Value, others => <>);
   end if;

   case Style is
      when Plus_Minus_Uncertainty =>
         return Say (Context, Center & " +/- " & Delta_Text, "number.plus_minus",
                     "value", Local (Center), "delta", Local (Delta_Text));
      when Parenthesized_Uncertainty =>
         return Say (Context, Center & " (+/- " & Delta_Text & ")", "number.plus_minus_parenthesized",
                     "value", Local (Center), "delta", Local (Delta_Text));
      when Interval_Uncertainty =>
         return Decimal_Range
           (Context, Value - Uncertainty, Value + Uncertainty, Options);
   end case;
end Uncertainty_Label;
