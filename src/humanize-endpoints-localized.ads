with Humanize.Contexts;

--  Endpoints labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Endpoints.Localized is

   function CIDR_Label
      (Context : Humanize.Contexts.Context;
       CIDR    : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param CIDR As for the parent's CIDR_Label.
   --  @return The label in Context's locale.

   function Endpoint_Label
      (Context : Humanize.Contexts.Context;
       Host    : String;
       Port    : Port_Number := 0;
       Scheme  : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Host As for the parent's Endpoint_Label.
   --  @param Port As for the parent's Endpoint_Label.
   --  @param Scheme As for the parent's Endpoint_Label.
   --  @return The label in Context's locale.

   function Endpoint_Label
      (Context : Humanize.Contexts.Context;
       Host    : String;
       Options : Endpoint_Label_Options;
       Port    : Port_Number := 0;
       Scheme  : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Host As for the parent's Endpoint_Label.
   --  @param Options As for the parent's Endpoint_Label.
   --  @param Port As for the parent's Endpoint_Label.
   --  @param Scheme As for the parent's Endpoint_Label.
   --  @return The label in Context's locale.

   function Host_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Host_Kind)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Host_Kind_Label.
   --  @return The label in Context's locale.

   function Host_Label
      (Context : Humanize.Contexts.Context;
       Host    : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Host As for the parent's Host_Label.
   --  @return The label in Context's locale.

   function Host_Label
      (Context : Humanize.Contexts.Context;
       Host    : String;
       Options : Endpoint_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Host As for the parent's Host_Label.
   --  @param Options As for the parent's Host_Label.
   --  @return The label in Context's locale.

   function IP_Address_Label
      (Context : Humanize.Contexts.Context;
       Address : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Address As for the parent's IP_Address_Label.
   --  @return The label in Context's locale.

   function Query_Summary
      (Context : Humanize.Contexts.Context;
       URL     : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param URL As for the parent's Query_Summary.
   --  @return The label in Context's locale.

   function Safe_URL_Label
      (Context : Humanize.Contexts.Context;
       URL     : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param URL As for the parent's Safe_URL_Label.
   --  @return The label in Context's locale.

   function URL_Component_Summary
      (Context : Humanize.Contexts.Context;
       URL     : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param URL As for the parent's URL_Component_Summary.
   --  @return The label in Context's locale.

   function URL_Label
      (Context : Humanize.Contexts.Context;
       URL     : String;
       Options : URL_Display_Options := Default_URL_Display_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param URL As for the parent's URL_Label.
   --  @param Options As for the parent's URL_Label.
   --  @return The label in Context's locale.

   procedure CIDR_Label_Into
      (Context : Humanize.Contexts.Context;
       CIDR    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param CIDR As for the parent's CIDR_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Endpoint_Label_Into
      (Context : Humanize.Contexts.Context;
       Host    : String;
       Port    : Port_Number := 0;
       Scheme  : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Host As for the parent's Endpoint_Label.
   --  @param Port As for the parent's Endpoint_Label.
   --  @param Scheme As for the parent's Endpoint_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Endpoint_Label_Into
      (Context : Humanize.Contexts.Context;
       Host    : String;
       Options : Endpoint_Label_Options;
       Port    : Port_Number := 0;
       Scheme  : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Host As for the parent's Endpoint_Label.
   --  @param Options As for the parent's Endpoint_Label.
   --  @param Port As for the parent's Endpoint_Label.
   --  @param Scheme As for the parent's Endpoint_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Host_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Host_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Host_Kind_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Host_Label_Into
      (Context : Humanize.Contexts.Context;
       Host    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Host As for the parent's Host_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Host_Label_Into
      (Context : Humanize.Contexts.Context;
       Host    : String;
       Options : Endpoint_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Host As for the parent's Host_Label.
   --  @param Options As for the parent's Host_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure IP_Address_Label_Into
      (Context : Humanize.Contexts.Context;
       Address : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Address As for the parent's IP_Address_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Query_Summary_Into
      (Context : Humanize.Contexts.Context;
       URL     : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param URL As for the parent's Query_Summary.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Safe_URL_Label_Into
      (Context : Humanize.Contexts.Context;
       URL     : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param URL As for the parent's Safe_URL_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure URL_Component_Summary_Into
      (Context : Humanize.Contexts.Context;
       URL     : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param URL As for the parent's URL_Component_Summary.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure URL_Label_Into
      (Context : Humanize.Contexts.Context;
       URL     : String;
       Options : URL_Display_Options := Default_URL_Display_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param URL As for the parent's URL_Label.
   --  @param Options As for the parent's URL_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Endpoints.Localized;
