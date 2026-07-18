with Humanize.Catalogs.Encoding;

package body Humanize.Catalogs.Unit_Data is

   --  Provenance: generated from Humanize unit catalog templates and reviewed
   --  as checked-in Ada source. Keep currentness notes in docs/QUALITY_GUARDS.md.

   --  Data boundary: this body intentionally holds generated unit catalog
   --  fragments. Keep behavioral lookup/loader logic outside this table unit.

   LF : constant String := [1 => ASCII.LF];

   AA     : String renames Humanize.Catalogs.Encoding.AA;
   ECIRC  : String renames Humanize.Catalogs.Encoding.ECIRC;
   IACUTE : String renames Humanize.Catalogs.Encoding.IACUTE;
   NTILDE : String renames Humanize.Catalogs.Encoding.NTILDE;

   function B (Hex : String) return String
      renames Humanize.Catalogs.Encoding.B;

   function Unit_Line
     (Locale   : String;
      Key      : String;
      Singular : String;
      Plural   : String)
      return String
   is
   begin
      return
        Locale & ".humanize.unit." & Key & " = "
        & "{count, plural, one {{value, number} " & Singular & "} "
        & "other {{value, number} " & Plural & "}}" & LF;
   end Unit_Line;

   function Added_Unit_Non_Latin_Tail (Locale : String) return String;

   function Extra_Unit_Non_Latin_Tail
     (Locale          : String;
      Teaspoon_Sing   : String;
      Teaspoon_Plural : String)
      return String;

   function Added_Unit_Keys_With_Tail
     (Locale                    : String;
      Celsius_Sing              : String;
      Celsius_Plural            : String;
      Fahrenheit_Sing           : String;
      Fahrenheit_Plural         : String;
      Square_Meter_Sing         : String;
      Square_Meter_Plural       : String;
      Hectare_Sing              : String;
      Hectare_Plural            : String;
      Kilometer_Per_Hour_Sing   : String;
      Kilometer_Per_Hour_Plural : String;
      Meter_Per_Second_Sing     : String;
      Meter_Per_Second_Plural   : String)
      return String
   is
   begin
      return
        Unit_Line (Locale, "celsius", Celsius_Sing, Celsius_Plural)
        & Unit_Line
            (Locale, "fahrenheit", Fahrenheit_Sing, Fahrenheit_Plural)
        & Unit_Line
            (Locale, "square_meter", Square_Meter_Sing, Square_Meter_Plural)
        & Unit_Line (Locale, "hectare", Hectare_Sing, Hectare_Plural)
        & Unit_Line
            (Locale, "kilometer_per_hour",
             Kilometer_Per_Hour_Sing, Kilometer_Per_Hour_Plural)
        & Unit_Line
            (Locale, "meter_per_second",
             Meter_Per_Second_Sing, Meter_Per_Second_Plural)
        & Added_Unit_Non_Latin_Tail (Locale);
   end Added_Unit_Keys_With_Tail;

   function Extra_Unit_Keys_With_Tail
     (Locale          : String;
      Teaspoon_Sing   : String;
      Teaspoon_Plural : String)
      return String
   is
   begin
      return Extra_Unit_Non_Latin_Tail
        (Locale, Teaspoon_Sing, Teaspoon_Plural);
   end Extra_Unit_Keys_With_Tail;

   pragma Style_Checks (Off);

   function Added_Unit_Non_Latin_Tail (Locale : String) return String
      is separate;

   function Extra_Unit_Non_Latin_Tail
     (Locale          : String;
      Teaspoon_Sing   : String;
      Teaspoon_Plural : String)
      return String
      is separate;

   pragma Style_Checks (On);

   function Added_Unit_Keys (Locale : String) return String
      is separate;

   function Extra_Unit_Keys (Locale : String) return String
      is separate;

end Humanize.Catalogs.Unit_Data;
