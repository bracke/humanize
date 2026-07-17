with Humanize.Domain_Details;
with Humanize.Status;

--  Human-readable labels for geographic coordinates and directions.
package Humanize.Geo is

   type Direction_Style is
     (Cardinal_4,
      Intercardinal_8,
      Intercardinal_16);
   --  Direction precision used when labeling bearings.

   type Direction_Point is
     (North,
      North_North_East,
      North_East,
      East_North_East,
      East,
      East_South_East,
      South_East,
      South_South_East,
      South,
      South_South_West,
      South_West,
      West_South_West,
      West,
      West_North_West,
      North_West,
      North_North_West);
   --  Sixteen-point compass direction.

   type Direction_Label_Style is
     (Direction_Long,
      Direction_Short);
   --  Long labels use words such as "northwest"; short labels use "NW".

   type Geo_Output_Mode is
     (Geo_Detailed,
      Geo_Compact,
      Geo_Accessible,
      Geo_Log);
   --  Output display policy for geographic labels.

   type Geo_Label_Options is record
      Mode             : Geo_Output_Mode := Geo_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;
   --  Domain-label options for geographic labels.

   Default_Geo_Label_Options : constant Geo_Label_Options :=
     (Mode             => Geo_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Geo_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;
   --  Parsed geographic label with name and state spans.

   type Bounding_Box is record
      South : Long_Float;
      West  : Long_Float;
      North : Long_Float;
      East  : Long_Float;
   end record;
   --  Geographic bounds in degrees. West > East represents an anti-meridian box.

   function Latitude_Label
     (Latitude : Long_Float;
      Decimals : Natural := 4)
      return Humanize.Status.Text_Result;
   --  @param Latitude Latitude in decimal degrees, from -90.0 to 90.0.
   --  @param Decimals Number of decimal places to render.
   --  @return Label such as "51.5074° N".

   function Longitude_Label
     (Longitude : Long_Float;
      Decimals  : Natural := 4)
      return Humanize.Status.Text_Result;
   --  @param Longitude Longitude in decimal degrees, from -180.0 to 180.0.
   --  @param Decimals Number of decimal places to render.
   --  @return Label such as "0.1278° W".

   function Coordinate_Label
     (Latitude  : Long_Float;
      Longitude : Long_Float;
      Decimals  : Natural := 4)
      return Humanize.Status.Text_Result;
   --  @param Latitude Latitude in decimal degrees.
   --  @param Longitude Longitude in decimal degrees.
   --  @param Decimals Number of decimal places to render.
   --  @return Label such as "51.5074° N, 0.1278° W".

   function Direction_Label
     (Point : Direction_Point;
      Style : Direction_Label_Style := Direction_Long)
      return Humanize.Status.Text_Result;
   --  @param Point Compass direction.
   --  @param Style Long or abbreviated label style.
   --  @return Direction label such as "northwest" or "NW".

   function Bearing_Label
     (Bearing : Long_Float;
      Style   : Direction_Style := Intercardinal_8;
      Labels  : Direction_Label_Style := Direction_Long;
      Decimals : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Bearing Bearing in degrees. Values are normalized into 0 <= n < 360.
   --  @param Style Direction precision for the bearing label.
   --  @param Labels Long or abbreviated direction labels.
   --  @param Decimals Number of decimal places for the numeric bearing.
   --  @return Bearing label such as "270° west".

   function Distance_Bearing_Label
     (Distance : String;
      Bearing  : Long_Float;
      Style    : Direction_Style := Intercardinal_8;
      Labels   : Direction_Label_Style := Direction_Long;
      Approximate : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Distance Caller-formatted distance label, such as "12 km".
   --  @param Bearing Bearing in degrees.
   --  @param Style Direction precision for the bearing label.
   --  @param Labels Long or abbreviated direction labels.
   --  @param Approximate Prefix the distance with "about".
   --  @return Distance and direction label such as "about 12 km northwest".

   function Bounding_Box_Label
     (Box      : Bounding_Box;
      Decimals : Natural := 4)
      return Humanize.Status.Text_Result;
   --  @param Box Geographic bounding box.
   --  @param Decimals Number of decimal places to render.
   --  @return Label for the south-west and north-east corners.

   function Contains
     (Box       : Bounding_Box;
      Latitude  : Long_Float;
      Longitude : Long_Float)
      return Boolean;
   --  @param Box Geographic bounding box. West > East spans the anti-meridian.
   --  @param Latitude Latitude in decimal degrees.
   --  @param Longitude Longitude in decimal degrees.
   --  @return True when the coordinate is inside the box.

   function Bounding_Box_Status_Label
     (Box       : Bounding_Box;
      Latitude  : Long_Float;
      Longitude : Long_Float)
      return Humanize.Status.Text_Result;
   --  @param Box Geographic bounding box.
   --  @param Latitude Latitude in decimal degrees.
   --  @param Longitude Longitude in decimal degrees.
   --  @return "inside bounding box" or "outside bounding box".

   function Coordinate_Label
     (Latitude  : Long_Float;
      Longitude : Long_Float;
      Options   : Geo_Label_Options;
      Decimals  : Natural := 4)
      return Humanize.Status.Text_Result;
   --  @param Latitude Latitude in decimal degrees.
   --  @param Longitude Longitude in decimal degrees.
   --  @param Options Domain-label output options.
   --  @param Decimals Number of decimal places to render.
   --  @return Coordinate label with optional geographic metadata.

   function Bearing_Label
     (Bearing : Long_Float;
      Options : Geo_Label_Options;
      Style   : Direction_Style := Intercardinal_8;
      Labels  : Direction_Label_Style := Direction_Long;
      Decimals : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Bearing Bearing in degrees.
   --  @param Options Domain-label output options.
   --  @param Style Direction precision for the bearing label.
   --  @param Labels Long or abbreviated direction labels.
   --  @param Decimals Number of decimal places for the numeric bearing.
   --  @return Bearing label with optional geographic metadata.

   function Bounding_Box_Status_Label
     (Box       : Bounding_Box;
      Latitude  : Long_Float;
      Longitude : Long_Float;
      Options   : Geo_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Box Geographic bounding box.
   --  @param Latitude Latitude in decimal degrees.
   --  @param Longitude Longitude in decimal degrees.
   --  @param Options Domain-label output options.
   --  @return Bounding-box status label with optional geographic metadata.

   function Bounding_Box_Status_Metadata
     (Inside : Boolean)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param Inside True when a coordinate is inside a bounding box.
   --  @return Stable metadata for a bounding-box containment status.

   function Parse_Bounding_Box_Status_Label
     (Text   : String;
      Inside : Boolean)
      return Geo_Label_Parse_Result;
   --  @param Text Label in "name inside/outside bounding box" form.
   --  @param Inside Expected containment state.
   --  @return Parsed label spans and geographic metadata.

   function Scan_Bounding_Box_Status_Label
     (Text   : String;
      Inside : Boolean)
      return Geo_Label_Parse_Result;
   --  @param Text Text beginning with a bounding-box status label.
   --  @param Inside Expected containment state.
   --  @return Parsed prefix label spans and geographic metadata.

   procedure Coordinate_Label_Into
     (Latitude  : Long_Float;
      Longitude : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Decimals  : Natural := 4);
   --  @param Latitude Latitude in decimal degrees.
   --  @param Longitude Longitude in decimal degrees.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Decimals Number of decimal places to render.

   procedure Bearing_Label_Into
     (Bearing  : Long_Float;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Style    : Direction_Style := Intercardinal_8;
      Labels   : Direction_Label_Style := Direction_Long;
      Decimals : Natural := 0);
   --  @param Bearing Bearing in degrees.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Style Direction precision for the bearing label.
   --  @param Labels Long or abbreviated direction labels.
   --  @param Decimals Number of decimal places for the numeric bearing.

   procedure Bounding_Box_Status_Label_Into
     (Box       : Bounding_Box;
      Latitude  : Long_Float;
      Longitude : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Box Geographic bounding box.
   --  @param Latitude Latitude in decimal degrees.
   --  @param Longitude Longitude in decimal degrees.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Bounding_Box_Status_Label_Into
     (Box       : Bounding_Box;
      Latitude  : Long_Float;
      Longitude : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Geo_Label_Options);
   --  @param Box Geographic bounding box.
   --  @param Latitude Latitude in decimal degrees.
   --  @param Longitude Longitude in decimal degrees.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Domain-label output options.

end Humanize.Geo;
