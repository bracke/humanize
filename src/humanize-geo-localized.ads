with Humanize.Contexts;

--  Geographic labels in a context's locale: hemispheres from CLDR's coordinate
--  units ("52,5200° N", Japanese "北緯52.5200°"), numbers in the locale's
--  digits, compass points and frames through the phrase catalog
--  (docs/PHRASE_TEMPLATES.md, "Geo"). Each is the parent's function of the
--  same name in English, and so is every invalid input's message.
package Humanize.Geo.Localized is

   function Latitude_Label
     (Context  : Humanize.Contexts.Context;
      Latitude : Long_Float;
      Decimals : Natural := 4)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Latitude Latitude in decimal degrees.
   --  @param Decimals Fraction digits.
   --  @return The latitude with its hemisphere.

   function Longitude_Label
     (Context   : Humanize.Contexts.Context;
      Longitude : Long_Float;
      Decimals  : Natural := 4)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Longitude Longitude in decimal degrees.
   --  @param Decimals Fraction digits.
   --  @return The longitude with its hemisphere.

   function Coordinate_Label
     (Context   : Humanize.Contexts.Context;
      Latitude  : Long_Float;
      Longitude : Long_Float;
      Decimals  : Natural := 4)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Latitude Latitude in decimal degrees.
   --  @param Longitude Longitude in decimal degrees.
   --  @param Decimals Fraction digits.
   --  @return Latitude and longitude as one label.

   function Direction_Label
     (Context : Humanize.Contexts.Context;
      Point   : Direction_Point;
      Style   : Direction_Label_Style := Direction_Long)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Point Compass point.
   --  @param Style Full name or abbreviation.
   --  @return The compass point's name.

   function Bearing_Label
     (Context  : Humanize.Contexts.Context;
      Bearing  : Long_Float;
      Style    : Direction_Style := Intercardinal_8;
      Labels   : Direction_Label_Style := Direction_Long;
      Decimals : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Bearing Bearing in degrees.
   --  @param Style Compass precision.
   --  @param Labels Full names or abbreviations.
   --  @param Decimals Fraction digits.
   --  @return The bearing's degrees and compass point.

   function Distance_Bearing_Label
     (Context     : Humanize.Contexts.Context;
      Distance    : String;
      Bearing     : Long_Float;
      Style       : Direction_Style := Intercardinal_8;
      Labels      : Direction_Label_Style := Direction_Long;
      Approximate : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Distance A rendered distance ("5 km").
   --  @param Bearing Bearing in degrees.
   --  @param Style Compass precision.
   --  @param Labels Full names or abbreviations.
   --  @param Approximate Whether the distance is approximate.
   --  @return The distance toward the bearing's compass point.

   function Bounding_Box_Label
     (Context  : Humanize.Contexts.Context;
      Box      : Bounding_Box;
      Decimals : Natural := 4)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Box Geographic bounding box.
   --  @param Decimals Fraction digits.
   --  @return The box's southwest and northeast corners.

   function Bounding_Box_Status_Label
     (Context   : Humanize.Contexts.Context;
      Box       : Bounding_Box;
      Latitude  : Long_Float;
      Longitude : Long_Float)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Box Geographic bounding box.
   --  @param Latitude Latitude in decimal degrees.
   --  @param Longitude Longitude in decimal degrees.
   --  @return Whether the point lies inside the box.

   procedure Latitude_Label_Into
     (Context  : Humanize.Contexts.Context;
      Latitude : Long_Float;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Decimals : Natural := 4);
   --  @param Context Formatting context.
   --  @param Latitude Latitude in decimal degrees.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Decimals Fraction digits.

   procedure Longitude_Label_Into
     (Context   : Humanize.Contexts.Context;
      Longitude : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Decimals  : Natural := 4);
   --  @param Context Formatting context.
   --  @param Longitude Longitude in decimal degrees.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Decimals Fraction digits.

   procedure Coordinate_Label_Into
     (Context   : Humanize.Contexts.Context;
      Latitude  : Long_Float;
      Longitude : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Decimals  : Natural := 4);
   --  @param Context Formatting context.
   --  @param Latitude Latitude in decimal degrees.
   --  @param Longitude Longitude in decimal degrees.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Decimals Fraction digits.

   procedure Direction_Label_Into
     (Context : Humanize.Contexts.Context;
      Point   : Direction_Point;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Style   : Direction_Label_Style := Direction_Long);
   --  @param Context Formatting context.
   --  @param Point Compass point.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Style Full name or abbreviation.

   procedure Bearing_Label_Into
     (Context  : Humanize.Contexts.Context;
      Bearing  : Long_Float;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Style    : Direction_Style := Intercardinal_8;
      Labels   : Direction_Label_Style := Direction_Long;
      Decimals : Natural := 0);
   --  @param Context Formatting context.
   --  @param Bearing Bearing in degrees.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Style Compass precision.
   --  @param Labels Full names or abbreviations.
   --  @param Decimals Fraction digits.

   procedure Distance_Bearing_Label_Into
     (Context     : Humanize.Contexts.Context;
      Distance    : String;
      Bearing     : Long_Float;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Style       : Direction_Style := Intercardinal_8;
      Labels      : Direction_Label_Style := Direction_Long;
      Approximate : Boolean := True);
   --  @param Context Formatting context.
   --  @param Distance A rendered distance ("5 km").
   --  @param Bearing Bearing in degrees.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Style Compass precision.
   --  @param Labels Full names or abbreviations.
   --  @param Approximate Whether the distance is approximate.

   procedure Bounding_Box_Label_Into
     (Context  : Humanize.Contexts.Context;
      Box      : Bounding_Box;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Decimals : Natural := 4);
   --  @param Context Formatting context.
   --  @param Box Geographic bounding box.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Decimals Fraction digits.

   procedure Bounding_Box_Status_Label_Into
     (Context   : Humanize.Contexts.Context;
      Box       : Bounding_Box;
      Latitude  : Long_Float;
      Longitude : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Box Geographic bounding box.
   --  @param Latitude Latitude in decimal degrees.
   --  @param Longitude Longitude in decimal degrees.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Geo.Localized;
