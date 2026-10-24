with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
with Humanize.Selections;

package body Humanize.Tables.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Cell_Label
      (Context : Humanize.Contexts.Context;
       Row     : Positive;
       Column  : Positive;
       State   : Cell_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tables.Cell_Label (Row => Row, Column => Column, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tables.cell_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Cell_State'Image (State)));
      Selection := Sel.With_Arg (Selection, "row", Long_Long_Integer (Row));
      Selection := Sel.With_Arg (Selection, "column", Long_Long_Integer (Column));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Cell_Label;

   function Cell_Label
      (Context : Humanize.Contexts.Context;
       Row     : Positive;
       Column  : Positive;
       State   : Cell_State;
       Options : Table_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tables.Cell_Label (Row => Row, Column => Column, State => State, Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Tables.Cell_Label (Row => Row, Column => Column, State => State);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Cell_Label (Context, Row => Row, Column =>
        Column, State => State));
   end Cell_Label;

   function Cell_Position_Label
      (Context : Humanize.Contexts.Context;
       Row     : Positive;
       Column  : Positive)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tables.Cell_Position_Label (Row => Row, Column => Column);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tables.cell_position_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "row", Long_Long_Integer (Row));
      Selection := Sel.With_Arg (Selection, "column", Long_Long_Integer (Column));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Cell_Position_Label;

   function Cell_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Cell_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tables.Cell_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tables.cell_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Cell_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Cell_State_Label;

   function Column_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tables.Column_Count_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tables.column_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Column_Count_Label;

   function Column_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Role    : Column_Role := Text_Column)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tables.Column_Label (Name => Name, Role => Role);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tables.column_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "role", Lower (Column_Role'Image (Role)));
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Column_Label;

   function Column_Role_Label
      (Context : Humanize.Contexts.Context;
       Role    : Column_Role)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tables.Column_Role_Label (Role => Role);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tables.column_role_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "role", Lower (Column_Role'Image (Role)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Column_Role_Label;

   function Filter_Label
      (Context : Humanize.Contexts.Context;
       Visible : Natural;
       Total   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tables.Filter_Label (Visible => Visible, Total => Total);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tables.filter_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", (if Total = 0 then "no_rows" elsif Visible = 0 then "none" elsif
        Visible = Total then "all" else "some"));
      Selection := Sel.With_Arg (Selection, "total", Long_Long_Integer (Total));
      Selection := Sel.With_Arg (Selection, "visible", Long_Long_Integer (Visible));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Filter_Label;

   function Group_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tables.Group_Label (Name => Name, Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tables.group_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Group_Label;

   function Page_Label
      (Context : Humanize.Contexts.Context;
       Page    : Natural;
       Pages   : Natural;
       Rows    : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tables.Page_Label (Page => Page, Pages => Pages, Rows => Rows);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tables.page_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "page", Long_Long_Integer (Page));
      Selection := Sel.With_Arg (Selection, "pages", Long_Long_Integer (Pages));
      Selection := Sel.With_Arg (Selection, "rows", Long_Long_Integer (Rows));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Page_Label;

   function Row_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tables.Row_Count_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tables.row_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Row_Count_Label;

   function Row_Range_Label
      (Context   : Humanize.Contexts.Context;
       First_Row : Natural;
       Last_Row  : Natural;
       Total     : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tables.Row_Range_Label (First_Row => First_Row, Last_Row => Last_Row, Total => Total);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tables.row_range_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", (if Total = 0 then "none" elsif First_Row = Last_Row then
        "single" else "range"));
      Selection := Sel.With_Arg (Selection, "first_row", Long_Long_Integer (First_Row));
      Selection := Sel.With_Arg (Selection, "total", Long_Long_Integer (Total));
      Selection := Sel.With_Arg (Selection, "last_row", Long_Long_Integer (Last_Row));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Row_Range_Label;

   function Selection_Label
      (Context  : Humanize.Contexts.Context;
       Selected : Natural;
       Total    : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tables.Selection_Label (Selected => Selected, Total => Total);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tables.selection_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", (if Total = 0 then "no_rows" elsif Selected = 0 then "none" elsif
        Selected = Total then "all" else "some"));
      Selection := Sel.With_Arg (Selection, "total", Long_Long_Integer (Total));
      Selection := Sel.With_Arg (Selection, "selected", Long_Long_Integer (Selected));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Selection_Label;

   function Sort_Direction_Label
      (Context   : Humanize.Contexts.Context;
       Direction : Sort_Direction)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tables.Sort_Direction_Label (Direction => Direction);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tables.sort_direction_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "direction", Lower (Sort_Direction'Image (Direction)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Sort_Direction_Label;

   function Sort_Label
      (Context     : Humanize.Contexts.Context;
       Column_Name : String;
       Direction   : Sort_Direction)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tables.Sort_Label (Column_Name => Column_Name, Direction => Direction);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tables.sort_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "direction", Lower (Sort_Direction'Image (Direction)));
      Selection := Sel.With_Arg (Selection, "column_name", Humanize.Bounded_Text.Clean (Column_Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Sort_Label;

   function Sort_Label
      (Context     : Humanize.Contexts.Context;
       Column_Name : String;
       Direction   : Sort_Direction;
       Options     : Table_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tables.Sort_Label (Column_Name => Column_Name, Direction => Direction, Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Tables.Sort_Label (Column_Name => Column_Name, Direction => Direction);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Sort_Label (Context, Column_Name => Column_Name,
        Direction => Direction));
   end Sort_Label;

   function Subtotal_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Value   : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tables.Subtotal_Label (Name => Name, Value => Value);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tables.subtotal_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "value", Humanize.Bounded_Text.Clean (Value));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Subtotal_Label;

   function Table_Size_Label
      (Context : Humanize.Contexts.Context;
       Rows    : Natural;
       Columns : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Tables.Table_Size_Label (Rows => Rows, Columns => Columns);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.tables.table_size_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "columns", Long_Long_Integer (Columns));
      Selection := Sel.With_Arg (Selection, "rows", Long_Long_Integer (Rows));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Table_Size_Label;

   procedure Cell_Label_Into
      (Context : Humanize.Contexts.Context;
       Row     : Positive;
       Column  : Positive;
       State   : Cell_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Cell_Label (Context, Row => Row, Column => Column, State => State),
         Target, Written, Status);
   end Cell_Label_Into;

   procedure Cell_Label_Into
      (Context : Humanize.Contexts.Context;
       Row     : Positive;
       Column  : Positive;
       State   : Cell_State;
       Options : Table_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Cell_Label (Context, Row => Row, Column => Column, State => State, Options => Options),
         Target, Written, Status);
   end Cell_Label_Into;

   procedure Cell_Position_Label_Into
      (Context : Humanize.Contexts.Context;
       Row     : Positive;
       Column  : Positive;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Cell_Position_Label (Context, Row => Row, Column => Column),
         Target, Written, Status);
   end Cell_Position_Label_Into;

   procedure Cell_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Cell_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Cell_State_Label (Context, State => State), Target, Written, Status);
   end Cell_State_Label_Into;

   procedure Column_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Column_Count_Label (Context, Count => Count), Target, Written, Status);
   end Column_Count_Label_Into;

   procedure Column_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Role    : Column_Role := Text_Column;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Column_Label (Context, Name => Name, Role => Role), Target, Written, Status);
   end Column_Label_Into;

   procedure Column_Role_Label_Into
      (Context : Humanize.Contexts.Context;
       Role    : Column_Role;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Column_Role_Label (Context, Role => Role), Target, Written, Status);
   end Column_Role_Label_Into;

   procedure Filter_Label_Into
      (Context : Humanize.Contexts.Context;
       Visible : Natural;
       Total   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Filter_Label (Context, Visible => Visible, Total => Total),
         Target, Written, Status);
   end Filter_Label_Into;

   procedure Group_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Group_Label (Context, Name => Name, Count => Count), Target, Written, Status);
   end Group_Label_Into;

   procedure Page_Label_Into
      (Context : Humanize.Contexts.Context;
       Page    : Natural;
       Pages   : Natural;
       Rows    : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Page_Label (Context, Page => Page, Pages => Pages, Rows => Rows),
         Target, Written, Status);
   end Page_Label_Into;

   procedure Row_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Row_Count_Label (Context, Count => Count), Target, Written, Status);
   end Row_Count_Label_Into;

   procedure Row_Range_Label_Into
      (Context   : Humanize.Contexts.Context;
       First_Row : Natural;
       Last_Row  : Natural;
       Total     : Natural;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Row_Range_Label (Context, First_Row => First_Row, Last_Row => Last_Row, Total => Total),
         Target, Written, Status);
   end Row_Range_Label_Into;

   procedure Selection_Label_Into
      (Context  : Humanize.Contexts.Context;
       Selected : Natural;
       Total    : Natural;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Selection_Label (Context, Selected => Selected, Total => Total),
         Target, Written, Status);
   end Selection_Label_Into;

   procedure Sort_Direction_Label_Into
      (Context   : Humanize.Contexts.Context;
       Direction : Sort_Direction;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Sort_Direction_Label (Context, Direction => Direction),
         Target, Written, Status);
   end Sort_Direction_Label_Into;

   procedure Sort_Label_Into
      (Context     : Humanize.Contexts.Context;
       Column_Name : String;
       Direction   : Sort_Direction;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Sort_Label (Context, Column_Name => Column_Name, Direction => Direction),
         Target, Written, Status);
   end Sort_Label_Into;

   procedure Sort_Label_Into
      (Context     : Humanize.Contexts.Context;
       Column_Name : String;
       Direction   : Sort_Direction;
       Options     : Table_Label_Options;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Sort_Label (Context, Column_Name => Column_Name, Direction => Direction, Options => Options),
         Target, Written, Status);
   end Sort_Label_Into;

   procedure Subtotal_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Value   : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Subtotal_Label (Context, Name => Name, Value => Value),
         Target, Written, Status);
   end Subtotal_Label_Into;

   procedure Table_Size_Label_Into
      (Context : Humanize.Contexts.Context;
       Rows    : Natural;
       Columns : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Table_Size_Label (Context, Rows => Rows, Columns => Columns),
         Target, Written, Status);
   end Table_Size_Label_Into;

end Humanize.Tables.Localized;
