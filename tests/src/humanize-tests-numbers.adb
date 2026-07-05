with AUnit.Assertions;

with Humanize.Contexts;
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
        Locale_Cardinal (Support.Locale ("sv-SE"), 2_345);
      Norwegian_Cardinal : constant Text_Result :=
        Locale_Cardinal (Support.Locale ("nb-NO"), 2_345);
      Finnish_Cardinal : constant Text_Result :=
        Locale_Cardinal (Support.Locale ("fi-FI"), 2_345);
      Turkish_Cardinal : constant Text_Result :=
        Locale_Cardinal (Support.Locale ("tr-TR"), 2_345);
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
      Swedish_Decimal_Text : constant Text_Result :=
        Decimal_Words (Support.Locale ("sv"), 12.5, 2);
      Finnish_Decimal_Text : constant Text_Result :=
        Decimal_Words (Support.Locale ("fi"), 12.5, 2);
      Turkish_Decimal_Text : constant Text_Result :=
        Decimal_Words (Support.Locale ("tr"), 12.5, 2);
      Fraction_Text : constant Text_Result :=
        Fraction_Words (Support.En, 3, 4);
      French_Fraction_Text : constant Text_Result :=
        Fraction_Words (Support.Fr, 3, 4);
      Swedish_Fraction_Text : constant Text_Result :=
        Fraction_Words (Support.Locale ("sv"), 3, 4);
      Norwegian_Fraction_Text : constant Text_Result :=
        Fraction_Words (Support.Locale ("nb"), 3, 4);
      Finnish_Fraction_Text : constant Text_Result :=
        Fraction_Words (Support.Locale ("fi"), 3, 4);
      Turkish_Fraction_Text : constant Text_Result :=
        Fraction_Words (Support.Locale ("tr"), 3, 4);
      Ordinal_Text : constant Text_Result :=
        Ordinal_Words (Support.En, 21);
      German_Ordinal_Text : constant Text_Result :=
        Ordinal_Words (Support.De, 21);
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
      Norwegian_Ordinal_Twelve : constant Text_Result :=
        Ordinal_Words (Support.Locale ("no"), 12);
      Finnish_Ordinal_Twelve : constant Text_Result :=
        Ordinal_Words (Support.Locale ("fi"), 12);
      Turkish_Ordinal_Twelve : constant Text_Result :=
        Ordinal_Words (Support.Locale ("tr"), 12);
      Currency_Text : constant Text_Result :=
        Currency_Words (Support.En, 12.50, "dollar", "cent", 2);
      Percent_Text : constant Text_Result :=
        Percent_Words (Support.En, 12.5, 1);
      Accessible_Text : constant Text_Result :=
        Accessible_Number (Support.En, -42);
      Spellout_Meta : constant Text_Result := Spellout_Coverage;
      English_Tier : constant Text_Result :=
        Spellout_Locale_Tier_Label (Spellout_Locale_Tier_For (Support.En));
      Native_Tier : constant Text_Result :=
        Spellout_Locale_Tier_Label (Spellout_Locale_Tier_For (Support.De));
      Generated_Tier : constant Text_Result :=
        Spellout_Locale_Tier_Label
          (Spellout_Locale_Tier_For (Support.Locale ("sv-SE")));
      Fallback_Tier : constant Text_Result :=
        Spellout_Locale_Tier_Label
          (Spellout_Locale_Tier_For (Support.Locale ("pl")));
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
        (Fraction_Text.Status = Ok
         and then Support.Text (Fraction_Text) = "three quarters",
         "fraction words");
      AUnit.Assertions.Assert
        (French_Fraction_Text.Status = Ok
         and then Support.Text (French_Fraction_Text) = "trois quarts",
         "locale fraction words");
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
        (Ordinal_Text.Status = Ok
         and then Support.Text (Ordinal_Text) = "twenty-first",
         "ordinal words");
      AUnit.Assertions.Assert
        (German_Ordinal_Text.Status = Ok
         and then Support.Text (German_Ordinal_Text) = "einundzwanzigste",
         "locale ordinal words");
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
        (Currency_Text.Status = Ok
         and then Support.Text (Currency_Text) = "twelve dollars and fifty cents",
         "currency words");
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
             & "sv-no-nb-fi-tr signed-cardinal currency percent editorial",
         "spellout coverage metadata");
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.En) = English_Spellout,
         "English spellout tier metadata");
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.De) = Native_Locale_Spellout,
         "native spellout tier metadata");
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.Locale ("nb-NO"))
           = Generated_Locale_Spellout,
         "generated spellout tier metadata");
      AUnit.Assertions.Assert
        (Spellout_Locale_Tier_For (Support.Locale ("pl"))
           = English_Fallback_Spellout,
         "fallback spellout tier metadata");
      AUnit.Assertions.Assert
        (English_Tier.Status = Ok
         and then Support.Text (English_Tier) = "english-spellout",
         "English spellout tier label");
      AUnit.Assertions.Assert
        (Native_Tier.Status = Ok
         and then Support.Text (Native_Tier) = "native-locale-spellout",
         "native spellout tier label");
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
      Up_To_Text : constant Text_Result := Up_To (Support.En, 100);
      Between_Text : constant Text_Result := Between (Support.En, 3, 7);
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
        (Up_To_Text.Status = Ok and then Support.Text (Up_To_Text) = "up to 100",
         "up-to number");
      AUnit.Assertions.Assert
        (Between_Text.Status = Ok
         and then Support.Text (Between_Text) = "between 3 and 7",
         "between numbers");
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
         and then Support.Text (German_Percent_Change) = "up 12,5%",
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
   end Register_Tests;

end Humanize.Tests.Numbers;
