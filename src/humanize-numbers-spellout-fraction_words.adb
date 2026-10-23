separate (Humanize.Numbers.Spellout)
function Fraction_Words
  (Context     : Humanize.Contexts.Context;
   Numerator   : Positive;
   Denominator : Positive)
   return Humanize.Status.Text_Result
is
   Locale : constant String := Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context));
   Den : constant String :=
     Locale_Fraction_Denominator_Word
       (Locale, Denominator, Numerator /= 1);
   Text : constant String :=
     (if Den'Length > 0
      then
        (if Humanize.Locales.Is_CJK (Locale)
         then Den &
           Result_Text
             (Locale_Cardinal (Context, Long_Long_Integer (Numerator)))
         elsif Locale = "tr" and then Denominator > 2
         then Den & " " &
           Result_Text
             (Locale_Cardinal (Context, Long_Long_Integer (Numerator)))
         else Result_Text
           (Locale_Cardinal (Context, Long_Long_Integer (Numerator)))
           & " " & Den)
      elsif Locale = "en"
      then Cardinal_Text (Numerator) & " over " & Cardinal_Text (Denominator)
      --  No word for the denominator: the fraction in figures, not
      --  English "over" between words of another language.
      else Positive'Image (Numerator) (2 .. Positive'Image (Numerator)'Last) & "/"
        & Positive'Image (Denominator) (2 .. Positive'Image (Denominator)'Last));
begin
   return Ok_Text (Text);
end Fraction_Words;
