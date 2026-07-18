with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Project_Tools.TOML;

package Check_Humanize_Policy_Support is
   procedure Error
     (Errors  : in out Natural;
      Message : String);

   procedure Require_Text
     (Root          : String;
      Errors        : in out Natural;
      Relative_Path : String;
      Pattern       : String;
      Message       : String);

   procedure Require_File
     (Root          : String;
      Errors        : in out Natural;
      Relative_Path : String);

   function Read_File
     (Root          : String;
      Relative_Path : String)
      return String;

   function Contains (Text, Pattern : String) return Boolean;
   function Starts_With (Text, Prefix : String) return Boolean;
   function Ends_With (Text, Suffix : String) return Boolean;
   function Line_Count (Text : String) return Natural;
   function SHA256_Hex (Text : String) return String;

   subtype Natural_Parse_Status is Project_Tools.TOML.Natural_Parse_Status;
   Parsed_Natural : constant Natural_Parse_Status :=
     Project_Tools.TOML.Parsed_Natural;
   Missing_Natural : constant Natural_Parse_Status :=
     Project_Tools.TOML.Missing_Natural;
   Malformed_Natural : constant Natural_Parse_Status :=
     Project_Tools.TOML.Malformed_Natural;

   subtype Natural_Parse_Result is Project_Tools.TOML.Natural_Parse_Result;

   subtype String_Parse_Status is Project_Tools.TOML.String_Parse_Status;
   Parsed_String : constant String_Parse_Status :=
     Project_Tools.TOML.Parsed_String;
   Missing_String : constant String_Parse_Status :=
     Project_Tools.TOML.Missing_String;
   Malformed_String : constant String_Parse_Status :=
     Project_Tools.TOML.Malformed_String;

   subtype String_Parse_Result is Project_Tools.TOML.String_Parse_Result;

   function Parse_Natural_After
     (Text : String;
      Key  : String;
      From : Positive)
      return Natural_Parse_Result;

   function Parse_String_After
     (Text : String;
      Key  : String;
      From : Positive)
      return String_Parse_Result;

   function Natural_Value_After
     (Text : String;
      Key  : String;
      From : Positive)
      return Natural;

   function Manifest_String_Value_After
     (Text : String;
      Key  : String;
      From : Positive)
      return String;

   function Policy_Threshold
     (Root : String;
      Key  : String)
      return Natural;

   procedure Require_Minimum
     (Root    : String;
      Errors  : in out Natural;
      Key     : String;
      Actual  : Natural;
      Message : String);

   procedure Require_Exact
     (Root    : String;
      Errors  : in out Natural;
      Key     : String;
      Actual  : Natural;
      Message : String);

   procedure Require_Maximum
     (Root    : String;
      Errors  : in out Natural;
      Key     : String;
      Actual  : Natural;
      Message : String);

   procedure Check_Policy_Threshold_Keys
     (Root   : String;
      Errors : in out Natural);

   generic
      with procedure Process (Entry_Pos : Positive);
   procedure Iterate_Manifest_Section
     (Text    : String;
      Section : String);

   function Count_Files_With_Prefix
     (Root   : String;
      Prefix : String)
      return Natural;

   function Quoted_Value_After
     (Text : String;
      Key  : String;
      From : Positive)
      return String;
end Check_Humanize_Policy_Support;
