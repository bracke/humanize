with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Selections;

package body Humanize.Navigation.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Back_Label
      (Context : Humanize.Contexts.Context;
       Target  : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Navigation.Back_Label (Target => Target);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.navigation.back_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "target", Humanize.Bounded_Text.Clean (Target));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Back_Label;

   function Breadcrumb_Trail_Label
      (Context : Humanize.Contexts.Context;
       Depth   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Navigation.Breadcrumb_Trail_Label (Depth => Depth);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.navigation.breadcrumb_trail_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "depth", Long_Long_Integer (Depth));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Breadcrumb_Trail_Label;

   function Current_Page_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Navigation.Current_Page_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.navigation.current_page_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Current_Page_Label;

   function External_Link_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Navigation.External_Link_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.navigation.external_link_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end External_Link_Label;

   function First_Label
      (Context : Humanize.Contexts.Context;
       Target  : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Navigation.First_Label (Target => Target);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.navigation.first_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "target", Humanize.Bounded_Text.Clean (Target));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end First_Label;

   function Last_Label
      (Context : Humanize.Contexts.Context;
       Target  : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Navigation.Last_Label (Target => Target);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.navigation.last_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "target", Humanize.Bounded_Text.Clean (Target));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Last_Label;

   function Menu_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Navigation.Menu_Count_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.navigation.menu_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Menu_Count_Label;

   function Navigation_Item_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Navigation_Item_Kind)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Navigation.Navigation_Item_Kind_Label (Kind => Kind);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.navigation.navigation_item_kind_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "kind", Lower (Navigation_Item_Kind'Image (Kind)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Navigation_Item_Kind_Label;

   function Navigation_Item_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Navigation_Item_Kind := Link_Item;
       State   : Navigation_State := Inactive_Item)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Navigation.Navigation_Item_Label (Name => Name, Kind => Kind, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.navigation.navigation_item_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "kind", Lower (Navigation_Item_Kind'Image (Kind)));
      Selection := Sel.With_Arg (Selection, "state", Lower (Navigation_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Navigation_Item_Label;

   function Navigation_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Navigation_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Navigation.Navigation_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.navigation.navigation_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Navigation_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Navigation_State_Label;

   function Next_Label
      (Context : Humanize.Contexts.Context;
       Target  : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Navigation.Next_Label (Target => Target);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.navigation.next_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "target", Humanize.Bounded_Text.Clean (Target));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Next_Label;

   function Section_State_Label
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Expanded : Boolean;
       Count    : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Navigation.Section_State_Label (Name => Name, Expanded => Expanded, Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.navigation.section_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "expanded", Lower (Boolean'Image (Expanded)));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Section_State_Label;

   function Skip_Link_Label
      (Context : Humanize.Contexts.Context;
       Target  : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Navigation.Skip_Link_Label (Target => Target);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.navigation.skip_link_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "target", Humanize.Bounded_Text.Clean (Target));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Skip_Link_Label;

   function Submenu_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Navigation.Submenu_Label (Name => Name, Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.navigation.submenu_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Submenu_Label;

   procedure Breadcrumb_Trail_Label_Into
      (Context : Humanize.Contexts.Context;
       Depth   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Breadcrumb_Trail_Label (Context, Depth), Target, Written, Status);
   end Breadcrumb_Trail_Label_Into;

   procedure Current_Page_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Current_Page_Label (Context, Name), Target, Written, Status);
   end Current_Page_Label_Into;

   procedure External_Link_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (External_Link_Label (Context, Name), Target, Written, Status);
   end External_Link_Label_Into;

   procedure Menu_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Menu_Count_Label (Context, Count), Target, Written, Status);
   end Menu_Count_Label_Into;

   procedure Navigation_Item_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Navigation_Item_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Navigation_Item_Kind_Label (Context, Kind), Target, Written, Status);
   end Navigation_Item_Kind_Label_Into;

   procedure Navigation_Item_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Navigation_Item_Kind := Link_Item;
       State   : Navigation_State := Inactive_Item;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Navigation_Item_Label (Context, Name, Kind, State), Target, Written, Status);
   end Navigation_Item_Label_Into;

   procedure Navigation_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Navigation_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Navigation_State_Label (Context, State), Target, Written, Status);
   end Navigation_State_Label_Into;

   procedure Section_State_Label_Into
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Expanded : Boolean;
       Count    : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Section_State_Label (Context, Name, Expanded, Count), Target, Written, Status);
   end Section_State_Label_Into;

   procedure Submenu_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Submenu_Label (Context, Name, Count), Target, Written, Status);
   end Submenu_Label_Into;

end Humanize.Navigation.Localized;
