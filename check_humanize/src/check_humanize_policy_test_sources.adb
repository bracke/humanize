with Ada.Directories;

with Check_Humanize_Policy_Support; use Check_Humanize_Policy_Support;

package body Check_Humanize_Policy_Test_Sources is
   procedure Check_Test_Source_Size_Guards
     (Root   : String;
      Errors : in out Natural)
   is
      Manifest : constant String :=
        Read_File (Root, "docs/TEST_SOURCE_BUDGETS.toml");
      Search      : Ada.Directories.Search_Type;
      Search_Open : Boolean := False;
      Item        : Ada.Directories.Directory_Entry_Type;
      Budget_Count : Natural := 0;

      function Is_Subunit_Test (Name : String) return Boolean is
        (Contains (Name, "-test_") or else Contains (Name, "-check_"));

      procedure Count_Budget (Entry_Pos : Positive) is
         Prefix : constant String :=
           Manifest_String_Value_After (Manifest, "prefix = ", Entry_Pos);
         Parent_Max : constant Natural :=
           Natural_Value_After (Manifest, "parent_max_lines = ", Entry_Pos);
         Subunit_Max : constant Natural :=
           Natural_Value_After (Manifest, "subunit_max_lines = ", Entry_Pos);
         Usecase : constant String :=
           Manifest_String_Value_After (Manifest, "usecase = ", Entry_Pos);
      begin
         if Prefix = "" or else Parent_Max = 0 or else Subunit_Max = 0
           or else Usecase = ""
         then
            Error (Errors, "test source budget entry is incomplete");
         else
            Budget_Count := Budget_Count + 1;
         end if;
      end Count_Budget;

      procedure Count_Budgets is new Iterate_Manifest_Section (Count_Budget);

      function Budget_For
        (Relative_Path : String;
         Is_Subunit    : Boolean)
         return Natural
      is
         Best_Length : Natural := 0;
         Best_Max    : Natural := 0;

         procedure Consider_Budget (Entry_Pos : Positive) is
            Prefix : constant String :=
              Manifest_String_Value_After (Manifest, "prefix = ", Entry_Pos);
            Parent_Max : constant Natural :=
              Natural_Value_After
                (Manifest, "parent_max_lines = ", Entry_Pos);
            Subunit_Max : constant Natural :=
              Natural_Value_After
                (Manifest, "subunit_max_lines = ", Entry_Pos);
         begin
            if Prefix /= "" and then Starts_With (Relative_Path, Prefix)
              and then Prefix'Length > Best_Length
            then
               Best_Length := Prefix'Length;
               Best_Max := (if Is_Subunit then Subunit_Max else Parent_Max);
            end if;
         end Consider_Budget;

         procedure Consider_Budgets is
           new Iterate_Manifest_Section (Consider_Budget);
      begin
         Consider_Budgets (Manifest, "suite");
         return Best_Max;
      end Budget_For;
   begin
      Count_Budgets (Manifest, "suite");
      Require_Minimum
        (Root, Errors, "test_source_budget_min_entries", Budget_Count,
         "test source budget manifest covers too few suites");

      Ada.Directories.Start_Search
        (Search    => Search,
         Directory => Root & "/tests/src",
         Pattern   => "humanize-tests-*.adb",
         Filter    => [Ada.Directories.Ordinary_File => True, others => False]);
      Search_Open := True;

      while Ada.Directories.More_Entries (Search) loop
         Ada.Directories.Get_Next_Entry (Search, Item);
         declare
            Name : constant String := Ada.Directories.Simple_Name (Item);
            Relative_Path : constant String := "tests/src/" & Name;
            Lines : constant Natural :=
              Line_Count (Read_File (Root, Relative_Path));
            Max_Lines : constant Natural :=
              Budget_For (Relative_Path, Is_Subunit_Test (Name));
         begin
            if Max_Lines = 0 then
               Error
                 (Errors,
                  "test source budget missing for " & Relative_Path);
            elsif Lines > Max_Lines then
               Error
                 (Errors,
                  "test source size guard exceeded for " & Relative_Path);
            end if;
         end;
      end loop;

      Ada.Directories.End_Search (Search);
      Search_Open := False;
   exception
      when Constraint_Error
         | Ada.Directories.Name_Error
         | Ada.Directories.Use_Error =>
         if Search_Open then
            Ada.Directories.End_Search (Search);
         end if;
         raise;
   end Check_Test_Source_Size_Guards;
end Check_Humanize_Policy_Test_Sources;
