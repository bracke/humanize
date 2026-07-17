with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.Markup is
   use type Humanize.Status.Status_Code;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text
     (Result : Humanize.Status.Text_Result)
      return String
      renames Humanize.Bounded_Text.Result_Text;

   function Invalid_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Invalid_Text;

   function Clean (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Starts_With (Text : String; Prefix : String) return Boolean
      renames Humanize.Bounded_Text.Starts_With;

   function Ends_With (Text : String; Suffix : String) return Boolean
      renames Humanize.Bounded_Text.Ends_With;

   function Digits_Image (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Count_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
      renames Humanize.Bounded_Text.Count_Text;

   function Domain_Options
     (Options : Markup_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Markup_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Markup_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Markup_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Markup_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Trimmed_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;

   function Bare_Tag_Name (Name : String) return String is
      Trimmed : constant String := Trimmed_Lower (Name);
      First : Natural := Trimmed'First;
      Last  : Natural := Trimmed'Last;
   begin
      if Trimmed'Length = 0 then
         return "";
      end if;

      if Trimmed (First) = '<' then
         First := First + 1;
      end if;
      if First <= Last and then Trimmed (First) = '/' then
         First := First + 1;
      end if;
      if First <= Last and then Trimmed (Last) = '>' then
         Last := Last - 1;
      end if;

      for I in First .. Last loop
         if Trimmed (I) = ' ' or else Trimmed (I) = '/' then
            Last := I - 1;
            exit;
         end if;
      end loop;

      if First > Last then
         return "";
      end if;
      return Trimmed (First .. Last);
   end Bare_Tag_Name;

   function Base_Content_Type (Content_Type : String) return String is
      Lowered : constant String := Trimmed_Lower (Content_Type);
   begin
      for I in Lowered'Range loop
         if Lowered (I) = ';' then
            return Clean
              (Lowered (Lowered'First .. I - 1));
         end if;
      end loop;
      return Lowered;
   end Base_Content_Type;

   function Tag_Kind_For (Name : String) return Tag_Kind is
      Tag : constant String := Bare_Tag_Name (Name);
   begin
      if Tag in "html" | "body" | "head" | "main" then
         return Document_Tag;
      elsif Tag in "title" | "meta" | "link" | "base" then
         return Metadata_Tag;
      elsif Tag in "section" | "article" | "aside" | "nav" | "header" | "footer"
        | "h1" | "h2" | "h3" | "h4" | "h5" | "h6"
      then
         return Section_Tag;
      elsif Tag in "p" | "span" | "strong" | "em" | "small" | "blockquote" | "code"
        | "pre" | "br" | "hr" | "ul" | "ol" | "li" | "dl" | "dt" | "dd"
      then
         return Text_Tag;
      elsif Tag = "a" then
         return Link_Tag;
      elsif Tag in "img" | "picture" | "source" | "figure" | "figcaption" | "audio"
        | "video" | "track" | "canvas" | "svg"
      then
         return Media_Tag;
      elsif Tag in "form" | "label" | "input" | "textarea" | "select" | "option"
        | "fieldset" | "legend" | "datalist" | "output"
      then
         return Form_Tag;
      elsif Tag in "table" | "thead" | "tbody" | "tfoot" | "tr" | "th" | "td"
        | "caption" | "col" | "colgroup"
      then
         return Table_Tag;
      elsif Tag in "button" | "details" | "summary" | "dialog" | "menu" then
         return Interactive_Tag;
      elsif Tag in "script" | "noscript" | "template" | "slot" | "style" then
         return Scripting_Tag;
      else
         return Unknown_Tag;
      end if;
   end Tag_Kind_For;

   function Tag_Name_Label (Tag : String) return String is
   begin
      if Tag = "a" then
         return "link";
      elsif Tag = "img" then
         return "image";
      elsif Tag = "p" then
         return "paragraph";
      elsif Tag = "ol" then
         return "ordered list";
      elsif Tag = "ul" then
         return "unordered list";
      elsif Tag = "li" then
         return "list item";
      elsif Tag = "th" then
         return "table header cell";
      elsif Tag = "td" then
         return "table cell";
      elsif Tag = "tr" then
         return "table row";
      elsif Tag = "br" then
         return "line break";
      elsif Tag = "hr" then
         return "thematic break";
      elsif Tag in "h1" | "h2" | "h3" | "h4" | "h5" | "h6" then
         return "heading level " & Tag (Tag'Last .. Tag'Last);
      else
         return Tag;
      end if;
   end Tag_Name_Label;

   function Tag_Label
     (Name : String)
      return Humanize.Status.Text_Result
   is
      Tag : constant String := Bare_Tag_Name (Name);
   begin
      if Tag'Length = 0 then
         return Invalid_Text ("invalid tag");
      end if;
      return Ok_Text (Tag_Name_Label (Tag) & " tag");
   end Tag_Label;

   function Tag_Kind_Label
     (Kind : Tag_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Kind is
            when Document_Tag    => "document tag",
            when Metadata_Tag    => "metadata tag",
            when Section_Tag     => "section tag",
            when Text_Tag        => "text tag",
            when Link_Tag        => "link tag",
            when Media_Tag       => "media tag",
            when Form_Tag        => "form tag",
            when Table_Tag       => "table tag",
            when Interactive_Tag => "interactive tag",
            when Scripting_Tag   => "scripting tag",
            when Unknown_Tag     => "unknown tag");
   end Tag_Kind_Label;

   function Tag_Kind_Suffix (Kind : Tag_Kind) return String is
   begin
      return Result_Text (Tag_Kind_Label (Kind));
   end Tag_Kind_Suffix;

   function Tag_Kind_Metadata
     (Kind : Tag_Kind)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Markup_Surface, Tag_Kind_Suffix (Kind));
   end Tag_Kind_Metadata;

   function Tag_Label
     (Name    : String;
      Options : Markup_Label_Options)
      return Humanize.Status.Text_Result
   is
      Kind : constant Tag_Kind := Tag_Kind_For (Name);
      Base : constant Humanize.Status.Text_Result := Tag_Label (Name);
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;

      return Humanize.Domain_Details.Domain_Label
        (Base, Tag_Kind_Metadata (Kind), Domain_Options (Options));
   end Tag_Label;

   function Attribute_Kind_For (Name : String) return Attribute_Kind is
      Attr : constant String := Trimmed_Lower (Name);
   begin
      if Attr = "id" then
         return Id_Attribute;
      elsif Attr = "class" then
         return Class_Attribute;
      elsif Starts_With (Attr, "data-") then
         return Data_Attribute;
      elsif Starts_With (Attr, "aria-") then
         return Aria_Attribute;
      elsif Attr = "role" then
         return Role_Attribute;
      elsif Attr in "href" | "src" | "srcset" | "action" | "poster" then
         return Link_Attribute;
      elsif Attr in "alt" | "width" | "height" | "loading" | "decoding" | "controls"
        | "autoplay" | "muted" | "loop"
      then
         return Media_Attribute;
      elsif Attr in "name" | "value" | "type" | "placeholder" | "required"
        | "disabled" | "readonly" | "checked" | "selected" | "multiple"
      then
         return Form_Attribute;
      elsif Attr in "hidden" | "open" | "defer" | "async" | "novalidate" then
         return Boolean_Attribute;
      elsif Starts_With (Attr, "on") and then Attr'Length > 2 then
         return Event_Attribute;
      else
         return Unknown_Attribute;
      end if;
   end Attribute_Kind_For;

   function Attribute_Label
     (Name  : String;
      Value : String := "")
      return Humanize.Status.Text_Result
   is
      Attr : constant String := Trimmed_Lower (Name);
   begin
      if Attr'Length = 0 then
         return Invalid_Text ("invalid attribute");
      elsif Value'Length = 0 then
         return Ok_Text (Attr & " attribute");
      elsif Attribute_Kind_For (Attr) = Event_Attribute then
         return Ok_Text (Attr & " event handler attribute");
      else
         return Ok_Text (Attr & " attribute set to """ & Value & """");
      end if;
   end Attribute_Label;

   function Attribute_Kind_Label
     (Kind : Attribute_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Kind is
            when Id_Attribute      => "id attribute",
            when Class_Attribute   => "class attribute",
            when Data_Attribute    => "data attribute",
            when Aria_Attribute    => "ARIA attribute",
            when Role_Attribute    => "role attribute",
            when Link_Attribute    => "link attribute",
            when Media_Attribute   => "media attribute",
            when Form_Attribute    => "form attribute",
            when Boolean_Attribute => "boolean attribute",
            when Event_Attribute   => "event handler attribute",
            when Unknown_Attribute => "unknown attribute");
   end Attribute_Kind_Label;

   function Attribute_Kind_Suffix (Kind : Attribute_Kind) return String is
   begin
      return Result_Text (Attribute_Kind_Label (Kind));
   end Attribute_Kind_Suffix;

   function Attribute_Kind_Metadata
     (Kind : Attribute_Kind)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Markup_Surface, Attribute_Kind_Suffix (Kind));
   end Attribute_Kind_Metadata;

   function Attribute_Label
     (Name    : String;
      Options : Markup_Label_Options;
      Value   : String := "")
      return Humanize.Status.Text_Result
   is
      Kind : constant Attribute_Kind := Attribute_Kind_For (Name);
      Base : constant Humanize.Status.Text_Result := Attribute_Label (Name, Value);
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;

      return Humanize.Domain_Details.Domain_Label
        (Base, Attribute_Kind_Metadata (Kind), Domain_Options (Options));
   end Attribute_Label;

   function Attribute_Count_Label
     (Total   : Natural;
      Data    : Natural := 0;
      Aria    : Natural := 0;
      Events  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Text : Unbounded_String :=
        To_Unbounded_String (Count_Text (Total, "attribute", "attributes"));
   begin
      if Data > 0 then
         Append (Text, ", " & Count_Text (Data, "data attribute", "data attributes"));
      end if;
      if Aria > 0 then
         Append (Text, ", " & Count_Text (Aria, "ARIA attribute", "ARIA attributes"));
      end if;
      if Events > 0 then
         Append (Text, ", " & Count_Text (Events, "event handler", "event handlers"));
      end if;
      return Ok_Text (To_String (Text));
   end Attribute_Count_Label;

   function Mime_Kind_For (Content_Type : String) return Mime_Kind is
      Kind : constant String := Base_Content_Type (Content_Type);
   begin
      if Kind = "text/html" or else Kind = "application/xhtml+xml" then
         return Html_Content;
      elsif Kind = "application/json" or else Ends_With (Kind, "+json") then
         return Json_Content;
      elsif Kind in "application/xml" | "text/xml" or else Ends_With (Kind, "+xml") then
         return Xml_Content;
      elsif Starts_With (Kind, "text/") then
         return Text_Content;
      elsif Starts_With (Kind, "image/") then
         return Image_Content;
      elsif Starts_With (Kind, "audio/") then
         return Audio_Content;
      elsif Starts_With (Kind, "video/") then
         return Video_Content;
      elsif Starts_With (Kind, "font/") then
         return Font_Content;
      elsif Kind in "application/zip" | "application/gzip" | "application/x-tar"
        | "application/x-7z-compressed" | "application/x-rar-compressed"
      then
         return Archive_Content;
      elsif Kind = "application/octet-stream" then
         return Binary_Content;
      elsif Kind in "application/x-www-form-urlencoded" | "multipart/form-data" then
         return Form_Content;
      else
         return Unknown_Content;
      end if;
   end Mime_Kind_For;

   function Content_Type_Label
     (Content_Type : String)
      return Humanize.Status.Text_Result
   is
      Base : constant String := Base_Content_Type (Content_Type);
      Kind : constant Mime_Kind := Mime_Kind_For (Content_Type);
   begin
      if Base'Length = 0 then
         return Invalid_Text ("invalid content type");
      end if;

      return Ok_Text
        ((case Kind is
            when Text_Content    => "text content",
            when Html_Content    => "HTML document",
            when Json_Content    => "JSON document",
            when Xml_Content     => "XML document",
            when Image_Content   => "image content",
            when Audio_Content   => "audio content",
            when Video_Content   => "video content",
            when Font_Content    => "font content",
            when Archive_Content => "archive content",
            when Binary_Content  => "binary content",
            when Form_Content    => "form submission",
            when Unknown_Content => "unknown content")
         & " (" & Base & ")");
   end Content_Type_Label;

   function Mime_Kind_Label
     (Kind : Mime_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Kind is
            when Text_Content    => "text content",
            when Html_Content    => "HTML content",
            when Json_Content    => "JSON content",
            when Xml_Content     => "XML content",
            when Image_Content   => "image content",
            when Audio_Content   => "audio content",
            when Video_Content   => "video content",
            when Font_Content    => "font content",
            when Archive_Content => "archive content",
            when Binary_Content  => "binary content",
            when Form_Content    => "form content",
            when Unknown_Content => "unknown content");
   end Mime_Kind_Label;

   function Mime_Kind_Suffix (Kind : Mime_Kind) return String is
   begin
      return Result_Text (Mime_Kind_Label (Kind));
   end Mime_Kind_Suffix;

   function Mime_Kind_Metadata
     (Kind : Mime_Kind)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Markup_Surface, Mime_Kind_Suffix (Kind));
   end Mime_Kind_Metadata;

   function Content_Type_Label
     (Content_Type : String;
      Options      : Markup_Label_Options)
      return Humanize.Status.Text_Result
   is
      Kind : constant Mime_Kind := Mime_Kind_For (Content_Type);
      Base : constant Humanize.Status.Text_Result :=
        Content_Type_Label (Content_Type);
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;

      return Humanize.Domain_Details.Domain_Label
        (Base, Mime_Kind_Metadata (Kind), Domain_Options (Options));
   end Content_Type_Label;

   function Heading_Label
     (Level : Positive)
      return Humanize.Status.Text_Result
   is
   begin
      if Level > 6 then
         return Invalid_Text ("invalid heading level");
      end if;
      return Ok_Text ("heading level " & Digits_Image (Level));
   end Heading_Label;

   function Landmark_Label
     (Role : Landmark_Role)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Role is
            when Banner_Role        => "banner landmark",
            when Navigation_Role    => "navigation landmark",
            when Main_Role          => "main landmark",
            when Complementary_Role => "complementary landmark",
            when Contentinfo_Role   => "content info landmark",
            when Search_Role        => "search landmark",
            when Form_Role          => "form landmark",
            when Region_Role        => "region landmark",
            when Dialog_Role        => "dialog",
            when Alert_Role         => "alert live region",
            when Status_Role        => "status live region",
            when Unknown_Role       => "unknown landmark");
   end Landmark_Label;

   function Landmark_Role_Suffix (Role : Landmark_Role) return String is
   begin
      return Result_Text (Landmark_Label (Role));
   end Landmark_Role_Suffix;

   function Landmark_Role_Metadata
     (Role : Landmark_Role)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Markup_Surface, Landmark_Role_Suffix (Role));
   end Landmark_Role_Metadata;

   function Landmark_Label
     (Role    : Landmark_Role;
      Options : Markup_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Landmark_Label (Role);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Landmark_Role_Metadata (Role), Domain_Options (Options));
   end Landmark_Label;

   function Landmark_Role_For (Name : String) return Landmark_Role is
      Role : constant String := Trimmed_Lower (Name);
   begin
      if Role = "banner" then
         return Banner_Role;
      elsif Role in "navigation" | "nav" then
         return Navigation_Role;
      elsif Role = "main" then
         return Main_Role;
      elsif Role in "complementary" | "aside" then
         return Complementary_Role;
      elsif Role in "contentinfo" | "footer" then
         return Contentinfo_Role;
      elsif Role = "search" then
         return Search_Role;
      elsif Role = "form" then
         return Form_Role;
      elsif Role = "region" then
         return Region_Role;
      elsif Role = "dialog" then
         return Dialog_Role;
      elsif Role = "alert" then
         return Alert_Role;
      elsif Role = "status" then
         return Status_Role;
      else
         return Unknown_Role;
      end if;
   end Landmark_Role_For;

   function Tag_Count_Label
     (Total : Natural;
      Links : Natural := 0;
      Media : Natural := 0;
      Forms : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Text : Unbounded_String :=
        To_Unbounded_String (Count_Text (Total, "tag", "tags"));
   begin
      if Links > 0 then
         Append (Text, ", " & Count_Text (Links, "link", "links"));
      end if;
      if Media > 0 then
         Append (Text, ", " & Count_Text (Media, "media element", "media elements"));
      end if;
      if Forms > 0 then
         Append (Text, ", " & Count_Text (Forms, "form control", "form controls"));
      end if;
      return Ok_Text (To_String (Text));
   end Tag_Count_Label;

   function Document_Outline_Label
     (Headings  : Natural;
      Landmarks : Natural;
      Forms     : Natural := 0;
      Media     : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Text : Unbounded_String :=
        To_Unbounded_String
          (Count_Text (Headings, "heading", "headings")
           & ", " & Count_Text (Landmarks, "landmark", "landmarks"));
   begin
      if Forms > 0 then
         Append (Text, ", " & Count_Text (Forms, "form", "forms"));
      end if;
      if Media > 0 then
         Append (Text, ", " & Count_Text (Media, "media element", "media elements"));
      end if;
      return Ok_Text (To_String (Text));
   end Document_Outline_Label;

   function Parse_Tag_Kind_Label
     (Text : String;
      Kind : Tag_Kind)
      return Markup_Label_Parse_Result
   is
      Result : Markup_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Markup_Surface,
         Tag_Kind_Suffix (Kind));
      Result.Metadata := Tag_Kind_Metadata (Kind);
      return Result;
   end Parse_Tag_Kind_Label;

   function Scan_Tag_Kind_Label
     (Text : String;
      Kind : Tag_Kind)
      return Markup_Label_Parse_Result
   is
      Result : Markup_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Markup_Surface,
         Tag_Kind_Suffix (Kind));
      Result.Metadata := Tag_Kind_Metadata (Kind);
      return Result;
   end Scan_Tag_Kind_Label;

   function Parse_Attribute_Kind_Label
     (Text : String;
      Kind : Attribute_Kind)
      return Markup_Label_Parse_Result
   is
      Result : Markup_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Markup_Surface,
         Attribute_Kind_Suffix (Kind));
      Result.Metadata := Attribute_Kind_Metadata (Kind);
      return Result;
   end Parse_Attribute_Kind_Label;

   function Scan_Attribute_Kind_Label
     (Text : String;
      Kind : Attribute_Kind)
      return Markup_Label_Parse_Result
   is
      Result : Markup_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Markup_Surface,
         Attribute_Kind_Suffix (Kind));
      Result.Metadata := Attribute_Kind_Metadata (Kind);
      return Result;
   end Scan_Attribute_Kind_Label;

   procedure Tag_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Tag_Label (Name);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Tag_Label_Into;

   procedure Tag_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Markup_Label_Options)
   is
   begin
      Copy_Result (Tag_Label (Name, Options), Target, Written, Status);
   end Tag_Label_Into;

   procedure Attribute_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Value   : String := "")
   is
      Result : constant Humanize.Status.Text_Result := Attribute_Label (Name, Value);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Attribute_Label_Into;

   procedure Attribute_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Markup_Label_Options;
      Value   : String := "")
   is
   begin
      Copy_Result
        (Attribute_Label (Name, Options, Value), Target, Written, Status);
   end Attribute_Label_Into;

   procedure Content_Type_Label_Into
     (Content_Type : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Content_Type_Label (Content_Type);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Content_Type_Label_Into;

   procedure Content_Type_Label_Into
     (Content_Type : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Options      : Markup_Label_Options)
   is
   begin
      Copy_Result
        (Content_Type_Label (Content_Type, Options), Target, Written, Status);
   end Content_Type_Label_Into;

   function Accessibility_Issue_Text
     (Issue : Accessibility_Issue_Kind)
      return String
   is
   begin
      case Issue is
         when Missing_Accessible_Name =>
            return "missing accessible name";
         when Low_Contrast =>
            return "low contrast";
         when Skipped_Heading_Level =>
            return "skipped heading level";
         when Missing_Form_Label =>
            return "missing form label";
         when Invalid_ARIA =>
            return "invalid ARIA";
         when Keyboard_Trap =>
            return "keyboard trap";
         when Unknown_Accessibility_Issue =>
            return "unknown accessibility issue";
      end case;
   end Accessibility_Issue_Text;

   function Accessibility_Issue_Label
     (Target : String;
      Issue  : Accessibility_Issue_Kind)
      return Humanize.Status.Text_Result
   is
      Clean_Target : constant String := Clean (Target);
   begin
      if Clean_Target'Length = 0 then
         return Ok_Text (Accessibility_Issue_Text (Issue));
      else
         return Ok_Text (Clean_Target & " " & Accessibility_Issue_Text (Issue));
      end if;
   end Accessibility_Issue_Label;

   function Accessibility_Summary_Label
     (Issues : Natural;
      Target : String := "document")
      return Humanize.Status.Text_Result
   is
      Clean_Target : constant String := Clean (Target);
      Scope : constant String :=
        (if Clean_Target'Length = 0 then "document" else Clean_Target);
   begin
      if Issues = 0 then
         return Ok_Text (Scope & " has no accessibility issues");
      else
         return Ok_Text
           (Scope & " has " & Count_Text (Issues, "accessibility issue",
            "accessibility issues"));
      end if;
   end Accessibility_Summary_Label;

   function Accessible_Control_Role_Text
     (Role : Accessible_Control_Role)
      return String
   is
   begin
      case Role is
         when Button_Control => return "button";
         when Link_Control => return "link";
         when Tab_Control => return "tab";
         when Menu_Item_Control => return "menu item";
         when Checkbox_Control => return "checkbox";
         when Radio_Control => return "radio";
         when Text_Field_Control => return "text field";
         when Progress_Control => return "progress";
         when Table_Cell_Control => return "table cell";
         when Region_Control => return "region";
         when Unknown_Control => return "control";
      end case;
   end Accessible_Control_Role_Text;

   procedure Append_State
     (Text  : in out Unbounded_String;
      Part  : String;
      Count : in out Natural)
   is
   begin
      if Count = 0 then
         Append (Text, " ");
      else
         Append (Text, ", ");
      end if;
      Append (Text, Part);
      Count := Count + 1;
   end Append_State;

   function Accessible_Control_Label
     (Name  : String;
      Role  : Accessible_Control_Role;
      State : Accessible_Control_State := (others => <>))
      return Humanize.Status.Text_Result
   is
      Clean_Name : constant String := Clean (Name);
      Text  : Unbounded_String :=
        To_Unbounded_String
          ((if Clean_Name'Length = 0 then "unnamed" else Clean_Name)
           & " " & Accessible_Control_Role_Text (Role));
      Parts : Natural := 0;
   begin
      if State.Selected then
         Append_State (Text, "selected", Parts);
      end if;
      if State.Expanded then
         Append_State (Text, "expanded", Parts);
      end if;
      if State.Current then
         Append_State (Text, "current", Parts);
      end if;
      if State.Disabled then
         Append_State (Text, "disabled", Parts);
      end if;
      if State.Required then
         Append_State (Text, "required", Parts);
      end if;
      if State.Invalid then
         Append_State (Text, "invalid", Parts);
      end if;
      if State.Count > 0 then
         Append_State
           (Text, Count_Text (State.Count, "item", "items"), Parts);
      end if;
      if State.Position > 0 and then State.Total > 0 then
         Append_State
         (Text, "item " & Digits_Image (State.Position) & " of "
            & Digits_Image (State.Total), Parts);
      end if;
      if State.Issues > 0 then
         Append_State
           (Text, Count_Text (State.Issues, "issue", "issues"), Parts);
      end if;

      return Ok_Text (To_String (Text));
   end Accessible_Control_Label;

   function Accessibility_Page_Summary_Label
     (Title     : String;
      Landmarks : Natural := 0;
      Headings  : Natural := 0;
      Issues    : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Clean_Title : constant String := Clean (Title);
      Name  : constant String :=
        (if Clean_Title'Length = 0 then "page" else Clean_Title);
   begin
      return Ok_Text
        (Name & " accessibility summary: "
         & Count_Text (Landmarks, "landmark", "landmarks") & ", "
         & Count_Text (Headings, "heading", "headings") & ", "
         & Count_Text (Issues, "issue", "issues"));
   end Accessibility_Page_Summary_Label;

   function Form_Error_Summary_Label
     (Form_Name : String;
      Errors    : Natural;
      Warnings  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Clean_Form_Name : constant String := Clean (Form_Name);
      Name  : constant String :=
        (if Clean_Form_Name'Length = 0 then "form" else Clean_Form_Name);
   begin
      if Errors = 0 and then Warnings = 0 then
         return Ok_Text (Name & " has no form issues");
      elsif Warnings = 0 then
         return Ok_Text (Name & " has " & Count_Text (Errors, "error", "errors"));
      else
         return Ok_Text
           (Name & " has " & Count_Text (Errors, "error", "errors")
            & ", " & Count_Text (Warnings, "warning", "warnings"));
      end if;
   end Form_Error_Summary_Label;

   function Table_Navigation_Label
     (Caption : String;
      Row     : Positive;
      Column  : Positive;
      Rows    : Positive;
      Columns : Positive)
      return Humanize.Status.Text_Result
   is
      Clean_Caption : constant String := Clean (Caption);
      Name  : constant String :=
        (if Clean_Caption'Length = 0 then "table" else Clean_Caption);
   begin
      return Ok_Text
        (Name & " row " & Digits_Image (Row) & " of " & Digits_Image (Rows)
         & ", column " & Digits_Image (Column) & " of "
         & Digits_Image (Columns));
   end Table_Navigation_Label;

   function Live_Region_Update_Label
     (Region : String;
      Update : String;
      Polite : Boolean := True)
      return Humanize.Status.Text_Result
   is
      Clean_Region : constant String := Clean (Region);
      Clean_Update : constant String := Clean (Update);
      Mode : constant String := (if Polite then "polite" else "assertive");
   begin
      return Ok_Text
        ((if Clean_Region'Length = 0 then "live region" else Clean_Region)
         & " " & Mode & " update: "
         & (if Clean_Update'Length = 0 then "updated" else Clean_Update));
   end Live_Region_Update_Label;

   function Accessibility_Remediation_Label
     (Issue : Accessibility_Issue_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      case Issue is
         when Missing_Accessible_Name =>
            return Ok_Text ("add an accessible name");
         when Low_Contrast =>
            return Ok_Text ("increase text contrast");
         when Skipped_Heading_Level =>
            return Ok_Text ("use sequential heading levels");
         when Missing_Form_Label =>
            return Ok_Text ("associate a label with the form control");
         when Invalid_ARIA =>
            return Ok_Text ("use a valid ARIA role or attribute");
         when Keyboard_Trap =>
            return Ok_Text ("ensure keyboard focus can leave the component");
         when Unknown_Accessibility_Issue =>
            return Ok_Text ("review accessibility issue");
      end case;
   end Accessibility_Remediation_Label;

   procedure Accessible_Control_Label_Into
     (Name    : String;
      Role    : Accessible_Control_Role;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Accessible_Control_State := (others => <>))
   is
      Result : constant Humanize.Status.Text_Result :=
        Accessible_Control_Label (Name, Role, State);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Accessible_Control_Label_Into;

end Humanize.Markup;
