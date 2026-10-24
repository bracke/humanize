with AUnit.Test_Cases;

--  Every localized domain label (Humanize.<Family>.Localized) in every shipped
--  locale; generated with the packages from the same list.
package Humanize.Tests.Domain_Labels is
   type Test_Case is new AUnit.Test_Cases.Test_Case with null record;

   overriding function Name (T : Test_Case) return AUnit.Message_String;
   overriding procedure Register_Tests (T : in out Test_Case);
end Humanize.Tests.Domain_Labels;
