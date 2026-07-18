separate (Humanize.Tests.Numbers.Test_Cardinal_Fractional)
   procedure Check_Decimal_And_Fraction_Words is
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
   begin
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
   end Check_Decimal_And_Fraction_Words;
