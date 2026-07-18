with Ada.Directories;

with Check_Humanize_Policy_Support; use Check_Humanize_Policy_Support;
with Project_Tools.Release_Checks;

package body Check_Humanize_Policy_Examples is
   procedure Check_Examples_Inventory
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      Project_Tools.Release_Checks.Require_GPR_Main_Inventory
        (Project_File       => Root & "/examples/examples.gpr",
         Documentation_File => Root & "/README.md",
         Source_Directory   => Root & "/examples");
   exception
      when Program_Error =>
         Error (Errors, "examples project mains must have source and documentation");
   end Check_Examples_Inventory;

   procedure Check_Example_Coverage_Manifest
     (Root   : String;
      Errors : in out Natural)
   is
      Manifest   : constant String :=
        Read_File (Root, "docs/EXAMPLE_COVERAGE.toml");
      Public_API : constant String := Read_File (Root, "docs/PUBLIC_API.toml");
      Examples_GPR : constant String := Read_File (Root, "examples/examples.gpr");
      Count      : Natural := 0;

      procedure Check_Entry (Entry_Pos : Positive) is
         Area : constant String :=
           Manifest_String_Value_After (Manifest, "area = ", Entry_Pos);
         Unit_Name : constant String :=
           Manifest_String_Value_After (Manifest, "unit = ", Entry_Pos);
         Example : constant String :=
           Manifest_String_Value_After (Manifest, "example = ", Entry_Pos);
         Usecase : constant String :=
           Manifest_String_Value_After (Manifest, "usecase = ", Entry_Pos);
      begin
         if Area = "" or else Unit_Name = "" or else Example = ""
           or else Usecase = ""
         then
            Error (Errors, "example coverage manifest entry is incomplete");
         else
            Require_File (Root, Errors, Example);
            if not Contains
              (Examples_GPR,
               """" & Ada.Directories.Simple_Name (Example) & """")
            then
               Error
                 (Errors,
                  "example coverage references executable absent from "
                  & "examples.gpr: " & Example);
            end if;
            if not Contains (Public_API, "name = """ & Unit_Name & """") then
               Error
                 (Errors,
                  "example coverage references non-public unit: " & Unit_Name);
            end if;
            Count := Count + 1;
         end if;
      end Check_Entry;

      procedure Check_Entries is new Iterate_Manifest_Section (Check_Entry);
   begin
      Check_Entries (Manifest, "coverage");

      Require_Minimum
        (Root, Errors, "example_coverage_min_major_tasks", Count,
         "example coverage manifest must cover major API tasks");

      Require_Minimum
        (Root, Errors, "example_coverage_min_public_api_families", Count,
         "example coverage manifest must cover expanded public API families");

      if not Contains (Manifest, "examples/parse_demo.adb")
        or else not Contains (Manifest, "examples/bounded_demo.adb")
        or else not Contains (Manifest, "examples/color_demo.adb")
        or else not Contains (Manifest, "examples/domain_demo.adb")
        or else not Contains (Manifest, "examples/system_status_demo.adb")
        or else not Contains (Manifest, "examples/ui_labels_demo.adb")
        or else not Contains (Manifest, "examples/security_data_demo.adb")
        or else not Contains (Manifest, "examples/workflow_ops_demo.adb")
        or else not Contains (Manifest, "examples/product_details_demo.adb")
        or else not Contains (Manifest, "examples/public_surface_demo.adb")
      then
         Error (Errors, "example coverage manifest must include focused examples");
      end if;
   end Check_Example_Coverage_Manifest;
end Check_Humanize_Policy_Examples;
