with Ada.Calendar;

with Humanize.Parsing;
with Humanize.Parsing.Date_Times;
with Humanize.Parsing.Domain_Labels;
with Humanize.Parsing.Durations;
with Humanize.Parsing.Numbers;
with Humanize.Parsing.Strings;
with Humanize.Parsing.Units;

separate (Perf_Smoke)
   procedure Run_Parse_Bucket
     (Started : out Ada.Calendar.Time;
      Stopped : out Ada.Calendar.Time)
   is
   begin
      Started := Ada.Calendar.Clock;
      for I in 1 .. Iterations loop
         declare
            Parsed_Bytes : constant Humanize.Parsing.Byte_Parse_Result :=
              Humanize.Parsing.Parse_Bytes ("1.5 KiB");
            Parsed_Duration : constant Humanize.Parsing.Duration_Parse_Result :=
              Humanize.Parsing.Parse_Duration ("2 hours, 30 minutes");
            Parsed_Number : constant Humanize.Parsing.Number_Parse_Result :=
              Humanize.Parsing.Parse_Cardinal ("forty two");
            Parsed_Color_Label :
              constant Humanize.Parsing.Color_Label_Parse_Result :=
                Humanize.Parsing.Parse_RGB_Label ("rgb(12, 34, 56)");
            Parsed_Date : constant Humanize.Parsing.Date_Parse_Result :=
              Humanize.Parsing.Date_Times.Parse_Natural_Date
                (Ada.Calendar.Time_Of (2024, 1, 1, 0.0), "next friday");
            Parsed_Domain : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
              Humanize.Parsing.Domain_Labels.Parse_Domain_Summary
                ("job running: 3 of 10 tasks complete, 1 failed");
            Parsed_Duration_Child :
              constant Humanize.Parsing.Duration_Parse_Result :=
                Humanize.Parsing.Durations.Parse_Duration
                  ("2 hours, 30 minutes");
            Parsed_Number_Child : constant Humanize.Parsing.Number_Parse_Result :=
              Humanize.Parsing.Numbers.Parse_Cardinal ("forty two");
            Parsed_String : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
              Humanize.Parsing.Strings.Parse_Identifier_Label
                ("release_candidate");
            Parsed_Unit : constant Humanize.Parsing.Unit_Parse_Result :=
              Humanize.Parsing.Units.Parse_Unit ("5 km");
         begin
            Check_Status (Parsed_Bytes.Status, "bytes parse");
            Check_Status (Parsed_Duration.Status, "duration parse");
            Check_Status (Parsed_Number.Status, "cardinal parse");
            Check_Status (Parsed_Color_Label.Status, "rgb label parse");
            Check_Status (Parsed_Date.Status, "date child parse");
            Check_Status (Parsed_Domain.Status, "domain child parse");
            Check_Status (Parsed_Duration_Child.Status, "duration child parse");
            Check_Status (Parsed_Number_Child.Status, "number child parse");
            Check_Status (Parsed_String.Status, "string child parse");
            Check_Status (Parsed_Unit.Status, "unit child parse");
            Total :=
              Total
              + Parsed_Bytes.Consumed
              + Parsed_Duration.Consumed
              + Parsed_Number.Consumed
              + Parsed_Color_Label.Consumed
              + Parsed_Date.Consumed
              + Parsed_Domain.Consumed
              + Parsed_Duration_Child.Consumed
              + Parsed_Number_Child.Consumed
              + Parsed_String.Consumed
              + Parsed_Unit.Consumed
              + I mod 3;
         end;
      end loop;
      Stopped := Ada.Calendar.Clock;
   end Run_Parse_Bucket;
