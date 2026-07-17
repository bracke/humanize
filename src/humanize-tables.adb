with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.Tables is
   use type Humanize.Status.Status_Code;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Invalid_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Invalid_Text;

   function Clean (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function Image (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Count_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
      renames Humanize.Bounded_Text.Count_Text;

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

   function Domain_Options
     (Options : Table_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Table_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Table_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Table_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Table_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Direction_Text (Direction : Sort_Direction) return String is
   begin
      case Direction is
         when Unsorted        => return "not sorted";
         when Ascending_Sort  => return "ascending";
         when Descending_Sort => return "descending";
      end case;
   end Direction_Text;

   function Role_Text (Role : Column_Role) return String is
   begin
      case Role is
         when Text_Column   => return "text";
         when Number_Column => return "number";
         when Date_Column   => return "date";
         when Status_Column => return "status";
         when Action_Column => return "action";
         when Hidden_Column => return "hidden";
      end case;
   end Role_Text;

   function State_Text (State : Cell_State) return String is
   begin
      case State is
         when Empty_Cell       => return "empty";
         when Edited_Cell      => return "edited";
         when Invalid_Cell     => return "invalid";
         when Highlighted_Cell => return "highlighted";
         when Read_Only_Cell   => return "read-only";
      end case;
   end State_Text;

   function Cell_State_Suffix (State : Cell_State) return String is
   begin
      return State_Text (State);
   end Cell_State_Suffix;

   function Sort_Direction_Metadata
     (Direction : Sort_Direction)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Tables_Surface, Direction_Text (Direction));
   end Sort_Direction_Metadata;

   function Cell_State_Metadata
     (State : Cell_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Tables_Surface, Cell_State_Suffix (State));
   end Cell_State_Metadata;

   function Row_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "row", "rows"));
   end Row_Count_Label;

   function Column_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "column", "columns"));
   end Column_Count_Label;

   function Table_Size_Label
     (Rows    : Natural;
      Columns : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Count_Text (Rows, "row", "rows") & " by "
         & Count_Text (Columns, "column", "columns"));
   end Table_Size_Label;

   function Selection_Label
     (Selected : Natural;
      Total    : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Selected > Total then
         return Invalid_Text ("invalid selection count");
      elsif Total = 0 then
         return Ok_Text ("no rows selectable");
      elsif Selected = 0 then
         return Ok_Text ("no rows selected");
      elsif Selected = Total then
         return Ok_Text ("all " & Count_Text (Total, "row", "rows") & " selected");
      else
         return Ok_Text
           (Image (Selected) & " of " & Count_Text (Total, "row", "rows")
            & " selected");
      end if;
   end Selection_Label;

   function Sort_Direction_Label
     (Direction : Sort_Direction)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Direction_Text (Direction));
   end Sort_Direction_Label;

   function Sort_Label
     (Column_Name : String;
      Direction   : Sort_Direction)
      return Humanize.Status.Text_Result
   is
      Column : constant String := Clean (Column_Name);
   begin
      if Direction = Unsorted then
         return Ok_Text ("not sorted");
      elsif Column'Length = 0 then
         return Invalid_Text ("invalid sort column");
      else
         return Ok_Text
           ("sorted by " & Column & " " & Direction_Text (Direction));
      end if;
   end Sort_Label;

   function Sort_Label
     (Column_Name : String;
      Direction   : Sort_Direction;
      Options     : Table_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Sort_Label (Column_Name, Direction);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Sort_Direction_Metadata (Direction), Domain_Options (Options));
   end Sort_Label;

   function Column_Role_Label
     (Role : Column_Role)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Role_Text (Role) & " column");
   end Column_Role_Label;

   function Column_Label
     (Name : String;
      Role : Column_Role := Text_Column)
      return Humanize.Status.Text_Result
   is
      Column : constant String := Clean (Name);
   begin
      if Column'Length = 0 then
         return Invalid_Text ("invalid column name");
      else
         return Ok_Text (Column & " " & Role_Text (Role) & " column");
      end if;
   end Column_Label;

   function Cell_Position_Label
     (Row    : Positive;
      Column : Positive)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        ("row " & Image (Row) & ", column " & Image (Column));
   end Cell_Position_Label;

   function Cell_State_Label
     (State : Cell_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Cell_State_Suffix (State) & " cell");
   end Cell_State_Label;

   function Cell_Label
     (Row    : Positive;
      Column : Positive;
      State  : Cell_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        ("row " & Image (Row) & ", column " & Image (Column)
         & " " & Cell_State_Suffix (State));
   end Cell_Label;

   function Cell_Label
     (Row     : Positive;
      Column  : Positive;
      State   : Cell_State;
      Options : Table_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Cell_Label (Row, Column, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Cell_State_Metadata (State), Domain_Options (Options));
   end Cell_Label;

   function Parse_Cell_Label
     (Text  : String;
      State : Cell_State)
      return Table_Label_Parse_Result
   is
      Result : Table_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Tables_Surface, Cell_State_Suffix (State));
      Result.Metadata := Cell_State_Metadata (State);
      return Result;
   end Parse_Cell_Label;

   function Scan_Cell_Label
     (Text  : String;
      State : Cell_State)
      return Table_Label_Parse_Result
   is
      Result : Table_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Tables_Surface, Cell_State_Suffix (State));
      Result.Metadata := Cell_State_Metadata (State);
      return Result;
   end Scan_Cell_Label;

   function Page_Label
     (Page : Natural;
      Pages : Natural;
      Rows : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Text : Unbounded_String;
   begin
      if Pages = 0 then
         return Ok_Text ("no pages");
      elsif Page = 0 or else Page > Pages then
         return Invalid_Text ("invalid page number");
      end if;

      Text := To_Unbounded_String
        ("page " & Image (Page) & " of " & Image (Pages));
      if Rows > 0 then
         Append (Text, ", ");
         Append (Text, Count_Text (Rows, "row", "rows"));
      end if;
      return Ok_Text (To_String (Text));
   end Page_Label;

   function Filter_Label
     (Visible : Natural;
      Total   : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Visible > Total then
         return Invalid_Text ("invalid visible row count");
      elsif Total = 0 then
         return Ok_Text ("no rows");
      elsif Visible = 0 then
         return Ok_Text ("no rows match");
      elsif Visible = Total then
         return Ok_Text ("all " & Count_Text (Total, "row", "rows") & " visible");
      else
         return Ok_Text
           (Image (Visible) & " of " & Count_Text (Total, "row", "rows")
            & " visible");
      end if;
   end Filter_Label;

   function Row_Range_Label
     (First_Row : Natural;
      Last_Row  : Natural;
      Total     : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Total = 0 then
         if First_Row = 0 and then Last_Row = 0 then
            return Ok_Text ("no rows");
         else
            return Invalid_Text ("invalid row range");
         end if;
      elsif First_Row = 0
        or else Last_Row = 0
        or else First_Row > Last_Row
        or else Last_Row > Total
      then
         return Invalid_Text ("invalid row range");
      elsif First_Row = Last_Row then
         return Ok_Text
           ("row " & Image (First_Row) & " of " & Image (Total));
      else
         return Ok_Text
           ("rows " & Image (First_Row) & "-" & Image (Last_Row)
            & " of " & Image (Total));
      end if;
   end Row_Range_Label;

   function Group_Label
     (Name  : String;
      Count : Natural)
      return Humanize.Status.Text_Result
   is
      Group : constant String := Clean (Name);
   begin
      if Group'Length = 0 then
         return Invalid_Text ("invalid group name");
      else
         return Ok_Text
           (Group & ": " & Count_Text (Count, "row", "rows"));
      end if;
   end Group_Label;

   function Subtotal_Label
     (Name  : String;
      Value : String)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
      Total : constant String := Clean (Value);
   begin
      if Label'Length = 0 or else Total'Length = 0 then
         return Invalid_Text ("invalid subtotal");
      else
         return Ok_Text ("subtotal " & Label & ": " & Total);
      end if;
   end Subtotal_Label;

   procedure Row_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Row_Count_Label (Count), Target, Written, Status);
   end Row_Count_Label_Into;

   procedure Column_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Column_Count_Label (Count), Target, Written, Status);
   end Column_Count_Label_Into;

   procedure Table_Size_Label_Into
     (Rows    : Natural;
      Columns : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Table_Size_Label (Rows, Columns), Target, Written, Status);
   end Table_Size_Label_Into;

   procedure Selection_Label_Into
     (Selected : Natural;
      Total    : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Selection_Label (Selected, Total), Target, Written, Status);
   end Selection_Label_Into;

   procedure Sort_Label_Into
     (Column_Name : String;
      Direction   : Sort_Direction;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Sort_Label (Column_Name, Direction), Target, Written, Status);
   end Sort_Label_Into;

   procedure Sort_Label_Into
     (Column_Name : String;
      Direction   : Sort_Direction;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Options     : Table_Label_Options)
   is
   begin
      Copy_Result
        (Sort_Label (Column_Name, Direction, Options), Target, Written,
         Status);
   end Sort_Label_Into;

   procedure Sort_Direction_Label_Into
     (Direction : Sort_Direction;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Sort_Direction_Label (Direction), Target, Written, Status);
   end Sort_Direction_Label_Into;

   procedure Column_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Role    : Column_Role := Text_Column)
   is
   begin
      Copy_Result (Column_Label (Name, Role), Target, Written, Status);
   end Column_Label_Into;

   procedure Column_Role_Label_Into
     (Role    : Column_Role;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Column_Role_Label (Role), Target, Written, Status);
   end Column_Role_Label_Into;

   procedure Cell_Position_Label_Into
     (Row     : Positive;
      Column  : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Cell_Position_Label (Row, Column), Target, Written, Status);
   end Cell_Position_Label_Into;

   procedure Cell_State_Label_Into
     (State   : Cell_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Cell_State_Label (State), Target, Written, Status);
   end Cell_State_Label_Into;

   procedure Cell_Label_Into
     (Row     : Positive;
      Column  : Positive;
      State   : Cell_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Cell_Label (Row, Column, State), Target, Written, Status);
   end Cell_Label_Into;

   procedure Cell_Label_Into
     (Row     : Positive;
      Column  : Positive;
      State   : Cell_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Table_Label_Options)
   is
   begin
      Copy_Result
        (Cell_Label (Row, Column, State, Options), Target, Written, Status);
   end Cell_Label_Into;

   procedure Page_Label_Into
     (Page    : Natural;
      Pages   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Rows    : Natural := 0)
   is
   begin
      Copy_Result (Page_Label (Page, Pages, Rows), Target, Written, Status);
   end Page_Label_Into;

   procedure Filter_Label_Into
     (Visible : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Filter_Label (Visible, Total), Target, Written, Status);
   end Filter_Label_Into;

   procedure Row_Range_Label_Into
     (First_Row : Natural;
      Last_Row  : Natural;
      Total     : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Row_Range_Label (First_Row, Last_Row, Total),
         Target,
         Written,
         Status);
   end Row_Range_Label_Into;

   procedure Group_Label_Into
     (Name    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Group_Label (Name, Count), Target, Written, Status);
   end Group_Label_Into;

   procedure Subtotal_Label_Into
     (Name    : String;
      Value   : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Subtotal_Label (Name, Value), Target, Written, Status);
   end Subtotal_Label_Into;

end Humanize.Tables;
