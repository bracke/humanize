with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.Navigation is
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
     (Options : Navigation_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Navigation_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Navigation_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Navigation_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Navigation_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function State_Text (State : Navigation_State) return String is
   begin
      case State is
         when Current_Item  => return "current";
         when Active_Item   => return "active";
         when Inactive_Item => return "inactive";
         when Disabled_Item => return "disabled";
         when Expanded_Item => return "expanded";
         when Collapsed_Item => return "collapsed";
         when Visited_Item  => return "visited";
         when External_Item => return "external";
      end case;
   end State_Text;

   function Kind_Text (Kind : Navigation_Item_Kind) return String is
   begin
      case Kind is
         when Link_Item       => return "link";
         when Menu_Item       => return "menu item";
         when Tab_Item        => return "tab";
         when Breadcrumb_Item => return "breadcrumb";
         when Section_Item    => return "section";
         when Separator_Item  => return "separator";
      end case;
   end Kind_Text;

   function State_Suffix (State : Navigation_State) return String is
   begin
      return State_Text (State);
   end State_Suffix;

   function Kind_Suffix (Kind : Navigation_Item_Kind) return String is
   begin
      return Kind_Text (Kind);
   end Kind_Suffix;

   function Item_Suffix
     (Kind  : Navigation_Item_Kind;
      State : Navigation_State)
      return String
   is
   begin
      return Kind_Suffix (Kind) & " " & State_Suffix (State);
   end Item_Suffix;

   function Navigation_State_Metadata
     (State : Navigation_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Navigation_Surface, State_Suffix (State));
   end Navigation_State_Metadata;

   function Navigation_State_Label
     (State : Navigation_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (State_Suffix (State));
   end Navigation_State_Label;

   function Navigation_Item_Kind_Label
     (Kind : Navigation_Item_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Kind_Suffix (Kind));
   end Navigation_Item_Kind_Label;

   function Navigation_Item_Label
     (Name  : String;
      Kind  : Navigation_Item_Kind := Link_Item;
      State : Navigation_State := Inactive_Item)
      return Humanize.Status.Text_Result
   is
      Item : constant String := Clean (Name);
   begin
      if Item'Length = 0 then
         return Invalid_Text ("invalid navigation item");
      else
         return Ok_Text (Item & " " & Item_Suffix (Kind, State));
      end if;
   end Navigation_Item_Label;

   function Navigation_Item_Label
     (Name    : String;
      Kind    : Navigation_Item_Kind;
      State   : Navigation_State;
      Options : Navigation_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Navigation_Item_Label (Name, Kind, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Navigation_State_Metadata (State), Domain_Options (Options));
   end Navigation_Item_Label;

   function Parse_Navigation_Item_Label
     (Text  : String;
      Kind  : Navigation_Item_Kind;
      State : Navigation_State)
      return Navigation_Label_Parse_Result
   is
      Result : Navigation_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Navigation_Surface,
         Item_Suffix (Kind, State));
      Result.Metadata := Navigation_State_Metadata (State);
      return Result;
   end Parse_Navigation_Item_Label;

   function Scan_Navigation_Item_Label
     (Text  : String;
      Kind  : Navigation_Item_Kind;
      State : Navigation_State)
      return Navigation_Label_Parse_Result
   is
      Result : Navigation_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Navigation_Surface,
         Item_Suffix (Kind, State));
      Result.Metadata := Navigation_State_Metadata (State);
      return Result;
   end Scan_Navigation_Item_Label;

   function Current_Page_Label
     (Name : String)
      return Humanize.Status.Text_Result
   is
      Page : constant String := Clean (Name);
   begin
      if Page'Length = 0 then
         return Invalid_Text ("invalid page name");
      else
         return Ok_Text ("current page: " & Page);
      end if;
   end Current_Page_Label;

   function Breadcrumb_Position_Label
     (Current : Natural;
      Total   : Natural;
      Name    : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
      Text  : Unbounded_String;
   begin
      if Total = 0 then
         return Ok_Text ("no breadcrumbs");
      elsif Current = 0 or else Current > Total then
         return Invalid_Text ("invalid breadcrumb position");
      end if;

      Text := To_Unbounded_String
        ("breadcrumb " & Image (Current) & " of " & Image (Total));
      if Label'Length > 0 then
         Append (Text, ": ");
         Append (Text, Label);
      end if;
      return Ok_Text (To_String (Text));
   end Breadcrumb_Position_Label;

   function Breadcrumb_Trail_Label
     (Depth : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Depth = 0 then
         return Ok_Text ("no breadcrumbs");
      else
         return Ok_Text (Count_Text (Depth, "breadcrumb", "breadcrumbs"));
      end if;
   end Breadcrumb_Trail_Label;

   function Tab_Label
     (Current : Natural;
      Total   : Natural;
      Name    : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
      Text  : Unbounded_String;
   begin
      if Total = 0 then
         return Ok_Text ("no tabs");
      elsif Current = 0 or else Current > Total then
         return Invalid_Text ("invalid tab position");
      end if;

      Text := To_Unbounded_String
        ("tab " & Image (Current) & " of " & Image (Total));
      if Label'Length > 0 then
         Append (Text, ": ");
         Append (Text, Label);
      end if;
      return Ok_Text (To_String (Text));
   end Tab_Label;

   function Menu_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "menu item", "menu items"));
   end Menu_Count_Label;

   function Submenu_Label
     (Name  : String;
      Count : Natural)
      return Humanize.Status.Text_Result
   is
      Menu : constant String := Clean (Name);
   begin
      if Menu'Length = 0 then
         return Invalid_Text ("invalid submenu name");
      else
         return Ok_Text
           (Menu & " submenu, " & Count_Text (Count, "item", "items"));
      end if;
   end Submenu_Label;

   function External_Link_Label
     (Name : String)
      return Humanize.Status.Text_Result
   is
      Link : constant String := Clean (Name);
   begin
      if Link'Length = 0 then
         return Invalid_Text ("invalid link label");
      else
         return Ok_Text (Link & " external link");
      end if;
   end External_Link_Label;

   function Skip_Link_Label
     (Target : String)
      return Humanize.Status.Text_Result
   is
      Destination : constant String := Clean (Target);
   begin
      if Destination'Length = 0 then
         return Invalid_Text ("invalid skip target");
      else
         return Ok_Text ("skip to " & Destination);
      end if;
   end Skip_Link_Label;

   function Back_Label
     (Target : String := "")
      return Humanize.Status.Text_Result
   is
      Destination : constant String := Clean (Target);
   begin
      if Destination'Length = 0 then
         return Ok_Text ("back");
      else
         return Ok_Text ("back to " & Destination);
      end if;
   end Back_Label;

   function Next_Label
     (Target : String := "")
      return Humanize.Status.Text_Result
   is
      Destination : constant String := Clean (Target);
   begin
      if Destination'Length = 0 then
         return Ok_Text ("next");
      else
         return Ok_Text ("next: " & Destination);
      end if;
   end Next_Label;

   function First_Label
     (Target : String := "")
      return Humanize.Status.Text_Result
   is
      Destination : constant String := Clean (Target);
   begin
      if Destination'Length = 0 then
         return Ok_Text ("first");
      else
         return Ok_Text ("first: " & Destination);
      end if;
   end First_Label;

   function Last_Label
     (Target : String := "")
      return Humanize.Status.Text_Result
   is
      Destination : constant String := Clean (Target);
   begin
      if Destination'Length = 0 then
         return Ok_Text ("last");
      else
         return Ok_Text ("last: " & Destination);
      end if;
   end Last_Label;

   function Section_State_Label
     (Name     : String;
      Expanded : Boolean;
      Count    : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Section : constant String := Clean (Name);
      State   : constant String := (if Expanded then "expanded" else "collapsed");
      Detail  : constant String :=
        (if Count = 0 then "" else ", " & Count_Text (Count, "item", "items"));
   begin
      if Section'Length = 0 then
         return Invalid_Text ("invalid section name");
      else
         return Ok_Text (Section & " section " & State & Detail);
      end if;
   end Section_State_Label;

   procedure Navigation_State_Label_Into
     (State   : Navigation_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Navigation_State_Label (State), Target, Written, Status);
   end Navigation_State_Label_Into;

   procedure Navigation_Item_Kind_Label_Into
     (Kind    : Navigation_Item_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Navigation_Item_Kind_Label (Kind), Target, Written, Status);
   end Navigation_Item_Kind_Label_Into;

   procedure Navigation_Item_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : Navigation_Item_Kind := Link_Item;
      State   : Navigation_State := Inactive_Item)
   is
   begin
      Copy_Result
        (Navigation_Item_Label (Name, Kind, State), Target, Written, Status);
   end Navigation_Item_Label_Into;

   procedure Navigation_Item_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : Navigation_Item_Kind;
      State   : Navigation_State;
      Options : Navigation_Label_Options)
   is
   begin
      Copy_Result
        (Navigation_Item_Label (Name, Kind, State, Options),
         Target, Written, Status);
   end Navigation_Item_Label_Into;

   procedure Current_Page_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Current_Page_Label (Name), Target, Written, Status);
   end Current_Page_Label_Into;

   procedure Breadcrumb_Position_Label_Into
     (Current : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
   begin
      Copy_Result
        (Breadcrumb_Position_Label (Current, Total, Name),
         Target,
         Written,
         Status);
   end Breadcrumb_Position_Label_Into;

   procedure Breadcrumb_Trail_Label_Into
     (Depth   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Breadcrumb_Trail_Label (Depth), Target, Written, Status);
   end Breadcrumb_Trail_Label_Into;

   procedure Tab_Label_Into
     (Current : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
   begin
      Copy_Result (Tab_Label (Current, Total, Name), Target, Written, Status);
   end Tab_Label_Into;

   procedure Menu_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Menu_Count_Label (Count), Target, Written, Status);
   end Menu_Count_Label_Into;

   procedure Submenu_Label_Into
     (Name    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Submenu_Label (Name, Count), Target, Written, Status);
   end Submenu_Label_Into;

   procedure External_Link_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (External_Link_Label (Name), Target, Written, Status);
   end External_Link_Label_Into;

   procedure Skip_Link_Label_Into
     (Skip_Target : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Skip_Link_Label (Skip_Target), Target, Written, Status);
   end Skip_Link_Label_Into;

   procedure Back_Label_Into
     (Target_Label : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Back_Label (Target_Label), Target, Written, Status);
   end Back_Label_Into;

   procedure Next_Label_Into
     (Target_Label : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Next_Label (Target_Label), Target, Written, Status);
   end Next_Label_Into;

   procedure First_Label_Into
     (Target_Label : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (First_Label (Target_Label), Target, Written, Status);
   end First_Label_Into;

   procedure Last_Label_Into
     (Target_Label : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Last_Label (Target_Label), Target, Written, Status);
   end Last_Label_Into;

   procedure Section_State_Label_Into
     (Name     : String;
      Expanded : Boolean;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Count    : Natural := 0)
   is
   begin
      Copy_Result
        (Section_State_Label (Name, Expanded, Count), Target, Written, Status);
   end Section_State_Label_Into;

end Humanize.Navigation;
