with Humanize.Strings.Support.Backend;

package body Humanize.Strings.Support is

   function Truncate
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Truncate;

   function Truncate_Words
     (Text      : String;
      Max_Words : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Truncate_Words;

   function Capitalize
     (Text      : String;
      Downcase  : Boolean := False)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Capitalize;

   function Title_Case
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Title_Case;

   function Title_Case_Smart
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Title_Case_Smart;

   function Title_Case_With_Options
     (Text    : String;
      Options : Title_Case_Options := Default_Title_Case_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Title_Case_With_Options;

   function Title_Case_With_Word_Lists
     (Text        : String;
      Acronyms    : String := "";
      Small_Words : String := "")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Title_Case_With_Word_Lists;

   function Editorial_Title
     (Text  : String;
      Style : Editorial_Title_Style := AP_Title)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Editorial_Title;

   function NL_To_BR
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.NL_To_BR;

   function BR_To_NL
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.BR_To_NL;

   function Parameterize
     (Text      : String;
      Separator : Character := '-')
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Parameterize;

   function Dasherize
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Dasherize;

   function Underscore
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Underscore;

   function Camelize
     (Text        : String;
      Upper_First : Boolean := True)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Camelize;

   function Humanize_String
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Humanize_String;

   function Deconstantize
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Deconstantize;

   function Demodulize
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Demodulize;

   function Tableize
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Tableize;

   function Classify
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Classify;

   function Foreign_Key
     (Text             : String;
      Separate_Class_Id : Boolean := True)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Foreign_Key;

   function Acronym
     (Text    : String;
      Options : Identifier_Options := Default_Identifier_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Acronym;

   function Escape_HTML
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Escape_HTML;

   function Preserve_Separator
     (Text      : String;
      Separator : Character)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Preserve_Separator;

   function Normalize_Whitespace
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Normalize_Whitespace;

   function Squish
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Squish;

   function Strip_Tags
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Strip_Tags;

   function Excerpt
     (Text      : String;
      Phrase    : String;
      Radius    : Natural := 32;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Excerpt;

   function Excerpt_With_Options
     (Text      : String;
      Phrase    : String;
      Radius    : Natural := 32;
      Ellipsis  : String := "...";
      Options   : Match_Options := Default_Match_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Excerpt_With_Options;

   function Excerpt_With_Context
     (Text          : String;
      Phrase        : String;
      Context_Words : Natural := 5;
      Ellipsis      : String := "...")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Excerpt_With_Context;

   function Excerpt_With_Context_Options
     (Text          : String;
      Phrase        : String;
      Context_Words : Natural := 5;
      Ellipsis      : String := "...";
      Options       : Match_Options := Default_Match_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Excerpt_With_Context_Options;

   function Word_Count (Text : String) return Natural
      renames Humanize.Strings.Support.Backend.Word_Count;

   function Sentence_Count (Text : String) return Natural
      renames Humanize.Strings.Support.Backend.Sentence_Count;

   function Paragraph_Count (Text : String) return Natural
      renames Humanize.Strings.Support.Backend.Paragraph_Count;

   function Text_Metrics
     (Text : String)
      return Text_Metrics_Result
      renames Humanize.Strings.Support.Backend.Text_Metrics;

   function Word_Count_Summary
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Word_Count_Summary;

   function Sentence_Count_Summary
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Sentence_Count_Summary;

   function Paragraph_Count_Summary
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Paragraph_Count_Summary;

   function Reading_Time
     (Text    : String;
      Options : Text_Time_Options := Default_Text_Time_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Reading_Time;

   function Speaking_Time
     (Text    : String;
      Options : Text_Time_Options := Default_Text_Time_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Speaking_Time;

   function Text_Summary
     (Text    : String;
      Options : Text_Summary_Options := Default_Text_Summary_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Text_Summary;

   function Text_Summary_With_Options
     (Text    : String;
      Options : Text_Summary_Composition_Options :=
        Default_Text_Summary_Composition_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Text_Summary_With_Options;

   function Highlight
     (Text   : String;
      Phrase : String;
      Before : String := "<mark>";
      After  : String := "</mark>")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Highlight;

   function Highlight_With_Options
     (Text    : String;
      Phrase  : String;
      Before  : String := "<mark>";
      After   : String := "</mark>";
      Options : Highlight_Options := Default_Highlight_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Highlight_With_Options;

   function Highlighted_Excerpt
     (Text               : String;
      Phrase             : String;
      Radius             : Natural := 32;
      Ellipsis           : String := "...";
      Before             : String := "<mark>";
      After              : String := "</mark>";
      Options            : Highlight_Options := Default_Highlight_Options;
      Escape_HTML_Output : Boolean := True)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Highlighted_Excerpt;

   function Mask
     (Text         : String;
      Visible_Last : Natural := 4;
      Mask_Char    : Character := '*')
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Mask;

   function Normalize_Token
     (Text      : String;
      Case_Mode : Token_Case_Mode := Preserve_Token_Case)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Normalize_Token;

   function Group_Token
     (Text    : String;
      Options : Token_Group_Options := Default_Token_Group_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Group_Token;

   function Masked_Token
     (Text         : String;
      Visible_Last : Natural := 4;
      Options      : Token_Group_Options := Default_Token_Group_Options;
      Mask_Char    : Character := '*')
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Masked_Token;

   function Safe_Filename
     (Text      : String;
      Separator : Character := '-')
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Safe_Filename;

   function Safe_Filename
     (Text    : String;
      Options : Safe_Filename_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Safe_Filename;

   function Path_Basename
     (Path : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Path_Basename;

   function Path_Title
     (Path : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Path_Title;

   function Path_Title
     (Path    : String;
      Options : Path_Title_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Path_Title;

   function Extension_Label
     (Path : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Extension_Label;

   function Extension_Label
     (Path    : String;
      Options : Extension_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Extension_Label;

   function Shorten_Path
     (Path    : String;
      Options : Path_Shorten_Options := Default_Path_Shorten_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Shorten_Path;

   function Symbolic_File_Mode
     (Mode : File_Mode_Value;
      Kind : File_Mode_Kind := Mode_Only)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Symbolic_File_Mode;

   function Octal_File_Mode
     (Mode            : File_Mode_Value;
      Include_Special : Boolean := False;
      Prefix          : Boolean := False)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Octal_File_Mode;

   function File_Mode_Summary
     (Mode : File_Mode_Value;
      Kind : File_Mode_Kind := Mode_Only)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.File_Mode_Summary;

   function Parse_File_Mode
     (Text : String;
      Mode : out File_Mode_Value;
      Kind : out File_Mode_Kind)
      return Humanize.Status.Status_Code
      renames Humanize.Strings.Support.Backend.Parse_File_Mode;

   function Search_Key
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Search_Key;

   function Natural_Sort_Key
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Natural_Sort_Key;

   function Natural_Less
     (Left  : String;
      Right : String)
      return Boolean
      renames Humanize.Strings.Support.Backend.Natural_Less;

   function Initials
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Initials;

   function Possessive
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Possessive;

   function Clean_Name
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Clean_Name;

   function Person_Initials
     (Text         : String;
      Max_Initials : Initial_Count_Limit := 3)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Person_Initials;

   function Name_Part
     (Text    : String;
      Style   : Name_Display_Style;
      Options : Person_Name_Options := Default_Person_Name_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Name_Part;

   function Handle_Label
     (Handle      : String;
      Preserve_At : Boolean := True)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Handle_Label;

   function Email_Local_Part
     (Email : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Email_Local_Part;

   function Display_Name
     (Name     : String;
      Handle   : String := "";
      Email    : String := "";
      Fallback : String := "Anonymous";
      Options  : Person_Name_Options := Default_Person_Name_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Display_Name;

   function Possessive_Name
     (Name     : String;
      Fallback : String := "someone")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Possessive_Name;

   function Person_List
     (Names    : Name_List;
      Limit    : Positive := 2;
      Fallback : String := "no one")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Person_List;

   function Transliterate_ASCII
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Transliterate_ASCII;

   function Casefold_ASCII
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Casefold_ASCII;

   function Pluralize
     (Word : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Pluralize;

   function Singularize
     (Word : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Singularize;

   function Pluralize_With_Dictionary
     (Word      : String;
      Singulars : String;
      Plurals   : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Pluralize_With_Dictionary;

   function Singularize_With_Dictionary
     (Word      : String;
      Singulars : String;
      Plurals   : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Singularize_With_Dictionary;

   function Pluralize_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Pluralize_With_Options;

   function Singularize_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Singularize_With_Options;

   function Pluralize_In_Language
     (Word     : String;
      Language : Inflection_Language)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Pluralize_In_Language;

   function Singularize_In_Language
     (Word     : String;
      Language : Inflection_Language)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Singularize_In_Language;

   function Inflection_Language_Label
     (Language : Inflection_Language)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Inflection_Language_Label;

   function Pluralize_Source
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "")
      return Inflection_Source
      renames Humanize.Strings.Support.Backend.Pluralize_Source;

   function Singularize_Source
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "")
      return Inflection_Source
      renames Humanize.Strings.Support.Backend.Singularize_Source;

   function Pluralize_Source_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Inflection_Source
      renames Humanize.Strings.Support.Backend.Pluralize_Source_With_Options;

   function Singularize_Source_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Inflection_Source
      renames Humanize.Strings.Support.Backend.Singularize_Source_With_Options;

   function Inflection_Source_Label
     (Source : Inflection_Source)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Inflection_Source_Label;

   procedure Inflection_Source_Label_Into
     (Source  : Inflection_Source;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Inflection_Source_Label_Into;

   function UTF8_Length
     (Text : String)
      return Natural
      renames Humanize.Strings.Support.Backend.UTF8_Length;

   function UTF8_Display_Width
     (Text : String)
      return Natural
      renames Humanize.Strings.Support.Backend.UTF8_Display_Width;

   function Grapheme_Length
     (Text : String)
      return Natural
      renames Humanize.Strings.Support.Backend.Grapheme_Length;

   function Grapheme_Display_Width
     (Text : String)
      return Natural
      renames Humanize.Strings.Support.Backend.Grapheme_Display_Width;

   function ANSI_Display_Width
     (Text : String)
      return Natural
      renames Humanize.Strings.Support.Backend.ANSI_Display_Width;

   function Truncate_UTF8
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Truncate_UTF8;

   function UTF8_Slice
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.UTF8_Slice;

   function Truncate_UTF8_Words
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Truncate_UTF8_Words;

   function Truncate_Graphemes
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Truncate_Graphemes;

   function Truncate_Display_Width
     (Text      : String;
      Max_Width : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Truncate_Display_Width;

   function Truncate_ANSI_Display_Width
     (Text      : String;
      Max_Width : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Truncate_ANSI_Display_Width;

   function Wrap_Display_Width
     (Text      : String;
      Max_Width : Positive;
      Indent    : Natural := 0)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Wrap_Display_Width;

   function Wrap_ANSI_Display_Width
     (Text      : String;
      Max_Width : Positive;
      Indent    : Natural := 0)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Wrap_ANSI_Display_Width;

   function Wrap_ANSI_Display_Width_Styled
     (Text      : String;
      Max_Width : Positive;
      Indent    : Natural := 0)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Wrap_ANSI_Display_Width_Styled;

   function Key_Value_Line
     (Key       : String;
      Value     : String;
      Separator : String := ": ")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Key_Value_Line;

   function Aligned_Key_Value_Line
     (Key       : String;
      Value     : String;
      Key_Width : Natural;
      Separator : String := " : ")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Aligned_Key_Value_Line;

   function Table_Row_2
     (Left       : String;
      Right      : String;
      Left_Width : Natural;
      Separator  : String := "  ")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Table_Row_2;

   function Table_Row_3
     (Left         : String;
      Middle       : String;
      Right        : String;
      Left_Width   : Natural;
      Middle_Width : Natural;
      Separator    : String := "  ")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Table_Row_3;

   function Table_2
     (Left_Column  : Name_List;
      Right_Column : Name_List;
      Left_Width   : Natural;
      Separator    : String := "  ")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Table_2;

   function Table_3
     (Left_Column   : Name_List;
      Middle_Column : Name_List;
      Right_Column  : Name_List;
      Left_Width    : Natural;
      Middle_Width  : Natural;
      Separator     : String := "  ")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Table_3;

   function Grapheme_Slice
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Grapheme_Slice;

   function Truncate_Grapheme_Words
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Truncate_Grapheme_Words;

   procedure Truncate_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
      renames Humanize.Strings.Support.Backend.Truncate_Into;

   procedure Truncate_UTF8_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
      renames Humanize.Strings.Support.Backend.Truncate_UTF8_Into;

   procedure UTF8_Slice_Into
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.UTF8_Slice_Into;

   procedure Truncate_UTF8_Words_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
      renames Humanize.Strings.Support.Backend.Truncate_UTF8_Words_Into;

   procedure Truncate_Graphemes_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
      renames Humanize.Strings.Support.Backend.Truncate_Graphemes_Into;

   procedure Truncate_Display_Width_Into
     (Text      : String;
      Max_Width : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
      renames Humanize.Strings.Support.Backend.Truncate_Display_Width_Into;

   procedure Truncate_ANSI_Display_Width_Into
     (Text      : String;
      Max_Width : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
      renames Humanize.Strings.Support.Backend.Truncate_ANSI_Display_Width_Into;

   procedure Wrap_Display_Width_Into
     (Text      : String;
      Max_Width : Positive;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Indent    : Natural := 0)
      renames Humanize.Strings.Support.Backend.Wrap_Display_Width_Into;

   procedure Wrap_ANSI_Display_Width_Into
     (Text      : String;
      Max_Width : Positive;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Indent    : Natural := 0)
      renames Humanize.Strings.Support.Backend.Wrap_ANSI_Display_Width_Into;

   procedure Key_Value_Line_Into
     (Key       : String;
      Value     : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : String := ": ")
      renames Humanize.Strings.Support.Backend.Key_Value_Line_Into;

   procedure Aligned_Key_Value_Line_Into
     (Key       : String;
      Value     : String;
      Key_Width : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : String := " : ")
      renames Humanize.Strings.Support.Backend.Aligned_Key_Value_Line_Into;

   procedure Table_Row_2_Into
     (Left       : String;
      Right      : String;
      Left_Width : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Separator  : String := "  ")
      renames Humanize.Strings.Support.Backend.Table_Row_2_Into;

   procedure Table_Row_3_Into
     (Left         : String;
      Middle       : String;
      Right        : String;
      Left_Width   : Natural;
      Middle_Width : Natural;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Separator    : String := "  ")
      renames Humanize.Strings.Support.Backend.Table_Row_3_Into;

   procedure Table_2_Into
     (Left_Column  : Name_List;
      Right_Column : Name_List;
      Left_Width   : Natural;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Separator    : String := "  ")
      renames Humanize.Strings.Support.Backend.Table_2_Into;

   procedure Table_3_Into
     (Left_Column   : Name_List;
      Middle_Column : Name_List;
      Right_Column  : Name_List;
      Left_Width    : Natural;
      Middle_Width  : Natural;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Separator     : String := "  ")
      renames Humanize.Strings.Support.Backend.Table_3_Into;

   procedure Grapheme_Slice_Into
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Grapheme_Slice_Into;

   procedure Truncate_Grapheme_Words_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
      renames Humanize.Strings.Support.Backend.Truncate_Grapheme_Words_Into;

   procedure Truncate_Words_Into
     (Text      : String;
      Max_Words : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...")
      renames Humanize.Strings.Support.Backend.Truncate_Words_Into;

   procedure Capitalize_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Downcase  : Boolean := False)
      renames Humanize.Strings.Support.Backend.Capitalize_Into;

   procedure Title_Case_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Title_Case_Into;

   procedure Title_Case_Smart_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Title_Case_Smart_Into;

   procedure Title_Case_With_Options_Into
     (Text    : String;
      Options : Title_Case_Options;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Title_Case_With_Options_Into;

   procedure Title_Case_With_Word_Lists_Into
     (Text        : String;
      Acronyms    : String;
      Small_Words : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Title_Case_With_Word_Lists_Into;

   procedure Editorial_Title_Into
     (Text    : String;
      Style   : Editorial_Title_Style;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Editorial_Title_Into;

   procedure NL_To_BR_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.NL_To_BR_Into;

   procedure BR_To_NL_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.BR_To_NL_Into;

   procedure Parameterize_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : Character := '-')
      renames Humanize.Strings.Support.Backend.Parameterize_Into;

   procedure Dasherize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Dasherize_Into;

   procedure Underscore_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Underscore_Into;

   procedure Camelize_Into
     (Text        : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Upper_First : Boolean := True)
      renames Humanize.Strings.Support.Backend.Camelize_Into;

   procedure Humanize_String_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Humanize_String_Into;

   procedure Deconstantize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Deconstantize_Into;

   procedure Demodulize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Demodulize_Into;

   procedure Tableize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Tableize_Into;

   procedure Classify_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Classify_Into;

   procedure Foreign_Key_Into
     (Text             : String;
      Target           : in out String;
      Written          : out Natural;
      Status           : out Humanize.Status.Status_Code;
      Separate_Class_Id : Boolean := True)
      renames Humanize.Strings.Support.Backend.Foreign_Key_Into;

   procedure Acronym_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Identifier_Options := Default_Identifier_Options)
      renames Humanize.Strings.Support.Backend.Acronym_Into;

   procedure Escape_HTML_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Escape_HTML_Into;

   procedure Preserve_Separator_Into
     (Text      : String;
      Separator : Character;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Preserve_Separator_Into;

   procedure Normalize_Whitespace_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Normalize_Whitespace_Into;

   procedure Squish_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Squish_Into;

   procedure Strip_Tags_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Strip_Tags_Into;

   procedure Mask_Into
     (Text         : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Visible_Last : Natural := 4;
      Mask_Char    : Character := '*')
      renames Humanize.Strings.Support.Backend.Mask_Into;

   procedure Normalize_Token_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Case_Mode : Token_Case_Mode := Preserve_Token_Case)
      renames Humanize.Strings.Support.Backend.Normalize_Token_Into;

   procedure Group_Token_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Token_Group_Options := Default_Token_Group_Options)
      renames Humanize.Strings.Support.Backend.Group_Token_Into;

   procedure Masked_Token_Into
     (Text         : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Visible_Last : Natural := 4;
      Options      : Token_Group_Options := Default_Token_Group_Options;
      Mask_Char    : Character := '*')
      renames Humanize.Strings.Support.Backend.Masked_Token_Into;

   procedure Safe_Filename_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : Character := '-')
      renames Humanize.Strings.Support.Backend.Safe_Filename_Into;

   procedure Safe_Filename_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Safe_Filename_Options)
      renames Humanize.Strings.Support.Backend.Safe_Filename_Into;

   procedure Path_Basename_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Path_Basename_Into;

   procedure Path_Title_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Path_Title_Into;

   procedure Path_Title_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Path_Title_Options)
      renames Humanize.Strings.Support.Backend.Path_Title_Into;

   procedure Extension_Label_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Extension_Label_Into;

   procedure Extension_Label_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Extension_Label_Options)
      renames Humanize.Strings.Support.Backend.Extension_Label_Into;

   procedure Shorten_Path_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Path_Shorten_Options := Default_Path_Shorten_Options)
      renames Humanize.Strings.Support.Backend.Shorten_Path_Into;

   procedure Symbolic_File_Mode_Into
     (Mode    : File_Mode_Value;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : File_Mode_Kind := Mode_Only)
      renames Humanize.Strings.Support.Backend.Symbolic_File_Mode_Into;

   procedure Octal_File_Mode_Into
     (Mode            : File_Mode_Value;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code;
      Include_Special : Boolean := False;
      Prefix          : Boolean := False)
      renames Humanize.Strings.Support.Backend.Octal_File_Mode_Into;

   procedure File_Mode_Summary_Into
     (Mode    : File_Mode_Value;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : File_Mode_Kind := Mode_Only)
      renames Humanize.Strings.Support.Backend.File_Mode_Summary_Into;

   procedure Search_Key_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Search_Key_Into;

   procedure Natural_Sort_Key_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Natural_Sort_Key_Into;

   procedure Excerpt_Into
     (Text      : String;
      Phrase    : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Radius    : Natural := 32;
      Ellipsis  : String := "...")
      renames Humanize.Strings.Support.Backend.Excerpt_Into;

   procedure Excerpt_With_Context_Into
     (Text          : String;
      Phrase        : String;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Context_Words : Natural := 5;
      Ellipsis      : String := "...")
      renames Humanize.Strings.Support.Backend.Excerpt_With_Context_Into;

   procedure Excerpt_With_Options_Into
     (Text      : String;
      Phrase    : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Radius    : Natural := 32;
      Ellipsis  : String := "...";
      Options   : Match_Options := Default_Match_Options)
      renames Humanize.Strings.Support.Backend.Excerpt_With_Options_Into;

   procedure Excerpt_With_Context_Options_Into
     (Text          : String;
      Phrase        : String;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Context_Words : Natural := 5;
      Ellipsis      : String := "...";
      Options       : Match_Options := Default_Match_Options)
      renames Humanize.Strings.Support.Backend.Excerpt_With_Context_Options_Into;

   procedure Word_Count_Summary_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Word_Count_Summary_Into;

   procedure Sentence_Count_Summary_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Sentence_Count_Summary_Into;

   procedure Paragraph_Count_Summary_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Paragraph_Count_Summary_Into;

   procedure Reading_Time_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Text_Time_Options := Default_Text_Time_Options)
      renames Humanize.Strings.Support.Backend.Reading_Time_Into;

   procedure Speaking_Time_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Text_Time_Options := Default_Text_Time_Options)
      renames Humanize.Strings.Support.Backend.Speaking_Time_Into;

   procedure Text_Summary_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Text_Summary_Options := Default_Text_Summary_Options)
      renames Humanize.Strings.Support.Backend.Text_Summary_Into;

   procedure Text_Summary_With_Options_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Text_Summary_Composition_Options :=
        Default_Text_Summary_Composition_Options)
      renames Humanize.Strings.Support.Backend.Text_Summary_With_Options_Into;

   procedure Highlight_Into
     (Text    : String;
      Phrase  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Before  : String := "<mark>";
      After   : String := "</mark>")
      renames Humanize.Strings.Support.Backend.Highlight_Into;

   procedure Highlight_With_Options_Into
     (Text    : String;
      Phrase  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Before  : String := "<mark>";
      After   : String := "</mark>";
      Options : Highlight_Options := Default_Highlight_Options)
      renames Humanize.Strings.Support.Backend.Highlight_With_Options_Into;

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
      Escape_HTML_Output : Boolean := True)
      renames Humanize.Strings.Support.Backend.Highlighted_Excerpt_Into;

   procedure Initials_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Initials_Into;

   procedure Possessive_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Possessive_Into;

   procedure Clean_Name_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Clean_Name_Into;

   procedure Person_Initials_Into
     (Text         : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Max_Initials : Initial_Count_Limit := 3)
      renames Humanize.Strings.Support.Backend.Person_Initials_Into;

   procedure Name_Part_Into
     (Text    : String;
      Style   : Name_Display_Style;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Person_Name_Options := Default_Person_Name_Options)
      renames Humanize.Strings.Support.Backend.Name_Part_Into;

   procedure Handle_Label_Into
     (Handle      : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Preserve_At : Boolean := True)
      renames Humanize.Strings.Support.Backend.Handle_Label_Into;

   procedure Email_Local_Part_Into
     (Email   : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Email_Local_Part_Into;

   procedure Display_Name_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Handle   : String := "";
      Email    : String := "";
      Fallback : String := "Anonymous";
      Options  : Person_Name_Options := Default_Person_Name_Options)
      renames Humanize.Strings.Support.Backend.Display_Name_Into;

   procedure Possessive_Name_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Fallback : String := "someone")
      renames Humanize.Strings.Support.Backend.Possessive_Name_Into;

   procedure Person_List_Into
     (Names    : Name_List;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Limit    : Positive := 2;
      Fallback : String := "no one")
      renames Humanize.Strings.Support.Backend.Person_List_Into;

   procedure Transliterate_ASCII_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Transliterate_ASCII_Into;

   function Slug
     (Text      : String;
      Separator : Character := '-')
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Slug;

   procedure Slug_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : Character := '-')
      renames Humanize.Strings.Support.Backend.Slug_Into;

   function Safe_Email_Label
     (Email : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Safe_Email_Label;

   function Safe_Phone_Label
     (Phone : String;
      Visible_Digits : Natural := 4)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Safe_Phone_Label;

   function Safe_Handle_Label
     (Handle : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Safe_Handle_Label;

   function Code_Symbol_Label
     (Symbol : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Code_Symbol_Label;

   function Source_Location_Label
     (Path   : String;
      Line   : Natural := 0;
      Column : Natural := 0)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Source_Location_Label;

   function Prose_List
     (Items   : Name_List;
      Options : Prose_List_Options := Default_Prose_List_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Prose_List;

   function Sentence_From_Parts
     (Parts : Name_List)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Sentence_From_Parts;

   function Generic_Range_Label
     (Low     : String;
      High    : String;
      Options : Generic_Range_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Generic_Range_Label;

   function Uncertainty_Label
     (Value       : String;
      Uncertainty : String;
      Unit        : String := "")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Uncertainty_Label;

   function Text_Change_Metadata_For
     (Old_Text : String;
      New_Text : String)
      return Text_Change_Metadata
      renames Humanize.Strings.Support.Backend.Text_Change_Metadata_For;

   function Text_Change_Label
     (Old_Text : String;
      New_Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Text_Change_Label;

   function Address_Label
     (Address   : Address_Fields;
      Multiline : Boolean := False)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Address_Label;

   function Address_Metadata_Label
     (Address : Address_Fields)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Address_Metadata_Label;

   function Privacy_Address_Label
     (Address : Address_Fields)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Privacy_Address_Label;

   function Data_Shape_Label
     (Shape : Data_Shape_Metadata)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Data_Shape_Label;

   function Infer_Data_Shape
     (Text : String)
      return Data_Shape_Metadata
      renames Humanize.Strings.Support.Backend.Infer_Data_Shape;

   function Data_Shape_Label
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Data_Shape_Label;

   function Label_Coverage_Audit_Label
     (Coverage : Label_Coverage_Metadata)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Label_Coverage_Audit_Label;

   function Transliteration_Coverage_Label
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Transliteration_Coverage_Label;

   function Text_Boundary_Summary_Label
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Text_Boundary_Summary_Label;

   function Terminal_Paragraph
     (Text         : String;
      Width        : Positive;
      Prefix       : String := "";
      Continuation : String := "")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Terminal_Paragraph;

   function Terminal_Bullet_List
     (Items  : Name_List;
      Width  : Positive;
      Bullet : String := "- ")
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Terminal_Bullet_List;

   function Text_Metadata_Label
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Text_Metadata_Label;

   function Terminal_Section
     (Title   : String;
      Content : String;
      Options : Terminal_Layout_Options := Default_Terminal_Layout_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Terminal_Section;

   function Terminal_Key_Value_Block
     (Keys    : Name_List;
      Values  : Name_List;
      Options : Terminal_Layout_Options := Default_Terminal_Layout_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Terminal_Key_Value_Block;

   function Terminal_Status_Block
     (Status_Label : String;
      Detail       : String := "";
      Options      : Terminal_Layout_Options := Default_Terminal_Layout_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Strings.Support.Backend.Terminal_Status_Block;

   procedure Transliteration_Coverage_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Transliteration_Coverage_Label_Into;

   procedure Text_Boundary_Summary_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Text_Boundary_Summary_Label_Into;

   procedure Terminal_Paragraph_Into
     (Text         : String;
      Width        : Positive;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Prefix       : String := "";
      Continuation : String := "")
      renames Humanize.Strings.Support.Backend.Terminal_Paragraph_Into;

   procedure Text_Metadata_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Text_Metadata_Label_Into;

   procedure Prose_List_Into
     (Items   : Name_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Prose_List_Options := Default_Prose_List_Options)
      renames Humanize.Strings.Support.Backend.Prose_List_Into;

   procedure Text_Change_Label_Into
     (Old_Text : String;
      New_Text : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Text_Change_Label_Into;

   procedure Data_Shape_Label_Into
     (Shape   : Data_Shape_Metadata;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Data_Shape_Label_Into;

   procedure Pluralize_Into
     (Word    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Pluralize_Into;

   procedure Singularize_Into
     (Word    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Singularize_Into;

   procedure Casefold_ASCII_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Casefold_ASCII_Into;

   procedure Pluralize_With_Dictionary_Into
     (Word      : String;
      Singulars : String;
      Plurals   : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Pluralize_With_Dictionary_Into;

   procedure Singularize_With_Dictionary_Into
     (Word      : String;
      Singulars : String;
      Plurals   : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Singularize_With_Dictionary_Into;

   procedure Pluralize_With_Options_Into
     (Word      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      renames Humanize.Strings.Support.Backend.Pluralize_With_Options_Into;

   procedure Singularize_With_Options_Into
     (Word      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      renames Humanize.Strings.Support.Backend.Singularize_With_Options_Into;

   procedure Pluralize_In_Language_Into
     (Word     : String;
      Language : Inflection_Language;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Pluralize_In_Language_Into;

   procedure Singularize_In_Language_Into
     (Word     : String;
      Language : Inflection_Language;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Singularize_In_Language_Into;

   procedure Inflection_Language_Label_Into
     (Language : Inflection_Language;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Inflection_Language_Label_Into;

   procedure Copy_Into
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Strings.Support.Backend.Copy_Into;

end Humanize.Strings.Support;
