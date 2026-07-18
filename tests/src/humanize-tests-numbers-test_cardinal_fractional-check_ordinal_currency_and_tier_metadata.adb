separate (Humanize.Tests.Numbers.Test_Cardinal_Fractional)
   procedure Check_Ordinal_Currency_And_Tier_Metadata is
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
   end Check_Ordinal_Currency_And_Tier_Metadata;
