with Humanize.Contexts;

--  Navigation labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Navigation.Localized is

   function Back_Label
      (Context : Humanize.Contexts.Context;
       Target  : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Target As for the parent's Back_Label.
   --  @return The label in Context's locale.

   function Breadcrumb_Position_Label
      (Context : Humanize.Contexts.Context;
       Current : Natural;
       Total   : Natural;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Current As for the parent's Breadcrumb_Position_Label.
   --  @param Total As for the parent's Breadcrumb_Position_Label.
   --  @param Name As for the parent's Breadcrumb_Position_Label.
   --  @return The label in Context's locale.

   function Breadcrumb_Trail_Label
      (Context : Humanize.Contexts.Context;
       Depth   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Depth As for the parent's Breadcrumb_Trail_Label.
   --  @return The label in Context's locale.

   function Current_Page_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Current_Page_Label.
   --  @return The label in Context's locale.

   function External_Link_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's External_Link_Label.
   --  @return The label in Context's locale.

   function First_Label
      (Context : Humanize.Contexts.Context;
       Target  : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Target As for the parent's First_Label.
   --  @return The label in Context's locale.

   function Last_Label
      (Context : Humanize.Contexts.Context;
       Target  : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Target As for the parent's Last_Label.
   --  @return The label in Context's locale.

   function Menu_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Menu_Count_Label.
   --  @return The label in Context's locale.

   function Navigation_Item_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Navigation_Item_Kind)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Navigation_Item_Kind_Label.
   --  @return The label in Context's locale.

   function Navigation_Item_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Navigation_Item_Kind := Link_Item;
       State   : Navigation_State := Inactive_Item)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Navigation_Item_Label.
   --  @param Kind As for the parent's Navigation_Item_Label.
   --  @param State As for the parent's Navigation_Item_Label.
   --  @return The label in Context's locale.

   function Navigation_Item_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Navigation_Item_Kind;
       State   : Navigation_State;
       Options : Navigation_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Navigation_Item_Label.
   --  @param Kind As for the parent's Navigation_Item_Label.
   --  @param State As for the parent's Navigation_Item_Label.
   --  @param Options As for the parent's Navigation_Item_Label.
   --  @return The label in Context's locale.

   function Navigation_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Navigation_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Navigation_State_Label.
   --  @return The label in Context's locale.

   function Next_Label
      (Context : Humanize.Contexts.Context;
       Target  : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Target As for the parent's Next_Label.
   --  @return The label in Context's locale.

   function Section_State_Label
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Expanded : Boolean;
       Count    : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Section_State_Label.
   --  @param Expanded As for the parent's Section_State_Label.
   --  @param Count As for the parent's Section_State_Label.
   --  @return The label in Context's locale.

   function Skip_Link_Label
      (Context : Humanize.Contexts.Context;
       Target  : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Target As for the parent's Skip_Link_Label.
   --  @return The label in Context's locale.

   function Submenu_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Submenu_Label.
   --  @param Count As for the parent's Submenu_Label.
   --  @return The label in Context's locale.

   function Tab_Label
      (Context : Humanize.Contexts.Context;
       Current : Natural;
       Total   : Natural;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Current As for the parent's Tab_Label.
   --  @param Total As for the parent's Tab_Label.
   --  @param Name As for the parent's Tab_Label.
   --  @return The label in Context's locale.

   procedure Breadcrumb_Position_Label_Into
      (Context : Humanize.Contexts.Context;
       Current : Natural;
       Total   : Natural;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Current As for the parent's Breadcrumb_Position_Label.
   --  @param Total As for the parent's Breadcrumb_Position_Label.
   --  @param Name As for the parent's Breadcrumb_Position_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Breadcrumb_Trail_Label_Into
      (Context : Humanize.Contexts.Context;
       Depth   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Depth As for the parent's Breadcrumb_Trail_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Current_Page_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Current_Page_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure External_Link_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's External_Link_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Menu_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Menu_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Navigation_Item_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Navigation_Item_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Navigation_Item_Kind_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Navigation_Item_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Navigation_Item_Kind := Link_Item;
       State   : Navigation_State := Inactive_Item;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Navigation_Item_Label.
   --  @param Kind As for the parent's Navigation_Item_Label.
   --  @param State As for the parent's Navigation_Item_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Navigation_Item_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Navigation_Item_Kind;
       State   : Navigation_State;
       Options : Navigation_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Navigation_Item_Label.
   --  @param Kind As for the parent's Navigation_Item_Label.
   --  @param State As for the parent's Navigation_Item_Label.
   --  @param Options As for the parent's Navigation_Item_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Navigation_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Navigation_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Navigation_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Section_State_Label_Into
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Expanded : Boolean;
       Count    : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Section_State_Label.
   --  @param Expanded As for the parent's Section_State_Label.
   --  @param Count As for the parent's Section_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Submenu_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Submenu_Label.
   --  @param Count As for the parent's Submenu_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Tab_Label_Into
      (Context : Humanize.Contexts.Context;
       Current : Natural;
       Total   : Natural;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Current As for the parent's Tab_Label.
   --  @param Total As for the parent's Tab_Label.
   --  @param Name As for the parent's Tab_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Navigation.Localized;
