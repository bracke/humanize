separate (Humanize.Tests.Parsing)
   procedure Test_Parser_Smoke_Baseline
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Total : Natural := 0;
   begin
      for I in 1 .. 250 loop
         declare
            Bytes : constant Humanize.Parsing.Byte_Parse_Result :=
              Humanize.Parsing.Parse_Bytes ("1.5 KiB");
            Duration : constant Humanize.Parsing.Duration_Parse_Result :=
              Humanize.Parsing.Parse_Duration ("2 hours, 30 minutes");
            Cardinal : constant Humanize.Parsing.Number_Parse_Result :=
              Humanize.Parsing.Parse_Cardinal ("forty two");
            Unit : constant Humanize.Parsing.Unit_Parse_Result :=
              Humanize.Parsing.Parse_Unit ("3 meters");
            Rate : constant Humanize.Parsing.Rate_Parse_Result :=
              Humanize.Parsing.Parse_Rate ("4 times per week");
            List : constant Humanize.Parsing.List_Parse_Result :=
              Humanize.Parsing.Parse_List ("Ada, SPARK and Alire");
         begin
            AUnit.Assertions.Assert
              (Bytes.Status = Humanize.Status.Ok
               and then Duration.Status = Humanize.Status.Ok
               and then Cardinal.Status = Humanize.Status.Ok
               and then Unit.Status = Humanize.Status.Ok
               and then Rate.Status = Humanize.Status.Ok
               and then List.Status = Humanize.Status.Ok,
               "parser smoke baseline iteration" & Integer'Image (I));
            Total :=
              Total
              + Bytes.Consumed
              + Duration.Consumed
              + Cardinal.Consumed
              + Unit.Consumed
              + Rate.Consumed
              + List.Consumed;
         end;
      end loop;

      AUnit.Assertions.Assert
        (Total = 250 * (7 + 19 + 9 + 8 + 16 + 20),
         "parser smoke baseline consumed stable representative inputs");
   end Test_Parser_Smoke_Baseline;
