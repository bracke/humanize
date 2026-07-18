separate (Locale_Audit)
   procedure Audit_Native_Script_No_Latin
     (Locale : String;
      Texts  : Sample_Texts)
   is
      procedure Check (Label : Sample_Label) is
         Text : constant String := To_String (Texts (Label));
      begin
         if Has_ASCII_Letter (Text) then
            Error
              (Locale, Label, Text,
               "expected reviewed native-script wording without Latin fallback");
         end if;
      end Check;
   begin
      Check (Duration_Second);
      Check (Duration_Minute);
      Check (Duration_Hour);
      Check (Duration_Day);
      Check (Duration_Week);
      Check (Duration_Month);
      Check (Duration_Year);
      Check (Compact_Thousand);
      Check (Compact_Million);
      Check (Frequency_Count);
      Check (Rate_Second);
      Check (Rate_Minute);
      Check (Rate_Hour);
      Check (Rate_Day);
      Check (Rate_Week);
      Check (Rate_Hour_Less);
      Check (Unit_Meter);
      Check (Unit_Kilometer);
      Check (Unit_Centimeter);
      Check (Unit_Millimeter);
      Check (Unit_Gram);
      Check (Unit_Kilogram);
      Check (Unit_Milligram);
      Check (Unit_Liter);
      Check (Unit_Milliliter);
      Check (Unit_Celsius);
      Check (Unit_Square_Meter);
      Check (Unit_Kilometer_Per_Hour);
      Check (Unit_Teaspoon);
      Check (Unit_Fahrenheit);
      Check (Unit_Hectare);
      Check (Unit_Meter_Per_Second);
      Check (Unit_Pascal);
      Check (Unit_Kilopascal);
      Check (Unit_Joule);
      Check (Unit_Kilojoule);
      Check (Unit_Watt);
      Check (Unit_Kilowatt);
      Check (Unit_Hertz);
      Check (Unit_Kilohertz);
      Check (Unit_Degree);
      Check (Unit_Mile);
      Check (Unit_Yard);
      Check (Unit_Foot);
      Check (Unit_Inch);
      Check (Unit_Nautical_Mile);
      Check (Unit_Acre);
      Check (Unit_Square_Kilometer);
      Check (Unit_Cubic_Meter);
      Check (Unit_Tablespoon);
      Check (Unit_Cup);
      Check (Unit_Gallon);
      Check (Unit_Pound);
      Check (Unit_Ounce);
      Check (Unit_Stone);
      Check (Unit_Tonne);
      Check (Unit_Ton);
      Check (Relative_Past);
      Check (Relative_Past_Many);
      Check (Relative_Future_Many);
      Check (Natural_Today);
      Check (Natural_Tomorrow);
   end Audit_Native_Script_No_Latin;
