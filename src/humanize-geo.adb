with Humanize.Bounded_Text;

package body Humanize.Geo is
   use type Humanize.Status.Status_Code;

   Degree : constant String :=
     Character'Val (16#C2#) & Character'Val (16#B0#);
   Max_Decimals : constant Natural := 9;

   function Status_Text
     (Status : Humanize.Status.Status_Code;
      Text   : String)
      return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Status_Text;

   function Text_Result
     (Text   : String;
      Status : Humanize.Status.Status_Code := Humanize.Status.Ok)
      return Humanize.Status.Text_Result is
     (Status_Text (Status, Text));

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Domain_Options
     (Options : Geo_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Geo_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Geo_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Geo_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Geo_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Decimal_Scale (Decimals : Natural) return Long_Long_Integer is
      Result : Long_Long_Integer := 1;
   begin
      for I in 1 .. Decimals loop
         pragma Unreferenced (I);
         Result := Result * 10;
      end loop;
      return Result;
   end Decimal_Scale;

   function Digits_Image (Value : Long_Long_Integer) return String
      renames Humanize.Bounded_Text.Image;

   function Fixed_Image
     (Value    : Long_Float;
      Decimals : Natural)
      return String
   is
      Places : constant Natural := Natural'Min (Decimals, Max_Decimals);
      Scale  : constant Long_Long_Integer := Decimal_Scale (Places);
      Abs_Value : constant Long_Float := abs Value;
      Rounded : constant Long_Long_Integer :=
        Long_Long_Integer (Long_Float'Rounding (Abs_Value * Long_Float (Scale)));
      Whole : constant Long_Long_Integer := Rounded / Scale;
      Frac  : constant Long_Long_Integer := Rounded mod Scale;
      Sign  : constant String := (if Value < 0.0 and then Rounded /= 0 then "-" else "");
   begin
      if Places = 0 then
         return Sign & Digits_Image (Whole);
      end if;

      declare
         Frac_Text : constant String := Digits_Image (Frac);
         Padding   : constant Natural := Places - Frac_Text'Length;
         Zeroes    : constant String (1 .. Padding) := [others => '0'];
      begin
         return Sign & Digits_Image (Whole) & "." & Zeroes & Frac_Text;
      end;
   end Fixed_Image;

   function Latitude_Valid (Latitude : Long_Float) return Boolean is
   begin
      return Latitude >= -90.0 and then Latitude <= 90.0;
   end Latitude_Valid;

   function Longitude_Valid (Longitude : Long_Float) return Boolean is
   begin
      return Longitude >= -180.0 and then Longitude <= 180.0;
   end Longitude_Valid;

   function Box_Valid (Box : Bounding_Box) return Boolean is
   begin
      return Latitude_Valid (Box.South)
        and then Latitude_Valid (Box.North)
        and then Longitude_Valid (Box.West)
        and then Longitude_Valid (Box.East)
        and then Box.South <= Box.North;
   end Box_Valid;

   function Latitude_Text
     (Latitude : Long_Float;
      Decimals : Natural)
      return String
   is
   begin
      if Latitude = 0.0 then
         return Fixed_Image (0.0, Decimals) & Degree & " N";
      elsif Latitude > 0.0 then
         return Fixed_Image (Latitude, Decimals) & Degree & " N";
      else
         return Fixed_Image (-Latitude, Decimals) & Degree & " S";
      end if;
   end Latitude_Text;

   function Longitude_Text
     (Longitude : Long_Float;
      Decimals  : Natural)
      return String
   is
   begin
      if Longitude = 0.0 then
         return Fixed_Image (0.0, Decimals) & Degree & " E";
      elsif Longitude > 0.0 then
         return Fixed_Image (Longitude, Decimals) & Degree & " E";
      else
         return Fixed_Image (-Longitude, Decimals) & Degree & " W";
      end if;
   end Longitude_Text;

   function Direction_Long_Text (Point : Direction_Point) return String is
   begin
      case Point is
         when North => return "north";
         when North_North_East => return "north-northeast";
         when North_East => return "northeast";
         when East_North_East => return "east-northeast";
         when East => return "east";
         when East_South_East => return "east-southeast";
         when South_East => return "southeast";
         when South_South_East => return "south-southeast";
         when South => return "south";
         when South_South_West => return "south-southwest";
         when South_West => return "southwest";
         when West_South_West => return "west-southwest";
         when West => return "west";
         when West_North_West => return "west-northwest";
         when North_West => return "northwest";
         when North_North_West => return "north-northwest";
      end case;
   end Direction_Long_Text;

   function Direction_Short_Text (Point : Direction_Point) return String is
   begin
      case Point is
         when North => return "N";
         when North_North_East => return "NNE";
         when North_East => return "NE";
         when East_North_East => return "ENE";
         when East => return "E";
         when East_South_East => return "ESE";
         when South_East => return "SE";
         when South_South_East => return "SSE";
         when South => return "S";
         when South_South_West => return "SSW";
         when South_West => return "SW";
         when West_South_West => return "WSW";
         when West => return "W";
         when West_North_West => return "WNW";
         when North_West => return "NW";
         when North_North_West => return "NNW";
      end case;
   end Direction_Short_Text;

   function Direction_Text
     (Point : Direction_Point;
      Style : Direction_Label_Style)
      return String
   is
   begin
      case Style is
         when Direction_Long =>
            return Direction_Long_Text (Point);
         when Direction_Short =>
            return Direction_Short_Text (Point);
      end case;
   end Direction_Text;

   function Normalize_Bearing (Bearing : Long_Float) return Long_Float is
      Result : Long_Float := Bearing;
   begin
      while Result < 0.0 loop
         Result := Result + 360.0;
      end loop;

      while Result >= 360.0 loop
         Result := Result - 360.0;
      end loop;

      return Result;
   end Normalize_Bearing;

   function Point_For_Bearing
     (Bearing : Long_Float;
      Style   : Direction_Style)
      return Direction_Point
   is
      Points : constant Positive :=
        (case Style is
            when Cardinal_4      => 4,
            when Intercardinal_8 => 8,
            when Intercardinal_16 => 16);
      Step : constant Long_Float := 360.0 / Long_Float (Points);
      Normalized : constant Long_Float := Normalize_Bearing (Bearing);
      Index : constant Natural :=
        Natural (Long_Float'Floor ((Normalized + Step / 2.0) / Step)) mod Points;
   begin
      case Style is
         when Cardinal_4 =>
            case Index is
               when 0 => return North;
               when 1 => return East;
               when 2 => return South;
               when others => return West;
            end case;
         when Intercardinal_8 =>
            case Index is
               when 0 => return North;
               when 1 => return North_East;
               when 2 => return East;
               when 3 => return South_East;
               when 4 => return South;
               when 5 => return South_West;
               when 6 => return West;
               when others => return North_West;
            end case;
         when Intercardinal_16 =>
            return Direction_Point'Val (Index);
      end case;
   end Point_For_Bearing;

   function Latitude_Label
     (Latitude : Long_Float;
      Decimals : Natural := 4)
      return Humanize.Status.Text_Result
   is
   begin
      if not Latitude_Valid (Latitude) then
         return Text_Result ("invalid latitude", Humanize.Status.Invalid_Argument);
      end if;

      return Text_Result (Latitude_Text (Latitude, Decimals));
   end Latitude_Label;

   function Longitude_Label
     (Longitude : Long_Float;
      Decimals  : Natural := 4)
      return Humanize.Status.Text_Result
   is
   begin
      if not Longitude_Valid (Longitude) then
         return Text_Result ("invalid longitude", Humanize.Status.Invalid_Argument);
      end if;

      return Text_Result (Longitude_Text (Longitude, Decimals));
   end Longitude_Label;

   function Coordinate_Label
     (Latitude  : Long_Float;
      Longitude : Long_Float;
      Decimals  : Natural := 4)
      return Humanize.Status.Text_Result
   is
   begin
      if not Latitude_Valid (Latitude) then
         return Text_Result ("invalid latitude", Humanize.Status.Invalid_Argument);
      elsif not Longitude_Valid (Longitude) then
         return Text_Result ("invalid longitude", Humanize.Status.Invalid_Argument);
      end if;

      return Text_Result
        (Latitude_Text (Latitude, Decimals) & ", "
         & Longitude_Text (Longitude, Decimals));
   end Coordinate_Label;

   function Direction_Label
     (Point : Direction_Point;
      Style : Direction_Label_Style := Direction_Long)
      return Humanize.Status.Text_Result
   is
   begin
      return Text_Result (Direction_Text (Point, Style));
   end Direction_Label;

   function Bearing_Label
     (Bearing : Long_Float;
      Style   : Direction_Style := Intercardinal_8;
      Labels  : Direction_Label_Style := Direction_Long;
      Decimals : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Normalized : constant Long_Float := Normalize_Bearing (Bearing);
      Point : constant Direction_Point := Point_For_Bearing (Bearing, Style);
   begin
      return Text_Result
        (Fixed_Image (Normalized, Decimals) & Degree & " "
         & Direction_Text (Point, Labels));
   end Bearing_Label;

   function Distance_Bearing_Label
     (Distance : String;
      Bearing  : Long_Float;
      Style    : Direction_Style := Intercardinal_8;
      Labels   : Direction_Label_Style := Direction_Long;
      Approximate : Boolean := True)
      return Humanize.Status.Text_Result
   is
      Point : constant Direction_Point := Point_For_Bearing (Bearing, Style);
      Prefix : constant String := (if Approximate then "about " else "");
   begin
      if Distance'Length = 0 then
         return Text_Result ("invalid distance", Humanize.Status.Invalid_Argument);
      end if;

      return Text_Result
        (Prefix & Distance & " " & Direction_Text (Point, Labels));
   end Distance_Bearing_Label;

   function Bounding_Box_Label
     (Box      : Bounding_Box;
      Decimals : Natural := 4)
      return Humanize.Status.Text_Result
   is
   begin
      if not Box_Valid (Box) then
         return Text_Result ("invalid bounding box", Humanize.Status.Invalid_Argument);
      end if;

      return Text_Result
        ("southwest "
         & Latitude_Text (Box.South, Decimals) & ", "
         & Longitude_Text (Box.West, Decimals)
         & "; northeast "
         & Latitude_Text (Box.North, Decimals) & ", "
         & Longitude_Text (Box.East, Decimals));
   end Bounding_Box_Label;

   function Contains
     (Box       : Bounding_Box;
      Latitude  : Long_Float;
      Longitude : Long_Float)
      return Boolean
   is
      Latitude_In_Range : constant Boolean :=
        Latitude >= Box.South and then Latitude <= Box.North;
      Longitude_In_Range : constant Boolean :=
        (if Box.West <= Box.East then
            Longitude >= Box.West and then Longitude <= Box.East
         else
            Longitude >= Box.West or else Longitude <= Box.East);
   begin
      return Box_Valid (Box)
        and then Latitude_Valid (Latitude)
        and then Longitude_Valid (Longitude)
        and then Latitude_In_Range
        and then Longitude_In_Range;
   end Contains;

   function Bounding_Box_Status_Suffix (Inside : Boolean) return String is
   begin
      return (if Inside then "inside bounding box" else "outside bounding box");
   end Bounding_Box_Status_Suffix;

   function Bounding_Box_Status_Label
     (Box       : Bounding_Box;
      Latitude  : Long_Float;
      Longitude : Long_Float)
      return Humanize.Status.Text_Result
   is
   begin
      if not Box_Valid (Box) then
         return Text_Result ("invalid bounding box", Humanize.Status.Invalid_Argument);
      elsif not Latitude_Valid (Latitude) then
         return Text_Result ("invalid latitude", Humanize.Status.Invalid_Argument);
      elsif not Longitude_Valid (Longitude) then
         return Text_Result ("invalid longitude", Humanize.Status.Invalid_Argument);
      elsif Contains (Box, Latitude, Longitude) then
         return Text_Result (Bounding_Box_Status_Suffix (True));
      else
         return Text_Result (Bounding_Box_Status_Suffix (False));
      end if;
   end Bounding_Box_Status_Label;

   function Coordinate_Label
     (Latitude  : Long_Float;
      Longitude : Long_Float;
      Options   : Geo_Label_Options;
      Decimals  : Natural := 4)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Coordinate_Label (Latitude, Longitude, Decimals);
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;

      return Humanize.Domain_Details.Domain_Label
        (Base,
         Humanize.Domain_Details.State_Metadata
           (Humanize.Domain_Details.Geo_Surface, "coordinate"),
         Domain_Options (Options));
   end Coordinate_Label;

   function Bearing_Label
     (Bearing : Long_Float;
      Options : Geo_Label_Options;
      Style   : Direction_Style := Intercardinal_8;
      Labels  : Direction_Label_Style := Direction_Long;
      Decimals : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Bearing_Label (Bearing, Style, Labels, Decimals);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base,
         Humanize.Domain_Details.State_Metadata
           (Humanize.Domain_Details.Geo_Surface, "bearing"),
         Domain_Options (Options));
   end Bearing_Label;

   function Bounding_Box_Status_Metadata
     (Inside : Boolean)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Geo_Surface,
         Bounding_Box_Status_Suffix (Inside));
   end Bounding_Box_Status_Metadata;

   function Bounding_Box_Status_Label
     (Box       : Bounding_Box;
      Latitude  : Long_Float;
      Longitude : Long_Float;
      Options   : Geo_Label_Options)
      return Humanize.Status.Text_Result
   is
      Inside : constant Boolean := Contains (Box, Latitude, Longitude);
      Base : constant Humanize.Status.Text_Result :=
        Bounding_Box_Status_Label (Box, Latitude, Longitude);
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;

      return Humanize.Domain_Details.Domain_Label
        (Base, Bounding_Box_Status_Metadata (Inside), Domain_Options (Options));
   end Bounding_Box_Status_Label;

   function Parse_Bounding_Box_Status_Label
     (Text   : String;
      Inside : Boolean)
      return Geo_Label_Parse_Result
   is
      Result : Geo_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Geo_Surface,
         Bounding_Box_Status_Suffix (Inside));
      Result.Metadata := Bounding_Box_Status_Metadata (Inside);
      return Result;
   end Parse_Bounding_Box_Status_Label;

   function Scan_Bounding_Box_Status_Label
     (Text   : String;
      Inside : Boolean)
      return Geo_Label_Parse_Result
   is
      Result : Geo_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Geo_Surface,
         Bounding_Box_Status_Suffix (Inside));
      Result.Metadata := Bounding_Box_Status_Metadata (Inside);
      return Result;
   end Scan_Bounding_Box_Status_Label;

   procedure Coordinate_Label_Into
     (Latitude  : Long_Float;
      Longitude : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Decimals  : Natural := 4)
   is
      Result : constant Humanize.Status.Text_Result :=
        Coordinate_Label (Latitude, Longitude, Decimals);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Coordinate_Label_Into;

   procedure Bearing_Label_Into
     (Bearing  : Long_Float;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Style    : Direction_Style := Intercardinal_8;
      Labels   : Direction_Label_Style := Direction_Long;
      Decimals : Natural := 0)
   is
      Result : constant Humanize.Status.Text_Result :=
        Bearing_Label (Bearing, Style, Labels, Decimals);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Bearing_Label_Into;

   procedure Bounding_Box_Status_Label_Into
     (Box       : Bounding_Box;
      Latitude  : Long_Float;
      Longitude : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Bounding_Box_Status_Label (Box, Latitude, Longitude);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Bounding_Box_Status_Label_Into;

   procedure Bounding_Box_Status_Label_Into
     (Box       : Bounding_Box;
      Latitude  : Long_Float;
      Longitude : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Geo_Label_Options)
   is
   begin
      Copy_Result
        (Bounding_Box_Status_Label (Box, Latitude, Longitude, Options),
         Target, Written, Status);
   end Bounding_Box_Status_Label_Into;

end Humanize.Geo;
