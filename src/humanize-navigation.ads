with Humanize.Domain_Details;
with Humanize.Status;

--  Human-readable labels for navigation, menu, tab, and breadcrumb metadata.
package Humanize.Navigation is

   type Navigation_Output_Mode is
     (Navigation_Detailed, Navigation_Compact,
      Navigation_Accessible, Navigation_Log);

   type Navigation_Label_Options is record
      Mode             : Navigation_Output_Mode := Navigation_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;

   Default_Navigation_Label_Options : constant Navigation_Label_Options :=
     (Mode             => Navigation_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Navigation_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;

   type Navigation_State is
     (Current_Item,
      Active_Item,
      Inactive_Item,
      Disabled_Item,
      Expanded_Item,
      Collapsed_Item,
      Visited_Item,
      External_Item);
   --  Caller-supplied navigation item state.

   type Navigation_Item_Kind is
     (Link_Item,
      Menu_Item,
      Tab_Item,
      Breadcrumb_Item,
      Section_Item,
      Separator_Item);
   --  Caller-supplied navigation item kind.

   function Navigation_State_Label
     (State : Navigation_State)
      return Humanize.Status.Text_Result;
   --  @param State Navigation item state.
   --  @return Human-readable navigation-state label.

   function Navigation_Item_Kind_Label
     (Kind : Navigation_Item_Kind)
      return Humanize.Status.Text_Result;
   --  @param Kind Navigation item kind.
   --  @return Human-readable navigation item-kind label.

   function Navigation_Item_Label
     (Name  : String;
      Kind  : Navigation_Item_Kind := Link_Item;
      State : Navigation_State := Inactive_Item)
      return Humanize.Status.Text_Result;
   --  @param Name Navigation item label.
   --  @param Kind Navigation item kind.
   --  @param State Navigation item state.
   --  @return Human-readable navigation item label.

   function Navigation_Item_Label
     (Name    : String;
      Kind    : Navigation_Item_Kind;
      State   : Navigation_State;
      Options : Navigation_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Navigation item label.
   --  @param Kind Navigation item kind.
   --  @param State Navigation item state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable navigation item label with optional metadata.

   function Navigation_State_Metadata
     (State : Navigation_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Navigation item state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Parse_Navigation_Item_Label
     (Text  : String;
      Kind  : Navigation_Item_Kind;
      State : Navigation_State)
      return Navigation_Label_Parse_Result;
   --  @param Text Label in rendered navigation-item form.
   --  @param Kind Expected navigation item kind.
   --  @param State Expected navigation state.
   --  @return Parsed item name span, state span, metadata, and consumed length.

   function Scan_Navigation_Item_Label
     (Text  : String;
      Kind  : Navigation_Item_Kind;
      State : Navigation_State)
      return Navigation_Label_Parse_Result;
   --  @param Text Text beginning with a navigation item label.
   --  @param Kind Expected navigation item kind.
   --  @param State Expected navigation state.
   --  @return Parsed label span and consumed prefix length.

   function Current_Page_Label
     (Name : String)
      return Humanize.Status.Text_Result;
   --  @param Name Page name.
   --  @return Human-readable current-page label.

   function Breadcrumb_Position_Label
     (Current : Natural;
      Total   : Natural;
      Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Current Current 1-based breadcrumb position.
   --  @param Total Total breadcrumb count.
   --  @param Name Optional breadcrumb label.
   --  @return Human-readable breadcrumb position label.

   function Breadcrumb_Trail_Label
     (Depth : Natural)
      return Humanize.Status.Text_Result;
   --  @param Depth Breadcrumb trail depth.
   --  @return Human-readable breadcrumb trail label.

   function Tab_Label
     (Current : Natural;
      Total   : Natural;
      Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Current Current 1-based tab position.
   --  @param Total Total tab count.
   --  @param Name Optional tab label.
   --  @return Human-readable tab position label.

   function Menu_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Menu item count.
   --  @return Human-readable menu item-count label.

   function Submenu_Label
     (Name  : String;
      Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Name Submenu name.
   --  @param Count Submenu item count.
   --  @return Human-readable submenu label.

   function External_Link_Label
     (Name : String)
      return Humanize.Status.Text_Result;
   --  @param Name Link label.
   --  @return Human-readable external-link label.

   function Skip_Link_Label
     (Target : String)
      return Humanize.Status.Text_Result;
   --  @param Target Skip-link target.
   --  @return Human-readable skip-link label.

   function Back_Label
     (Target : String := "")
      return Humanize.Status.Text_Result;
   --  @param Target Optional target label.
   --  @return Human-readable back navigation label.

   function Next_Label
     (Target : String := "")
      return Humanize.Status.Text_Result;
   --  @param Target Optional target label.
   --  @return Human-readable next navigation label.

   function First_Label
     (Target : String := "")
      return Humanize.Status.Text_Result;
   --  @param Target Optional target label.
   --  @return Human-readable first navigation label.

   function Last_Label
     (Target : String := "")
      return Humanize.Status.Text_Result;
   --  @param Target Optional target label.
   --  @return Human-readable last navigation label.

   function Section_State_Label
     (Name     : String;
      Expanded : Boolean;
      Count    : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Name Navigation section name.
   --  @param Expanded Whether the section is expanded.
   --  @param Count Optional visible/hidden child count.
   --  @return Human-readable navigation section-state label.

   procedure Navigation_State_Label_Into
     (State   : Navigation_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Navigation item state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Navigation_Item_Kind_Label_Into
     (Kind    : Navigation_Item_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Kind Navigation item kind.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Navigation_Item_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : Navigation_Item_Kind := Link_Item;
      State   : Navigation_State := Inactive_Item);
   --  @param Name Navigation item label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Kind Navigation item kind.
   --  @param State Navigation item state.

   procedure Navigation_Item_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : Navigation_Item_Kind;
      State   : Navigation_State;
      Options : Navigation_Label_Options);
   --  @param Name Navigation item label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Kind Navigation item kind.
   --  @param State Navigation item state.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Current_Page_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Page name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Breadcrumb_Position_Label_Into
     (Current : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Current Current 1-based breadcrumb position.
   --  @param Total Total breadcrumb count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional breadcrumb label.

   procedure Breadcrumb_Trail_Label_Into
     (Depth   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Depth Breadcrumb trail depth.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Tab_Label_Into
     (Current : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Current Current 1-based tab position.
   --  @param Total Total tab count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional tab label.

   procedure Menu_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Menu item count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Submenu_Label_Into
     (Name    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Submenu name.
   --  @param Count Submenu item count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure External_Link_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Link label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Skip_Link_Label_Into
     (Skip_Target : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code);
   --  @param Skip_Target Skip-link target.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Back_Label_Into
     (Target_Label : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code);
   --  @param Target_Label Optional target label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Next_Label_Into
     (Target_Label : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code);
   --  @param Target_Label Optional target label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure First_Label_Into
     (Target_Label : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code);
   --  @param Target_Label Optional target label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Last_Label_Into
     (Target_Label : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code);
   --  @param Target_Label Optional target label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Section_State_Label_Into
     (Name     : String;
      Expanded : Boolean;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Count    : Natural := 0);
   --  @param Name Navigation section name.
   --  @param Expanded Whether the section is expanded.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Count Optional visible/hidden child count.

end Humanize.Navigation;
