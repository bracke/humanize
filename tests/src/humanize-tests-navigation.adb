with AUnit.Assertions;

with Humanize.Navigation;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Navigation is
   use Humanize.Navigation;
   use Humanize.Status;

   procedure Check
     (Result   : Text_Result;
      Expected : String;
      Message  : String)
   is
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Test_State_And_Item_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check (Navigation_State_Label (Current_Item), "current", "current state");
      Check (Navigation_State_Label (Expanded_Item), "expanded", "expanded state");
      Check (Navigation_Item_Kind_Label (Tab_Item), "tab", "tab kind");
      Check (Navigation_Item_Kind_Label (Breadcrumb_Item), "breadcrumb", "breadcrumb kind");
      Check
        (Navigation_Item_Label ("Settings", Link_Item, Current_Item),
         "Settings link current",
         "navigation item");
      Check
        (Navigation_Item_Label ("Reports", Menu_Item, Expanded_Item),
         "Reports menu item expanded",
         "expanded menu item");
      Check (Current_Page_Label ("Settings"), "current page: Settings", "current page");

      Invalid := Navigation_Item_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid navigation item",
         "empty navigation item rejected");
      Invalid := Current_Page_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid page name",
         "empty page name rejected");
   end Test_State_And_Item_Labels;

   procedure Test_Breadcrumb_Tab_And_Menu_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check (Breadcrumb_Position_Label (0, 0), "no breadcrumbs", "no breadcrumbs");
      Check
        (Breadcrumb_Position_Label (2, 4, "Billing"),
         "breadcrumb 2 of 4: Billing",
         "breadcrumb position");
      Check (Breadcrumb_Trail_Label (0), "no breadcrumbs", "empty trail");
      Check (Breadcrumb_Trail_Label (3), "3 breadcrumbs", "trail depth");
      Check (Tab_Label (0, 0), "no tabs", "no tabs");
      Check (Tab_Label (2, 3), "tab 2 of 3", "tab position");
      Check (Tab_Label (2, 3, "Security"), "tab 2 of 3: Security", "named tab");
      Check (Menu_Count_Label (0), "no menu items", "empty menu");
      Check (Menu_Count_Label (5), "5 menu items", "menu count");
      Check (Submenu_Label ("Admin", 4), "Admin submenu, 4 items", "submenu");

      Invalid := Breadcrumb_Position_Label (5, 4);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid breadcrumb position",
         "invalid breadcrumb position rejected");
      Invalid := Tab_Label (4, 3);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid tab position",
         "invalid tab position rejected");
      Invalid := Submenu_Label (" ", 2);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid submenu name",
         "empty submenu name rejected");
   end Test_Breadcrumb_Tab_And_Menu_Labels;

   procedure Test_Link_And_Direction_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check (External_Link_Label ("Docs"), "Docs external link", "external link");
      Check (Skip_Link_Label ("main content"), "skip to main content", "skip link");
      Check (Back_Label, "back", "back");
      Check (Back_Label ("dashboard"), "back to dashboard", "back target");
      Check (Next_Label, "next", "next");
      Check (Next_Label ("billing"), "next: billing", "next target");
      Check (First_Label, "first", "first");
      Check (First_Label ("page"), "first: page", "first target");
      Check (Last_Label, "last", "last");
      Check (Last_Label ("page"), "last: page", "last target");
      Check
        (Section_State_Label ("Admin", Expanded => True, Count => 4),
         "Admin section expanded, 4 items",
         "section expanded");
      Check
        (Section_State_Label ("Admin", Expanded => False),
         "Admin section collapsed",
         "section collapsed");

      Invalid := External_Link_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid link label",
         "empty link label rejected");
      Invalid := Skip_Link_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid skip target",
         "empty skip target rejected");
      Invalid := Section_State_Label (" ", Expanded => True);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid section name",
         "empty section rejected");
   end Test_Link_And_Direction_Labels;

   procedure Test_Bounded_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Exact  : String (1 .. 22);
      Tiny   : String (1 .. 10);
      Offset : String (2 .. 12);
      Written : Natural;
      Code : Status_Code;
   begin
      Current_Page_Label_Into ("Settings", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 22
         and then Exact = "current page: Settings",
         "current page bounded exact text");

      Navigation_Item_Label_Into
        ("Reports", Tiny, Written, Code, Menu_Item, Expanded_Item);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 10
         and then Tiny = "Reports me",
         "navigation item bounded overflow prefix");

      Navigation_State_Label_Into (Current_Item, Offset, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "navigation state bounded rejects non-1-based buffers");

      Breadcrumb_Position_Label_Into (5, 4, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "breadcrumb bounded returns validation status");

      Tab_Label_Into (2, 3, Exact, Written, Code, "Security");
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 20
         and then Exact (1 .. Written) = "tab 2 of 3: Security",
         "tab bounded exact text");

      Section_State_Label_Into
        ("Admin", Expanded => True, Target => Exact, Written => Written,
         Status => Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 22
         and then Exact = "Admin section expanded",
         "section state bounded exact text");
   end Test_Bounded_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize navigation tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_State_And_Item_Labels'Access,
        "state and item labels");
      Register_Routine (T, Test_Breadcrumb_Tab_And_Menu_Labels'Access,
        "breadcrumb tab and menu labels");
      Register_Routine (T, Test_Link_And_Direction_Labels'Access,
        "link and direction labels");
      Register_Routine (T, Test_Bounded_Labels'Access,
        "bounded labels");
   end Register_Tests;

end Humanize.Tests.Navigation;
