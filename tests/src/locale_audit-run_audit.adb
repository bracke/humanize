separate (Locale_Audit)
   procedure Run_Audit is
      Load_Result : I18N.Runtime.Load_Result;
   begin
      Humanize.Catalogs.Load_Defaults (Runtime, Load_Result);
      if not Summary_Only and then not Failures_Only then
         Print_Header;
      end if;

      for Locale_Access of Humanize.Locales.Shipped_Locales loop
         declare
            Locale : constant String := Locale_Access.all;
            Texts  : Sample_Texts := [others => Null_Unbounded_String];
         begin
            if Locale_Filter'Length > 0 and then Locale /= Locale_Filter then
               goto Continue;
            end if;

            Audited_Locales := Audited_Locales + 1;
            Audit_Locale (Locale, Texts);
            Audit_Deterministic_Schedule_Spellout (Locale, Texts);
            Audit_Configured_Generated_Core (Locale, Texts);
            if Locale = "da" then
                  Audit_Generated_Core
                    (Locale, Texts, "2 minutter", "2 dage", "2 uger",
                     B ("32206DC3A56E65646572"), B ("3220C3A572"),
                     "5 kilometer", "5 centimeter", "5 millimeter",
                     "5 gram", "5 milligram", "5 liter", "5 milliliter");
                  Audit_Native_Added
                    (Locale, Texts, "4 gange", "cirka 4 gange per uge");
            elsif Locale = "de" then
                  Audit_Generated_Core
                    (Locale, Texts, "2 Minuten", "2 Tage", "2 Wochen",
                     "2 Monate", "2 Jahre", "5 Kilometer", "5 Zentimeter",
                     "5 Millimeter", "5 Gramm", "5 Milligramm", "5 Liter",
                     "5 Milliliter");
                  Audit_Native_Added
                    (Locale, Texts, "4 Mal", "ungefaehr 4 Mal pro Woche");
            elsif Locale = "fr" then
                  Audit_Generated_Core
                    (Locale, Texts, "2 minutes", "2 jours", "2 semaines",
                     "2 mois", "2 ans", B ("35206B696C6F6DC3A874726573"),
                     B ("352063656E74696DC3A874726573"),
                     B ("35206D696C6C696DC3A874726573"), "5 grammes",
                     "5 milligrammes", "5 litres", "5 millilitres");
                  Audit_Native_Added
                    (Locale, Texts, "4 fois", "environ 4 fois par semaine");
            elsif Locale = "es" then
                  Audit_Generated_Core
                    (Locale, Texts, "2 minutos", B ("322064C3AD6173"),
                     "2 semanas", "2 meses", B ("322061C3B16F73"),
                     B ("35206B696CC3B36D6574726F73"),
                     B ("352063656E74C3AD6D6574726F73"),
                     B ("35206D696CC3AD6D6574726F73"), "5 gramos",
                     "5 miligramos", "5 litros", "5 mililitros");
                  Audit_Native_Added
                    (Locale, Texts, "4 veces",
                     "aproximadamente 4 veces por semana");
            elsif Locale = "it" then
                  Audit_Generated_Core
                    (Locale, Texts, "2 minuti", "2 giorni", "2 settimane",
                     "2 mesi", "2 anni", "5 chilometri", "5 centimetri",
                     "5 millimetri", "5 grammi", "5 milligrammi", "5 litri",
                     "5 millilitri");
                  Audit_Native_Added
                    (Locale, Texts, "4 volte", "circa 4 volte alla settimana");
            elsif Locale = "pt" then
                  Audit_Generated_Core
                    (Locale, Texts, "2 minutos", "2 dias", "2 semanas",
                     "2 meses", "2 anos",
                     B ("35207175696CC3B36D6574726F73"),
                     B ("352063656E74C3AD6D6574726F73"),
                     B ("35206D696CC3AD6D6574726F73"), "5 gramas",
                     "5 miligramas", "5 litros", "5 mililitros");
                  Audit_Native_Added
                    (Locale, Texts, "4 vezes",
                     "aproximadamente 4 vezes por semana");
            elsif Locale = "nl" then
                  Audit_Generated_Core
                    (Locale, Texts, "2 minuten", "2 dagen", "2 weken",
                     "2 maanden", "2 jaar", "5 kilometer", "5 centimeter",
                     "5 millimeter", "5 gram", "5 milligram", "5 liter",
                     "5 milliliter");
            elsif Locale = "sv" then
                  Audit_Generated_Core
                    (Locale, Texts, "2 minuter", "2 dagar", "2 veckor",
                     B ("32206DC3A56E61646572"), B ("3220C3A572"),
                     "5 kilometer", "5 centimeter", "5 millimeter",
                     "5 gram", "5 milligram", "5 liter", "5 milliliter");
            elsif Humanize.Locales.Is_Norwegian (Locale) then
                  Audit_Generated_Core
                    (Locale, Texts, "2 minutter", "2 dager", "2 uker",
                     B ("32206DC3A56E65646572"), B ("3220C3A572"),
                     "5 kilometer", "5 centimeter", "5 millimeter",
                     "5 gram", "5 milligram", "5 liter", "5 milliliter");
            elsif Locale = "fi" then
                  Audit_Generated_Core
                    (Locale, Texts, "2 minuuttia",
                     B ("322070C3A46976C3A4C3A4"), "2 viikkoa",
                     "2 kuukautta", "2 vuotta",
                     B ("35206B696C6F6D65747269C3A4"),
                     B ("352073656E7474696D65747269C3A4"),
                     B ("35206D696C6C696D65747269C3A4"),
                     "5 grammaa", "5 milligrammaa", "5 litraa",
                     "5 millilitraa");
                  if To_String (Texts (Relative_Future_Many))
                    /= "5 tunnin kuluttua"
                  then
                     Error
                       (Locale, Relative_Future_Many,
                        To_String (Texts (Relative_Future_Many)),
                        "expected explicit Finnish future relative wording");
                  end if;
            elsif Locale = "pl" then
                  Audit_Slavic_Core
                    (Locale, Texts, "2 minuty", "2 dni", "2 tygodnie",
                     B ("32206D69657369C4856365"), "2 lata",
                     B ("35206B696C6F6D657472C3B377"),
                     B ("352063656E74796D657472C3B377"),
                     B ("35206D696C696D657472C3B377"),
                     B ("35206772616DC3B377"),
                     B ("35206D696C696772616DC3B377"),
                     B ("35206C697472C3B377"),
                     B ("35206D696C696C697472C3B377"));
                  Audit_Slavic_Relative_Many
                    (Locale, Texts, "5 godzin temu", "za 5 godzin");
            elsif Locale = "cs" then
                  Audit_Slavic_Core
                    (Locale, Texts, "2 minuty", "2 dny",
                     B ("322074C3BD646E79"),
                     B ("32206DC49B73C3AD6365"), "2 roky",
                     B ("35206B696C6F6D657472C5AF"),
                     B ("352063656E74696D657472C5AF"),
                     B ("35206D696C696D657472C5AF"),
                     B ("35206772616DC5AF"),
                     B ("35206D696C696772616DC5AF"),
                     B ("35206C697472C5AF"),
                     B ("35206D696C696C697472C5AF"));
                  Audit_Slavic_Relative_Many
                    (Locale, Texts, B ("3520686F64696E207A70C49B74"),
                     "za 5 hodin");
            elsif Locale = "ru" then
                  Audit_Non_ASCII_Core (Locale, Texts);
                  Audit_Native_Script_No_Latin (Locale, Texts);
                  Audit_Slavic_Core
                    (Locale, Texts,
                     B ("3220D0BCD0B8D0BDD183D182D18B"),
                     B ("3220D0B4D0BDD18F"),
                     B ("3220D0BDD0B5D0B4D0B5D0BBD0B8"),
                     B ("3220D0BCD0B5D181D18FD186D0B0"),
                     B ("3220D0B3D0BED0B4D0B0"),
                     B ("3520D0BAD0B8D0BBD0BED0BCD0B5D182D180D0BED0B2"),
                     B ("3520D181D0B0D0BDD182D0B8D0BCD0B5D182D180D0BED0B2"),
                     B ("3520D0BCD0B8D0BBD0BBD0B8D0BCD0B5D182D180D0BED0B2"),
                     B ("3520D0B3D180D0B0D0BCD0BCD0BED0B2"),
                     B ("3520D0BCD0B8D0BBD0BBD0B8D0B3D180D0B0D0BCD0BCD0BED0B2"),
                     B ("3520D0BBD0B8D182D180D0BED0B2"),
                     B ("3520D0BCD0B8D0BBD0BBD0B8D0BBD0B8D182D180D0BED0B2"));
                  Audit_Slavic_Relative_Many
                    (Locale, Texts,
                     B ("3520D187D0B0D181D0BED0B220D0BDD0B0D0B7D0B0D0B4"),
                     B ("D187D0B5D180D0B5D0B7203520D187D0B0D181D0BED0B2"));
            elsif Locale = "uk" then
                  Audit_Non_ASCII_Core (Locale, Texts);
                  Audit_Native_Script_No_Latin (Locale, Texts);
                  Audit_Slavic_Core
                    (Locale, Texts,
                     B ("3220D185D0B2D0B8D0BBD0B8D0BDD0B8"),
                     B ("3220D0B4D0BDD196"),
                     B ("3220D182D0B8D0B6D0BDD196"),
                     B ("3220D0BCD196D181D18FD186D196"),
                     B ("3220D180D0BED0BAD0B8"),
                     B ("3520D0BAD196D0BBD0BED0BCD0B5D182D180D196D0B2"),
                     B ("3520D181D0B0D0BDD182D0B8D0BCD0B5D182D180D196D0B2"),
                     B ("3520D0BCD196D0BBD196D0BCD0B5D182D180D196D0B2"),
                     B ("3520D0B3D180D0B0D0BCD196D0B2"),
                     B ("3520D0BCD196D0BBD196D0B3D180D0B0D0BCD196D0B2"),
                     B ("3520D0BBD196D182D180D196D0B2"),
                     B ("3520D0BCD196D0BBD196D0BBD196D182D180D196D0B2"));
                  Audit_Slavic_Relative_Many
                    (Locale, Texts,
                     B ("3520D0B3D0BED0B4D0B8D0BD20D182D0BED0BCD183"),
                     B ("D187D0B5D180D0B5D0B7203520D0B3D0BED0B4D0B8D0BD"));
            elsif Locale = "tr" then
                  Audit_Generated_Core
                    (Locale, Texts, "2 dakika", B ("322067C3BC6E"),
                     "2 hafta", "2 ay", B ("322079C4B16C"),
                     "5 kilometre", "5 santimetre", "5 milimetre",
                     "5 gram", "5 miligram", "5 litre", "5 mililitre");
                  Audit_Rate_Periods
                    (Locale, Texts,
                     B ("73616E69796564652079616B6C61C59FC4B16B2034206B657A"),
                     B ("64616B696B6164612079616B6C61C59FC4B16B2034206B657A"),
                     B ("7361617474652079616B6C61C59FC4B16B2034206B657A"),
                     B ("67C3BC6E64652079616B6C61C59FC4B16B2034206B657A"),
                     B ("686166746164612079616B6C61C59FC4B16B2034206B657A"),
                     B ("73616174746520626972206B657A64656E20617A"));
                  if To_String (Texts (Relative_Future_Many))
                    /= "5 saat sonra"
                  then
                     Error
                       (Locale, Relative_Future_Many,
                        To_String (Texts (Relative_Future_Many)),
                        "expected explicit Turkish future relative wording");
                  end if;
            elsif Locale = "ko" then
                  declare
                     Kilometer  : constant String :=
                       B ("3520ED82ACEBA19CEBAFB8ED84B0");
                     Centimeter : constant String :=
                       B ("3520EC84BCED8BB0EBAFB8ED84B0");
                     Millimeter : constant String :=
                       B ("3520EBB080EBA6ACEBAFB8ED84B0");
                     Milligram  : constant String :=
                       B ("3520EBB080EBA6ACEAB7B8EB9EA8");
                     Milliliter : constant String :=
                       B ("3520EBB080EBA6ACEBA6ACED84B0");
                  begin
                     Audit_Non_ASCII_Core (Locale, Texts);
                     Audit_Native_Script_No_Latin (Locale, Texts);
                     Audit_Generated_Core
                       (Locale, Texts, B ("3220EBB684"), B ("3220EC9DBC"),
                        B ("3220ECA3BC"), B ("3220EAB09CEC9B94"),
                        B ("3220EB8584"), Kilometer, Centimeter, Millimeter,
                        B ("3520EAB7B8EB9EA8"), Milligram,
                        B ("3520EBA6ACED84B0"), Milliliter);
                  end;
                  Audit_Rate_Periods
                    (Locale, Texts,
                     B ("ECB488EB8BB920EC95BD2034EBB288"),
                     B ("EBB684EB8BB920EC95BD2034EBB288"),
                     B ("EC8B9CEAB084EB8BB920EC95BD2034EBB288"),
                     B ("EC9DBCEB8BB920EC95BD2034EBB288"),
                     B ("ECA3BCEB8BB920EC95BD2034EBB288"),
                     B ("EC8B9CEAB084EB8BB92031EBB28820EBAFB8EBA78C"));
                  if To_String (Texts (Relative_Future_Many))
                    /= B ("3520EC8B9CEAB08420ED9B84")
                  then
                     Error
                       (Locale, Relative_Future_Many,
                        To_String (Texts (Relative_Future_Many)),
                        "expected Korean future relative suffix wording");
                  end if;
            elsif Locale = "ja" then
                  declare
                     Kilometer  : constant String :=
                       B ("3520E382ADE383ADE383A1E383BCE38388E383AB");
                     Centimeter : constant String :=
                       B ("3520E382BBE383B3E38381E383A1E383BCE38388E383AB");
                     Millimeter : constant String :=
                       B ("3520E3839FE383AAE383A1E383BCE38388E383AB");
                     Milligram  : constant String :=
                       B ("3520E3839FE383AAE382B0E383A9E383A0");
                     Milliliter : constant String :=
                       B ("3520E3839FE383AAE383AAE38383E38388E383AB");
                  begin
                     Audit_Non_ASCII_Core (Locale, Texts);
                     Audit_Native_Script_No_Latin (Locale, Texts);
                     Audit_Generated_Core
                       (Locale, Texts, B ("3220E58886"), B ("3220E697A5"),
                        B ("3220E980B1"), B ("3220E3818BE69C88"),
                        B ("3220E5B9B4"), Kilometer, Centimeter, Millimeter,
                        B ("3520E382B0E383A9E383A0"), Milligram,
                        B ("3520E383AAE38383E38388E383AB"), Milliliter);
                  end;
                  Audit_Rate_Periods
                    (Locale, Texts,
                     B ("E6AF8EE7A792E7B484203420E59B9E"),
                     B ("E6AF8EE58886E7B484203420E59B9E"),
                     B ("E6AF8EE69982E7B484203420E59B9E"),
                     B ("E6AF8EE697A5E7B484203420E59B9E"),
                     B ("E6AF8EE980B1E7B484203420E59B9E"),
                     B ("E6AF8EE69982203120E59B9EE69CAAE6BA80"));
            elsif Locale = "zh" then
                  Audit_Non_ASCII_Core (Locale, Texts);
                  Audit_Native_Script_No_Latin (Locale, Texts);
                  Audit_Generated_Core
                    (Locale, Texts, B ("3220E58886E9929F"),
                     B ("3220E5A4A9"), B ("3220E591A8"),
                     B ("3220E4B8AAE69C88"), B ("3220E5B9B4"),
                     B ("3520E58D83E7B1B3"), B ("3520E58E98E7B1B3"),
                     B ("3520E6AFABE7B1B3"), B ("3520E5858B"),
                     B ("3520E6AFABE5858B"), B ("3520E58D87"),
                     B ("3520E6AFABE58D87"));
                  Audit_Rate_Periods
                    (Locale, Texts,
                     B ("E6AF8FE7A792E7BAA6203420E6ACA1"),
                     B ("E6AF8FE58886E9929FE7BAA6203420E6ACA1"),
                     B ("E6AF8FE5B08FE697B6E7BAA6203420E6ACA1"),
                     B ("E6AF8FE5A4A9E7BAA6203420E6ACA1"),
                     B ("E6AF8FE591A8E7BAA6203420E6ACA1"),
                     B ("E6AF8FE5B08FE697B6E5B091E4BA8E203120E6ACA1"));
                  if To_String (Texts (Duration_Month))
                    /= B ("3220E4B8AAE69C88")
                  then
                     Error
                       (Locale, Duration_Month, To_String (Texts (Duration_Month)),
                        "expected Chinese duration month classifier");
                  end if;
            elsif Locale = "hi" then
                  declare
                     Core_Minute : constant String :=
                       B ("3220E0A4AEE0A4BFE0A4A8E0A49F");
                     Core_Day    : constant String :=
                       B ("3220E0A4A6E0A4BFE0A4A8");
                     Core_Week   : constant String :=
                       B ("3220E0A4B8E0A4AAE0A58DE0A4A4")
                       & B ("E0A4BEE0A4B9");
                     Core_Month  : constant String :=
                       B ("3220E0A4AEE0A4B9E0A580E0A4A8E0A587");
                     Core_Year   : constant String :=
                       B ("3220E0A4B8E0A4BEE0A4B2");
                     Kilometer   : constant String :=
                       B ("3520E0A495E0A4BFE0A4B2E0A58BE0A4AE")
                       & B ("E0A580E0A49FE0A4B0");
                     Centimeter  : constant String :=
                       B ("3520E0A4B8E0A587E0A482E0A49FE0A580")
                       & B ("E0A4AEE0A580E0A49FE0A4B0");
                     Millimeter  : constant String :=
                       B ("3520E0A4AEE0A4BFE0A4B2E0A580E0A4AE")
                       & B ("E0A580E0A49FE0A4B0");
                     Core_Gram   : constant String :=
                       B ("3520E0A497E0A58DE0A4B0E0A4BEE0A4AE");
                     Milligram   : constant String :=
                       B ("3520E0A4AEE0A4BFE0A4B2E0A580E0A497")
                       & B ("E0A58DE0A4B0E0A4BEE0A4AE");
                     Core_Liter  : constant String :=
                       B ("3520E0A4B2E0A580E0A49FE0A4B0");
                     Milliliter  : constant String :=
                       B ("3520E0A4AEE0A4BFE0A4B2E0A580E0A4B2")
                       & B ("E0A580E0A49FE0A4B0");
                     Approx : constant String := B ("E0A4B2E0A497E0A4ADE0A497");
                     Times  : constant String := B ("E0A4ACE0A4BEE0A4B0");
                     Less   : constant String :=
                       B ("E0A48FE0A49520E0A4ACE0A4BEE0A4B0")
                       & " " & B ("E0A4B8E0A58720E0A495E0A4AE");
                     Second : constant String :=
                       B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF")
                       & " " & B ("E0A4B8E0A587E0A495E0A482E0A4A1");
                     Minute : constant String :=
                       B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF")
                       & " " & B ("E0A4AEE0A4BFE0A4A8E0A49F");
                     Hour   : constant String :=
                       B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF")
                       & " " & B ("E0A498E0A482E0A49FE0A4BE");
                     Day    : constant String :=
                       B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF")
                       & " " & B ("E0A4A6E0A4BFE0A4A8");
                     Week   : constant String :=
                       B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF")
                       & " " & B ("E0A4B8E0A4AAE0A58DE0A4A4")
                       & B ("E0A4BEE0A4B9");
                  begin
                     Audit_Non_ASCII_Core (Locale, Texts);
                     Audit_Native_Script_No_Latin (Locale, Texts);
                     Audit_Generated_Core
                       (Locale, Texts, Core_Minute, Core_Day, Core_Week,
                        Core_Month, Core_Year, Kilometer, Centimeter,
                        Millimeter, Core_Gram, Milligram, Core_Liter,
                        Milliliter);
                     Audit_Rate_Periods
                       (Locale, Texts,
                        Second & " " & Approx & " 4 " & Times,
                        Minute & " " & Approx & " 4 " & Times,
                        Hour & " " & Approx & " 4 " & Times,
                        Day & " " & Approx & " 4 " & Times,
                        Week & " " & Approx & " 4 " & Times,
                        Hour & " " & Less);
                  end;
                  if To_String (Texts (Relative_Future_Many))
                    /= B ("3520E0A498E0A482E0A49FE0A58720E0A4ACE0A4BEE0A4A6")
                  then
                     Error
                       (Locale, Relative_Future_Many,
                        To_String (Texts (Relative_Future_Many)),
                        "expected explicit Hindi future relative wording");
                  end if;
            end if;
            if Locale = "ar" then
               declare
                  Core_Minute : constant String :=
                    B ("D9A220D8AFD982D8A7D8A6D982");
                  Core_Day    : constant String :=
                    B ("D9A220D8A3D98AD8A7D985");
                  Core_Week   : constant String :=
                    B ("D9A220D8A3D8B3D8A7D8A8D98AD8B9");
                  Core_Month  : constant String :=
                    B ("D9A220D8A3D8B4D987D8B1");
                  Core_Year   : constant String :=
                    B ("D9A220D8B3D986D988D8A7D8AA");
                  Kilometer   : constant String :=
                    B ("D9A520D983D98AD984D988D985D8AAD8B1D8A7D8AA");
                  Centimeter  : constant String :=
                    B ("D9A520D8B3D986D8AAD98AD985D8AAD8B1D8A7D8AA");
                  Millimeter  : constant String :=
                    B ("D9A520D985D984D98AD985D8AAD8B1D8A7D8AA");
                  Core_Gram   : constant String :=
                    B ("D9A520D8BAD8B1D8A7D985D8A7D8AA");
                  Milligram   : constant String :=
                    B ("D9A520D985D984D98AD8BAD8B1D8A7D985D8A7D8AA");
                  Core_Liter  : constant String :=
                    B ("D9A520D984D8AAD8B1D8A7D8AA");
                  Milliliter  : constant String :=
                    B ("D9A520D985D984D98AD984D8AAD8B1D8A7D8AA");
               begin
                  Audit_Non_ASCII_Core (Locale, Texts);
                  Audit_Native_Script_No_Latin (Locale, Texts);
                  Audit_Generated_Core
                    (Locale, Texts, Core_Minute, Core_Day, Core_Week,
                     Core_Month, Core_Year, Kilometer, Centimeter, Millimeter,
                     Core_Gram, Milligram, Core_Liter, Milliliter);
               end;
            end if;
            if Locale = "nl" then
               Audit_Dutch_Core (Texts);
            end if;
            Audit_Reviewed_Latin_Upgrades (Locale, Texts);
            if not Summary_Only and then not Failures_Only then
               Print_Row (Locale, Texts);
            end if;
         end;
         <<Continue>>
         null;
      end loop;

      if Locale_Filter'Length > 0 and then Audited_Locales = 0 then
         Ada.Text_IO.Put_Line
           (Ada.Text_IO.Standard_Error,
            "error: locale audit unknown shipped locale: " & Locale_Filter);
         Errors := Errors + 1;
      end if;

      if Summary_Only or else Failures_Only then
         Ada.Text_IO.Put_Line
           ("locale audit summary: "
            & Natural'Image (Audited_Locales) & " locale(s), "
            & Natural'Image (Errors) & " error(s)");
      end if;

      if Errors = 0 then
         Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
      else
         Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
      end if;
   end Run_Audit;
