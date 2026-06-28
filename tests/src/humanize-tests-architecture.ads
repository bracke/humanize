with AUnit;
with AUnit.Test_Cases;

--  Invariant / boundary checks (HUM-INV-002, 004, 005).
package Humanize.Tests.Architecture is

   type Test_Case is new AUnit.Test_Cases.Test_Case with null record;

   overriding function Name
     (T : Test_Case)
      return AUnit.Message_String;

   overriding procedure Register_Tests
     (T : in out Test_Case);

end Humanize.Tests.Architecture;
