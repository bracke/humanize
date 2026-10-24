with Humanize.Contexts;

--  Changes labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Changes.Localized is

   function Boolean_Field_Change_Label
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Old_Value  : Boolean;
       New_Value  : Boolean)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Field_Name As for the parent's Boolean_Field_Change_Label.
   --  @param Old_Value As for the parent's Boolean_Field_Change_Label.
   --  @param New_Value As for the parent's Boolean_Field_Change_Label.
   --  @return The label in Context's locale.

   function Change_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Change_Kind)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Change_Kind_Label.
   --  @return The label in Context's locale.

   function Change_Severity_Label
      (Context  : Humanize.Contexts.Context;
       Severity : Change_Severity)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Severity As for the parent's Change_Severity_Label.
   --  @return The label in Context's locale.

   function Collection_Field_Change_Label
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Added      : Natural := 0;
       Removed    : Natural := 0;
       Unchanged  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Field_Name As for the parent's Collection_Field_Change_Label.
   --  @param Added As for the parent's Collection_Field_Change_Label.
   --  @param Removed As for the parent's Collection_Field_Change_Label.
   --  @param Unchanged As for the parent's Collection_Field_Change_Label.
   --  @return The label in Context's locale.

   function Conflict_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Conflict_Label.
   --  @return The label in Context's locale.

   function Date_Field_Change_Label
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Old_Label  : String;
       New_Label  : String;
       Earlier    : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Field_Name As for the parent's Date_Field_Change_Label.
   --  @param Old_Label As for the parent's Date_Field_Change_Label.
   --  @param New_Label As for the parent's Date_Field_Change_Label.
   --  @param Earlier As for the parent's Date_Field_Change_Label.
   --  @return The label in Context's locale.

   function Duration_Field_Change_Label
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Old_Label  : String;
       New_Label  : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Field_Name As for the parent's Duration_Field_Change_Label.
   --  @param Old_Label As for the parent's Duration_Field_Change_Label.
   --  @param New_Label As for the parent's Duration_Field_Change_Label.
   --  @return The label in Context's locale.

   function Field_Change_Label
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Old_Value  : String := "";
       New_Value  : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Field_Name As for the parent's Field_Change_Label.
   --  @param Old_Value As for the parent's Field_Change_Label.
   --  @param New_Value As for the parent's Field_Change_Label.
   --  @return The label in Context's locale.

   function Item_Change_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Change_Kind)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Item_Change_Label.
   --  @param Kind As for the parent's Item_Change_Label.
   --  @return The label in Context's locale.

   function Metadata_Only_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Metadata_Only_Label.
   --  @return The label in Context's locale.

   function Move_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       From    : String;
       To      : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Move_Label.
   --  @param From As for the parent's Move_Label.
   --  @param To As for the parent's Move_Label.
   --  @return The label in Context's locale.

   function No_Changes_Label
      (Context : Humanize.Contexts.Context)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @return The label in Context's locale.

   function Patch_Size_Label
      (Context       : Humanize.Contexts.Context;
       Lines_Added   : Natural := 0;
       Lines_Removed : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Lines_Added As for the parent's Patch_Size_Label.
   --  @param Lines_Removed As for the parent's Patch_Size_Label.
   --  @return The label in Context's locale.

   function Rename_Label
      (Context  : Humanize.Contexts.Context;
       Old_Name : String;
       New_Name : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Old_Name As for the parent's Rename_Label.
   --  @param New_Name As for the parent's Rename_Label.
   --  @return The label in Context's locale.

   procedure Boolean_Field_Change_Label_Into
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Old_Value  : Boolean;
       New_Value  : Boolean;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Field_Name As for the parent's Boolean_Field_Change_Label.
   --  @param Old_Value As for the parent's Boolean_Field_Change_Label.
   --  @param New_Value As for the parent's Boolean_Field_Change_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Change_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Change_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Change_Kind_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Change_Severity_Label_Into
      (Context  : Humanize.Contexts.Context;
       Severity : Change_Severity;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Severity As for the parent's Change_Severity_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Collection_Field_Change_Label_Into
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Added      : Natural := 0;
       Removed    : Natural := 0;
       Unchanged  : Natural := 0;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Field_Name As for the parent's Collection_Field_Change_Label.
   --  @param Added As for the parent's Collection_Field_Change_Label.
   --  @param Removed As for the parent's Collection_Field_Change_Label.
   --  @param Unchanged As for the parent's Collection_Field_Change_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Conflict_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Conflict_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Date_Field_Change_Label_Into
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Old_Label  : String;
       New_Label  : String;
       Earlier    : Boolean := False;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Field_Name As for the parent's Date_Field_Change_Label.
   --  @param Old_Label As for the parent's Date_Field_Change_Label.
   --  @param New_Label As for the parent's Date_Field_Change_Label.
   --  @param Earlier As for the parent's Date_Field_Change_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Duration_Field_Change_Label_Into
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Old_Label  : String;
       New_Label  : String;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Field_Name As for the parent's Duration_Field_Change_Label.
   --  @param Old_Label As for the parent's Duration_Field_Change_Label.
   --  @param New_Label As for the parent's Duration_Field_Change_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Field_Change_Label_Into
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Old_Value  : String := "";
       New_Value  : String := "";
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Field_Name As for the parent's Field_Change_Label.
   --  @param Old_Value As for the parent's Field_Change_Label.
   --  @param New_Value As for the parent's Field_Change_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Item_Change_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Change_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Item_Change_Label.
   --  @param Kind As for the parent's Item_Change_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Metadata_Only_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Metadata_Only_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Move_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       From    : String;
       To      : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Move_Label.
   --  @param From As for the parent's Move_Label.
   --  @param To As for the parent's Move_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure No_Changes_Label_Into
      (Context : Humanize.Contexts.Context;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Patch_Size_Label_Into
      (Context       : Humanize.Contexts.Context;
       Lines_Added   : Natural := 0;
       Lines_Removed : Natural := 0;
       Target        : in out String;
       Written       : out Natural;
       Status        : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Lines_Added As for the parent's Patch_Size_Label.
   --  @param Lines_Removed As for the parent's Patch_Size_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Rename_Label_Into
      (Context  : Humanize.Contexts.Context;
       Old_Name : String;
       New_Name : String;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Old_Name As for the parent's Rename_Label.
   --  @param New_Name As for the parent's Rename_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Changes.Localized;
