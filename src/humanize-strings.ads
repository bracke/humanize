with Ada.Strings.Unbounded;

with Humanize.Status;

--  Deterministic string humanization helpers.
package Humanize.Strings is
   subtype Name_Item is Ada.Strings.Unbounded.Unbounded_String;
   type Name_List is array (Positive range <>) of Name_Item;

   type Title_Case_Options is record
      Preserve_Acronyms    : Boolean := True;
      Lowercase_Small_Words : Boolean := True;
   end record;

   Default_Title_Case_Options : constant Title_Case_Options :=
     (Preserve_Acronyms => True,
      Lowercase_Small_Words => True);

   type Editorial_Title_Style is
     (AP_Title,
      Chicago_Title,
      Sentence_Title);

   type Identifier_Options is record
      Preserve_Acronyms : Boolean := True;
   end record;

   Default_Identifier_Options : constant Identifier_Options :=
     (Preserve_Acronyms => True);

   type Token_Case_Mode is
     (Preserve_Token_Case,
      Uppercase_Token,
      Lowercase_Token);

   type Token_Grouping_Direction is
     (Group_From_Left,
      Group_From_Right);

   subtype Token_Group_Size is Positive range 1 .. 16;

   type Token_Group_Options is record
      Group_Size : Token_Group_Size := 4;
      Separator  : Character := '-';
      Direction  : Token_Grouping_Direction := Group_From_Left;
      Case_Mode  : Token_Case_Mode := Uppercase_Token;
   end record;

   Default_Token_Group_Options : constant Token_Group_Options :=
     (Group_Size => 4,
      Separator  => '-',
      Direction  => Group_From_Left,
      Case_Mode  => Uppercase_Token);

   subtype Path_Length_Limit is Natural range 0 .. 1024;

   type Filename_Case_Mode is
     (Preserve_Filename_Case,
      Lowercase_Filename,
      Uppercase_Filename);

   type Hidden_File_Mode is
     (Preserve_Hidden_File,
      Drop_Hidden_Dot);

   type Extension_Missing_Label is
     (Generic_File_Label,
      No_Extension_Label,
      Empty_Extension_Label);

   type Safe_Filename_Options is record
      Separator             : Character := '-';
      Case_Mode             : Filename_Case_Mode := Lowercase_Filename;
      Preserve_Extension    : Boolean := True;
      Max_Stem_Length       : Path_Length_Limit := 0;
      Empty_Fallback        : Character := 'x';
      Reserved_Name_Fallback : Character := '_';
      Hidden_Mode           : Hidden_File_Mode := Drop_Hidden_Dot;
   end record;

   Default_Safe_Filename_Options : constant Safe_Filename_Options :=
     (Separator              => '-',
      Case_Mode              => Lowercase_Filename,
      Preserve_Extension     => True,
      Max_Stem_Length        => 0,
      Empty_Fallback         => 'x',
      Reserved_Name_Fallback => '_',
      Hidden_Mode            => Drop_Hidden_Dot);

   type Path_Title_Options is record
      Include_Extension : Boolean := False;
      Max_Stem_Length   : Path_Length_Limit := 0;
      Empty_Text        : Character := '-';
      Hidden_Mode       : Hidden_File_Mode := Drop_Hidden_Dot;
      Title             : Title_Case_Options := Default_Title_Case_Options;
   end record;

   Default_Path_Title_Options : constant Path_Title_Options :=
     (Include_Extension => False,
      Max_Stem_Length   => 0,
      Empty_Text        => '-',
      Hidden_Mode       => Drop_Hidden_Dot,
      Title             => Default_Title_Case_Options);

   type Extension_Label_Options is record
      Missing_Label      : Extension_Missing_Label := Generic_File_Label;
      Case_Mode          : Filename_Case_Mode := Uppercase_Filename;
      Hidden_File_Extends : Boolean := False;
   end record;

   Default_Extension_Label_Options : constant Extension_Label_Options :=
     (Missing_Label       => Generic_File_Label,
      Case_Mode           => Uppercase_Filename,
      Hidden_File_Extends => False);

   type Path_Shorten_Options is record
      Max_Chars : Path_Length_Limit := 40;
      Ellipsis  : Character := '~';
      Separator : Character := '/';
      Preserve_Extension : Boolean := False;
   end record;

   type Terminal_Output_Mode is
     (Terminal_Detailed,
      Terminal_Compact,
      Terminal_Log);

   type Terminal_Layout_Options is record
      Width        : Positive := 80;
      Prefix       : Character := ' ';
      Continuation : Character := ' ';
      Bullet       : Character := '-';
      Mode         : Terminal_Output_Mode := Terminal_Detailed;
      Use_Color    : Boolean := False;
   end record;

   Default_Terminal_Layout_Options : constant Terminal_Layout_Options :=
     (Width        => 80,
      Prefix       => ' ',
      Continuation => ' ',
      Bullet       => '-',
      Mode         => Terminal_Detailed,
      Use_Color    => False);

   type Prose_List_Options is record
      Conjunction  : Character := 'a';
      Oxford_Comma : Boolean := True;
      Empty_Text   : Character := '-';
   end record;

   Default_Prose_List_Options : constant Prose_List_Options :=
     (Conjunction  => 'a',
      Oxford_Comma => True,
      Empty_Text   => '-');

   type Range_Boundary is
     (Inclusive_Boundary,
      Exclusive_Boundary,
      Open_Boundary);

   type Generic_Range_Options is record
      Low_Boundary  : Range_Boundary := Inclusive_Boundary;
      High_Boundary : Range_Boundary := Inclusive_Boundary;
      Separator     : Character := '-';
      Unit          : String (1 .. 16) := [others => ' '];
      Unit_Length   : Natural := 0;
   end record;

   type Text_Change_Kind is
     (Text_Unchanged,
      Text_Whitespace_Only,
      Text_Minor_Edit,
      Text_Moderate_Edit,
      Text_Major_Rewrite);

   type Text_Change_Metadata is record
      Kind          : Text_Change_Kind := Text_Unchanged;
      Old_Words     : Natural := 0;
      New_Words     : Natural := 0;
      Shared_Words  : Natural := 0;
      Changed_Words : Natural := 0;
      Case_Only     : Boolean := False;
      Punctuation_Only : Boolean := False;
   end record;

   type Address_Fields is record
      Name           : String (1 .. 64) := [others => ' '];
      Name_Length    : Natural := 0;
      Street         : String (1 .. 96) := [others => ' '];
      Street_Length  : Natural := 0;
      City           : String (1 .. 64) := [others => ' '];
      City_Length    : Natural := 0;
      Region         : String (1 .. 64) := [others => ' '];
      Region_Length  : Natural := 0;
      Postal_Code    : String (1 .. 32) := [others => ' '];
      Postal_Length  : Natural := 0;
      Country        : String (1 .. 64) := [others => ' '];
      Country_Length : Natural := 0;
   end record;

   type Data_Shape_Kind is
     (Scalar_Shape,
      Object_Shape,
      Array_Shape,
      Empty_Shape,
      Mixed_Shape);

   type Data_Shape_Metadata is record
      Kind        : Data_Shape_Kind := Scalar_Shape;
      Fields      : Natural := 0;
      Items       : Natural := 0;
      Nulls       : Natural := 0;
      Mixed_Types : Natural := 0;
      Max_Depth   : Natural := 0;
   end record;

   type Label_Coverage_Metadata is record
      Families     : Natural := 0;
      Bounded      : Natural := 0;
      Parseable    : Natural := 0;
      Metadata     : Natural := 0;
      Stable       : Natural := 0;
      Privacy_Safe : Natural := 0;
   end record;

   Default_Path_Shorten_Options : constant Path_Shorten_Options :=
     (Max_Chars => 40,
      Ellipsis  => '~',
      Separator => '/',
      Preserve_Extension => False);

   subtype File_Mode_Value is Natural range 0 .. 8#7777#;

   type File_Mode_Kind is
     (Mode_Only,
      Regular_File,
      Directory_File,
      Symlink_File,
      Character_Device,
      Block_Device,
      FIFO_File,
      Socket_File);

   type Inflection_Source is
     (Dictionary_Inflection,
      Irregular_Inflection,
      Uncountable_Inflection,
      Rule_Inflection,
      Unchanged_Inflection);

   type Inflection_Rule_Order is
     (Dictionary_First,
      Built_In_First);

   type Inflection_Language is
     (English_Inflection,
      Danish_Inflection,
      German_Inflection,
      French_Inflection,
      Spanish_Inflection,
      Italian_Inflection,
      Portuguese_Inflection,
      Dutch_Inflection,
      Swedish_Inflection,
      Norwegian_Inflection,
      Norwegian_Bokmal_Inflection,
      Finnish_Inflection,
      Turkish_Inflection);

   type Inflection_Options is record
      Rule_Order    : Inflection_Rule_Order := Dictionary_First;
      Preserve_Case : Boolean := True;
   end record;

   Default_Inflection_Options : constant Inflection_Options :=
     (Rule_Order    => Dictionary_First,
      Preserve_Case => True);

   type Name_Display_Style is
     (Display_Full_Name,
      Display_Given_Name,
      Display_Family_Name,
      Display_Initials,
      Display_Handle);

   type Name_Order is
     (Given_Family_Order,
      Family_Given_Order);

   subtype Initial_Count_Limit is Natural range 0 .. 8;

   type Person_Name_Options is record
      Style              : Name_Display_Style := Display_Full_Name;
      Order              : Name_Order := Given_Family_Order;
      Max_Initials       : Initial_Count_Limit := 3;
      Preserve_Handle_At : Boolean := True;
   end record;

   Default_Person_Name_Options : constant Person_Name_Options :=
     (Style              => Display_Full_Name,
      Order              => Given_Family_Order,
      Max_Initials       => 3,
      Preserve_Handle_At => True);

   subtype Words_Per_Minute is Positive range 1 .. 1000;

   type Text_Time_Options is record
      Reading_Words_Per_Minute  : Words_Per_Minute := 200;
      Speaking_Words_Per_Minute : Words_Per_Minute := 130;
   end record;

   Default_Text_Time_Options : constant Text_Time_Options :=
     (Reading_Words_Per_Minute  => 200,
      Speaking_Words_Per_Minute => 130);

   type Text_Summary_Options is record
      Include_Sentences     : Boolean := True;
      Include_Paragraphs    : Boolean := True;
      Include_Reading_Time  : Boolean := True;
      Include_Speaking_Time : Boolean := False;
      Time                  : Text_Time_Options := Default_Text_Time_Options;
   end record;

   Default_Text_Summary_Options : constant Text_Summary_Options :=
     (Include_Sentences     => True,
      Include_Paragraphs    => True,
      Include_Reading_Time  => True,
      Include_Speaking_Time => False,
      Time                  => Default_Text_Time_Options);

   type Text_Summary_Field is
     (Summary_Words,
      Summary_Sentences,
      Summary_Paragraphs,
      Summary_Reading_Time,
      Summary_Speaking_Time,
      Summary_Code_Points,
      Summary_Display_Width);

   subtype Text_Summary_Field_Count is Natural range 0 .. 7;
   subtype Text_Summary_Field_Index is Positive range 1 .. 7;

   type Text_Summary_Field_List is
     array (Text_Summary_Field_Index) of Text_Summary_Field;

   type Text_Summary_Label_Style is
     (Natural_Labels,
      Compact_Labels,
      Minimal_Labels);

   type Text_Summary_Composition_Options is record
      Fields          : Text_Summary_Field_List :=
        [Summary_Words,
         Summary_Sentences,
         Summary_Paragraphs,
         Summary_Reading_Time,
         Summary_Speaking_Time,
         Summary_Code_Points,
         Summary_Display_Width];
      Field_Count     : Text_Summary_Field_Count := 4;
      Separator       : Character := ',';
      Space_After_Separator : Boolean := True;
      Label_Style     : Text_Summary_Label_Style := Natural_Labels;
      Omit_Zero_Counts : Boolean := False;
      Empty_Text      : Character := '-';
      Time            : Text_Time_Options := Default_Text_Time_Options;
   end record;

   Default_Text_Summary_Composition_Options :
     constant Text_Summary_Composition_Options :=
       (Fields =>
          [Summary_Words,
           Summary_Sentences,
           Summary_Paragraphs,
           Summary_Reading_Time,
           Summary_Speaking_Time,
           Summary_Code_Points,
           Summary_Display_Width],
        Field_Count => 4,
        Separator => ',',
        Space_After_Separator => True,
        Label_Style => Natural_Labels,
        Omit_Zero_Counts => False,
        Empty_Text => '-',
        Time => Default_Text_Time_Options);

   type Text_Metrics_Result is record
      Words         : Natural := 0;
      Sentences     : Natural := 0;
      Paragraphs    : Natural := 0;
      Code_Points   : Natural := 0;
      Display_Width : Natural := 0;
   end record;

   type Match_Case_Mode is
     (Case_Sensitive,
      Case_Insensitive);

   type Match_Boundary_Mode is
     (Match_Anywhere,
      Match_Word);

   type Match_Count_Mode is
     (First_Match,
      All_Matches);

   type Match_Options is record
      Case_Mode     : Match_Case_Mode := Case_Sensitive;
      Boundary_Mode : Match_Boundary_Mode := Match_Anywhere;
   end record;

   Default_Match_Options : constant Match_Options :=
     (Case_Mode     => Case_Sensitive,
      Boundary_Mode => Match_Anywhere);

   type Highlight_Options is record
      Match_Mode : Match_Options := Default_Match_Options;
      Count_Mode : Match_Count_Mode := All_Matches;
   end record;

   Default_Highlight_Options : constant Highlight_Options :=
     (Match_Mode => Default_Match_Options,
      Count_Mode => All_Matches);

   function Truncate
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @param Max_Chars Maximum output length including Ellipsis.
   --  @param Ellipsis Suffix used when truncating.
   --  @return Truncated text.

   function Truncate_Words
     (Text      : String;
      Max_Words : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @param Max_Words Maximum number of words to keep.
   --  @param Ellipsis Suffix used when truncating.
   --  @return Word-truncated text.

   function Capitalize
     (Text      : String;
      Downcase  : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @param Downcase Downcase the rest of the string when True.
   --  @return Text with the first character capitalized.

   function Title_Case
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @return Text with each word capitalized and internal whitespace collapsed.

   function Title_Case_Smart
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @return Title-cased text preserving common acronyms and small words.

   function Title_Case_With_Options
     (Text    : String;
      Options : Title_Case_Options := Default_Title_Case_Options)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @param Options Smart title-case policy.
   --  @return Title-cased text using caller-selected smart policies.

   function Title_Case_With_Word_Lists
     (Text        : String;
      Acronyms    : String := "";
      Small_Words : String := "")
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @param Acronyms Space/comma-separated acronym words to preserve.
   --  @param Small_Words Space/comma-separated small words to lowercase.
   --  @return Title-cased text using caller-supplied word lists.

   function Editorial_Title
     (Text  : String;
      Style : Editorial_Title_Style := AP_Title)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @param Style Editorial title style preset.
   --  @return Title text using the selected editorial capitalization policy.

   function NL_To_BR
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @return Text with line feeds converted to <br/>.

   function BR_To_NL
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @return Text with <br>, <br/>, and <br /> converted to line feeds.

   function Parameterize
     (Text      : String;
      Separator : Character := '-')
      return Humanize.Status.Text_Result;
   --  @param Text Text to convert to a URL-safe slug.
   --  @param Separator Separator used between words.
   --  @return Lowercase ASCII slug.

   function Dasherize
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Identifier text.
   --  @return Text with underscores and spaces converted to dashes.

   function Underscore
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Identifier text.
   --  @return Text with separators and camel-case boundaries converted to underscores.

   function Camelize
     (Text        : String;
      Upper_First : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Text Identifier text.
   --  @param Upper_First Whether to uppercase the first word.
   --  @return CamelCase or lowerCamelCase text.

   function Humanize_String
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Identifier text.
   --  @return Human-readable sentence-style text.

   function Deconstantize
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Qualified Ada-like name.
   --  @return Namespace portion before the final dot.

   function Demodulize
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Qualified Ada-like name.
   --  @return Final name component after the last dot.

   function Tableize
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Identifier text.
   --  @return Underscored plural collection name.

   function Classify
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Table or identifier text.
   --  @return CamelCase singular class-like name.

   function Foreign_Key
     (Text             : String;
      Separate_Class_Id : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Text Class or module name.
   --  @param Separate_Class_Id Insert an underscore before "id" when True.
   --  @return Foreign-key style identifier.

   function Acronym
     (Text    : String;
      Options : Identifier_Options := Default_Identifier_Options)
      return Humanize.Status.Text_Result;
   --  @param Text Identifier text.
   --  @param Options Acronym preservation policy.
   --  @return Uppercase acronym built from word initials.

   function Escape_HTML
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @return Text with HTML-special characters escaped.

   function Preserve_Separator
     (Text      : String;
      Separator : Character)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @param Separator Separator to normalize repeated separators around.
   --  @return Text with repeated separators collapsed and spacing preserved.

   function Normalize_Whitespace
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @return Text with whitespace runs collapsed to single spaces.

   function Squish
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @return Trimmed normalized whitespace.

   function Strip_Tags
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @return Text with simple HTML/XML tags removed.

   function Excerpt
     (Text      : String;
      Phrase    : String;
      Radius    : Natural := 32;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @param Phrase Phrase to center the excerpt around.
   --  @param Radius Characters to include on each side.
   --  @param Ellipsis Text used when content is omitted.
   --  @return Text around Phrase with ellipses when content is omitted.

   function Excerpt_With_Options
     (Text      : String;
      Phrase    : String;
      Radius    : Natural := 32;
      Ellipsis  : String := "...";
      Options   : Match_Options := Default_Match_Options)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @param Phrase Phrase to center the excerpt around.
   --  @param Radius Characters to include on each side.
   --  @param Ellipsis Text used when content is omitted.
   --  @param Options Matching case and word-boundary policy.
   --  @return Text around Phrase with ellipses when content is omitted.

   function Excerpt_With_Context
     (Text          : String;
      Phrase        : String;
      Context_Words : Natural := 5;
      Ellipsis      : String := "...")
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @param Phrase Phrase to center the excerpt around.
   --  @param Context_Words Words to include on each side.
   --  @param Ellipsis Text used when content is omitted.
   --  @return Word-context excerpt around Phrase.

   function Excerpt_With_Context_Options
     (Text          : String;
      Phrase        : String;
      Context_Words : Natural := 5;
      Ellipsis      : String := "...";
      Options       : Match_Options := Default_Match_Options)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @param Phrase Phrase to center the excerpt around.
   --  @param Context_Words Words to include on each side.
   --  @param Ellipsis Text used when content is omitted.
   --  @param Options Matching case and word-boundary policy.
   --  @return Word-context excerpt around Phrase.

   function Word_Count (Text : String) return Natural;
   --  @param Text Input text.
   --  @return Count of Unicode-aware word runs.

   function Sentence_Count (Text : String) return Natural;
   --  @param Text Input text.
   --  @return Count of Unicode-aware sentence-ending punctuation groups.

   function Paragraph_Count (Text : String) return Natural;
   --  @param Text Input text.
   --  @return Count of non-empty Unicode-aware paragraphs.

   function Text_Metrics
     (Text : String)
      return Text_Metrics_Result;
   --  @param Text UTF-8-compatible input text.
   --  @return Combined Unicode-aware text metrics.

   function Word_Count_Summary
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @return Human-readable word count summary.

   function Sentence_Count_Summary
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @return Human-readable sentence count summary.

   function Paragraph_Count_Summary
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @return Human-readable paragraph count summary.

   function Reading_Time
     (Text    : String;
      Options : Text_Time_Options := Default_Text_Time_Options)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @param Options Reading speed policy.
   --  @return Estimated reading-time label.

   function Speaking_Time
     (Text    : String;
      Options : Text_Time_Options := Default_Text_Time_Options)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @param Options Speaking speed policy.
   --  @return Estimated speaking-time label.

   function Text_Summary
     (Text    : String;
      Options : Text_Summary_Options := Default_Text_Summary_Options)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @param Options Text-summary fields and time policy.
   --  @return Combined word/sentence/paragraph/time summary.

   function Text_Summary_With_Options
     (Text    : String;
      Options : Text_Summary_Composition_Options :=
        Default_Text_Summary_Composition_Options)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @param Options Field order, labels, separators, zero, and time policy.
   --  @return Composed text summary using caller-selected presentation policy.

   function Highlight
     (Text   : String;
      Phrase : String;
      Before : String := "<mark>";
      After  : String := "</mark>")
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @param Phrase Phrase to mark.
   --  @param Before Prefix marker.
   --  @param After Suffix marker.
   --  @return Text with matching Phrase wrapped in marker strings.

   function Highlight_With_Options
     (Text    : String;
      Phrase  : String;
      Before  : String := "<mark>";
      After   : String := "</mark>";
      Options : Highlight_Options := Default_Highlight_Options)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @param Phrase Phrase to mark.
   --  @param Before Prefix marker.
   --  @param After Suffix marker.
   --  @param Options Matching case, word-boundary, and count policy.
   --  @return Text with matching original text wrapped in marker strings.

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
   --  @param Text Input text.
   --  @param Phrase Phrase to center and mark.
   --  @param Radius Characters to include on each side.
   --  @param Ellipsis Text used when content is omitted.
   --  @param Before Prefix marker.
   --  @param After Suffix marker.
   --  @param Options Matching case, word-boundary, and count policy.
   --  @param Escape_HTML_Output Escape excerpt text while preserving markers.
   --  @return Excerpt with matching original text wrapped in marker strings.

   function Mask
     (Text         : String;
      Visible_Last : Natural := 4;
      Mask_Char    : Character := '*')
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @param Visible_Last Number of trailing characters to preserve.
   --  @param Mask_Char Character used for masked positions.
   --  @return Masked text preserving the requested trailing characters.

   function Normalize_Token
     (Text      : String;
      Case_Mode : Token_Case_Mode := Preserve_Token_Case)
      return Humanize.Status.Text_Result;
   --  @param Text Opaque token text.
   --  @param Case_Mode Case normalization policy for ASCII letters.
   --  @return Token with non-alphanumeric separators removed.

   function Group_Token
     (Text    : String;
      Options : Token_Group_Options := Default_Token_Group_Options)
      return Humanize.Status.Text_Result;
   --  @param Text Opaque token text.
   --  @param Options Group size, separator, direction, and case policy.
   --  @return Readable grouped token.

   function Masked_Token
     (Text         : String;
      Visible_Last : Natural := 4;
      Options      : Token_Group_Options := Default_Token_Group_Options;
      Mask_Char    : Character := '*')
      return Humanize.Status.Text_Result;
   --  @param Text Opaque token text.
   --  @param Visible_Last Number of trailing token characters to preserve.
   --  @param Options Group size, separator, direction, and case policy.
   --  @param Mask_Char Character used for masked positions.
   --  @return Grouped masked token preserving the requested trailing characters.

   function Safe_Filename
     (Text      : String;
      Separator : Character := '-')
      return Humanize.Status.Text_Result;
   --  @param Text Filename or label text.
   --  @param Separator Separator used between safe filename words.
   --  @return Lowercase ASCII filename-safe text without path separators.

   function Safe_Filename
     (Text    : String;
      Options : Safe_Filename_Options)
      return Humanize.Status.Text_Result;
   --  @param Text Filename or label text.
   --  @param Options Filename safety and display policy.
   --  @return ASCII filename-safe text without path separators.

   function Path_Basename
     (Path : String)
      return Humanize.Status.Text_Result;
   --  @param Path File path.
   --  @return Final path component.

   function Path_Title
     (Path : String)
      return Humanize.Status.Text_Result;
   --  @param Path File path.
   --  @return Human-readable title from the final component without extension.

   function Path_Title
     (Path    : String;
      Options : Path_Title_Options)
      return Humanize.Status.Text_Result;
   --  @param Path File path.
   --  @param Options Title extraction policy.
   --  @return Human-readable title from the final component.

   function Extension_Label
     (Path : String)
      return Humanize.Status.Text_Result;
   --  @param Path File path.
   --  @return Uppercase file extension label, or "file" when no extension exists.

   function Extension_Label
     (Path    : String;
      Options : Extension_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Path File path.
   --  @param Options Extension display policy.
   --  @return File extension label using the requested policy.

   function Shorten_Path
     (Path    : String;
      Options : Path_Shorten_Options := Default_Path_Shorten_Options)
      return Humanize.Status.Text_Result;
   --  @param Path File path.
   --  @param Options Maximum length, ellipsis marker, and path separator.
   --  @return Compact path preserving the beginning and final component.

   function Symbolic_File_Mode
     (Mode : File_Mode_Value;
      Kind : File_Mode_Kind := Mode_Only)
      return Humanize.Status.Text_Result;
   --  @param Mode Unix permission mode bits, including optional special bits.
   --  @param Kind Optional file-kind prefix for ls-style symbolic output.
   --  @return Symbolic mode such as "rwxr-xr-x" or "-rwsr-xr-t".

   function Octal_File_Mode
     (Mode            : File_Mode_Value;
      Include_Special : Boolean := False;
      Prefix          : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Mode Unix permission mode bits, including optional special bits.
   --  @param Include_Special Always include the special-bit octal digit.
   --  @param Prefix Prefix the octal label with "0".
   --  @return Octal mode such as "755", "4755", or "0755".

   function File_Mode_Summary
     (Mode : File_Mode_Value;
      Kind : File_Mode_Kind := Mode_Only)
      return Humanize.Status.Text_Result;
   --  @param Mode Unix permission mode bits, including optional special bits.
   --  @param Kind Optional file kind to include in the summary.
   --  @return Human-readable owner/group/others permission summary.

   function Parse_File_Mode
     (Text : String;
      Mode : out File_Mode_Value;
      Kind : out File_Mode_Kind)
      return Humanize.Status.Status_Code;
   --  @param Text Octal or symbolic Unix mode text.
   --  @param Mode Parsed mode bits when the result is Ok.
   --  @param Kind Parsed kind prefix, or Mode_Only when none is present.
   --  @return Ok for valid octal or symbolic mode text.

   function Search_Key
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @return Lowercase ASCII search/display key with collapsed separators.

   function Natural_Sort_Key
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @return Lexicographic key where digit runs sort numerically.

   function Natural_Less
     (Left  : String;
      Right : String)
      return Boolean;
   --  @param Left Left input text.
   --  @param Right Right input text.
   --  @return True when Left sorts before Right using natural sort order.

   function Initials
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @return Uppercase initials from words in Text.

   function Possessive
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @return English possessive form, e.g. "Chris'".

   function Clean_Name
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Raw person or display name.
   --  @return Name with surrounding and repeated whitespace collapsed.

   function Person_Initials
     (Text         : String;
      Max_Initials : Initial_Count_Limit := 3)
      return Humanize.Status.Text_Result;
   --  @param Text Raw person or display name.
   --  @param Max_Initials Maximum initials to keep; 0 keeps all.
   --  @return Uppercase initials for a person label.

   function Name_Part
     (Text    : String;
      Style   : Name_Display_Style;
      Options : Person_Name_Options := Default_Person_Name_Options)
      return Humanize.Status.Text_Result;
   --  @param Text Raw person or display name.
   --  @param Style Name part to select.
   --  @param Options Name order, initials, and handle policy.
   --  @return Selected full, given, family, initials, or handle label.

   function Handle_Label
     (Handle      : String;
      Preserve_At : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Handle Raw handle, with or without a leading at sign.
   --  @param Preserve_At True to include an at sign in the returned label.
   --  @return Normalized handle label.

   function Email_Local_Part
     (Email : String)
      return Humanize.Status.Text_Result;
   --  @param Email Email-like address.
   --  @return Text before the at sign, or the cleaned input when no at sign exists.

   function Display_Name
     (Name     : String;
      Handle   : String := "";
      Email    : String := "";
      Fallback : String := "Anonymous";
      Options  : Person_Name_Options := Default_Person_Name_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Preferred full/display name.
   --  @param Handle Optional account handle.
   --  @param Email Optional email-like label.
   --  @param Fallback Label used when all inputs are empty.
   --  @param Options Name style, order, initials, and handle policy.
   --  @return First useful person display label.

   function Possessive_Name
     (Name     : String;
      Fallback : String := "someone")
      return Humanize.Status.Text_Result;
   --  @param Name Person/display name.
   --  @param Fallback Label used when Name is empty.
   --  @return Possessive person label.

   function Person_List
     (Names    : Name_List;
      Limit    : Positive := 2;
      Fallback : String := "no one")
      return Humanize.Status.Text_Result;
   --  @param Names Person/display names.
   --  @param Limit Maximum visible names before an "others" tail.
   --  @param Fallback Label used when no non-empty names are present.
   --  @return Compact person list such as "Ada and 2 others".

   function Transliterate_ASCII
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @return Best-effort ASCII transliteration for common Latin-1 letters.

   function Casefold_ASCII
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Input text.
   --  @return Lowercase ASCII-oriented casefolded text.

   function Pluralize
     (Word : String)
      return Humanize.Status.Text_Result;
   --  @param Word English singular noun.
   --  @return Simple English plural form.

   function Singularize
     (Word : String)
      return Humanize.Status.Text_Result;
   --  @param Word English plural noun.
   --  @return Simple English singular form.

   function Pluralize_With_Dictionary
     (Word      : String;
      Singulars : String;
      Plurals   : String)
      return Humanize.Status.Text_Result;
   --  @param Word English singular noun.
   --  @param Singulars Space/comma-separated singular dictionary words.
   --  @param Plurals Space/comma-separated plural dictionary words.
   --  @return Dictionary plural if found, otherwise simple plural form.

   function Singularize_With_Dictionary
     (Word      : String;
      Singulars : String;
      Plurals   : String)
      return Humanize.Status.Text_Result;
   --  @param Word English plural noun.
   --  @param Singulars Space/comma-separated singular dictionary words.
   --  @param Plurals Space/comma-separated plural dictionary words.
   --  @return Dictionary singular if found, otherwise simple singular form.

   function Pluralize_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Humanize.Status.Text_Result;
   --  @param Word English singular noun.
   --  @param Singulars Optional dictionary singular list.
   --  @param Plurals Optional dictionary plural list.
   --  @param Options Inflection precedence and case policy.
   --  @return Plural form using the requested policy.

   function Singularize_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Humanize.Status.Text_Result;
   --  @param Word English plural noun.
   --  @param Singulars Optional dictionary singular list.
   --  @param Plurals Optional dictionary plural list.
   --  @param Options Inflection precedence and case policy.
   --  @return Singular form using the requested policy.

   function Pluralize_In_Language
     (Word     : String;
      Language : Inflection_Language)
      return Humanize.Status.Text_Result;
   --  @param Word Singular noun in Language.
   --  @param Language Deterministic built-in inflection rule set.
   --  @return Plural form using the requested language rule set.

   function Singularize_In_Language
     (Word     : String;
      Language : Inflection_Language)
      return Humanize.Status.Text_Result;
   --  @param Word Plural noun in Language.
   --  @param Language Deterministic built-in inflection rule set.
   --  @return Singular form using the requested language rule set.

   function Inflection_Language_Label
     (Language : Inflection_Language)
      return Humanize.Status.Text_Result;
   --  @param Language Inflection rule-set identifier.
   --  @return Stable lowercase language label.

   function Pluralize_Source
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "")
      return Inflection_Source;
   --  @param Word English singular noun.
   --  @param Singulars Optional dictionary singular list.
   --  @param Plurals Optional dictionary plural list.
   --  @return Metadata describing which pluralization path would be used.

   function Singularize_Source
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "")
      return Inflection_Source;
   --  @param Word English plural noun.
   --  @param Singulars Optional dictionary singular list.
   --  @param Plurals Optional dictionary plural list.
   --  @return Metadata describing which singularization path would be used.

   function Pluralize_Source_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Inflection_Source;
   --  @param Word English singular noun.
   --  @param Singulars Optional dictionary singular list.
   --  @param Plurals Optional dictionary plural list.
   --  @param Options Inflection precedence and case policy.
   --  @return Metadata describing which pluralization path would be used.

   function Singularize_Source_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Inflection_Source;
   --  @param Word English plural noun.
   --  @param Singulars Optional dictionary singular list.
   --  @param Plurals Optional dictionary plural list.
   --  @param Options Inflection precedence and case policy.
   --  @return Metadata describing which singularization path would be used.

   function Inflection_Source_Label
     (Source : Inflection_Source)
      return Humanize.Status.Text_Result;
   --  @param Source Inflection metadata source.
   --  @return Lowercase source label.

   procedure Inflection_Source_Label_Into
     (Source  : Inflection_Source;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Source Inflection metadata source.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function UTF8_Length
     (Text : String)
      return Natural;
   --  @param Text UTF-8-compatible input text.
   --  @return Count of UTF-8 code points, treating invalid bytes as one unit.

   function UTF8_Display_Width
     (Text : String)
      return Natural;
   --  @param Text UTF-8-compatible input text.
   --  @return Approximate monospace display width.

   function Grapheme_Length
     (Text : String)
      return Natural;
   --  @param Text UTF-8-compatible input text.
   --  @return Count of extended grapheme clusters, treating invalid bytes as one unit.

   function Grapheme_Display_Width
     (Text : String)
      return Natural;
   --  @param Text UTF-8-compatible input text.
   --  @return Approximate monospace width by grapheme cluster.

   function ANSI_Display_Width
     (Text : String)
      return Natural;
   --  @param Text UTF-8-compatible input text that may contain ANSI escapes.
   --  @return Approximate monospace width ignoring ANSI escape sequences.

   function Truncate_UTF8
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Chars Maximum output code-point length including Ellipsis.
   --  @param Ellipsis Suffix used when truncating.
   --  @return UTF-8 boundary-safe truncated text.

   function UTF8_Slice
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural)
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @param First_Char First 1-based code point to include.
   --  @param Last_Char Last 1-based code point to include.
   --  @return UTF-8 boundary-safe slice.

   function Truncate_UTF8_Words
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Chars Maximum output code-point length including Ellipsis.
   --  @param Ellipsis Suffix used when truncating.
   --  @return UTF-8 boundary-safe truncation at a word boundary when possible.

   function Truncate_Graphemes
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Chars Maximum output grapheme-cluster length including Ellipsis.
   --  @param Ellipsis Suffix used when truncating.
   --  @return Grapheme-cluster-safe truncated text.

   function Truncate_Display_Width
     (Text      : String;
      Max_Width : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Width Maximum monospace display width including Ellipsis.
   --  @param Ellipsis Suffix used when truncating.
   --  @return Grapheme-safe text truncated by approximate display width.

   function Truncate_ANSI_Display_Width
     (Text      : String;
      Max_Width : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text that may contain ANSI escapes.
   --  @param Max_Width Maximum monospace display width including Ellipsis.
   --  @param Ellipsis Suffix used when truncating.
   --  @return ANSI-preserving grapheme-safe text truncated by display width.

   function Wrap_Display_Width
     (Text      : String;
      Max_Width : Positive;
      Indent    : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Width Maximum monospace display width for each output line.
   --  @param Indent Spaces to prepend after inserted line breaks.
   --  @return Grapheme-safe text wrapped by approximate display width.

   function Wrap_ANSI_Display_Width
     (Text      : String;
      Max_Width : Positive;
      Indent    : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text that may contain ANSI escapes.
   --  @param Max_Width Maximum monospace display width for each output line.
   --  @param Indent Spaces to prepend after inserted line breaks.
   --  @return ANSI-preserving grapheme-safe text wrapped by display width.

   function Wrap_ANSI_Display_Width_Styled
     (Text      : String;
      Max_Width : Positive;
      Indent    : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text that may contain ANSI SGR escapes.
   --  @param Max_Width Maximum monospace display width for each output line.
   --  @param Indent Spaces to prepend after inserted line breaks.
   --  @return ANSI-aware wrapped text that reopens active SGR styles after breaks.

   function Key_Value_Line
     (Key       : String;
      Value     : String;
      Separator : String := ": ")
      return Humanize.Status.Text_Result;
   --  @param Key Display key.
   --  @param Value Display value.
   --  @param Separator Text between key and value.
   --  @return Single key/value terminal line.

   function Aligned_Key_Value_Line
     (Key       : String;
      Value     : String;
      Key_Width : Natural;
      Separator : String := " : ")
      return Humanize.Status.Text_Result;
   --  @param Key Display key.
   --  @param Value Display value.
   --  @param Key_Width Minimum display width for the key.
   --  @param Separator Text between key and value.
   --  @return Single aligned key/value terminal line.

   function Table_Row_2
     (Left       : String;
      Right      : String;
      Left_Width : Natural;
      Separator  : String := "  ")
      return Humanize.Status.Text_Result;
   --  @param Left Left cell text.
   --  @param Right Right cell text.
   --  @param Left_Width Minimum display width for the left cell.
   --  @param Separator Text between cells.
   --  @return ANSI-aware two-column terminal row.

   function Table_Row_3
     (Left         : String;
      Middle       : String;
      Right        : String;
      Left_Width   : Natural;
      Middle_Width : Natural;
      Separator    : String := "  ")
      return Humanize.Status.Text_Result;
   --  @param Left Left cell text.
   --  @param Middle Middle cell text.
   --  @param Right Right cell text.
   --  @param Left_Width Minimum display width for the left cell.
   --  @param Middle_Width Minimum display width for the middle cell.
   --  @param Separator Text between cells.
   --  @return ANSI-aware three-column terminal row.

   function Table_2
     (Left_Column  : Name_List;
      Right_Column : Name_List;
      Left_Width   : Natural;
      Separator    : String := "  ")
      return Humanize.Status.Text_Result;
   --  @param Left_Column Left column cells.
   --  @param Right_Column Right column cells.
   --  @param Left_Width Minimum display width for the left column.
   --  @param Separator Text between cells.
   --  @return Newline-separated ANSI-aware two-column terminal table.

   function Table_3
     (Left_Column   : Name_List;
      Middle_Column : Name_List;
      Right_Column  : Name_List;
      Left_Width    : Natural;
      Middle_Width  : Natural;
      Separator     : String := "  ")
      return Humanize.Status.Text_Result;
   --  @param Left_Column Left column cells.
   --  @param Middle_Column Middle column cells.
   --  @param Right_Column Right column cells.
   --  @param Left_Width Minimum display width for the left column.
   --  @param Middle_Width Minimum display width for the middle column.
   --  @param Separator Text between cells.
   --  @return Newline-separated ANSI-aware three-column terminal table.

   function Grapheme_Slice
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural)
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @param First_Char First 1-based grapheme cluster to include.
   --  @param Last_Char Last 1-based grapheme cluster to include.
   --  @return Grapheme-cluster-safe slice.

   function Truncate_Grapheme_Words
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Chars Maximum output grapheme-cluster length including Ellipsis.
   --  @param Ellipsis Suffix used when truncating.
   --  @return Grapheme-safe truncation at a word boundary when possible.

   procedure Truncate_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");
   --  @param Text Input text.
   --  @param Max_Chars Maximum output length including Ellipsis.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Ellipsis Suffix used when truncating.

   procedure Truncate_UTF8_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Chars Maximum output code-point length including Ellipsis.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Ellipsis Suffix used when truncating.

   procedure UTF8_Slice_Into
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   --  @param Text UTF-8-compatible input text.
   --  @param First_Char First 1-based code point to include.
   --  @param Last_Char Last 1-based code point to include.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Truncate_UTF8_Words_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Chars Maximum output code-point length including Ellipsis.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Ellipsis Suffix used when truncating.

   procedure Truncate_Graphemes_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Chars Maximum output grapheme-cluster length including Ellipsis.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Ellipsis Suffix used when truncating.

   procedure Truncate_Display_Width_Into
     (Text      : String;
      Max_Width : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Width Maximum monospace display width including Ellipsis.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Ellipsis Suffix used when truncating.

   procedure Truncate_ANSI_Display_Width_Into
     (Text      : String;
      Max_Width : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");
   --  @param Text UTF-8-compatible input text that may contain ANSI escapes.
   --  @param Max_Width Maximum monospace display width including Ellipsis.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Ellipsis Suffix used when truncating.

   procedure Wrap_Display_Width_Into
     (Text      : String;
      Max_Width : Positive;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Indent    : Natural := 0);
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Width Maximum monospace display width for each output line.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Indent Spaces to prepend after inserted line breaks.

   procedure Wrap_ANSI_Display_Width_Into
     (Text      : String;
      Max_Width : Positive;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Indent    : Natural := 0);
   --  @param Text UTF-8-compatible input text that may contain ANSI escapes.
   --  @param Max_Width Maximum monospace display width for each output line.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Indent Spaces to prepend after inserted line breaks.

   procedure Key_Value_Line_Into
     (Key       : String;
      Value     : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : String := ": ");
   --  @param Key Display key.
   --  @param Value Display value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Separator Text between key and value.

   procedure Aligned_Key_Value_Line_Into
     (Key       : String;
      Value     : String;
      Key_Width : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : String := " : ");
   --  @param Key Display key.
   --  @param Value Display value.
   --  @param Key_Width Minimum display width for the key.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Separator Text between key and value.

   procedure Table_Row_2_Into
     (Left       : String;
      Right      : String;
      Left_Width : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Separator  : String := "  ");
   --  @param Left Left cell text.
   --  @param Right Right cell text.
   --  @param Left_Width Minimum display width for the left cell.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Separator Text between cells.

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
   --  @param Left Left cell text.
   --  @param Middle Middle cell text.
   --  @param Right Right cell text.
   --  @param Left_Width Minimum display width for the left cell.
   --  @param Middle_Width Minimum display width for the middle cell.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Separator Text between cells.

   procedure Table_2_Into
     (Left_Column  : Name_List;
      Right_Column : Name_List;
      Left_Width   : Natural;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Separator    : String := "  ");
   --  @param Left_Column Left column cells.
   --  @param Right_Column Right column cells.
   --  @param Left_Width Minimum display width for the left column.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Separator Text between cells.

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
   --  @param Left_Column Left column cells.
   --  @param Middle_Column Middle column cells.
   --  @param Right_Column Right column cells.
   --  @param Left_Width Minimum display width for the left column.
   --  @param Middle_Width Minimum display width for the middle column.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Separator Text between cells.

   procedure Grapheme_Slice_Into
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   --  @param Text UTF-8-compatible input text.
   --  @param First_Char First 1-based grapheme cluster to include.
   --  @param Last_Char Last 1-based grapheme cluster to include.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Truncate_Grapheme_Words_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Chars Maximum output grapheme-cluster length including Ellipsis.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Ellipsis Suffix used when truncating.

   procedure Truncate_Words_Into
     (Text      : String;
      Max_Words : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");
   --  @param Text Input text.
   --  @param Max_Words Maximum number of words to keep.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Ellipsis Suffix used when truncating.

   procedure Capitalize_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Downcase  : Boolean := False);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Downcase Downcase the rest of the string when True.

   procedure Title_Case_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Title_Case_Smart_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Title_Case_With_Options_Into
     (Text    : String;
      Options : Title_Case_Options;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Input text.
   --  @param Options Smart title-case policy.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Title_Case_With_Word_Lists_Into
     (Text        : String;
      Acronyms    : String;
      Small_Words : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code);
   --  @param Text Input text.
   --  @param Acronyms Space/comma-separated acronym words to preserve.
   --  @param Small_Words Space/comma-separated small words to lowercase.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Editorial_Title_Into
     (Text    : String;
      Style   : Editorial_Title_Style;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Input text.
   --  @param Style Editorial title style preset.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure NL_To_BR_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure BR_To_NL_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Parameterize_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : Character := '-');
   --  @param Text Text to convert to a URL-safe slug.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Separator Separator used between words.

   procedure Dasherize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Identifier text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Underscore_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Identifier text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Camelize_Into
     (Text        : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Upper_First : Boolean := True);
   --  @param Text Identifier text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Upper_First Whether to uppercase the first word.

   procedure Humanize_String_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Identifier text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Deconstantize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Qualified Ada-like name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Demodulize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Qualified Ada-like name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Tableize_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Identifier text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Classify_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Table or identifier text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Foreign_Key_Into
     (Text             : String;
      Target           : in out String;
      Written          : out Natural;
      Status           : out Humanize.Status.Status_Code;
      Separate_Class_Id : Boolean := True);
   --  @param Text Class or module name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Separate_Class_Id Insert an underscore before "id" when True.

   procedure Acronym_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Identifier_Options := Default_Identifier_Options);
   --  @param Text Identifier text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Acronym preservation policy.

   procedure Escape_HTML_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Preserve_Separator_Into
     (Text      : String;
      Separator : Character;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Text Input text.
   --  @param Separator Separator to normalize repeated separators around.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Normalize_Whitespace_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Squish_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Strip_Tags_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Mask_Into
     (Text         : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Visible_Last : Natural := 4;
      Mask_Char    : Character := '*');
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Visible_Last Number of trailing characters to preserve.
   --  @param Mask_Char Character used for masked positions.

   procedure Normalize_Token_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Case_Mode : Token_Case_Mode := Preserve_Token_Case);
   --  @param Text Opaque token text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Case_Mode Case normalization policy for ASCII letters.

   procedure Group_Token_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Token_Group_Options := Default_Token_Group_Options);
   --  @param Text Opaque token text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Group size, separator, direction, and case policy.

   procedure Masked_Token_Into
     (Text         : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Visible_Last : Natural := 4;
      Options      : Token_Group_Options := Default_Token_Group_Options;
      Mask_Char    : Character := '*');
   --  @param Text Opaque token text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Visible_Last Number of trailing token characters to preserve.
   --  @param Options Group size, separator, direction, and case policy.
   --  @param Mask_Char Character used for masked positions.

   procedure Safe_Filename_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : Character := '-');
   --  @param Text Filename or label text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Separator Separator used between safe filename words.

   procedure Safe_Filename_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Safe_Filename_Options);
   --  @param Text Filename or label text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Filename safety and display policy.

   procedure Path_Basename_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Path File path.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Path_Title_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Path File path.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Path_Title_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Path_Title_Options);
   --  @param Path File path.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Title extraction policy.

   procedure Extension_Label_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Path File path.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Extension_Label_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Extension_Label_Options);
   --  @param Path File path.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Extension display policy.

   procedure Shorten_Path_Into
     (Path    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Path_Shorten_Options := Default_Path_Shorten_Options);
   --  @param Path File path.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Maximum length, ellipsis marker, and path separator.

   procedure Symbolic_File_Mode_Into
     (Mode    : File_Mode_Value;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : File_Mode_Kind := Mode_Only);
   --  @param Mode Unix permission mode bits, including optional special bits.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Kind Optional file-kind prefix for ls-style symbolic output.

   procedure Octal_File_Mode_Into
     (Mode            : File_Mode_Value;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code;
      Include_Special : Boolean := False;
      Prefix          : Boolean := False);
   --  @param Mode Unix permission mode bits, including optional special bits.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Include_Special Always include the special-bit octal digit.
   --  @param Prefix Prefix the octal label with "0".

   procedure File_Mode_Summary_Into
     (Mode    : File_Mode_Value;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : File_Mode_Kind := Mode_Only);
   --  @param Mode Unix permission mode bits, including optional special bits.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Kind Optional file kind to include in the summary.

   procedure Search_Key_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Natural_Sort_Key_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Excerpt_Into
     (Text      : String;
      Phrase    : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Radius    : Natural := 32;
      Ellipsis  : String := "...");
   --  @param Text Input text.
   --  @param Phrase Phrase to center the excerpt around.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Radius Characters to include on each side.
   --  @param Ellipsis Text used when content is omitted.

   procedure Excerpt_With_Context_Into
     (Text          : String;
      Phrase        : String;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Context_Words : Natural := 5;
      Ellipsis      : String := "...");
   --  @param Text Input text.
   --  @param Phrase Phrase to center the excerpt around.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Context_Words Words to include on each side.
   --  @param Ellipsis Text used when content is omitted.

   procedure Excerpt_With_Options_Into
     (Text      : String;
      Phrase    : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Radius    : Natural := 32;
      Ellipsis  : String := "...";
      Options   : Match_Options := Default_Match_Options);
   --  @param Text Input text.
   --  @param Phrase Phrase to center the excerpt around.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Radius Characters to include on each side.
   --  @param Ellipsis Text used when content is omitted.
   --  @param Options Matching case and word-boundary policy.

   procedure Excerpt_With_Context_Options_Into
     (Text          : String;
      Phrase        : String;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Context_Words : Natural := 5;
      Ellipsis      : String := "...";
      Options       : Match_Options := Default_Match_Options);
   --  @param Text Input text.
   --  @param Phrase Phrase to center the excerpt around.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Context_Words Words to include on each side.
   --  @param Ellipsis Text used when content is omitted.
   --  @param Options Matching case and word-boundary policy.

   procedure Word_Count_Summary_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Sentence_Count_Summary_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Paragraph_Count_Summary_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Reading_Time_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Text_Time_Options := Default_Text_Time_Options);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Reading speed policy.

   procedure Speaking_Time_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Text_Time_Options := Default_Text_Time_Options);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Speaking speed policy.

   procedure Text_Summary_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Text_Summary_Options := Default_Text_Summary_Options);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Text-summary fields and time policy.

   procedure Text_Summary_With_Options_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Text_Summary_Composition_Options :=
        Default_Text_Summary_Composition_Options);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Field order, labels, separators, zero, and time policy.

   procedure Highlight_Into
     (Text    : String;
      Phrase  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Before  : String := "<mark>";
      After   : String := "</mark>");
   --  @param Text Input text.
   --  @param Phrase Phrase to mark.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Before Prefix marker.
   --  @param After Suffix marker.

   procedure Highlight_With_Options_Into
     (Text    : String;
      Phrase  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Before  : String := "<mark>";
      After   : String := "</mark>";
      Options : Highlight_Options := Default_Highlight_Options);
   --  @param Text Input text.
   --  @param Phrase Phrase to mark.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Before Prefix marker.
   --  @param After Suffix marker.
   --  @param Options Matching case, word-boundary, and count policy.

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
   --  @param Text Input text.
   --  @param Phrase Phrase to center and mark.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Radius Characters to include on each side.
   --  @param Ellipsis Text used when content is omitted.
   --  @param Before Prefix marker.
   --  @param After Suffix marker.
   --  @param Options Matching case, word-boundary, and count policy.
   --  @param Escape_HTML_Output Escape excerpt text while preserving markers.

   procedure Initials_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Possessive_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Clean_Name_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Raw person or display name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Person_Initials_Into
     (Text         : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Max_Initials : Initial_Count_Limit := 3);
   --  @param Text Raw person or display name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Max_Initials Maximum initials to keep; 0 keeps all.

   procedure Name_Part_Into
     (Text    : String;
      Style   : Name_Display_Style;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Person_Name_Options := Default_Person_Name_Options);
   --  @param Text Raw person or display name.
   --  @param Style Name part to select.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Name order, initials, and handle policy.

   procedure Handle_Label_Into
     (Handle      : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Preserve_At : Boolean := True);
   --  @param Handle Raw handle, with or without a leading at sign.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Preserve_At True to include an at sign in the returned label.

   procedure Email_Local_Part_Into
     (Email   : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Email Email-like address.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Display_Name_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Handle   : String := "";
      Email    : String := "";
      Fallback : String := "Anonymous";
      Options  : Person_Name_Options := Default_Person_Name_Options);
   --  @param Name Preferred full/display name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Handle Optional account handle.
   --  @param Email Optional email-like label.
   --  @param Fallback Label used when all inputs are empty.
   --  @param Options Name style, order, initials, and handle policy.

   procedure Possessive_Name_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Fallback : String := "someone");
   --  @param Name Person/display name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Fallback Label used when Name is empty.

   procedure Person_List_Into
     (Names    : Name_List;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Limit    : Positive := 2;
      Fallback : String := "no one");
   --  @param Names Person/display names.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Limit Maximum visible names before an "others" tail.
   --  @param Fallback Label used when no non-empty names are present.

   procedure Transliterate_ASCII_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text UTF-8-compatible input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function Slug
     (Text      : String;
      Separator : Character := '-')
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @param Separator ASCII separator used between slug tokens.
   --  @return Deterministic lowercase ASCII slug.

   procedure Slug_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : Character := '-');
   --  @param Text UTF-8-compatible input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Separator ASCII separator used between slug tokens.

   function Safe_Email_Label
     (Email : String)
      return Humanize.Status.Text_Result;
   --  @param Email Email-like address.
   --  @return PII-safe email label, preserving only safe structural details.

   function Safe_Phone_Label
     (Phone : String;
      Visible_Digits : Natural := 4)
      return Humanize.Status.Text_Result;
   --  @param Phone Phone-like text.
   --  @param Visible_Digits Number of trailing digits to reveal.
   --  @return PII-safe phone label.

   function Safe_Handle_Label
     (Handle : String)
      return Humanize.Status.Text_Result;
   --  @param Handle User handle.
   --  @return PII-safe handle label.

   function Code_Symbol_Label
     (Symbol : String)
      return Humanize.Status.Text_Result;
   --  @param Symbol Code symbol or qualified identifier.
   --  @return Human-readable code symbol label.

   function Source_Location_Label
     (Path   : String;
      Line   : Natural := 0;
      Column : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Path Source path.
   --  @param Line Optional 1-based source line.
   --  @param Column Optional 1-based source column.
   --  @return Human-readable source location label.

   function Prose_List
     (Items   : Name_List;
      Options : Prose_List_Options := Default_Prose_List_Options)
      return Humanize.Status.Text_Result;
   --  @param Items Text fragments to join.
   --  @param Options Conjunction, comma, and empty-output policy.
   --  @return Human-readable prose list.

   function Sentence_From_Parts
     (Parts : Name_List)
      return Humanize.Status.Text_Result;
   --  @param Parts Optional sentence fragments.
   --  @return Sentence with empty fragments removed and punctuation normalized.

   function Generic_Range_Label
     (Low     : String;
      High    : String;
      Options : Generic_Range_Options)
      return Humanize.Status.Text_Result;
   --  @param Low Lower range bound label, or empty for open low bound.
   --  @param High Upper range bound label, or empty for open high bound.
   --  @param Options Boundary, separator, and unit policy.
   --  @return Human-readable generic range label.

   function Uncertainty_Label
     (Value       : String;
      Uncertainty : String;
      Unit        : String := "")
      return Humanize.Status.Text_Result;
   --  @param Value Center value label.
   --  @param Uncertainty Plus/minus uncertainty label.
   --  @param Unit Optional unit label.
   --  @return Human-readable value-with-uncertainty label.

   function Text_Change_Metadata_For
     (Old_Text : String;
      New_Text : String)
      return Text_Change_Metadata;
   --  @param Old_Text Previous text.
   --  @param New_Text New text.
   --  @return Deterministic word-level text-change metadata.

   function Text_Change_Label
     (Old_Text : String;
      New_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Old_Text Previous text.
   --  @param New_Text New text.
   --  @return Human-readable text-change summary.

   function Address_Label
     (Address   : Address_Fields;
      Multiline : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Address Structured bounded address fields.
   --  @param Multiline True to render address components on separate lines.
   --  @return Human-readable address label with empty fields skipped.

   function Address_Metadata_Label
     (Address : Address_Fields)
      return Humanize.Status.Text_Result;
   --  @param Address Structured bounded address fields.
   --  @return Address completeness metadata label.

   function Privacy_Address_Label
     (Address : Address_Fields)
      return Humanize.Status.Text_Result;
   --  @param Address Structured bounded address fields.
   --  @return Privacy-safe partial address label.

   function Data_Shape_Label
     (Shape : Data_Shape_Metadata)
      return Humanize.Status.Text_Result;
   --  @param Shape Structured generic data-shape metadata.
   --  @return Human-readable data-shape summary.

   function Infer_Data_Shape
     (Text : String)
      return Data_Shape_Metadata;
   --  @param Text JSON/YAML-like sample text.
   --  @return Best-effort generic data-shape metadata.

   function Data_Shape_Label
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text JSON/YAML-like sample text.
   --  @return Human-readable inferred data-shape summary.

   function Label_Coverage_Audit_Label
     (Coverage : Label_Coverage_Metadata)
      return Humanize.Status.Text_Result;
   --  @param Coverage Label-family capability counts.
   --  @return Human-readable label coverage audit summary.

   function Transliteration_Coverage_Label
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @return Summary of ASCII transliteration coverage for Text.

   function Text_Boundary_Summary_Label
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @return Grapheme, word, sentence, paragraph, and display-width summary.

   function Terminal_Paragraph
     (Text         : String;
      Width        : Positive;
      Prefix       : String := "";
      Continuation : String := "")
      return Humanize.Status.Text_Result;
   --  @param Text Paragraph text to wrap.
   --  @param Width Maximum monospace width.
   --  @param Prefix Prefix for the first line.
   --  @param Continuation Prefix for continuation lines.
   --  @return Terminal-safe wrapped paragraph.

   function Terminal_Bullet_List
     (Items  : Name_List;
      Width  : Positive;
      Bullet : String := "- ")
      return Humanize.Status.Text_Result;
   --  @param Items Bullet item labels.
   --  @param Width Maximum monospace width.
   --  @param Bullet Bullet prefix.
   --  @return Terminal-safe newline-separated bullet list.

   function Text_Metadata_Label
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @return Machine-stable metadata summary for humanized text output.

   function Terminal_Section
     (Title   : String;
      Content : String;
      Options : Terminal_Layout_Options := Default_Terminal_Layout_Options)
      return Humanize.Status.Text_Result;
   --  @param Title Section title.
   --  @param Content Section body text.
   --  @param Options Terminal width and style policy.
   --  @return Width-constrained terminal section label.

   function Terminal_Key_Value_Block
     (Keys    : Name_List;
      Values  : Name_List;
      Options : Terminal_Layout_Options := Default_Terminal_Layout_Options)
      return Humanize.Status.Text_Result;
   --  @param Keys Key labels.
   --  @param Values Value labels.
   --  @param Options Terminal width and style policy.
   --  @return Wrapped terminal key/value block.

   function Terminal_Status_Block
     (Status_Label : String;
      Detail       : String := "";
      Options      : Terminal_Layout_Options := Default_Terminal_Layout_Options)
      return Humanize.Status.Text_Result;
   --  @param Status_Label Primary status label.
   --  @param Detail Optional detail text.
   --  @param Options Terminal width and style policy.
   --  @return Terminal-safe status block.

   procedure Transliteration_Coverage_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text UTF-8-compatible input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Text_Boundary_Summary_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text UTF-8-compatible input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Terminal_Paragraph_Into
     (Text         : String;
      Width        : Positive;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Prefix       : String := "";
      Continuation : String := "");
   --  @param Text Paragraph text to wrap.
   --  @param Width Maximum monospace width.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Prefix Prefix for the first line.
   --  @param Continuation Prefix for continuation lines.

   procedure Text_Metadata_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text UTF-8-compatible input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Prose_List_Into
     (Items   : Name_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Prose_List_Options := Default_Prose_List_Options);
   --  @param Items Text fragments to join.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Conjunction, comma, and empty-output policy.

   procedure Text_Change_Label_Into
     (Old_Text : String;
      New_Text : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Old_Text Previous text.
   --  @param New_Text New text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Data_Shape_Label_Into
     (Shape   : Data_Shape_Metadata;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Shape Structured generic data-shape metadata.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Pluralize_Into
     (Word    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Word English singular noun.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Singularize_Into
     (Word    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Word English plural noun.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Casefold_ASCII_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Input text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Pluralize_With_Dictionary_Into
     (Word      : String;
      Singulars : String;
      Plurals   : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Word English singular noun.
   --  @param Singulars Space/comma-separated singular dictionary words.
   --  @param Plurals Space/comma-separated plural dictionary words.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Singularize_With_Dictionary_Into
     (Word      : String;
      Singulars : String;
      Plurals   : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Word English plural noun.
   --  @param Singulars Space/comma-separated singular dictionary words.
   --  @param Plurals Space/comma-separated plural dictionary words.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Pluralize_With_Options_Into
     (Word      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options);
   --  @param Word English singular noun.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Singulars Optional dictionary singular list.
   --  @param Plurals Optional dictionary plural list.
   --  @param Options Inflection precedence and case policy.

   procedure Singularize_With_Options_Into
     (Word      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options);
   --  @param Word English plural noun.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Singulars Optional dictionary singular list.
   --  @param Plurals Optional dictionary plural list.
   --  @param Options Inflection precedence and case policy.

   procedure Pluralize_In_Language_Into
     (Word     : String;
      Language : Inflection_Language;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Word Singular noun in Language.
   --  @param Language Deterministic built-in inflection rule set.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Singularize_In_Language_Into
     (Word     : String;
      Language : Inflection_Language;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Word Plural noun in Language.
   --  @param Language Deterministic built-in inflection rule set.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Inflection_Language_Label_Into
     (Language : Inflection_Language;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Language Inflection rule-set identifier.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Copy_Into
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Result Convenience result to copy.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
end Humanize.Strings;
