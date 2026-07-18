separate (Humanize.Tests.Numbers)
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
