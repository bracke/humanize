with Humanize.Tests.Datetimes;
with Humanize.Tests.Durations;
with Humanize.Tests.Bytes;
with Humanize.Tests.Numbers;
with Humanize.Tests.Rendering;
with Humanize.Tests.Bounded;
with Humanize.Tests.Architecture;

package body Humanize.Tests.Suite is

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
      Result : constant AUnit.Test_Suites.Access_Test_Suite :=
        new AUnit.Test_Suites.Test_Suite;
   begin
      Result.Add_Test (new Humanize.Tests.Datetimes.Test_Case);
      Result.Add_Test (new Humanize.Tests.Durations.Test_Case);
      Result.Add_Test (new Humanize.Tests.Bytes.Test_Case);
      Result.Add_Test (new Humanize.Tests.Numbers.Test_Case);
      Result.Add_Test (new Humanize.Tests.Rendering.Test_Case);
      Result.Add_Test (new Humanize.Tests.Bounded.Test_Case);
      Result.Add_Test (new Humanize.Tests.Architecture.Test_Case);
      return Result;
   end Suite;

end Humanize.Tests.Suite;
