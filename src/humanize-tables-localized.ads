with Humanize.Contexts;

--  Tables labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Tables.Localized is

   function Cell_Label
      (Context : Humanize.Contexts.Context;
       Row     : Positive;
       Column  : Positive;
       State   : Cell_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Row As for the parent's Cell_Label.
   --  @param Column As for the parent's Cell_Label.
   --  @param State As for the parent's Cell_Label.
   --  @return The label in Context's locale.

   function Cell_Label
      (Context : Humanize.Contexts.Context;
       Row     : Positive;
       Column  : Positive;
       State   : Cell_State;
       Options : Table_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Row As for the parent's Cell_Label.
   --  @param Column As for the parent's Cell_Label.
   --  @param State As for the parent's Cell_Label.
   --  @param Options As for the parent's Cell_Label.
   --  @return The label in Context's locale.

   function Cell_Position_Label
      (Context : Humanize.Contexts.Context;
       Row     : Positive;
       Column  : Positive)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Row As for the parent's Cell_Position_Label.
   --  @param Column As for the parent's Cell_Position_Label.
   --  @return The label in Context's locale.

   function Cell_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Cell_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Cell_State_Label.
   --  @return The label in Context's locale.

   function Column_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Column_Count_Label.
   --  @return The label in Context's locale.

   function Column_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Role    : Column_Role := Text_Column)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Column_Label.
   --  @param Role As for the parent's Column_Label.
   --  @return The label in Context's locale.

   function Column_Role_Label
      (Context : Humanize.Contexts.Context;
       Role    : Column_Role)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Role As for the parent's Column_Role_Label.
   --  @return The label in Context's locale.

   function Filter_Label
      (Context : Humanize.Contexts.Context;
       Visible : Natural;
       Total   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Visible As for the parent's Filter_Label.
   --  @param Total As for the parent's Filter_Label.
   --  @return The label in Context's locale.

   function Group_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Group_Label.
   --  @param Count As for the parent's Group_Label.
   --  @return The label in Context's locale.

   function Page_Label
      (Context : Humanize.Contexts.Context;
       Page    : Natural;
       Pages   : Natural;
       Rows    : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Page As for the parent's Page_Label.
   --  @param Pages As for the parent's Page_Label.
   --  @param Rows As for the parent's Page_Label.
   --  @return The label in Context's locale.

   function Row_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Row_Count_Label.
   --  @return The label in Context's locale.

   function Row_Range_Label
      (Context   : Humanize.Contexts.Context;
       First_Row : Natural;
       Last_Row  : Natural;
       Total     : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param First_Row As for the parent's Row_Range_Label.
   --  @param Last_Row As for the parent's Row_Range_Label.
   --  @param Total As for the parent's Row_Range_Label.
   --  @return The label in Context's locale.

   function Selection_Label
      (Context  : Humanize.Contexts.Context;
       Selected : Natural;
       Total    : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Selected As for the parent's Selection_Label.
   --  @param Total As for the parent's Selection_Label.
   --  @return The label in Context's locale.

   function Sort_Direction_Label
      (Context   : Humanize.Contexts.Context;
       Direction : Sort_Direction)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Direction As for the parent's Sort_Direction_Label.
   --  @return The label in Context's locale.

   function Sort_Label
      (Context     : Humanize.Contexts.Context;
       Column_Name : String;
       Direction   : Sort_Direction)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Column_Name As for the parent's Sort_Label.
   --  @param Direction As for the parent's Sort_Label.
   --  @return The label in Context's locale.

   function Sort_Label
      (Context     : Humanize.Contexts.Context;
       Column_Name : String;
       Direction   : Sort_Direction;
       Options     : Table_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Column_Name As for the parent's Sort_Label.
   --  @param Direction As for the parent's Sort_Label.
   --  @param Options As for the parent's Sort_Label.
   --  @return The label in Context's locale.

   function Subtotal_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Value   : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Subtotal_Label.
   --  @param Value As for the parent's Subtotal_Label.
   --  @return The label in Context's locale.

   function Table_Size_Label
      (Context : Humanize.Contexts.Context;
       Rows    : Natural;
       Columns : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Rows As for the parent's Table_Size_Label.
   --  @param Columns As for the parent's Table_Size_Label.
   --  @return The label in Context's locale.

   procedure Cell_Label_Into
      (Context : Humanize.Contexts.Context;
       Row     : Positive;
       Column  : Positive;
       State   : Cell_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Row As for the parent's Cell_Label.
   --  @param Column As for the parent's Cell_Label.
   --  @param State As for the parent's Cell_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Cell_Label_Into
      (Context : Humanize.Contexts.Context;
       Row     : Positive;
       Column  : Positive;
       State   : Cell_State;
       Options : Table_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Row As for the parent's Cell_Label.
   --  @param Column As for the parent's Cell_Label.
   --  @param State As for the parent's Cell_Label.
   --  @param Options As for the parent's Cell_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Cell_Position_Label_Into
      (Context : Humanize.Contexts.Context;
       Row     : Positive;
       Column  : Positive;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Row As for the parent's Cell_Position_Label.
   --  @param Column As for the parent's Cell_Position_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Cell_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Cell_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Cell_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Column_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Column_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Column_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Role    : Column_Role := Text_Column;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Column_Label.
   --  @param Role As for the parent's Column_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Column_Role_Label_Into
      (Context : Humanize.Contexts.Context;
       Role    : Column_Role;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Role As for the parent's Column_Role_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Filter_Label_Into
      (Context : Humanize.Contexts.Context;
       Visible : Natural;
       Total   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Visible As for the parent's Filter_Label.
   --  @param Total As for the parent's Filter_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Group_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Group_Label.
   --  @param Count As for the parent's Group_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Page_Label_Into
      (Context : Humanize.Contexts.Context;
       Page    : Natural;
       Pages   : Natural;
       Rows    : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Page As for the parent's Page_Label.
   --  @param Pages As for the parent's Page_Label.
   --  @param Rows As for the parent's Page_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Row_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Row_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Row_Range_Label_Into
      (Context   : Humanize.Contexts.Context;
       First_Row : Natural;
       Last_Row  : Natural;
       Total     : Natural;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param First_Row As for the parent's Row_Range_Label.
   --  @param Last_Row As for the parent's Row_Range_Label.
   --  @param Total As for the parent's Row_Range_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Selection_Label_Into
      (Context  : Humanize.Contexts.Context;
       Selected : Natural;
       Total    : Natural;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Selected As for the parent's Selection_Label.
   --  @param Total As for the parent's Selection_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Sort_Direction_Label_Into
      (Context   : Humanize.Contexts.Context;
       Direction : Sort_Direction;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Direction As for the parent's Sort_Direction_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Sort_Label_Into
      (Context     : Humanize.Contexts.Context;
       Column_Name : String;
       Direction   : Sort_Direction;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Column_Name As for the parent's Sort_Label.
   --  @param Direction As for the parent's Sort_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Sort_Label_Into
      (Context     : Humanize.Contexts.Context;
       Column_Name : String;
       Direction   : Sort_Direction;
       Options     : Table_Label_Options;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Column_Name As for the parent's Sort_Label.
   --  @param Direction As for the parent's Sort_Label.
   --  @param Options As for the parent's Sort_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Subtotal_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Value   : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Subtotal_Label.
   --  @param Value As for the parent's Subtotal_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Table_Size_Label_Into
      (Context : Humanize.Contexts.Context;
       Rows    : Natural;
       Columns : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Rows As for the parent's Table_Size_Label.
   --  @param Columns As for the parent's Table_Size_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Tables.Localized;
