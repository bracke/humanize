with AUnit.Assertions;

with Humanize.Domain_Details;
with Humanize.Markup;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Markup is
   use Humanize.Markup;
   use Humanize.Status;
   use type Humanize.Domain_Details.Domain_Surface;

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

   procedure Test_Tag_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Invalid : Text_Result;
      Parsed  : Markup_Label_Parse_Result;
   begin
      Check (Tag_Label ("<img src=""logo.png"">"), "image tag", "image tag label");
      Check (Tag_Label ("H2"), "heading level 2 tag", "heading tag label");
      Check (Tag_Label ("custom-widget"), "custom-widget tag", "custom tag label");
      Check (Tag_Kind_Label (Tag_Kind_For ("nav")), "section tag", "nav kind");
      Check (Tag_Kind_Label (Tag_Kind_For ("video")), "media tag", "video kind");
      Check (Tag_Kind_Label (Tag_Kind_For ("button")), "interactive tag", "button kind");
      Check (Tag_Kind_Label (Tag_Kind_For ("script")), "scripting tag", "script kind");
      Check
        (Tag_Label
           ("img",
            (Mode             => Markup_Detailed,
             Include_Surface  => True,
             Include_Severity => True,
             Include_Tone     => False)),
         "[markup info] image tag",
         "tag label with metadata");

      Parsed := Parse_Tag_Kind_Label ("hero media tag", Media_Tag);
      AUnit.Assertions.Assert
        (Parsed.Status = Ok
         and then Parsed.Consumed = 14
         and then Parsed.Name_Length = 4
         and then Parsed.Metadata.Surface = Humanize.Domain_Details.Markup_Surface,
         "parse tag kind label");

      Parsed := Scan_Tag_Kind_Label ("nav section tag found", Section_Tag);
      AUnit.Assertions.Assert
        (Parsed.Status = Ok
         and then Parsed.Consumed = 15
         and then Parsed.State_Length = 11,
         "scan tag kind label");

      Invalid := Tag_Label ("<>");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid tag",
         "invalid tag rejected");
   end Test_Tag_Labels;

   procedure Test_Attribute_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Invalid : Text_Result;
      Parsed  : Markup_Label_Parse_Result;
   begin
      Check (Attribute_Label ("CLASS", "hero"), "class attribute set to ""hero""", "class label");
      Check (Attribute_Label ("data-id", "42"), "data-id attribute set to ""42""", "data label");
      Check (Attribute_Label ("onclick", "alert(1)"), "onclick event handler attribute", "event label");
      Check (Attribute_Kind_Label (Attribute_Kind_For ("aria-label")), "ARIA attribute", "aria kind");
      Check (Attribute_Kind_Label (Attribute_Kind_For ("href")), "link attribute", "link kind");
      Check (Attribute_Kind_Label (Attribute_Kind_For ("required")), "form attribute", "form kind");
      Check
        (Attribute_Count_Label (8, Data => 2, Aria => 1, Events => 1),
         "8 attributes, 2 data attributes, 1 ARIA attribute, 1 event handler",
         "attribute count summary");
      Check
        (Attribute_Label
           ("onclick",
            (Mode             => Markup_Detailed,
             Include_Surface  => True,
             Include_Severity => True,
             Include_Tone     => False),
            "alert(1)"),
         "[markup info] onclick event handler attribute",
         "attribute label with metadata");

      Parsed := Parse_Attribute_Kind_Label
        ("onclick event handler attribute", Event_Attribute);
      AUnit.Assertions.Assert
        (Parsed.Status = Ok
         and then Parsed.Consumed = 31
         and then Parsed.Name_Length = 7,
         "parse attribute kind label");

      Parsed := Scan_Attribute_Kind_Label
        ("aria-label ARIA attribute on heading", Aria_Attribute);
      AUnit.Assertions.Assert
        (Parsed.Status = Ok
         and then Parsed.Consumed = 25
         and then Parsed.State_Length = 14,
         "scan attribute kind label");

      Invalid := Attribute_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid attribute",
         "invalid attribute rejected");
   end Test_Attribute_Labels;

   procedure Test_Content_Type_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check
        (Content_Type_Label ("Text/HTML; charset=UTF-8"),
         "HTML document (text/html)",
         "html content type");
      Check
        (Content_Type_Label ("application/vnd.api+json"),
         "JSON document (application/vnd.api+json)",
         "structured json content type");
      Check
        (Content_Type_Label ("image/svg+xml"),
         "XML document (image/svg+xml)",
         "structured xml suffix content type");
      Check
        (Content_Type_Label ("application/octet-stream"),
         "binary content (application/octet-stream)",
         "binary content type");
      Check (Mime_Kind_Label (Mime_Kind_For ("font/woff2")), "font content", "font kind");
      Check (Mime_Kind_Label (Mime_Kind_For ("multipart/form-data")), "form content", "form kind");
      Check
        (Content_Type_Label
           ("application/json",
            (Mode             => Markup_Detailed,
             Include_Surface  => True,
             Include_Severity => True,
             Include_Tone     => False)),
         "[markup info] JSON document (application/json)",
         "content type with metadata");

      Invalid := Content_Type_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid content type",
         "invalid content type rejected");
   end Test_Content_Type_Labels;

   procedure Test_Heading_And_Landmark_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check (Heading_Label (1), "heading level 1", "heading level one");
      Check (Heading_Label (6), "heading level 6", "heading level six");
      Check (Landmark_Label (Navigation_Role), "navigation landmark", "navigation landmark");
      Check (Landmark_Label (Alert_Role), "alert live region", "alert live region");
      Check
        (Landmark_Label
           (Alert_Role,
            (Mode             => Markup_Accessible,
             Include_Surface  => True,
             Include_Severity => True,
             Include_Tone     => False)),
         "[markup info] alert live region",
         "landmark label with metadata");
      Check (Landmark_Label (Landmark_Role_For ("nav")), "navigation landmark", "nav role");
      Check (Landmark_Label (Landmark_Role_For ("footer")), "content info landmark", "footer role");
      Check
        (Tag_Count_Label (12, Links => 3, Media => 2, Forms => 1),
         "12 tags, 3 links, 2 media elements, 1 form control",
         "tag count summary");
      Check
        (Document_Outline_Label (5, 4, Forms => 1, Media => 2),
         "5 headings, 4 landmarks, 1 form, 2 media elements",
         "document outline summary");
      Check
        (Accessibility_Issue_Label
           ("icon button", Missing_Accessible_Name),
         "icon button missing accessible name",
         "accessibility issue label");
      Check
        (Accessibility_Summary_Label (2, "checkout form"),
         "checkout form has 2 accessibility issues",
         "accessibility summary label");
      Check
        (Accessible_Control_Label
           ("Save", Button_Control,
            (Selected => True,
             Expanded => False,
             Current => False,
             Disabled => True,
             Required => False,
             Invalid => False,
             Count => 0,
             Position => 2,
             Total => 5,
             Issues => 1)),
         "Save button selected, disabled, item 2 of 5, 1 issue",
         "accessible control label");
      Check
        (Accessibility_Page_Summary_Label
           ("Checkout", Landmarks => 4, Headings => 6, Issues => 1),
         "Checkout accessibility summary: 4 landmarks, 6 headings, 1 issue",
         "accessibility page summary");
      Check
        (Form_Error_Summary_Label ("Checkout form", 2, 1),
         "Checkout form has 2 errors, 1 warning",
         "form error summary");
      Check
        (Table_Navigation_Label ("Orders", 2, 3, 10, 5),
         "Orders row 2 of 10, column 3 of 5",
         "table navigation label");
      Check
        (Live_Region_Update_Label ("cart", "item added", False),
         "cart assertive update: item added",
         "live region update label");
      Check
        (Accessibility_Remediation_Label (Low_Contrast),
         "increase text contrast",
         "accessibility remediation label");

      Invalid := Heading_Label (7);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid heading level",
         "invalid heading rejected");
   end Test_Heading_And_Landmark_Labels;

   procedure Test_Bounded_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Exact  : String (1 .. 9);
      Tiny   : String (1 .. 6);
      Tagged_Text : String (1 .. 13);
      Offset : String (2 .. 12);
      Written : Natural;
      Code : Status_Code;
   begin
      Tag_Label_Into ("img", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 9 and then Exact = "image tag",
         "tag bounded exact text");

      Attribute_Label_Into ("class", Tiny, Written, Code, "hero");
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 6 and then Tiny = "class ",
         "attribute bounded overflow prefix");

      Tag_Label_Into
        ("img", Tagged_Text, Written, Code,
         (Mode             => Markup_Detailed,
          Include_Surface  => True,
          Include_Severity => True,
          Include_Tone     => False));
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow
         and then Written = 13
         and then Tagged_Text = "[markup info]",
         "tag options bounded overflow prefix");

      Content_Type_Label_Into ("application/json", Offset, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "content type bounded rejects non-1-based buffers");

      Tag_Label_Into ("<>", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "bounded tag returns validation status");

      Accessible_Control_Label_Into
        ("Save", Button_Control, Tiny, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 6 and then Tiny = "Save b",
         "accessible control bounded overflow");
   end Test_Bounded_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize markup tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Tag_Labels'Access, "tag labels");
      Register_Routine (T, Test_Attribute_Labels'Access, "attribute labels");
      Register_Routine (T, Test_Content_Type_Labels'Access, "content type labels");
      Register_Routine (T, Test_Heading_And_Landmark_Labels'Access, "heading and landmark labels");
      Register_Routine (T, Test_Bounded_Labels'Access, "bounded labels");
   end Register_Tests;

end Humanize.Tests.Markup;
