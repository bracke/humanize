--  Locale-neutral ASCII decimal preparation. Humanize owns deterministic
--  rounding/scaling policy; i18n owns locale-specific display symbols.
private package Humanize.Decimal_Images is

   --  Locale-neutral ASCII decimal image of a real value ("1.5", "2"), with a
   --  '.' decimal point, rounded to at most Max_Digits fraction digits.
   function Decimal_Image
     (Value                  : Long_Float;
      Max_Digits             : Natural;
      Suppress_Trailing_Zero : Boolean := True)
      return String;

end Humanize.Decimal_Images;
