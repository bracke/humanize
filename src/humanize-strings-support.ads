with Humanize.Status;

package Humanize.Strings.Support is

   function Truncate
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;

   function Truncate_Words
     (Text      : String;
      Max_Words : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;

   function Capitalize
     (Text      : String;
      Downcase  : Boolean := False)
      return Humanize.Status.Text_Result;

   function Title_Case
     (Text : String)
      return Humanize.Status.Text_Result;

   function Title_Case_Smart
     (Text : String)
      return Humanize.Status.Text_Result;

   function Title_Case_With_Options
     (Text    : String;
      Options : Title_Case_Options := Default_Title_Case_Options)
      return Humanize.Status.Text_Result;

   function Title_Case_With_Word_Lists
     (Text        : String;
      Acronyms    : String := "";
      Small_Words : String := "")
      return Humanize.Status.Text_Result;

   function Editorial_Title
     (Text  : String;
      Style : Editorial_Title_Style := AP_Title)
      return Humanize.Status.Text_Result;

   function NL_To_BR
     (Text : String)
      return Humanize.Status.Text_Result;

   function BR_To_NL
     (Text : String)
      return Humanize.Status.Text_Result;

   function Parameterize
     (Text      : String;
      Separator : Character := '-')
      return Humanize.Status.Text_Result;

   function Dasherize
     (Text : String)
      return Humanize.Status.Text_Result;

   function Underscore
     (Text : String)
      return Humanize.Status.Text_Result;

   function Camelize
     (Text        : String;
      Upper_First : Boolean := True)
      return Humanize.Status.Text_Result;

   function Humanize_String
     (Text : String)
      return Humanize.Status.Text_Result;

   function Deconstantize
     (Text : String)
      return Humanize.Status.Text_Result;

   function Demodulize
     (Text : String)
      return Humanize.Status.Text_Result;

   function Tableize
     (Text : String)
      return Humanize.Status.Text_Result;

   function Classify
     (Text : String)
      return Humanize.Status.Text_Result;

   function Foreign_Key
     (Text             : String;
      Separate_Class_Id : Boolean := True)
      return Humanize.Status.Text_Result;

   function Acronym
     (Text    : String;
      Options : Identifier_Options := Default_Identifier_Options)
      return Humanize.Status.Text_Result;

   function Escape_HTML
     (Text : String)
      return Humanize.Status.Text_Result;

   function Preserve_Separator
     (Text      : String;
      Separator : Character)
      return Humanize.Status.Text_Result;

   function Normalize_Whitespace
     (Text : String)
      return Humanize.Status.Text_Result;

   function Squish
     (Text : String)
      return Humanize.Status.Text_Result;

   function Strip_Tags
     (Text : String)
      return Humanize.Status.Text_Result;

   function Excerpt
     (Text      : String;
      Phrase    : String;
      Radius    : Natural := 32;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;

   function Excerpt_With_Options
     (Text      : String;
      Phrase    : String;
      Radius    : Natural := 32;
      Ellipsis  : String := "...";
      Options   : Match_Options := Default_Match_Options)
      return Humanize.Status.Text_Result;

   function Excerpt_With_Context
     (Text          : String;
      Phrase        : String;
      Context_Words : Natural := 5;
      Ellipsis      : String := "...")
      return Humanize.Status.Text_Result;

   function Excerpt_With_Context_Options
     (Text          : String;
      Phrase        : String;
      Context_Words : Natural := 5;
      Ellipsis      : String := "...";
      Options       : Match_Options := Default_Match_Options)
      return Humanize.Status.Text_Result;

   function Word_Count (Text : String) return Natural;

   function Sentence_Count (Text : String) return Natural;

   function Paragraph_Count (Text : String) return Natural;

   function Text_Metrics
     (Text : String)
      return Text_Metrics_Result;

   function Word_Count_Summary
     (Text : String)
      return Humanize.Status.Text_Result;

   function Sentence_Count_Summary
     (Text : String)
      return Humanize.Status.Text_Result;

   function Paragraph_Count_Summary
     (Text : String)
      return Humanize.Status.Text_Result;

   function Reading_Time
     (Text    : String;
      Options : Text_Time_Options := Default_Text_Time_Options)
      return Humanize.Status.Text_Result;

   function Speaking_Time
     (Text    : String;
      Options : Text_Time_Options := Default_Text_Time_Options)
      return Humanize.Status.Text_Result;

   function Text_Summary
     (Text    : String;
      Options : Text_Summary_Options := Default_Text_Summary_Options)
      return Humanize.Status.Text_Result;

   function Text_Summary_With_Options
     (Text    : String;
      Options : Text_Summary_Composition_Options :=
        Default_Text_Summary_Composition_Options)
      return Humanize.Status.Text_Result;

   function Highlight
     (Text   : String;
      Phrase : String;
      Before : String := "<mark>";
      After  : String := "</mark>")
      return Humanize.Status.Text_Result;

   function Highlight_With_Options
     (Text    : String;
      Phrase  : String;
      Before  : String := "<mark>";
      After   : String := "</mark>";
      Options : Highlight_Options := Default_Highlight_Options)
      return Humanize.Status.Text_Result;

   function Highlighted_Excerpt
     (Text               : String;
      Phrase             : String;
      Radius             : Natural := 32;
      Ellipsis           : String := "...";
      Before             : String := "<mark>";
      After              : String := "</mark>";
      Options            : Highlight_Options := Default_Highlight_Options;
      Escape_HTML_Output : Boolean := True)
      return Humanize.Status.Text_Result;

   function Mask
     (Text         : String;
      Visible_Last : Natural := 4;
      Mask_Char    : Character := '*')
      return Humanize.Status.Text_Result;

   function Normalize_Token
     (Text      : String;
      Case_Mode : Token_Case_Mode := Preserve_Token_Case)
      return Humanize.Status.Text_Result;

   function Group_Token
     (Text    : String;
      Options : Token_Group_Options := Default_Token_Group_Options)
      return Humanize.Status.Text_Result;

   function Masked_Token
     (Text         : String;
      Visible_Last : Natural := 4;
      Options      : Token_Group_Options := Default_Token_Group_Options;
      Mask_Char    : Character := '*')
      return Humanize.Status.Text_Result;

   function Safe_Filename
     (Text      : String;
      Separator : Character := '-')
      return Humanize.Status.Text_Result;

   function Safe_Filename
     (Text    : String;
      Options : Safe_Filename_Options)
      return Humanize.Status.Text_Result;

   function Path_Basename
     (Path : String)
      return Humanize.Status.Text_Result;

   function Path_Title
     (Path : String)
      return Humanize.Status.Text_Result;

   function Path_Title
     (Path    : String;
      Options : Path_Title_Options)
      return Humanize.Status.Text_Result;

   function Extension_Label
     (Path : String)
      return Humanize.Status.Text_Result;

   function Extension_Label
     (Path    : String;
      Options : Extension_Label_Options)
      return Humanize.Status.Text_Result;

   function Shorten_Path
     (Path    : String;
      Options : Path_Shorten_Options := Default_Path_Shorten_Options)
      return Humanize.Status.Text_Result;

   function Symbolic_File_Mode
     (Mode : File_Mode_Value;
      Kind : File_Mode_Kind := Mode_Only)
      return Humanize.Status.Text_Result;

   function Octal_File_Mode
     (Mode            : File_Mode_Value;
      Include_Special : Boolean := False;
      Prefix          : Boolean := False)
      return Humanize.Status.Text_Result;

   function File_Mode_Summary
     (Mode : File_Mode_Value;
      Kind : File_Mode_Kind := Mode_Only)
      return Humanize.Status.Text_Result;

   function Parse_File_Mode
     (Text : String;
      Mode : out File_Mode_Value;
      Kind : out File_Mode_Kind)
      return Humanize.Status.Status_Code;

   function Search_Key
     (Text : String)
      return Humanize.Status.Text_Result;

   function Natural_Sort_Key
     (Text : String)
      return Humanize.Status.Text_Result;

   function Natural_Less
     (Left  : String;
      Right : String)
      return Boolean;

   function Initials
     (Text : String)
      return Humanize.Status.Text_Result;

   function Possessive
     (Text : String)
      return Humanize.Status.Text_Result;

   function Clean_Name
     (Text : String)
      return Humanize.Status.Text_Result;

   function Person_Initials
     (Text         : String;
      Max_Initials : Initial_Count_Limit := 3)
      return Humanize.Status.Text_Result;

   function Name_Part
     (Text    : String;
      Style   : Name_Display_Style;
      Options : Person_Name_Options := Default_Person_Name_Options)
      return Humanize.Status.Text_Result;

   function Handle_Label
     (Handle      : String;
      Preserve_At : Boolean := True)
      return Humanize.Status.Text_Result;

   function Email_Local_Part
     (Email : String)
      return Humanize.Status.Text_Result;

   function Display_Name
     (Name     : String;
      Handle   : String := "";
      Email    : String := "";
      Fallback : String := "Anonymous";
      Options  : Person_Name_Options := Default_Person_Name_Options)
      return Humanize.Status.Text_Result;

   function Possessive_Name
     (Name     : String;
      Fallback : String := "someone")
      return Humanize.Status.Text_Result;

   function Person_List
     (Names    : Name_List;
      Limit    : Positive := 2;
      Fallback : String := "no one")
      return Humanize.Status.Text_Result;

   function Transliterate_ASCII
     (Text : String)
      return Humanize.Status.Text_Result;

   function Casefold_ASCII
     (Text : String)
      return Humanize.Status.Text_Result;

   function Pluralize
     (Word : String)
      return Humanize.Status.Text_Result;

   function Singularize
     (Word : String)
      return Humanize.Status.Text_Result;

   function Pluralize_With_Dictionary
     (Word      : String;
      Singulars : String;
      Plurals   : String)
      return Humanize.Status.Text_Result;

   function Singularize_With_Dictionary
     (Word      : String;
      Singulars : String;
      Plurals   : String)
      return Humanize.Status.Text_Result;

   function Pluralize_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Humanize.Status.Text_Result;

   function Singularize_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Humanize.Status.Text_Result;

   function Pluralize_In_Language
     (Word     : String;
      Language : Inflection_Language)
      return Humanize.Status.Text_Result;

   function Singularize_In_Language
     (Word     : String;
      Language : Inflection_Language)
      return Humanize.Status.Text_Result;

   function Inflection_Language_Label
     (Language : Inflection_Language)
      return Humanize.Status.Text_Result;

   function Pluralize_Source
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "")
      return Inflection_Source;

   function Singularize_Source
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "")
      return Inflection_Source;

   function Pluralize_Source_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Inflection_Source;

   function Singularize_Source_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Inflection_Source;

   function Inflection_Source_Label
     (Source : Inflection_Source)
      return Humanize.Status.Text_Result;

   procedure Inflection_Source_Label_Into
     (Source  : Inflection_Source;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   function UTF8_Length
     (Text : String)
      return Natural;

   function UTF8_Display_Width
     (Text : String)
      return Natural;

   function Grapheme_Length
     (Text : String)
      return Natural;

   function Grapheme_Display_Width
     (Text : String)
      return Natural;

   function ANSI_Display_Width
     (Text : String)
      return Natural;

   function Truncate_UTF8
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;

   function UTF8_Slice
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural)
      return Humanize.Status.Text_Result;

   function Truncate_UTF8_Words
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;

   function Truncate_Graphemes
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;

   function Truncate_Display_Width
     (Text      : String;
      Max_Width : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;

   function Truncate_ANSI_Display_Width
     (Text      : String;
      Max_Width : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;

   function Wrap_Display_Width
     (Text      : String;
      Max_Width : Positive;
      Indent    : Natural := 0)
      return Humanize.Status.Text_Result;

   function Wrap_ANSI_Display_Width
     (Text      : String;
      Max_Width : Positive;
      Indent    : Natural := 0)
      return Humanize.Status.Text_Result;

   function Wrap_ANSI_Display_Width_Styled
     (Text      : String;
      Max_Width : Positive;
      Indent    : Natural := 0)
      return Humanize.Status.Text_Result;

   function Key_Value_Line
     (Key       : String;
      Value     : String;
      Separator : String := ": ")
      return Humanize.Status.Text_Result;

   function Aligned_Key_Value_Line
     (Key       : String;
      Value     : String;
      Key_Width : Natural;
      Separator : String := " : ")
      return Humanize.Status.Text_Result;

   function Table_Row_2
     (Left       : String;
      Right      : String;
      Left_Width : Natural;
      Separator  : String := "  ")
      return Humanize.Status.Text_Result;

   function Table_Row_3
     (Left         : String;
      Middle       : String;
      Right        : String;
      Left_Width   : Natural;
      Middle_Width : Natural;
      Separator    : String := "  ")
      return Humanize.Status.Text_Result;

   function Table_2
     (Left_Column  : Name_List;
      Right_Column : Name_List;
      Left_Width   : Natural;
      Separator    : String := "  ")
      return Humanize.Status.Text_Result;

   function Table_3
     (Left_Column   : Name_List;
      Middle_Column : Name_List;
      Right_Column  : Name_List;
      Left_Width    : Natural;
      Middle_Width  : Natural;
      Separator     : String := "  ")
      return Humanize.Status.Text_Result;

   function Grapheme_Slice
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural)
      return Humanize.Status.Text_Result;

   function Truncate_Grapheme_Words
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;

   procedure Truncate_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");

   procedure Truncate_UTF8_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");

   procedure UTF8_Slice_Into
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);

   procedure Truncate_UTF8_Words_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");

   procedure Truncate_Graphemes_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");

   procedure Truncate_Display_Width_Into
     (Text      : String;
      Max_Width : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");

   procedure Truncate_ANSI_Display_Width_Into
     (Text      : String;
      Max_Width : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");

   procedure Wrap_Display_Width_Into
     (Text      : String;
      Max_Width : Positive;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Indent    : Natural := 0);

   procedure Wrap_ANSI_Display_Width_Into
     (Text      : String;
      Max_Width : Positive;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Indent    : Natural := 0);

   procedure Key_Value_Line_Into
     (Key       : String;
      Value     : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : String := ": ");

   procedure Aligned_Key_Value_Line_Into
     (Key       : String;
      Value     : String;
      Key_Width : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : String := " : ");

   procedure Table_Row_2_Into
     (Left       : String;
      Right      : String;
      Left_Width : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Separator  : String := "  ");

   procedure Table_Row_3_Into
     (Left         : String;
      Middle       : String;
      Right        : String;
      Left_Width   : Natural;
      Middle_Width : Natural;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Separator    : String := "  ");

   procedure Table_2_Into
     (Left_Column  : Name_List;
      Right_Column : Name_List;
      Left_Width   : Natural;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Separator    : String := "  ");

   procedure Table_3_Into
     (Left_Column   : Name_List;
      Middle_Column : Name_List;
      Right_Column  : Name_List;
      Left_Width    : Natural;
      Middle_Width  : Natural;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Separator     : String := "  ");

   procedure Grapheme_Slice_Into
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);

   procedure Truncate_Grapheme_Words_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");

   procedure Truncate_Words_Into
     (Text      : String;
      Max_Words : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");

   procedure Capitalize_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Downcase  : Boolean := False);

   procedure Title_Case_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Title_Case_Smart_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Title_Case_With_Options_Into
     (Text    : String;
      Options : Title_Case_Options;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Title_Case_With_Word_Lists_Into
     (Text        : String;
      Acronyms    : String;
      Small_Words : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code);

   procedure Editorial_Title_Into
     (Text    : String;
      Style   : Editorial_Title_Style;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure NL_To_BR_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure BR_To_NL_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Parameterize_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : Character := '-');

   procedure Dasherize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Underscore_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Camelize_Into
     (Text        : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Upper_First : Boolean := True);

   procedure Humanize_String_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Deconstantize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Demodulize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Tableize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Classify_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Foreign_Key_Into
     (Text             : String;
      Target           : in out String;
      Written          : out Natural;
      Status           : out Humanize.Status.Status_Code;
      Separate_Class_Id : Boolean := True);

   procedure Acronym_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Identifier_Options := Default_Identifier_Options);

   procedure Escape_HTML_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Preserve_Separator_Into
     (Text      : String;
      Separator : Character;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);

   procedure Normalize_Whitespace_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Squish_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Strip_Tags_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Mask_Into
     (Text         : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Visible_Last : Natural := 4;
      Mask_Char    : Character := '*');

   procedure Normalize_Token_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Case_Mode : Token_Case_Mode := Preserve_Token_Case);

   procedure Group_Token_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Token_Group_Options := Default_Token_Group_Options);

   procedure Masked_Token_Into
     (Text         : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Visible_Last : Natural := 4;
      Options      : Token_Group_Options := Default_Token_Group_Options;
      Mask_Char    : Character := '*');

   procedure Safe_Filename_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : Character := '-');

   procedure Safe_Filename_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Safe_Filename_Options);

   procedure Path_Basename_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Path_Title_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Path_Title_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Path_Title_Options);

   procedure Extension_Label_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Extension_Label_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Extension_Label_Options);

   procedure Shorten_Path_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Path_Shorten_Options := Default_Path_Shorten_Options);

   procedure Symbolic_File_Mode_Into
     (Mode    : File_Mode_Value;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : File_Mode_Kind := Mode_Only);

   procedure Octal_File_Mode_Into
     (Mode            : File_Mode_Value;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code;
      Include_Special : Boolean := False;
      Prefix          : Boolean := False);

   procedure File_Mode_Summary_Into
     (Mode    : File_Mode_Value;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : File_Mode_Kind := Mode_Only);

   procedure Search_Key_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Natural_Sort_Key_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Excerpt_Into
     (Text      : String;
      Phrase    : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Radius    : Natural := 32;
      Ellipsis  : String := "...");

   procedure Excerpt_With_Context_Into
     (Text          : String;
      Phrase        : String;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Context_Words : Natural := 5;
      Ellipsis      : String := "...");

   procedure Excerpt_With_Options_Into
     (Text      : String;
      Phrase    : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Radius    : Natural := 32;
      Ellipsis  : String := "...";
      Options   : Match_Options := Default_Match_Options);

   procedure Excerpt_With_Context_Options_Into
     (Text          : String;
      Phrase        : String;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Context_Words : Natural := 5;
      Ellipsis      : String := "...";
      Options       : Match_Options := Default_Match_Options);

   procedure Word_Count_Summary_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Sentence_Count_Summary_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Paragraph_Count_Summary_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Reading_Time_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Text_Time_Options := Default_Text_Time_Options);

   procedure Speaking_Time_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Text_Time_Options := Default_Text_Time_Options);

   procedure Text_Summary_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Text_Summary_Options := Default_Text_Summary_Options);

   procedure Text_Summary_With_Options_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Text_Summary_Composition_Options :=
        Default_Text_Summary_Composition_Options);

   procedure Highlight_Into
     (Text    : String;
      Phrase  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Before  : String := "<mark>";
      After   : String := "</mark>");

   procedure Highlight_With_Options_Into
     (Text    : String;
      Phrase  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Before  : String := "<mark>";
      After   : String := "</mark>";
      Options : Highlight_Options := Default_Highlight_Options);

   procedure Highlighted_Excerpt_Into
     (Text               : String;
      Phrase             : String;
      Target             : in out String;
      Written            : out Natural;
      Status             : out Humanize.Status.Status_Code;
      Radius             : Natural := 32;
      Ellipsis           : String := "...";
      Before             : String := "<mark>";
      After              : String := "</mark>";
      Options            : Highlight_Options := Default_Highlight_Options;
      Escape_HTML_Output : Boolean := True);

   procedure Initials_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Possessive_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Clean_Name_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Person_Initials_Into
     (Text         : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Max_Initials : Initial_Count_Limit := 3);

   procedure Name_Part_Into
     (Text    : String;
      Style   : Name_Display_Style;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Person_Name_Options := Default_Person_Name_Options);

   procedure Handle_Label_Into
     (Handle      : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Preserve_At : Boolean := True);

   procedure Email_Local_Part_Into
     (Email   : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Display_Name_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Handle   : String := "";
      Email    : String := "";
      Fallback : String := "Anonymous";
      Options  : Person_Name_Options := Default_Person_Name_Options);

   procedure Possessive_Name_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Fallback : String := "someone");

   procedure Person_List_Into
     (Names    : Name_List;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Limit    : Positive := 2;
      Fallback : String := "no one");

   procedure Transliterate_ASCII_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   function Slug
     (Text      : String;
      Separator : Character := '-')
      return Humanize.Status.Text_Result;

   procedure Slug_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : Character := '-');

   function Safe_Email_Label
     (Email : String)
      return Humanize.Status.Text_Result;

   function Safe_Phone_Label
     (Phone : String;
      Visible_Digits : Natural := 4)
      return Humanize.Status.Text_Result;

   function Safe_Handle_Label
     (Handle : String)
      return Humanize.Status.Text_Result;

   function Code_Symbol_Label
     (Symbol : String)
      return Humanize.Status.Text_Result;

   function Source_Location_Label
     (Path   : String;
      Line   : Natural := 0;
      Column : Natural := 0)
      return Humanize.Status.Text_Result;

   function Prose_List
     (Items   : Name_List;
      Options : Prose_List_Options := Default_Prose_List_Options)
      return Humanize.Status.Text_Result;

   function Sentence_From_Parts
     (Parts : Name_List)
      return Humanize.Status.Text_Result;

   function Generic_Range_Label
     (Low     : String;
      High    : String;
      Options : Generic_Range_Options)
      return Humanize.Status.Text_Result;

   function Uncertainty_Label
     (Value       : String;
      Uncertainty : String;
      Unit        : String := "")
      return Humanize.Status.Text_Result;

   function Text_Change_Metadata_For
     (Old_Text : String;
      New_Text : String)
      return Text_Change_Metadata;

   function Text_Change_Label
     (Old_Text : String;
      New_Text : String)
      return Humanize.Status.Text_Result;

   function Address_Label
     (Address   : Address_Fields;
      Multiline : Boolean := False)
      return Humanize.Status.Text_Result;

   function Address_Metadata_Label
     (Address : Address_Fields)
      return Humanize.Status.Text_Result;

   function Privacy_Address_Label
     (Address : Address_Fields)
      return Humanize.Status.Text_Result;

   function Data_Shape_Label
     (Shape : Data_Shape_Metadata)
      return Humanize.Status.Text_Result;

   function Infer_Data_Shape
     (Text : String)
      return Data_Shape_Metadata;

   function Data_Shape_Label
     (Text : String)
      return Humanize.Status.Text_Result;

   function Label_Coverage_Audit_Label
     (Coverage : Label_Coverage_Metadata)
      return Humanize.Status.Text_Result;

   function Transliteration_Coverage_Label
     (Text : String)
      return Humanize.Status.Text_Result;

   function Text_Boundary_Summary_Label
     (Text : String)
      return Humanize.Status.Text_Result;

   function Terminal_Paragraph
     (Text         : String;
      Width        : Positive;
      Prefix       : String := "";
      Continuation : String := "")
      return Humanize.Status.Text_Result;

   function Terminal_Bullet_List
     (Items  : Name_List;
      Width  : Positive;
      Bullet : String := "- ")
      return Humanize.Status.Text_Result;

   function Text_Metadata_Label
     (Text : String)
      return Humanize.Status.Text_Result;

   function Terminal_Section
     (Title   : String;
      Content : String;
      Options : Terminal_Layout_Options := Default_Terminal_Layout_Options)
      return Humanize.Status.Text_Result;

   function Terminal_Key_Value_Block
     (Keys    : Name_List;
      Values  : Name_List;
      Options : Terminal_Layout_Options := Default_Terminal_Layout_Options)
      return Humanize.Status.Text_Result;

   function Terminal_Status_Block
     (Status_Label : String;
      Detail       : String := "";
      Options      : Terminal_Layout_Options := Default_Terminal_Layout_Options)
      return Humanize.Status.Text_Result;

   procedure Transliteration_Coverage_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Text_Boundary_Summary_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Terminal_Paragraph_Into
     (Text         : String;
      Width        : Positive;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Prefix       : String := "";
      Continuation : String := "");

   procedure Text_Metadata_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Prose_List_Into
     (Items   : Name_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Prose_List_Options := Default_Prose_List_Options);

   procedure Text_Change_Label_Into
     (Old_Text : String;
      New_Text : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);

   procedure Data_Shape_Label_Into
     (Shape   : Data_Shape_Metadata;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Pluralize_Into
     (Word    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Singularize_Into
     (Word    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Casefold_ASCII_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Pluralize_With_Dictionary_Into
     (Word      : String;
      Singulars : String;
      Plurals   : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);

   procedure Singularize_With_Dictionary_Into
     (Word      : String;
      Singulars : String;
      Plurals   : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);

   procedure Pluralize_With_Options_Into
     (Word      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options);

   procedure Singularize_With_Options_Into
     (Word      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options);

   procedure Pluralize_In_Language_Into
     (Word     : String;
      Language : Inflection_Language;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);

   procedure Singularize_In_Language_Into
     (Word     : String;
      Language : Inflection_Language;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);

   procedure Inflection_Language_Label_Into
     (Language : Inflection_Language;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);

   procedure Copy_Into
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
end Humanize.Strings.Support;
