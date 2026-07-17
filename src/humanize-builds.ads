with Humanize.Status;
with Humanize.Domain_Details;

--  Deterministic labels for test results, build artifacts, coverage, and gates.
package Humanize.Builds is
   type Build_Output_Mode is (Build_Detailed, Build_Compact,
      Build_Accessible, Build_Log);
   --  Output policy for build labels.

   type Build_Label_Options is record
      Mode             : Build_Output_Mode := Build_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;
   --  Build label output options.

   Default_Build_Label_Options : constant Build_Label_Options :=
     (Mode             => Build_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Build_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;
   --  Parsed build label metadata.

   type Test_State is (Passed_Test, Failed_Test, Skipped_Test, Flaky_Test,
      Expected_Failure_Test);
   --  Caller-supplied test outcome state.

   type Build_State is (Build_Queued, Build_Running, Build_Passed,
      Build_Failed, Snapshot_Build, Release_Build);
   --  Caller-supplied build state.

   type Artifact_State is (Artifact_Uploaded, Artifact_Missing,
      Artifact_Expired, Artifact_Verified);
   --  Caller-supplied build artifact state.

   type Gate_State is (Gate_Passed, Gate_Failed, Gate_Warning, Gate_Blocked);
   --  Caller-supplied release gate state.

   function Test_State_Label (State : Test_State) return Humanize.Status.Text_Result;
   --  @param State Test outcome state.
   --  @return Human-readable test-state label.

   function Build_State_Label (State : Build_State) return Humanize.Status.Text_Result;
   --  @param State Build state.
   --  @return Human-readable build-state label.

   function Artifact_State_Label (State : Artifact_State) return Humanize.Status.Text_Result;
   --  @param State Build artifact state.
   --  @return Human-readable artifact-state label.

   function Gate_State_Label (State : Gate_State) return Humanize.Status.Text_Result;
   --  @param State Release gate state.
   --  @return Human-readable release-gate label.

   function Test_Count_Label (Count : Natural; State : Test_State) return Humanize.Status.Text_Result;
   --  @param Count Test count.
   --  @param State Test outcome state.
   --  @return Human-readable test count label.

   function Coverage_Label (Percent_Text : String) return Humanize.Status.Text_Result;
   --  @param Percent_Text Caller-supplied coverage percentage label.
   --  @return Human-readable coverage label.

   function Benchmark_Label (Name : String; Result_Text : String) return Humanize.Status.Text_Result;
   --  @param Name Benchmark display name.
   --  @param Result_Text Caller-supplied benchmark comparison label.
   --  @return Human-readable benchmark label.

   function Build_Label (Name : String; State : Build_State) return Humanize.Status.Text_Result;
   --  @param Name Build display name.
   --  @param State Build state.
   --  @return Human-readable build label.

   function Build_Label
     (Name    : String;
      State   : Build_State;
      Options : Build_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Build display name.
   --  @param State Build state.
   --  @param Options Build output policy.
   --  @return Human-readable build label with optional metadata.

   function Test_State_Metadata
     (State : Test_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Test state.
   --  @return Stable metadata for State.

   function Build_State_Metadata
     (State : Build_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Build state.
   --  @return Stable metadata for State.

   function Gate_State_Metadata
     (State : Gate_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Gate state.
   --  @return Stable metadata for State.

   function Parse_Build_Label
     (Text : String;
      State : Build_State)
      return Build_Label_Parse_Result;
   --  @param Text Build label emitted by Build_Label.
   --  @param State Expected build state suffix.
   --  @return Parsed build label spans and metadata.

   function Scan_Build_Label
     (Text : String;
      State : Build_State)
      return Build_Label_Parse_Result;
   --  @param Text Text beginning with a build label.
   --  @param State Expected build state suffix.
   --  @return Parsed build label prefix spans and metadata.

   procedure Test_State_Label_Into
     (State : Test_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param State Test outcome state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Build_State_Label_Into
     (State : Build_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param State Build state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Artifact_State_Label_Into
     (State : Artifact_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param State Build artifact state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Gate_State_Label_Into
     (State : Gate_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param State Release gate state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Test_Count_Label_Into
     (Count : Natural;
     State : Test_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Count Test count.
   --  @param State Test outcome state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Coverage_Label_Into
     (Percent_Text : String;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Percent_Text Caller-supplied coverage percentage label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Benchmark_Label_Into
     (Name : String;
     Result_Text : String;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Name Benchmark display name.
   --  @param Result_Text Caller-supplied benchmark comparison label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Build_Label_Into
     (Name : String;
     State : Build_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Name Build display name.
   --  @param State Build state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Build_Label_Into
     (Name    : String;
      State   : Build_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Build_Label_Options);
   --  @param Name Build display name.
   --  @param State Build state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Build output policy.
end Humanize.Builds;
