separate (Humanize.Colors.Support.Backend)
function Palette_Mood_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result
   is
      Avg_Brightness : Long_Float := 0.0;
      Avg_Saturation : Long_Float := 0.0;
      Warm_Count     : Natural := 0;
      Cool_Count     : Natural := 0;
      H              : HSL_Color;
      Tone           : Unbounded_String;
      Energy         : Unbounded_String;
      Temperature    : Unbounded_String;
begin
      if Colors'Length = 0 then
         return Invalid_Text;
      end if;

      for Color of Colors loop
         H := HSL (Color);
         Avg_Brightness := Avg_Brightness + Brightness (Color);
         Avg_Saturation := Avg_Saturation + H.Saturation;
         if H.Saturation >= 0.08 then
            if H.Hue < 80.0 or else H.Hue >= 300.0 then
               Warm_Count := Warm_Count + 1;
            elsif H.Hue >= 150.0 and then H.Hue < 285.0 then
               Cool_Count := Cool_Count + 1;
            end if;
         end if;
      end loop;

      Avg_Brightness := Avg_Brightness / Long_Float (Colors'Length);
      Avg_Saturation := Avg_Saturation / Long_Float (Colors'Length);
      Tone := To_Unbounded_String
        (if Avg_Brightness < 0.35 then "dark"
         elsif Avg_Brightness > 0.70 then "light"
         else "balanced");
      Energy := To_Unbounded_String
        (if Avg_Saturation < 0.20 then "subtle"
         elsif Avg_Saturation > 0.65 then "vibrant"
         else "moderate");
      Temperature := To_Unbounded_String
        (if Warm_Count > Cool_Count then "warm"
         elsif Cool_Count > Warm_Count then "cool"
         else "neutral");

      return Ok_Text
        (To_String (Tone) & ", " & To_String (Energy) & ", "
         & To_String (Temperature) & " mood");
end Palette_Mood_Label;
