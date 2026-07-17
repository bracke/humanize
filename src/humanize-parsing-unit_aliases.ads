with Humanize.Units;

private package Humanize.Parsing.Unit_Aliases is
   function Static_Unit_Value
     (Text : String;
      Unit : out Humanize.Units.Unit_Kind)
      return Boolean;

   function Generated_Unit_Value
     (Text : String;
      Unit : out Humanize.Units.Unit_Kind)
      return Boolean;
end Humanize.Parsing.Unit_Aliases;
