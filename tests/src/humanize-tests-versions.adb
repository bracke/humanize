with AUnit.Assertions;

with Humanize.Domain_Details;
with Humanize.Status;
with Humanize.Tests.Support;
with Humanize.Versions;

package body Humanize.Tests.Versions is
   use Humanize.Status;
   use Humanize.Versions;
   use type Humanize.Domain_Details.Domain_Surface;

   procedure Check
     (Result   : Text_Result;
      Expected : String;
      Message  : String)
   is
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Test_Parse_And_Label (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Info : constant Version_Info := Parse_Semver ("v1.2.3-beta.1+build.7");
      Invalid : constant Text_Result := Version_Label ("not a version");
   begin
      AUnit.Assertions.Assert
        (Info.Valid
         and then Info.Major = 1
         and then Info.Minor = 2
         and then Info.Patch = 3
         and then Info.Has_Minor
         and then Info.Has_Patch
         and then Info.Prerelease (1 .. Info.Prerelease_Length) = "beta.1"
         and then Info.Build (1 .. Info.Build_Length) = "build.7",
         "parse semver metadata");

      Check
        (Version_Label ("v1.2.3-beta.1+build.7"),
         "version 1.2.3-beta.1+build.7 prerelease beta.1 build build.7",
         "version label");
      Check (Version_Label ("2.0"), "version 2.0", "partial version label");
      Check
        (Version_Label
           ("2.0",
            (Mode             => Version_Detailed,
             Include_Surface  => True,
             Include_Severity => True,
             Include_Tone     => False)),
         "[versions info] version 2.0",
         "version label with metadata");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Value,
         "invalid version label");
   end Test_Parse_And_Label;

   procedure Test_Deltas (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Parsed : Version_Label_Parse_Result;
   begin
      AUnit.Assertions.Assert
        (Version_Delta ("1.2.3", "2.0.0") = Major_Upgrade
         and then Version_Delta ("1.2.3", "1.3.0") = Minor_Upgrade
         and then Version_Delta ("1.2.3", "1.2.4") = Patch_Upgrade
         and then Version_Delta ("1.2.3", "1.2.3") = Same_Version
         and then Version_Delta ("1.2.3", "1.2.2") = Downgrade
         and then Version_Delta ("1.2.3-alpha", "1.2.3-beta") = Prerelease_Change
         and then Version_Delta ("1.2.3+1", "1.2.3+2") = Build_Metadata_Change
         and then Version_Delta ("x", "1.0.0") = Unknown_Delta,
         "version delta classification");

      Check
        (Version_Delta_Label ("1.2.3", "1.3.0"),
         "minor upgrade: 1.2.3 -> 1.3.0", "minor delta label");
      Check
        (Version_Delta_Label ("2.0.0", "1.9.0"),
         "downgrade: 2.0.0 -> 1.9.0", "downgrade label");
      Check
        (Version_Delta_Label
           ("1.2.3", "2.0.0",
            (Mode             => Version_Detailed,
             Include_Surface  => True,
             Include_Severity => True,
             Include_Tone     => False)),
         "[versions warning] major upgrade: 1.2.3 -> 2.0.0",
         "delta label with metadata");

      Parsed := Parse_Version_Delta_Label ("library major upgrade", Major_Upgrade);
      AUnit.Assertions.Assert
        (Parsed.Status = Ok
         and then Parsed.Consumed = 21
         and then Parsed.Name_Length = 7
         and then Parsed.Metadata.Surface = Humanize.Domain_Details.Versions_Surface,
         "parse version delta label");

      Parsed := Scan_Version_Delta_Label
        ("library patch upgrade ready", Patch_Upgrade);
      AUnit.Assertions.Assert
        (Parsed.Status = Ok
         and then Parsed.Consumed = 21
         and then Parsed.State_Length = 13,
         "scan version delta label");
   end Test_Deltas;

   procedure Test_Ranges_Releases_And_Commits
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : constant Text_Result := Compatibility_Range_Label ("anything");
      Parsed  : Version_Label_Parse_Result;
   begin
      AUnit.Assertions.Assert
        (Compatibility_Range_Kind_Of ("1.2.3") = Exact_Range
         and then Compatibility_Range_Kind_Of (">=1.4") = Minimum_Range
         and then Compatibility_Range_Kind_Of ("<=2.0") = Maximum_Range
         and then Compatibility_Range_Kind_Of ("^1.2") = Major_Compatible_Range
         and then Compatibility_Range_Kind_Of ("~>1.2") = Minor_Compatible_Range
         and then Compatibility_Range_Kind_Of (">=1.4,<2") = Between_Range,
         "range kind classification");

      Check (Compatibility_Range_Label ("1.2.3"), "exactly version 1.2.3", "exact range");
      Check (Compatibility_Range_Label (">=1.4"), "version 1.4 or newer", "minimum range");
      Check (Compatibility_Range_Label ("<=2.0"), "version 2.0 or older", "maximum range");
      Check
        (Compatibility_Range_Label ("^1.2"),
         "compatible with major version 1.2", "major compatible range");
      Check
        (Compatibility_Range_Label ("~>1.2"),
         "compatible with minor version 1.2", "minor compatible range");
      Check (Compatibility_Range_Label (">=1.4,<2"), "version range >=1.4,<2", "between range");
      Check
        (Compatibility_Range_Label
           ("^1.2",
            (Mode             => Version_Detailed,
             Include_Surface  => True,
             Include_Severity => True,
             Include_Tone     => False)),
         "[versions warning] compatible with major version 1.2",
         "compatibility range with metadata");
      Parsed := Parse_Compatibility_Range_Label
        ("sdk major compatible range", Major_Compatible_Range);
      AUnit.Assertions.Assert
        (Parsed.Status = Ok
         and then Parsed.Consumed = 26
         and then Parsed.Name_Length = 3,
         "parse compatibility range label");

      Parsed := Scan_Compatibility_Range_Label
        ("sdk bounded version range selected", Between_Range);
      AUnit.Assertions.Assert
        (Parsed.Status = Ok
         and then Parsed.Consumed = 25
         and then Parsed.State_Length = 21,
         "scan compatibility range label");
      AUnit.Assertions.Assert (Invalid.Status = Invalid_Value, "invalid range");

      Check (Release_Label ("0.9.0"), "initial development release 0.9.0", "zero major release");
      Check (Release_Label ("2.0.0"), "major release 2.0.0", "major release");
      Check (Release_Label ("2.1.0"), "minor release 2.1.0", "minor release");
      Check
        (Release_Label
           ("2.0.0",
            (Mode             => Version_Detailed,
             Include_Surface  => True,
             Include_Severity => True,
             Include_Tone     => False)),
         "[versions warning] major release 2.0.0",
         "release label with metadata");
      Check (Release_Label ("2.1.3"), "patch release 2.1.3", "patch release");
      Check (Release_Label ("2.1.0-rc.1"), "prerelease 2.1.0-rc.1", "prerelease");

      Check (Commit_Distance_Label (0, 0), "up to date", "commit up to date");
      Check (Commit_Distance_Label (1, 0), "1 commit ahead", "one ahead");
      Check
        (Commit_Distance_Label
           (0, 3,
            (Mode             => Version_Detailed,
             Include_Surface  => True,
             Include_Severity => True,
             Include_Tone     => False)),
         "[versions info] 3 commits behind",
         "commit distance with metadata");
      Check (Commit_Distance_Label (0, 3), "3 commits behind", "behind");
      Check
        (Commit_Distance_Label (2, 3),
         "2 commits ahead, 3 commits behind", "diverged");
   end Test_Ranges_Releases_And_Commits;

   procedure Test_Bounded (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Buffer : String (1 .. 13);
      Tiny   : String (1 .. 8);
      Tagged_Text : String (1 .. 15);
      Offset : String (2 .. 16);
      Written : Natural;
      Code : Status_Code;
   begin
      Version_Label_Into ("1.2.3", Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 13 and then Buffer = "version 1.2.3",
         "version bounded exact");

      Version_Delta_Label_Into ("1.2.3", "1.3.0", Tiny, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 8 and then Tiny = "minor up",
         "delta bounded overflow");

      Version_Delta_Label_Into
        ("1.2.3", "2.0.0", Tagged_Text, Written, Code,
         (Mode             => Version_Detailed,
          Include_Surface  => True,
          Include_Severity => True,
          Include_Tone     => False));
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow
         and then Written = 15
         and then Tagged_Text = "[versions warni",
         "delta options bounded overflow");

      Commit_Distance_Label_Into (1, 1, Offset, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "commit distance bounded rejects non-1-based buffer");
   end Test_Bounded;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize version tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Parse_And_Label'Access, "version parse and labels");
      Register_Routine (T, Test_Deltas'Access, "version delta labels");
      Register_Routine
        (T, Test_Ranges_Releases_And_Commits'Access,
         "range release and commit labels");
      Register_Routine (T, Test_Bounded'Access, "bounded version labels");
   end Register_Tests;

end Humanize.Tests.Versions;
