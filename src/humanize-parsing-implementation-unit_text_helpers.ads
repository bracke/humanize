with Humanize.Units;

private package Humanize.Parsing.Implementation.Unit_Text_Helpers is
   function Parse_Unit
     (Text : String)
      return Unit_Parse_Result;
   function Scan_Unit
     (Text : String)
      return Unit_Parse_Result;
   function Known_Compound_Unit (Unit : String) return Boolean;
end Humanize.Parsing.Implementation.Unit_Text_Helpers;
