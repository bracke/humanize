with Humanize.Contexts;

--  Schema labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Schema.Localized is

   function Array_Shape_Label
      (Context      : Humanize.Contexts.Context;
       Element_Type : Field_Type;
       Count        : Natural := 0;
       Count_Known  : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Element_Type As for the parent's Array_Shape_Label.
   --  @param Count As for the parent's Array_Shape_Label.
   --  @param Count_Known As for the parent's Array_Shape_Label.
   --  @return The label in Context's locale.

   function Constraint_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Value   : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Constraint_Label.
   --  @param Value As for the parent's Constraint_Label.
   --  @return The label in Context's locale.

   function Default_Value_Label
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Value      : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Field_Name As for the parent's Default_Value_Label.
   --  @param Value As for the parent's Default_Value_Label.
   --  @return The label in Context's locale.

   function Deprecated_Field_Label
      (Context     : Humanize.Contexts.Context;
       Name        : String;
       Replacement : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Deprecated_Field_Label.
   --  @param Replacement As for the parent's Deprecated_Field_Label.
   --  @return The label in Context's locale.

   function Enum_Options_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Enum_Options_Label.
   --  @return The label in Context's locale.

   function Example_Value_Label
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Value      : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Field_Name As for the parent's Example_Value_Label.
   --  @param Value As for the parent's Example_Value_Label.
   --  @return The label in Context's locale.

   function Field_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Field_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Field_State_Label.
   --  @return The label in Context's locale.

   function Field_Type_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Field_Type)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Field_Type_Label.
   --  @return The label in Context's locale.

   function Missing_Required_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Missing_Required_Label.
   --  @return The label in Context's locale.

   function Object_Shape_Label
      (Context  : Humanize.Contexts.Context;
       Fields   : Natural;
       Required : Natural := 0;
       Optional : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Fields As for the parent's Object_Shape_Label.
   --  @param Required As for the parent's Object_Shape_Label.
   --  @param Optional As for the parent's Object_Shape_Label.
   --  @return The label in Context's locale.

   function Schema_Source_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Version : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Schema_Source_Label.
   --  @param Version As for the parent's Schema_Source_Label.
   --  @return The label in Context's locale.

   function Shape_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Shape_Kind;
       Count   : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Shape_Label.
   --  @param Count As for the parent's Shape_Label.
   --  @return The label in Context's locale.

   function Unknown_Field_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Unknown_Field_Label.
   --  @return The label in Context's locale.

   procedure Array_Shape_Label_Into
      (Context      : Humanize.Contexts.Context;
       Element_Type : Field_Type;
       Count        : Natural := 0;
       Count_Known  : Boolean := False;
       Target       : in out String;
       Written      : out Natural;
       Status       : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Element_Type As for the parent's Array_Shape_Label.
   --  @param Count As for the parent's Array_Shape_Label.
   --  @param Count_Known As for the parent's Array_Shape_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Constraint_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Value   : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Constraint_Label.
   --  @param Value As for the parent's Constraint_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Default_Value_Label_Into
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Value      : String;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Field_Name As for the parent's Default_Value_Label.
   --  @param Value As for the parent's Default_Value_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Deprecated_Field_Label_Into
      (Context     : Humanize.Contexts.Context;
       Name        : String;
       Replacement : String := "";
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Deprecated_Field_Label.
   --  @param Replacement As for the parent's Deprecated_Field_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Enum_Options_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Enum_Options_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Example_Value_Label_Into
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Value      : String;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Field_Name As for the parent's Example_Value_Label.
   --  @param Value As for the parent's Example_Value_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Field_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Field_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Field_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Field_Type_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Field_Type;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Field_Type_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Missing_Required_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Missing_Required_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Object_Shape_Label_Into
      (Context  : Humanize.Contexts.Context;
       Fields   : Natural;
       Required : Natural := 0;
       Optional : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Fields As for the parent's Object_Shape_Label.
   --  @param Required As for the parent's Object_Shape_Label.
   --  @param Optional As for the parent's Object_Shape_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Schema_Source_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Version : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Schema_Source_Label.
   --  @param Version As for the parent's Schema_Source_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Shape_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Shape_Kind;
       Count   : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Shape_Label.
   --  @param Count As for the parent's Shape_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Unknown_Field_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Unknown_Field_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Schema.Localized;
