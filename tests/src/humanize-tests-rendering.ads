with AUnit;
with AUnit.Test_Cases;

--  i18n integration: real English/Danish rendering and i18n -> Humanize status
--  mapping. Lives under Humanize.Tests so it may import the private children
--  Humanize.I18N_Rendering and Humanize.Selections.
package Humanize.Tests.Rendering is

   type Test_Case is new AUnit.Test_Cases.Test_Case with null record;

   overriding function Name
     (T : Test_Case)
      return AUnit.Message_String;

   overriding procedure Register_Tests
     (T : in out Test_Case);

end Humanize.Tests.Rendering;
