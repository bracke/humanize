with Humanize.Status;

--  Deterministic labels for tolerance, baseline, and comparison summaries.
package Humanize.Comparisons is
   type Comparison_Result is
     (Improved, Regressed, Unchanged, Within_Tolerance, Outside_Tolerance,
      New_Value, Removed_Value, Baseline_Unavailable);
   --  Caller-supplied semantic comparison result.

   type Comparison_Output_Mode is
     (Comparison_Detailed,
      Comparison_Compact,
      Comparison_Log);
   --  Output policy for comparison count summaries.

   type Comparison_Summary_Options is record
      Mode : Comparison_Output_Mode := Comparison_Detailed;
   end record;
   --  Comparison summary output options.

   Default_Comparison_Summary_Options : constant Comparison_Summary_Options :=
     (Mode => Comparison_Detailed);

   type Multi_Value_Parse_Result is record
      Status    : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Changed   : Natural := 0;
      Unchanged : Natural := 0;
      Total     : Natural := 0;
      Consumed  : Natural := 0;
   end record;
   --  Parsed metadata from a deterministic multi-value comparison summary.

   function Comparison_Result_Label
     (Result : Comparison_Result)
      return Humanize.Status.Text_Result;
   --  @param Result Semantic comparison result.
   --  @return Human-readable comparison-result label.

   function Difference_Label
     (Name            : String;
      Difference_Text : String;
      Result          : Comparison_Result)
      return Humanize.Status.Text_Result;
   --  @param Name Compared metric or value display name.
   --  @param Difference_Text Caller-supplied difference label.
   --  @param Result Semantic comparison result.
   --  @return Human-readable difference summary.

   function Tolerance_Label
     (Name            : String;
      Difference_Text : String;
      Tolerance_Text  : String;
      Result          : Comparison_Result)
      return Humanize.Status.Text_Result;
   --  @param Name Compared metric or value display name.
   --  @param Difference_Text Caller-supplied difference label.
   --  @param Tolerance_Text Caller-supplied tolerance label.
   --  @param Result Semantic comparison result.
   --  @return Human-readable tolerance-aware comparison summary.

   function Baseline_Label
     (Name   : String;
      Result : Comparison_Result)
      return Humanize.Status.Text_Result;
   --  @param Name Compared metric or value display name.
   --  @param Result Baseline/new/removed comparison result.
   --  @return Human-readable baseline status label.

   function Multi_Value_Summary
     (Name      : String;
      Changed   : Natural;
      Unchanged : Natural;
      Total     : Natural)
      return Humanize.Status.Text_Result;
   --  @param Name Compared set display name.
   --  @param Changed Changed value count.
   --  @param Unchanged Unchanged value count.
   --  @param Total Total value count.
   --  @return Human-readable multi-value comparison summary.

   function Multi_Value_Summary
     (Name      : String;
      Changed   : Natural;
      Unchanged : Natural;
      Total     : Natural;
      Options   : Comparison_Summary_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Compared set display name.
   --  @param Changed Changed value count.
   --  @param Unchanged Unchanged value count.
   --  @param Total Total value count.
   --  @param Options Comparison summary output policy.
   --  @return Human-readable or machine-stable comparison summary.

   function Parse_Multi_Value_Summary
     (Text : String)
      return Multi_Value_Parse_Result;
   --  @param Text Multi-value summary emitted by Multi_Value_Summary.
   --  @return Parsed comparison count metadata.

   function Scan_Multi_Value_Summary
     (Text : String)
      return Multi_Value_Parse_Result;
   --  @param Text Text beginning with a multi-value summary.
   --  @return Parsed comparison count metadata and consumed prefix length.

   procedure Comparison_Result_Label_Into
     (Result  : Comparison_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Result Semantic comparison result.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Difference_Label_Into
     (Name            : String;
      Difference_Text : String;
      Result          : Comparison_Result;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code);
   --  @param Name Compared metric or value display name.
   --  @param Difference_Text Caller-supplied difference label.
   --  @param Result Semantic comparison result.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Tolerance_Label_Into
     (Name            : String;
      Difference_Text : String;
      Tolerance_Text  : String;
      Result          : Comparison_Result;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code);
   --  @param Name Compared metric or value display name.
   --  @param Difference_Text Caller-supplied difference label.
   --  @param Tolerance_Text Caller-supplied tolerance label.
   --  @param Result Semantic comparison result.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Baseline_Label_Into
     (Name    : String;
      Result  : Comparison_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Compared metric or value display name.
   --  @param Result Baseline/new/removed comparison result.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Multi_Value_Summary_Into
     (Name      : String;
      Changed   : Natural;
      Unchanged : Natural;
      Total     : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Name Compared set display name.
   --  @param Changed Changed value count.
   --  @param Unchanged Unchanged value count.
   --  @param Total Total value count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
end Humanize.Comparisons;
