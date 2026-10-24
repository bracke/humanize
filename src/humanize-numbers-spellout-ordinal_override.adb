separate (Humanize.Numbers.Spellout)
function Ordinal_Override
  (Context : Humanize.Contexts.Context;
   Value   : Natural)
   return Humanize.Status.Text_Result
is
   Locale  : constant String := Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context));
   Missing : constant Humanize.Status.Text_Result := (Status => Humanize.Status.Missing_Message, others => <>);

   --  Count's cardinal words before Word ("" for one), the parts of the next
   --  scale written as the rest of the number is; Missing where CLDR has none.
   function Before (Count : Natural; Word : String) return Humanize.Status.Text_Result is
      Words : constant Humanize.Status.Text_Result := CLDR_Words (Context, Long_Long_Integer (Count));
   begin
      if Count = 1 then
         return Ok_Text (Word);
      elsif Words.Status /= Humanize.Status.Ok then
         return Words;
      end if;
      --  joined by a soft hyphen, as humanize's other German compounds
      return Ok_Text
        (Humanize.Bounded_Text.Result_Text (Words) & Character'Val (16#C2#) & Character'Val (16#AD#) & Word);
   end Before;
begin
   if Locale = "ru" and then Value < 1_000_000 and then Value mod 100 = 0 and then Value mod 1_000 >= 200 then
      --  CLDR 48 writes the cardinal for a round 200 .. 900 ("две тысячи
      --  триста"); the thousands stay CLDR's words.
      if Value < 1_000 then
         return Ok_Text (Humanize.Numbers.Spellout_Data.Ru_Round_Hundredth (Value / 100));
      end if;
      declare
         Words : constant Humanize.Status.Text_Result :=
           CLDR_Words (Context, Long_Long_Integer (Value - Value mod 1_000));
      begin
         return
           (if Words.Status /= Humanize.Status.Ok then Words
            else Ok_Text (Humanize.Bounded_Text.Result_Text (Words) & " "
                          & Humanize.Numbers.Spellout_Data.Ru_Round_Hundredth (Value mod 1_000 / 100)));
      end;
   elsif Locale = "lt" and then Humanize.Numbers.Spellout_Data.Lt_Round_Ordinal (Value) /= "" then
      return Ok_Text (Humanize.Numbers.Spellout_Data.Lt_Round_Ordinal (Value));
   elsif Locale = "de" and then Value >= 1_000_000_000 and then Value mod 1_000_000_000 = 0 then
      --  German glues the count on ("zwei­milliardste"), as it does for the
      --  thousands; CLDR 48 writes "zwei Milliardenste".
      return Before (Value / 1_000_000_000, "milliardste");
   elsif Locale = "de" and then Value >= 1_000_000 and then Value mod 1_000_000 = 0 then
      return Before (Value / 1_000_000, "millionste");
   else
      return Missing;
   end if;
end Ordinal_Override;
