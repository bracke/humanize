separate (Humanize.Tests.Parsing)
   procedure Test_Diagnostics (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);

      Empty_Bytes : constant Humanize.Parsing.Byte_Parse_Result :=
        Humanize.Parsing.Parse_Bytes ("");
      Bad_Byte_Number : constant Humanize.Parsing.Byte_Parse_Result :=
        Humanize.Parsing.Parse_Bytes ("wat bytes");
      Bad_Byte_Unit : constant Humanize.Parsing.Byte_Parse_Result :=
        Humanize.Parsing.Parse_Bytes ("42 widgets");
      Bad_Duration_Range :
        constant Humanize.Parsing.Duration_Range_Parse_Result :=
          Humanize.Parsing.Parse_Duration_Range ("1 hour 2 hours");
      Reversed_Duration_Range :
        constant Humanize.Parsing.Duration_Range_Parse_Result :=
          Humanize.Parsing.Parse_Duration_Range ("2 hours-1 hour");
      Bad_Number_Range :
        constant Humanize.Parsing.Number_Range_Parse_Result :=
          Humanize.Parsing.Parse_Number_Range ("between 3 7");
      Reversed_Number_Range :
        constant Humanize.Parsing.Number_Range_Parse_Result :=
          Humanize.Parsing.Parse_Number_Range ("7-3");
      Bad_Proportion : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Proportion ("1 of 4");
      Bad_Unit : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit ("2 widgets");
      Bad_CSS : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_CSS_Length ("1.5 widget");
      Bad_Compound : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Compound_Unit ("2.5 widgets");
      Bad_Aspect : constant Humanize.Parsing.Aspect_Ratio_Parse_Result :=
        Humanize.Parsing.Parse_Aspect_Ratio ("16 by 9");
      Bad_Roman : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Roman ("IIII");
      Bad_Business : constant Humanize.Parsing.Business_Calendar_Parse_Result :=
        Humanize.Parsing.Parse_Business_Calendar
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0), "maintenance");
      Bad_RGB_Range : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_RGB_Label ("rgb(300, 2, 3)");
      Bad_RGB_Syntax : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_RGB_Label ("rgb(1, 2)");
      Bad_CSS_Hex : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_CSS_Color_Label ("#12xz99");
      Bad_CSS_Name : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_CSS_Color_Label ("nonesuch-color");
      Bad_Color_Summary : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_Color_Summary ("#336699rgb(51, 102, 153)");
      Bad_HSL : constant Humanize.Parsing.Color_Model_Label_Parse_Result :=
        Humanize.Parsing.Parse_HSL_Label ("hsl(210 50% 40%)");
      Bad_Color_Bucket : constant Humanize.Parsing.Color_Bucket_Label_Parse_Result :=
        Humanize.Parsing.Parse_Color_Bucket_Label ("not a bucket");
      Bad_Color_Description : constant
        Humanize.Parsing.Color_Description_Parse_Result :=
          Humanize.Parsing.Parse_Color_Description
            ("dark muted blue cool moderate chroma");
      Bad_Worded_Range :
        constant Humanize.Parsing.Decimal_Range_Parse_Result :=
          Humanize.Parsing.Parse_Decimal_Range_Words
            ("one point two three point four");
      Bad_Remediation :
        constant Humanize.Parsing.Contrast_Remediation_Parse_Result :=
          Humanize.Parsing.Parse_Contrast_Remediation_Label ("use nope");
      Bad_Timezone_Name : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0), "tomorrow at 5pm XYZ");
   begin
      AUnit.Assertions.Assert
        (Empty_Bytes.Error = Humanize.Parsing.Empty_Input
         and then Humanize.Parsing.Diagnostic
           (Empty_Bytes.Status, Empty_Bytes.Error_Position, Empty_Bytes.Error)
           = Humanize.Parsing.Empty_Input,
         "empty input diagnostic");
      AUnit.Assertions.Assert
        (Bad_Byte_Number.Error = Humanize.Parsing.Expected_Number,
         "byte parser expected-number diagnostic");
      AUnit.Assertions.Assert
        (Bad_Byte_Unit.Error = Humanize.Parsing.Expected_Unit,
         "byte parser expected-unit diagnostic");
      AUnit.Assertions.Assert
        (Bad_Duration_Range.Error = Humanize.Parsing.Expected_Separator,
         "duration range separator diagnostic");
      AUnit.Assertions.Assert
        (Reversed_Duration_Range.Error = Humanize.Parsing.Out_Of_Range,
         "duration range out-of-range diagnostic");
      AUnit.Assertions.Assert
        (Bad_Number_Range.Error = Humanize.Parsing.Expected_Separator,
         "number range separator diagnostic");
      AUnit.Assertions.Assert
        (Reversed_Number_Range.Error = Humanize.Parsing.Out_Of_Range,
         "number range out-of-range diagnostic");
      AUnit.Assertions.Assert
        (Bad_Proportion.Error = Humanize.Parsing.Expected_Separator,
         "proportion separator diagnostic");
      AUnit.Assertions.Assert
        (Bad_Unit.Error = Humanize.Parsing.Expected_Unit,
         "unit expected-unit diagnostic");
      AUnit.Assertions.Assert
        (Bad_CSS.Error = Humanize.Parsing.Expected_Unit,
         "CSS expected-unit diagnostic");
      AUnit.Assertions.Assert
        (Bad_Compound.Error = Humanize.Parsing.Expected_Unit,
         "compound expected-unit diagnostic");
      AUnit.Assertions.Assert
        (Bad_Aspect.Error = Humanize.Parsing.Expected_Separator,
         "aspect separator diagnostic");
      AUnit.Assertions.Assert
        (Bad_Roman.Error = Humanize.Parsing.Unsupported_Form,
         "Roman unsupported-form diagnostic");
      AUnit.Assertions.Assert
        (Bad_Business.Error = Humanize.Parsing.Unsupported_Form,
         "business-calendar unsupported-form diagnostic");
      AUnit.Assertions.Assert
        (Bad_RGB_Range.Status = Humanize.Status.Invalid_Value
         and then Bad_RGB_Range.Error = Humanize.Parsing.Out_Of_Range
         and then Bad_RGB_Range.Error_Position = 5,
         "RGB out-of-range diagnostic position");
      AUnit.Assertions.Assert
        (Bad_RGB_Syntax.Error = Humanize.Parsing.Expected_Separator
         and then Bad_RGB_Syntax.Error_Position = 8,
         "RGB missing-separator diagnostic position");
      AUnit.Assertions.Assert
        (Bad_CSS_Hex.Error = Humanize.Parsing.Expected_Number
         and then Bad_CSS_Hex.Error_Position = 4,
         "CSS hex digit diagnostic position");
      AUnit.Assertions.Assert
        (Bad_CSS_Name.Error = Humanize.Parsing.Unsupported_Form
         and then Bad_CSS_Name.Error_Position = 1,
         "CSS unsupported color diagnostic position");
      AUnit.Assertions.Assert
        (Bad_Color_Summary.Error = Humanize.Parsing.Expected_Separator
         and then Bad_Color_Summary.Error_Position = 8,
         "color summary separator diagnostic position");
      AUnit.Assertions.Assert
        (Bad_HSL.Error = Humanize.Parsing.Expected_Separator
         and then Bad_HSL.Error_Position = 5,
         "HSL separator diagnostic position");
      AUnit.Assertions.Assert
        (Bad_Color_Bucket.Error = Humanize.Parsing.Unsupported_Form
         and then Bad_Color_Bucket.Error_Position = 1,
         "color bucket diagnostic position");
      AUnit.Assertions.Assert
        (Bad_Color_Description.Error = Humanize.Parsing.Expected_Separator
         and then Bad_Color_Description.Error_Position = 1,
         "color description separator diagnostic position");
      AUnit.Assertions.Assert
        (Bad_Worded_Range.Error = Humanize.Parsing.Expected_Separator
         and then Bad_Worded_Range.Error_Position > 0,
         "worded range separator diagnostic");
      AUnit.Assertions.Assert
        (Bad_Remediation.Error = Humanize.Parsing.Expected_Unit
         and then Bad_Remediation.Error_Position = 5,
         "contrast remediation diagnostic");
      AUnit.Assertions.Assert
        (Bad_Timezone_Name.Status = Humanize.Status.Invalid_Argument,
         "invalid timezone name diagnostic");
   end Test_Diagnostics;
