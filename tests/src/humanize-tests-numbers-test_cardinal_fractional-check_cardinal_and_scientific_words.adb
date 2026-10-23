separate (Humanize.Tests.Numbers.Test_Cardinal_Fractional)
   procedure Check_Cardinal_And_Scientific_Words is
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
         and then Support.Text (Localized) = "f" & Support.U (16#FC#) & "nf",
         "limited locale cardinal");
      AUnit.Assertions.Assert
        (Spanish_Localized.Status = Ok
         and then Support.Text (Spanish_Localized) = "diecis" & Support.U (16#E9#) & "is",
         "Spanish limited locale cardinal");
      AUnit.Assertions.Assert
        (Dutch_Localized.Status = Ok
         and then Support.Text (Dutch_Localized) = "twintig",
         "Dutch limited locale cardinal");
      AUnit.Assertions.Assert
        (German_Expanded.Status = Ok
         and then Support.Text (German_Expanded)
           = "zwei" & Support.U (16#AD#) & "und" & Support.U (16#AD#) & "vierzig",
         "expanded locale cardinal");
      AUnit.Assertions.Assert
        (German_Hundreds.Status = Ok
         and then Support.Text (German_Hundreds)
           = "drei" & Support.U (16#AD#) & "hundert" & Support.U (16#AD#) & "zwei" & Support.U (16#AD#)
             & "und" & Support.U (16#AD#) & "vierzig",
         "expanded hundreds locale cardinal");
      AUnit.Assertions.Assert
        (French_Compound.Status = Ok
         and then Support.Text (French_Compound) = "deux cent soixante-et-onze",
         "native French compound cardinal");
      AUnit.Assertions.Assert
        (Spanish_Compound.Status = Ok
         and then Support.Text (Spanish_Compound)
           = "ciento veintis" & Support.U (16#E9#) & "is",
         "native Spanish compound cardinal");
      AUnit.Assertions.Assert
        (Italian_Compound.Status = Ok
         and then Support.Text (Italian_Compound) = "vent" & Support.U (16#AD#) & "uno",
         "native Italian elided compound cardinal");
      AUnit.Assertions.Assert
        (Portuguese_Compound.Status = Ok
         and then Support.Text (Portuguese_Compound)
           = "trinta e tr" & Support.U (16#EA#) & "s",
         "native Portuguese compound cardinal");
      AUnit.Assertions.Assert
        (Danish_Thousand.Status = Ok
         and then Support.Text (Danish_Thousand) = "tusind",
         "native Danish singular thousand");
      AUnit.Assertions.Assert
        (Italian_Thousand.Status = Ok
         and then Support.Text (Italian_Thousand) = "mille",
         "native Italian singular thousand");
      AUnit.Assertions.Assert
        (Spanish_Million.Status = Ok
         and then Support.Text (Spanish_Million) = "un mill" & Support.U (16#F3#) & "n",
         "native Spanish singular million");
      AUnit.Assertions.Assert
        (Portuguese_Million.Status = Ok
         and then Support.Text (Portuguese_Million)
           = "um milh" & Support.U (16#E3#) & "o",
         "native Portuguese singular million");
      AUnit.Assertions.Assert
        (Spanish_Billion.Status = Ok
         and then Support.Text (Spanish_Billion) = "mil millones",
         "native Spanish singular billion phrase");
      AUnit.Assertions.Assert
        (Danish_Hundred_One.Status = Ok
         and then Support.Text (Danish_Hundred_One) = "hundrede og et",
         "native Danish hundred connector");
      AUnit.Assertions.Assert
        (Spanish_Five_Hundred.Status = Ok
         and then Support.Text (Spanish_Five_Hundred) = "quinientos",
         "native Spanish irregular hundred");
      AUnit.Assertions.Assert
        (Italian_One_Eighty_One.Status = Ok
         and then Support.Text (Italian_One_Eighty_One) = "cent" & Support.U (16#AD#) & "ottant" & Support.U (16#AD#)
           & "uno",
         "native Italian cento elision");
      AUnit.Assertions.Assert
        (Portuguese_Nine_Ninety_Nine.Status = Ok
         and then Support.Text (Portuguese_Nine_Ninety_Nine)
           = "novecentos e noventa e nove",
         "native Portuguese hundred connector");
      AUnit.Assertions.Assert
        (Dutch_Twenty_Two.Status = Ok
         and then Support.Text (Dutch_Twenty_Two)
           = "twee" & Support.U (16#AD#) & Support.U (16#EB#) & "n" & Support.U (16#AD#) & "twintig",
         "native Dutch diaeresis compound");
      AUnit.Assertions.Assert
        (Dutch_Three_Forty_Two.Status = Ok
         and then Support.Text (Dutch_Three_Forty_Two)
           = "drie" & Support.U (16#AD#) & "honderd" & Support.U (16#AD#) & "twee" & Support.U (16#AD#)
             & Support.U (16#EB#) & "n" & Support.U (16#AD#) & "veertig",
         "native Dutch hundred compound");
      AUnit.Assertions.Assert
        (German_Two_Thousand.Status = Ok
         and then Support.Text (German_Two_Thousand) = "zwei" & Support.U (16#AD#) & "tausend",
         "native German compound thousand");
      AUnit.Assertions.Assert
        (Italian_Two_Thousand.Status = Ok
         and then Support.Text (Italian_Two_Thousand) = "due" & Support.U (16#AD#) & "mila",
         "native Italian compound thousand");
      AUnit.Assertions.Assert
        (Dutch_Two_Thousand.Status = Ok
         and then Support.Text (Dutch_Two_Thousand) = "twee" & Support.U (16#AD#) & "duizend",
         "native Dutch compound thousand");
      AUnit.Assertions.Assert
        (Swedish_Cardinal.Status = Ok
         and then Support.Text (Swedish_Cardinal)
           = "tv" & Support.U (16#E5#) & Support.U (16#AD#) & "tusen tre" & Support.U (16#AD#) & "hundra"
             & Support.U (16#AD#) & "fyrtio" & Support.U (16#AD#) & "fem",
         "generated Swedish locale cardinal");
      AUnit.Assertions.Assert
        (Norwegian_Cardinal.Status = Ok
         and then Support.Text (Norwegian_Cardinal)
           = "to tusen tre hundre og f" & Support.U (16#F8#) & "rti" & Support.U (16#AD#) & "fem",
         "generated Norwegian locale cardinal");
      Check_Regional_Cardinal_Fallbacks;
      AUnit.Assertions.Assert
        (Finnish_Cardinal.Status = Ok
         and then Support.Text (Finnish_Cardinal)
           = "kaksi" & Support.U (16#AD#) & "tuhatta" & Support.U (16#AD#) & "kolme" & Support.U (16#AD#)
             & "sataa" & Support.U (16#AD#) & "nelj" & Support.U (16#E4#) & Support.U (16#AD#) & "kymment"
             & Support.U (16#E4#) & Support.U (16#AD#) & "viisi",
         "generated Finnish locale cardinal");
      AUnit.Assertions.Assert
        (Turkish_Cardinal.Status = Ok
         and then Support.Text (Turkish_Cardinal)
           = "iki bin " & Support.U (16#FC#) & Support.U (16#E7#) & " y" & Support.U (16#FC#) & "z k"
             & Support.U (16#131#) & "rk be" & Support.U (16#15F#),
         "generated Turkish locale cardinal");
      AUnit.Assertions.Assert
        (Polish_Cardinal.Status = Ok
         and then Support.Text (Polish_Cardinal)
           = "dwa tysi" & Support.U (16#105#) & "ce trzysta czterdzie" & Support.U (16#15B#) & "ci pi"
             & Support.U (16#119#) & Support.U (16#107#),
         "generated Polish locale cardinal");
      AUnit.Assertions.Assert
        (Czech_Cardinal.Status = Ok
         and then Support.Text (Czech_Cardinal)
           = "dv" & Support.U (16#11B#) & " tis" & Support.U (16#ED#) & "ce t" & Support.U (16#159#)
             & "i sta " & Support.U (16#10D#) & "ty" & Support.U (16#159#) & "icet p" & Support.U (16#11B#)
             & "t",
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
           = Support.U (16#4E8C#) & Support.U (16#5343#) & Support.U (16#4E09#) & Support.U (16#767E#)
             & Support.U (16#56DB#) & Support.U (16#5341#) & Support.U (16#4E94#),
         "generated Japanese locale cardinal");
      AUnit.Assertions.Assert
        (Korean_Cardinal.Status = Ok
         and then Support.Text (Korean_Cardinal)
           = Support.U (16#C774#) & Support.U (16#CC9C#) & Support.U (16#C0BC#) & Support.U (16#BC31#)
             & Support.U (16#C0AC#) & Support.U (16#C2ED#) & Support.U (16#C624#),
         "generated Korean locale cardinal");
      AUnit.Assertions.Assert
        (Chinese_Cardinal.Status = Ok
         and then Support.Text (Chinese_Cardinal)
           = Support.U (16#4E8C#) & Support.U (16#5343#) & Support.U (16#4E09#) & Support.U (16#767E#)
             & Support.U (16#56DB#) & Support.U (16#5341#) & Support.U (16#4E94#),
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
           = "ein" & Support.U (16#AD#) & "tausend" & Support.U (16#AD#) & "drei" & Support.U (16#AD#)
             & "hundert" & Support.U (16#AD#) & "zwei" & Support.U (16#AD#) & "und" & Support.U (16#AD#)
             & "vierzig",
         "locale cardinal expands beyond 999");
      AUnit.Assertions.Assert
        (French_Billions.Status = Ok
         and then Support.Text (French_Billions) = "deux milliards un",
         "locale cardinal expands through billions");
      --  Outside English: CLDR's spell-out rules, as ICU renders them.
      AUnit.Assertions.Assert
        (Support.Text (Cardinal (Support.De, 1234))
         = "ein" & Support.U (16#AD#) & "tausend" & Support.U (16#AD#) & "zwei" & Support.U (16#AD#)
           & "hundert" & Support.U (16#AD#) & "vier" & Support.U (16#AD#) & "und"
           & Support.U (16#AD#) & "drei" & Support.U (16#DF#) & "ig",
         "German cardinal with CLDR's soft hyphens");
      AUnit.Assertions.Assert
        (Support.Text (Signed_Cardinal (Support.Locale ("ru"), -42))
         = Support.U (16#43C#) & Support.U (16#438#) & Support.U (16#43D#) & Support.U (16#443#)
           & Support.U (16#441#) & " " & Support.U (16#441#) & Support.U (16#43E#)
           & Support.U (16#440#) & Support.U (16#43E#) & Support.U (16#43A#) & " "
           & Support.U (16#434#) & Support.U (16#432#) & Support.U (16#430#),
         "Russian negative by CLDR's rule");
   end Check_Cardinal_And_Scientific_Words;
