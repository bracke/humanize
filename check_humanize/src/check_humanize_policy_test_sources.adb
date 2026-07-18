with Check_Humanize_Policy_Support; use Check_Humanize_Policy_Support;
with Project_Tools.Source_Budgets;

package body Check_Humanize_Policy_Test_Sources is
   procedure Check_Test_Source_Size_Guards
     (Root   : String;
      Errors : in out Natural)
   is
   begin
      Project_Tools.Source_Budgets.Check_Test_Source_Budgets
        (Errors          => Errors,
         Root            => Root,
         Manifest_Path   => "docs/TEST_SOURCE_BUDGETS.toml",
         Test_Source_Dir => "tests/src",
         File_Pattern    => "humanize-tests-*.adb",
         Minimum_Entries =>
           Policy_Threshold (Root, "test_source_budget_min_entries"),
         Purpose         => "test source budget");
   end Check_Test_Source_Size_Guards;
end Check_Humanize_Policy_Test_Sources;
