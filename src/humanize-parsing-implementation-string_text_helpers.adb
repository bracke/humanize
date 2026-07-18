with Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Parsing.Implementation.Numeric_Text_Helpers;
with Humanize.Parsing.Implementation.Text_Helpers;
with Humanize.Status;
with Humanize.Strings;

package body Humanize.Parsing.Implementation.String_Text_Helpers is
   use type Humanize.Status.Status_Code;
   use Ada.Strings.Unbounded;

   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;
   function Lower (Text : String) return String
      renames Humanize.Bounded_Text.Lower_Text;
   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;
   function Is_Digit (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;
   function Is_Upper (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Uppercase;
   function Is_Lower (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Lowercase;
   function Is_Space (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Space;
   function Starts_With (Text, Prefix : String) return Boolean
      renames Humanize.Bounded_Text.Starts_With;
   function Ends_With (Text, Suffix : String) return Boolean
      renames Humanize.Bounded_Text.Ends_With;
   function Find_Substring (Text, Pattern : String) return Natural
      renames Humanize.Bounded_Text.Index_Text;

   procedure Store
     (Source : String;
      Target : out String;
      Length : out Natural)
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Store;
   function Parse_Number_And_Tail
     (Text   : String;
      Value  : out Long_Float;
      Tail   : out Unbounded_String)
      return Boolean
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Parse_Number_And_Tail;

   function Word_Count (Text : String) return Natural
      renames Humanize.Parsing.Implementation.Text_Helpers.Word_Count;
   function Lowercase_Label (Text : String) return Boolean
      renames Humanize.Parsing.Implementation.Text_Helpers.Lowercase_Label;
   function Uppercase_Label (Text : String) return Boolean
      renames Humanize.Parsing.Implementation.Text_Helpers.Uppercase_Label;
   function Title_Case_Label (Text : String) return Boolean
      renames Humanize.Parsing.Implementation.Text_Helpers.Title_Case_Label;
   function ASCII_Only_Label (Text : String) return Boolean
      renames Humanize.Parsing.Implementation.Text_Helpers.ASCII_Only_Label;
   function Is_Alnum (Item : Character) return Boolean
      renames Humanize.Parsing.Implementation.Text_Helpers.Is_Alnum;
   function Is_Lower_Alnum_Or
     (Item      : Character;
      Separator : Character)
      return Boolean
      renames Humanize.Parsing.Implementation.Text_Helpers.Is_Lower_Alnum_Or;
   function Starts_At
     (Text    : String;
      Index   : Natural;
      Pattern : String)
      return Boolean
      renames Humanize.Parsing.Implementation.Text_Helpers.Starts_At;
   function Parse_Natural_Field
     (Text  : String;
      Value : out Natural)
      return Boolean
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Parse_Natural_Field;

   function Parse_Text_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Text_Helpers.Parse_Text_Count_Summary;
   function Parse_Word_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Text_Helpers.Parse_Word_Count_Summary;
   function Parse_Sentence_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Text_Helpers.Parse_Sentence_Count_Summary;
   function Parse_Paragraph_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Text_Helpers.Parse_Paragraph_Count_Summary;

   function Parse_Text_Time_Label
     (Text : String)
      return Text_Time_Parse_Result
      is separate;

   function Parse_Time_With_Suffix
     (Text   : String;
      Suffix : String)
      return Text_Time_Parse_Result
   is
      Result : constant Text_Time_Parse_Result := Parse_Text_Time_Label (Text);
   begin
      if Result.Status /= Humanize.Status.Ok then
         return Result;
      elsif Result.Suffix (1 .. Result.Suffix_Length) /= Suffix then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Unit,
                 others => <>);
      else
         return Result;
      end if;
   end Parse_Time_With_Suffix;

   function Parse_Reading_Time
     (Text : String)
      return Text_Time_Parse_Result is
   begin
      return Parse_Time_With_Suffix (Text, "read");
   end Parse_Reading_Time;

   function Parse_Speaking_Time
     (Text : String)
      return Text_Time_Parse_Result is
   begin
      return Parse_Time_With_Suffix (Text, "spoken");
   end Parse_Speaking_Time;

   procedure Apply_Text_Summary_Part
     (Part   : String;
      Result : in out Text_Summary_Parse_Result;
      Valid  : in out Boolean)
      is separate;

   function Parse_Text_Summary
     (Text : String)
      return Text_Summary_Parse_Result
   is
      Item : constant String := Trim (Text);
      Result : Text_Summary_Parse_Result :=
        (Status => Humanize.Status.Ok,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error,
         others => <>);
      Position : Natural := Item'First;
      Valid : Boolean := True;
   begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Empty_Input,
                 others => <>);
      end if;

      while Position <= Item'Last loop
         declare
            Next : constant Natural :=
              Find_Substring (Item (Position .. Item'Last), ", ");
            Last : constant Natural :=
              (if Next = 0 then Item'Last else Next - 1);
         begin
            Apply_Text_Summary_Part (Item (Position .. Last), Result, Valid);
            exit when not Valid or else Last = Item'Last;
            Position := Last + 3;
         end;
      end loop;

      if not Valid then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Unsupported_Form,
                 others => <>);
      end if;
      return Result;
   exception
      when others => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Text_Summary;

   function Parse_Mask
     (Text : String;
      Mask_Char : Character := '*')
      return Mask_Parse_Result
      renames Humanize.Parsing.Implementation.Text_Helpers.Parse_Mask;
   function Parse_Grouped_Token
     (Text : String;
      Separator : Character := '-')
      return Grouped_Token_Parse_Result
      renames Humanize.Parsing.Implementation.Text_Helpers.Parse_Grouped_Token;
   function Parse_Masked_Token
     (Text : String;
      Separator : Character := '-';
      Mask_Char : Character := '*')
      return Grouped_Token_Parse_Result
      renames Humanize.Parsing.Implementation.Text_Helpers.Parse_Masked_Token;

   function Parse_String_Label
     (Text : String)
      return String_Label_Parse_Result
      is separate;

   function Parse_Path_Label
     (Text : String)
      return String_Label_Parse_Result is
   begin
      return Parse_String_Label (Text);
   end Parse_Path_Label;

   function Parse_Path_Basename
     (Text : String)
      return Filename_Label_Parse_Result is
   begin
      return Parse_Safe_Filename (Text);
   end Parse_Path_Basename;

   function Parse_Path_Title
     (Text : String)
      return String_Label_Parse_Result is
   begin
      return Parse_String_Label (Text);
   end Parse_Path_Title;

   function Parse_Extension_Label
     (Text : String)
      return String_Label_Parse_Result is
   begin
      return Parse_String_Label (Text);
   end Parse_Extension_Label;

   function Parse_Shortened_Path
     (Text : String)
      return Excerpt_Parse_Result is
   begin
      return Parse_Excerpt (Text, "~");
   end Parse_Shortened_Path;

   function Parse_File_Mode_Label
     (Text : String)
      return File_Mode_Parse_Result
      is separate;

   function Parse_Handle_Label
     (Text : String)
      return String_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
   begin
      if Item'Length > 0 and then Item (Item'First) /= '@' then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Unsupported_Form,
                 others => <>);
      end if;
      return Parse_String_Label (Item);
   end Parse_Handle_Label;

   function Parse_Name_Label
     (Text : String)
      return String_Label_Parse_Result is
   begin
      return Parse_String_Label (Text);
   end Parse_Name_Label;

   function Parse_Clean_Name
     (Text : String)
      return String_Label_Parse_Result is
   begin
      return Parse_Name_Label (Text);
   end Parse_Clean_Name;

   function Parse_Display_Name
     (Text : String)
      return String_Label_Parse_Result is
   begin
      return Parse_Name_Label (Text);
   end Parse_Display_Name;

   function Parse_Name_Part
     (Text : String)
      return String_Label_Parse_Result is
   begin
      return Parse_Name_Label (Text);
   end Parse_Name_Part;

   function Parse_Initials
     (Text : String)
      return Initials_Parse_Result
      renames Humanize.Parsing.Implementation.Text_Helpers.Parse_Initials;
   function Parse_Person_Initials
     (Text : String)
      return Initials_Parse_Result
      renames Humanize.Parsing.Implementation.Text_Helpers.Parse_Person_Initials;
   function Parse_Possessive_Label
     (Text : String)
      return Possessive_Parse_Result
      renames Humanize.Parsing.Implementation.Text_Helpers.Parse_Possessive_Label;
   function Parse_Possessive_Name
     (Text : String)
      return Possessive_Parse_Result
      renames Humanize.Parsing.Implementation.Text_Helpers.Parse_Possessive_Name;

   function Parse_Email_Local_Part
     (Text : String)
      return Email_Local_Part_Parse_Result
      is separate;
   function Parse_Safe_Filename
     (Text : String)
      return Filename_Label_Parse_Result
      is separate;
   function Parse_Identifier_Label
     (Text : String;
      Separator : Character := '_')
      return Identifier_Label_Parse_Result
      is separate;

   function Parse_Parameterize_Label
     (Text : String;
      Separator : Character := '-')
      return Identifier_Label_Parse_Result is
   begin
      return Parse_Identifier_Label (Text, Separator);
   end Parse_Parameterize_Label;

   function Parse_Dasherize_Label
     (Text : String)
      return Identifier_Label_Parse_Result is
   begin
      return Parse_Identifier_Label (Text, '-');
   end Parse_Dasherize_Label;

   function Parse_Underscore_Label
     (Text : String)
      return Identifier_Label_Parse_Result is
   begin
      return Parse_Identifier_Label (Text, '_');
   end Parse_Underscore_Label;

   function Parse_Camelize_Label
     (Text : String)
      return Identifier_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Buffer : String (1 .. 160);
      Length : Natural;
      Tokens : Natural := 0;
      Previous_Lower_Or_Digit : Boolean := False;
   begin
      for Index in Item'Range loop
         declare
            Ch : constant Character := Item (Index);
         begin
            if Index = Item'First then
               Tokens := (if Item'Length = 0 then 0 else 1);
            elsif Is_Upper (Ch) and then Previous_Lower_Or_Digit then
               Tokens := Tokens + 1;
            end if;
            Previous_Lower_Or_Digit := Is_Lower (Ch) or else Is_Digit (Ch);
         end;
      end loop;

      Store (Item, Buffer, Length);
      return
        (Status => Humanize.Status.Ok,
         Value => Buffer,
         Value_Length => Length,
         Token_Count => Tokens,
         Separator => ASCII.NUL,
         Has_Separator => False,
         Lowercase => False,
         Camel_Case => Item'Length > 0,
         Natural_Sort_Key => False,
         Numeric_Run_Count => 0,
         Leading_Separator => False,
         Trailing_Separator => False,
         Repeated_Separator => False,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Camelize_Label;

   function Parse_Transliteration_Label
     (Text : String)
      return String_Label_Parse_Result is
   begin
      return Parse_String_Label (Text);
   end Parse_Transliteration_Label;

   function Parse_Casefold_Label
     (Text : String)
      return Identifier_Label_Parse_Result is
   begin
      return Parse_Search_Key (Text);
   end Parse_Casefold_Label;

   function Parse_Cleanup_Label
     (Text      : String;
      Separator : Character := ASCII.NUL)
      return Cleanup_Label_Parse_Result
      is separate;

   function Parse_Escaped_HTML
     (Text : String)
      return Cleanup_Label_Parse_Result is
   begin
      return Parse_Cleanup_Label (Text);
   end Parse_Escaped_HTML;

   function Parse_NL_To_BR
     (Text : String)
      return Cleanup_Label_Parse_Result is
   begin
      return Parse_Cleanup_Label (Text);
   end Parse_NL_To_BR;

   function Parse_BR_To_NL
     (Text : String)
      return Cleanup_Label_Parse_Result is
   begin
      return Parse_Cleanup_Label (Text);
   end Parse_BR_To_NL;

   function Parse_Normalized_Whitespace
     (Text : String)
      return Cleanup_Label_Parse_Result is
   begin
      return Parse_Cleanup_Label (Text);
   end Parse_Normalized_Whitespace;

   function Parse_Squished
     (Text : String)
      return Cleanup_Label_Parse_Result is
   begin
      return Parse_Cleanup_Label (Text);
   end Parse_Squished;

   function Parse_Stripped_Tags
     (Text : String)
      return Cleanup_Label_Parse_Result is
   begin
      return Parse_Cleanup_Label (Text);
   end Parse_Stripped_Tags;

   function Parse_Preserved_Separator
     (Text      : String;
      Separator : Character)
      return Cleanup_Label_Parse_Result is
   begin
      return Parse_Cleanup_Label (Text, Separator);
   end Parse_Preserved_Separator;

   function Parse_Pluralized_Word
     (Text : String)
      return String_Label_Parse_Result is
   begin
      return Parse_String_Label (Text);
   end Parse_Pluralized_Word;

   function Parse_Singularized_Word
     (Text : String)
      return String_Label_Parse_Result is
   begin
      return Parse_String_Label (Text);
   end Parse_Singularized_Word;

   function Parse_Search_Key
     (Text : String)
      return Identifier_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Result : Identifier_Label_Parse_Result := Parse_Identifier_Label (Item, ' ');
   begin
      for Index in Item'Range loop
         declare
            Ch : constant Character := Item (Index);
         begin
            if not (Is_Lower (Ch) or else Is_Digit (Ch) or else Ch = ' ')
              or else (Ch = ' ' and then
                       (Index = Item'First
                        or else Index = Item'Last
                        or else Item (Index - 1) = ' '))
            then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Unsupported_Form,
                       others => <>);
            end if;
         end;
      end loop;
      Result.Separator := ' ';
      return Result;
   end Parse_Search_Key;

   function Parse_Natural_Sort_Key
     (Text : String)
      return Identifier_Label_Parse_Result
      is separate;
   function Parse_Person_List
     (Text : String)
      return Person_List_Parse_Result
      is separate;
   function Parse_Excerpt
     (Text : String;
      Ellipsis : String := "...")
      return Excerpt_Parse_Result
      is separate;
   function Parse_Highlight
     (Text   : String;
      Before : String := "<mark>";
      After  : String := "</mark>")
      return Highlight_Parse_Result
      is separate;

   function Parse_Highlighted_Excerpt
     (Text     : String;
      Ellipsis : String := "...";
      Before   : String := "<mark>";
      After    : String := "</mark>")
      return Highlight_Parse_Result
   is
      pragma Unreferenced (Ellipsis);
   begin
      return Parse_Highlight (Text, Before, After);
   end Parse_Highlighted_Excerpt;

   function Parse_Inflection_Source_Label
     (Text : String)
      return Inflection_Source_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Source : Humanize.Strings.Inflection_Source;
   begin
      if Item = "dictionary" then
         Source := Humanize.Strings.Dictionary_Inflection;
      elsif Item = "irregular" then
         Source := Humanize.Strings.Irregular_Inflection;
      elsif Item = "uncountable" then
         Source := Humanize.Strings.Uncountable_Inflection;
      elsif Item = "rule" then
         Source := Humanize.Strings.Rule_Inflection;
      elsif Item = "unchanged" then
         Source := Humanize.Strings.Unchanged_Inflection;
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Unsupported_Form,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Source => Source,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Inflection_Source_Label;
end Humanize.Parsing.Implementation.String_Text_Helpers;
