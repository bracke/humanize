separate (Humanize.Tests.Parsing)
   procedure Test_Text_Domain_Round_Trips
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      procedure Check_Text_Path_And_Name_Parsers is separate;
      procedure Check_Domain_And_Phrase_Metadata_Parsers is separate;
      procedure Check_Summary_Selection_And_Collection_Parsers is separate;
   begin
      Check_Text_Path_And_Name_Parsers;
      Check_Domain_And_Phrase_Metadata_Parsers;
      Check_Summary_Selection_And_Collection_Parsers;
   end Test_Text_Domain_Round_Trips;
