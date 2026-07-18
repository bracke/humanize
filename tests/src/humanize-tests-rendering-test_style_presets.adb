separate (Humanize.Tests.Rendering)
   procedure Test_Style_Presets (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      procedure Check_Core_Style_Presets is separate;
      procedure Check_Phrase_Style_Presets is separate;
      procedure Check_Style_Override_Presets is separate;
   begin
      Check_Core_Style_Presets;
      Check_Phrase_Style_Presets;
      Check_Style_Override_Presets;
   end Test_Style_Presets;
