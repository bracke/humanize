separate (Humanize.Colors.Support.Backend)
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
