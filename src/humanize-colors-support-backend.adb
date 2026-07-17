with Ada.Numerics;
with Ada.Numerics.Long_Elementary_Functions;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Decimal_Images;
with Humanize.Locales;
with Humanize.Bounded_Text;

package body Humanize.Colors.Support.Backend is
   use type Humanize.Status.Status_Code;

   type Color_Phrase_Key is
     (Phrase_Very_Dark,
      Phrase_Dark,
      Phrase_Medium_Brightness,
      Phrase_Light,
      Phrase_Very_Light,
      Phrase_Neutral,
      Phrase_Red,
      Phrase_Orange,
      Phrase_Yellow,
      Phrase_Green,
      Phrase_Cyan,
      Phrase_Blue,
      Phrase_Purple,
      Phrase_Magenta,
      Phrase_Desaturated,
      Phrase_Muted,
      Phrase_Saturated,
      Phrase_Vivid,
      Phrase_Neutral_Temperature,
      Phrase_Warm,
      Phrase_Cool,
      Phrase_Balanced_Temperature,
      Phrase_Grayish,
      Phrase_Pastel,
      Phrase_Soft,
      Phrase_Moderate_Chroma,
      Phrase_High_Chroma,
      Phrase_Low_Contrast,
      Phrase_Large_Text_Contrast,
      Phrase_Normal_Text_Contrast,
      Phrase_Enhanced_Contrast,
      Phrase_Readable_Enhanced,
      Phrase_Readable_Normal,
      Phrase_Readable_Large_Only,
      Phrase_Low_Readability);

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text
     (Result : Humanize.Status.Text_Result)
      return String
      renames Humanize.Bounded_Text.Result_Text;

   function Invalid_Text return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Invalid_Value_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Natural_Text (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Digit_Value (Ch : Character) return Natural
      renames Humanize.Bounded_Text.Digit_Value;

   function Is_Digit (Ch : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;

   function Starts_With (Text, Prefix : String) return Boolean
      renames Humanize.Bounded_Text.Starts_With;

   function Ends_With (Text, Suffix : String) return Boolean
      renames Humanize.Bounded_Text.Ends_With;

   function Is_Space (Ch : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Space;

   function Lower (Text : String) return String;

   function Locale_Stem
     (Context : Humanize.Contexts.Context)
      return String
   is
      Locale : constant String :=
        Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context));
   begin
      if Locale in "da" | "de" | "fr" | "es" | "it" | "pt" | "nl" then
         return Locale;
      else
         return "en";
      end if;
   end Locale_Stem;

   function Color_Phrase
     (Locale : String;
      Key    : Color_Phrase_Key)
      return String
      is separate;

   function Color_Phrase
     (Context : Humanize.Contexts.Context;
      Key     : Color_Phrase_Key)
      return String is
     (Color_Phrase (Locale_Stem (Context), Key));

   function Lower (Text : String) return String
      renames Humanize.Bounded_Text.Lower_Text;

   function Trim (Text : String) return String is
      First : Natural := Text'First;
      Last  : Natural := Text'Last;
   begin
      if Text'Length = 0 then
         return "";
      end if;
      while First <= Text'Last and then Text (First) = ' ' loop
         First := First + 1;
      end loop;
      while Last >= First and then Text (Last) = ' ' loop
         Last := Last - 1;
      end loop;
      if First > Last then
         return "";
      else
         return Text (First .. Last);
      end if;
   end Trim;

   function Clamp01 (Value : Long_Float) return Long_Float is
   begin
      if Value < 0.0 then
         return 0.0;
      elsif Value > 1.0 then
         return 1.0;
      else
         return Value;
      end if;
   end Clamp01;

   function Channel_From_Float (Value : Long_Float) return Color_Channel is
      Rounded : constant Integer := Integer (Long_Float'Floor (Value + 0.5));
   begin
      if Rounded < 0 then
         return 0;
      elsif Rounded > 255 then
         return 255;
      else
         return Color_Channel (Rounded);
      end if;
   end Channel_From_Float;

   function Channel_From_Linear (Value : Long_Float) return Color_Channel is
      use Ada.Numerics.Long_Elementary_Functions;
      V : constant Long_Float := Clamp01 (Value);
      S : Long_Float;
   begin
      if V <= 0.0031308 then
         S := 12.92 * V;
      else
         S := 1.055 * ("**" (V, 1.0 / 2.4)) - 0.055;
      end if;
      return Channel_From_Float (S * 255.0);
   end Channel_From_Linear;

   function Linear_From_SRGB_Component (Value : Long_Float) return Long_Float is
      use Ada.Numerics.Long_Elementary_Functions;
      V : constant Long_Float := Clamp01 (Value);
   begin
      if V <= 0.04045 then
         return V / 12.92;
      else
         return "**" ((V + 0.055) / 1.055, 2.4);
      end if;
   end Linear_From_SRGB_Component;

   function Linear_From_Rec2020_Component (Value : Long_Float) return Long_Float is
      use Ada.Numerics.Long_Elementary_Functions;
      V : constant Long_Float := Clamp01 (Value);
      Alpha : constant Long_Float := 1.09929682680944;
      Beta  : constant Long_Float := 0.018053968510807;
   begin
      if V < 4.5 * Beta then
         return V / 4.5;
      else
         return "**" ((V + Alpha - 1.0) / Alpha, 1.0 / 0.45);
      end if;
   end Linear_From_Rec2020_Component;

   function Float_Text
     (Value  : Long_Float;
      Places : Natural)
      return String
   is
   begin
      return Humanize.Decimal_Images.Decimal_Image (Value, Places, True);
   end Float_Text;

   function Hex_Digit
     (Value     : Natural;
      Lowercase : Boolean)
      return Character
   is
      Hex_Chars : constant String :=
        (if Lowercase then "0123456789abcdef" else "0123456789ABCDEF");
   begin
      return Hex_Chars (Hex_Chars'First + Value);
   end Hex_Digit;

   function Hex_Value (Ch : Character; Valid : out Boolean) return Natural is
   begin
      if Is_Digit (Ch) then
         Valid := True;
         return Digit_Value (Ch);
      elsif Ch in 'A' .. 'F' then
         Valid := True;
         return 10 + Character'Pos (Ch) - Character'Pos ('A');
      elsif Ch in 'a' .. 'f' then
         Valid := True;
         return 10 + Character'Pos (Ch) - Character'Pos ('a');
      else
         Valid := False;
         return 0;
      end if;
   end Hex_Value;

   function Parse_Hex_Color
     (Text  : String;
      Color : out RGB_Color)
      return Humanize.Status.Status_Code
      is separate;

   function Parse_CSS_Hex_Color
     (Text  : String;
      Color : out CSS_Color)
      return Boolean
      is separate;

   type Named_Color is record
      Name  : access constant String;
      Color : RGB_Color;
   end record;

   Black_Name   : aliased constant String := "black";
   Silver_Name  : aliased constant String := "silver";
   Gray_Name    : aliased constant String := "gray";
   White_Name   : aliased constant String := "white";
   Maroon_Name  : aliased constant String := "maroon";
   Red_Name     : aliased constant String := "red";
   Purple_Name  : aliased constant String := "purple";
   Fuchsia_Name : aliased constant String := "fuchsia";
   Green_Name   : aliased constant String := "green";
   Lime_Name    : aliased constant String := "lime";
   Olive_Name   : aliased constant String := "olive";
   Yellow_Name  : aliased constant String := "yellow";
   Navy_Name    : aliased constant String := "navy";
   Blue_Name    : aliased constant String := "blue";
   Teal_Name    : aliased constant String := "teal";
   Aqua_Name    : aliased constant String := "aqua";
   Orange_Name  : aliased constant String := "orange";
   Rebecca_Name : aliased constant String := "rebeccapurple";

   Basic_Named_Colors : constant array (Positive range <>) of Named_Color :=
     [(Black_Name'Access,   (0, 0, 0)),
      (Silver_Name'Access,  (192, 192, 192)),
      (Gray_Name'Access,    (128, 128, 128)),
      (White_Name'Access,   (255, 255, 255)),
      (Maroon_Name'Access,  (128, 0, 0)),
      (Red_Name'Access,     (255, 0, 0)),
      (Purple_Name'Access,  (128, 0, 128)),
      (Fuchsia_Name'Access, (255, 0, 255)),
      (Green_Name'Access,   (0, 128, 0)),
      (Lime_Name'Access,    (0, 255, 0)),
      (Olive_Name'Access,   (128, 128, 0)),
      (Yellow_Name'Access,  (255, 255, 0)),
      (Navy_Name'Access,    (0, 0, 128)),
      (Blue_Name'Access,    (0, 0, 255)),
      (Teal_Name'Access,    (0, 128, 128)),
      (Aqua_Name'Access,    (0, 255, 255)),
      (Orange_Name'Access,  (255, 165, 0)),
      (Rebecca_Name'Access, (102, 51, 153))];

   type Extended_Named_Color is record
      Name  : Unbounded_String;
      Color : RGB_Color;
   end record;

   CSS_Named_Colors : constant array (Positive range <>) of Extended_Named_Color :=
     [(To_Unbounded_String ("aliceblue"), (240, 248, 255)),
      (To_Unbounded_String ("antiquewhite"), (250, 235, 215)),
      (To_Unbounded_String ("aqua"), (0, 255, 255)),
      (To_Unbounded_String ("aquamarine"), (127, 255, 212)),
      (To_Unbounded_String ("azure"), (240, 255, 255)),
      (To_Unbounded_String ("beige"), (245, 245, 220)),
      (To_Unbounded_String ("bisque"), (255, 228, 196)),
      (To_Unbounded_String ("black"), (0, 0, 0)),
      (To_Unbounded_String ("blanchedalmond"), (255, 235, 205)),
      (To_Unbounded_String ("blue"), (0, 0, 255)),
      (To_Unbounded_String ("blueviolet"), (138, 43, 226)),
      (To_Unbounded_String ("brown"), (165, 42, 42)),
      (To_Unbounded_String ("burlywood"), (222, 184, 135)),
      (To_Unbounded_String ("cadetblue"), (95, 158, 160)),
      (To_Unbounded_String ("chartreuse"), (127, 255, 0)),
      (To_Unbounded_String ("chocolate"), (210, 105, 30)),
      (To_Unbounded_String ("coral"), (255, 127, 80)),
      (To_Unbounded_String ("cornflowerblue"), (100, 149, 237)),
      (To_Unbounded_String ("cornsilk"), (255, 248, 220)),
      (To_Unbounded_String ("crimson"), (220, 20, 60)),
      (To_Unbounded_String ("cyan"), (0, 255, 255)),
      (To_Unbounded_String ("darkblue"), (0, 0, 139)),
      (To_Unbounded_String ("darkcyan"), (0, 139, 139)),
      (To_Unbounded_String ("darkgoldenrod"), (184, 134, 11)),
      (To_Unbounded_String ("darkgray"), (169, 169, 169)),
      (To_Unbounded_String ("darkgreen"), (0, 100, 0)),
      (To_Unbounded_String ("darkgrey"), (169, 169, 169)),
      (To_Unbounded_String ("darkkhaki"), (189, 183, 107)),
      (To_Unbounded_String ("darkmagenta"), (139, 0, 139)),
      (To_Unbounded_String ("darkolivegreen"), (85, 107, 47)),
      (To_Unbounded_String ("darkorange"), (255, 140, 0)),
      (To_Unbounded_String ("darkorchid"), (153, 50, 204)),
      (To_Unbounded_String ("darkred"), (139, 0, 0)),
      (To_Unbounded_String ("darksalmon"), (233, 150, 122)),
      (To_Unbounded_String ("darkseagreen"), (143, 188, 143)),
      (To_Unbounded_String ("darkslateblue"), (72, 61, 139)),
      (To_Unbounded_String ("darkslategray"), (47, 79, 79)),
      (To_Unbounded_String ("darkslategrey"), (47, 79, 79)),
      (To_Unbounded_String ("darkturquoise"), (0, 206, 209)),
      (To_Unbounded_String ("darkviolet"), (148, 0, 211)),
      (To_Unbounded_String ("deeppink"), (255, 20, 147)),
      (To_Unbounded_String ("deepskyblue"), (0, 191, 255)),
      (To_Unbounded_String ("dimgray"), (105, 105, 105)),
      (To_Unbounded_String ("dimgrey"), (105, 105, 105)),
      (To_Unbounded_String ("dodgerblue"), (30, 144, 255)),
      (To_Unbounded_String ("firebrick"), (178, 34, 34)),
      (To_Unbounded_String ("floralwhite"), (255, 250, 240)),
      (To_Unbounded_String ("forestgreen"), (34, 139, 34)),
      (To_Unbounded_String ("fuchsia"), (255, 0, 255)),
      (To_Unbounded_String ("gainsboro"), (220, 220, 220)),
      (To_Unbounded_String ("ghostwhite"), (248, 248, 255)),
      (To_Unbounded_String ("gold"), (255, 215, 0)),
      (To_Unbounded_String ("goldenrod"), (218, 165, 32)),
      (To_Unbounded_String ("gray"), (128, 128, 128)),
      (To_Unbounded_String ("green"), (0, 128, 0)),
      (To_Unbounded_String ("greenyellow"), (173, 255, 47)),
      (To_Unbounded_String ("grey"), (128, 128, 128)),
      (To_Unbounded_String ("honeydew"), (240, 255, 240)),
      (To_Unbounded_String ("hotpink"), (255, 105, 180)),
      (To_Unbounded_String ("indianred"), (205, 92, 92)),
      (To_Unbounded_String ("indigo"), (75, 0, 130)),
      (To_Unbounded_String ("ivory"), (255, 255, 240)),
      (To_Unbounded_String ("khaki"), (240, 230, 140)),
      (To_Unbounded_String ("lavender"), (230, 230, 250)),
      (To_Unbounded_String ("lavenderblush"), (255, 240, 245)),
      (To_Unbounded_String ("lawngreen"), (124, 252, 0)),
      (To_Unbounded_String ("lemonchiffon"), (255, 250, 205)),
      (To_Unbounded_String ("lightblue"), (173, 216, 230)),
      (To_Unbounded_String ("lightcoral"), (240, 128, 128)),
      (To_Unbounded_String ("lightcyan"), (224, 255, 255)),
      (To_Unbounded_String ("lightgoldenrodyellow"), (250, 250, 210)),
      (To_Unbounded_String ("lightgray"), (211, 211, 211)),
      (To_Unbounded_String ("lightgreen"), (144, 238, 144)),
      (To_Unbounded_String ("lightgrey"), (211, 211, 211)),
      (To_Unbounded_String ("lightpink"), (255, 182, 193)),
      (To_Unbounded_String ("lightsalmon"), (255, 160, 122)),
      (To_Unbounded_String ("lightseagreen"), (32, 178, 170)),
      (To_Unbounded_String ("lightskyblue"), (135, 206, 250)),
      (To_Unbounded_String ("lightslategray"), (119, 136, 153)),
      (To_Unbounded_String ("lightslategrey"), (119, 136, 153)),
      (To_Unbounded_String ("lightsteelblue"), (176, 196, 222)),
      (To_Unbounded_String ("lightyellow"), (255, 255, 224)),
      (To_Unbounded_String ("lime"), (0, 255, 0)),
      (To_Unbounded_String ("limegreen"), (50, 205, 50)),
      (To_Unbounded_String ("linen"), (250, 240, 230)),
      (To_Unbounded_String ("magenta"), (255, 0, 255)),
      (To_Unbounded_String ("maroon"), (128, 0, 0)),
      (To_Unbounded_String ("mediumaquamarine"), (102, 205, 170)),
      (To_Unbounded_String ("mediumblue"), (0, 0, 205)),
      (To_Unbounded_String ("mediumorchid"), (186, 85, 211)),
      (To_Unbounded_String ("mediumpurple"), (147, 112, 219)),
      (To_Unbounded_String ("mediumseagreen"), (60, 179, 113)),
      (To_Unbounded_String ("mediumslateblue"), (123, 104, 238)),
      (To_Unbounded_String ("mediumspringgreen"), (0, 250, 154)),
      (To_Unbounded_String ("mediumturquoise"), (72, 209, 204)),
      (To_Unbounded_String ("mediumvioletred"), (199, 21, 133)),
      (To_Unbounded_String ("midnightblue"), (25, 25, 112)),
      (To_Unbounded_String ("mintcream"), (245, 255, 250)),
      (To_Unbounded_String ("mistyrose"), (255, 228, 225)),
      (To_Unbounded_String ("moccasin"), (255, 228, 181)),
      (To_Unbounded_String ("navajowhite"), (255, 222, 173)),
      (To_Unbounded_String ("navy"), (0, 0, 128)),
      (To_Unbounded_String ("oldlace"), (253, 245, 230)),
      (To_Unbounded_String ("olive"), (128, 128, 0)),
      (To_Unbounded_String ("olivedrab"), (107, 142, 35)),
      (To_Unbounded_String ("orange"), (255, 165, 0)),
      (To_Unbounded_String ("orangered"), (255, 69, 0)),
      (To_Unbounded_String ("orchid"), (218, 112, 214)),
      (To_Unbounded_String ("palegoldenrod"), (238, 232, 170)),
      (To_Unbounded_String ("palegreen"), (152, 251, 152)),
      (To_Unbounded_String ("paleturquoise"), (175, 238, 238)),
      (To_Unbounded_String ("palevioletred"), (219, 112, 147)),
      (To_Unbounded_String ("papayawhip"), (255, 239, 213)),
      (To_Unbounded_String ("peachpuff"), (255, 218, 185)),
      (To_Unbounded_String ("peru"), (205, 133, 63)),
      (To_Unbounded_String ("pink"), (255, 192, 203)),
      (To_Unbounded_String ("plum"), (221, 160, 221)),
      (To_Unbounded_String ("powderblue"), (176, 224, 230)),
      (To_Unbounded_String ("purple"), (128, 0, 128)),
      (To_Unbounded_String ("rebeccapurple"), (102, 51, 153)),
      (To_Unbounded_String ("red"), (255, 0, 0)),
      (To_Unbounded_String ("rosybrown"), (188, 143, 143)),
      (To_Unbounded_String ("royalblue"), (65, 105, 225)),
      (To_Unbounded_String ("saddlebrown"), (139, 69, 19)),
      (To_Unbounded_String ("salmon"), (250, 128, 114)),
      (To_Unbounded_String ("sandybrown"), (244, 164, 96)),
      (To_Unbounded_String ("seagreen"), (46, 139, 87)),
      (To_Unbounded_String ("seashell"), (255, 245, 238)),
      (To_Unbounded_String ("sienna"), (160, 82, 45)),
      (To_Unbounded_String ("silver"), (192, 192, 192)),
      (To_Unbounded_String ("skyblue"), (135, 206, 235)),
      (To_Unbounded_String ("slateblue"), (106, 90, 205)),
      (To_Unbounded_String ("slategray"), (112, 128, 144)),
      (To_Unbounded_String ("slategrey"), (112, 128, 144)),
      (To_Unbounded_String ("snow"), (255, 250, 250)),
      (To_Unbounded_String ("springgreen"), (0, 255, 127)),
      (To_Unbounded_String ("steelblue"), (70, 130, 180)),
      (To_Unbounded_String ("tan"), (210, 180, 140)),
      (To_Unbounded_String ("teal"), (0, 128, 128)),
      (To_Unbounded_String ("thistle"), (216, 191, 216)),
      (To_Unbounded_String ("tomato"), (255, 99, 71)),
      (To_Unbounded_String ("turquoise"), (64, 224, 208)),
      (To_Unbounded_String ("violet"), (238, 130, 238)),
      (To_Unbounded_String ("wheat"), (245, 222, 179)),
      (To_Unbounded_String ("white"), (255, 255, 255)),
      (To_Unbounded_String ("whitesmoke"), (245, 245, 245)),
      (To_Unbounded_String ("yellow"), (255, 255, 0)),
      (To_Unbounded_String ("yellowgreen"), (154, 205, 50))];

   function Parse_Named_Color
     (Text  : String;
      Color : out RGB_Color)
      return Humanize.Status.Status_Code
   is
      Name : constant String := Lower (Trim (Text));
   begin
      Color := (others => 0);
      if Name = "transparent" then
         return Humanize.Status.Ok;
      end if;

      for Item of CSS_Named_Colors loop
         if Name = To_String (Item.Name) then
            Color := Item.Color;
            return Humanize.Status.Ok;
         end if;
      end loop;

      return Humanize.Status.Invalid_Value;
   end Parse_Named_Color;

   type Token_List is array (Positive range 1 .. 5) of Unbounded_String;

   function Parse_Component_List
     (Text   : String;
      Tokens : out Token_List;
      Count  : out Natural)
      return Boolean
      is separate;

   function Parse_Modern_Component_List
     (Text      : String;
      Tokens    : out Token_List;
      Count     : out Natural;
      Has_Slash : out Boolean)
      return Boolean
      is separate;

   function Parse_Float (Text : String; Value : out Long_Float) return Boolean is
   begin
      Value := Long_Float'Value (Trim (Text));
      return True;
   exception
      when others =>
         Value := 0.0;
         return False;
   end Parse_Float;

   function Parse_Calc
     (Text         : String;
      Percent_Base : Long_Float;
      Value        : out Long_Float)
      return Boolean
      is separate;

   function Parse_RGB_Channel
     (Text  : String;
      Value : out Color_Channel)
      return Boolean
      is separate;

   function Parse_Alpha
     (Text  : String;
      Value : out Long_Float)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Raw  : Long_Float;
   begin
      if Item'Length = 0 then
         Value := 1.0;
         return False;
      elsif Item = "none" then
         Value := 1.0;
         return True;
      elsif Starts_With (Item, "calc(") then
         if not Parse_Calc (Item, 1.0, Raw) or else Raw < 0.0 or else Raw > 1.0 then
            Value := 1.0;
            return False;
         end if;
         Value := Raw;
         return True;
      elsif Ends_With (Item, "%") then
         if not Parse_Float (Item (Item'First .. Item'Last - 1), Raw) then
            Value := 1.0;
            return False;
         end if;
         if Raw < 0.0 or else Raw > 100.0 then
            Value := 1.0;
            return False;
         end if;
         Value := Raw / 100.0;
         return True;
      else
         if not Parse_Float (Item, Raw) or else Raw < 0.0 or else Raw > 1.0 then
            Value := 1.0;
            return False;
         end if;
         Value := Raw;
         return True;
      end if;
   end Parse_Alpha;

   function Parse_Hue
     (Text  : String;
      Value : out Long_Float)
      return Boolean
      is separate;

   function Parse_Percent_Or_Number
     (Text         : String;
      Percent_Base : Long_Float;
      Value        : out Long_Float)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Raw  : Long_Float;
   begin
      if Item = "none" then
         Value := 0.0;
         return True;
      elsif Starts_With (Item, "calc(") then
         return Parse_Calc (Item, Percent_Base, Value);
      end if;
      if Ends_With (Item, "%") then
         if not Parse_Float (Item (Item'First .. Item'Last - 1), Raw) then
            Value := 0.0;
            return False;
         end if;
         Value := Raw * Percent_Base / 100.0;
         return True;
      elsif Parse_Float (Item, Raw) then
         Value := Raw;
         return True;
      else
         Value := 0.0;
         return False;
      end if;
   end Parse_Percent_Or_Number;

   function Hue_To_RGB
     (P : Long_Float;
      Q : Long_Float;
      T : Long_Float)
      return Long_Float
   is
      Hue : Long_Float := T;
   begin
      if Hue < 0.0 then
         Hue := Hue + 1.0;
      elsif Hue > 1.0 then
         Hue := Hue - 1.0;
      end if;

      if Hue < 1.0 / 6.0 then
         return P + (Q - P) * 6.0 * Hue;
      elsif Hue < 1.0 / 2.0 then
         return Q;
      elsif Hue < 2.0 / 3.0 then
         return P + (Q - P) * (2.0 / 3.0 - Hue) * 6.0;
      else
         return P;
      end if;
   end Hue_To_RGB;

   function HSL_To_RGB
     (Hue        : Long_Float;
      Saturation : Long_Float;
      Lightness  : Long_Float)
      return RGB_Color
      is separate;

   function HWB_To_RGB
     (Hue       : Long_Float;
      Whiteness : Long_Float;
      Blackness : Long_Float)
      return RGB_Color
      is separate;

   function Lab_To_RGB
     (Lightness : Long_Float;
      A         : Long_Float;
      B         : Long_Float)
      return RGB_Color
      is separate;

   function LCH_To_RGB
     (Lightness : Long_Float;
      Chroma    : Long_Float;
      Hue       : Long_Float)
      return RGB_Color
   is
      use Ada.Numerics.Long_Elementary_Functions;
      Radians : constant Long_Float := Hue * Ada.Numerics.Pi / 180.0;
   begin
      return Lab_To_RGB
        (Lightness,
         Chroma * Cos (Radians),
         Chroma * Sin (Radians));
   end LCH_To_RGB;

   function OKLab_To_RGB
     (Lightness : Long_Float;
      A         : Long_Float;
      B         : Long_Float)
      return RGB_Color
   is
      L1 : constant Long_Float := Lightness + 0.3963377774 * A + 0.2158037573 * B;
      M1 : constant Long_Float := Lightness - 0.1055613458 * A - 0.0638541728 * B;
      S1 : constant Long_Float := Lightness - 0.0894841775 * A - 1.2914855480 * B;
      L  : constant Long_Float := L1 * L1 * L1;
      M  : constant Long_Float := M1 * M1 * M1;
      S  : constant Long_Float := S1 * S1 * S1;
      R  : constant Long_Float := 4.0767416621 * L - 3.3077115913 * M
        + 0.2309699292 * S;
      G  : constant Long_Float := -1.2684380046 * L + 2.6097574011 * M
        - 0.3413193965 * S;
      BL : constant Long_Float := -0.0041960863 * L - 0.7034186147 * M
        + 1.7076147010 * S;
   begin
      return
        (Red   => Channel_From_Linear (R),
         Green => Channel_From_Linear (G),
         Blue  => Channel_From_Linear (BL));
   end OKLab_To_RGB;

   function OKLCH_To_RGB
     (Lightness : Long_Float;
      Chroma    : Long_Float;
      Hue       : Long_Float)
      return RGB_Color
   is
      use Ada.Numerics.Long_Elementary_Functions;
      Radians : constant Long_Float := Hue * Ada.Numerics.Pi / 180.0;
   begin
      return OKLab_To_RGB
        (Lightness,
         Chroma * Cos (Radians),
         Chroma * Sin (Radians));
   end OKLCH_To_RGB;

   function XYZ_D65_To_RGB
     (X : Long_Float;
      Y : Long_Float;
      Z : Long_Float)
      return RGB_Color
   is
      R : constant Long_Float := 3.2404542 * X - 1.5371385 * Y
        - 0.4985314 * Z;
      G : constant Long_Float := -0.9692660 * X + 1.8760108 * Y
        + 0.0415560 * Z;
      B : constant Long_Float := 0.0556434 * X - 0.2040259 * Y
        + 1.0572252 * Z;
   begin
      return
        (Red   => Channel_From_Linear (R),
         Green => Channel_From_Linear (G),
         Blue  => Channel_From_Linear (B));
   end XYZ_D65_To_RGB;

   function XYZ_D50_To_RGB
     (X : Long_Float;
      Y : Long_Float;
      Z : Long_Float)
      return RGB_Color
   is
      X65 : constant Long_Float :=
        0.9555766 * X - 0.0230393 * Y + 0.0631636 * Z;
      Y65 : constant Long_Float :=
       -0.0282895 * X + 1.0099416 * Y + 0.0210077 * Z;
      Z65 : constant Long_Float :=
        0.0122982 * X - 0.0204830 * Y + 1.3299098 * Z;
   begin
      return XYZ_D65_To_RGB (X65, Y65, Z65);
   end XYZ_D50_To_RGB;

   function Display_P3_To_RGB
     (Red   : Long_Float;
      Green : Long_Float;
      Blue  : Long_Float)
      return RGB_Color
   is
      R : constant Long_Float := Linear_From_SRGB_Component (Red);
      G : constant Long_Float := Linear_From_SRGB_Component (Green);
      B : constant Long_Float := Linear_From_SRGB_Component (Blue);
      X : constant Long_Float := 0.4865709486 * R + 0.2656676932 * G
        + 0.1982172852 * B;
      Y : constant Long_Float := 0.2289745641 * R + 0.6917385218 * G
        + 0.0792869141 * B;
      Z : constant Long_Float := 0.0000000000 * R + 0.0451133819 * G
        + 1.0439443689 * B;
   begin
      return XYZ_D65_To_RGB (X, Y, Z);
   end Display_P3_To_RGB;

   function Rec2020_To_RGB
     (Red   : Long_Float;
      Green : Long_Float;
      Blue  : Long_Float)
      return RGB_Color
   is
      R : constant Long_Float := Linear_From_Rec2020_Component (Red);
      G : constant Long_Float := Linear_From_Rec2020_Component (Green);
      B : constant Long_Float := Linear_From_Rec2020_Component (Blue);
      X : constant Long_Float := 0.6369580483 * R + 0.1446169036 * G
        + 0.1688809752 * B;
      Y : constant Long_Float := 0.2627002120 * R + 0.6779980715 * G
        + 0.0593017165 * B;
      Z : constant Long_Float := 0.0000000000 * R + 0.0280726930 * G
        + 1.0609850577 * B;
   begin
      return XYZ_D65_To_RGB (X, Y, Z);
   end Rec2020_To_RGB;

   function Parse_Percent_Unit
     (Text  : String;
      Value : out Long_Float)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Raw  : Long_Float;
   begin
      if Item = "none" then
         Value := 0.0;
         return True;
      elsif Starts_With (Item, "calc(") then
         if not Parse_Calc (Item, 1.0, Raw)
           or else Raw < 0.0
           or else Raw > 1.0
         then
            Value := 0.0;
            return False;
         end if;
         Value := Raw;
         return True;
      elsif not Ends_With (Item, "%")
        or else not Parse_Float (Item (Item'First .. Item'Last - 1), Raw)
        or else Raw < 0.0
        or else Raw > 100.0
      then
         Value := 0.0;
         return False;
      end if;
      Value := Raw / 100.0;
      return True;
   end Parse_Percent_Unit;

   function Parse_Function_Color
     (Text  : String;
      Color : out CSS_Color)
      return Boolean
      is separate;

   function Parse_CSS_Color
     (Text  : String;
      Color : out CSS_Color)
      return Humanize.Status.Status_Code
   is
      RGB : RGB_Color;
   begin
      Color := (others => <>);
      if Lower (Trim (Text)) = "currentcolor" then
         Color :=
           (Color       => (others => 0),
            Opacity     => 1.0,
            Has_Opacity => False,
            Is_Current  => True);
         return Humanize.Status.Ok;
      elsif Parse_CSS_Hex_Color (Text, Color) then
         return Humanize.Status.Ok;
      elsif Parse_Named_Color (Text, RGB) = Humanize.Status.Ok then
         Color :=
           (Color       => RGB,
            Opacity     => (if Lower (Trim (Text)) = "transparent" then 0.0 else 1.0),
            Has_Opacity => Lower (Trim (Text)) = "transparent",
            Is_Current  => False);
         return Humanize.Status.Ok;
      elsif Parse_Function_Color (Text, Color) then
         return Humanize.Status.Ok;
      else
         return Humanize.Status.Invalid_Value;
      end if;
   end Parse_CSS_Color;

   function Hex_Channel
     (Channel   : Color_Channel;
      Lowercase : Boolean)
      return String
   is
      Hi : constant Natural := Channel / 16;
      Lo : constant Natural := Channel mod 16;
   begin
      return [1 => Hex_Digit (Hi, Lowercase), 2 => Hex_Digit (Lo, Lowercase)];
   end Hex_Channel;

   function Hex_Color
     (Color     : RGB_Color;
      Prefix    : Boolean := True;
      Lowercase : Boolean := False)
      return Humanize.Status.Text_Result
   is
      P : constant String := (if Prefix then "#" else "");
   begin
      return Ok_Text
        (P & Hex_Channel (Color.Red, Lowercase)
         & Hex_Channel (Color.Green, Lowercase)
         & Hex_Channel (Color.Blue, Lowercase));
   end Hex_Color;

   function Hex_Color
     (Red       : Color_Channel;
      Green     : Color_Channel;
      Blue      : Color_Channel;
      Prefix    : Boolean := True;
      Lowercase : Boolean := False)
      return Humanize.Status.Text_Result
   is
   begin
      return Hex_Color ((Red => Red, Green => Green, Blue => Blue),
                        Prefix, Lowercase);
   end Hex_Color;

   function RGB_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        ("rgb(" & Natural_Text (Color.Red) & ", "
         & Natural_Text (Color.Green) & ", "
         & Natural_Text (Color.Blue) & ")");
   end RGB_Label;

   function RGBA_Label
     (Color   : RGB_Color;
      Opacity : Long_Float)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        ("rgba(" & Natural_Text (Color.Red) & ", "
         & Natural_Text (Color.Green) & ", "
         & Natural_Text (Color.Blue) & ", "
         & Float_Text (Clamp01 (Opacity), 2) & ")");
   end RGBA_Label;

   function CSS_Color_Label
     (Color : CSS_Color)
      return Humanize.Status.Text_Result
   is
   begin
      if Color.Is_Current then
         return Ok_Text ("currentColor");
      elsif Color.Has_Opacity then
         return RGBA_Label (Color.Color, Color.Opacity);
      else
         return RGB_Label (Color.Color);
      end if;
   end CSS_Color_Label;

   function HSL
     (Color : RGB_Color)
      return HSL_Color
   is
      R : constant Long_Float := Long_Float (Color.Red) / 255.0;
      G : constant Long_Float := Long_Float (Color.Green) / 255.0;
      B : constant Long_Float := Long_Float (Color.Blue) / 255.0;
      Max_C : constant Long_Float := Long_Float'Max (R, Long_Float'Max (G, B));
      Min_C : constant Long_Float := Long_Float'Min (R, Long_Float'Min (G, B));
      Diff  : constant Long_Float := Max_C - Min_C;
      Hue   : Long_Float := 0.0;
      Sat   : Long_Float := 0.0;
      Light : constant Long_Float := (Max_C + Min_C) / 2.0;
   begin
      if Diff /= 0.0 then
         Sat := Diff / (1.0 - abs (2.0 * Light - 1.0));
         if Max_C = R then
            Hue := 60.0 * ((G - B) / Diff);
         elsif Max_C = G then
            Hue := 60.0 * (((B - R) / Diff) + 2.0);
         else
            Hue := 60.0 * (((R - G) / Diff) + 4.0);
         end if;
         if Hue < 0.0 then
            Hue := Hue + 360.0;
         end if;
      end if;
      return (Hue => Hue, Saturation => Sat, Lightness => Light);
   end HSL;

   function HSV
     (Color : RGB_Color)
      return HSV_Color
   is
      R : constant Long_Float := Long_Float (Color.Red) / 255.0;
      G : constant Long_Float := Long_Float (Color.Green) / 255.0;
      B : constant Long_Float := Long_Float (Color.Blue) / 255.0;
      Max_C : constant Long_Float := Long_Float'Max (R, Long_Float'Max (G, B));
      Min_C : constant Long_Float := Long_Float'Min (R, Long_Float'Min (G, B));
      Diff  : constant Long_Float := Max_C - Min_C;
      Hue   : Long_Float := 0.0;
      Sat   : constant Long_Float := (if Max_C = 0.0 then 0.0 else Diff / Max_C);
   begin
      if Diff /= 0.0 then
         if Max_C = R then
            Hue := 60.0 * ((G - B) / Diff);
         elsif Max_C = G then
            Hue := 60.0 * (((B - R) / Diff) + 2.0);
         else
            Hue := 60.0 * (((R - G) / Diff) + 4.0);
         end if;
         if Hue < 0.0 then
            Hue := Hue + 360.0;
         end if;
      end if;
      return (Hue => Hue, Saturation => Sat, Value => Max_C);
   end HSV;

   function Round_Percent (Value : Long_Float) return String is
   begin
      return Float_Text (Value * 100.0, 0) & "%";
   end Round_Percent;

   function HSL_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant HSL_Color := HSL (Color);
   begin
      return Ok_Text
        ("hsl(" & Float_Text (Value.Hue, 0) & ", "
         & Round_Percent (Value.Saturation) & ", "
         & Round_Percent (Value.Lightness) & ")");
   end HSL_Label;

   function HSV_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant HSV_Color := HSV (Color);
   begin
      return Ok_Text
        ("hsv(" & Float_Text (Value.Hue, 0) & ", "
         & Round_Percent (Value.Saturation) & ", "
         & Round_Percent (Value.Value) & ")");
   end HSV_Label;

   function Distance_Squared (Left, Right : RGB_Color) return Natural is
      DR : constant Integer := Integer (Left.Red) - Integer (Right.Red);
      DG : constant Integer := Integer (Left.Green) - Integer (Right.Green);
      DB : constant Integer := Integer (Left.Blue) - Integer (Right.Blue);
   begin
      return Natural (DR * DR + DG * DG + DB * DB);
   end Distance_Squared;

   function Nearest_Color_Name
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Best_Index : Positive := Basic_Named_Colors'First;
      Best_Dist  : Natural := Natural'Last;
      Dist       : Natural;
   begin
      for Index in Basic_Named_Colors'Range loop
         Dist := Distance_Squared (Color, Basic_Named_Colors (Index).Color);
         if Dist < Best_Dist then
            Best_Dist := Dist;
            Best_Index := Index;
         end if;
      end loop;
      return Ok_Text (Basic_Named_Colors (Best_Index).Name.all);
   end Nearest_Color_Name;

   function Descriptive_Color_Name
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Brightness : constant String :=
        Result_Text (Brightness_Label (Color));
      Chroma : constant String :=
        Result_Text (Chroma_Label (Color));
      Temperature : constant String :=
        Result_Text (Temperature_Label (Color));
      Hue : constant String :=
        Result_Text (Hue_Family_Label (Color));
      Base : constant String :=
        (if Hue = "red"
           and then (Brightness = "light" or else Brightness = "very light")
           and then Chroma = "pastel"
         then "pink"
         else Hue);
   begin
      return Ok_Text
        (Brightness & " " & Chroma & " " & Temperature & " " & Base);
   end Descriptive_Color_Name;

   function Palette_Summary
     (Colors : Color_List)
      return Humanize.Status.Text_Result
   is
      Avg_R : Natural := 0;
      Avg_G : Natural := 0;
      Avg_B : Natural := 0;
      Min_B : Long_Float := 1.0;
      Max_B : Long_Float := 0.0;
   begin
      if Colors'Length = 0 then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      for Color of Colors loop
         Avg_R := Avg_R + Color.Red;
         Avg_G := Avg_G + Color.Green;
         Avg_B := Avg_B + Color.Blue;
         Min_B := Long_Float'Min (Min_B, Brightness (Color));
         Max_B := Long_Float'Max (Max_B, Brightness (Color));
      end loop;

      declare
         Average : constant RGB_Color :=
           (Red   => Avg_R / Colors'Length,
            Green => Avg_G / Colors'Length,
            Blue  => Avg_B / Colors'Length);
         Name : constant String :=
           Result_Text (Nearest_Color_Name (Average));
         Spread : constant Long_Float := Max_B - Min_B;
         Spread_Label : constant String :=
           (if Spread < 0.20 then "low contrast spread"
            elsif Spread < 0.50 then "moderate contrast spread"
            else "high contrast spread");
      begin
         return Ok_Text
           (Natural_Text (Colors'Length) & " colors, mostly " & Name
            & ", " & Spread_Label);
      end;
   end Palette_Summary;

   function Hex_Text (Color : RGB_Color) return String is
   begin
      return Result_Text (Hex_Color (Color));
   end Hex_Text;

   function Hue_Distance (Left, Right : Long_Float) return Long_Float is
      Diff : Long_Float := abs (Left - Right);
   begin
      if Diff > 180.0 then
         Diff := 360.0 - Diff;
      end if;
      return Diff;
   end Hue_Distance;

   function Palette_Roles
     (Colors : Color_List)
      return Humanize.Status.Text_Result
   is
      Background_Index : Positive := Colors'First;
      Text_Index       : Positive := Colors'First;
      Accent_Index     : Positive := Colors'First;
      Best_Light       : Long_Float := -1.0;
      Best_Dark        : Long_Float := 2.0;
      Best_Accent      : Long_Float := -1.0;
      Bright           : Long_Float;
      Sat              : Long_Float;
      Accent_Score     : Long_Float;
   begin
      if Colors'Length = 0 then
         return Invalid_Text;
      end if;

      for Index in Colors'Range loop
         Bright := Brightness (Colors (Index));
         Sat := HSL (Colors (Index)).Saturation;
         Accent_Score := Sat * 0.70 + abs (Bright - 0.50) * 0.30;
         if Bright > Best_Light then
            Best_Light := Bright;
            Background_Index := Index;
         end if;
         if Bright < Best_Dark then
            Best_Dark := Bright;
            Text_Index := Index;
         end if;
         if Accent_Score > Best_Accent then
            Best_Accent := Accent_Score;
            Accent_Index := Index;
         end if;
      end loop;

      return Ok_Text
        ("background " & Hex_Text (Colors (Background_Index))
         & ", text " & Hex_Text (Colors (Text_Index))
         & ", accent " & Hex_Text (Colors (Accent_Index)));
   end Palette_Roles;

   function Palette_Harmony_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result
      is separate;

   function Palette_Contrast_Suggestion
     (Colors : Color_List)
      return Humanize.Status.Text_Result
   is
      Best_Left  : Positive := Colors'First;
      Best_Right : Positive := Colors'First;
      Best_Ratio : Long_Float := -1.0;
      Ratio      : Long_Float;
   begin
      if Colors'Length < 2 then
         return Invalid_Text;
      end if;

      for I in Colors'Range loop
         for J in I + 1 .. Colors'Last loop
            Ratio := Contrast_Ratio (Colors (I), Colors (J));
            if Ratio > Best_Ratio then
               Best_Ratio := Ratio;
               Best_Left := I;
               Best_Right := J;
            end if;
         end loop;
      end loop;

      return Ok_Text
        ("best contrast " & Hex_Text (Colors (Best_Left)) & " on "
         & Hex_Text (Colors (Best_Right)) & " at "
         & Humanize.Decimal_Images.Decimal_Image (Best_Ratio, 1, True)
         & ":1");
   end Palette_Contrast_Suggestion;

   function Palette_Accessibility_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result
      is separate;

   function Palette_Contrast_Matrix_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result
   is
      Total    : Natural := 0;
      Fail     : Natural := 0;
      Large    : Natural := 0;
      Normal   : Natural := 0;
      Enhanced : Natural := 0;
   begin
      if Colors'Length < 2 then
         return Invalid_Text;
      end if;

      for I in Colors'Range loop
         for J in I + 1 .. Colors'Last loop
            declare
               Level : constant Contrast_Level :=
                 Contrast_Level_For (Contrast_Ratio (Colors (I), Colors (J)));
            begin
               Total := Total + 1;
               case Level is
                  when Contrast_Fail =>
                     Fail := Fail + 1;
                  when Contrast_Large_Text =>
                     Large := Large + 1;
                  when Contrast_Normal_Text =>
                     Normal := Normal + 1;
                  when Contrast_Enhanced_Text =>
                     Enhanced := Enhanced + 1;
               end case;
            end;
         end loop;
      end loop;

      return Ok_Text
        (Natural_Text (Enhanced) & " enhanced, "
         & Natural_Text (Normal) & " normal, "
         & Natural_Text (Large) & " large-only, "
         & Natural_Text (Fail) & " fail out of "
         & Natural_Text (Total) & " pairs");
   end Palette_Contrast_Matrix_Label;

   function Palette_Mood_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result
      is separate;

   function Advanced_Palette_Summary
     (Colors : Color_List)
      return Humanize.Status.Text_Result
   is
      Harmony : constant Humanize.Status.Text_Result :=
        Palette_Harmony_Label (Colors);
      Mood : constant Humanize.Status.Text_Result := Palette_Mood_Label (Colors);
      Accessibility : constant Humanize.Status.Text_Result :=
        Palette_Accessibility_Label (Colors);
      Roles : constant Humanize.Status.Text_Result := Palette_Roles (Colors);
   begin
      if Harmony.Status /= Humanize.Status.Ok then
         return Harmony;
      elsif Mood.Status /= Humanize.Status.Ok then
         return Mood;
      elsif Accessibility.Status /= Humanize.Status.Ok then
         return Accessibility;
      elsif Roles.Status /= Humanize.Status.Ok then
         return Roles;
      end if;

      return Ok_Text
        (Result_Text (Harmony) & ", "
         & Result_Text (Mood) & ", "
         & Result_Text (Accessibility) & "; "
         & Result_Text (Roles));
   end Advanced_Palette_Summary;

   function Color_Summary
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Result_Text (Hex_Color (Color)) & " "
         & Result_Text (RGB_Label (Color)));
   end Color_Summary;

   function Brightness
     (Color : RGB_Color)
      return Long_Float
   is
   begin
      return
        (0.299 * Long_Float (Color.Red)
         + 0.587 * Long_Float (Color.Green)
         + 0.114 * Long_Float (Color.Blue)) / 255.0;
   end Brightness;

   function Brightness_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant Long_Float := Brightness (Color);
   begin
      if Value < 0.20 then
         return Ok_Text ("very dark");
      elsif Value < 0.40 then
         return Ok_Text ("dark");
      elsif Value < 0.60 then
         return Ok_Text ("medium brightness");
      elsif Value < 0.80 then
         return Ok_Text ("light");
      else
         return Ok_Text ("very light");
      end if;
   end Brightness_Label;

   function Brightness_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant Long_Float := Brightness (Color);
   begin
      if Value < 0.20 then
         return Ok_Text (Color_Phrase (Context, Phrase_Very_Dark));
      elsif Value < 0.40 then
         return Ok_Text (Color_Phrase (Context, Phrase_Dark));
      elsif Value < 0.60 then
         return Ok_Text (Color_Phrase (Context, Phrase_Medium_Brightness));
      elsif Value < 0.80 then
         return Ok_Text (Color_Phrase (Context, Phrase_Light));
      else
         return Ok_Text (Color_Phrase (Context, Phrase_Very_Light));
      end if;
   end Brightness_Label;

   function Linear_RGB_To_XYZ_D65 (Color : RGB_Color) return Lab_Color is
      R : constant Long_Float := Linear_From_SRGB_Component
        (Long_Float (Color.Red) / 255.0);
      G : constant Long_Float := Linear_From_SRGB_Component
        (Long_Float (Color.Green) / 255.0);
      B : constant Long_Float := Linear_From_SRGB_Component
        (Long_Float (Color.Blue) / 255.0);
   begin
      return
        (Lightness => 0.4124564 * R + 0.3575761 * G + 0.1804375 * B,
         A         => 0.2126729 * R + 0.7151522 * G + 0.0721750 * B,
         B         => 0.0193339 * R + 0.1191920 * G + 0.9503041 * B);
   end Linear_RGB_To_XYZ_D65;

   function Lab
     (Color : RGB_Color)
      return Lab_Color
   is
      use Ada.Numerics.Long_Elementary_Functions;
      XYZ65 : constant Lab_Color := Linear_RGB_To_XYZ_D65 (Color);
      X50 : constant Long_Float :=
        1.0478112 * XYZ65.Lightness + 0.0228866 * XYZ65.A
        - 0.0501270 * XYZ65.B;
      Y50 : constant Long_Float :=
        0.0295424 * XYZ65.Lightness + 0.9904844 * XYZ65.A
        - 0.0170491 * XYZ65.B;
      Z50 : constant Long_Float :=
       -0.0092345 * XYZ65.Lightness + 0.0150436 * XYZ65.A
        + 0.7521316 * XYZ65.B;
      XN : constant Long_Float := 0.96422;
      YN : constant Long_Float := 1.0;
      ZN : constant Long_Float := 0.82521;
      Epsilon : constant Long_Float := 216.0 / 24_389.0;
      Kappa   : constant Long_Float := 24_389.0 / 27.0;

      function Pivot (Value : Long_Float) return Long_Float is
      begin
         if Value > Epsilon then
            return "**" (Value, 1.0 / 3.0);
         else
            return (Kappa * Value + 16.0) / 116.0;
         end if;
      end Pivot;

      FX : constant Long_Float := Pivot (X50 / XN);
      FY : constant Long_Float := Pivot (Y50 / YN);
      FZ : constant Long_Float := Pivot (Z50 / ZN);
   begin
      return
        (Lightness => 116.0 * FY - 16.0,
         A         => 500.0 * (FX - FY),
         B         => 200.0 * (FY - FZ));
   end Lab;

   function OKLab
     (Color : RGB_Color)
      return OKLab_Color
   is
      use Ada.Numerics.Long_Elementary_Functions;
      R : constant Long_Float := Linear_From_SRGB_Component
        (Long_Float (Color.Red) / 255.0);
      G : constant Long_Float := Linear_From_SRGB_Component
        (Long_Float (Color.Green) / 255.0);
      B : constant Long_Float := Linear_From_SRGB_Component
        (Long_Float (Color.Blue) / 255.0);
      L : constant Long_Float := 0.4122214708 * R + 0.5363325363 * G
        + 0.0514459929 * B;
      M : constant Long_Float := 0.2119034982 * R + 0.6806995451 * G
        + 0.1073969566 * B;
      S : constant Long_Float := 0.0883024619 * R + 0.2817188376 * G
        + 0.6299787005 * B;
      L1 : constant Long_Float := "**" (L, 1.0 / 3.0);
      M1 : constant Long_Float := "**" (M, 1.0 / 3.0);
      S1 : constant Long_Float := "**" (S, 1.0 / 3.0);
   begin
      return
        (Lightness => 0.2104542553 * L1 + 0.7936177850 * M1
          - 0.0040720468 * S1,
         A         => 1.9779984951 * L1 - 2.4285922050 * M1
          + 0.4505937099 * S1,
         B         => 0.0259040371 * L1 + 0.7827717662 * M1
          - 0.8086757660 * S1);
   end OKLab;

   function Hue_Family_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant HSL_Color := HSL (Color);
      Hue   : constant Long_Float := Value.Hue;
   begin
      if Value.Saturation < 0.08 then
         return Ok_Text ("neutral");
      elsif Hue < 15.0 or else Hue >= 345.0 then
         return Ok_Text ("red");
      elsif Hue < 45.0 then
         return Ok_Text ("orange");
      elsif Hue < 70.0 then
         return Ok_Text ("yellow");
      elsif Hue < 165.0 then
         return Ok_Text ("green");
      elsif Hue < 195.0 then
         return Ok_Text ("cyan");
      elsif Hue < 255.0 then
         return Ok_Text ("blue");
      elsif Hue < 285.0 then
         return Ok_Text ("purple");
      elsif Hue < 345.0 then
         return Ok_Text ("magenta");
      else
         return Ok_Text ("neutral");
      end if;
   end Hue_Family_Label;

   function Hue_Family_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant HSL_Color := HSL (Color);
      Hue   : constant Long_Float := Value.Hue;
      Key   : Color_Phrase_Key;
   begin
      if Value.Saturation < 0.08 then
         Key := Phrase_Neutral;
      elsif Hue < 15.0 or else Hue >= 345.0 then
         Key := Phrase_Red;
      elsif Hue < 45.0 then
         Key := Phrase_Orange;
      elsif Hue < 70.0 then
         Key := Phrase_Yellow;
      elsif Hue < 165.0 then
         Key := Phrase_Green;
      elsif Hue < 195.0 then
         Key := Phrase_Cyan;
      elsif Hue < 255.0 then
         Key := Phrase_Blue;
      elsif Hue < 285.0 then
         Key := Phrase_Purple;
      elsif Hue < 345.0 then
         Key := Phrase_Magenta;
      else
         Key := Phrase_Neutral;
      end if;
      return Ok_Text (Color_Phrase (Context, Key));
   end Hue_Family_Label;

   function Saturation_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant Long_Float := HSL (Color).Saturation;
   begin
      if Value < 0.08 then
         return Ok_Text ("neutral");
      elsif Value < 0.25 then
         return Ok_Text ("desaturated");
      elsif Value < 0.50 then
         return Ok_Text ("muted");
      elsif Value < 0.75 then
         return Ok_Text ("saturated");
      else
         return Ok_Text ("vivid");
      end if;
   end Saturation_Label;

   function Saturation_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant Long_Float := HSL (Color).Saturation;
   begin
      if Value < 0.08 then
         return Ok_Text (Color_Phrase (Context, Phrase_Neutral));
      elsif Value < 0.25 then
         return Ok_Text (Color_Phrase (Context, Phrase_Desaturated));
      elsif Value < 0.50 then
         return Ok_Text (Color_Phrase (Context, Phrase_Muted));
      elsif Value < 0.75 then
         return Ok_Text (Color_Phrase (Context, Phrase_Saturated));
      else
         return Ok_Text (Color_Phrase (Context, Phrase_Vivid));
      end if;
   end Saturation_Label;

   function Temperature_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant HSL_Color := HSL (Color);
      Hue   : constant Long_Float := Value.Hue;
   begin
      if Value.Saturation < 0.08 then
         return Ok_Text ("neutral temperature");
      elsif Hue < 80.0 or else Hue >= 300.0 then
         return Ok_Text ("warm");
      elsif Hue >= 150.0 and then Hue < 285.0 then
         return Ok_Text ("cool");
      else
         return Ok_Text ("balanced temperature");
      end if;
   end Temperature_Label;

   function Temperature_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant HSL_Color := HSL (Color);
      Hue   : constant Long_Float := Value.Hue;
   begin
      if Value.Saturation < 0.08 then
         return Ok_Text (Color_Phrase (Context, Phrase_Neutral_Temperature));
      elsif Hue < 80.0 or else Hue >= 300.0 then
         return Ok_Text (Color_Phrase (Context, Phrase_Warm));
      elsif Hue >= 150.0 and then Hue < 285.0 then
         return Ok_Text (Color_Phrase (Context, Phrase_Cool));
      else
         return Ok_Text (Color_Phrase (Context, Phrase_Balanced_Temperature));
      end if;
   end Temperature_Label;

   function Chroma_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant OKLab_Color := OKLab (Color);
      Chroma : constant Long_Float :=
        Ada.Numerics.Long_Elementary_Functions.Sqrt
          (Value.A * Value.A + Value.B * Value.B);
      Light : constant Long_Float := HSL (Color).Lightness;
   begin
      if Chroma < 0.03 then
         return Ok_Text ("grayish");
      elsif Chroma < 0.14 and then Light > 0.68 then
         return Ok_Text ("pastel");
      elsif Chroma < 0.08 then
         return Ok_Text ("soft");
      elsif Chroma < 0.16 then
         return Ok_Text ("moderate chroma");
      else
         return Ok_Text ("high chroma");
      end if;
   end Chroma_Label;

   function Chroma_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant OKLab_Color := OKLab (Color);
      Chroma : constant Long_Float :=
        Ada.Numerics.Long_Elementary_Functions.Sqrt
          (Value.A * Value.A + Value.B * Value.B);
      Light : constant Long_Float := HSL (Color).Lightness;
   begin
      if Chroma < 0.03 then
         return Ok_Text (Color_Phrase (Context, Phrase_Grayish));
      elsif Chroma < 0.14 and then Light > 0.68 then
         return Ok_Text (Color_Phrase (Context, Phrase_Pastel));
      elsif Chroma < 0.08 then
         return Ok_Text (Color_Phrase (Context, Phrase_Soft));
      elsif Chroma < 0.16 then
         return Ok_Text (Color_Phrase (Context, Phrase_Moderate_Chroma));
      else
         return Ok_Text (Color_Phrase (Context, Phrase_High_Chroma));
      end if;
   end Chroma_Label;

   function Color_Description
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Result_Text (Brightness_Label (Color)) & ", "
         & Result_Text (Saturation_Label (Color)) & " "
         & Result_Text (Hue_Family_Label (Color)) & ", "
         & Result_Text (Temperature_Label (Color)) & ", "
         & Result_Text (Chroma_Label (Color)));
   end Color_Description;

   function Color_Description
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Result_Text (Brightness_Label (Context, Color))
         & ", "
         & Result_Text (Saturation_Label (Context, Color))
         & " "
         & Result_Text (Hue_Family_Label (Context, Color))
         & ", "
         & Result_Text
             (Temperature_Label (Context, Color))
         & ", "
         & Result_Text (Chroma_Label (Context, Color)));
   end Color_Description;

   function Clamped_Opacity (Opacity : Long_Float) return Long_Float is
   begin
      if Opacity < 0.0 then
         return 0.0;
      elsif Opacity > 1.0 then
         return 1.0;
      else
         return Opacity;
      end if;
   end Clamped_Opacity;

   function Opacity_Label
     (Opacity : Long_Float)
      return Humanize.Status.Text_Result
   is
      O       : constant Long_Float := Clamped_Opacity (Opacity);
      Percent : constant String :=
        Humanize.Decimal_Images.Decimal_Image (O * 100.0, 0, True);
      Label   : constant String :=
        (if O = 0.0 then "transparent"
         elsif O < 0.25 then "mostly transparent"
         elsif O < 0.75 then "translucent"
         elsif O < 1.0 then "mostly opaque"
         else "opaque");
   begin
      return Ok_Text (Percent & "% " & Label);
   end Opacity_Label;

   function Linear_Channel (Channel : Color_Channel) return Long_Float is
      C : constant Long_Float := Long_Float (Channel) / 255.0;
   begin
      if C <= 0.03928 then
         return C / 12.92;
      else
         return Ada.Numerics.Long_Elementary_Functions."**"
           ((C + 0.055) / 1.055, 2.4);
      end if;
   end Linear_Channel;

   function Relative_Luminance
     (Color : RGB_Color)
      return Long_Float
   is
   begin
      return 0.2126 * Linear_Channel (Color.Red)
        + 0.7152 * Linear_Channel (Color.Green)
        + 0.0722 * Linear_Channel (Color.Blue);
   end Relative_Luminance;

   function Contrast_Ratio
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Long_Float
   is
      F : constant Long_Float := Relative_Luminance (Foreground);
      B : constant Long_Float := Relative_Luminance (Background);
      Lighter : constant Long_Float := Long_Float'Max (F, B);
      Darker  : constant Long_Float := Long_Float'Min (F, B);
   begin
      return (Lighter + 0.05) / (Darker + 0.05);
   end Contrast_Ratio;

   function Clamp_Unit (Value : Long_Float) return Long_Float is
   begin
      return Long_Float'Max (0.0, Long_Float'Min (1.0, Value));
   end Clamp_Unit;

   function Blend_Channel
     (Foreground : Color_Channel;
      Background : Color_Channel;
      Alpha      : Long_Float)
      return Color_Channel
   is
      Value : constant Long_Float :=
        Long_Float (Foreground) * Alpha
        + Long_Float (Background) * (1.0 - Alpha);
   begin
      return Color_Channel
        (Natural (Long_Float'Min (255.0, Long_Float'Max (0.0, Value + 0.5))));
   end Blend_Channel;

   function Composite
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Alpha      : Long_Float)
      return RGB_Color
   is
      A : constant Long_Float := Clamp_Unit (Alpha);
   begin
      return
        (Red   => Blend_Channel (Foreground.Red, Background.Red, A),
         Green => Blend_Channel (Foreground.Green, Background.Green, A),
         Blue  => Blend_Channel (Foreground.Blue, Background.Blue, A));
   end Composite;

   function Alpha_Contrast_Ratio
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Alpha      : Long_Float)
      return Long_Float
   is
   begin
      return Contrast_Ratio
        (Composite (Foreground, Background, Alpha), Background);
   end Alpha_Contrast_Ratio;

   function Contrast_Level_For
     (Ratio : Long_Float)
      return Contrast_Level
   is
   begin
      if Ratio >= 7.0 then
         return Contrast_Enhanced_Text;
      elsif Ratio >= 4.5 then
         return Contrast_Normal_Text;
      elsif Ratio >= 3.0 then
         return Contrast_Large_Text;
      else
         return Contrast_Fail;
      end if;
   end Contrast_Level_For;

   function Ratio_Text (Ratio : Long_Float) return String is
   begin
      return Humanize.Decimal_Images.Decimal_Image (Ratio, 1, True) & ":1";
   end Ratio_Text;

   function Target_Ratio (Target : Contrast_Target) return Long_Float is
   begin
      case Target is
         when Target_Large_Text =>
            return 3.0;
         when Target_Normal_Text =>
            return 4.5;
         when Target_Enhanced_Text =>
            return 7.0;
      end case;
   end Target_Ratio;

   function Target_Label (Target : Contrast_Target) return String is
   begin
      case Target is
         when Target_Large_Text =>
            return "large text";
         when Target_Normal_Text =>
            return "normal text";
         when Target_Enhanced_Text =>
            return "enhanced text";
      end case;
   end Target_Label;

   function Contrast_Level_Label (Level : Contrast_Level) return String is
   begin
      case Level is
         when Contrast_Fail =>
            return "low contrast";
         when Contrast_Large_Text =>
            return "large-text contrast";
         when Contrast_Normal_Text =>
            return "normal-text contrast";
         when Contrast_Enhanced_Text =>
            return "enhanced contrast";
      end case;
   end Contrast_Level_Label;

   function Contrast_Level_Label
     (Context : Humanize.Contexts.Context;
      Level   : Contrast_Level)
      return String is
   begin
      case Level is
         when Contrast_Fail =>
            return Color_Phrase (Context, Phrase_Low_Contrast);
         when Contrast_Large_Text =>
            return Color_Phrase (Context, Phrase_Large_Text_Contrast);
         when Contrast_Normal_Text =>
            return Color_Phrase (Context, Phrase_Normal_Text_Contrast);
         when Contrast_Enhanced_Text =>
            return Color_Phrase (Context, Phrase_Enhanced_Contrast);
      end case;
   end Contrast_Level_Label;

   function Contrast_Label
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Ratio : constant Long_Float := Contrast_Ratio (Foreground, Background);
   begin
      return Ok_Text
        (Ratio_Text (Ratio) & " "
         & Contrast_Level_Label (Contrast_Level_For (Ratio)));
   end Contrast_Label;

   function Contrast_Metadata_For
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Contrast_Metadata
   is
      Ratio : constant Long_Float := Contrast_Ratio (Foreground, Background);
      Level : constant Contrast_Level := Contrast_Level_For (Ratio);
   begin
      return
        (Status => Humanize.Status.Ok,
         Ratio => Ratio,
         Level => Level,
         Passes_Large_Text => Ratio >= 3.0,
         Passes_Normal_Text => Ratio >= 4.5,
         Passes_Enhanced_Text => Ratio >= 7.0);
   end Contrast_Metadata_For;

   function Palette_Metadata_For
     (Colors : Color_List)
      return Palette_Metadata
      is separate;

   function Palette_Metadata_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result
   is
      Info : constant Palette_Metadata := Palette_Metadata_For (Colors);
   begin
      return Ok_Text
        (Natural_Text (Info.Color_Count) & " colors, "
         & Natural_Text (Info.Pair_Count) & " pairs: "
         & Natural_Text (Info.Enhanced_Text_Pairs) & " enhanced, "
         & Natural_Text (Info.Normal_Text_Pairs) & " normal, "
         & Natural_Text (Info.Large_Text_Pairs) & " large-only, "
         & Natural_Text (Info.Failing_Pairs) & " fail");
   end Palette_Metadata_Label;

   function Alpha_Contrast_Label
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Alpha      : Long_Float)
      return Humanize.Status.Text_Result
   is
      Ratio : constant Long_Float :=
        Alpha_Contrast_Ratio (Foreground, Background, Alpha);
   begin
      return Ok_Text
        (Ratio_Text (Ratio) & " "
         & Contrast_Level_Label (Contrast_Level_For (Ratio))
         & " after alpha compositing");
   end Alpha_Contrast_Label;

   function Contrast_Label
     (Context    : Humanize.Contexts.Context;
      Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Ratio : constant Long_Float := Contrast_Ratio (Foreground, Background);
   begin
      return Ok_Text
        (Ratio_Text (Ratio) & " "
         & Contrast_Level_Label (Context, Contrast_Level_For (Ratio)));
   end Contrast_Label;

   function Mix_Toward
     (Color  : RGB_Color;
      Target : RGB_Color;
      Amount : Long_Float)
      return RGB_Color
   is
   begin
      return Composite (Target, Color, Amount);
   end Mix_Toward;

   function Accessible_Foreground
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : Contrast_Target := Target_Normal_Text)
      return Color_Remediation_Result
      is separate;

   function Contrast_Remediation_Label
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : Contrast_Target := Target_Normal_Text)
      return Humanize.Status.Text_Result
   is
      Current : constant Long_Float := Contrast_Ratio (Foreground, Background);
      Result  : constant Color_Remediation_Result :=
        Accessible_Foreground (Foreground, Background, Target);
      Hex     : constant Humanize.Status.Text_Result := Hex_Color (Result.Color);
   begin
      if Result.Status /= Humanize.Status.Ok then
         return (Status => Result.Status, others => <>);
      elsif Current >= Target_Ratio (Target) then
         return Ok_Text
           ("current foreground meets " & Target_Label (Target)
            & " contrast at " & Ratio_Text (Current));
      else
         return Ok_Text
           ("use " & Result_Text (Hex) & " for "
            & Ratio_Text (Result.Ratio) & " " & Target_Label (Target)
            & " contrast");
      end if;
   end Contrast_Remediation_Label;

   function Readability_Label
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result
   is
   begin
      case Contrast_Level_For (Contrast_Ratio (Foreground, Background)) is
         when Contrast_Enhanced_Text =>
            return Ok_Text ("readable for enhanced text");
         when Contrast_Normal_Text =>
            return Ok_Text ("readable for normal text");
         when Contrast_Large_Text =>
            return Ok_Text ("readable for large text only");
         when Contrast_Fail =>
            return Ok_Text ("low readability");
      end case;
   end Readability_Label;

   function Readability_Label
     (Context    : Humanize.Contexts.Context;
      Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result
   is
   begin
      case Contrast_Level_For (Contrast_Ratio (Foreground, Background)) is
         when Contrast_Enhanced_Text =>
            return Ok_Text (Color_Phrase (Context, Phrase_Readable_Enhanced));
         when Contrast_Normal_Text =>
            return Ok_Text (Color_Phrase (Context, Phrase_Readable_Normal));
         when Contrast_Large_Text =>
            return Ok_Text (Color_Phrase (Context, Phrase_Readable_Large_Only));
         when Contrast_Fail =>
            return Ok_Text (Color_Phrase (Context, Phrase_Low_Readability));
      end case;
   end Readability_Label;

   function APCA_Contrast
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Long_Float
   is
      use Ada.Numerics.Long_Elementary_Functions;
      F : constant Long_Float := Relative_Luminance (Foreground);
      B : constant Long_Float := Relative_Luminance (Background);
      Fp : constant Long_Float := "**" (F, 0.56);
      Bp : constant Long_Float := "**" (B, 0.57);
   begin
      return (Bp - Fp) * 100.0;
   end APCA_Contrast;

   function APCA_Strength_Label (Magnitude : Long_Float) return String is
   begin
      if Magnitude >= 75.0 then
         return "excellent";
      elsif Magnitude >= 60.0 then
         return "body text";
      elsif Magnitude >= 45.0 then
         return "large text";
      elsif Magnitude >= 30.0 then
         return "non-text only";
      else
         return "insufficient";
      end if;
   end APCA_Strength_Label;

   function APCA_Contrast_Label
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Score     : constant Long_Float := APCA_Contrast (Foreground, Background);
      Magnitude : constant Long_Float := abs Score;
      Polarity  : constant String :=
        (if Score >= 0.0 then "dark text on light background"
         else "light text on dark background");
   begin
      return Ok_Text
        ("Lc " & Humanize.Decimal_Images.Decimal_Image (Magnitude, 0, True)
         & ", " & APCA_Strength_Label (Magnitude) & ", " & Polarity);
   end APCA_Contrast_Label;

   function Simulated_CVD
     (Color      : RGB_Color;
      Deficiency : Color_Vision_Deficiency)
      return RGB_Color
   is
      R : constant Long_Float := Long_Float (Color.Red);
      G : constant Long_Float := Long_Float (Color.Green);
      B : constant Long_Float := Long_Float (Color.Blue);
   begin
      case Deficiency is
         when Protanopia =>
            return
              (Red   => Channel_From_Float (0.567 * R + 0.433 * G),
               Green => Channel_From_Float (0.558 * R + 0.442 * G),
               Blue  => Channel_From_Float (0.242 * G + 0.758 * B));
         when Deuteranopia =>
            return
              (Red   => Channel_From_Float (0.625 * R + 0.375 * G),
               Green => Channel_From_Float (0.700 * R + 0.300 * G),
               Blue  => Channel_From_Float (0.300 * G + 0.700 * B));
         when Tritanopia =>
            return
              (Red   => Channel_From_Float (0.950 * R + 0.050 * G),
               Green => Channel_From_Float (0.433 * G + 0.567 * B),
               Blue  => Channel_From_Float (0.475 * G + 0.525 * B));
         when Achromatopsia =>
            declare
               Y : constant Color_Channel :=
                 Channel_From_Float (0.299 * R + 0.587 * G + 0.114 * B);
            begin
               return (Y, Y, Y);
            end;
      end case;
   end Simulated_CVD;

   function Deficiency_Name
     (Deficiency : Color_Vision_Deficiency)
      return String
   is
   begin
      case Deficiency is
         when Protanopia =>
            return "protanopia";
         when Deuteranopia =>
            return "deuteranopia";
         when Tritanopia =>
            return "tritanopia";
         when Achromatopsia =>
            return "achromatopsia";
      end case;
   end Deficiency_Name;

   function CVD_Risk_Label (Difference : Long_Float) return String is
   begin
      if Difference < 10.0 then
         return "high confusion risk";
      elsif Difference < 25.0 then
         return "moderate confusion risk";
      elsif Difference < 45.0 then
         return "low confusion risk";
      else
         return "distinct";
      end if;
   end CVD_Risk_Label;

   function Color_Vision_Deficiency_Label
     (Left       : RGB_Color;
      Right      : RGB_Color;
      Deficiency : Color_Vision_Deficiency)
      return Humanize.Status.Text_Result
   is
      Sim_Left  : constant RGB_Color := Simulated_CVD (Left, Deficiency);
      Sim_Right : constant RGB_Color := Simulated_CVD (Right, Deficiency);
      Difference : constant Long_Float :=
        OK_Perceptual_Difference (Sim_Left, Sim_Right);
   begin
      return Ok_Text
        (Deficiency_Name (Deficiency) & " "
         & CVD_Risk_Label (Difference) & ", delta "
         & Humanize.Decimal_Images.Decimal_Image (Difference, 0, True));
   end Color_Vision_Deficiency_Label;

   function Worst_CVD_Risk
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return String
   is
      Worst_Delta : Long_Float := Long_Float'Last;
      Worst       : Color_Vision_Deficiency := Protanopia;
   begin
      for Deficiency in Color_Vision_Deficiency loop
         declare
            Difference : constant Long_Float :=
              OK_Perceptual_Difference
                (Simulated_CVD (Foreground, Deficiency),
                 Simulated_CVD (Background, Deficiency));
         begin
            if Difference < Worst_Delta then
               Worst_Delta := Difference;
               Worst := Deficiency;
            end if;
         end;
      end loop;

      return Deficiency_Name (Worst) & " " & CVD_Risk_Label (Worst_Delta);
   end Worst_CVD_Risk;

   function Color_Accessibility_Summary
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result
   is
      WCAG : constant Humanize.Status.Text_Result :=
        Contrast_Label (Foreground, Background);
      APCA : constant Humanize.Status.Text_Result :=
        APCA_Contrast_Label (Foreground, Background);
   begin
      return Ok_Text
        (Result_Text (WCAG) & "; "
         & Result_Text (APCA) & "; "
         & Worst_CVD_Risk (Foreground, Background));
   end Color_Accessibility_Summary;

   function Color_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float
   is
      use Ada.Numerics.Long_Elementary_Functions;
      DR : constant Long_Float := Long_Float (Integer (Left.Red)
        - Integer (Right.Red));
      DG : constant Long_Float := Long_Float (Integer (Left.Green)
        - Integer (Right.Green));
      DB : constant Long_Float := Long_Float (Integer (Left.Blue)
        - Integer (Right.Blue));
   begin
      return Sqrt (DR * DR + DG * DG + DB * DB) / Sqrt (3.0 * 255.0 * 255.0)
        * 100.0;
   end Color_Difference;

   function Color_Difference_Label
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant Long_Float := Color_Difference (Left, Right);
      Label : constant String :=
        (if Value < 2.0 then "nearly identical"
         elsif Value < 10.0 then "subtle difference"
         elsif Value < 25.0 then "noticeable difference"
         elsif Value < 50.0 then "strong difference"
         else "very different");
   begin
      return Ok_Text (Float_Text (Value, 0) & "% " & Label);
   end Color_Difference_Label;

   function Perceptual_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float
   is
      use Ada.Numerics.Long_Elementary_Functions;
      L : constant Lab_Color := Lab (Left);
      R : constant Lab_Color := Lab (Right);
      DL : constant Long_Float := L.Lightness - R.Lightness;
      DA : constant Long_Float := L.A - R.A;
      DB : constant Long_Float := L.B - R.B;
   begin
      return Sqrt (DL * DL + DA * DA + DB * DB);
   end Perceptual_Difference;

   function CIE94_Difference
     (Left     : RGB_Color;
      Right    : RGB_Color;
      Textiles : Boolean := False)
      return Long_Float
   is
      use Ada.Numerics.Long_Elementary_Functions;
      L : constant Lab_Color := Lab (Left);
      R : constant Lab_Color := Lab (Right);
      Delta_L : constant Long_Float := L.Lightness - R.Lightness;
      C1 : constant Long_Float := Sqrt (L.A * L.A + L.B * L.B);
      C2 : constant Long_Float := Sqrt (R.A * R.A + R.B * R.B);
      Delta_C : constant Long_Float := C1 - C2;
      Delta_A : constant Long_Float := L.A - R.A;
      Delta_B : constant Long_Float := L.B - R.B;
      Delta_H_Squared : constant Long_Float :=
        Long_Float'Max
          (0.0, Delta_A * Delta_A + Delta_B * Delta_B
           - Delta_C * Delta_C);
      K_L : constant Long_Float := (if Textiles then 2.0 else 1.0);
      K_C : constant Long_Float := 1.0;
      K_H : constant Long_Float := 1.0;
      K_1 : constant Long_Float := (if Textiles then 0.048 else 0.045);
      K_2 : constant Long_Float := (if Textiles then 0.014 else 0.015);
      S_L : constant Long_Float := 1.0;
      S_C : constant Long_Float := 1.0 + K_1 * C1;
      S_H : constant Long_Float := 1.0 + K_2 * C1;
      L_Term : constant Long_Float := Delta_L / (K_L * S_L);
      C_Term : constant Long_Float := Delta_C / (K_C * S_C);
      H_Term : constant Long_Float := Sqrt (Delta_H_Squared) / (K_H * S_H);
   begin
      return Sqrt
        (L_Term * L_Term + C_Term * C_Term + H_Term * H_Term);
   end CIE94_Difference;

   function CIEDE2000_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float
      is separate;

   function OK_Perceptual_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float
   is
      use Ada.Numerics.Long_Elementary_Functions;
      L : constant OKLab_Color := OKLab (Left);
      R : constant OKLab_Color := OKLab (Right);
      DL : constant Long_Float := L.Lightness - R.Lightness;
      DA : constant Long_Float := L.A - R.A;
      DB : constant Long_Float := L.B - R.B;
   begin
      return Sqrt (DL * DL + DA * DA + DB * DB) * 100.0;
   end OK_Perceptual_Difference;

   function Perceptual_Difference
     (Left   : RGB_Color;
      Right  : RGB_Color;
      Method : Perceptual_Difference_Method)
      return Long_Float
   is
   begin
      case Method is
         when Perceptual_CIE76 =>
            return Perceptual_Difference (Left, Right);
         when Perceptual_CIE94_Graphic_Arts =>
            return CIE94_Difference (Left, Right);
         when Perceptual_CIE94_Textiles =>
            return CIE94_Difference (Left, Right, Textiles => True);
         when Perceptual_CIEDE2000 =>
            return CIEDE2000_Difference (Left, Right);
         when Perceptual_OKLab =>
            return OK_Perceptual_Difference (Left, Right);
      end case;
   end Perceptual_Difference;

   function Perceptual_Method_Label
     (Method : Perceptual_Difference_Method)
      return String
   is
   begin
      case Method is
         when Perceptual_CIE76 =>
            return "CIE76 delta ";
         when Perceptual_CIE94_Graphic_Arts =>
            return "CIE94 delta ";
         when Perceptual_CIE94_Textiles =>
            return "CIE94 textile delta ";
         when Perceptual_CIEDE2000 =>
            return "CIEDE2000 delta ";
         when Perceptual_OKLab =>
            return "OKLab delta ";
      end case;
   end Perceptual_Method_Label;

   function Perceptual_Difference_Descriptor
     (Value : Long_Float)
      return String
   is
   begin
      return
        (if Value < 1.0 then "imperceptible"
         elsif Value < 3.0 then "barely perceptible"
         elsif Value < 8.0 then "subtle perceptual difference"
         elsif Value < 18.0 then "noticeable perceptual difference"
         elsif Value < 35.0 then "large perceptual difference"
         else "dramatic perceptual difference");
   end Perceptual_Difference_Descriptor;

   function Perceptual_Difference_Label
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant Long_Float := OK_Perceptual_Difference (Left, Right);
   begin
      return Ok_Text
        ("OKLab delta " & Float_Text (Value, 1) & ", "
         & Perceptual_Difference_Descriptor (Value));
   end Perceptual_Difference_Label;

   function Perceptual_Difference_Label
     (Left   : RGB_Color;
      Right  : RGB_Color;
      Method : Perceptual_Difference_Method)
      return Humanize.Status.Text_Result
   is
      Value : constant Long_Float :=
        Perceptual_Difference (Left, Right, Method);
   begin
      return Ok_Text
        (Perceptual_Method_Label (Method) & Float_Text (Value, 1) & ", "
         & Perceptual_Difference_Descriptor (Value));
   end Perceptual_Difference_Label;

   procedure Hex_Color_Into
     (Color     : RGB_Color;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Prefix    : Boolean := True;
      Lowercase : Boolean := False)
   is
   begin
      Copy_Result
        (Hex_Color (Color, Prefix, Lowercase), Target, Written, Status);
   end Hex_Color_Into;

   procedure RGB_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (RGB_Label (Color), Target, Written, Status);
   end RGB_Label_Into;

   procedure RGBA_Label_Into
     (Color   : RGB_Color;
      Opacity : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (RGBA_Label (Color, Opacity), Target, Written, Status);
   end RGBA_Label_Into;

   procedure CSS_Color_Label_Into
     (Color   : CSS_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (CSS_Color_Label (Color), Target, Written, Status);
   end CSS_Color_Label_Into;

   procedure HSL_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (HSL_Label (Color), Target, Written, Status);
   end HSL_Label_Into;

   procedure HSV_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (HSV_Label (Color), Target, Written, Status);
   end HSV_Label_Into;

   procedure Hue_Family_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Hue_Family_Label (Color), Target, Written, Status);
   end Hue_Family_Label_Into;

   procedure Hue_Family_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Hue_Family_Label (Context, Color), Target, Written, Status);
   end Hue_Family_Label_Into;

   procedure Saturation_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Saturation_Label (Color), Target, Written, Status);
   end Saturation_Label_Into;

   procedure Saturation_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Saturation_Label (Context, Color), Target, Written, Status);
   end Saturation_Label_Into;

   procedure Temperature_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Temperature_Label (Color), Target, Written, Status);
   end Temperature_Label_Into;

   procedure Temperature_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Temperature_Label (Context, Color), Target, Written, Status);
   end Temperature_Label_Into;

   procedure Chroma_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Chroma_Label (Color), Target, Written, Status);
   end Chroma_Label_Into;

   procedure Chroma_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Chroma_Label (Context, Color), Target, Written, Status);
   end Chroma_Label_Into;

   procedure Color_Description_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Color_Description (Color), Target, Written, Status);
   end Color_Description_Into;

   procedure Color_Description_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Color_Description (Context, Color), Target, Written, Status);
   end Color_Description_Into;

   procedure Nearest_Color_Name_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Nearest_Color_Name (Color), Target, Written, Status);
   end Nearest_Color_Name_Into;

   procedure Descriptive_Color_Name_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Descriptive_Color_Name (Color), Target, Written, Status);
   end Descriptive_Color_Name_Into;

   procedure Palette_Summary_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Palette_Summary (Colors), Target, Written, Status);
   end Palette_Summary_Into;

   procedure Palette_Roles_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Palette_Roles (Colors), Target, Written, Status);
   end Palette_Roles_Into;

   procedure Palette_Harmony_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Palette_Harmony_Label (Colors), Target, Written, Status);
   end Palette_Harmony_Label_Into;

   procedure Palette_Contrast_Suggestion_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Palette_Contrast_Suggestion (Colors), Target, Written, Status);
   end Palette_Contrast_Suggestion_Into;

   procedure Palette_Accessibility_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Palette_Accessibility_Label (Colors), Target, Written, Status);
   end Palette_Accessibility_Label_Into;

   procedure Palette_Contrast_Matrix_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Palette_Contrast_Matrix_Label (Colors), Target, Written, Status);
   end Palette_Contrast_Matrix_Label_Into;

   procedure Palette_Metadata_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Palette_Metadata_Label (Colors), Target, Written, Status);
   end Palette_Metadata_Label_Into;

   procedure Palette_Mood_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Palette_Mood_Label (Colors), Target, Written, Status);
   end Palette_Mood_Label_Into;

   procedure Advanced_Palette_Summary_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Advanced_Palette_Summary (Colors), Target, Written, Status);
   end Advanced_Palette_Summary_Into;

   procedure Color_Summary_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Color_Summary (Color), Target, Written, Status);
   end Color_Summary_Into;

   procedure Brightness_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Brightness_Label (Color), Target, Written, Status);
   end Brightness_Label_Into;

   procedure Brightness_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Brightness_Label (Context, Color), Target, Written, Status);
   end Brightness_Label_Into;

   procedure Opacity_Label_Into
     (Opacity : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Opacity_Label (Opacity), Target, Written, Status);
   end Opacity_Label_Into;

   procedure Contrast_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Contrast_Label (Foreground, Background), Target, Written, Status);
   end Contrast_Label_Into;

   procedure Contrast_Label_Into
     (Context    : Humanize.Contexts.Context;
      Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Contrast_Label (Context, Foreground, Background),
         Target, Written, Status);
   end Contrast_Label_Into;

   procedure Alpha_Contrast_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Alpha      : Long_Float;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Alpha_Contrast_Label (Foreground, Background, Alpha),
         Target, Written, Status);
   end Alpha_Contrast_Label_Into;

   procedure Readability_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Readability_Label (Foreground, Background), Target, Written, Status);
   end Readability_Label_Into;

   procedure Readability_Label_Into
     (Context    : Humanize.Contexts.Context;
      Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Readability_Label (Context, Foreground, Background),
         Target, Written, Status);
   end Readability_Label_Into;

   procedure APCA_Contrast_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (APCA_Contrast_Label (Foreground, Background), Target, Written, Status);
   end APCA_Contrast_Label_Into;

   procedure Color_Vision_Deficiency_Label_Into
     (Left       : RGB_Color;
      Right      : RGB_Color;
      Deficiency : Color_Vision_Deficiency;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Color_Vision_Deficiency_Label (Left, Right, Deficiency),
         Target, Written, Status);
   end Color_Vision_Deficiency_Label_Into;

   procedure Color_Accessibility_Summary_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Color_Accessibility_Summary (Foreground, Background),
         Target, Written, Status);
   end Color_Accessibility_Summary_Into;

   procedure Contrast_Remediation_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Goal       : Contrast_Target := Target_Normal_Text)
   is
   begin
      Copy_Result
        (Contrast_Remediation_Label (Foreground, Background, Goal),
         Target, Written, Status);
   end Contrast_Remediation_Label_Into;

   procedure Color_Difference_Label_Into
     (Left    : RGB_Color;
      Right   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Color_Difference_Label (Left, Right), Target, Written, Status);
   end Color_Difference_Label_Into;

   procedure Perceptual_Difference_Label_Into
     (Left    : RGB_Color;
      Right   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Perceptual_Difference_Label (Left, Right), Target, Written, Status);
   end Perceptual_Difference_Label_Into;

   procedure Perceptual_Difference_Label_Into
     (Left    : RGB_Color;
      Right   : RGB_Color;
      Method  : Perceptual_Difference_Method;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Perceptual_Difference_Label (Left, Right, Method),
         Target, Written, Status);
   end Perceptual_Difference_Label_Into;

end Humanize.Colors.Support.Backend;
