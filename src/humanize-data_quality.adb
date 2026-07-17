with Humanize.Bounded_Text;

package body Humanize.Data_Quality is
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
   function Issue_Text (Issue : Data_Issue) return String is
   begin
      case Issue is
         when Invalid_Row => return "invalid row";
         when Duplicate_Record => return "duplicate record";
         when Missing_Column => return "missing column";
         when Unknown_Field => return "unknown field";
         when Schema_Mismatch => return "schema mismatch";
         when Skipped_Record => return "skipped record";
      end case;
   end Issue_Text;
   function State_Text (State : Import_Check_State) return String is
   begin
      case State is
         when Dry_Run_Passed => return "dry run passed";
         when Dry_Run_Failed => return "dry run failed";
         when Import_Valid => return "import valid";
         when Import_Invalid => return "import invalid";
         when Import_Partial => return "partial import";
      end case;
   end State_Text;
   function Data_Issue_Label
     (Issue : Data_Issue)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Issue_Text (Issue));
   end Data_Issue_Label;
   function Import_Check_State_Label
     (State : Import_Check_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (State_Text (State));
   end Import_Check_State_Label;
   function Domain_Options
     (Options : Data_Quality_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Data_Quality_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Data_Quality_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Data_Quality_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Data_Quality_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Issue_Label_Suffix (Issue : Data_Issue) return String is
   begin
      return Issue_Text (Issue);
   end Issue_Label_Suffix;

   function Import_Check_State_Suffix
     (State : Import_Check_State)
      return String
   is
   begin
      return State_Text (State);
   end Import_Check_State_Suffix;

   function Data_Issue_Metadata
     (Issue : Data_Issue)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Data_Quality_Surface, Issue_Label_Suffix (Issue));
   end Data_Issue_Metadata;

   function Import_Check_State_Metadata
     (State : Import_Check_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Data_Quality_Surface,
         Import_Check_State_Suffix (State));
   end Import_Check_State_Metadata;

   function Import_Result_Suffix
     (State    : Import_Check_State;
      Accepted : Natural;
      Rejected : Natural)
      return String
   is
   begin
      return Import_Check_State_Suffix (State) & ": " & Image (Accepted)
        & " accepted, " & Image (Rejected) & " rejected";
   end Import_Result_Suffix;

   function Issue_Count_Label (Issue : Data_Issue; Count : Natural) return Humanize.Status.Text_Result is
   begin
      return Ok_Text
        (Count_Or_No_Text
           (Count, Issue_Label_Suffix (Issue), Issue_Label_Suffix (Issue) & "s"));
   end Issue_Count_Label;
   function Row_Issue_Label
     (Row   : Positive;
      Issue : Data_Issue)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text ("row " & Image (Row) & " " & Issue_Label_Suffix (Issue));
   end Row_Issue_Label;
   function Source_File_Issue_Label (File_Name : String; Issue : Data_Issue) return Humanize.Status.Text_Result is
   begin
      return Humanize.Bounded_Text.Nonempty_Label_Text
        (File_Name,
         "invalid source file",
         Suffix => " " & Issue_Label_Suffix (Issue));
   end Source_File_Issue_Label;
   function Import_Result_Label
     (Name     : String;
      State    : Import_Check_State;
      Accepted : Natural;
      Rejected : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.Bounded_Text.Nonempty_Label_Text
        (Name,
         "invalid import name",
         Suffix => " " & Import_Result_Suffix (State, Accepted, Rejected));
   end Import_Result_Label;
   function Import_Result_Label
     (Name     : String;
      State    : Import_Check_State;
      Accepted : Natural;
      Rejected : Natural;
      Options  : Data_Quality_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Import_Result_Label (Name, State, Accepted, Rejected);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Import_Check_State_Metadata (State), Domain_Options (Options));
   end Import_Result_Label;

   function Parse_Import_Result_Label
     (Text     : String;
      State    : Import_Check_State;
      Accepted : Natural;
      Rejected : Natural)
      return Data_Quality_Label_Parse_Result
   is
      Result : Data_Quality_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Data_Quality_Surface,
         Import_Result_Suffix (State, Accepted, Rejected));
      Result.Metadata := Import_Check_State_Metadata (State);
      return Result;
   end Parse_Import_Result_Label;

   function Scan_Import_Result_Label
     (Text     : String;
      State    : Import_Check_State;
      Accepted : Natural;
      Rejected : Natural)
      return Data_Quality_Label_Parse_Result
   is
      Result : Data_Quality_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Data_Quality_Surface,
         Import_Result_Suffix (State, Accepted, Rejected));
      Result.Metadata := Import_Check_State_Metadata (State);
      return Result;
   end Scan_Import_Result_Label;

   procedure Data_Issue_Label_Into
     (Issue : Data_Issue;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Data_Issue_Label (Issue), Target, Written, Status);
   end Data_Issue_Label_Into;
   procedure Import_Check_State_Label_Into
     (State : Import_Check_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Import_Check_State_Label (State), Target, Written, Status);
   end Import_Check_State_Label_Into;
   procedure Issue_Count_Label_Into
     (Issue : Data_Issue;
     Count : Natural;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Issue_Count_Label (Issue, Count), Target, Written, Status);
   end Issue_Count_Label_Into;
   procedure Row_Issue_Label_Into
     (Row : Positive;
     Issue : Data_Issue;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Row_Issue_Label (Row, Issue), Target, Written, Status);
   end Row_Issue_Label_Into;
   procedure Source_File_Issue_Label_Into
     (File_Name : String;
     Issue : Data_Issue;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Source_File_Issue_Label (File_Name, Issue), Target, Written, Status);
   end Source_File_Issue_Label_Into;
   procedure Import_Result_Label_Into
     (Name : String;
     State : Import_Check_State;
     Accepted : Natural;
     Rejected : Natural;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Import_Result_Label (Name, State, Accepted, Rejected), Target, Written, Status);
   end Import_Result_Label_Into;
   procedure Import_Result_Label_Into
     (Name     : String;
      State    : Import_Check_State;
      Accepted : Natural;
      Rejected : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Data_Quality_Label_Options)
   is
   begin
      Copy_Result
        (Import_Result_Label (Name, State, Accepted, Rejected, Options),
         Target, Written, Status);
   end Import_Result_Label_Into;
end Humanize.Data_Quality;
