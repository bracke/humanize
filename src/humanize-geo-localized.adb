with Ada.Characters.Handling;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded;

with I18N.Unit_Format;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Locales;
with Humanize.Message_Keys;
with Humanize.Selections;

package body Humanize.Geo.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   Degree : constant String := Character'Val (16#C2#) & Character'Val (16#B0#);

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function English (Context : Humanize.Contexts.Context) return Boolean is
     (Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context)) in "en" | "");

   --  Text where the locale renders it, else the parent's English.
   function Either (Text : String; Fallback : Humanize.Status.Text_Result) return Humanize.Status.Text_Result is
     (if Text = "" then Fallback else Humanize.Bounded_Text.Ok_Text (Text));

   function Render (Context : Humanize.Contexts.Context; Selection : Sel.Message_Selection) return String is
      Text : constant Humanize.Status.Text_Result := Humanize.I18N_Rendering.Render (Context, Selection);
   begin
      return (if Text.Status = Humanize.Status.Ok then Ada.Strings.Unbounded.To_String (Text.Text) else "");
   end Render;

   --  Abs Value's degrees in the locale's digits: "52,5200°".
   function Degrees (Context : Humanize.Contexts.Context; Value : Long_Float; Decimals : Natural) return String is
      Number : constant String :=
        Render (Context, Sel.Text_Value (Humanize.Message_Keys.Number_Plain, Fixed_Image (abs Value, Decimals)));
   begin
      return (if Number = "" then "" else Number & Degree);
   end Degrees;

   --  The degrees in CLDR's pattern for the hemisphere: "{0} N", "北緯{0}",
   --  Polish "{0}°N" with the degree sign of its own.
   function Hemisphere (Context : Humanize.Contexts.Context; Direction, Value : String) return String is
      Found   : Boolean;
      Pattern : constant String :=
        I18N.Unit_Format.Pattern
          (Humanize.Contexts.Locale (Context), "coordinate-" & Direction, "short", "other", Found);
      Signed  : constant Boolean := Ada.Strings.Fixed.Index (Pattern, Degree) /= 0;
      Number  : constant String :=
        (if Signed and then Value'Length > Degree'Length then Value (Value'First .. Value'Last - Degree'Length)
         else Value);
   begin
      if not Found or else Value = "" then
         return "";
      end if;
      for Index in Pattern'First .. Pattern'Last - 2 loop
         if Pattern (Index .. Index + 2) = "{0}" then
            return Pattern (Pattern'First .. Index - 1) & Number & Pattern (Index + 3 .. Pattern'Last);
         end if;
      end loop;
      return "";
   end Hemisphere;

   function Latitude_Text (Context : Humanize.Contexts.Context; Latitude : Long_Float; Decimals : Natural)
      return String is
     (Hemisphere (Context, (if Latitude < 0.0 then "south" else "north"), Degrees (Context, Latitude, Decimals)));

   function Longitude_Text (Context : Humanize.Contexts.Context; Longitude : Long_Float; Decimals : Natural)
      return String is
     (Hemisphere (Context, (if Longitude < 0.0 then "west" else "east"), Degrees (Context, Longitude, Decimals)));

   function Coordinate_Text
     (Context : Humanize.Contexts.Context; Latitude, Longitude : Long_Float; Decimals : Natural) return String
   is
      North_South : constant String := Latitude_Text (Context, Latitude, Decimals);
      East_West   : constant String := Longitude_Text (Context, Longitude, Decimals);
   begin
      return (if North_South = "" or else East_West = "" then ""
              else Render (Context, Sel.With_Arg (Sel.With_Arg (Sel.Phrase ("geo.coordinate"), "latitude", North_South),
                                                  "longitude", East_West)));
   end Coordinate_Text;

   function Direction_Text
     (Context : Humanize.Contexts.Context; Point : Direction_Point; Style : Direction_Label_Style) return String is
     (Render (Context,
              Sel.With_Arg
                (Sel.Phrase ("geo.direction." & Ada.Characters.Handling.To_Lower (Direction_Point'Image (Point))),
                 "style", (case Style is when Direction_Long => "long", when Direction_Short => "short"))));

   function Latitude_Label
     (Context  : Humanize.Contexts.Context;
      Latitude : Long_Float;
      Decimals : Natural := 4)
      return Humanize.Status.Text_Result
   is
      Fallback : constant Humanize.Status.Text_Result := Humanize.Geo.Latitude_Label (Latitude, Decimals);
   begin
      if English (Context) or else Fallback.Status /= Humanize.Status.Ok then
         return Fallback;
      end if;
      return Either (Latitude_Text (Context, Latitude, Decimals), Fallback);
   end Latitude_Label;

   function Longitude_Label
     (Context   : Humanize.Contexts.Context;
      Longitude : Long_Float;
      Decimals  : Natural := 4)
      return Humanize.Status.Text_Result
   is
      Fallback : constant Humanize.Status.Text_Result := Humanize.Geo.Longitude_Label (Longitude, Decimals);
   begin
      if English (Context) or else Fallback.Status /= Humanize.Status.Ok then
         return Fallback;
      end if;
      return Either (Longitude_Text (Context, Longitude, Decimals), Fallback);
   end Longitude_Label;

   function Coordinate_Label
     (Context   : Humanize.Contexts.Context;
      Latitude  : Long_Float;
      Longitude : Long_Float;
      Decimals  : Natural := 4)
      return Humanize.Status.Text_Result
   is
      Fallback : constant Humanize.Status.Text_Result :=
        Humanize.Geo.Coordinate_Label (Latitude, Longitude, Decimals);
   begin
      if English (Context) or else Fallback.Status /= Humanize.Status.Ok then
         return Fallback;
      end if;
      return Either (Coordinate_Text (Context, Latitude, Longitude, Decimals), Fallback);
   end Coordinate_Label;

   function Direction_Label
     (Context : Humanize.Contexts.Context;
      Point   : Direction_Point;
      Style   : Direction_Label_Style := Direction_Long)
      return Humanize.Status.Text_Result
   is
      Fallback : constant Humanize.Status.Text_Result := Humanize.Geo.Direction_Label (Point, Style);
   begin
      if English (Context) or else Fallback.Status /= Humanize.Status.Ok then
         return Fallback;
      end if;
      return Either (Direction_Text (Context, Point, Style), Fallback);
   end Direction_Label;

   function Bearing_Label
     (Context  : Humanize.Contexts.Context;
      Bearing  : Long_Float;
      Style    : Direction_Style := Intercardinal_8;
      Labels   : Direction_Label_Style := Direction_Long;
      Decimals : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Fallback : constant Humanize.Status.Text_Result :=
        Humanize.Geo.Bearing_Label (Bearing, Style, Labels, Decimals);
   begin
      if English (Context) or else Fallback.Status /= Humanize.Status.Ok then
         return Fallback;
      end if;
      declare
         Angle : constant String := Degrees (Context, Normalize_Bearing (Bearing), Decimals);
         Point : constant String := Direction_Text (Context, Point_For_Bearing (Bearing, Style), Labels);
      begin
         return Either
           ((if Angle = "" or else Point = "" then ""
             else Render (Context, Sel.With_Arg (Sel.With_Arg (Sel.Phrase ("geo.bearing"), "degrees", Angle),
                                                 "direction", Point))),
            Fallback);
      end;
   end Bearing_Label;

   function Distance_Bearing_Label
     (Context     : Humanize.Contexts.Context;
      Distance    : String;
      Bearing     : Long_Float;
      Style       : Direction_Style := Intercardinal_8;
      Labels      : Direction_Label_Style := Direction_Long;
      Approximate : Boolean := True)
      return Humanize.Status.Text_Result
   is
      Fallback : constant Humanize.Status.Text_Result :=
        Humanize.Geo.Distance_Bearing_Label (Distance, Bearing, Style, Labels, Approximate);
   begin
      if English (Context) or else Fallback.Status /= Humanize.Status.Ok then
         return Fallback;
      end if;
      declare
         Point : constant String := Direction_Text (Context, Point_For_Bearing (Bearing, Style), Labels);
      begin
         return Either
           ((if Point = "" then ""
             else Render
                    (Context,
                     Sel.With_Arg
                       (Sel.With_Arg
                          (Sel.Phrase
                             (if Approximate then "geo.about_distance_direction" else "geo.distance_direction"),
                           "distance", Distance),
                        "direction", Point))),
            Fallback);
      end;
   end Distance_Bearing_Label;

   function Bounding_Box_Label
     (Context  : Humanize.Contexts.Context;
      Box      : Bounding_Box;
      Decimals : Natural := 4)
      return Humanize.Status.Text_Result
   is
      Fallback : constant Humanize.Status.Text_Result := Humanize.Geo.Bounding_Box_Label (Box, Decimals);
   begin
      if English (Context) or else Fallback.Status /= Humanize.Status.Ok then
         return Fallback;
      end if;
      declare
         Southwest : constant String := Coordinate_Text (Context, Box.South, Box.West, Decimals);
         Northeast : constant String := Coordinate_Text (Context, Box.North, Box.East, Decimals);
      begin
         return Either
           ((if Southwest = "" or else Northeast = "" then ""
             else Render (Context, Sel.With_Arg (Sel.With_Arg (Sel.Phrase ("geo.bounding_box"), "southwest", Southwest),
                                                 "northeast", Northeast))),
            Fallback);
      end;
   end Bounding_Box_Label;

   function Bounding_Box_Status_Label
     (Context   : Humanize.Contexts.Context;
      Box       : Bounding_Box;
      Latitude  : Long_Float;
      Longitude : Long_Float)
      return Humanize.Status.Text_Result
   is
      Fallback : constant Humanize.Status.Text_Result :=
        Humanize.Geo.Bounding_Box_Status_Label (Box, Latitude, Longitude);
   begin
      if English (Context) or else Fallback.Status /= Humanize.Status.Ok then
         return Fallback;
      end if;
      return Either
        (Humanize.I18N_Rendering.Phrase_Text
           (Context, (if Contains (Box, Latitude, Longitude) then "geo.inside_box" else "geo.outside_box")),
         Fallback);
   end Bounding_Box_Status_Label;

   procedure Latitude_Label_Into
     (Context  : Humanize.Contexts.Context;
      Latitude : Long_Float;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Decimals : Natural := 4) is
   begin
      Copy_Result (Latitude_Label (Context, Latitude, Decimals), Target, Written, Status);
   end Latitude_Label_Into;

   procedure Longitude_Label_Into
     (Context   : Humanize.Contexts.Context;
      Longitude : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Decimals  : Natural := 4) is
   begin
      Copy_Result (Longitude_Label (Context, Longitude, Decimals), Target, Written, Status);
   end Longitude_Label_Into;

   procedure Coordinate_Label_Into
     (Context   : Humanize.Contexts.Context;
      Latitude  : Long_Float;
      Longitude : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Decimals  : Natural := 4) is
   begin
      Copy_Result (Coordinate_Label (Context, Latitude, Longitude, Decimals), Target, Written, Status);
   end Coordinate_Label_Into;

   procedure Direction_Label_Into
     (Context : Humanize.Contexts.Context;
      Point   : Direction_Point;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Style   : Direction_Label_Style := Direction_Long) is
   begin
      Copy_Result (Direction_Label (Context, Point, Style), Target, Written, Status);
   end Direction_Label_Into;

   procedure Bearing_Label_Into
     (Context  : Humanize.Contexts.Context;
      Bearing  : Long_Float;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Style    : Direction_Style := Intercardinal_8;
      Labels   : Direction_Label_Style := Direction_Long;
      Decimals : Natural := 0) is
   begin
      Copy_Result (Bearing_Label (Context, Bearing, Style, Labels, Decimals), Target, Written, Status);
   end Bearing_Label_Into;

   procedure Distance_Bearing_Label_Into
     (Context     : Humanize.Contexts.Context;
      Distance    : String;
      Bearing     : Long_Float;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Style       : Direction_Style := Intercardinal_8;
      Labels      : Direction_Label_Style := Direction_Long;
      Approximate : Boolean := True) is
   begin
      Copy_Result
        (Distance_Bearing_Label (Context, Distance, Bearing, Style, Labels, Approximate), Target, Written, Status);
   end Distance_Bearing_Label_Into;

   procedure Bounding_Box_Label_Into
     (Context  : Humanize.Contexts.Context;
      Box      : Bounding_Box;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Decimals : Natural := 4) is
   begin
      Copy_Result (Bounding_Box_Label (Context, Box, Decimals), Target, Written, Status);
   end Bounding_Box_Label_Into;

   procedure Bounding_Box_Status_Label_Into
     (Context   : Humanize.Contexts.Context;
      Box       : Bounding_Box;
      Latitude  : Long_Float;
      Longitude : Long_Float;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code) is
   begin
      Copy_Result (Bounding_Box_Status_Label (Context, Box, Latitude, Longitude), Target, Written, Status);
   end Bounding_Box_Status_Label_Into;

end Humanize.Geo.Localized;
