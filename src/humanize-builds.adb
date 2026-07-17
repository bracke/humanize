with Humanize.Bounded_Text;

package body Humanize.Builds is
   use type Humanize.Status.Status_Code;
   function Image (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;
   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;
   function Count_Or_No_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
      renames Humanize.Bounded_Text.Count_Or_No_Text;
   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;
   function Test_Text (State : Test_State) return String is
   begin
      case State is
         when Passed_Test => return "passed";
         when Failed_Test => return "failed";
         when Skipped_Test => return "skipped";
         when Flaky_Test => return "flaky";
         when Expected_Failure_Test => return "expected failure";
      end case;
   end Test_Text;
   function Build_Text (State : Build_State) return String is
   begin
      case State is
         when Build_Queued => return "build queued";
         when Build_Running => return "build running";
         when Build_Passed => return "build passed";
         when Build_Failed => return "build failed";
         when Snapshot_Build => return "snapshot build";
         when Release_Build => return "release build";
      end case;
   end Build_Text;
   function Artifact_Text (State : Artifact_State) return String is
   begin
      case State is
         when Artifact_Uploaded => return "artifact uploaded";
         when Artifact_Missing => return "artifact missing";
         when Artifact_Expired => return "artifact expired";
         when Artifact_Verified => return "artifact verified";
      end case;
   end Artifact_Text;
   function Gate_Text (State : Gate_State) return String is
   begin
      case State is
         when Gate_Passed => return "release gate passed";
         when Gate_Failed => return "release gate failed";
         when Gate_Warning => return "release gate warning";
         when Gate_Blocked => return "release gate blocked";
      end case;
   end Gate_Text;
   function Test_State_Label
     (State : Test_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Test_Text (State));
   end Test_State_Label;
   function Build_State_Label
     (State : Build_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Build_Text (State));
   end Build_State_Label;
   function Artifact_State_Label
     (State : Artifact_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Artifact_Text (State));
   end Artifact_State_Label;
   function Gate_State_Label
     (State : Gate_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Gate_Text (State));
   end Gate_State_Label;
   function Domain_Options
     (Options : Build_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Build_Detailed => Humanize.Domain_Details.Detailed_Output,
              when Build_Compact => Humanize.Domain_Details.Compact_Output,
              when Build_Accessible => Humanize.Domain_Details.Accessible_Output,
              when Build_Log => Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Test_Label_Suffix
     (State : Test_State)
      return String
   is
   begin
      return Test_Text (State);
   end Test_Label_Suffix;

   function Test_State_Metadata
     (State : Test_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Builds_Surface, Test_Label_Suffix (State));
   end Test_State_Metadata;

   function Build_Label_Suffix
     (State : Build_State)
      return String
   is
   begin
      return Build_Text (State);
   end Build_Label_Suffix;

   function Build_State_Metadata
     (State : Build_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Builds_Surface, Build_Label_Suffix (State));
   end Build_State_Metadata;

   function Gate_Label_Suffix
     (State : Gate_State)
      return String
   is
   begin
      return Gate_Text (State);
   end Gate_Label_Suffix;

   function Gate_State_Metadata
     (State : Gate_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Builds_Surface, Gate_Label_Suffix (State));
   end Gate_State_Metadata;

   function Test_Count_Label (Count : Natural; State : Test_State) return Humanize.Status.Text_Result is
   begin
      return Ok_Text
        (Count_Or_No_Text (Count, "test", "tests") & " "
         & Test_Label_Suffix (State));
   end Test_Count_Label;
   function Coverage_Label
     (Percent_Text : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.Bounded_Text.Nonempty_Label_Text
        (Percent_Text, "invalid coverage", Prefix => "coverage ");
   end Coverage_Label;
   function Benchmark_Label
     (Name : String;
     Result_Text : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.Bounded_Text.Nonempty_Detail_Text
        (Name,
         "invalid benchmark name",
         " benchmark ",
         Result_Text,
         "invalid benchmark result");
   end Benchmark_Label;
   function Build_Label
     (Name : String;
     State : Build_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.Bounded_Text.Nonempty_Label_Text
        (Name, "invalid build name", Suffix => " " & Build_Label_Suffix (State));
   end Build_Label;
   function Build_Label
     (Name    : String;
      State   : Build_State;
      Options : Build_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Build_Label (Name, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Build_State_Metadata (State), Domain_Options (Options));
   end Build_Label;

   function Parse_Build_Label
     (Text : String;
      State : Build_State)
      return Build_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Builds_Surface, Build_Label_Suffix (State));
   end Parse_Build_Label;

   function Scan_Build_Label
     (Text : String;
      State : Build_State)
      return Build_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Builds_Surface, Build_Label_Suffix (State));
   end Scan_Build_Label;

   procedure Test_State_Label_Into
     (State : Test_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Test_State_Label (State), Target, Written, Status);
   end Test_State_Label_Into;
   procedure Build_State_Label_Into
     (State : Build_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Build_State_Label (State), Target, Written, Status);
   end Build_State_Label_Into;
   procedure Artifact_State_Label_Into
     (State : Artifact_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Artifact_State_Label (State), Target, Written, Status);
   end Artifact_State_Label_Into;
   procedure Gate_State_Label_Into
     (State : Gate_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Gate_State_Label (State), Target, Written, Status);
   end Gate_State_Label_Into;
   procedure Test_Count_Label_Into
     (Count : Natural;
     State : Test_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Test_Count_Label (Count, State), Target, Written, Status);
   end Test_Count_Label_Into;
   procedure Coverage_Label_Into
     (Percent_Text : String;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Coverage_Label (Percent_Text), Target, Written, Status);
   end Coverage_Label_Into;
   procedure Benchmark_Label_Into
     (Name : String;
     Result_Text : String;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Benchmark_Label (Name, Result_Text), Target, Written, Status);
   end Benchmark_Label_Into;
   procedure Build_Label_Into
     (Name : String;
     State : Build_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Build_Label (Name, State), Target, Written, Status);
   end Build_Label_Into;
   procedure Build_Label_Into
     (Name    : String;
      State   : Build_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Build_Label_Options)
   is
   begin
      Copy_Result (Build_Label (Name, State, Options), Target, Written, Status);
   end Build_Label_Into;
end Humanize.Builds;
