with Humanize.Domain_Details;
with Humanize.Status;

--  Human-readable labels for table, report, and data-grid metadata.
package Humanize.Tables is
   type Table_Output_Mode is
     (Table_Detailed,
      Table_Compact,
      Table_Accessible,
      Table_Log);

   type Table_Label_Options is record
      Mode             : Table_Output_Mode := Table_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;

   Default_Table_Label_Options : constant Table_Label_Options :=
     (Mode             => Table_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Table_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;

   type Sort_Direction is
     (Unsorted,
      Ascending_Sort,
      Descending_Sort);
   --  Caller-supplied table sort direction.

   type Column_Role is
     (Text_Column,
      Number_Column,
      Date_Column,
      Status_Column,
      Action_Column,
      Hidden_Column);
   --  Caller-supplied column display role.

   type Cell_State is
     (Empty_Cell,
      Edited_Cell,
      Invalid_Cell,
      Highlighted_Cell,
      Read_Only_Cell);
   --  Caller-supplied cell display state.

   function Row_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Row count.
   --  @return Human-readable row-count label.

   function Column_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Column count.
   --  @return Human-readable column-count label.

   function Table_Size_Label
     (Rows    : Natural;
      Columns : Natural)
      return Humanize.Status.Text_Result;
   --  @param Rows Row count.
   --  @param Columns Column count.
   --  @return Human-readable table-size label.

   function Selection_Label
     (Selected : Natural;
      Total    : Natural)
      return Humanize.Status.Text_Result;
   --  @param Selected Selected row count.
   --  @param Total Total selectable row count.
   --  @return Human-readable selection summary.

   function Sort_Direction_Label
     (Direction : Sort_Direction)
      return Humanize.Status.Text_Result;
   --  @param Direction Sort direction.
   --  @return Human-readable sort-direction label.

   function Sort_Label
     (Column_Name : String;
      Direction   : Sort_Direction)
      return Humanize.Status.Text_Result;
   --  @param Column_Name Sorted column name.
   --  @param Direction Sort direction.
   --  @return Human-readable sort summary.

   function Sort_Label
     (Column_Name : String;
      Direction   : Sort_Direction;
      Options     : Table_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Column_Name Sorted column name.
   --  @param Direction Sort direction.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable sort summary with optional metadata.

   function Column_Role_Label
     (Role : Column_Role)
      return Humanize.Status.Text_Result;
   --  @param Role Column display role.
   --  @return Human-readable column-role label.

   function Column_Label
     (Name : String;
      Role : Column_Role := Text_Column)
      return Humanize.Status.Text_Result;
   --  @param Name Column name.
   --  @param Role Column display role.
   --  @return Human-readable column label.

   function Cell_Position_Label
     (Row    : Positive;
      Column : Positive)
      return Humanize.Status.Text_Result;
   --  @param Row 1-based row position.
   --  @param Column 1-based column position.
   --  @return Human-readable cell position.

   function Cell_State_Label
     (State : Cell_State)
      return Humanize.Status.Text_Result;
   --  @param State Cell display state.
   --  @return Human-readable cell-state label.

   function Cell_Label
     (Row    : Positive;
      Column : Positive;
      State  : Cell_State)
      return Humanize.Status.Text_Result;
   --  @param Row 1-based row position.
   --  @param Column 1-based column position.
   --  @param State Cell display state.
   --  @return Human-readable cell label.

   function Cell_Label
     (Row     : Positive;
      Column  : Positive;
      State   : Cell_State;
      Options : Table_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Row 1-based row position.
   --  @param Column 1-based column position.
   --  @param State Cell display state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable cell label with optional metadata.

   function Sort_Direction_Metadata
     (Direction : Sort_Direction)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param Direction Sort direction.
   --  @return Severity, tone, and final/actionable metadata for Direction.

   function Cell_State_Metadata
     (State : Cell_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Cell display state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Parse_Cell_Label
     (Text  : String;
      State : Cell_State)
      return Table_Label_Parse_Result;
   --  @param Text Label in rendered cell-label form.
   --  @param State Expected cell state.
   --  @return Parsed cell position span, state span, metadata, and consumed length.

   function Scan_Cell_Label
     (Text  : String;
      State : Cell_State)
      return Table_Label_Parse_Result;
   --  @param Text Text beginning with a cell label.
   --  @param State Expected cell state.
   --  @return Parsed cell-label prefix and consumed length.

   function Page_Label
     (Page : Natural;
      Pages : Natural;
      Rows : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Page Current 1-based page number.
   --  @param Pages Total page count.
   --  @param Rows Optional row count on the current page.
   --  @return Human-readable table page label.

   function Filter_Label
     (Visible : Natural;
      Total   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Visible Visible row count after filtering.
   --  @param Total Total row count before filtering.
   --  @return Human-readable filter summary.

   function Row_Range_Label
     (First_Row : Natural;
      Last_Row  : Natural;
      Total     : Natural)
      return Humanize.Status.Text_Result;
   --  @param First_Row First 1-based row shown, or 0 when empty.
   --  @param Last_Row Last 1-based row shown, or 0 when empty.
   --  @param Total Total row count.
   --  @return Human-readable visible row-range label.

   function Group_Label
     (Name  : String;
      Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Name Group name.
   --  @param Count Row count in the group.
   --  @return Human-readable grouped-row label.

   function Subtotal_Label
     (Name  : String;
      Value : String)
      return Humanize.Status.Text_Result;
   --  @param Name Subtotal label.
   --  @param Value Caller-formatted subtotal value.
   --  @return Human-readable subtotal label.

   procedure Row_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Row count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Column_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Column count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Table_Size_Label_Into
     (Rows    : Natural;
      Columns : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Rows Row count.
   --  @param Columns Column count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Selection_Label_Into
     (Selected : Natural;
      Total    : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Selected Selected row count.
   --  @param Total Total selectable row count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Sort_Direction_Label_Into
     (Direction : Sort_Direction;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Direction Sort direction.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Sort_Label_Into
     (Column_Name : String;
      Direction   : Sort_Direction;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code);
   --  @param Column_Name Sorted column name.
   --  @param Direction Sort direction.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Sort_Label_Into
     (Column_Name : String;
      Direction   : Sort_Direction;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Options     : Table_Label_Options);
   --  @param Column_Name Sorted column name.
   --  @param Direction Sort direction.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Column_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Role    : Column_Role := Text_Column);
   --  @param Name Column name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Role Column display role.

   procedure Column_Role_Label_Into
     (Role    : Column_Role;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Role Column display role.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Cell_Position_Label_Into
     (Row     : Positive;
      Column  : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Row 1-based row position.
   --  @param Column 1-based column position.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Cell_State_Label_Into
     (State   : Cell_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Cell display state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Cell_Label_Into
     (Row     : Positive;
      Column  : Positive;
      State   : Cell_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Row 1-based row position.
   --  @param Column 1-based column position.
   --  @param State Cell display state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Cell_Label_Into
     (Row     : Positive;
      Column  : Positive;
      State   : Cell_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Table_Label_Options);
   --  @param Row 1-based row position.
   --  @param Column 1-based column position.
   --  @param State Cell display state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Page_Label_Into
     (Page    : Natural;
      Pages   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Rows    : Natural := 0);
   --  @param Page Current 1-based page number.
   --  @param Pages Total page count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Rows Optional row count on the current page.

   procedure Filter_Label_Into
     (Visible : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Visible Visible row count after filtering.
   --  @param Total Total row count before filtering.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Row_Range_Label_Into
     (First_Row : Natural;
      Last_Row  : Natural;
      Total     : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param First_Row First 1-based row shown, or 0 when empty.
   --  @param Last_Row Last 1-based row shown, or 0 when empty.
   --  @param Total Total row count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Group_Label_Into
     (Name    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Group name.
   --  @param Count Row count in the group.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Subtotal_Label_Into
     (Name    : String;
      Value   : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Subtotal label.
   --  @param Value Caller-formatted subtotal value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Tables;
