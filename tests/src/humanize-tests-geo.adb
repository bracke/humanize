with AUnit.Assertions;

with Humanize.Domain_Details;
with Humanize.Geo;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Geo is
   use Humanize.Geo;
   use Humanize.Status;
   use type Humanize.Domain_Details.Domain_Surface;

   Degree : constant String :=
     Character'Val (16#C2#) & Character'Val (16#B0#);

   procedure Check
     (Result   : Text_Result;
      Expected : String;
      Message  : String)
   is
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Test_Coordinate_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check
        (Latitude_Label (51.5074, 4),
         "51.5074" & Degree & " N",
         "latitude north");
      Check
        (Longitude_Label (-0.1278, 4),
         "0.1278" & Degree & " W",
         "longitude west");
      Check
        (Coordinate_Label (51.5074, -0.1278, 4),
         "51.5074" & Degree & " N, 0.1278" & Degree & " W",
         "coordinate pair");
      Check
        (Coordinate_Label (-33.8688, 151.2093, 2),
         "33.87" & Degree & " S, 151.21" & Degree & " E",
         "coordinate rounding and hemispheres");
      Check
        (Coordinate_Label (0.0, 0.0, 0),
         "0" & Degree & " N, 0" & Degree & " E",
         "zero coordinate");

      Invalid := Latitude_Label (91.0);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid latitude",
         "invalid latitude rejected");

      Invalid := Longitude_Label (-181.0);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid longitude",
         "invalid longitude rejected");
   end Test_Coordinate_Labels;

   procedure Test_Direction_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (Direction_Label (North_West), "northwest", "long direction");
      Check (Direction_Label (North_West, Direction_Short), "NW", "short direction");
      Check
        (Bearing_Label (270.0),
         "270" & Degree & " west",
         "west bearing");
      Check
        (Bearing_Label (-45.0, Intercardinal_8, Direction_Short),
         "315" & Degree & " NW",
         "negative bearing normalization");
      Check
        (Bearing_Label (22.5, Intercardinal_16),
         "23" & Degree & " north-northeast",
         "sixteen-point bearing");
      Check
        (Bearing_Label (361.25, Cardinal_4, Direction_Long, 1),
         "1.3" & Degree & " north",
         "decimal bearing normalization");
      Check
        (Distance_Bearing_Label ("12 km", 315.0),
         "about 12 km northwest",
         "approximate distance bearing");
      Check
        (Distance_Bearing_Label ("12 km", 90.0, Cardinal_4, Direction_Short, False),
         "12 km E",
         "exact short distance bearing");
   end Test_Direction_Labels;

   procedure Test_Bounding_Boxes (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      London : constant Bounding_Box :=
        (South => 51.28, West => -0.51, North => 51.70, East => 0.33);
      Pacific : constant Bounding_Box :=
        (South => -20.0, West => 170.0, North => 20.0, East => -170.0);
      Invalid : constant Bounding_Box :=
        (South => 10.0, West => -5.0, North => 0.0, East => 5.0);
      Result : Text_Result;
      Parsed : Geo_Label_Parse_Result;
   begin
      Check
        (Bounding_Box_Label (London, 2),
         "southwest 51.28" & Degree & " N, 0.51" & Degree & " W; northeast "
         & "51.70" & Degree & " N, 0.33" & Degree & " E",
         "bounding box label");

      AUnit.Assertions.Assert
        (Contains (London, 51.5074, -0.1278),
         "contains point in normal box");
      AUnit.Assertions.Assert
        (not Contains (London, 48.8566, 2.3522),
         "does not contain outside point");
      AUnit.Assertions.Assert
        (Contains (Pacific, 0.0, 179.0)
         and then Contains (Pacific, 0.0, -179.0)
         and then not Contains (Pacific, 0.0, -100.0),
         "anti-meridian containment");

      Check
        (Bounding_Box_Status_Label (London, 51.5074, -0.1278),
         "inside bounding box",
         "inside box status");
      Check
        (Bounding_Box_Status_Label (London, 48.8566, 2.3522),
         "outside bounding box",
         "outside box status");

      Check
        (Bounding_Box_Status_Label
           (London, 48.8566, 2.3522,
            (Mode             => Geo_Detailed,
             Include_Surface  => True,
             Include_Severity => True,
             Include_Tone     => False)),
         "[geo info] outside bounding box",
         "outside box status with metadata");

      Parsed := Parse_Bounding_Box_Status_Label
        ("London inside bounding box", True);
      AUnit.Assertions.Assert
        (Parsed.Status = Ok
         and then Parsed.Consumed = 26
         and then Parsed.Name_Length = 6
         and then Parsed.Metadata.Surface = Humanize.Domain_Details.Geo_Surface,
         "parse bounding box status");

      Parsed := Scan_Bounding_Box_Status_Label
        ("London outside bounding box, updated", False);
      AUnit.Assertions.Assert
        (Parsed.Status = Ok
         and then Parsed.Consumed = 27
         and then Parsed.State_Length = 20,
         "scan bounding box status");

      Result := Bounding_Box_Status_Label (Invalid, 5.0, 0.0);
      AUnit.Assertions.Assert
        (Result.Status = Invalid_Argument
         and then Support.Text (Result) = "invalid bounding box",
         "invalid bounding box rejected");
   end Test_Bounding_Boxes;

   procedure Test_Bounded_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Coord  : String (1 .. 30);
      Bearing : String (1 .. 7);
      Tiny   : String (1 .. 8);
      Tagged_Text : String (1 .. 12);
      Offset : String (2 .. 9);
      Written : Natural;
      Code : Status_Code;
      London : constant Bounding_Box :=
        (South => 51.28, West => -0.51, North => 51.70, East => 0.33);
   begin
      Coordinate_Label_Into (51.5074, -0.1278, Coord, Written, Code, 4);
      AUnit.Assertions.Assert
         (Code = Ok
         and then Written = 23
         and then Coord (1 .. Written) =
           "51.5074" & Degree & " N, 0.1278" & Degree & " W",
         "coordinate bounded exact text");

      Bearing_Label_Into (270.0, Bearing, Written, Code, Intercardinal_8, Direction_Short);
      AUnit.Assertions.Assert
        (Code = Ok
         and then Written = 7
         and then Bearing = "270" & Degree & " W",
         "bearing bounded exact text");

      Bounding_Box_Status_Label_Into (London, 51.5074, -0.1278, Tiny, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 8 and then Tiny = "inside b",
         "bounding status overflow prefix");

      Bounding_Box_Status_Label_Into
        (London, 48.8566, 2.3522, Tagged_Text, Written, Code,
         (Mode             => Geo_Detailed,
          Include_Surface  => True,
          Include_Severity => True,
          Include_Tone     => False));
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow
         and then Written = 12
         and then Tagged_Text = "[geo info] o",
         "bounding status options overflow prefix");

      Coordinate_Label_Into (51.5074, -0.1278, Offset, Written, Code, 4);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "coordinate bounded rejects non-1-based buffers");

      Coordinate_Label_Into (91.0, 0.0, Coord, Written, Code, 4);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "coordinate bounded returns validation status");
   end Test_Bounded_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize geo tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Coordinate_Labels'Access, "coordinate labels");
      Register_Routine (T, Test_Direction_Labels'Access, "direction labels");
      Register_Routine (T, Test_Bounding_Boxes'Access, "bounding boxes");
      Register_Routine (T, Test_Bounded_Labels'Access, "bounded labels");
   end Register_Tests;

end Humanize.Tests.Geo;
