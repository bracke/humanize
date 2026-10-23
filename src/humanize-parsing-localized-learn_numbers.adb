with Humanize.Numbers;

separate (Humanize.Parsing.Localized)
function Learn_Numbers (Context : Humanize.Contexts.Context; Kind : Lexicon_Kind; Code : String) return Lexicon is
   package N renames Humanize.Numbers;
   Result : Lexicon;

   procedure Take (Rendered : Humanize.Status.Text_Result; Value : Long_Float) is
   begin
      if Rendered.Status = Humanize.Status.Ok then
         Learn (Result.Forms, Plain_Number (Context, To_String (Rendered.Text)), Value);
      end if;
   end Take;

   type Value_List is array (Positive range <>) of Long_Float;
   Steps    : constant Value_List := [1.0, 2.0, 5.0, 7.0];
   Percents : constant Value_List := [1.0, 2.0, 5.0, 12.5, 50.0, 99.5, 100.0, 250.0];
   Scale : Long_Float;
begin
   case Kind is
      when Percent_Kind =>
         --  Whole and fractional percentages, small to large.
         for Value of Percents loop
            Take (N.Percent (Context, Value), Value);
         end loop;
      when Compact_Kind =>
         --  Every scale the formatter abbreviates, each in both styles.
         Scale := 1.0;
         while Scale <= 1.0E15 loop
            for Step of Steps loop
               for Style in N.Compact_Style loop
                  Take (N.Compact (Context, Long_Long_Integer (Step * Scale), Style => Style), Step * Scale);
               end loop;
            end loop;
            Scale := Scale * 10.0;
         end loop;
      when Ordinal_Kind =>
         --  Enough numbers for every ordinal category, in both genders.
         for Value in 0 .. 130 loop
            for Gender in N.Ordinal_Gender loop
               Take (N.Ordinal (Context, Value, Gender), Long_Float (Value));
            end loop;
         end loop;
      when Currency_Kind =>
         Scale := 1.0;
         while Scale <= 1.0E6 loop
            for Step of Steps loop
               Take (N.Currency (Context, Step * Scale, Code), Step * Scale);
               Take (N.Currency (Context, Step * Scale + 0.25, Code), Step * Scale + 0.25);
            end loop;
            Scale := Scale * 10.0;
         end loop;
      when others =>
         null;
   end case;
   Fit (Result.Forms);
   return Result;
end Learn_Numbers;
