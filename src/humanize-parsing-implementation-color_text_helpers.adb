with Humanize.Bounded_Text;
with Humanize.Parsing.Implementation.Numeric_Text_Helpers;
with Humanize.Parsing.Support;
with Humanize.Status;

package body Humanize.Parsing.Implementation.Color_Text_Helpers is
   use type Humanize.Status.Status_Code;
   use type Humanize.Colors.RGB_Color;

   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;
   function Lower (Text : String) return String
      renames Humanize.Bounded_Text.Lower_Text;
   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;
   function Starts_With (Text, Prefix : String) return Boolean
      renames Humanize.Bounded_Text.Starts_With;
   function Ends_With (Text, Suffix : String) return Boolean
      renames Humanize.Bounded_Text.Ends_With;
   function Find_Substring (Text, Pattern : String) return Natural
      renames Humanize.Bounded_Text.Index_Text;

   function Parse_Natural_Field
     (Text  : String;
      Value : out Natural)
      return Boolean
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Parse_Natural_Field;
   function Numeric_Value
     (Text  : String;
      Value : out Long_Float)
      return Boolean
      renames Humanize.Parsing.Support.Numeric_Value;
   procedure Store
     (Source : String;
      Target : out String;
      Length : out Natural)
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Store;

   function Parse_Float_Field
     (Text  : String;
      Value : out Long_Float)
      return Boolean
   is
   begin
      Value := Long_Float'Value (Trim (Text));
      return True;
   exception
      when others =>
         Value := 0.0;
         return False;
   end Parse_Float_Field;

   function Parse_Percent_Field
     (Text  : String;
      Value : out Long_Float)
      return Boolean
   is
      Item : constant String := Trim (Text);
   begin
      return Item'Length > 1
        and then Ends_With (Item, "%")
        and then Parse_Float_Field (Item (Item'First .. Item'Last - 1), Value);
   end Parse_Percent_Field;

   function To_Channel (Value : Natural) return Humanize.Colors.Color_Channel is
   begin
      if Value > 255 then
         return 0;
      else
         return Humanize.Colors.Color_Channel (Value);
      end if;
   end To_Channel;

   function Parse_Palette_Contrast_Matrix
     (Text : String)
      return Humanize.Parsing.Palette_Contrast_Matrix_Parse_Result
      is separate;

   function Parse_Palette_Metadata_Label
     (Text : String)
      return Humanize.Parsing.Palette_Metadata_Parse_Result
      is separate;

   function Parse_APCA_Contrast_Label
     (Text : String)
      return Humanize.Parsing.APCA_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      First_Comma : constant Natural := Find_Substring (Item, ", ");
      Rest : constant String :=
        (if First_Comma = 0 then "" else Item (First_Comma + 2 .. Item'Last));
      Second_Comma : constant Natural := Find_Substring (Rest, ", ");
      Score : Long_Float;
      Strength_Text : String (1 .. 32);
      Strength_Length : Natural;
      Polarity_Text : String (1 .. 48);
      Polarity_Length : Natural;
   begin
      if not Starts_With (Item, "Lc ")
        or else First_Comma = 0
        or else Second_Comma = 0
        or else not Numeric_Value
          (Item (Item'First + 3 .. First_Comma - 1), Score)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Humanize.Parsing.Expected_Number,
                 others => <>);
      end if;

      Store (Rest (Rest'First .. Second_Comma - 1),
             Strength_Text, Strength_Length);
      Store (Rest (Second_Comma + 2 .. Rest'Last),
             Polarity_Text, Polarity_Length);
      return
        (Status => Humanize.Status.Ok,
         Score => Score,
         Strength => Strength_Text,
         Strength_Length => Strength_Length,
         Polarity => Polarity_Text,
         Polarity_Length => Polarity_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => Humanize.Parsing.No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_APCA_Contrast_Label;

   function Deficiency_From_Text
     (Text       : String;
      Deficiency : out Humanize.Colors.Color_Vision_Deficiency)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
   begin
      if Item = "protanopia" then
         Deficiency := Humanize.Colors.Protanopia;
      elsif Item = "deuteranopia" then
         Deficiency := Humanize.Colors.Deuteranopia;
      elsif Item = "tritanopia" then
         Deficiency := Humanize.Colors.Tritanopia;
      elsif Item = "achromatopsia" then
         Deficiency := Humanize.Colors.Achromatopsia;
      else
         return False;
      end if;
      return True;
   end Deficiency_From_Text;

   function Parse_Color_Vision_Deficiency_Label
     (Text : String)
      return Humanize.Parsing.Color_Vision_Deficiency_Parse_Result
      is separate;

   function Parse_Contrast_Label
     (Text : String;
      Ratio : out Long_Float;
      Level : out String;
      Level_Length : out Natural)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Ratio_Mark : constant Natural := Find_Substring (Item, ":1 ");
   begin
      if Ratio_Mark = 0
        or else not Numeric_Value (Item (Item'First .. Ratio_Mark - 1), Ratio)
      then
         return False;
      end if;

      declare
         Label : constant String := Trim (Item (Ratio_Mark + 3 .. Item'Last));
         Canonical : constant String := Lower (Label);
      begin
         if Canonical'Length = 0 then
            return False;
         elsif Ends_With (Canonical, " contrast") then
            Store
              (Canonical (Canonical'First
               .. Canonical'Last - String'(" contrast")'Length),
               Level, Level_Length);
         elsif Ends_With (Canonical, "-text contrast") then
            Store
              (Canonical (Canonical'First
               .. Canonical'Last - String'("-text contrast")'Length),
               Level, Level_Length);
         else
            Store (Label, Level, Level_Length);
         end if;
         return True;
      end;
   end Parse_Contrast_Label;

   function Parse_Alpha_Contrast_Label
     (Text : String)
      return Humanize.Parsing.Color_Difference_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Suffix : constant String := " after alpha compositing";
      Ratio : Long_Float;
      Level_Buffer : String (1 .. 48);
      Level_Length : Natural;
   begin
      if not Ends_With (Lower (Item), Suffix)
        or else not Parse_Contrast_Label
          (Item (Item'First .. Item'Last - Suffix'Length),
           Ratio, Level_Buffer, Level_Length)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Humanize.Parsing.Expected_Separator,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Value => Ratio,
         Label => Level_Buffer,
         Label_Length => Level_Length,
         Perceptual => False,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => Humanize.Parsing.No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Alpha_Contrast_Label;

   function Parse_Color_Accessibility_Summary
     (Text : String)
      return Humanize.Parsing.Color_Accessibility_Parse_Result
      is separate;

   function Parse_Contrast_Remediation_Label
     (Text : String)
      return Humanize.Parsing.Contrast_Remediation_Parse_Result
      is separate;

   function Parse_RGB_Components
     (Text        : String;
      Prefix      : String;
      Need_Alpha  : Boolean;
      Color       : out Humanize.Colors.RGB_Color;
      Opacity     : out Long_Float)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Body_First : Natural;
      Body_Last  : Natural;
      C1 : Natural := 0;
      C2 : Natural := 0;
      C3 : Natural := 0;
      A  : Long_Float := 1.0;
      First_Comma : Natural;
      Second_Comma : Natural;
      Third_Comma : Natural := 0;
   begin
      Color := (others => 0);
      Opacity := 1.0;
      if not Starts_With (Item, Prefix & "(") or else not Ends_With (Item, ")") then
         return False;
      end if;

      Body_First := Item'First + Prefix'Length + 1;
      Body_Last := Item'Last - 1;
      First_Comma := Find_Substring (Item (Body_First .. Body_Last), ", ");
      if First_Comma = 0 then
         return False;
      end if;
      Second_Comma := Find_Substring (Item (First_Comma + 2 .. Body_Last), ", ");
      if Second_Comma = 0 then
         return False;
      end if;
      if Need_Alpha then
         Third_Comma := Find_Substring (Item (Second_Comma + 2 .. Body_Last), ", ");
         if Third_Comma = 0 then
            return False;
         end if;
      end if;

      if not Parse_Natural_Field (Item (Body_First .. First_Comma - 1), C1)
        or else not Parse_Natural_Field (Item (First_Comma + 2 .. Second_Comma - 1), C2)
      then
         return False;
      end if;

      if Need_Alpha then
         if not Parse_Natural_Field (Item (Second_Comma + 2 .. Third_Comma - 1), C3)
           or else not Parse_Float_Field (Item (Third_Comma + 2 .. Body_Last), A)
         then
            return False;
         end if;
      else
         if Find_Substring (Item (Second_Comma + 2 .. Body_Last), ", ") /= 0
           or else not Parse_Natural_Field
             (Item (Second_Comma + 2 .. Body_Last), C3)
         then
            return False;
         end if;
      end if;

      if C1 > 255 or else C2 > 255 or else C3 > 255 or else A < 0.0 or else A > 1.0 then
         return False;
      end if;

      Color := (Red => To_Channel (C1), Green => To_Channel (C2),
                Blue => To_Channel (C3));
      Opacity := A;
      return True;
   exception
      when others =>
         return False;
   end Parse_RGB_Components;

   function RGB_Label_Error
     (Text       : String;
      Prefix     : String;
      Need_Alpha : Boolean)
      return Humanize.Parsing.Color_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Body_First : Natural;
      Body_Last  : Natural;
      C1 : Natural := 0;
      C2 : Natural := 0;
      C3 : Natural := 0;
      A  : Long_Float := 1.0;
      First_Comma : Natural := 0;
      Second_Comma : Natural := 0;
      Third_Comma : Natural := 0;

      function Failure
        (Status   : Humanize.Status.Status_Code;
         Error    : Humanize.Parsing.Parse_Error_Kind;
         Position : Natural)
         return Humanize.Parsing.Color_Label_Parse_Result is
      begin
         return
           (Status => Status,
            Error_Position => Position,
            Error => Error,
            others => <>);
      end Failure;
   begin
      if Item'Length = 0 then
         return Failure
           (Humanize.Status.Invalid_Argument, Humanize.Parsing.Empty_Input, Text'First);
      end if;

      if not Starts_With (Item, Prefix & "(") then
         if Starts_With (Item, Prefix) then
            return Failure
              (Humanize.Status.Invalid_Argument,
               Humanize.Parsing.Expected_Separator,
               Item'First + Prefix'Length);
         else
            return Failure
              (Humanize.Status.Invalid_Argument,
               Humanize.Parsing.Unsupported_Form,
               Item'First);
         end if;
      elsif not Ends_With (Item, ")") then
         return Failure
           (Humanize.Status.Invalid_Argument,
            Humanize.Parsing.Expected_Separator,
            Item'Last + 1);
      end if;

      Body_First := Item'First + Prefix'Length + 1;
      Body_Last := Item'Last - 1;
      if Body_First > Body_Last then
         return Failure
           (Humanize.Status.Invalid_Argument, Humanize.Parsing.Expected_Number, Body_First);
      end if;

      First_Comma := Find_Substring (Item (Body_First .. Body_Last), ", ");
      if First_Comma = 0 then
         return Failure
           (Humanize.Status.Invalid_Argument,
            Humanize.Parsing.Expected_Separator,
            Body_First);
      end if;
      Second_Comma := Find_Substring (Item (First_Comma + 2 .. Body_Last), ", ");
      if Second_Comma = 0 then
         return Failure
           (Humanize.Status.Invalid_Argument,
            Humanize.Parsing.Expected_Separator,
            First_Comma + 2);
      end if;
      if Need_Alpha then
         Third_Comma :=
           Find_Substring (Item (Second_Comma + 2 .. Body_Last), ", ");
         if Third_Comma = 0 then
            return Failure
              (Humanize.Status.Invalid_Argument,
               Humanize.Parsing.Expected_Separator,
               Second_Comma + 2);
         end if;
      end if;

      if not Parse_Natural_Field (Item (Body_First .. First_Comma - 1), C1) then
         return Failure
           (Humanize.Status.Invalid_Argument, Humanize.Parsing.Expected_Number, Body_First);
      elsif not Parse_Natural_Field
        (Item (First_Comma + 2 .. Second_Comma - 1), C2)
      then
         return Failure
           (Humanize.Status.Invalid_Argument, Humanize.Parsing.Expected_Number, First_Comma + 2);
      end if;

      if Need_Alpha then
         if not Parse_Natural_Field
           (Item (Second_Comma + 2 .. Third_Comma - 1), C3)
         then
            return Failure
              (Humanize.Status.Invalid_Argument,
               Humanize.Parsing.Expected_Number,
               Second_Comma + 2);
         elsif not Parse_Float_Field (Item (Third_Comma + 2 .. Body_Last), A) then
            return Failure
              (Humanize.Status.Invalid_Argument,
               Humanize.Parsing.Expected_Number,
               Third_Comma + 2);
         end if;
      else
         declare
            Extra_Comma : constant Natural :=
              Find_Substring (Item (Second_Comma + 2 .. Body_Last), ", ");
         begin
            if Extra_Comma /= 0 then
               return Failure
                 (Humanize.Status.Invalid_Argument,
                  Humanize.Parsing.Unsupported_Form,
                  Extra_Comma);
            elsif not Parse_Natural_Field
              (Item (Second_Comma + 2 .. Body_Last), C3)
            then
               return Failure
                 (Humanize.Status.Invalid_Argument,
                  Humanize.Parsing.Expected_Number,
                  Second_Comma + 2);
            end if;
         end;
      end if;

      if C1 > 255 then
         return Failure
           (Humanize.Status.Invalid_Value, Humanize.Parsing.Out_Of_Range, Body_First);
      elsif C2 > 255 then
         return Failure
           (Humanize.Status.Invalid_Value, Humanize.Parsing.Out_Of_Range, First_Comma + 2);
      elsif C3 > 255 then
         return Failure
           (Humanize.Status.Invalid_Value, Humanize.Parsing.Out_Of_Range, Second_Comma + 2);
      elsif A < 0.0 or else A > 1.0 then
         return Failure
           (Humanize.Status.Invalid_Value, Humanize.Parsing.Out_Of_Range, Third_Comma + 2);
      end if;

      return Failure
        (Humanize.Status.Invalid_Argument, Humanize.Parsing.Expected_Number, Item'First);
   exception
      when others =>
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => (if Item'Length = 0 then Text'First else Item'First),
            Error => Humanize.Parsing.Expected_Number,
            others => <>);
   end RGB_Label_Error;

   function Color_Label_Result
     (Item        : String;
      Color       : Humanize.Colors.RGB_Color;
      Opacity     : Long_Float := 1.0;
      Has_Opacity : Boolean := False;
      Is_Current  : Boolean := False)
      return Humanize.Parsing.Color_Label_Parse_Result is
   begin
      return
        (Status => Humanize.Status.Ok,
         Color => Color,
         Opacity => Opacity,
         Has_Opacity => Has_Opacity,
         Is_Current => Is_Current,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => Humanize.Parsing.No_Parse_Error);
   end Color_Label_Result;

   function Parse_RGB_Label
     (Text : String)
      return Humanize.Parsing.Color_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Color : Humanize.Colors.RGB_Color;
      Opacity : Long_Float;
   begin
      if Parse_RGB_Components (Item, "rgb", False, Color, Opacity) then
         return Color_Label_Result (Item, Color);
      else
         return RGB_Label_Error (Text, "rgb", False);
      end if;
   end Parse_RGB_Label;

   function Parse_RGBA_Label
     (Text : String)
      return Humanize.Parsing.Color_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Color : Humanize.Colors.RGB_Color;
      Opacity : Long_Float;
   begin
      if Parse_RGB_Components (Item, "rgba", True, Color, Opacity) then
         return Color_Label_Result (Item, Color, Opacity, True);
      else
         return RGB_Label_Error (Text, "rgba", True);
      end if;
   end Parse_RGBA_Label;

   function Hex_Color_Label_Error
     (Item : String;
      Code : Humanize.Status.Status_Code)
      return Humanize.Parsing.Color_Label_Parse_Result
   is
   begin
      for Index in Item'First + 1 .. Item'Last loop
         if not Humanize.Bounded_Text.Is_Hex_Digit (Item (Index)) then
            return
              (Status => Humanize.Status.Invalid_Argument,
               Error_Position => Index,
               Error => Humanize.Parsing.Expected_Number,
               others => <>);
         end if;
      end loop;

      if Item'Length not in 4 | 5 | 7 | 9 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Item'Last + 1,
            Error => Humanize.Parsing.Unsupported_Form,
            others => <>);
      end if;

      return
        (Status => Code,
         Error_Position => Item'First,
         Error => Humanize.Parsing.Unsupported_Form,
         others => <>);
   end Hex_Color_Label_Error;

   function Parse_CSS_Color_Label
     (Text : String)
      return Humanize.Parsing.Color_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      CSS  : Humanize.Colors.CSS_Color;
      Code : Humanize.Status.Status_Code;
   begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Humanize.Parsing.Empty_Input,
            others => <>);
      end if;

      if Item = "currentColor" then
         return Color_Label_Result (Item, (others => 0), Is_Current => True);
      end if;

      Code := Humanize.Colors.Parse_CSS_Color (Item, CSS);
      if Code /= Humanize.Status.Ok then
         if Starts_With (Item, "#") then
            return Hex_Color_Label_Error (Item, Code);
         elsif Starts_With (Item, "rgba") then
            return RGB_Label_Error (Text, "rgba", True);
         elsif Starts_With (Item, "rgb") then
            return RGB_Label_Error (Text, "rgb", False);
         else
            return
              (Status => Code,
               Error_Position => Item'First,
               Error => Humanize.Parsing.Unsupported_Form,
               others => <>);
         end if;
      end if;

      return Color_Label_Result
        (Item, CSS.Color, CSS.Opacity, CSS.Has_Opacity, CSS.Is_Current);
   end Parse_CSS_Color_Label;

   function Parse_Color_Summary
     (Text : String)
      return Humanize.Parsing.Color_Label_Parse_Result
      is separate;

   function Parse_Model_Label
     (Text   : String;
      Prefix : String)
      return Humanize.Parsing.Color_Model_Label_Parse_Result
      is separate;

   function Parse_HSL_Label
     (Text : String)
      return Humanize.Parsing.Color_Model_Label_Parse_Result is
   begin
      return Parse_Model_Label (Text, "hsl");
   end Parse_HSL_Label;

   function Parse_HSV_Label
     (Text : String)
      return Humanize.Parsing.Color_Model_Label_Parse_Result is
   begin
      return Parse_Model_Label (Text, "hsv");
   end Parse_HSV_Label;

   function Is_Color_Bucket_Label (Item : String) return Boolean is
   begin
      return Item in "very dark" | "dark" | "medium brightness" | "light"
        | "very light" | "neutral" | "red" | "orange" | "yellow" | "green"
        | "cyan" | "blue" | "purple" | "magenta" | "desaturated" | "muted"
        | "saturated" | "vivid" | "neutral temperature" | "warm" | "cool"
        | "balanced temperature" | "grayish" | "pastel" | "soft"
        | "moderate chroma" | "high chroma" | "black" | "silver" | "gray"
        | "white" | "maroon" | "fuchsia" | "lime" | "olive" | "navy"
        | "teal" | "aqua" | "rebeccapurple" | "neutral palette"
        | "single-accent palette" | "monochrome palette" | "triadic palette"
        | "complementary palette" | "analogous palette" | "varied palette"
        | "meget mork" | "mork" | "middel lysstyrke" | "meget lys"
        | "rod" | "gul" | "gron" | "bla" | "lilla" | "desatureret"
        | "dampet" | "mattet" | "kraftig" | "neutral temperatur"
        | "varm" | "kolig" | "balanceret temperatur" | "gralig"
        | "blod" | "moderat chroma" | "hoj chroma"
        | "sehr dunkel" | "dunkel" | "mittlere helligkeit" | "hell"
        | "sehr hell" | "rot" | "gelb" | "gruen" | "blau" | "violett"
        | "entsaettigt" | "gedaempft" | "gesaettigt" | "kraeftig"
        | "neutrale temperatur" | "kuehl" | "ausgeglichene temperatur"
        | "graeulich" | "pastell" | "weich" | "mittleres chroma"
        | "hohes chroma"
        | "tres sombre" | "sombre" | "luminosite moyenne" | "clair"
        | "tres clair" | "neutre" | "rouge" | "jaune" | "vert"
        | "violet" | "desature" | "attenue" | "sature" | "vif"
        | "temperature neutre" | "chaud" | "froid"
        | "temperature equilibree" | "grisatre" | "doux"
        | "chroma modere" | "chroma eleve"
        | "muy oscuro" | "oscuro" | "brillo medio" | "claro"
        | "muy claro" | "rojo" | "naranja" | "amarillo" | "verde"
        | "cian" | "azul" | "purpura" | "desaturado" | "apagado"
        | "saturado" | "vivo" | "temperatura neutral" | "calido"
        | "frio" | "temperatura equilibrada" | "grisaceo" | "suave"
        | "croma moderado" | "croma alto"
        | "molto scuro" | "scuro" | "luminosita media" | "chiaro"
        | "molto chiaro" | "neutro" | "rosso" | "arancione"
        | "giallo" | "ciano" | "blu" | "viola" | "smorzato"
        | "saturo" | "vivido" | "temperatura neutra" | "caldo"
        | "freddo" | "temperatura bilanciata" | "grigiastro"
        | "pastello" | "morbido"
        | "muito escuro" | "escuro" | "brilho medio" | "muito claro"
        | "vermelho" | "amarelo" | "dessaturado" | "legivel"
        | "quente" | "temperatura equilibrada" | "acinzentado" | "macio"
        | "zeer donker" | "donker" | "gemiddelde helderheid"
        | "licht" | "zeer licht" | "neutraal" | "rood" | "oranje"
        | "geel" | "groen" | "cyaan" | "blauw" | "paars"
        | "onverzadigd" | "gedempt" | "verzadigd" | "levendig"
        | "neutrale temperatuur" | "koel" | "gebalanceerde temperatuur"
        | "grijzig" | "zacht" | "matige chroma" | "hoge chroma";
   end Is_Color_Bucket_Label;

   function Parse_Color_Bucket_Label
     (Text : String)
      return Humanize.Parsing.Color_Bucket_Label_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Label_Buffer : String (1 .. 48);
      Label_Length : Natural;
   begin
      if not Is_Color_Bucket_Label (Item) then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => (if Item'Length = 0 then Text'First else Item'First),
                 Error => Humanize.Parsing.Unsupported_Form,
                 others => <>);
      end if;

      Store (Item, Label_Buffer, Label_Length);
      return
        (Status => Humanize.Status.Ok,
         Label => Label_Buffer,
         Label_Length => Label_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => Humanize.Parsing.No_Parse_Error);
   end Parse_Color_Bucket_Label;

   function Parse_Color_Description
     (Text : String)
      return Humanize.Parsing.Color_Description_Parse_Result
      is separate;

   function Parse_Opacity_Label
     (Text : String)
      return Humanize.Parsing.Color_Difference_Label_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Percent : Long_Float;
      Label_Buffer : String (1 .. 48);
      Label_Length : Natural;
      Space : constant Natural := Find_Substring (Item, " ");
   begin
      if Space = 0
        or else not Parse_Percent_Field (Item (Item'First .. Space - 1), Percent)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Humanize.Parsing.Expected_Number,
                 others => <>);
      end if;

      Store (Item (Space + 1 .. Item'Last), Label_Buffer, Label_Length);
      return
        (Status => Humanize.Status.Ok,
         Value => Percent,
         Label => Label_Buffer,
         Label_Length => Label_Length,
         Perceptual => False,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => Humanize.Parsing.No_Parse_Error);
   end Parse_Opacity_Label;

   function Parse_Palette_Summary
     (Text : String)
      return Humanize.Parsing.Palette_Summary_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Colors_Mark : constant String := " colors, mostly ";
      A : constant Natural := Find_Substring (Item, Colors_Mark);
      B : Natural;
      Count : Natural;
      Dominant_Buffer : String (1 .. 32);
      Spread_Buffer : String (1 .. 48);
      Dominant_Length : Natural;
      Spread_Length : Natural;
   begin
      if A = 0
        or else not Parse_Natural_Field (Item (Item'First .. A - 1), Count)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Humanize.Parsing.Expected_Number,
                 others => <>);
      end if;
      B := Find_Substring (Item (A + Colors_Mark'Length .. Item'Last), ", ");
      if B = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Humanize.Parsing.Expected_Separator,
                 others => <>);
      end if;
      Store (Item (A + Colors_Mark'Length .. B - 1),
             Dominant_Buffer, Dominant_Length);
      Store (Item (B + 2 .. Item'Last), Spread_Buffer, Spread_Length);
      return
        (Status => Humanize.Status.Ok,
         Count => Count,
         Dominant_Color => Dominant_Buffer,
         Dominant_Color_Length => Dominant_Length,
         Spread => Spread_Buffer,
         Spread_Length => Spread_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => Humanize.Parsing.No_Parse_Error);
   end Parse_Palette_Summary;

   function Parse_Palette_Roles
     (Text : String)
      return Humanize.Parsing.Palette_Roles_Parse_Result
   is
      Item : constant String := Trim (Text);
      Text_Mark : constant String := ", text ";
      Accent_Mark : constant String := ", accent ";
      Prefix : constant String := "background ";
      A : constant Natural := Find_Substring (Item, Text_Mark);
      B : constant Natural := Find_Substring (Item, Accent_Mark);
      Background : Humanize.Colors.RGB_Color;
      Text_Color : Humanize.Colors.RGB_Color;
      Accent : Humanize.Colors.RGB_Color;
   begin
      if not Starts_With (Item, Prefix) or else A = 0 or else B = 0 or else A > B
        or else Humanize.Colors.Parse_Hex_Color
          (Item (Item'First + Prefix'Length .. A - 1), Background) /= Humanize.Status.Ok
        or else Humanize.Colors.Parse_Hex_Color
          (Item (A + Text_Mark'Length .. B - 1), Text_Color) /= Humanize.Status.Ok
        or else Humanize.Colors.Parse_Hex_Color
          (Item (B + Accent_Mark'Length .. Item'Last), Accent) /= Humanize.Status.Ok
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Humanize.Parsing.Unsupported_Form,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Background => Background,
         Text_Color => Text_Color,
         Accent => Accent,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => Humanize.Parsing.No_Parse_Error);
   end Parse_Palette_Roles;

   function Parse_Palette_Harmony_Label
     (Text : String)
      return Humanize.Parsing.Color_Bucket_Label_Parse_Result is
   begin
      return Parse_Color_Bucket_Label (Text);
   end Parse_Palette_Harmony_Label;

   function Parse_Palette_Contrast_Suggestion
     (Text : String)
      return Humanize.Parsing.Palette_Contrast_Suggestion_Parse_Result
   is
      Item : constant String := Trim (Text);
      Prefix : constant String := "best contrast ";
      On_Mark : constant String := " on ";
      At_Mark : constant String := " at ";
      Ratio_Mark : constant String := ":1";
      A : constant Natural := Find_Substring (Item, On_Mark);
      B : constant Natural := Find_Substring (Item, At_Mark);
      Foreground : Humanize.Colors.RGB_Color;
      Background : Humanize.Colors.RGB_Color;
      Ratio : Long_Float;
   begin
      if not Starts_With (Item, Prefix) or else A = 0 or else B = 0 or else A > B
        or else not Ends_With (Item, Ratio_Mark)
        or else Humanize.Colors.Parse_Hex_Color
          (Item (Item'First + Prefix'Length .. A - 1), Foreground) /= Humanize.Status.Ok
        or else Humanize.Colors.Parse_Hex_Color
          (Item (A + On_Mark'Length .. B - 1), Background) /= Humanize.Status.Ok
        or else not Parse_Float_Field
          (Item (B + At_Mark'Length .. Item'Last - Ratio_Mark'Length), Ratio)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Humanize.Parsing.Expected_Number,
                 others => <>);
      end if;
      return
        (Status => Humanize.Status.Ok,
         Foreground => Foreground,
         Background => Background,
         Ratio => Ratio,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => Humanize.Parsing.No_Parse_Error);
   end Parse_Palette_Contrast_Suggestion;

   function Parse_Palette_Accessibility_Label
     (Text : String)
      return Humanize.Parsing.Palette_Accessibility_Label_Parse_Result
      is separate;

   function Parse_Palette_Mood_Label
     (Text : String)
      return Humanize.Parsing.Palette_Mood_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      First_Comma : constant Natural := Find_Substring (Item, ", ");
      Second_Comma : Natural;
      Mood_Mark : constant String := " mood";
      Tone_Buffer : String (1 .. 32);
      Energy_Buffer : String (1 .. 32);
      Temperature_Buffer : String (1 .. 32);
      Tone_Length : Natural;
      Energy_Length : Natural;
      Temperature_Length : Natural;
   begin
      if First_Comma = 0 or else not Ends_With (Item, Mood_Mark) then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Humanize.Parsing.Expected_Separator,
                 others => <>);
      end if;
      Second_Comma := Find_Substring (Item (First_Comma + 2 .. Item'Last), ", ");
      if Second_Comma = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Humanize.Parsing.Expected_Separator,
                 others => <>);
      end if;
      Store (Item (Item'First .. First_Comma - 1), Tone_Buffer, Tone_Length);
      Store (Item (First_Comma + 2 .. Second_Comma - 1), Energy_Buffer, Energy_Length);
      Store (Item (Second_Comma + 2 .. Item'Last - Mood_Mark'Length),
             Temperature_Buffer, Temperature_Length);
      return
        (Status => Humanize.Status.Ok,
         Tone => Tone_Buffer,
         Tone_Length => Tone_Length,
         Energy => Energy_Buffer,
         Energy_Length => Energy_Length,
         Temperature => Temperature_Buffer,
         Temperature_Length => Temperature_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => Humanize.Parsing.No_Parse_Error);
   end Parse_Palette_Mood_Label;

   function Parse_Advanced_Palette_Summary
     (Text : String)
      return Humanize.Parsing.Palette_Mood_Parse_Result
   is
      Item : constant String := Trim (Text);
      First_Comma : constant Natural := Find_Substring (Item, ", ");
      Mood_At : constant Natural := Find_Substring (Item, " mood");
   begin
      if First_Comma = 0 or else Mood_At = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Humanize.Parsing.Expected_Separator,
                 others => <>);
      end if;
      return Parse_Palette_Mood_Label (Item (First_Comma + 2 .. Mood_At + 4));
   end Parse_Advanced_Palette_Summary;

   function Parse_Color_Difference_Label
     (Text : String)
      return Humanize.Parsing.Color_Difference_Label_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Percent : Long_Float;
      Label_Buffer : String (1 .. 48);
      Label_Length : Natural;
      Space : constant Natural := Find_Substring (Item, " ");
   begin
      if Space = 0
        or else not Parse_Percent_Field (Item (Item'First .. Space - 1), Percent)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Humanize.Parsing.Expected_Number,
                 others => <>);
      end if;
      Store (Item (Space + 1 .. Item'Last), Label_Buffer, Label_Length);
      return
        (Status => Humanize.Status.Ok,
         Value => Percent,
         Label => Label_Buffer,
         Label_Length => Label_Length,
         Perceptual => False,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => Humanize.Parsing.No_Parse_Error);
   end Parse_Color_Difference_Label;

   function Parse_Perceptual_Difference_Label
     (Text : String)
      return Humanize.Parsing.Color_Difference_Label_Parse_Result
      is separate;
end Humanize.Parsing.Implementation.Color_Text_Helpers;
