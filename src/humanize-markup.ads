with Humanize.Domain_Details;
with Humanize.Status;

--  Human-readable labels for markup and content-type presentation facts.
package Humanize.Markup is

   type Tag_Kind is
     (Document_Tag,
      Metadata_Tag,
      Section_Tag,
      Text_Tag,
      Link_Tag,
      Media_Tag,
      Form_Tag,
      Table_Tag,
      Interactive_Tag,
      Scripting_Tag,
      Unknown_Tag);
   --  Broad HTML/XML-style tag categories for presentation summaries.

   type Attribute_Kind is
     (Id_Attribute,
      Class_Attribute,
      Data_Attribute,
      Aria_Attribute,
      Role_Attribute,
      Link_Attribute,
      Media_Attribute,
      Form_Attribute,
      Boolean_Attribute,
      Event_Attribute,
      Unknown_Attribute);
   --  Broad HTML/XML-style attribute categories.

   type Mime_Kind is
     (Text_Content,
      Html_Content,
      Json_Content,
      Xml_Content,
      Image_Content,
      Audio_Content,
      Video_Content,
      Font_Content,
      Archive_Content,
      Binary_Content,
      Form_Content,
      Unknown_Content);
   --  Broad media-type categories.

   type Landmark_Role is
     (Banner_Role,
      Navigation_Role,
      Main_Role,
      Complementary_Role,
      Contentinfo_Role,
      Search_Role,
      Form_Role,
      Region_Role,
      Dialog_Role,
      Alert_Role,
      Status_Role,
      Unknown_Role);
   --  Common accessibility landmark and live-region roles.

   type Accessible_Control_Role is
     (Button_Control,
      Link_Control,
      Tab_Control,
      Menu_Item_Control,
      Checkbox_Control,
      Radio_Control,
      Text_Field_Control,
      Progress_Control,
      Table_Cell_Control,
      Region_Control,
      Unknown_Control);
   --  Common control roles for composed accessibility labels.

   type Accessible_Control_State is record
      Selected   : Boolean := False;
      Expanded   : Boolean := False;
      Current    : Boolean := False;
      Disabled   : Boolean := False;
      Required   : Boolean := False;
      Invalid    : Boolean := False;
      Count      : Natural := 0;
      Position   : Natural := 0;
      Total      : Natural := 0;
      Issues     : Natural := 0;
   end record;
   --  Caller-supplied UI state used to compose accessible labels.

   type Markup_Output_Mode is
     (Markup_Detailed,
      Markup_Compact,
      Markup_Accessible,
      Markup_Log);
   --  Output display policy for markup labels.

   type Markup_Label_Options is record
      Mode             : Markup_Output_Mode := Markup_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;
   --  Domain-label options for markup labels.

   Default_Markup_Label_Options : constant Markup_Label_Options :=
     (Mode             => Markup_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Markup_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;
   --  Parsed markup label with name and category spans.

   function Tag_Kind_For (Name : String) return Tag_Kind;
   --  @param Name Markup tag name, with or without angle brackets.
   --  @return Broad tag category.

   function Tag_Label
     (Name : String)
      return Humanize.Status.Text_Result;
   --  @param Name Markup tag name, with or without angle brackets.
   --  @return Human-readable tag label such as "image tag".

   function Tag_Label
     (Name    : String;
      Options : Markup_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Markup tag name, with or without angle brackets.
   --  @param Options Domain-label output options.
   --  @return Tag label with optional markup metadata.

   function Tag_Kind_Label
     (Kind : Tag_Kind)
      return Humanize.Status.Text_Result;
   --  @param Kind Tag category.
   --  @return Human-readable category label.

   function Attribute_Kind_For (Name : String) return Attribute_Kind;
   --  @param Name Attribute name.
   --  @return Broad attribute category.

   function Attribute_Label
     (Name  : String;
      Value : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Attribute name.
   --  @param Value Optional attribute value to include.
   --  @return Human-readable attribute label with safe value display.

   function Attribute_Label
     (Name    : String;
      Options : Markup_Label_Options;
      Value   : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Attribute name.
   --  @param Options Domain-label output options.
   --  @param Value Optional attribute value to include.
   --  @return Attribute label with optional markup metadata.

   function Attribute_Kind_Label
     (Kind : Attribute_Kind)
      return Humanize.Status.Text_Result;
   --  @param Kind Attribute category.
   --  @return Human-readable category label.

   function Attribute_Count_Label
     (Total   : Natural;
      Data    : Natural := 0;
      Aria    : Natural := 0;
      Events  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Total Total attribute count.
   --  @param Data Data-attribute count.
   --  @param Aria ARIA-attribute count.
   --  @param Events Event-handler attribute count.
   --  @return Compact attribute-count summary.

   function Mime_Kind_For (Content_Type : String) return Mime_Kind;
   --  @param Content_Type MIME media type, optionally with parameters.
   --  @return Broad content category.

   function Content_Type_Label
     (Content_Type : String)
      return Humanize.Status.Text_Result;
   --  @param Content_Type MIME media type, optionally with parameters.
   --  @return Human-readable content-type label.

   function Content_Type_Label
     (Content_Type : String;
      Options      : Markup_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Content_Type MIME media type, optionally with parameters.
   --  @param Options Domain-label output options.
   --  @return Content-type label with optional markup metadata.

   function Mime_Kind_Label
     (Kind : Mime_Kind)
      return Humanize.Status.Text_Result;
   --  @param Kind Content category.
   --  @return Human-readable category label.

   function Heading_Label
     (Level : Positive)
      return Humanize.Status.Text_Result;
   --  @param Level Heading level. Valid HTML heading levels are 1 through 6.
   --  @return Human-readable heading label.

   function Landmark_Label
     (Role : Landmark_Role)
      return Humanize.Status.Text_Result;
   --  @param Role Landmark or live-region role.
   --  @return Human-readable role label.

   function Landmark_Label
     (Role    : Landmark_Role;
      Options : Markup_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Role Landmark or live-region role.
   --  @param Options Domain-label output options.
   --  @return Landmark label with optional markup metadata.

   function Landmark_Role_For (Name : String) return Landmark_Role;
   --  @param Name ARIA role or landmark name.
   --  @return Common landmark/live-region role category.

   function Tag_Count_Label
     (Total : Natural;
      Links : Natural := 0;
      Media : Natural := 0;
      Forms : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Total Total tag count.
   --  @param Links Link tag count.
   --  @param Media Media tag count.
   --  @param Forms Form-control tag count.
   --  @return Compact tag-count summary.

   function Document_Outline_Label
     (Headings  : Natural;
      Landmarks : Natural;
      Forms     : Natural := 0;
      Media     : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Headings Heading count.
   --  @param Landmarks Landmark count.
   --  @param Forms Form count.
   --  @param Media Media element count.
   --  @return Compact document-structure summary.

   type Accessibility_Issue_Kind is
     (Missing_Accessible_Name,
      Low_Contrast,
      Skipped_Heading_Level,
      Missing_Form_Label,
      Invalid_ARIA,
      Keyboard_Trap,
      Unknown_Accessibility_Issue);
   --  Accessibility findings supplied by an external checker.

   function Accessibility_Issue_Label
     (Target : String;
      Issue  : Accessibility_Issue_Kind)
      return Humanize.Status.Text_Result;
   --  @param Target Element, control, or region label.
   --  @param Issue Caller-supplied accessibility finding.
   --  @return Human-readable accessibility finding label.

   function Accessibility_Summary_Label
     (Issues : Natural;
      Target : String := "document")
      return Humanize.Status.Text_Result;
   --  @param Issues Number of accessibility findings.
   --  @param Target Checked scope label.
   --  @return Human-readable accessibility issue count.

   function Accessible_Control_Label
     (Name  : String;
      Role  : Accessible_Control_Role;
      State : Accessible_Control_State := (others => <>))
      return Humanize.Status.Text_Result;
   --  @param Name Accessible name or fallback label.
   --  @param Role Common UI/control role.
   --  @param State Caller-supplied state, counts, and issue count.
   --  @return Composed accessibility label for assistive output.

   function Accessibility_Page_Summary_Label
     (Title     : String;
      Landmarks : Natural := 0;
      Headings  : Natural := 0;
      Issues    : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Title Page or document title.
   --  @param Landmarks Count of accessibility landmarks.
   --  @param Headings Count of headings.
   --  @param Issues Count of accessibility findings.
   --  @return Page-level accessibility summary.

   function Form_Error_Summary_Label
     (Form_Name : String;
      Errors    : Natural;
      Warnings  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Form_Name Human-readable form name.
   --  @param Errors Count of blocking form errors.
   --  @param Warnings Count of non-blocking form warnings.
   --  @return Form-level accessibility/error summary.

   function Table_Navigation_Label
     (Caption : String;
      Row     : Positive;
      Column  : Positive;
      Rows    : Positive;
      Columns : Positive)
      return Humanize.Status.Text_Result;
   --  @param Caption Table caption or fallback name.
   --  @param Row Current 1-based row.
   --  @param Column Current 1-based column.
   --  @param Rows Total row count.
   --  @param Columns Total column count.
   --  @return Screen-reader-oriented table cell position label.

   function Live_Region_Update_Label
     (Region : String;
      Update : String;
      Polite : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Region Live-region label.
   --  @param Update Human-readable update text.
   --  @param Polite True for polite announcements, False for assertive.
   --  @return Live-region update label.

   function Accessibility_Remediation_Label
     (Issue : Accessibility_Issue_Kind)
      return Humanize.Status.Text_Result;
   --  @param Issue Caller-supplied accessibility finding.
   --  @return Short remediation suggestion for an accessibility issue.

   procedure Accessible_Control_Label_Into
     (Name    : String;
      Role    : Accessible_Control_Role;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Accessible_Control_State := (others => <>));
   --  @param Name Accessible name or fallback label.
   --  @param Role Common UI/control role.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param State Caller-supplied state, counts, and issue count.

   function Tag_Kind_Metadata
     (Kind : Tag_Kind)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param Kind Tag category.
   --  @return Stable metadata for the tag category.

   function Attribute_Kind_Metadata
     (Kind : Attribute_Kind)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param Kind Attribute category.
   --  @return Stable metadata for the attribute category.

   function Mime_Kind_Metadata
     (Kind : Mime_Kind)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param Kind Content category.
   --  @return Stable metadata for the content category.

   function Landmark_Role_Metadata
     (Role : Landmark_Role)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param Role Landmark or live-region role.
   --  @return Stable metadata for the landmark role.

   function Parse_Tag_Kind_Label
     (Text : String;
      Kind : Tag_Kind)
      return Markup_Label_Parse_Result;
   --  @param Text Label in "name tag-kind" form.
   --  @param Kind Expected tag category.
   --  @return Parsed label spans and markup metadata.

   function Scan_Tag_Kind_Label
     (Text : String;
      Kind : Tag_Kind)
      return Markup_Label_Parse_Result;
   --  @param Text Text beginning with a "name tag-kind" label.
   --  @param Kind Expected tag category.
   --  @return Parsed prefix label spans and markup metadata.

   function Parse_Attribute_Kind_Label
     (Text : String;
      Kind : Attribute_Kind)
      return Markup_Label_Parse_Result;
   --  @param Text Label in "name attribute-kind" form.
   --  @param Kind Expected attribute category.
   --  @return Parsed label spans and markup metadata.

   function Scan_Attribute_Kind_Label
     (Text : String;
      Kind : Attribute_Kind)
      return Markup_Label_Parse_Result;
   --  @param Text Text beginning with a "name attribute-kind" label.
   --  @param Kind Expected attribute category.
   --  @return Parsed prefix label spans and markup metadata.

   procedure Tag_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Markup tag name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Tag_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Markup_Label_Options);
   --  @param Name Markup tag name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Domain-label output options.

   procedure Attribute_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Value   : String := "");
   --  @param Name Attribute name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Value Optional attribute value to include.

   procedure Attribute_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Markup_Label_Options;
      Value   : String := "");
   --  @param Name Attribute name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Domain-label output options.
   --  @param Value Optional attribute value to include.

   procedure Content_Type_Label_Into
     (Content_Type : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code);
   --  @param Content_Type MIME media type.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Content_Type_Label_Into
     (Content_Type : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Options      : Markup_Label_Options);
   --  @param Content_Type MIME media type.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Domain-label output options.

end Humanize.Markup;
