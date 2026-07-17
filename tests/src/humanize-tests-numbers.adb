with AUnit.Assertions;

with Humanize.Contexts;
with Humanize.Locales;
with Humanize.Numbers;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Numbers is

   use Humanize.Numbers;
   use Humanize.Status;

   --  UTF-8 masculine/feminine ordinal indicators (U+00BA / U+00AA).
   ORDM : constant String :=
     Character'Val (16#C2#) & Character'Val (16#BA#);
   FEMORD : constant String :=
     Character'Val (16#C2#) & Character'Val (16#AA#);
   NNBSP : constant String :=
     Character'Val (16#E2#) & Character'Val (16#80#)
     & Character'Val (16#AF#);
   U_E_Acute : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A9#);
   U_E_Circumflex : constant String :=
     Character'Val (16#C3#) & Character'Val (16#AA#);
   U_E_Grave : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A8#);
   U_E_Umlaut : constant String :=
     Character'Val (16#C3#) & Character'Val (16#AB#);
   U_A_Ring : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A5#);
   U_A_Umlaut : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A4#);
   U_I_Acute : constant String :=
     Character'Val (16#C3#) & Character'Val (16#AD#);
   U_I_Dotless : constant String :=
     Character'Val (16#C4#) & Character'Val (16#B1#);
   U_O_Acute : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B3#);
   U_A_Tilde : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A3#);
   U_C_Cedilla : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A7#);
   U_U_Umlaut : constant String :=
     Character'Val (16#C3#) & Character'Val (16#BC#);
   U_O_Umlaut : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B6#);
   U_O_Slash : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B8#);
   U_S_Cedilla : constant String :=
     Character'Val (16#C5#) & Character'Val (16#9F#);

   function U (Code : Natural) return String is
   begin
      if Code <= 16#7F# then
         return String'(1 => Character'Val (Code));
      elsif Code <= 16#7FF# then
         return Character'Val (16#C0# + Code / 64)
           & Character'Val (16#80# + Code mod 64);
      elsif Code <= 16#FFFF# then
         return Character'Val (16#E0# + Code / 4_096)
           & Character'Val (16#80# + (Code / 64) mod 64)
           & Character'Val (16#80# + Code mod 64);
      else
         return Character'Val (16#F0# + Code / 262_144)
           & Character'Val (16#80# + (Code / 4_096) mod 64)
           & Character'Val (16#80# + (Code / 64) mod 64)
           & Character'Val (16#80# + Code mod 64);
      end if;
   end U;

   procedure Check_Ordinal_F
     (Context  : Humanize.Contexts.Context;
      Value    : Natural;
      Expected : String;
      Message  : String)
   is
      Result : constant Text_Result := Ordinal (Context, Value, Feminine);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check_Ordinal_F;

   procedure Test_Ordinal_Gender (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      --  Romance feminine ordinals differ from the masculine form.
      Check_Ordinal_F (Support.Fr, 1, "1re", "French feminine 1re");
      Check_Ordinal_F (Support.Fr, 2, "2e", "French feminine 2e");
      Check_Ordinal_F (Support.Es, 1, "1." & FEMORD, "Spanish feminine 1.a");
      Check_Ordinal_F (Support.It, 1, "1" & FEMORD, "Italian feminine 1a");
      --  English has no gender distinction.
      Check_Ordinal_F (Support.En, 1, "1st", "English feminine == masculine");
   end Test_Ordinal_Gender;

   procedure Check_Ordinal
     (Context  : Humanize.Contexts.Context;
      Value    : Natural;
      Expected : String;
      Message  : String)
   is
      Result : constant Text_Result := Ordinal (Context, Value);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check_Ordinal;

   procedure Check_Compact
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Long_Integer;
      Expected : String;
      Message  : String)
   is
      Result : constant Text_Result := Compact (Context, Value);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check_Compact;

   procedure Check_Regional_Cardinal_Fallbacks is
   begin
      for Locale_Access of Humanize.Locales.Regional_Shipped_Locales loop
         declare
            Locale : constant String := Locale_Access.all;
            Base : constant String := Humanize.Locales.Base_Locale (Locale);
            Regional_Result : constant Text_Result :=
              Locale_Cardinal (Support.Locale (Locale), 2_345);
            Base_Result : constant Text_Result :=
              Locale_Cardinal (Support.Locale (Base), 2_345);
         begin
            AUnit.Assertions.Assert
              (Regional_Result.Status = Ok
               and then Base_Result.Status = Ok
               and then Support.Text (Regional_Result) = Support.Text (Base_Result),
               "regional locale cardinal fallback " & Locale & " -> " & Base);
         end;
      end loop;
   end Check_Regional_Cardinal_Fallbacks;

   procedure Check_Regional_Spellout_Tier_Fallbacks is
   begin
      for Locale_Access of Humanize.Locales.Regional_Shipped_Locales loop
         declare
            Locale : constant String := Locale_Access.all;
            Base : constant String := Humanize.Locales.Base_Locale (Locale);
         begin
            AUnit.Assertions.Assert
              (Spellout_Locale_Tier_For (Support.Locale (Locale)) =
               Spellout_Locale_Tier_For (Support.Locale (Base)),
               "regional spellout tier fallback " & Locale & " -> " & Base);
         end;
      end loop;
   end Check_Regional_Spellout_Tier_Fallbacks;

   procedure Test_Ordinal_English (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check_Ordinal (Support.En, 1, "1st", "1st");
      Check_Ordinal (Support.En, 2, "2nd", "2nd");
      Check_Ordinal (Support.En, 3, "3rd", "3rd");
      Check_Ordinal (Support.En, 4, "4th", "4th");
      Check_Ordinal (Support.En, 11, "11th", "11th (teen)");
      Check_Ordinal (Support.En, 21, "21st", "21st");
      Check_Ordinal (Support.En, 22, "22nd", "22nd");
      Check_Ordinal (Support.En, 23, "23rd", "23rd");
   end Test_Ordinal_English;

   procedure Test_Cardinal_Fractional (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Four : constant Text_Result := Cardinal (Support.En, 4);
      Large : constant Text_Result := Cardinal (Support.En, 12_345);
      Third : constant Text_Result :=
        Fractional (Support.En, 1.0 / 3.0);
      Mixed : constant Text_Result := Fractional (Support.En, 1.5);
      Signed : constant Text_Result :=
        Signed_Cardinal (Support.En, -1_234_567);
      Localized : constant Text_Result := Locale_Cardinal (Support.De, 5);
      Spanish_Localized : constant Text_Result :=
        Locale_Cardinal (Support.Es, 16);
      Dutch_Localized : constant Text_Result :=
        Locale_Cardinal (Support.Nl, 20);
      German_Expanded : constant Text_Result :=
        Locale_Cardinal (Support.De, 42);
      German_Hundreds : constant Text_Result :=
        Locale_Cardinal (Support.De, 342);
      French_Compound : constant Text_Result :=
        Locale_Cardinal (Support.Fr, 271);
      Spanish_Compound : constant Text_Result :=
        Locale_Cardinal (Support.Es, 126);
      Italian_Compound : constant Text_Result :=
        Locale_Cardinal (Support.It, 21);
      Portuguese_Compound : constant Text_Result :=
        Locale_Cardinal (Support.Pt, 33);
      Danish_Thousand : constant Text_Result :=
        Locale_Cardinal (Support.Da, 1_000);
      Italian_Thousand : constant Text_Result :=
        Locale_Cardinal (Support.It, 1_000);
      Spanish_Million : constant Text_Result :=
        Locale_Cardinal (Support.Es, 1_000_000);
      Portuguese_Million : constant Text_Result :=
        Locale_Cardinal (Support.Pt, 1_000_000);
      Spanish_Billion : constant Text_Result :=
        Locale_Cardinal (Support.Es, 1_000_000_000);
      Danish_Hundred_One : constant Text_Result :=
        Locale_Cardinal (Support.Da, 101);
      Spanish_Five_Hundred : constant Text_Result :=
        Locale_Cardinal (Support.Es, 500);
      Italian_One_Eighty_One : constant Text_Result :=
        Locale_Cardinal (Support.It, 181);
      Portuguese_Nine_Ninety_Nine : constant Text_Result :=
        Locale_Cardinal (Support.Pt, 999);
      Dutch_Twenty_Two : constant Text_Result :=
        Locale_Cardinal (Support.Nl, 22);
      Dutch_Three_Forty_Two : constant Text_Result :=
        Locale_Cardinal (Support.Nl, 342);
      German_Two_Thousand : constant Text_Result :=
        Locale_Cardinal (Support.De, 2_000);
      Italian_Two_Thousand : constant Text_Result :=
        Locale_Cardinal (Support.It, 2_000);
      Dutch_Two_Thousand : constant Text_Result :=
        Locale_Cardinal (Support.Nl, 2_000);
      Swedish_Cardinal : constant Text_Result :=
        Locale_Cardinal (Support.Locale ("sv"), 2_345);
      Norwegian_Cardinal : constant Text_Result :=
        Locale_Cardinal (Support.Locale ("nb"), 2_345);
      Finnish_Cardinal : constant Text_Result :=
        Locale_Cardinal (Support.Locale ("fi-FI"), 2_345);
      Turkish_Cardinal : constant Text_Result :=
        Locale_Cardinal (Support.Locale ("tr-TR"), 2_345);
      Polish_Cardinal : constant Text_Result :=
        Locale_Cardinal (Support.Locale ("pl"), 2_345);
      Czech_Cardinal : constant Text_Result :=
        Locale_Cardinal (Support.Locale ("cs"), 2_345);
      Russian_Cardinal : constant Text_Result :=
        Locale_Cardinal (Support.Locale ("ru"), 2_345);
      Ukrainian_Cardinal : constant Text_Result :=
        Locale_Cardinal (Support.Locale ("uk"), 2_345);
      Japanese_Cardinal : constant Text_Result :=
        Locale_Cardinal (Support.Locale ("ja"), 2_345);
      Korean_Cardinal : constant Text_Result :=
        Locale_Cardinal (Support.Locale ("ko"), 2_345);
      Chinese_Cardinal : constant Text_Result :=
        Locale_Cardinal (Support.Locale ("zh"), 2_345);
      Arabic_Cardinal : constant Text_Result :=
        Locale_Cardinal (Support.Locale ("ar"), 2_345);
      Hindi_Cardinal : constant Text_Result :=
        Locale_Cardinal (Support.Locale ("hi"), 2_345);
      Scientific : constant Text_Result :=
        Scientific_Notation (Support.En, 1_234_000.0,
                             (Maximum_Fraction_Digits => 2,
                              Suppress_Trailing_Zero => True));
      Engineering_Text : constant Text_Result :=
        Scientific_Notation (Support.En, 12_340.0,
                             (Maximum_Fraction_Digits => 2,
                              Suppress_Trailing_Zero => True),
                             Humanize.Numbers.Engineering);
      Currency_Result : constant Text_Result :=
        Currency (Support.En, 12.5, "USD");
      Approx_Currency : constant Text_Result :=
        Approximate_Currency (Support.En, 12.5, "USD", Under);
      German_Thousands : constant Text_Result :=
        Locale_Cardinal (Support.De, 1_342);
      French_Billions : constant Text_Result :=
        Locale_Cardinal (Support.Fr, 2_000_000_001);
      Decimal_Text : constant Text_Result :=
        Decimal_Words (Support.En, 12.5, 2);
      German_Decimal_Text : constant Text_Result :=
        Decimal_Words (Support.De, 12.5, 2);
      German_Regional_Decimal_Text : constant Text_Result :=
        Decimal_Words (Support.Locale ("DE_at"), 12.5, 2);
      Swedish_Decimal_Text : constant Text_Result :=
        Decimal_Words (Support.Locale ("sv"), 12.5, 2);
      Finnish_Decimal_Text : constant Text_Result :=
        Decimal_Words (Support.Locale ("fi"), 12.5, 2);
      Turkish_Decimal_Text : constant Text_Result :=
        Decimal_Words (Support.Locale ("tr"), 12.5, 2);
      Polish_Decimal_Text : constant Text_Result :=
        Decimal_Words (Support.Locale ("pl"), 12.5, 2);
      Japanese_Decimal_Text : constant Text_Result :=
        Decimal_Words (Support.Locale ("ja"), 12.5, 2);
      Arabic_Decimal_Text : constant Text_Result :=
        Decimal_Words (Support.Locale ("ar"), 12.5, 2);
      Hindi_Decimal_Text : constant Text_Result :=
        Decimal_Words (Support.Locale ("hi"), 12.5, 2);
      Fraction_Text : constant Text_Result :=
        Fraction_Words (Support.En, 3, 4);
      French_Fraction_Text : constant Text_Result :=
        Fraction_Words (Support.Fr, 3, 4);
      French_Regional_Fraction_Text : constant Text_Result :=
        Fraction_Words (Support.Locale ("FR_ca"), 3, 4);
      Swedish_Fraction_Text : constant Text_Result :=
        Fraction_Words (Support.Locale ("sv"), 3, 4);
      Norwegian_Fraction_Text : constant Text_Result :=
        Fraction_Words (Support.Locale ("nb"), 3, 4);
      Finnish_Fraction_Text : constant Text_Result :=
        Fraction_Words (Support.Locale ("fi"), 3, 4);
      Turkish_Fraction_Text : constant Text_Result :=
        Fraction_Words (Support.Locale ("tr"), 3, 4);
      Polish_Fraction_Text : constant Text_Result :=
        Fraction_Words (Support.Locale ("pl"), 3, 4);
      Japanese_Fraction_Text : constant Text_Result :=
        Fraction_Words (Support.Locale ("ja"), 3, 4);
      Arabic_Fraction_Text : constant Text_Result :=
        Fraction_Words (Support.Locale ("ar"), 3, 4);
      Hindi_Fraction_Text : constant Text_Result :=
        Fraction_Words (Support.Locale ("hi"), 3, 4);
      Ordinal_Text : constant Text_Result :=
        Ordinal_Words (Support.En, 21);
      German_Ordinal_Text : constant Text_Result :=
        Ordinal_Words (Support.De, 21);
      German_Regional_Ordinal_Text : constant Text_Result :=
        Ordinal_Words (Support.Locale ("DE_at"), 21);
      Dutch_Ordinal_Text : constant Text_Result :=
        Ordinal_Words (Support.Nl, 21);
      French_Ordinal_Seventeen : constant Text_Result :=
        Ordinal_Words (Support.Fr, 17);
      Danish_Ordinal_Eleven : constant Text_Result :=
        Ordinal_Words (Support.Da, 11);
      Spanish_Ordinal_Twelve : constant Text_Result :=
        Ordinal_Words (Support.Es, 12);
      Italian_Ordinal_Twenty : constant Text_Result :=
        Ordinal_Words (Support.It, 20);
      Portuguese_Ordinal_Twenty : constant Text_Result :=
        Ordinal_Words (Support.Pt, 20);
      Dutch_Ordinal_Twelve : constant Text_Result :=
        Ordinal_Words (Support.Nl, 12);
      Swedish_Ordinal_Twelve : constant Text_Result :=
        Ordinal_Words (Support.Locale ("sv"), 12);
      Swedish_Ordinal_Thirty : constant Text_Result :=
        Ordinal_Words (Support.Locale ("sv"), 30);
      Norwegian_Ordinal_Twelve : constant Text_Result :=
        Ordinal_Words (Support.Locale ("no"), 12);
      Finnish_Ordinal_Twelve : constant Text_Result :=
        Ordinal_Words (Support.Locale ("fi"), 12);
      Turkish_Ordinal_Twelve : constant Text_Result :=
        Ordinal_Words (Support.Locale ("tr"), 12);
      Turkish_Ordinal_Thirty : constant Text_Result :=
        Ordinal_Words (Support.Locale ("tr"), 30);
      Polish_Ordinal_Twelve : constant Text_Result :=
        Ordinal_Words (Support.Locale ("pl"), 12);
      Polish_Ordinal_Twenty_One : constant Text_Result :=
        Ordinal_Words (Support.Locale ("pl"), 21);
      Polish_Ordinal_Thirty : constant Text_Result :=
        Ordinal_Words (Support.Locale ("pl"), 30);
      Polish_Ordinal_One_Twenty_One : constant Text_Result :=
        Ordinal_Words (Support.Locale ("pl"), 121);
      Polish_Ordinal_Two_Thousand_Three_Forty_Five : constant Text_Result :=
        Ordinal_Words (Support.Locale ("pl"), 2_345);
      Czech_Ordinal_Twenty_One : constant Text_Result :=
        Ordinal_Words (Support.Locale ("cs"), 21);
      Czech_Ordinal_Thirty : constant Text_Result :=
        Ordinal_Words (Support.Locale ("cs"), 30);
      Russian_Ordinal_Twenty_One : constant Text_Result :=
        Ordinal_Words (Support.Locale ("ru"), 21);
      Japanese_Ordinal_Twelve : constant Text_Result :=
        Ordinal_Words (Support.Locale ("ja"), 12);
      Arabic_Ordinal_Twelve : constant Text_Result :=
        Ordinal_Words (Support.Locale ("ar"), 12);
      Arabic_Ordinal_Twenty_One : constant Text_Result :=
        Ordinal_Words (Support.Locale ("ar"), 21);
      Hindi_Ordinal_Twelve : constant Text_Result :=
        Ordinal_Words (Support.Locale ("hi"), 12);
      Hindi_Ordinal_Twenty_One : constant Text_Result :=
        Ordinal_Words (Support.Locale ("hi"), 21);
      Currency_Text : constant Text_Result :=
        Currency_Words (Support.En, 12.50, "dollar", "cent", 2);
      German_Currency_Text : constant Text_Result :=
        Currency_Words (Support.De, 12.50, "Euro", "Cent", 2);
      German_Regional_Currency_Text : constant Text_Result :=
        Currency_Words (Support.Locale ("DE_at"), 12.50, "Euro", "Cent", 2);
      Danish_Currency_Text : constant Text_Result :=
        Currency_Words (Support.Da, 12.50, "krone", U_O_Acute & "re", 2);
      Norwegian_Regional_Currency_Text : constant Text_Result :=
        Currency_Words (Support.Locale ("NB_no"), 12.50, "krone", U_O_Acute & "re", 2);
      Percent_Text : constant Text_Result :=
        Percent_Words (Support.En, 12.5, 1);
      Accessible_Text : constant Text_Result :=
        Accessible_Number (Support.En, -42);
      Spellout_Meta : constant Text_Result := Spellout_Coverage;
      English_Tier : constant Text_Result :=
        Spellout_Locale_Tier_Label (Spellout_Locale_Tier_For (Support.En));
      Native_Tier : constant Text_Result :=
        Spellout_Locale_Tier_Label (Spellout_Locale_Tier_For (Support.De));
      Regional_Native_Tier : constant Text_Result :=
        Spellout_Locale_Tier_Label
          (Spellout_Locale_Tier_For (Support.Locale ("DE_at")));
      Generated_Tier : constant Text_Result :=
        Spellout_Locale_Tier_Label
          (Spellout_Locale_Tier_For (Support.Locale ("sv")));
      Fallback_Tier : constant Text_Result :=
        Spellout_Locale_Tier_Label
          (Spellout_Locale_Tier_For (Support.Locale ("zz")));
   begin
      AUnit.Assertions.Assert
        (Four.Status = Ok and then Support.Text (Four) = "four",
         "cardinal small number");
      AUnit.Assertions.Assert
        (Large.Status = Ok
         and then Support.Text (Large) = "twelve thousand three hundred forty-five",
         "cardinal thousands");
      AUnit.Assertions.Assert
        (Third.Status = Ok and then Support.Text (Third) = "333/1000",
         "fractional third approximates with default denominator");
      AUnit.Assertions.Assert
        (Mixed.Status = Ok and then Support.Text (Mixed) = "1 1/2",
         "mixed fraction");
      AUnit.Assertions.Assert
        (Signed.Status = Ok
         and then Support.Text (Signed)
           = "minus one million two hundred thirty-four thousand five hundred sixty-seven",
         "signed large cardinal");
      AUnit.Assertions.Assert
        (Localized.Status = Ok
         and then Support.Text (Localized) = "f" & U_U_Umlaut & "nf",
         "limited locale cardinal");
      AUnit.Assertions.Assert
        (Spanish_Localized.Status = Ok
         and then Support.Text (Spanish_Localized) = "diecis" & U_E_Acute & "is",
         "Spanish limited locale cardinal");
      AUnit.Assertions.Assert
        (Dutch_Localized.Status = Ok
         and then Support.Text (Dutch_Localized) = "twintig",
         "Dutch limited locale cardinal");
      AUnit.Assertions.Assert
        (German_Expanded.Status = Ok
         and then Support.Text (German_Expanded) = "zweiundvierzig",
         "expanded locale cardinal");
      AUnit.Assertions.Assert
        (German_Hundreds.Status = Ok
         and then Support.Text (German_Hundreds) = "dreihundertzweiundvierzig",
         "expanded hundreds locale cardinal");
      AUnit.Assertions.Assert
        (French_Compound.Status = Ok
         and then Support.Text (French_Compound) = "deux cent soixante-et-onze",
         "native French compound cardinal");
      AUnit.Assertions.Assert
        (Spanish_Compound.Status = Ok
         and then Support.Text (Spanish_Compound)
           = "ciento veintis" & U_E_Acute & "is",
         "native Spanish compound cardinal");
      AUnit.Assertions.Assert
        (Italian_Compound.Status = Ok
         and then Support.Text (Italian_Compound) = "ventuno",
         "native Italian elided compound cardinal");
      AUnit.Assertions.Assert
        (Portuguese_Compound.Status = Ok
         and then Support.Text (Portuguese_Compound)
           = "trinta e tr" & U_E_Circumflex & "s",
         "native Portuguese compound cardinal");
      AUnit.Assertions.Assert
        (Danish_Thousand.Status = Ok
         and then Support.Text (Danish_Thousand) = "et tusind",
         "native Danish singular thousand");
      AUnit.Assertions.Assert
        (Italian_Thousand.Status = Ok
         and then Support.Text (Italian_Thousand) = "mille",
         "native Italian singular thousand");
      AUnit.Assertions.Assert
        (Spanish_Million.Status = Ok
         and then Support.Text (Spanish_Million) = "un mill" & U_O_Acute & "n",
         "native Spanish singular million");
      AUnit.Assertions.Assert
        (Portuguese_Million.Status = Ok
         and then Support.Text (Portuguese_Million)
           = "um milh" & U_A_Tilde & "o",
         "native Portuguese singular million");
      AUnit.Assertions.Assert
        (Spanish_Billion.Status = Ok
         and then Support.Text (Spanish_Billion) = "mil millones",
         "native Spanish singular billion phrase");
      AUnit.Assertions.Assert
        (Danish_Hundred_One.Status = Ok
         and then Support.Text (Danish_Hundred_One) = "et hundrede og en",
         "native Danish hundred connector");
      AUnit.Assertions.Assert
        (Spanish_Five_Hundred.Status = Ok
         and then Support.Text (Spanish_Five_Hundred) = "quinientos",
         "native Spanish irregular hundred");
      AUnit.Assertions.Assert
        (Italian_One_Eighty_One.Status = Ok
         and then Support.Text (Italian_One_Eighty_One) = "centottantuno",
         "native Italian cento elision");
      AUnit.Assertions.Assert
        (Portuguese_Nine_Ninety_Nine.Status = Ok
         and then Support.Text (Portuguese_Nine_Ninety_Nine)
           = "novecentos e noventa e nove",
         "native Portuguese hundred connector");
      AUnit.Assertions.Assert
        (Dutch_Twenty_Two.Status = Ok
         and then Support.Text (Dutch_Twenty_Two)
           = "twee" & U_E_Umlaut & "ntwintig",
         "native Dutch diaeresis compound");
      AUnit.Assertions.Assert
        (Dutch_Three_Forty_Two.Status = Ok
         and then Support.Text (Dutch_Three_Forty_Two)
           = "driehonderdtwee" & U_E_Umlaut & "nveertig",
         "native Dutch hundred compound");
      AUnit.Assertions.Assert
        (German_Two_Thousand.Status = Ok
         and then Support.Text (German_Two_Thousand) = "zweitausend",
         "native German compound thousand");
      AUnit.Assertions.Assert
        (Italian_Two_Thousand.Status = Ok
         and then Support.Text (Italian_Two_Thousand) = "duemila",
         "native Italian compound thousand");
      AUnit.Assertions.Assert
        (Dutch_Two_Thousand.Status = Ok
         and then Support.Text (Dutch_Two_Thousand) = "tweeduizend",
         "native Dutch compound thousand");
      AUnit.Assertions.Assert
        (Swedish_Cardinal.Status = Ok
         and then Support.Text (Swedish_Cardinal)
           = "tv" & U_A_Ring & " tusen tre hundra fyrtiofem",
         "generated Swedish locale cardinal");
      AUnit.Assertions.Assert
        (Norwegian_Cardinal.Status = Ok
         and then Support.Text (Norwegian_Cardinal)
           = "to tusen tre hundre f" & U_O_Slash & "rtifem",
         "generated Norwegian locale cardinal");
      Check_Regional_Cardinal_Fallbacks;
      AUnit.Assertions.Assert
        (Finnish_Cardinal.Status = Ok
         and then Support.Text (Finnish_Cardinal)
           = "kaksi tuhatta kolmesatanelj" & U_A_Umlaut
             & "kymment" & U_A_Umlaut & "viisi",
         "generated Finnish locale cardinal");
      AUnit.Assertions.Assert
        (Turkish_Cardinal.Status = Ok
         and then Support.Text (Turkish_Cardinal)
           = "iki bin " & U_U_Umlaut & U_C_Cedilla & " y"
             & U_U_Umlaut & "z k" & U_I_Dotless & "rk be"
             & U_S_Cedilla,
         "generated Turkish locale cardinal");
      AUnit.Assertions.Assert
        (Polish_Cardinal.Status = Ok
         and then Support.Text (Polish_Cardinal)
           = "dwa tysi" & U (16#105#) & "ce trzysta czterdzie"
             & U (16#15B#) & "ci pi" & U (16#119#) & U (16#107#),
         "generated Polish locale cardinal");
      AUnit.Assertions.Assert
        (Czech_Cardinal.Status = Ok
         and then Support.Text (Czech_Cardinal)
           = "dva tis" & U (16#ED#) & "ce t" & U (16#159#)
             & "i sta " & U (16#10D#) & "ty" & U (16#159#)
             & "icet p" & U (16#11B#) & "t",
         "generated Czech locale cardinal");
      AUnit.Assertions.Assert
        (Russian_Cardinal.Status = Ok
         and then Support.Text (Russian_Cardinal)'Length > 0,
         "generated Russian locale cardinal");
      AUnit.Assertions.Assert
        (Ukrainian_Cardinal.Status = Ok
         and then Support.Text (Ukrainian_Cardinal)'Length > 0,
         "generated Ukrainian locale cardinal");
      AUnit.Assertions.Assert
        (Japanese_Cardinal.Status = Ok
         and then Support.Text (Japanese_Cardinal)
           = U (16#4E8C#) & U (16#5343#) & U (16#4E09#)
             & U (16#767E#) & U (16#56DB#) & U (16#5341#)
             & U (16#4E94#),
         "generated Japanese locale cardinal");
      AUnit.Assertions.Assert
        (Korean_Cardinal.Status = Ok
         and then Support.Text (Korean_Cardinal)
           = U (16#C774#) & U (16#CC9C#) & U (16#C0BC#)
             & U (16#BC31#) & U (16#C0AC#) & U (16#C2ED#)
             & U (16#C624#),
         "generated Korean locale cardinal");
      AUnit.Assertions.Assert
        (Chinese_Cardinal.Status = Ok
         and then Support.Text (Chinese_Cardinal)
           = U (16#4E8C#) & U (16#5343#) & U (16#4E09#)
             & U (16#767E#) & U (16#56DB#) & U (16#5341#)
             & U (16#4E94#),
         "generated Chinese locale cardinal");
      AUnit.Assertions.Assert
        (Arabic_Cardinal.Status = Ok
         and then Support.Text (Arabic_Cardinal)'Length > 0,
         "generated Arabic locale cardinal");
      AUnit.Assertions.Assert
        (Hindi_Cardinal.Status = Ok
         and then Support.Text (Hindi_Cardinal)'Length > 0,
         "generated Hindi locale cardinal");
      AUnit.Assertions.Assert
        (Scientific.Status = Ok and then Support.Text (Scientific) = "1.23e6",
         "scientific notation");
      AUnit.Assertions.Assert
        (Engineering_Text.Status = Ok
         and then Support.Text (Engineering_Text) = "12.34E3",
         "engineering notation");
      AUnit.Assertions.Assert
        (Currency_Result.Status = Ok
         and then Support.Text (Currency_Result) = "12.5 USD",
         "deterministic currency phrase");
      AUnit.Assertions.Assert
        (Approx_Currency.Status = Ok
         and then Support.Text (Approx_Currency) = "under 12.5 USD",
         "approximate currency phrase");
      AUnit.Assertions.Assert
        (German_Thousands.Status = Ok
         and then Support.Text (German_Thousands)
           = "eintausenddreihundertzweiundvierzig",
         "locale cardinal expands beyond 999");
      AUnit.Assertions.Assert
        (French_Billions.Status = Ok
         and then Support.Text (French_Billions) = "deux milliards un",
         "locale cardinal expands through billions");
      AUnit.Assertions.Assert
        (Decimal_Text.Status = Ok
         and then Support.Text (Decimal_Text) = "twelve point five zero",
         "decimal words");
      AUnit.Assertions.Assert
        (German_Decimal_Text.Status = Ok
         and then Support.Text (German_Decimal_Text)
           = "zw" & U_O_Umlaut & "lf komma f" & U_U_Umlaut & "nf null",
         "locale decimal words");
      AUnit.Assertions.Assert
        (German_Regional_Decimal_Text.Status = Ok
         and then Support.Text (German_Regional_Decimal_Text)
           = "zw" & U_O_Umlaut & "lf komma f" & U_U_Umlaut & "nf null",
         "regional German decimal words use language-code fallback");
      AUnit.Assertions.Assert
        (Swedish_Decimal_Text.Status = Ok
         and then Support.Text (Swedish_Decimal_Text)
           = "tolv komma fem noll",
         "generated Swedish decimal words");
      AUnit.Assertions.Assert
        (Finnish_Decimal_Text.Status = Ok
         and then Support.Text (Finnish_Decimal_Text)
           = "kaksitoista pilkku viisi nolla",
         "generated Finnish decimal words");
      AUnit.Assertions.Assert
        (Turkish_Decimal_Text.Status = Ok
         and then Support.Text (Turkish_Decimal_Text)
           = "on iki virg" & U_U_Umlaut & "l be" & U_S_Cedilla
             & " s" & U_I_Dotless & "f" & U_I_Dotless & "r",
         "generated Turkish decimal words");
      AUnit.Assertions.Assert
        (Polish_Decimal_Text.Status = Ok
         and then Support.Text (Polish_Decimal_Text)
           = "dwana" & U (16#15B#) & "cie przecinek pi"
             & U (16#119#) & U (16#107#) & " zero",
         "generated Polish decimal words");
      AUnit.Assertions.Assert
        (Japanese_Decimal_Text.Status = Ok
         and then Support.Text (Japanese_Decimal_Text)
           = U (16#5341#) & U (16#4E8C#) & " " & U (16#70B9#)
             & " " & U (16#4E94#) & " " & U (16#96F6#),
         "generated Japanese decimal words");
      AUnit.Assertions.Assert
        (Arabic_Decimal_Text.Status = Ok
         and then Support.Text (Arabic_Decimal_Text)'Length > 0,
         "generated Arabic decimal words");
      AUnit.Assertions.Assert
        (Hindi_Decimal_Text.Status = Ok
         and then Support.Text (Hindi_Decimal_Text)'Length > 0,
         "generated Hindi decimal words");
      AUnit.Assertions.Assert
        (Fraction_Text.Status = Ok
         and then Support.Text (Fraction_Text) = "three quarters",
         "fraction words");
      AUnit.Assertions.Assert
        (French_Fraction_Text.Status = Ok
         and then Support.Text (French_Fraction_Text) = "trois quarts",
         "locale fraction words");
      AUnit.Assertions.Assert
        (French_Regional_Fraction_Text.Status = Ok
         and then Support.Text (French_Regional_Fraction_Text) = "trois quarts",
         "regional French fraction words use language-code fallback");
      AUnit.Assertions.Assert
        (Swedish_Fraction_Text.Status = Ok
         and then Support.Text (Swedish_Fraction_Text)
           = "tre fj" & U_A_Umlaut & "rdedelar",
         "generated Swedish fraction words");
      AUnit.Assertions.Assert
        (Norwegian_Fraction_Text.Status = Ok
         and then Support.Text (Norwegian_Fraction_Text) = "tre fjerdedeler",
         "generated Norwegian fraction words");
      AUnit.Assertions.Assert
        (Finnish_Fraction_Text.Status = Ok
         and then Support.Text (Finnish_Fraction_Text)
           = "kolme nelj" & U_A_Umlaut & "sosaa",
         "generated Finnish fraction words");
      AUnit.Assertions.Assert
        (Turkish_Fraction_Text.Status = Ok
         and then Support.Text (Turkish_Fraction_Text)
           = "d" & U_O_Umlaut & "rtte " & U_U_Umlaut & U_C_Cedilla,
         "generated Turkish fraction words");
      AUnit.Assertions.Assert
        (Polish_Fraction_Text.Status = Ok
         and then Support.Text (Polish_Fraction_Text)
           = "trzy czwarte",
         "generated Polish fraction words");
      AUnit.Assertions.Assert
        (Japanese_Fraction_Text.Status = Ok
         and then Support.Text (Japanese_Fraction_Text)
           = U (16#56DB#) & U (16#5206#) & U (16#4E4B#)
             & U (16#4E00#) & U (16#4E09#),
         "generated Japanese fraction words");
      AUnit.Assertions.Assert
        (Arabic_Fraction_Text.Status = Ok
         and then Support.Text (Arabic_Fraction_Text)'Length > 0,
         "generated Arabic fraction words");
      AUnit.Assertions.Assert
        (Hindi_Fraction_Text.Status = Ok
         and then Support.Text (Hindi_Fraction_Text)'Length > 0,
         "generated Hindi fraction words");
      AUnit.Assertions.Assert
        (Ordinal_Text.Status = Ok
         and then Support.Text (Ordinal_Text) = "twenty-first",
         "ordinal words");
      AUnit.Assertions.Assert
        (German_Ordinal_Text.Status = Ok
         and then Support.Text (German_Ordinal_Text) = "einundzwanzigste",
         "locale ordinal words");
      AUnit.Assertions.Assert
        (German_Regional_Ordinal_Text.Status = Ok
         and then Support.Text (German_Regional_Ordinal_Text) = "einundzwanzigste",
         "regional German ordinal words use language-code fallback");
      AUnit.Assertions.Assert
        (Dutch_Ordinal_Text.Status = Ok
         and then Support.Text (Dutch_Ordinal_Text) = "eenentwintigste",
         "Dutch locale ordinal words");
      AUnit.Assertions.Assert
        (French_Ordinal_Seventeen.Status = Ok
         and then Support.Text (French_Ordinal_Seventeen)
           = "dix-septi" & U_E_Grave & "me",
         "French direct teen ordinal words");
      AUnit.Assertions.Assert
        (Danish_Ordinal_Eleven.Status = Ok
         and then Support.Text (Danish_Ordinal_Eleven) = "ellevte",
         "Danish direct teen ordinal words");
      AUnit.Assertions.Assert
        (Spanish_Ordinal_Twelve.Status = Ok
         and then Support.Text (Spanish_Ordinal_Twelve)
           = "duod" & U_E_Acute & "cimo",
         "Spanish direct teen ordinal words");
      AUnit.Assertions.Assert
        (Italian_Ordinal_Twenty.Status = Ok
         and then Support.Text (Italian_Ordinal_Twenty) = "ventesimo",
         "Italian direct tens ordinal words");
      AUnit.Assertions.Assert
        (Portuguese_Ordinal_Twenty.Status = Ok
         and then Support.Text (Portuguese_Ordinal_Twenty)
           = "vig" & U_E_Acute & "simo",
         "Portuguese direct tens ordinal words");
      AUnit.Assertions.Assert
        (Dutch_Ordinal_Twelve.Status = Ok
         and then Support.Text (Dutch_Ordinal_Twelve) = "twaalfde",
         "Dutch direct teen ordinal words");
      AUnit.Assertions.Assert
        (Swedish_Ordinal_Twelve.Status = Ok
         and then Support.Text (Swedish_Ordinal_Twelve) = "tolfte",
         "generated Swedish direct teen ordinal words");
      AUnit.Assertions.Assert
        (Swedish_Ordinal_Thirty.Status = Ok
         and then Support.Text (Swedish_Ordinal_Thirty) = "trettionde",
         "generated Swedish exact tens ordinal words");
      AUnit.Assertions.Assert
        (Norwegian_Ordinal_Twelve.Status = Ok
         and then Support.Text (Norwegian_Ordinal_Twelve) = "tolvte",
         "generated Norwegian direct teen ordinal words");
      AUnit.Assertions.Assert
        (Finnish_Ordinal_Twelve.Status = Ok
         and then Support.Text (Finnish_Ordinal_Twelve) = "kahdestoista",
         "generated Finnish direct teen ordinal words");
      AUnit.Assertions.Assert
        (Turkish_Ordinal_Twelve.Status = Ok
         and then Support.Text (Turkish_Ordinal_Twelve) = "on ikinci",
         "generated Turkish direct teen ordinal words");
      AUnit.Assertions.Assert
        (Turkish_Ordinal_Thirty.Status = Ok
         and then Support.Text (Turkish_Ordinal_Thirty) = "otuzuncu",
         "generated Turkish exact tens ordinal words");
      AUnit.Assertions.Assert
        (Polish_Ordinal_Twelve.Status = Ok
         and then Support.Text (Polish_Ordinal_Twelve) = "dwunasty",
         "generated Polish direct teen ordinal words");
      AUnit.Assertions.Assert
        (Polish_Ordinal_Twenty_One.Status = Ok
         and then Support.Text (Polish_Ordinal_Twenty_One)
           = "dwadzie" & U (16#15B#) & "cia pierwszy",
         "generated Polish compound ordinal words");
      AUnit.Assertions.Assert
        (Polish_Ordinal_Thirty.Status = Ok
         and then Support.Text (Polish_Ordinal_Thirty) = "trzydziesty",
         "generated Polish exact tens ordinal words");
      AUnit.Assertions.Assert
        (Polish_Ordinal_One_Twenty_One.Status = Ok
         and then Support.Text (Polish_Ordinal_One_Twenty_One)
           = "sto dwadzie" & U (16#15B#) & "cia pierwszy",
         "generated Polish hundreds compound ordinal words");
      AUnit.Assertions.Assert
        (Polish_Ordinal_Two_Thousand_Three_Forty_Five.Status = Ok
         and then Support.Text (Polish_Ordinal_Two_Thousand_Three_Forty_Five)
           = "dwa tysi" & U (16#105#) & "ce trzysta czterdzie"
             & U (16#15B#) & "ci pi" & U (16#105#) & "ty",
         "generated Polish thousands compound ordinal words");
      AUnit.Assertions.Assert
        (Czech_Ordinal_Twenty_One.Status = Ok
         and then Support.Text (Czech_Ordinal_Twenty_One)
           = "dvacet prvn" & U (16#ED#),
         "generated Czech compound ordinal words");
      AUnit.Assertions.Assert
        (Czech_Ordinal_Thirty.Status = Ok
         and then Support.Text (Czech_Ordinal_Thirty)
           = "t" & U (16#159#) & "ic" & U (16#E1#) & "t" & U (16#FD#),
         "generated Czech exact tens ordinal words");
      AUnit.Assertions.Assert
        (Russian_Ordinal_Twenty_One.Status = Ok
         and then Support.Text (Russian_Ordinal_Twenty_One)
           /= Support.Text (Locale_Cardinal (Support.Locale ("ru"), 21)),
         "generated Russian compound ordinal words differ from cardinal");
      AUnit.Assertions.Assert
        (Japanese_Ordinal_Twelve.Status = Ok
         and then Support.Text (Japanese_Ordinal_Twelve)
           = U (16#7B2C#) & U (16#5341#) & U (16#4E8C#),
         "generated Japanese ordinal words");
      AUnit.Assertions.Assert
        (Arabic_Ordinal_Twelve.Status = Ok
         and then Support.Text (Arabic_Ordinal_Twelve)'Length > 0,
         "generated Arabic ordinal words");
      AUnit.Assertions.Assert
        (Arabic_Ordinal_Twenty_One.Status = Ok
         and then Support.Text (Arabic_Ordinal_Twenty_One)
           /= Support.Text (Locale_Cardinal (Support.Locale ("ar"), 21)),
         "generated Arabic compound ordinal words differ from cardinal");
      AUnit.Assertions.Assert
        (Hindi_Ordinal_Twelve.Status = Ok
         and then Support.Text (Hindi_Ordinal_Twelve)'Length > 0,
         "generated Hindi ordinal words");
      AUnit.Assertions.Assert
        (Hindi_Ordinal_Twenty_One.Status = Ok
         and then Support.Text (Hindi_Ordinal_Twenty_One)
           /= Support.Text (Locale_Cardinal (Support.Locale ("hi"), 21)),
         "generated Hindi compound ordinal words differ from cardinal");
      AUnit.Assertions.Assert
        (Currency_Text.Status = Ok
         and then Support.Text (Currency_Text) = "twelve dollars and fifty cents",
         "currency words");
      AUnit.Assertions.Assert
        (German_Currency_Text.Status = Ok
         and then Support.Text (German_Currency_Text)
           = "zw" & U_O_Umlaut & "lf Euro und f" & U_U_Umlaut & "nfzig Cent",
         "localized German currency words");
      AUnit.Assertions.Assert
        (German_Regional_Currency_Text.Status = Ok
         and then Support.Text (German_Regional_Currency_Text)
           = "zw" & U_O_Umlaut & "lf Euro und f" & U_U_Umlaut & "nfzig Cent",
         "regional German currency words use language-code fallback");
      AUnit.Assertions.Assert
        (Danish_Currency_Text.Status = Ok
         and then Support.Text (Danish_Currency_Text)
           = "tolv krone og halvtreds " & U_O_Acute & "re",
         "localized Danish currency words");
      AUnit.Assertions.Assert
        (Norwegian_Regional_Currency_Text.Status = Ok
         and then Support.Text (Norwegian_Regional_Currency_Text)
           = "tolv krone og femti " & U_O_Acute & "re",
         "regional Norwegian currency words use normalized conjunction");
      AUnit.Assertions.Assert
        (Percent_Text.Status = Ok
         and then Support.Text (Percent_Text) = "twelve point five percent",
         "percent words");
      AUnit.Assertions.Assert
        (Accessible_Text.Status = Ok
         and then Support.Text (Accessible_Text) = "minus forty-two",
         "accessible number words");
      AUnit.Assertions.Assert
         (Spellout_Meta.Status = Ok
         and then Support.Text (Spellout_Meta)
           = "deterministic-en locale-cardinal locale-decimal "
             & "locale-fraction locale-ordinal generated-locale-spellout "
             & "sv-no-nb-fi-tr-pl-cs-ru-uk-ja-ko-zh-ar-hi "
             & "ro-lt-sl-id-ms-eo-vi-sw-af-hu-sk "
             & "signed-cardinal currency percent editorial",
         "spellout coverage metadata");
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.En) = English_Spellout,
         "English spellout tier metadata");
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.De) = Native_Locale_Spellout,
         "native spellout tier metadata");
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.Locale ("nb"))
           = Generated_Locale_Spellout,
         "generated spellout tier metadata");
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.Locale ("PL_pl"))
           = Generated_Locale_Spellout
         and then Spellout_Locale_Tier_For (Support.Locale ("JA_jp"))
           = Generated_Locale_Spellout
         and then Spellout_Locale_Tier_For (Support.Locale ("AR_eg"))
           = Generated_Locale_Spellout
         and then Spellout_Locale_Tier_For (Support.Locale ("SK_sk"))
           = Generated_Locale_Spellout,
         "generated spellout tier normalizes case and regional tags");
      Check_Regional_Spellout_Tier_Fallbacks;
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.Locale ("pl"))
           = Generated_Locale_Spellout,
         "Polish generated spellout tier metadata");
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.Locale ("ro-RO"))
           = Generated_Locale_Spellout,
         "newer generated spellout tier metadata");
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.Locale ("lt"))
           = Generated_Locale_Spellout,
         "Lithuanian generated spellout tier metadata");
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.Locale ("sl"))
           = Generated_Locale_Spellout,
         "Slovenian generated spellout tier metadata");
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.Locale ("id"))
           = Generated_Locale_Spellout,
         "Indonesian generated spellout tier metadata");
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.Locale ("ms"))
           = Generated_Locale_Spellout,
         "Malay generated spellout tier metadata");
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.Locale ("eo"))
           = Generated_Locale_Spellout,
         "Esperanto generated spellout tier metadata");
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.Locale ("vi"))
           = Generated_Locale_Spellout,
         "Vietnamese generated spellout tier metadata");
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.Locale ("sw"))
           = Generated_Locale_Spellout,
         "Swahili generated spellout tier metadata");
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.Locale ("af"))
           = Generated_Locale_Spellout,
         "Afrikaans generated spellout tier metadata");
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.Locale ("hu"))
           = Generated_Locale_Spellout,
         "Hungarian generated spellout tier metadata");
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.Locale ("sk"))
           = Generated_Locale_Spellout,
         "Slovak generated spellout tier metadata");
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.Locale ("zz"))
           = English_Fallback_Spellout,
         "unknown fallback spellout tier metadata");
      AUnit.Assertions.Assert
        (English_Tier.Status = Ok
         and then Support.Text (English_Tier) = "english-spellout",
         "English spellout tier label");
      AUnit.Assertions.Assert
        (Native_Tier.Status = Ok
         and then Support.Text (Native_Tier) = "native-locale-spellout",
         "native spellout tier label");
      AUnit.Assertions.Assert
        (Regional_Native_Tier.Status = Ok
         and then Support.Text (Regional_Native_Tier) = "native-locale-spellout",
         "regional German spellout tier label uses language-code fallback");
      AUnit.Assertions.Assert
        (Generated_Tier.Status = Ok
         and then Support.Text (Generated_Tier) = "generated-locale-spellout",
         "generated spellout tier label");
      AUnit.Assertions.Assert
        (Fallback_Tier.Status = Ok
         and then Support.Text (Fallback_Tier) = "english-fallback-spellout",
         "fallback spellout tier label");
   end Test_Cardinal_Fractional;

   procedure Test_Ordinal_Other_Locales (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check_Ordinal (Support.De, 1, "1.", "German 1.");
      Check_Ordinal (Support.De, 21, "21.", "German 21.");
      Check_Ordinal (Support.Da, 2, "2.", "Danish 2.");
      Check_Ordinal (Support.Fr, 1, "1er", "French 1er");
      Check_Ordinal (Support.Fr, 2, "2e", "French 2e");
      Check_Ordinal (Support.Fr, 21, "21e", "French 21e");
      Check_Ordinal (Support.Es, 1, "1." & ORDM, "Spanish 1.o");
      Check_Ordinal (Support.It, 1, "1" & ORDM, "Italian 1o");
   end Test_Ordinal_Other_Locales;

   procedure Test_Compact_English (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check_Compact (Support.En, 999, "999", "below 1000 is plain");
      Check_Compact (Support.En, 1_000, "1K", "exactly 1000");
      Check_Compact (Support.En, 1_200, "1.2K", "1.2K");
      Check_Compact (Support.En, 1_500_000, "1.5M", "1.5M");
      Check_Compact (Support.En, 1_000_000_000, "1B", "1B");
      Check_Compact (Support.En, 1_000_000_000_000, "1T", "1T");
      Check_Compact (Support.En, -1_200, "-1.2K", "negative compact");
   end Test_Compact_English;

   procedure Test_Compact_Other_Locales (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      --  German/Danish use a comma decimal separator.
      Check_Compact (Support.De, 1_200, "1,2 Tsd.", "German thousand suffix");
      Check_Compact (Support.De, 1_000_000, "1 Mio.", "German million suffix");
      Check_Compact (Support.Da, 1_500, "1,5 t", "Danish comma decimal");
      Check_Compact (Support.Da, 1_000_000, "1 mio.", "Danish million suffix");
      Check_Compact (Support.Fr, 1_200, "1,2 k", "French thousand suffix");
      Check_Compact (Support.Fr, 1_000_000, "1 M", "French million suffix");

      declare
         Base       : constant Text_Result :=
           Compact (Support.Locale ("hi"), 1_200_000);
         Hyphenated : constant Text_Result :=
           Compact (Support.Locale ("hi-IN"), 1_200_000);
         Underscore : constant Text_Result :=
           Compact (Support.Locale ("hi_IN"), 1_200_000);
      begin
         AUnit.Assertions.Assert
           (Base.Status = Ok
            and then Hyphenated.Status = Ok
            and then Underscore.Status = Ok
            and then Support.Text (Hyphenated) = Support.Text (Base)
            and then Support.Text (Underscore) = Support.Text (Base),
            "Hindi regional compact tags use language-code fallback");
      end;
   end Test_Compact_Other_Locales;

   procedure Check_Long
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Long_Integer;
      Expected : String;
      Message  : String)
   is
      Result : constant Text_Result :=
        Compact (Context, Value, Default_Number_Options, Long);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check_Long;

   procedure Test_Compact_Long (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check_Long (Support.En, 1_500, "1.5 thousand", "en long thousand");
      Check_Long (Support.En, 1_200_000, "1.2 million", "en long million");
      Check_Long (Support.En, 2_000_000, "2 million", "en long 2 million");
      --  French pluralizes the scale word; comma decimal.
      Check_Long (Support.Fr, 1_200_000, "1,2 million", "fr long one");
      Check_Long (Support.Fr, 2_500_000, "2,5 millions", "fr long plural");
      --  German plural scale word, comma decimal.
      Check_Long (Support.De, 1_500_000, "1,5 Millionen", "de long");
   end Test_Compact_Long;

   procedure Test_Compact_Rollover (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check_Compact (Support.En, 999_499, "999.5K", "no rollover");
      --  Rounding must promote the tier instead of showing "1000K".
      Check_Compact (Support.En, 999_999, "1M", "999,999 rolls over to 1M");
      Check_Compact (Support.En, 999_950_000, "1B", "rolls over to 1B");
   end Test_Compact_Rollover;

   procedure Test_Count_Grouping (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      --  Count integers are formatted by i18n locale number rules.
      Check_Ordinal (Support.En, 1234, "1,234th", "English grouped ordinal");
      Check_Ordinal (Support.De, 1234, "1.234.", "German grouped ordinal");
      Check_Ordinal (Support.Fr, 1234, "1" & NNBSP & "234e",
                     "French grouped ordinal");
   end Test_Count_Grouping;

   procedure Check_Percent
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Float;
      Expected : String;
      Message  : String)
   is
      Result : constant Text_Result := Percent (Context, Value);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check_Percent;

   procedure Test_Percent (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check_Percent (Support.En, 50.0, "50%", "en whole percent");
      Check_Percent (Support.En, 12.5, "12.5%", "en fractional percent");
      Check_Percent (Support.De, 12.5, "12,5%", "de comma decimal percent");
      Check_Percent (Support.Fr, 50.0, "50 %", "fr spaces the percent sign");
   end Test_Percent;

   procedure Test_Editorial_Numbers
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Small : constant Text_Result := Editorial_Number (Support.En, 9);
      Large : constant Text_Result := Editorial_Number (Support.En, 10);
      Grouped : constant Text_Result := Editorial_Number (Support.En, 12_345);
      Negative_Small : constant Text_Result := Editorial_Number (Support.En, -4);
      Negative_Large : constant Text_Result := Editorial_Number (Support.En, -14);
      Age : constant Text_Result := Editorial_Age (Support.En, 5);
      Measurement : constant Text_Result :=
        Editorial_Measurement (Support.En, 5.5, "miles");
      Percent_Text : constant Text_Result :=
        Editorial_Percent (Support.En, 5.0);
      Percent_Word : constant Text_Result :=
        Editorial_Percent (Support.En, 5.0, Include_Symbol => False);
      Small_Ordinal : constant Text_Result :=
        Editorial_Ordinal (Support.En, 3);
      Large_Ordinal : constant Text_Result :=
        Editorial_Ordinal (Support.En, 11);
      Grouped_Ordinal : constant Text_Result :=
        Editorial_Ordinal (Support.En, 1_021);
      Generic_Ordinal : constant Text_Result :=
        Editorial_Number (Support.En, 22, Ordinal_Number);
      Headline_Word : constant Text_Result :=
        Editorial_Number
          (Support.En, 12, Headline_Number,
           (Spell_Out_Below => 10,
            Headline_Spell_Out_Below => 13,
            Group_Digits => True,
            Spell_Zero => True));
      Headline_Digit : constant Text_Result :=
        Editorial_Number
          (Support.En, 13, Headline_Number,
           (Spell_Out_Below => 10,
            Headline_Spell_Out_Below => 13,
            Group_Digits => True,
            Spell_Zero => True));
      No_Group : constant Text_Result :=
        Editorial_Number
          (Support.En, 12_345, General_Number,
           (Spell_Out_Below => 10,
            Headline_Spell_Out_Below => 10,
            Group_Digits => False,
            Spell_Zero => True));
      Custom_Spell : constant Text_Result :=
        Editorial_Number
          (Support.En, 42, General_Number,
           (Spell_Out_Below => 100,
            Headline_Spell_Out_Below => 10,
            Group_Digits => True,
            Spell_Zero => True));
      Invalid_Ordinal : constant Text_Result :=
        Editorial_Number (Support.En, -1, Ordinal_Number);
      Buffer : String (1 .. 32);
      Written : Natural;
      Code : Status_Code;
   begin
      AUnit.Assertions.Assert
        (Small.Status = Ok and then Support.Text (Small) = "nine",
         "editorial small cardinal words");
      AUnit.Assertions.Assert
        (Large.Status = Ok and then Support.Text (Large) = "10",
         "editorial 10 uses digits");
      AUnit.Assertions.Assert
        (Grouped.Status = Ok and then Support.Text (Grouped) = "12,345",
         "editorial grouped digits");
      AUnit.Assertions.Assert
        (Negative_Small.Status = Ok
         and then Support.Text (Negative_Small) = "minus four",
         "editorial negative small words");
      AUnit.Assertions.Assert
        (Negative_Large.Status = Ok and then Support.Text (Negative_Large) = "-14",
         "editorial negative large digits");
      AUnit.Assertions.Assert
        (Age.Status = Ok and then Support.Text (Age) = "5 years old",
         "editorial age uses digits");
      AUnit.Assertions.Assert
        (Measurement.Status = Ok and then Support.Text (Measurement) = "5.5 miles",
         "editorial measurement uses digits");
      AUnit.Assertions.Assert
        (Percent_Text.Status = Ok and then Support.Text (Percent_Text) = "5%",
         "editorial percent symbol");
      AUnit.Assertions.Assert
        (Percent_Word.Status = Ok and then Support.Text (Percent_Word) = "5 percent",
         "editorial percent word");
      AUnit.Assertions.Assert
        (Small_Ordinal.Status = Ok
         and then Support.Text (Small_Ordinal) = "third",
         "editorial small ordinal words");
      AUnit.Assertions.Assert
        (Large_Ordinal.Status = Ok and then Support.Text (Large_Ordinal) = "11th",
         "editorial large ordinal digits");
      AUnit.Assertions.Assert
        (Grouped_Ordinal.Status = Ok
         and then Support.Text (Grouped_Ordinal) = "1,021st",
         "editorial grouped ordinal");
      AUnit.Assertions.Assert
        (Generic_Ordinal.Status = Ok
         and then Support.Text (Generic_Ordinal) = "22nd",
         "editorial generic ordinal usage");
      AUnit.Assertions.Assert
        (Headline_Word.Status = Ok
         and then Support.Text (Headline_Word) = "twelve",
         "editorial headline custom word threshold");
      AUnit.Assertions.Assert
        (Headline_Digit.Status = Ok
         and then Support.Text (Headline_Digit) = "13",
         "editorial headline threshold boundary");
      AUnit.Assertions.Assert
        (No_Group.Status = Ok and then Support.Text (No_Group) = "12345",
         "editorial grouping can be disabled");
      AUnit.Assertions.Assert
        (Custom_Spell.Status = Ok
         and then Support.Text (Custom_Spell) = "forty-two",
         "editorial custom spell threshold");
      AUnit.Assertions.Assert
        (Invalid_Ordinal.Status = Invalid_Value,
         "editorial ordinal rejects negatives");

      Editorial_Number_Into (Support.En, 1_234, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "1,234",
         "bounded editorial number");
      Editorial_Age_Into (Support.En, 7, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "7 years old",
         "bounded editorial age");
      Editorial_Percent_Into (Support.En, 12.5, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "12.5%",
         "bounded editorial percent");
   end Test_Editorial_Numbers;

   procedure Test_Number_Bounded (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Buffer  : String (1 .. 16);
      Written : Natural;
      Code    : Status_Code;
      Range_Text : constant Text_Result := Number_Range (Support.En, 1, 5);
      Spaced_Range : constant Text_Result :=
        Number_Range (Support.En, 1, 5,
                      (Separator => ':', Spaces_Around => True));
      Approx_Range : constant Text_Result :=
        Approximate_Range (Support.En, 10, 20);
      Under_Text : constant Text_Result := Under_Number (Support.En, 5);
      German_Regional_Under : constant Text_Result :=
        Under_Number (Support.Locale ("DE_at"), 5);
      Up_To_Text : constant Text_Result := Up_To (Support.En, 100);
      Between_Text : constant Text_Result := Between (Support.En, 3, 7);
      German_Regional_Between : constant Text_Result :=
        Between (Support.Locale ("DE_at"), 3, 7);
      Qualified_Inclusive : constant Text_Result :=
        Qualified_Range (Support.En, 3, 7);
      Qualified_Exclusive : constant Text_Result :=
        Qualified_Range (Support.En, 3, 7, Exclusive_Range);
      Qualified_Low_Only : constant Text_Result :=
        Qualified_Range (Support.En, 3, 7, Include_Low_Only);
      Qualified_High_Only : constant Text_Result :=
        Qualified_Range (Support.En, 3, 7, Include_High_Only);
      Invalid_Qualified : constant Text_Result :=
        Qualified_Range (Support.En, 7, 3);
      Tolerance_Text : constant Text_Result :=
        Tolerance_Range (Support.En, 10, 2);
      Decimal_Range_Text : constant Text_Result :=
        Decimal_Range (Support.En, 1.25, 3.5,
                       (Maximum_Fraction_Digits => 2,
                        Suppress_Trailing_Zero => True));
      Decimal_Range_Meta : constant Number_Render_Metadata :=
        Decimal_Range_Metadata
          (1.25, 3.5,
           (Maximum_Fraction_Digits => 2,
            Suppress_Trailing_Zero => True));
      Decimal_Range_Word_Text : constant Text_Result :=
        Decimal_Range_Words (Support.En, 1.25, 3.5, 2);
      Invalid_Decimal_Range : constant Text_Result :=
        Decimal_Range (Support.En, 3.5, 1.25);
      Plus_Minus_Uncertainty : constant Text_Result :=
        Uncertainty_Label (Support.En, 12.3, 0.4);
      Uncertainty_Meta : constant Number_Render_Metadata :=
        Uncertainty_Metadata (12.3, 0.4, Style => Interval_Uncertainty);
      Uncertainty_Word_Text : constant Text_Result :=
        Uncertainty_Words (Support.En, 12.3, 0.4, 1);
      Parenthesized_Uncertainty_Text : constant Text_Result :=
        Uncertainty_Label
          (Support.En, 12.3, 0.4,
           Style => Parenthesized_Uncertainty);
      Interval_Uncertainty_Text : constant Text_Result :=
        Uncertainty_Label
          (Support.En, 12.3, 0.4,
           Style => Interval_Uncertainty);
      Invalid_Uncertainty : constant Text_Result :=
        Uncertainty_Label (Support.En, 12.3, -0.4);
      Threshold_Text : constant Text_Result :=
        Threshold (Support.En, 10, At_Least_Threshold);
      Threshold_Max : constant Text_Result :=
        Threshold (Support.En, 10, At_Most_Threshold);
      Range_Within : constant Text_Result :=
        Range_Position (Support.En, 5, 3, 7);
      Range_Below : constant Text_Result :=
        Range_Position (Support.En, 3, 3, 7, Exclusive_Range);
      Range_Above : constant Text_Result :=
        Range_Position (Support.En, 8, 3, 7);
      Ratio_Text : constant Text_Result := Ratio (Support.En, 2, 1);
      Ratio_Per_Text : constant Text_Result :=
        Ratio_Per (Support.En, 2, 1, "error", "file");
      Ratio_Per_Denominator : constant Text_Result :=
        Ratio_Per (Support.En, 5, 2, "failure", "run");
      One_In_Text : constant Text_Result := One_In (Support.En, 4);
      Out_Of_Text : constant Text_Result := Out_Of (Support.En, 3, 10);
      Change_Up_Text : constant Text_Result := Change (Support.En, 4.0);
      Change_Down_Text : constant Text_Result :=
        Change (Support.En, -2.5);
      Change_Zero_Text : constant Text_Result := Change (Support.En, 0.0);
      Change_Signed_Text : constant Text_Result :=
        Change (Support.En, 4.0,
                (Style => Signed_Change,
                 Zero_Style => Numeric_Zero,
                 Number_Style => Default_Number_Options));
      Change_Comparative_Text : constant Text_Result :=
        Unit_Change (Support.En, -5.0, "error",
                     Options =>
                       (Style => Comparative_Change,
                        Zero_Style => Unchanged_Zero,
                        Number_Style => Default_Number_Options));
      Change_Since_Text : constant Text_Result :=
        Change_Since (Support.En, 4.0, "yesterday");
      Change_From_Text : constant Text_Result :=
        Change_From (Support.En, 42.0, 40.0);
      Percent_Change_Text : constant Text_Result :=
        Percent_Change (Support.En, -12.5);
      German_Percent_Change : constant Text_Result :=
        Percent_Change (Support.De, 12.5);
      Percent_Delta_Text : constant Text_Result :=
        Percent_Delta (Support.En, 120.0, 100.0);
      Invalid_Percent_Delta : constant Text_Result :=
        Percent_Delta (Support.En, 120.0, 0.0);
      Point_Change_Text : constant Text_Result :=
        Point_Change (Support.En, 1.0);
      Unit_Change_Text : constant Text_Result :=
        Unit_Change (Support.En, 1.0, "file");
   begin
      Ordinal_Into (Support.En, 22, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "22nd",
         "bounded ordinal, status " & Status_Image (Code));
      Compact_Into (Support.En, 1_200, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "1.2K",
         "bounded compact, status " & Status_Image (Code));
      declare
         Capped : constant Text_Result :=
           Bounded_Number (Support.En, 110, 100);
         Plain : constant Text_Result :=
           Bounded_Number (Support.De, 50, 100);
         Grouped : constant Text_Result :=
           Bounded_Number (Support.De, 1_250, 1_000);
      begin
         AUnit.Assertions.Assert
           (Capped.Status = Ok and then Support.Text (Capped) = "100+",
            "bounded number cap");
         AUnit.Assertions.Assert
           (Plain.Status = Ok and then Support.Text (Plain) = "50",
            "bounded number below cap");
         AUnit.Assertions.Assert
           (Grouped.Status = Ok and then Support.Text (Grouped) = "1.000+",
            "bounded number uses i18n number formatting");
      end;
      AUnit.Assertions.Assert
        (Range_Text.Status = Ok and then Support.Text (Range_Text) = "1-5",
         "number range");
      AUnit.Assertions.Assert
        (Spaced_Range.Status = Ok and then Support.Text (Spaced_Range) = "1 : 5",
         "number range options");
      AUnit.Assertions.Assert
        (Approx_Range.Status = Ok
         and then Support.Text (Approx_Range) = "about 10-20",
         "approximate number range");
      AUnit.Assertions.Assert
        (Under_Text.Status = Ok and then Support.Text (Under_Text) = "under 5",
         "under number");
      AUnit.Assertions.Assert
        (German_Regional_Under.Status = Ok
         and then Support.Text (German_Regional_Under) = "unter 5",
         "regional German number phrase uses language-code fallback");
      AUnit.Assertions.Assert
        (Up_To_Text.Status = Ok and then Support.Text (Up_To_Text) = "up to 100",
         "up-to number");
      AUnit.Assertions.Assert
        (Between_Text.Status = Ok
         and then Support.Text (Between_Text) = "between 3 and 7",
         "between numbers");
      AUnit.Assertions.Assert
        (German_Regional_Between.Status = Ok
         and then Support.Text (German_Regional_Between) = "zwischen 3 und 7",
         "regional German between phrase uses language-code fallback");
      AUnit.Assertions.Assert
        (Qualified_Inclusive.Status = Ok
         and then Support.Text (Qualified_Inclusive) = "3 to 7 inclusive",
         "inclusive qualified range");
      AUnit.Assertions.Assert
        (Qualified_Exclusive.Status = Ok
         and then Support.Text (Qualified_Exclusive)
           = "greater than 3 and less than 7",
         "exclusive qualified range");
      AUnit.Assertions.Assert
        (Qualified_Low_Only.Status = Ok
         and then Support.Text (Qualified_Low_Only)
           = "3 or more and less than 7",
         "low-inclusive qualified range");
      AUnit.Assertions.Assert
        (Qualified_High_Only.Status = Ok
         and then Support.Text (Qualified_High_Only)
           = "greater than 3 and up to 7",
         "high-inclusive qualified range");
      AUnit.Assertions.Assert
        (Invalid_Qualified.Status = Invalid_Value,
         "qualified range rejects reversed bounds");
      AUnit.Assertions.Assert
        (Tolerance_Text.Status = Ok
         and then Support.Text (Tolerance_Text) = "10 +/- 2",
         "tolerance range");
      AUnit.Assertions.Assert
        (Decimal_Range_Text.Status = Ok
         and then Support.Text (Decimal_Range_Text) = "1.25 to 3.5",
         "decimal range");
      AUnit.Assertions.Assert
        (Decimal_Range_Meta.Status = Ok
         and then Decimal_Range_Meta.Kind = Rendered_Decimal_Range
         and then abs (Decimal_Range_Meta.Low - 1.25) < 0.0001
         and then Decimal_Range_Meta.Fraction_Digits = 2,
         "decimal range metadata");
      AUnit.Assertions.Assert
        (Decimal_Range_Word_Text.Status = Ok
         and then Support.Text (Decimal_Range_Word_Text)
           = "one point two five to three point five zero",
         "decimal range words");
      AUnit.Assertions.Assert
        (Invalid_Decimal_Range.Status = Invalid_Value,
         "decimal range rejects reversed bounds");
      AUnit.Assertions.Assert
        (Plus_Minus_Uncertainty.Status = Ok
         and then Support.Text (Plus_Minus_Uncertainty) = "12.3 +/- 0.4",
         "plus-minus uncertainty label");
      AUnit.Assertions.Assert
        (Uncertainty_Meta.Status = Ok
         and then Uncertainty_Meta.Kind = Rendered_Uncertainty
         and then Uncertainty_Meta.Style = Interval_Uncertainty
         and then abs (Uncertainty_Meta.Low - 11.9) < 0.0001,
         "uncertainty metadata");
      AUnit.Assertions.Assert
        (Uncertainty_Word_Text.Status = Ok
         and then Support.Text (Uncertainty_Word_Text)
           = "twelve point three plus or minus zero point four",
         "uncertainty words");
      AUnit.Assertions.Assert
        (Parenthesized_Uncertainty_Text.Status = Ok
         and then Support.Text (Parenthesized_Uncertainty_Text)
           = "12.3 (+/- 0.4)",
         "parenthesized uncertainty label");
      AUnit.Assertions.Assert
        (Interval_Uncertainty_Text.Status = Ok
         and then Support.Text (Interval_Uncertainty_Text) = "11.9 to 12.7",
         "interval uncertainty label");
      AUnit.Assertions.Assert
        (Invalid_Uncertainty.Status = Invalid_Value,
         "uncertainty rejects negative delta");
      AUnit.Assertions.Assert
        (Threshold_Text.Status = Ok
         and then Support.Text (Threshold_Text) = "at least 10"
         and then Threshold_Max.Status = Ok
         and then Support.Text (Threshold_Max) = "at most 10",
         "threshold labels");
      AUnit.Assertions.Assert
        (Range_Within.Status = Ok
         and then Support.Text (Range_Within) = "5 is within 3-7",
         "range position within");
      AUnit.Assertions.Assert
        (Range_Below.Status = Ok
         and then Support.Text (Range_Below) = "3 is below 3-7",
         "range position below exclusive boundary");
      AUnit.Assertions.Assert
        (Range_Above.Status = Ok
         and then Support.Text (Range_Above) = "8 is above 3-7",
         "range position above");
      AUnit.Assertions.Assert
        (Ratio_Text.Status = Ok and then Support.Text (Ratio_Text) = "2:1",
         "ratio phrase");
      AUnit.Assertions.Assert
        (Ratio_Per_Text.Status = Ok
         and then Support.Text (Ratio_Per_Text) = "2 errors per file",
         "ratio per noun phrase");
      AUnit.Assertions.Assert
        (Ratio_Per_Denominator.Status = Ok
         and then Support.Text (Ratio_Per_Denominator)
           = "5 failures per 2 runs",
         "ratio per denominator count");
      AUnit.Assertions.Assert
        (One_In_Text.Status = Ok and then Support.Text (One_In_Text) = "1 in 4",
         "one-in proportion");
      AUnit.Assertions.Assert
        (Out_Of_Text.Status = Ok
         and then Support.Text (Out_Of_Text) = "3 out of 10",
         "out-of proportion");
      AUnit.Assertions.Assert
        (Direction_Of_Change (-0.1) = Change_Down
         and then Direction_Of_Change (0.0) = Change_None
         and then Direction_Of_Change (0.1) = Change_Up,
         "change direction metadata");
      AUnit.Assertions.Assert
        (Change_Up_Text.Status = Ok
         and then Support.Text (Change_Up_Text) = "up 4",
         "directional positive change");
      AUnit.Assertions.Assert
        (Change_Down_Text.Status = Ok
         and then Support.Text (Change_Down_Text) = "down 2.5",
         "directional negative change");
      AUnit.Assertions.Assert
        (Change_Zero_Text.Status = Ok
         and then Support.Text (Change_Zero_Text) = "unchanged",
         "change zero defaults to unchanged");
      AUnit.Assertions.Assert
        (Change_Signed_Text.Status = Ok
         and then Support.Text (Change_Signed_Text) = "+4",
         "signed positive change");
      AUnit.Assertions.Assert
        (Change_Comparative_Text.Status = Ok
         and then Support.Text (Change_Comparative_Text) = "5 fewer errors",
         "comparative unit change");
      AUnit.Assertions.Assert
        (Change_Since_Text.Status = Ok
         and then Support.Text (Change_Since_Text) = "up 4 since yesterday",
         "change since baseline label");
      AUnit.Assertions.Assert
        (Change_From_Text.Status = Ok
         and then Support.Text (Change_From_Text) = "up 2",
         "change from previous value");
      AUnit.Assertions.Assert
        (Percent_Change_Text.Status = Ok
         and then Support.Text (Percent_Change_Text) = "down 12.5%",
         "percent change");
      AUnit.Assertions.Assert
        (German_Percent_Change.Status = Ok
         and then Support.Text (German_Percent_Change) = "plus 12,5%",
         "percent change uses localized percent rendering");
      AUnit.Assertions.Assert
        (Percent_Delta_Text.Status = Ok
         and then Support.Text (Percent_Delta_Text) = "up 20%",
         "relative percent delta");
      AUnit.Assertions.Assert
        (Invalid_Percent_Delta.Status = Invalid_Value,
         "percent delta rejects zero baseline");
      AUnit.Assertions.Assert
        (Point_Change_Text.Status = Ok
         and then Support.Text (Point_Change_Text) = "up 1 point",
         "point change singular");
      AUnit.Assertions.Assert
        (Unit_Change_Text.Status = Ok
         and then Support.Text (Unit_Change_Text) = "up 1 file",
         "unit change singular");
      Out_Of_Into (Support.En, 3, 10, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "3 out of 10",
         "bounded out-of proportion");
      Qualified_Range_Into
        (Support.En, 3, 7, Buffer, Written, Code, Exclusive_Range);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow
         and then Buffer (1 .. Written) = "greater than 3 a",
         "bounded qualified range overflow");
      Ratio_Per_Into
        (Support.En, 2, 1, "error", "file", Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow
         and then Buffer (1 .. Written) = "2 errors per fil",
         "bounded ratio per overflow");
      Percent_Change_Into (Support.En, -12.5, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "down 12.5%",
         "bounded percent change");
      Decimal_Range_Into
        (Support.En, 1.25, 3.5, Buffer, Written, Code,
         (Maximum_Fraction_Digits => 2,
          Suppress_Trailing_Zero => True));
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "1.25 to 3.5",
         "bounded decimal range");
      Uncertainty_Label_Into
        (Support.En, 12.3, 0.4, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "12.3 +/- 0.4",
         "bounded uncertainty label");
      declare
         Word_Buffer : String (1 .. 80);
      begin
         Decimal_Range_Words_Into
           (Support.En, 1.25, 3.5, Word_Buffer, Written, Code, 2);
         AUnit.Assertions.Assert
           (Code = Ok
            and then Word_Buffer (1 .. Written)
              = "one point two five to three point five zero",
            "bounded decimal range words");
         Uncertainty_Words_Into
           (Support.En, 12.3, 0.4, Word_Buffer, Written, Code, 1);
         AUnit.Assertions.Assert
           (Code = Ok
            and then Word_Buffer (1 .. Written)
              = "twelve point three plus or minus zero point four",
            "bounded uncertainty words");
      end;
   end Test_Number_Bounded;

   procedure Test_Roman (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Simple : constant Text_Result := Roman (4);
      Middle : constant Text_Result := Roman (944);
      Large  : constant Text_Result := Roman (2026);
      Max    : constant Text_Result := Roman (3999);
      Zero   : constant Text_Result := Roman (0);
      Too_Large : constant Text_Result := Roman (4000);
      Buffer : String (1 .. 16);
      Written : Natural;
      Code : Status_Code;
   begin
      AUnit.Assertions.Assert
        (Simple.Status = Ok and then Support.Text (Simple) = "IV",
         "roman subtractive four");
      AUnit.Assertions.Assert
        (Middle.Status = Ok and then Support.Text (Middle) = "CMXLIV",
         "roman complex value");
      AUnit.Assertions.Assert
        (Large.Status = Ok and then Support.Text (Large) = "MMXXVI",
         "roman current-style value");
      AUnit.Assertions.Assert
        (Max.Status = Ok and then Support.Text (Max) = "MMMCMXCIX",
         "roman maximum conventional value");
      AUnit.Assertions.Assert
        (Zero.Status = Invalid_Value and then Too_Large.Status = Invalid_Value,
         "roman rejects values outside 1..3999");

      Roman_Into (2026, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "MMXXVI",
         "bounded roman");
      Roman_Into (2026, Buffer (1 .. 4), Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Buffer (1 .. Written) = "MMXX",
         "bounded roman overflow");
      Roman_Into (0, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Value and then Written = 0,
         "bounded roman invalid value");
   end Test_Roman;

   procedure Test_SI_Prefix (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Kilo : constant Text_Result := SI_Prefix (Support.En, 1_500.0, "m");
      Micro : constant Text_Result := SI_Prefix (Support.En, 0.000_002, "s");
      Nano : constant Text_Result := SI_Prefix (Support.En, -0.000_000_42, "s");
      Plain : constant Text_Result := SI_Prefix (Support.En, 42.0, "m");
      Long_Text : constant Text_Result :=
        SI_Prefix
          (Support.En, 2_500_000.0, "bytes",
           (Number_Style => (Maximum_Fraction_Digits => 2,
                             Suppress_Trailing_Zero => True),
            Prefix_Style => SI_Long,
            Space_Before_Unit => True));
      Tight : constant Text_Result :=
        SI_Prefix
          (Support.En, 1_500.0, "m",
           (Number_Style => Default_Number_Options,
            Prefix_Style => SI_Symbol,
            Space_Before_Unit => False));
      Buffer : String (1 .. 16);
      Written : Natural;
      Code : Status_Code;
   begin
      AUnit.Assertions.Assert
        (Kilo.Status = Ok and then Support.Text (Kilo) = "1.5 km",
         "SI kilo symbol with unit");
      AUnit.Assertions.Assert
        (Micro.Status = Ok and then Support.Text (Micro) = "2 us",
         "SI micro symbol uses ASCII u");
      AUnit.Assertions.Assert
        (Nano.Status = Ok and then Support.Text (Nano) = "-420 ns",
         "SI nano negative value");
      AUnit.Assertions.Assert
        (Plain.Status = Ok and then Support.Text (Plain) = "42 m",
         "SI base unit");
      AUnit.Assertions.Assert
        (Long_Text.Status = Ok
         and then Support.Text (Long_Text) = "2.5 megabytes",
         "SI long prefix with unit");
      AUnit.Assertions.Assert
        (Tight.Status = Ok and then Support.Text (Tight) = "1.5km",
         "SI symbol without spacing");

      SI_Prefix_Into (Support.En, 1_500.0, Buffer, Written, Code, "m");
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "1.5 km",
         "bounded SI prefix");
   end Test_SI_Prefix;

   procedure Test_Approximate (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      About_Result : constant Text_Result := Approximate (Support.En, 10);
      Over_Result : constant Text_Result :=
        Approximate (Support.En, 1_000, Over);
      Almost_Result : constant Text_Result :=
        Approximate_To (Support.En, 98, 100, (Threshold => 5));
      Under_Result : constant Text_Result :=
        Approximate_To (Support.En, 80, 100, (Threshold => 5));
   begin
      AUnit.Assertions.Assert
        (About_Result.Status = Ok and then Support.Text (About_Result) = "about 10",
         "about approximation");
      AUnit.Assertions.Assert
        (Over_Result.Status = Ok and then Support.Text (Over_Result) = "over 1000",
         "over approximation");
      AUnit.Assertions.Assert
        (Almost_Result.Status = Ok
         and then Support.Text (Almost_Result) = "almost 100",
         "automatic almost approximation");
      AUnit.Assertions.Assert
        (Under_Result.Status = Ok and then Support.Text (Under_Result) = "under 100",
         "automatic under approximation");
   end Test_Approximate;

   procedure Test_Dataset_Summaries (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Distribution : constant Text_Result :=
        Distribution_Summary_Label (3, 10.0, 20.0, 30.0, "ms");
      Percentiles : constant Text_Result :=
        Percentile_Summary_Label (42.0, 120.0, 300.0, "ms");
      Outliers : constant Text_Result := Outlier_Summary_Label (2, 100);
      Shape : constant Text_Result :=
        Distribution_Shape_Label
          (100, 10.0, 18.0, 20.0, 22.0, 40.0, Unit => "ms");
      Shape_Metadata : constant Distribution_Shape_Metadata :=
        Distribution_Shape_Metadata_For
          (100, 10.0, 18.0, 20.0, 22.0, 40.0);
      Shape_Metadata_Label_Result : constant Text_Result :=
        Distribution_Shape_Metadata_Label (Shape_Metadata);
      Buffer : String (1 .. 20);
      Written : Natural;
      Code : Status_Code;
   begin
      AUnit.Assertions.Assert
        (Distribution.Status = Ok
         and then Support.Text (Distribution) =
           "3 observations, min 1.00000000000000E+01 ms, median "
           & "2.00000000000000E+01 ms, max 3.00000000000000E+01 ms",
         "distribution summary");
      AUnit.Assertions.Assert
        (Percentiles.Status = Ok
         and then Support.Text (Percentiles) =
           "p50 4.20000000000000E+01 ms, p95 "
           & "1.20000000000000E+02 ms, p99 3.00000000000000E+02 ms",
         "percentile summary");
      AUnit.Assertions.Assert
        (Outliers.Status = Ok
         and then Support.Text (Outliers) =
           "2 outliers out of 100 observations",
         "outlier summary");
      AUnit.Assertions.Assert
        (Shape.Status = Ok
         and then Support.Text (Shape) =
           "right-skewed distribution, median 2.00000000000000E+01 ms",
         "distribution shape summary");
      AUnit.Assertions.Assert
        (Shape_Metadata.Kind = Right_Skewed_Shape
         and then Shape_Metadata.Strong_Conclusion,
         "distribution shape metadata");
      AUnit.Assertions.Assert
        (Shape_Metadata_Label_Result.Status = Ok
         and then Support.Text (Shape_Metadata_Label_Result) =
           "shape=right-skewed count=100 spread=3.00000000000000E+01 "
           & "iqr=4.00000000000000E+00 outliers=0 confidence=strong",
         "distribution shape metadata label");
      Distribution_Summary_Label_Into
        (3, 10.0, 20.0, 30.0, Buffer, Written, Code, "ms");
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow
         and then Written = 20
         and then Buffer = "3 observations, min ",
         "bounded distribution summary");
      Distribution_Shape_Label_Into
        (100, 10.0, 18.0, 20.0, 22.0, 40.0, Buffer, Written, Code,
         Unit => "ms");
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 20
         and then Buffer = "right-skewed distrib",
         "bounded distribution shape");
   end Test_Dataset_Summaries;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize number tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Ordinal_English'Access, "English ordinals");
      Register_Routine (T, Test_Cardinal_Fractional'Access,
        "cardinal words and fractions");
      Register_Routine (T, Test_Ordinal_Other_Locales'Access,
        "German/Danish ordinals");
      Register_Routine (T, Test_Compact_English'Access, "English compact");
      Register_Routine (T, Test_Compact_Other_Locales'Access,
        "German/Danish compact suffixes");
      Register_Routine (T, Test_Ordinal_Gender'Access, "feminine ordinals");
      Register_Routine (T, Test_Compact_Long'Access, "long-form compact");
      Register_Routine (T, Test_Percent'Access, "percent formatting");
      Register_Routine (T, Test_Editorial_Numbers'Access,
        "editorial number style");
      Register_Routine (T, Test_Compact_Rollover'Access, "compact tier rollover");
      Register_Routine (T, Test_Count_Grouping'Access, "locale count grouping");
      Register_Routine (T, Test_Number_Bounded'Access, "bounded number APIs");
      Register_Routine (T, Test_Roman'Access, "Roman numerals");
      Register_Routine (T, Test_SI_Prefix'Access, "SI prefix formatting");
      Register_Routine (T, Test_Approximate'Access, "approximate numbers");
      Register_Routine (T, Test_Dataset_Summaries'Access, "dataset summaries");
   end Register_Tests;

end Humanize.Tests.Numbers;
