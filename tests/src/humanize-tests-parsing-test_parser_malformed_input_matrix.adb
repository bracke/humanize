separate (Humanize.Tests.Parsing)
   procedure Test_Parser_Malformed_Input_Matrix
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Reference : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (2026, 7, 16, 12.0 * 3_600.0);
   begin
      declare
         Bytes : constant Humanize.Parsing.Byte_Parse_Result :=
           Humanize.Parsing.Parse_Bytes ("not-a-number KiB");
         Duration : constant Humanize.Parsing.Duration_Parse_Result :=
           Humanize.Parsing.Parse_Duration ("PT");
         Compact : constant Humanize.Parsing.Number_Parse_Result :=
           Humanize.Parsing.Parse_Compact_Number ("glorb");
         Cardinal : constant Humanize.Parsing.Number_Parse_Result :=
           Humanize.Parsing.Parse_Cardinal ("one two nope");
         Unit : constant Humanize.Parsing.Unit_Parse_Result :=
           Humanize.Parsing.Parse_Unit ("5 not-a-unit");
         Rate : constant Humanize.Parsing.Rate_Parse_Result :=
           Humanize.Parsing.Parse_Rate ("times per maybe");
         List : constant Humanize.Parsing.List_Parse_Result :=
           Humanize.Parsing.Parse_List ("");
         CSS : constant Humanize.Parsing.Color_Label_Parse_Result :=
           Humanize.Parsing.Parse_CSS_Color_Label ("rgb(1,,2)");
         Date : constant Humanize.Parsing.Date_Parse_Result :=
           Humanize.Parsing.Parse_Natural_Date (Reference, "next someday");
         Date_Time : constant Humanize.Parsing.Natural_Date_Time_Parse_Result :=
           Humanize.Parsing.Parse_Natural_Date_Time
             (Reference, "tomorrow at 99:99");
      begin
         AUnit.Assertions.Assert
           (Bytes.Status /= Humanize.Status.Ok
            and then Bytes.Error = Humanize.Parsing.Expected_Number,
            "malformed byte parser returns expected-number diagnostic");
         AUnit.Assertions.Assert
           (Duration.Status /= Humanize.Status.Ok
            and then Duration.Error = Humanize.Parsing.Unsupported_Form,
            "malformed duration parser returns unsupported-form diagnostic");
         AUnit.Assertions.Assert
           (Compact.Status /= Humanize.Status.Ok
            and then Compact.Error = Humanize.Parsing.Expected_Number,
            "malformed compact-number parser returns expected-number diagnostic");
         AUnit.Assertions.Assert
           (Cardinal.Status /= Humanize.Status.Ok
            and then Cardinal.Error /= Humanize.Parsing.No_Parse_Error,
            "malformed cardinal parser returns diagnostic");
         AUnit.Assertions.Assert
           (Unit.Status /= Humanize.Status.Ok
            and then Unit.Error = Humanize.Parsing.Expected_Unit,
            "malformed unit parser returns expected-unit diagnostic");
         AUnit.Assertions.Assert
           (Rate.Status /= Humanize.Status.Ok
            and then Rate.Error /= Humanize.Parsing.No_Parse_Error,
            "malformed rate parser returns diagnostic");
         AUnit.Assertions.Assert
           (List.Status /= Humanize.Status.Ok
            and then List.Error /= Humanize.Parsing.No_Parse_Error,
            "malformed list parser returns diagnostic");
         AUnit.Assertions.Assert
           (CSS.Status /= Humanize.Status.Ok
            and then CSS.Error = Humanize.Parsing.Expected_Separator,
            "malformed CSS color parser returns expected-separator diagnostic");
         AUnit.Assertions.Assert
           (Date.Status /= Humanize.Status.Ok
            and then Date.Error /= Humanize.Parsing.No_Parse_Error,
            "malformed natural date parser returns diagnostic");
         AUnit.Assertions.Assert
           (Date_Time.Status /= Humanize.Status.Ok
            and then Date_Time.Error /= Humanize.Parsing.No_Parse_Error,
            "malformed natural date-time parser returns diagnostic");
      end;
   end Test_Parser_Malformed_Input_Matrix;
