with Humanize.Tests.Datetimes;
with Humanize.Tests.Durations;
with Humanize.Tests.Bytes;
with Humanize.Tests.Colors;
with Humanize.Tests.Numbers;
with Humanize.Tests.Units;
with Humanize.Tests.Rendering;
with Humanize.Tests.Bounded;
with Humanize.Tests.Architecture;
with Humanize.Tests.Strings;
with Humanize.Tests.Parsing;
with Humanize.Tests.Compatibility;

package body Humanize.Tests.Suite is

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
      Result : constant AUnit.Test_Suites.Access_Test_Suite :=
        new AUnit.Test_Suites.Test_Suite;
   begin
      pragma Warnings (Off, "use of an anonymous access type allocator");
      Result.Add_Test (new Humanize.Tests.Datetimes.Test_Case);
      Result.Add_Test (new Humanize.Tests.Durations.Test_Case);
      Result.Add_Test (new Humanize.Tests.Bytes.Test_Case);
      Result.Add_Test (new Humanize.Tests.Colors.Test_Case);
      Result.Add_Test (new Humanize.Tests.Numbers.Test_Case);
      Result.Add_Test (new Humanize.Tests.Units.Test_Case);
      Result.Add_Test (new Humanize.Tests.Rendering.Test_Case);
      Result.Add_Test (new Humanize.Tests.Bounded.Test_Case);
      Result.Add_Test (new Humanize.Tests.Architecture.Test_Case);
      Result.Add_Test (new Humanize.Tests.Strings.Test_Case);
      Result.Add_Test (new Humanize.Tests.Parsing.Test_Case);
      Result.Add_Test (new Humanize.Tests.Compatibility.Test_Case);
      pragma Warnings (On, "use of an anonymous access type allocator");
      return Result;
   end Suite;

end Humanize.Tests.Suite;
