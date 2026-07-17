private package Humanize.Catalogs.Unit_Data is

   function Added_Unit_Keys (Locale : String) return String;
   --  @return Generated added unit catalog keys for Locale.

   function Extra_Unit_Keys (Locale : String) return String;
   --  @return Generated extended unit catalog keys for Locale.

end Humanize.Catalogs.Unit_Data;
