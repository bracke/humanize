with Humanize.Domain_Details;
with Humanize.Status;

private package Humanize.Cross_Domain.Support is
   function Time_Zone_Label
     (Kind           : Time_Zone_Kind;
      Name           : String := "";
      Offset_Minutes : Integer := 0;
      Has_DST        : Boolean := False)
      return Humanize.Status.Text_Result;
   function Zoned_Time_Label
     (Local_Time     : String;
      Zone_Name      : String;
      Offset_Minutes : Integer;
      Ambiguous      : Boolean := False)
      return Humanize.Status.Text_Result;
   function Resolve_Time_Zone_Label
     (Name       : String;
      Local_Time : String;
      Resolution : Time_Zone_Resolution)
      return Humanize.Status.Text_Result;
   function Time_Zone_Resolution_Label
     (Name       : String;
      Resolution : Time_Zone_Resolution)
      return Humanize.Status.Text_Result;
   function Identifier_Label
     (Kind           : Identifier_Kind;
      Value          : String;
      Visible_Prefix : Natural := 6;
      Visible_Suffix : Natural := 4)
      return Humanize.Status.Text_Result;
   function Identifier_Kind_Of
     (Value : String)
      return Identifier_Classification;
   function Auto_Identifier_Label
     (Value : String)
      return Humanize.Status.Text_Result;
   function Contact_Label
     (Kind           : Contact_Kind;
      Value          : String;
      Preserve_Domain : Boolean := True)
      return Humanize.Status.Text_Result;
   function Contact_Profile_Of
     (Value : String)
      return Contact_Profile;
   function Auto_Contact_Label
     (Value : String)
      return Humanize.Status.Text_Result;
   function Product_Code_Kind_Of
     (Value : String)
      return Product_Code_Kind;
   function Product_Code_Label
     (Value : String;
      Kind  : Product_Code_Kind := Unknown_Product_Code;
      Checksum : Checksum_State := Checksum_Not_Checked)
      return Humanize.Status.Text_Result;
   function Product_Code_Checksum
     (Value : String;
      Kind  : Product_Code_Kind := Unknown_Product_Code)
      return Checksum_State;
   function Machine_Checksum
     (Value : String;
      Kind  : Machine_Checksum_Kind)
      return Checksum_State;
   function Machine_Checksum_Label
     (Value : String;
      Kind  : Machine_Checksum_Kind)
      return Humanize.Status.Text_Result;
   function Parse_Product_Code_Label
     (Text : String)
      return Product_Code_Parse_Result;
   function Scan_Product_Code_Label
     (Text : String)
      return Product_Code_Parse_Result;
   function Progress_Label
     (Subject : String;
      Done    : Natural;
      Total   : Natural;
      State   : Progress_State := Progress_Running)
      return Humanize.Status.Text_Result;
   function Progress_Bar_Label
     (Done  : Natural;
      Total : Natural;
      Width : Positive := 10)
      return Humanize.Status.Text_Result;
   function Collection_Summary_Label
     (Name       : String;
      Total      : Natural;
      Unique     : Natural := 0;
      Duplicates : Natural := 0;
      Outliers   : Natural := 0)
      return Humanize.Status.Text_Result;
   function Top_Frequency_Label
     (Name  : String;
      Value : String;
      Count : Natural)
      return Humanize.Status.Text_Result;
   function Enum_Label
     (Value        : String;
      Strip_Prefix : String := "";
      Strip_Suffix : String := "")
      return Humanize.Status.Text_Result;
   function Structured_Diff_Label
     (Path       : String;
      Old_Value  : String := "";
      New_Value  : String := "";
      Redacted   : Boolean := False)
      return Humanize.Status.Text_Result;
   function Validation_Problem_Label
     (Field   : String;
      Kind    : Validation_Problem_Kind;
      Detail  : String := "")
      return Humanize.Status.Text_Result;
   function Validation_Constraint_Label
     (Field    : String;
      Relation : Validation_Relation;
      Value    : String;
      Actual   : String := "")
      return Humanize.Status.Text_Result;
   function Validation_Choice_Label
     (Field   : String;
      Choices : String;
      Actual  : String := "")
      return Humanize.Status.Text_Result;
   function Validation_Result_Label
     (Summary : Validation_Result_Summary)
      return Humanize.Status.Text_Result;
   function Parse_Validation_Constraint_Label
     (Text : String)
      return Validation_Constraint_Parse_Result;
   function Scan_Validation_Constraint_Label
     (Text : String)
      return Validation_Constraint_Parse_Result;
   function File_Metadata_Label
     (Name     : String;
      Kind     : File_Metadata_Kind;
      Size     : String := "";
      Checksum : String := "")
      return Humanize.Status.Text_Result;
   function File_Metadata_Kind_Of
     (Name         : String;
      Content_Type : String := "";
      Executable   : Boolean := False;
      Checksum     : Checksum_State := Checksum_Not_Checked)
      return File_Metadata_Classification;
   function Auto_File_Metadata_Label
     (Name         : String;
      Content_Type : String := "";
      Size         : String := "";
      Executable   : Boolean := False;
      Checksum     : Checksum_State := Checksum_Not_Checked)
      return Humanize.Status.Text_Result;
   function File_Signature_Label
     (Name             : String;
      Extension_Kind   : File_Metadata_Kind;
      Signature_Kind   : File_Metadata_Kind)
      return Humanize.Status.Text_Result;
   function Parse_File_Metadata_Label
     (Text : String)
      return File_Metadata_Parse_Result;
   function Scan_File_Metadata_Label
     (Text : String)
      return File_Metadata_Parse_Result;
   function Network_Session_Label
     (Endpoint   : String;
      Event      : Network_Event_Kind;
      Detail     : String := "";
      Retry_After : String := "")
      return Humanize.Status.Text_Result;
   function Network_Diagnostic_Label
     (Endpoint : String;
      Kind     : Network_Diagnostic_Kind;
      Detail   : String := "";
      Retry_After : String := "")
      return Humanize.Status.Text_Result;
   function Network_Event_Kind_Of
     (Status_Code : Natural;
      Retrying    : Boolean := False;
      TLS_Failed  : Boolean := False)
      return Network_Event_Kind;
   function Network_Diagnostic_Kind_Of
     (Detail : String)
      return Network_Diagnostic_Kind;
   function Parse_Network_Diagnostic_Label
     (Text : String)
      return Network_Diagnostic_Parse_Result;
   function Scan_Network_Diagnostic_Label
     (Text : String)
      return Network_Diagnostic_Parse_Result;
   function Terminal_Column_Label
     (Name      : String;
      Width     : Positive;
      Alignment : Terminal_Alignment := Align_Left)
      return Humanize.Status.Text_Result;
   function Terminal_Row_Label
     (Cells     : Natural;
      Width     : Natural;
      Truncated : Boolean := False)
      return Humanize.Status.Text_Result;
   function Terminal_Table_Layout_Label
     (Columns        : Natural;
      Rows           : Natural;
      Width          : Natural;
      Truncated_Cells : Natural := 0)
      return Humanize.Status.Text_Result;
   function Terminal_Table_Render_Label
     (Spec : Terminal_Table_Spec)
      return Humanize.Status.Text_Result;
   function Metadata_Profile_Label
     (Family  : String;
      Profile : Metadata_Profile)
      return Humanize.Status.Text_Result;
   function Domain_Metadata_Profile
     (Metadata : Humanize.Domain_Details.Domain_Label_Metadata)
      return Metadata_Profile;
   function Label_Family_Profile
     (Family : String)
      return Metadata_Profile;
   function Metadata_Coverage_Label
     (Summary : Metadata_Coverage_Summary)
      return Humanize.Status.Text_Result;
   function Metadata_Coverage
     (Items : Label_Family_Capability_List)
      return Metadata_Coverage_Summary;
   function Enum_State_Metadata_Of
     (Value : String)
      return Enum_State_Metadata;
   function Enum_State_Metadata_Label
     (Value : String)
      return Humanize.Status.Text_Result;
   function Structured_Diff_Tree_Label
     (Root_Path      : String;
      Changed_Fields : Natural;
      Added_Items    : Natural := 0;
      Removed_Items  : Natural := 0;
      Redacted_Items : Natural := 0)
      return Humanize.Status.Text_Result;
   function Diff_Node_Label
     (Path : String;
      Kind : Diff_Node_Kind;
      Changes : Natural)
      return Humanize.Status.Text_Result;
   function Diff_Tree_Metadata_Label
     (Summary : Diff_Tree_Summary)
      return Humanize.Status.Text_Result;
   function Parse_Structured_Diff_Tree_Label
     (Text : String)
      return Diff_Tree_Parse_Result;
   function Scan_Structured_Diff_Tree_Label
     (Text : String)
      return Diff_Tree_Parse_Result;
   function Contact_Field_Label
     (Fields : Contact_Field_Set;
      Missing_Only : Boolean := False)
      return Humanize.Status.Text_Result;
   function Parse_Feature_Label
     (Text : String)
      return Feature_Label_Parse_Result;
   function Scan_Feature_Label
     (Text : String)
      return Feature_Label_Parse_Result;
   procedure Time_Zone_Label_Into
     (Kind           : Time_Zone_Kind;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Name           : String := "";
      Offset_Minutes : Integer := 0;
      Has_DST        : Boolean := False);
   procedure Identifier_Label_Into
     (Kind           : Identifier_Kind;
      Value          : String;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Visible_Prefix : Natural := 6;
      Visible_Suffix : Natural := 4);
   procedure Progress_Label_Into
     (Subject : String;
      Done    : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Progress_State := Progress_Running);
   procedure Metadata_Profile_Label_Into
     (Family  : String;
      Profile : Metadata_Profile;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Product_Code_Label_Into
     (Value    : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Kind     : Product_Code_Kind := Unknown_Product_Code;
      Checksum : Checksum_State := Checksum_Not_Checked);
   procedure Network_Diagnostic_Label_Into
     (Endpoint : String;
      Kind     : Network_Diagnostic_Kind;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Detail   : String := "";
      Retry_After : String := "");
   procedure Validation_Constraint_Label_Into
     (Field    : String;
      Relation : Validation_Relation;
      Value    : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Actual   : String := "");
   procedure Terminal_Table_Render_Label_Into
     (Spec    : Terminal_Table_Spec;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
end Humanize.Cross_Domain.Support;
