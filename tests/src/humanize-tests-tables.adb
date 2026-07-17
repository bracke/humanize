with AUnit.Assertions;

with Humanize.Domain_Details;
with Humanize.Status;
with Humanize.Tables;
with Humanize.Tests.Support;

package body Humanize.Tests.Tables is
   use Humanize.Status;
   use Humanize.Tables;

   procedure Check
     (Result   : Text_Result;
      Expected : String;
      Message  : String)
   is
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Test_Count_And_Size_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Check (Row_Count_Label (0), "no rows", "zero rows");
      Check (Row_Count_Label (1), "1 row", "one row");
      Check (Row_Count_Label (4), "4 rows", "many rows");
      Check (Column_Count_Label (0), "no columns", "zero columns");
      Check (Column_Count_Label (1), "1 column", "one column");
      Check (Table_Size_Label (3, 2), "3 rows by 2 columns", "table size");
   end Test_Count_And_Size_Labels;

   procedure Test_Selection_Filter_And_Page_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check (Selection_Label (0, 0), "no rows selectable", "empty selection");
      Check (Selection_Label (0, 5), "no rows selected", "none selected");
      Check (Selection_Label (2, 5), "2 of 5 rows selected", "partial selection");
      Check (Selection_Label (5, 5), "all 5 rows selected", "all selected");
      Check (Filter_Label (0, 0), "no rows", "empty filter");
      Check (Filter_Label (0, 5), "no rows match", "filter none");
      Check (Filter_Label (3, 5), "3 of 5 rows visible", "filter partial");
      Check (Filter_Label (5, 5), "all 5 rows visible", "filter all");
      Check (Row_Range_Label (0, 0, 0), "no rows", "empty row range");
      Check (Row_Range_Label (5, 5, 20), "row 5 of 20", "single row range");
      Check (Row_Range_Label (21, 40, 120), "rows 21-40 of 120", "row range");
      Check (Page_Label (0, 0), "no pages", "no pages");
      Check (Page_Label (2, 5), "page 2 of 5", "page label");
      Check (Page_Label (2, 5, Rows => 20), "page 2 of 5, 20 rows", "page rows");

      Invalid := Selection_Label (6, 5);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid selection count",
         "invalid selection count rejected");
      Invalid := Filter_Label (6, 5);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid visible row count",
         "invalid visible row count rejected");
      Invalid := Page_Label (6, 5);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid page number",
         "invalid page number rejected");
      Invalid := Row_Range_Label (40, 21, 120);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid row range",
         "invalid row range rejected");
   end Test_Selection_Filter_And_Page_Labels;

   procedure Test_Sort_Column_And_Cell_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      use type Humanize.Domain_Details.Domain_Severity;
      Invalid : Text_Result;
      Sort_Detailed : constant Text_Result :=
        Sort_Label
          ("name", Ascending_Sort,
           Table_Label_Options'
             (Mode             => Table_Detailed,
              Include_Surface  => True,
              Include_Severity => True,
              Include_Tone     => False));
      Cell_Detailed : constant Text_Result :=
        Cell_Label
          (2, 3, Invalid_Cell,
           Table_Label_Options'
             (Mode             => Table_Detailed,
              Include_Surface  => True,
              Include_Severity => True,
              Include_Tone     => False));
      Parsed_Cell : constant Table_Label_Parse_Result :=
        Parse_Cell_Label ("row 2, column 3 invalid", Invalid_Cell);
      Scanned_Cell : constant Table_Label_Parse_Result :=
        Scan_Cell_Label ("row 2, column 3 invalid trailing", Invalid_Cell);
   begin
      Check (Sort_Direction_Label (Unsorted), "not sorted", "unsorted label");
      Check (Sort_Direction_Label (Ascending_Sort), "ascending", "ascending label");
      Check (Sort_Label ("name", Ascending_Sort), "sorted by name ascending", "sort label");
      Check (Sort_Label ("ignored", Unsorted), "not sorted", "unsorted summary");
      Check (Column_Role_Label (Status_Column), "status column", "role label");
      Check (Column_Label ("status", Status_Column), "status status column", "column label");
      Check (Column_Label ("actions", Action_Column), "actions action column", "action column");
      Check (Cell_Position_Label (2, 3), "row 2, column 3", "cell position");
      Check (Cell_State_Label (Invalid_Cell), "invalid cell", "cell state");
      Check (Cell_Label (2, 3, Edited_Cell), "row 2, column 3 edited", "cell label");
      Check
        (Sort_Detailed,
         "[tables info] sorted by name ascending",
         "sort option metadata");
      Check
        (Cell_Detailed,
         "[tables danger] row 2, column 3 invalid",
         "cell option metadata");
      AUnit.Assertions.Assert
        (Parsed_Cell.Status = Ok
         and then Parsed_Cell.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Cell.Name_Length = 15,
         "parse cell metadata");
      AUnit.Assertions.Assert
        (Scanned_Cell.Status = Ok
         and then Scanned_Cell.Consumed = 23,
         "scan cell prefix");

      Invalid := Sort_Label (" ", Ascending_Sort);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid sort column",
         "empty sort column rejected");
      Invalid := Column_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid column name",
         "empty column name rejected");
   end Test_Sort_Column_And_Cell_Labels;

   procedure Test_Group_And_Subtotal_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check (Group_Label ("status: open", 3), "status: open: 3 rows", "group label");
      Check (Subtotal_Label ("revenue", "$120"), "subtotal revenue: $120", "subtotal");

      Invalid := Group_Label (" ", 3);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid group name",
         "empty group rejected");
      Invalid := Subtotal_Label ("revenue", " ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid subtotal",
         "empty subtotal rejected");
   end Test_Group_And_Subtotal_Labels;

   procedure Test_Bounded_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Exact  : String (1 .. 20);
      Tiny   : String (1 .. 10);
      Offset : String (2 .. 12);
      Written : Natural;
      Code : Status_Code;
   begin
      Selection_Label_Into (2, 5, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 20
         and then Exact = "2 of 5 rows selected",
         "selection bounded exact text");

      Sort_Label_Into ("name", Ascending_Sort, Tiny, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 10
         and then Tiny = "sorted by ",
         "sort bounded overflow prefix");

      Row_Count_Label_Into (2, Offset, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "row bounded rejects non-1-based buffers");

      Page_Label_Into (6, 5, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "page bounded returns validation status");

      Filter_Label_Into (3, 5, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 19
         and then Exact (1 .. Written) = "3 of 5 rows visible",
         "filter bounded exact text");

      Sort_Direction_Label_Into (Descending_Sort, Tiny, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 10 and then Tiny = "descending",
         "sort direction bounded exact text");

      Cell_State_Label_Into (Read_Only_Cell, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 14
         and then Exact (1 .. Written) = "read-only cell",
         "cell state bounded exact text");

      Row_Range_Label_Into (40, 21, 120, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "row range bounded returns validation status");

      Cell_Label_Into
        (2, 3, Invalid_Cell, Exact, Written, Code,
         Table_Label_Options'
           (Mode             => Table_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 20
         and then Exact = "[tables danger] row ",
         "cell option bounded overflow");
   end Test_Bounded_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize table/report tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Count_And_Size_Labels'Access,
        "count and size labels");
      Register_Routine (T, Test_Selection_Filter_And_Page_Labels'Access,
        "selection filter and page labels");
      Register_Routine (T, Test_Sort_Column_And_Cell_Labels'Access,
        "sort column and cell labels");
      Register_Routine (T, Test_Group_And_Subtotal_Labels'Access,
        "group and subtotal labels");
      Register_Routine (T, Test_Bounded_Labels'Access,
        "bounded labels");
   end Register_Tests;

end Humanize.Tests.Tables;
