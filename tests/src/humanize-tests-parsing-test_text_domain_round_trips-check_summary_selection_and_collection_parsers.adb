separate (Humanize.Tests.Parsing.Test_Text_Domain_Round_Trips)
   procedure Check_Summary_Selection_And_Collection_Parsers is
      Sync_Summary : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Sync_Summary
          ("sync running: 8 of 10 items complete, 1 failed");
      Import_Summary : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Import_Summary
          ("import running: 1 of 1 record complete");
      Export_Summary : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Export_Summary ("export running: no files");
      Unknown_Total_Summary : constant
        Humanize.Parsing.Domain_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Domain_Summary
            ("job complete: 3 tasks complete");
      File_Size : constant Humanize.Parsing.File_Size_Summary_Parse_Result :=
        Humanize.Parsing.Parse_File_Size_Summary ("3 files, 1.5 KiB");
      Empty_File_Size : constant
        Humanize.Parsing.File_Size_Summary_Parse_Result :=
          Humanize.Parsing.Parse_File_Size_Summary ("no files, 0 bytes");
      Transfer : constant Humanize.Parsing.Transfer_Remaining_Parse_Result :=
        Humanize.Parsing.Parse_Transfer_Remaining
          ("2 MB remaining at 1 kB/s");
      Transfer_Complete : constant
        Humanize.Parsing.Transfer_Remaining_Parse_Result :=
          Humanize.Parsing.Parse_Transfer_Remaining ("transfer complete");
      Transfer_Stalled : constant
        Humanize.Parsing.Transfer_Remaining_Parse_Result :=
          Humanize.Parsing.Parse_Transfer_Remaining
            ("2 MB remaining, stalled");
      Disk : constant Humanize.Parsing.Disk_Usage_Parse_Result :=
        Humanize.Parsing.Parse_Disk_Usage ("1.5 kB of 10 kB used (15%)");
      Validation : constant Humanize.Parsing.Validation_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Validation_Summary
          ("3 errors: email is invalid, password is too short and 1 other");
      Validation_Headline : constant
        Humanize.Parsing.Validation_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Validation_Summary ("3 errors");
      Validation_Ok : constant
        Humanize.Parsing.Validation_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Validation_Summary ("no errors");
      Validation_Warning : constant
        Humanize.Parsing.Validation_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Validation_Summary ("2 warnings");
      Field_Problems : constant Humanize.Parsing.Field_Problem_Parse_Result :=
        Humanize.Parsing.Parse_Field_Problem_Summary
          ("email: 2 errors: is invalid and is already used");
      No_Selection : constant Humanize.Parsing.Selection_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Selection_Summary ("no items selected");
      All_Selected : constant
        Humanize.Parsing.Selection_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Selection_Summary ("all 5 items selected");
      Partial_Selection : constant
        Humanize.Parsing.Selection_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Selection_Summary
            ("3 of 5 items selected");
      More : constant Humanize.Parsing.More_Count_Parse_Result :=
        Humanize.Parsing.Parse_More_Count ("3 shown, +4 more");
      Pagination : constant Humanize.Parsing.Pagination_Range_Parse_Result :=
        Humanize.Parsing.Parse_Pagination_Range ("21-40 of 153 results");
      Collection_Summary : constant
        Humanize.Parsing.Collection_Display_Parse_Result :=
          Humanize.Parsing.Parse_Collection_Display ("3 shown, +4 more");
      Collection_Compact_More : constant
        Humanize.Parsing.Collection_Display_Parse_Result :=
          Humanize.Parsing.Parse_Collection_Display ("+4");
      Collection_Compact_Visible : constant
        Humanize.Parsing.Collection_Display_Parse_Result :=
          Humanize.Parsing.Parse_Collection_Display ("3");
      Collection_Screen : constant
        Humanize.Parsing.Collection_Display_Parse_Result :=
          Humanize.Parsing.Parse_Collection_Display
            ("3 items shown, 4 items available");
   begin
      AUnit.Assertions.Assert
        (Sync_Summary.Status = Humanize.Status.Ok
         and then Sync_Summary.Domain (1 .. Sync_Summary.Domain_Length) =
           "sync"
         and then Sync_Summary.Completed = 8
         and then Sync_Summary.Total = 10
         and then Sync_Summary.Failed = 1
         and then Sync_Summary.Unit (1 .. Sync_Summary.Unit_Length) =
           "items",
         "parse sync summary output");
      AUnit.Assertions.Assert
        (Import_Summary.Status = Humanize.Status.Ok
         and then Import_Summary.Domain (1 .. Import_Summary.Domain_Length) =
           "import"
         and then Import_Summary.Completed = 1
         and then Import_Summary.Total = 1
         and then Import_Summary.Unit (1 .. Import_Summary.Unit_Length) =
           "record",
         "parse import summary output");
      AUnit.Assertions.Assert
        (Export_Summary.Status = Humanize.Status.Ok
         and then Export_Summary.Domain (1 .. Export_Summary.Domain_Length) =
           "export"
         and then Export_Summary.Completed = 0
         and then Export_Summary.Total = 0
         and then Export_Summary.Unit (1 .. Export_Summary.Unit_Length) =
           "files",
         "parse export summary output");
      AUnit.Assertions.Assert
        (Unknown_Total_Summary.Status = Humanize.Status.Ok
         and then Unknown_Total_Summary.Completed = 3
         and then Unknown_Total_Summary.Total = 0
         and then Unknown_Total_Summary.Unit
           (1 .. Unknown_Total_Summary.Unit_Length) = "tasks",
         "parse unknown-total domain summary output");
      AUnit.Assertions.Assert
        (File_Size.Status = Humanize.Status.Ok
         and then File_Size.File_Count = 3
         and then File_Size.Total = 1536,
         "parse file-size summary output");
      AUnit.Assertions.Assert
        (Empty_File_Size.Status = Humanize.Status.Ok
         and then Empty_File_Size.File_Count = 0
         and then Empty_File_Size.Total = 0,
         "parse empty file-size summary output");
      AUnit.Assertions.Assert
        (Transfer.Status = Humanize.Status.Ok
         and then Transfer.Remaining = 2_000_000
         and then Transfer.Bytes_Per_Second = 1_000
         and then Transfer.Has_Rate,
         "parse transfer remaining with rate output");
      AUnit.Assertions.Assert
        (Transfer_Complete.Status = Humanize.Status.Ok
         and then Transfer_Complete.Complete,
         "parse transfer complete output");
      AUnit.Assertions.Assert
        (Transfer_Stalled.Status = Humanize.Status.Ok
         and then Transfer_Stalled.Remaining = 2_000_000
         and then Transfer_Stalled.Stalled,
         "parse stalled transfer output");
      AUnit.Assertions.Assert
        (Disk.Status = Humanize.Status.Ok
         and then Disk.Used = 1_500
         and then Disk.Total = 10_000
         and then Disk.Percent_Used = 15,
         "parse disk usage output");
      AUnit.Assertions.Assert
        (Validation.Status = Humanize.Status.Ok
         and then Validation.Count = 3
         and then Validation.Severity =
           Humanize.Parsing.Parsed_Validation_Error
         and then Validation.Has_Details
         and then Validation.Other_Count = 1
         and then Validation.Details (1 .. Validation.Details_Length) =
           "email is invalid, password is too short and 1 other",
         "parse detailed validation summary output");
      AUnit.Assertions.Assert
        (Validation_Headline.Status = Humanize.Status.Ok
         and then Validation_Headline.Count = 3
         and then Validation_Headline.Severity =
           Humanize.Parsing.Parsed_Validation_Error
         and then not Validation_Headline.Has_Details,
         "parse validation summary headline");
      AUnit.Assertions.Assert
        (Validation_Ok.Status = Humanize.Status.Ok
         and then Validation_Ok.Count = 0
         and then Validation_Ok.Severity =
           Humanize.Parsing.Parsed_Validation_Error,
         "parse empty validation summary");
      AUnit.Assertions.Assert
        (Validation_Warning.Status = Humanize.Status.Ok
         and then Validation_Warning.Count = 2
         and then Validation_Warning.Severity =
           Humanize.Parsing.Parsed_Validation_Warning,
         "parse validation warning summary");
      AUnit.Assertions.Assert
        (Field_Problems.Status = Humanize.Status.Ok
         and then Field_Problems.Field
           (1 .. Field_Problems.Field_Length) = "email"
         and then Field_Problems.Summary.Count = 2
         and then Field_Problems.Summary.Details
           (1 .. Field_Problems.Summary.Details_Length) =
             "is invalid and is already used",
         "parse field problem summary output");
      AUnit.Assertions.Assert
        (No_Selection.Status = Humanize.Status.Ok
         and then No_Selection.Kind = Humanize.Parsing.Selection_None
         and then No_Selection.Selected = 0
         and then No_Selection.Total = 0
         and then No_Selection.Unit (1 .. No_Selection.Unit_Length) =
           "items",
         "parse empty selection summary output");
      AUnit.Assertions.Assert
        (All_Selected.Status = Humanize.Status.Ok
         and then All_Selected.Kind = Humanize.Parsing.Selection_All
         and then All_Selected.Selected = 5
         and then All_Selected.Total = 5
         and then All_Selected.Unit (1 .. All_Selected.Unit_Length) =
           "items",
         "parse all selection summary output");
      AUnit.Assertions.Assert
        (Partial_Selection.Status = Humanize.Status.Ok
         and then Partial_Selection.Kind = Humanize.Parsing.Selection_Partial
         and then Partial_Selection.Selected = 3
         and then Partial_Selection.Total = 5
         and then Partial_Selection.Unit
           (1 .. Partial_Selection.Unit_Length) = "items",
         "parse partial selection summary output");
      AUnit.Assertions.Assert
        (More.Status = Humanize.Status.Ok
         and then More.Visible = 3
         and then More.Remaining = 4,
         "parse more-count summary output");
      AUnit.Assertions.Assert
        (Pagination.Status = Humanize.Status.Ok
         and then Pagination.First = 21
         and then Pagination.Last = 40
         and then Pagination.Total = 153
         and then Pagination.Unit (1 .. Pagination.Unit_Length) = "results",
         "parse pagination range output");
      AUnit.Assertions.Assert
        (Collection_Summary.Status = Humanize.Status.Ok
         and then Collection_Summary.Kind =
           Humanize.Parsing.Collection_Summary
         and then Collection_Summary.Visible = 3
         and then Collection_Summary.Remaining = 4,
         "parse collection summary output");
      AUnit.Assertions.Assert
        (Collection_Compact_More.Status = Humanize.Status.Ok
         and then Collection_Compact_More.Kind =
           Humanize.Parsing.Collection_Compact
         and then Collection_Compact_More.Visible = 0
         and then Collection_Compact_More.Remaining = 4,
         "parse compact collection remaining output");
      AUnit.Assertions.Assert
        (Collection_Compact_Visible.Status = Humanize.Status.Ok
         and then Collection_Compact_Visible.Kind =
           Humanize.Parsing.Collection_Compact
         and then Collection_Compact_Visible.Visible = 3
         and then Collection_Compact_Visible.Remaining = 0,
         "parse compact collection visible output");
      AUnit.Assertions.Assert
        (Collection_Screen.Status = Humanize.Status.Ok
         and then Collection_Screen.Kind =
           Humanize.Parsing.Collection_Screen_Reader
         and then Collection_Screen.Visible = 3
         and then Collection_Screen.Remaining = 4
         and then Collection_Screen.Visible_Unit
           (1 .. Collection_Screen.Visible_Unit_Length) = "items"
         and then Collection_Screen.Remaining_Unit
           (1 .. Collection_Screen.Remaining_Unit_Length) = "items",
         "parse screen-reader collection output");
   end Check_Summary_Selection_And_Collection_Parsers;
