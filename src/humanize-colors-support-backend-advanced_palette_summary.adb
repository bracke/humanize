separate (Humanize.Colors.Support.Backend)
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
