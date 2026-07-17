with Humanize.Domain_Details;
with Humanize.Status;

--  Deterministic labels for import validation and data-quality summaries.
package Humanize.Data_Quality is
   type Data_Quality_Output_Mode is
     (Data_Quality_Detailed,
      Data_Quality_Compact,
      Data_Quality_Accessible,
      Data_Quality_Log);
   --  Output policy for data-quality labels.

   type Data_Quality_Label_Options is record
      Mode             : Data_Quality_Output_Mode := Data_Quality_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;
   --  Data-quality label output options.

   Default_Data_Quality_Label_Options : constant Data_Quality_Label_Options :=
     (Mode             => Data_Quality_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Data_Quality_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;
   --  Parsed data-quality label metadata.

   type Data_Issue is (Invalid_Row, Duplicate_Record, Missing_Column,
      Unknown_Field, Schema_Mismatch, Skipped_Record);
   --  Caller-supplied data quality issue kind.

   type Import_Check_State is (Dry_Run_Passed, Dry_Run_Failed, Import_Valid,
      Import_Invalid, Import_Partial);
   --  Caller-supplied import validation state.

   function Data_Issue_Label (Issue : Data_Issue) return Humanize.Status.Text_Result;
   --  @param Issue Data quality issue kind.
   --  @return Human-readable data-issue label.

   function Import_Check_State_Label (State : Import_Check_State) return Humanize.Status.Text_Result;
   --  @param State Import validation state.
   --  @return Human-readable import-check state label.

   function Issue_Count_Label (Issue : Data_Issue; Count : Natural) return Humanize.Status.Text_Result;
   --  @param Issue Data quality issue kind.
   --  @param Count Issue count.
   --  @return Human-readable issue-count label.

   function Row_Issue_Label (Row : Positive; Issue : Data_Issue) return Humanize.Status.Text_Result;
   --  @param Row 1-based row number.
   --  @param Issue Data quality issue kind.
   --  @return Human-readable row issue label.

   function Source_File_Issue_Label (File_Name : String; Issue : Data_Issue) return Humanize.Status.Text_Result;
   --  @param File_Name Source file display name.
   --  @param Issue Data quality issue kind.
   --  @return Human-readable source-file issue label.

   function Import_Result_Label
     (Name : String;
     State : Import_Check_State;
     Accepted : Natural;
     Rejected : Natural)
      return Humanize.Status.Text_Result;
   --  @param Name Import job or source display name.
   --  @param State Import validation state.
   --  @param Accepted Accepted record count.
   --  @param Rejected Rejected record count.
   --  @return Human-readable import result label.

   function Import_Result_Label
     (Name     : String;
      State    : Import_Check_State;
      Accepted : Natural;
      Rejected : Natural;
      Options  : Data_Quality_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Import job or source display name.
   --  @param State Import validation state.
   --  @param Accepted Accepted record count.
   --  @param Rejected Rejected record count.
   --  @param Options Data-quality output policy.
   --  @return Human-readable import result label with optional metadata.

   function Data_Issue_Metadata
     (Issue : Data_Issue)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param Issue Data quality issue kind.
   --  @return Stable metadata for Issue.

   function Import_Check_State_Metadata
     (State : Import_Check_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Import validation state.
   --  @return Stable metadata for State.

   function Parse_Import_Result_Label
     (Text     : String;
      State    : Import_Check_State;
      Accepted : Natural;
      Rejected : Natural)
      return Data_Quality_Label_Parse_Result;
   --  @param Text Import result label emitted by Import_Result_Label.
   --  @param State Expected import validation state.
   --  @param Accepted Expected accepted record count.
   --  @param Rejected Expected rejected record count.
   --  @return Parsed import result label spans and metadata.

   function Scan_Import_Result_Label
     (Text     : String;
      State    : Import_Check_State;
      Accepted : Natural;
      Rejected : Natural)
      return Data_Quality_Label_Parse_Result;
   --  @param Text Text beginning with an import result label.
   --  @param State Expected import validation state.
   --  @param Accepted Expected accepted record count.
   --  @param Rejected Expected rejected record count.
   --  @return Parsed import result label prefix spans and metadata.

   procedure Data_Issue_Label_Into
     (Issue : Data_Issue;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Issue Data quality issue kind.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Import_Check_State_Label_Into
     (State : Import_Check_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param State Import validation state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Issue_Count_Label_Into
     (Issue : Data_Issue;
     Count : Natural;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Issue Data quality issue kind.
   --  @param Count Issue count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Row_Issue_Label_Into
     (Row : Positive;
     Issue : Data_Issue;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Row 1-based row number.
   --  @param Issue Data quality issue kind.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Source_File_Issue_Label_Into
     (File_Name : String;
     Issue : Data_Issue;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param File_Name Source file display name.
   --  @param Issue Data quality issue kind.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Import_Result_Label_Into
     (Name : String;
     State : Import_Check_State;
     Accepted : Natural;
     Rejected : Natural;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Name Import job or source display name.
   --  @param State Import validation state.
   --  @param Accepted Accepted record count.
   --  @param Rejected Rejected record count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Import_Result_Label_Into
     (Name     : String;
      State    : Import_Check_State;
      Accepted : Natural;
      Rejected : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Data_Quality_Label_Options);
   --  @param Name Import job or source display name.
   --  @param State Import validation state.
   --  @param Accepted Accepted record count.
   --  @param Rejected Rejected record count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Data-quality output policy.
end Humanize.Data_Quality;
