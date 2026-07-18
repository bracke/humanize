with Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Parsing.Bytes;
with Humanize.Parsing.Implementation.Numeric_Text_Helpers;
with Humanize.Parsing.Implementation.Phrase_Text_Helpers;
with Humanize.Parsing.Implementation.Text_Helpers;
with Humanize.Status;
with Humanize.Values;

package body Humanize.Parsing.Implementation.Domain_Label_Text_Helpers is
   use Ada.Strings.Unbounded;
   use type Humanize.Status.Status_Code;

   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function Lower (Text : String) return String
      renames Humanize.Bounded_Text.Lower_Text;

   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;

   function Is_Digit (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;

   function Is_Lower (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Lowercase;

   function Starts_With (Text, Prefix : String) return Boolean
      renames Humanize.Bounded_Text.Starts_With;

   function Ends_With (Text, Suffix : String) return Boolean
      renames Humanize.Bounded_Text.Ends_With;

   function Find_Substring (Text, Pattern : String) return Natural
      renames Humanize.Bounded_Text.Index_Text;

   function First_Alphabetic_Token_Last (Text : String) return Natural
      renames Humanize.Parsing.Implementation.Text_Helpers.First_Alphabetic_Token_Last;

   function Parse_Bytes (Text : String) return Byte_Parse_Result
      renames Humanize.Parsing.Bytes.Parse_Bytes;

   function Parse_Natural_Field
     (Text  : String;
      Value : out Natural)
      return Boolean
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Parse_Natural_Field;

   function Parse_Two_Naturals
     (Left_Text  : String;
      Right_Text : String;
      Left       : out Natural;
      Right      : out Natural)
      return Boolean
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Parse_Two_Naturals;

   function Parse_Number_And_Tail
     (Text  : String;
      Value : out Long_Float;
      Tail  : out Unbounded_String)
      return Boolean
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Parse_Number_And_Tail;

   procedure Store
     (Source : String;
      Target : out String;
      Length : out Natural)
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Store;

   function Parse_Failed_Segment
     (Text   : String;
      Failed : out Natural)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Mark : constant String := " failed";
   begin
      return Ends_With (Item, Mark)
        and then Parse_Natural_Field
          (Item (Item'First .. Item'Last - Mark'Length), Failed);
   end Parse_Failed_Segment;

   function Parse_Domain_Summary
     (Text : String)
      return Domain_Summary_Parse_Result
      is separate;

   function Parse_Phrase_Severity_Label
     (Text : String)
     return Phrase_Severity_Parse_Result
      renames Humanize.Parsing.Implementation.Phrase_Text_Helpers.Parse_Phrase_Severity_Label;

   function Parse_Phrase_Tone_Label
     (Text : String)
     return Phrase_Tone_Parse_Result
      renames Humanize.Parsing.Implementation.Phrase_Text_Helpers.Parse_Phrase_Tone_Label;

   function Parse_Phrase_Domain_Label
     (Text : String)
     return Phrase_Domain_Parse_Result
      renames Humanize.Parsing.Implementation.Phrase_Text_Helpers.Parse_Phrase_Domain_Label;

   function Parse_Phrase_State_Label
     (Text : String)
     return Phrase_State_Parse_Result
      renames Humanize.Parsing.Implementation.Phrase_Text_Helpers.Parse_Phrase_State_Label;

   function Parse_Phrase_Key
     (Text : String)
      return Phrase_Key_Parse_Result
      is separate;

   function Count_Words (Text : String) return Natural
      renames Humanize.Parsing.Implementation.Text_Helpers.Count_Words;

   function Contains_Word
     (Text : String;
      Word : String)
     return Boolean
      renames Humanize.Parsing.Implementation.Phrase_Text_Helpers.Contains_Word;

   function Parse_Phrase_Pack_Summary
     (Text : String)
     return Phrase_Pack_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Phrase_Text_Helpers.Parse_Phrase_Pack_Summary;

   function Parse_Supported_Phrase_Locales
     (Text : String)
      return Phrase_Locales_Parse_Result
      is separate;

   function Parse_Operational_Phrase
     (Text : String)
      return Operational_Phrase_Parse_Result
      is separate;

   function Parse_Field_Change_Summary
     (Text : String)
      return Field_Change_Summary_Parse_Result
      is separate;

   function Parse_Field_State_Summary
     (Text : String)
      return Field_State_Summary_Parse_Result
      is separate;

   function Parse_Domain_With_Expected
     (Text     : String;
      Expected : String)
      return Domain_Summary_Parse_Result
   is
      Result : constant Domain_Summary_Parse_Result :=
        Parse_Domain_Summary (Text);
   begin
      if Result.Status /= Humanize.Status.Ok then
         return Result;
      elsif Result.Domain (1 .. Result.Domain_Length) /= Expected then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Unsupported_Form,
                 others => <>);
      else
         return Result;
      end if;
   end Parse_Domain_With_Expected;

   function Parse_Sync_Summary
     (Text : String)
      return Domain_Summary_Parse_Result is
   begin
      return Parse_Domain_With_Expected (Text, "sync");
   end Parse_Sync_Summary;

   function Parse_Import_Summary
     (Text : String)
      return Domain_Summary_Parse_Result is
   begin
      return Parse_Domain_With_Expected (Text, "import");
   end Parse_Import_Summary;

   function Parse_Export_Summary
     (Text : String)
      return Domain_Summary_Parse_Result is
   begin
      return Parse_Domain_With_Expected (Text, "export");
   end Parse_Export_Summary;

   function Parse_Queue_Summary
     (Text : String)
      return Queue_Summary_Parse_Result
      is separate;

   function Parse_Cache_Summary
     (Text : String)
      return Cache_Summary_Parse_Result
      is separate;

   function Parse_File_Count_Label
     (Text  : String;
      Count : out Natural)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Amount : Long_Float;
      Tail : Unbounded_String;
   begin
      if Item = "no files" then
         Count := 0;
         return True;
      elsif Item = "1 file" then
         Count := 1;
         return True;
      elsif Parse_Number_And_Tail (Item, Amount, Tail)
        and then To_String (Tail) = "files"
        and then Amount >= 0.0
      then
         Count := Natural (Long_Float'Rounding (Amount));
         return Long_Float (Count) = Amount;
      else
         return False;
      end if;
   exception
      when others => --  parse failure normalization
         return False;
   end Parse_File_Count_Label;

   function Parse_File_Size_Summary
     (Text : String)
      return File_Size_Summary_Parse_Result
   is
      Item : constant String := Trim (Text);
      Comma : constant Natural := Find_Substring (Item, ", ");
      Count : Natural;
      Size : Byte_Parse_Result;
   begin
      if Comma = 0
        or else not Parse_File_Count_Label
          (Item (Item'First .. Comma - 1), Count)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      Size := Parse_Bytes (Item (Comma + 2 .. Item'Last));
      if Size.Status /= Humanize.Status.Ok then
         return (Status => Size.Status, Error => Size.Error, others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         File_Count => Count,
         Total => Size.Value,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_File_Size_Summary;

   function Parse_Transfer_Remaining
     (Text : String)
      return Transfer_Remaining_Parse_Result
      is separate;

   function Parse_Disk_Usage
     (Text : String)
      return Disk_Usage_Parse_Result
   is
      Item : constant String := Trim (Text);
      Of_Mark : constant String := " of ";
      Used_Mark : constant String := " used (";
      End_Mark : constant String := "%)";
      Of_At : constant Natural := Find_Substring (Item, Of_Mark);
      Used_At : constant Natural := Find_Substring (Item, Used_Mark);
      End_At : constant Natural := Find_Substring (Item, End_Mark);
      Used : Byte_Parse_Result;
      Total : Byte_Parse_Result;
      Percent : Natural;
   begin
      if Of_At = 0 or else Used_At = 0 or else End_At = 0
        or else Used_At <= Of_At
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      Used := Parse_Bytes (Item (Item'First .. Of_At - 1));
      Total := Parse_Bytes (Item (Of_At + Of_Mark'Length .. Used_At - 1));
      if Used.Status /= Humanize.Status.Ok then
         return (Status => Used.Status, Error => Used.Error, others => <>);
      elsif Total.Status /= Humanize.Status.Ok then
         return (Status => Total.Status, Error => Total.Error, others => <>);
      elsif not Parse_Natural_Field
        (Item (Used_At + Used_Mark'Length .. End_At - 1), Percent)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Used => Used.Value,
         Total => Total.Value,
         Percent_Used => Percent,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Disk_Usage;

   function Severity_From_Noun
     (Text     : String;
      Severity : out Validation_Severity_Label)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
   begin
      if Item = "error" or else Item = "errors" then
         Severity := Parsed_Validation_Error;
      elsif Item = "warning" or else Item = "warnings" then
         Severity := Parsed_Validation_Warning;
      elsif Item = "notice" or else Item = "notices" then
         Severity := Parsed_Validation_Info;
      else
         return False;
      end if;
      return True;
   end Severity_From_Noun;

   function Parse_Validation_Count_Header
     (Text     : String;
      Count    : out Natural;
      Severity : out Validation_Severity_Label)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Amount : Long_Float;
      Tail : Unbounded_String;
   begin
      if Starts_With (Lower (Item), "no ") then
         Count := 0;
         return Severity_From_Noun (Item (Item'First + 3 .. Item'Last),
                                    Severity);
      elsif Parse_Number_And_Tail (Item, Amount, Tail) and then Amount >= 0.0
      then
         Count := Natural (Long_Float'Rounding (Amount));
         return Long_Float (Count) = Amount
           and then Severity_From_Noun (To_String (Tail), Severity);
      else
         return False;
      end if;
   exception
      when others => --  parse failure normalization
         return False;
   end Parse_Validation_Count_Header;

   function Parse_Other_Count_From_Details (Text : String) return Natural
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Parse_Other_Count_From_Details;

   function Parse_Validation_Summary
     (Text : String)
      return Validation_Summary_Parse_Result
      is separate;

   function Parse_Field_Problem_Summary
     (Text : String)
      return Field_Problem_Parse_Result
   is
      Item : constant String := Trim (Text);
      Colon : constant Natural := Find_Substring (Item, ": ");
      Field_Buffer : String (1 .. 64);
      Field_Length : Natural;
      Summary : Validation_Summary_Parse_Result;
   begin
      if Colon = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      Store (Trim (Item (Item'First .. Colon - 1)), Field_Buffer, Field_Length);
      Summary := Parse_Validation_Summary (Item (Colon + 2 .. Item'Last));
      if Summary.Status /= Humanize.Status.Ok then
         return (Status => Summary.Status, Error => Summary.Error, others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Field => Field_Buffer,
         Field_Length => Field_Length,
         Summary => Summary,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Field_Problem_Summary;

   function Parse_Selection_Summary
     (Text : String)
      return Selection_Summary_Parse_Result
      is separate;

   function Parse_More_Count
     (Text : String)
      return More_Count_Parse_Result
   is
      Item : constant String := Trim (Text);
      Mark : constant String := " shown, +";
      More_Mark : constant String := " more";
      Mark_At : constant Natural := Find_Substring (Item, Mark);
      Visible : Natural;
      Remaining : Natural;
   begin
      if Mark_At = 0 or else not Ends_With (Item, More_Mark)
        or else not Parse_Natural_Field (Item (Item'First .. Mark_At - 1),
                                         Visible)
        or else not Parse_Natural_Field
          (Item (Mark_At + Mark'Length .. Item'Last - More_Mark'Length),
           Remaining)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Visible => Visible,
         Remaining => Remaining,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_More_Count;

   function Parse_Pagination_Range
     (Text : String)
      return Pagination_Range_Parse_Result
      is separate;

   function Parse_Collection_Display
     (Text : String)
      return Collection_Display_Parse_Result
      is separate;

   function Boolean_Label_Result
     (Item     : String;
      Consumed : Natural;
      Exact    : Boolean)
      return Boolean_Label_Parse_Result
      is separate;

   function Parse_Boolean_Label
     (Text : String)
      return Boolean_Label_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
   begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Empty_Input,
            others => <>);
      end if;

      declare
         Result : Boolean_Label_Parse_Result :=
           Boolean_Label_Result (Item, Item'Length, True);
      begin
         if Result.Status /= Humanize.Status.Ok then
            Result.Error_Position := Text'First;
            Result.Error := Unsupported_Form;
         end if;
         return Result;
      end;
   exception
      when others => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Parse_Boolean_Label;

   function Scan_Boolean_Label
     (Text : String)
      return Boolean_Label_Parse_Result
   is
      First : Natural := Text'First;
      Last  : constant Natural := First_Alphabetic_Token_Last (Text);
   begin
      while First <= Text'Last and then Text (First) = ' ' loop
         First := First + 1;
      end loop;

      if Last = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Empty_Input,
            others => <>);
      end if;

      declare
         Item : constant String := Lower (Text (First .. Last));
         Result : Boolean_Label_Parse_Result :=
           Boolean_Label_Result
             (Item, Last - Text'First + 1, Last = Text'Last);
      begin
         if Result.Status /= Humanize.Status.Ok then
            Result.Error_Position := First;
            Result.Error := Unsupported_Form;
         end if;
         return Result;
      end;
   exception
      when others => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Scan_Boolean_Label;

   function Ternary_Label_Result
     (Item     : String;
      Consumed : Natural;
      Exact    : Boolean)
      return Ternary_Label_Parse_Result
      is separate;

   function Parse_Ternary_Label
     (Text : String)
      return Ternary_Label_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
   begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Empty_Input,
            others => <>);
      end if;

      declare
         Result : Ternary_Label_Parse_Result :=
           Ternary_Label_Result (Item, Item'Length, True);
      begin
         if Result.Status /= Humanize.Status.Ok then
            Result.Error_Position := Text'First;
            Result.Error := Unsupported_Form;
         end if;
         return Result;
      end;
   exception
      when others => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Parse_Ternary_Label;

   function Scan_Ternary_Label
     (Text : String)
      return Ternary_Label_Parse_Result
   is
      First : Natural := Text'First;
      Last  : constant Natural := First_Alphabetic_Token_Last (Text);
   begin
      while First <= Text'Last and then Text (First) = ' ' loop
         First := First + 1;
      end loop;

      if Last = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Empty_Input,
            others => <>);
      end if;

      declare
         Item : constant String := Lower (Text (First .. Last));
         Result : Ternary_Label_Parse_Result :=
           Ternary_Label_Result
             (Item, Last - Text'First + 1, Last = Text'Last);
      begin
         if Result.Status /= Humanize.Status.Ok then
            Result.Error_Position := First;
            Result.Error := Unsupported_Form;
         end if;
         return Result;
      end;
   exception
      when others => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Scan_Ternary_Label;

end Humanize.Parsing.Implementation.Domain_Label_Text_Helpers;
