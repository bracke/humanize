with Humanize.Contexts;

--  Privacy labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Strings.Privacy.Localized is

   function Address_Metadata_Label
      (Context : Humanize.Contexts.Context;
       Address : Address_Fields)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Address As for the parent's Address_Metadata_Label.
   --  @return The label in Context's locale.

   function Code_Symbol_Label
      (Context : Humanize.Contexts.Context;
       Symbol  : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Symbol As for the parent's Code_Symbol_Label.
   --  @return The label in Context's locale.

   function Safe_Email_Label
      (Context : Humanize.Contexts.Context;
       Email   : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Email As for the parent's Safe_Email_Label.
   --  @return The label in Context's locale.

   function Safe_Handle_Label
      (Context : Humanize.Contexts.Context;
       Handle  : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Handle As for the parent's Safe_Handle_Label.
   --  @return The label in Context's locale.

   function Safe_Phone_Label
      (Context        : Humanize.Contexts.Context;
       Phone          : String;
       Visible_Digits : Natural := 4)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Phone As for the parent's Safe_Phone_Label.
   --  @param Visible_Digits As for the parent's Safe_Phone_Label.
   --  @return The label in Context's locale.

   procedure Address_Metadata_Label_Into
      (Context : Humanize.Contexts.Context;
       Address : Address_Fields;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Address As for the parent's Address_Metadata_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Code_Symbol_Label_Into
      (Context : Humanize.Contexts.Context;
       Symbol  : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Symbol As for the parent's Code_Symbol_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Safe_Email_Label_Into
      (Context : Humanize.Contexts.Context;
       Email   : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Email As for the parent's Safe_Email_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Safe_Handle_Label_Into
      (Context : Humanize.Contexts.Context;
       Handle  : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Handle As for the parent's Safe_Handle_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Safe_Phone_Label_Into
      (Context        : Humanize.Contexts.Context;
       Phone          : String;
       Visible_Digits : Natural := 4;
       Target         : in out String;
       Written        : out Natural;
       Status         : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Phone As for the parent's Safe_Phone_Label.
   --  @param Visible_Digits As for the parent's Safe_Phone_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Strings.Privacy.Localized;
