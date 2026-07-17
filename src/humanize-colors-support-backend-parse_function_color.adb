separate (Humanize.Colors.Support.Backend)
function Parse_Function_Color
     (Text  : String;
      Color : out CSS_Color)
      return Boolean
   is
      Item        : constant String := Lower (Trim (Text));
      Open_Index  : Natural := 0;
      Tokens      : Token_List;
      Count       : Natural;
      Red         : Color_Channel;
      Green       : Color_Channel;
      Blue        : Color_Channel;
      Hue         : Long_Float;
      Saturation  : Long_Float;
      Lightness   : Long_Float;
      Whiteness   : Long_Float;
      Blackness   : Long_Float;
      Chroma      : Long_Float;
      A_Component : Long_Float;
      B_Component : Long_Float;
      C1          : Long_Float;
      C2          : Long_Float;
      C3          : Long_Float;
      Alpha       : Long_Float := 1.0;
      Modern      : Boolean := False;
      Has_Slash   : Boolean := False;
      Has_Comma   : Boolean := False;
begin
      Color := (others => <>);
      for Index in Item'Range loop
         if Item (Index) = '(' then
            Open_Index := Index;
            exit;
         end if;
      end loop;

      if Open_Index = 0 or else not Ends_With (Item, ")") then
         return False;
      end if;

      declare
         Name : constant String := Item (Item'First .. Open_Index - 1);
         Args : constant String := Item (Open_Index + 1 .. Item'Last - 1);
      begin
         for Ch of Args loop
            if Ch = ',' then
               Has_Comma := True;
               exit;
            end if;
         end loop;
         Modern := not Has_Comma;

         if Modern then
            if not Parse_Modern_Component_List
              (Args, Tokens, Count, Has_Slash)
            then
               return False;
            end if;
         elsif not Parse_Component_List (Args, Tokens, Count) then
            return False;
         end if;

         if Name = "color" then
            if Count /= 4
              and then not (Modern and then Has_Slash and then Count = 5)
            then
               return False;
            elsif not Parse_Percent_Or_Number (To_String (Tokens (2)), 1.0, C1)
              or else not Parse_Percent_Or_Number
                (To_String (Tokens (3)), 1.0, C2)
              or else not Parse_Percent_Or_Number
                (To_String (Tokens (4)), 1.0, C3)
            then
               return False;
            end if;
            if Count = 5
              and then not Parse_Alpha (To_String (Tokens (5)), Alpha)
            then
               return False;
            end if;
            declare
               Profile : constant String := To_String (Tokens (1));
            begin
               if Profile = "srgb" then
                  Color :=
                    (Color       =>
                       (Red   => Channel_From_Float (Clamp01 (C1) * 255.0),
                        Green => Channel_From_Float (Clamp01 (C2) * 255.0),
                        Blue  => Channel_From_Float (Clamp01 (C3) * 255.0)),
                     Opacity     => Alpha,
                     Has_Opacity => Count = 5,
                     Is_Current  => False);
               elsif Profile = "srgb-linear" then
                  Color :=
                    (Color       =>
                       (Red   => Channel_From_Linear (C1),
                        Green => Channel_From_Linear (C2),
                        Blue  => Channel_From_Linear (C3)),
                     Opacity     => Alpha,
                     Has_Opacity => Count = 5,
                     Is_Current  => False);
               elsif Profile = "display-p3" then
                  Color :=
                    (Color       => Display_P3_To_RGB (C1, C2, C3),
                     Opacity     => Alpha,
                     Has_Opacity => Count = 5,
                     Is_Current  => False);
               elsif Profile = "rec2020" then
                  Color :=
                    (Color       => Rec2020_To_RGB (C1, C2, C3),
                     Opacity     => Alpha,
                     Has_Opacity => Count = 5,
                     Is_Current  => False);
               elsif Profile = "xyz" or else Profile = "xyz-d65" then
                  Color :=
                    (Color       => XYZ_D65_To_RGB (C1, C2, C3),
                     Opacity     => Alpha,
                     Has_Opacity => Count = 5,
                     Is_Current  => False);
               elsif Profile = "xyz-d50" then
                  Color :=
                    (Color       => XYZ_D50_To_RGB (C1, C2, C3),
                     Opacity     => Alpha,
                     Has_Opacity => Count = 5,
                     Is_Current  => False);
               else
                  return False;
               end if;
            end;
            return True;
         elsif Name = "rgb" or else Name = "rgba" then
            if Count /= (if Name = "rgb" then 3 else 4)
              and then not (Name = "rgb" and then Modern and then Has_Slash
                            and then Count = 4)
            then
               return False;
            elsif Modern and then Count = 4 and then not Has_Slash then
               return False;
            elsif not Parse_RGB_Channel (To_String (Tokens (1)), Red)
              or else not Parse_RGB_Channel (To_String (Tokens (2)), Green)
              or else not Parse_RGB_Channel (To_String (Tokens (3)), Blue)
            then
               return False;
            end if;
            if (Name = "rgba" or else Count = 4)
              and then not Parse_Alpha (To_String (Tokens (4)), Alpha)
            then
               return False;
            end if;
            Color :=
              (Color       => (Red => Red, Green => Green, Blue => Blue),
               Opacity     => Alpha,
               Has_Opacity => Name = "rgba" or else Count = 4,
               Is_Current  => False);
            return True;
         elsif Name = "hsl" or else Name = "hsla" then
            if Count /= (if Name = "hsl" then 3 else 4)
              and then not (Name = "hsl" and then Modern and then Has_Slash
                            and then Count = 4)
            then
               return False;
            elsif Modern and then Count = 4 and then not Has_Slash then
               return False;
            elsif not Parse_Hue (To_String (Tokens (1)), Hue)
              or else not Parse_Percent_Unit
                (To_String (Tokens (2)), Saturation)
              or else not Parse_Percent_Unit
                (To_String (Tokens (3)), Lightness)
            then
               return False;
            end if;
            if (Name = "hsla" or else Count = 4)
              and then not Parse_Alpha (To_String (Tokens (4)), Alpha)
            then
               return False;
            end if;
            Color :=
              (Color       => HSL_To_RGB (Hue, Saturation, Lightness),
               Opacity     => Alpha,
               Has_Opacity => Name = "hsla" or else Count = 4,
               Is_Current  => False);
            return True;
         elsif Name = "hwb" then
            if Count /= 3
              and then not (Modern and then Has_Slash and then Count = 4)
            then
               return False;
            elsif not Parse_Hue (To_String (Tokens (1)), Hue)
              or else not Parse_Percent_Unit
                (To_String (Tokens (2)), Whiteness)
              or else not Parse_Percent_Unit
                (To_String (Tokens (3)), Blackness)
            then
               return False;
            end if;
            if Count = 4
              and then not Parse_Alpha (To_String (Tokens (4)), Alpha)
            then
               return False;
            end if;
            Color :=
              (Color       => HWB_To_RGB (Hue, Whiteness, Blackness),
               Opacity     => Alpha,
               Has_Opacity => Count = 4,
               Is_Current  => False);
            return True;
         elsif Name = "lab" or else Name = "oklab" then
            if Count /= 3
              and then not (Modern and then Has_Slash and then Count = 4)
            then
               return False;
            elsif not Parse_Percent_Or_Number
                (To_String (Tokens (1)), (if Name = "lab" then 100.0 else 1.0),
                 Lightness)
              or else not Parse_Percent_Or_Number
                (To_String (Tokens (2)), (if Name = "lab" then 125.0 else 0.4),
                 A_Component)
              or else not Parse_Percent_Or_Number
                (To_String (Tokens (3)), (if Name = "lab" then 125.0 else 0.4),
                 B_Component)
            then
               return False;
            end if;
            if Count = 4
              and then not Parse_Alpha (To_String (Tokens (4)), Alpha)
            then
               return False;
            end if;
            Color :=
              (Color       =>
                 (if Name = "lab"
                  then Lab_To_RGB (Lightness, A_Component, B_Component)
                  else OKLab_To_RGB (Lightness, A_Component, B_Component)),
               Opacity     => Alpha,
               Has_Opacity => Count = 4,
               Is_Current  => False);
            return True;
         elsif Name = "lch" or else Name = "oklch" then
            if Count /= 3
              and then not (Modern and then Has_Slash and then Count = 4)
            then
               return False;
            elsif not Parse_Percent_Or_Number
                (To_String (Tokens (1)), (if Name = "lch" then 100.0 else 1.0),
                 Lightness)
              or else not Parse_Percent_Or_Number
                (To_String (Tokens (2)), (if Name = "lch" then 150.0 else 0.4),
                 Chroma)
              or else not Parse_Hue (To_String (Tokens (3)), Hue)
            then
               return False;
            end if;
            if Count = 4
              and then not Parse_Alpha (To_String (Tokens (4)), Alpha)
            then
               return False;
            end if;
            Color :=
              (Color       =>
                 (if Name = "lch"
                  then LCH_To_RGB (Lightness, Chroma, Hue)
                  else OKLCH_To_RGB (Lightness, Chroma, Hue)),
               Opacity     => Alpha,
               Has_Opacity => Count = 4,
               Is_Current  => False);
            return True;
         end if;
      end;

      return False;
end Parse_Function_Color;
