with AUnit.Assertions;

with Humanize.Colors;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Colors is

   use Humanize.Status;
   use type Humanize.Colors.RGB_Color;
   use type Humanize.Colors.Contrast_Level;

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

   procedure Test_Color_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Parsed : Humanize.Colors.RGB_Color;
      CSS    : Humanize.Colors.CSS_Color;
      Invalid_CSS_1 : Humanize.Colors.CSS_Color;
      Invalid_CSS_2 : Humanize.Colors.CSS_Color;
      Invalid_CSS_3 : Humanize.Colors.CSS_Color;
      Invalid_CSS_4 : Humanize.Colors.CSS_Color;
      Code   : Status_Code;
      Invalid_Color : Humanize.Colors.RGB_Color;
      Blue   : constant Humanize.Colors.RGB_Color :=
        (Red => 51, Green => 102, Blue => 153);
      Purple : constant Humanize.Colors.RGB_Color :=
        (Red => 102, Green => 51, Blue => 153);
      Black  : constant Humanize.Colors.RGB_Color :=
        (Red => 0, Green => 0, Blue => 0);
      White  : constant Humanize.Colors.RGB_Color :=
        (Red => 255, Green => 255, Blue => 255);
      Red    : constant Humanize.Colors.RGB_Color :=
        (Red => 255, Green => 0, Blue => 0);
      Pink   : constant Humanize.Colors.RGB_Color :=
        (Red => 255, Green => 192, Blue => 203);
      Gray   : constant Humanize.Colors.RGB_Color :=
        (Red => 119, Green => 119, Blue => 119);
      Palette : constant Humanize.Colors.Color_List :=
        [Black, Blue, White];
      Complementary_Palette : constant Humanize.Colors.Color_List :=
        [Red, (Red => 0, Green => 255, Blue => 255)];
      Buffer : String (1 .. 40);
      Wide_Buffer : String (1 .. 120);
      Written : Natural;
      Bounded_Status : Status_Code;
   begin
      Code := Humanize.Colors.Parse_Hex_Color ("#369", Parsed);
      AUnit.Assertions.Assert
        (Code = Ok and then Parsed = Blue,
         "short hex parser");
      Code := Humanize.Colors.Parse_Hex_Color ("336699", Parsed);
      AUnit.Assertions.Assert
        (Code = Ok and then Parsed = Blue,
         "long hex parser");
      Code := Humanize.Colors.Parse_Hex_Color ("#GGG", Invalid_Color);
      AUnit.Assertions.Assert
        (Code = Invalid_Value,
         "hex parser rejects invalid digits");
      Code := Humanize.Colors.Parse_Named_Color ("rebeccapurple", Parsed);
      AUnit.Assertions.Assert
        (Code = Ok and then Parsed = Purple,
         "named color parser");
      Code := Humanize.Colors.Parse_Named_Color ("grey", Parsed);
      AUnit.Assertions.Assert
        (Code = Ok and then Parsed = (128, 128, 128),
         "named color parser gray alias");
      Code := Humanize.Colors.Parse_Named_Color ("mediumseagreen", Parsed);
      AUnit.Assertions.Assert
        (Code = Ok and then Parsed = (60, 179, 113),
         "full named color parser");
      Code := Humanize.Colors.Parse_Named_Color ("whitesmoke", Parsed);
      AUnit.Assertions.Assert
        (Code = Ok and then Parsed = (245, 245, 245),
         "full named color parser late table entry");
      Code := Humanize.Colors.Parse_CSS_Color ("tomato", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color = (255, 99, 71)
         and then not CSS.Has_Opacity,
         "extended named color parser");
      Code := Humanize.Colors.Parse_CSS_Color ("#33669980", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color = Blue and then CSS.Has_Opacity
         and then CSS.Opacity > 0.501 and then CSS.Opacity < 0.503,
         "eight-digit hex parser");
      Code := Humanize.Colors.Parse_CSS_Color ("#3698", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color = Blue and then CSS.Has_Opacity
         and then CSS.Opacity > 0.532 and then CSS.Opacity < 0.534,
         "four-digit hex parser");
      Code := Humanize.Colors.Parse_CSS_Color ("rgba(51, 102, 153, 0.5)", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color = Blue and then CSS.Has_Opacity
         and then CSS.Opacity = 0.5,
         "rgba parser");
      Code := Humanize.Colors.Parse_CSS_Color ("rgb(51 102 153 / 50%)", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color = Blue and then CSS.Has_Opacity
         and then CSS.Opacity = 0.5,
         "modern rgb parser");
      Code := Humanize.Colors.Parse_CSS_Color
        ("rgb(calc(25 + 26) calc(50% - 10%) 153 / calc(25% * 2))", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color = Blue and then CSS.Has_Opacity
         and then CSS.Opacity = 0.5,
         "rgb calc parser");
      Code := Humanize.Colors.Parse_CSS_Color ("rgb(none 102 153)", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color = (0, 102, 153),
         "rgb none channel parser");
      Code := Humanize.Colors.Parse_CSS_Color ("hsl(210, 50%, 40%)", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color = Blue and then not CSS.Has_Opacity,
         "hsl parser");
      Code := Humanize.Colors.Parse_CSS_Color
        ("hsl(210deg 50% 40% / 25%)", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color = Blue and then CSS.Has_Opacity
         and then CSS.Opacity = 0.25,
         "modern hsl parser");
      Code := Humanize.Colors.Parse_CSS_Color ("hwb(210 20% 40%)", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color = Blue and then not CSS.Has_Opacity,
         "hwb parser");
      Code := Humanize.Colors.Parse_CSS_Color ("lab(0% 0 0)", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color = Black,
         "lab parser");
      Code := Humanize.Colors.Parse_CSS_Color ("lch(0% 0 0)", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color = Black,
         "lch parser");
      Code := Humanize.Colors.Parse_CSS_Color ("oklab(0 0 0)", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color = Black,
         "oklab parser");
      Code := Humanize.Colors.Parse_CSS_Color ("oklch(0% 0 0 / 75%)", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color = Black and then CSS.Has_Opacity
         and then CSS.Opacity = 0.75,
         "oklch parser");
      Code := Humanize.Colors.Parse_CSS_Color ("color(srgb 0.2 0.4 0.6)", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color = Blue and then not CSS.Has_Opacity,
         "color srgb parser");
      Code := Humanize.Colors.Parse_CSS_Color
        ("color(srgb calc(20%) calc(40%) calc(60%) / 50%)", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color = Blue and then CSS.Has_Opacity
         and then CSS.Opacity = 0.5,
         "color srgb calc parser");
      Code := Humanize.Colors.Parse_CSS_Color
        ("color(display-p3 1 0 0 / 25%)", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color.Red > 250 and then CSS.Has_Opacity
         and then CSS.Opacity = 0.25,
         "color display-p3 parser");
      Code := Humanize.Colors.Parse_CSS_Color ("color(rec2020 1 0 0)", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color.Red > 250,
         "color rec2020 parser");
      Code := Humanize.Colors.Parse_CSS_Color ("color(xyz 0 0 0)", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color = Black,
         "color xyz parser");
      Code := Humanize.Colors.Parse_CSS_Color ("color(xyz-d50 0 0 0)", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color = Black,
         "color xyz-d50 parser");
      Code := Humanize.Colors.Parse_CSS_Color ("currentColor", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Is_Current and then not CSS.Has_Opacity,
         "currentColor parser");
      Code := Humanize.Colors.Parse_CSS_Color ("transparent", CSS);
      AUnit.Assertions.Assert
        (Code = Ok and then CSS.Color = Black and then CSS.Has_Opacity
         and then CSS.Opacity = 0.0,
         "transparent named color parser");
      Code := Humanize.Colors.Parse_CSS_Color
        ("rgb(300, 0, 0)", Invalid_CSS_1);
      AUnit.Assertions.Assert
        (Code = Invalid_Value,
         "css color parser rejects out-of-range channels");
      Code := Humanize.Colors.Parse_CSS_Color
        ("rgb(51 102 153 0.5)", Invalid_CSS_2);
      AUnit.Assertions.Assert
        (Code = Invalid_Value,
         "modern rgb parser rejects alpha without slash");
      Code := Humanize.Colors.Parse_CSS_Color
        ("hsl(210 50% 40% 0.5)", Invalid_CSS_3);
      AUnit.Assertions.Assert
        (Code = Invalid_Value,
         "modern hsl parser rejects alpha without slash");
      Code := Humanize.Colors.Parse_CSS_Color
        ("color(unknown 1 0 0)", Invalid_CSS_4);
      AUnit.Assertions.Assert
        (Code = Invalid_Value,
         "color parser rejects unknown profile");

      Check (Humanize.Colors.Hex_Color (Blue), "#336699", "hex color");
      Check
        (Humanize.Colors.Hex_Color (Blue, Prefix => False, Lowercase => True),
         "336699", "lowercase hex without prefix");
      Check
        (Humanize.Colors.RGB_Label (Blue),
         "rgb(51, 102, 153)", "RGB label");
      Check
        (Humanize.Colors.RGBA_Label (Blue, 0.5),
         "rgba(51, 102, 153, 0.5)", "RGBA label");
      Check
        (Humanize.Colors.CSS_Color_Label
           ((Color => Blue, Opacity => 0.5, Has_Opacity => True,
             Is_Current => False)),
         "rgba(51, 102, 153, 0.5)", "CSS color label");
      Check
        (Humanize.Colors.CSS_Color_Label
           ((Color => Black, Opacity => 1.0, Has_Opacity => False,
             Is_Current => True)),
         "currentColor", "currentColor label");
      Check
        (Humanize.Colors.HSL_Label (Blue),
         "hsl(210, 50%, 40%)", "HSL label");
      Check
        (Humanize.Colors.HSV_Label (Blue),
         "hsv(210, 67%, 60%)", "HSV label");
      Check
        (Humanize.Colors.Hue_Family_Label (Blue),
         "blue", "hue family label");
      Check
        (Humanize.Colors.Hue_Family_Label (Gray),
         "neutral", "neutral hue family label");
      Check
        (Humanize.Colors.Saturation_Label (Blue),
         "muted", "saturation label");
      Check
        (Humanize.Colors.Saturation_Label (Red),
         "vivid", "vivid saturation label");
      Check
        (Humanize.Colors.Temperature_Label (Red),
         "warm", "warm temperature label");
      Check
        (Humanize.Colors.Temperature_Label (Blue),
         "cool", "cool temperature label");
      Check
        (Humanize.Colors.Chroma_Label (Pink),
         "pastel", "pastel chroma label");
      Check
        (Humanize.Colors.Color_Description (Blue),
         "dark, muted blue, cool, moderate chroma", "color description");
      Check
        (Humanize.Colors.Nearest_Color_Name (Purple),
         "rebeccapurple", "nearest named color");
      Check
        (Humanize.Colors.Palette_Summary (Palette),
         "3 colors, mostly gray, high contrast spread", "palette summary");
      Check
        (Humanize.Colors.Palette_Roles (Palette),
         "background #FFFFFF, text #000000, accent #336699",
         "palette roles");
      Check
        (Humanize.Colors.Palette_Harmony_Label (Palette),
         "single-accent palette", "single-accent palette harmony");
      Check
        (Humanize.Colors.Palette_Harmony_Label (Complementary_Palette),
         "complementary palette", "complementary palette harmony");
      Check
        (Humanize.Colors.Palette_Contrast_Suggestion (Palette),
         "best contrast #000000 on #FFFFFF at 21:1",
         "palette contrast suggestion");
      Check
        (Humanize.Colors.Palette_Accessibility_Label (Palette),
         "2 of 3 pairs pass normal text contrast",
         "palette accessibility label");
      Check
        (Humanize.Colors.Palette_Contrast_Matrix_Label (Palette),
         "1 enhanced, 1 normal, 1 large-only, 0 fail out of 3 pairs",
         "palette contrast matrix label");
      Check
        (Humanize.Colors.Palette_Mood_Label (Palette),
         "balanced, subtle, cool mood", "palette mood label");
      Check
        (Humanize.Colors.Advanced_Palette_Summary (Palette),
         "single-accent palette, balanced, subtle, cool mood, "
         & "2 of 3 pairs pass normal text contrast; background #FFFFFF, "
         & "text #000000, accent #336699",
         "advanced palette summary");
      Check
        (Humanize.Colors.Color_Summary (Blue),
         "#336699 rgb(51, 102, 153)", "color summary");
      Check
        (Humanize.Colors.Brightness_Label (Black),
         "very dark", "black brightness");
      Check
        (Humanize.Colors.Brightness_Label (White),
         "very light", "white brightness");
      Check
        (Humanize.Colors.Opacity_Label (0.5),
         "50% translucent", "opacity label");
      Check
        (Humanize.Colors.Opacity_Label (1.2),
         "100% opaque", "opacity clamps high");
      Check
        (Humanize.Colors.Contrast_Label (Black, White),
         "21:1 enhanced contrast", "black white contrast");
      Check
        (Humanize.Colors.Readability_Label (Black, White),
         "readable for enhanced text", "black white readability");
      Check
        (Humanize.Colors.Readability_Label (Gray, White),
         "readable for large text only", "gray white readability");
      Check
        (Humanize.Colors.APCA_Contrast_Label (Black, White),
         "Lc 100, excellent, dark text on light background",
         "black white APCA label");
      Check
        (Humanize.Colors.APCA_Contrast_Label (White, Black),
         "Lc 100, excellent, light text on dark background",
         "white black APCA label");
      Check
        (Humanize.Colors.Color_Vision_Deficiency_Label
           (Red, (Red => 0, Green => 255, Blue => 0),
            Humanize.Colors.Deuteranopia),
         "deuteranopia low confusion risk, delta 33",
         "deuteranopia color risk label");
      Check
        (Humanize.Colors.Color_Accessibility_Summary (Black, White),
         "21:1 enhanced contrast; Lc 100, excellent, "
         & "dark text on light background; protanopia distinct",
         "combined color accessibility summary");
      Check
        (Humanize.Colors.Color_Difference_Label (Black, White),
         "100% very different", "color difference label");
      Check
        (Humanize.Colors.Perceptual_Difference_Label (Black, White),
         "OKLab delta 100, dramatic perceptual difference",
         "perceptual difference label");
      AUnit.Assertions.Assert
        (Humanize.Colors.Perceptual_Difference (Black, White) > 99.0,
         "Lab perceptual difference");
      AUnit.Assertions.Assert
        (Humanize.Colors.OK_Perceptual_Difference (Black, White) > 99.0,
         "OKLab perceptual difference");
      AUnit.Assertions.Assert
        (Humanize.Colors.Contrast_Level_For (4.5)
         = Humanize.Colors.Contrast_Normal_Text,
         "contrast level threshold");

      Humanize.Colors.Contrast_Label_Into
        (Black, White, Buffer, Written, Bounded_Status);
      AUnit.Assertions.Assert
        (Bounded_Status = Ok
         and then Buffer (1 .. Written) = "21:1 enhanced contrast",
         "bounded contrast label");
      Humanize.Colors.HSL_Label_Into
        (Blue, Buffer, Written, Bounded_Status);
      AUnit.Assertions.Assert
        (Bounded_Status = Ok
         and then Buffer (1 .. Written) = "hsl(210, 50%, 40%)",
         "bounded HSL label");
      Humanize.Colors.Color_Summary_Into
        (Blue, Buffer (1 .. 8), Written, Bounded_Status);
      AUnit.Assertions.Assert
        (Bounded_Status = Buffer_Overflow
         and then Buffer (1 .. Written) = "#336699 ",
         "bounded color summary overflow");
      Humanize.Colors.Color_Difference_Label_Into
        (Black, White, Buffer, Written, Bounded_Status);
      AUnit.Assertions.Assert
        (Bounded_Status = Ok
         and then Buffer (1 .. Written) = "100% very different",
         "bounded color difference label");
      Humanize.Colors.Hue_Family_Label_Into
        (Blue, Buffer, Written, Bounded_Status);
      AUnit.Assertions.Assert
        (Bounded_Status = Ok
         and then Buffer (1 .. Written) = "blue",
         "bounded hue family label");
      Humanize.Colors.Palette_Roles_Into
        (Palette, Buffer, Written, Bounded_Status);
      AUnit.Assertions.Assert
        (Bounded_Status = Buffer_Overflow
         and then Buffer (1 .. Written) =
           "background #FFFFFF, text #000000, accent",
         "bounded palette roles overflow");
      Humanize.Colors.Palette_Contrast_Matrix_Label_Into
        (Palette, Wide_Buffer, Written, Bounded_Status);
      AUnit.Assertions.Assert
        (Bounded_Status = Ok
         and then Wide_Buffer (1 .. Written)
           = "1 enhanced, 1 normal, 1 large-only, 0 fail out of 3 pairs",
         "bounded palette contrast matrix");
      Humanize.Colors.APCA_Contrast_Label_Into
        (Black, White, Wide_Buffer, Written, Bounded_Status);
      AUnit.Assertions.Assert
        (Bounded_Status = Ok
         and then Wide_Buffer (1 .. Written)
           = "Lc 100, excellent, dark text on light background",
         "bounded APCA label");
      Humanize.Colors.Color_Vision_Deficiency_Label_Into
        (Red, (Red => 0, Green => 255, Blue => 0),
         Humanize.Colors.Deuteranopia, Wide_Buffer, Written, Bounded_Status);
      AUnit.Assertions.Assert
        (Bounded_Status = Ok
         and then Wide_Buffer (1 .. Written)
           = "deuteranopia low confusion risk, delta 33",
         "bounded color vision deficiency label");
      Humanize.Colors.Color_Accessibility_Summary_Into
        (Black, White, Wide_Buffer, Written, Bounded_Status);
      AUnit.Assertions.Assert
        (Bounded_Status = Ok
         and then Wide_Buffer (1 .. Written)
           = "21:1 enhanced contrast; Lc 100, excellent, "
             & "dark text on light background; protanopia distinct",
         "bounded color accessibility summary");
      Humanize.Colors.Perceptual_Difference_Label_Into
        (Black, White, Buffer, Written, Bounded_Status);
      AUnit.Assertions.Assert
        (Bounded_Status = Buffer_Overflow
         and then Buffer (1 .. Written) =
           "OKLab delta 100, dramatic perceptual dif",
         "bounded perceptual difference overflow");
   end Test_Color_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize color tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Color_Labels'Access,
        "color and contrast labels");
   end Register_Tests;

end Humanize.Tests.Colors;
