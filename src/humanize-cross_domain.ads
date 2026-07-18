with Humanize.Domain_Details;
with Humanize.Status;

--  Cross-domain deterministic labels for common humanized technical facts.
package Humanize.Cross_Domain is
   --  Facade section: shared cross-domain categories, metadata, labels, and bounded output adapters.
   type Time_Zone_Kind is
     (UTC_Zone,
      Offset_Zone,
      Named_Zone,
      Local_Zone,
      Unknown_Zone);
   --  Stable category for a caller-supplied time-zone description.

   type Identifier_Kind is
     (UUID_Identifier,
      ULID_Identifier,
      Commit_Identifier,
      Checksum_Identifier,
      Trace_Identifier,
      Ticket_Identifier,
      Opaque_Identifier);
   --  Stable category for common technical identifiers.

   type Contact_Kind is
     (Email_Contact,
      Phone_Contact,
      Address_Contact,
      Unknown_Contact);
   --  Stable category for privacy-aware contact labels.

   type Progress_State is
     (Progress_Not_Started,
      Progress_Running,
      Progress_Stalled,
      Progress_Retrying,
      Progress_Complete,
      Progress_Failed);
   --  Stable progress state for generic progress labels.

   type Validation_Problem_Kind is
     (Required_Problem,
      Minimum_Problem,
      Maximum_Problem,
      Range_Problem,
      Pattern_Problem,
      Choice_Problem,
      Dependency_Problem,
      Custom_Problem);
   --  Stable validation problem category.

   type File_Metadata_Kind is
     (Plain_File,
      Directory_File,
      Archive_File,
      Compressed_File,
      Image_File,
      Script_File,
      Executable_File,
      Unknown_File);
   --  Stable file/package metadata category.

   type Network_Event_Kind is
     (Connecting_Network,
      Connected_Network,
      Redirected_Network,
      Retrying_Network,
      Rate_Limited_Network,
      TLS_Failed_Network,
      Stalled_Network,
      Complete_Network,
      Failed_Network);
   --  Stable network transfer/session category.

   type Network_Diagnostic_Kind is
     (DNS_Diagnostic,
      TCP_Diagnostic,
      TLS_Diagnostic,
      HTTP_Diagnostic,
      Proxy_Diagnostic,
      Timeout_Diagnostic,
      Reset_Diagnostic,
      Unknown_Network_Diagnostic);
   --  Stable network diagnostic category.

   type Terminal_Alignment is
     (Align_Left,
      Align_Right,
      Align_Center);
   --  Stable terminal column alignment.

   type Product_Code_Kind is
     (ISBN_10_Code,
      ISBN_13_Code,
      EAN_13_Code,
      UPC_A_Code,
      SKU_Code,
      Barcode_Code,
      Unknown_Product_Code);
   --  Stable product-code category.

   type Checksum_State is
     (Checksum_Not_Checked,
      Checksum_Valid,
      Checksum_Mismatch,
      Checksum_Missing);
   --  Stable checksum verification state.

   type Machine_Checksum_Kind is
     (Luhn_Checksum,
      IBAN_Checksum,
      ISIN_Checksum,
      VIN_Checksum,
      Unknown_Checksum);
   --  Stable checksum/check-digit category for generic machine identifiers.

   type Validation_Relation is
     (No_Relation,
      Less_Than,
      Less_Or_Equal,
      Greater_Than,
      Greater_Or_Equal,
      Equal_To,
      Not_Equal_To,
      Before_Field,
      After_Field);
   --  Stable structured validation relation.

   type Enum_State_Category is
     (Neutral_State,
      Success_State,
      Warning_State,
      Failure_State,
      Pending_State);
   --  Stable inferred category for enum-like state labels.

   type Diff_Node_Kind is
     (Field_Node,
      Object_Node,
      List_Node);
   --  Stable node category for structured diff summaries.

   type Metadata_Profile is record
      Log_Safe          : Boolean := True;
      Privacy_Safe      : Boolean := True;
      Parseable         : Boolean := True;
      Bounded_Available : Boolean := True;
      Stable            : Boolean := True;
      Approximate       : Boolean := False;
      Lossless          : Boolean := True;
   end record;
   --  Machine-readable stability/privacy profile for a label family.

   type Feature_Label_Parse_Result is record
      Status       : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Consumed     : Natural := 0;
      Kind_First   : Natural := 0;
      Kind_Length  : Natural := 0;
      Body_First   : Natural := 0;
      Body_Length  : Natural := 0;
      First_Count  : Natural := 0;
      Second_Count : Natural := 0;
      Percent      : Natural := 0;
   end record;
   --  Parsed spans and common counts from deterministic cross-domain labels.

   type Time_Zone_Resolution is record
      Kind           : Time_Zone_Kind := Unknown_Zone;
      Offset_Minutes : Integer := 0;
      Ambiguous      : Boolean := False;
      Skipped        : Boolean := False;
      Has_DST        : Boolean := False;
   end record;
   --  Caller-supplied named-zone resolution result.

   type Identifier_Classification is record
      Kind        : Identifier_Kind := Opaque_Identifier;
      Valid_Shape : Boolean := False;
      Entropy_Hint : Natural := 0;
   end record;
   --  Best-effort identifier classification metadata.

   type Contact_Profile is record
      Kind          : Contact_Kind := Unknown_Contact;
      Valid_Shape   : Boolean := False;
      Has_Domain    : Boolean := False;
      Privacy_Safe  : Boolean := True;
      Visible_Tail  : Natural := 0;
   end record;
   --  Best-effort contact classification and privacy profile.

   type File_Metadata_Classification is record
      Kind              : File_Metadata_Kind := Unknown_File;
      Has_Extension     : Boolean := False;
      Archive           : Boolean := False;
      Compressed        : Boolean := False;
      Executable_Hint   : Boolean := False;
      Checksum_Verified : Checksum_State := Checksum_Not_Checked;
   end record;
   --  Best-effort file/package metadata classification.

   type Enum_State_Metadata is record
      Category   : Enum_State_Category := Neutral_State;
      Final      : Boolean := False;
      Actionable : Boolean := False;
      Severity   : Humanize.Domain_Details.Domain_Severity :=
        Humanize.Domain_Details.Neutral_Severity;
   end record;
   --  Inferred metadata for enum/state fallback labels.

   type Metadata_Coverage_Summary is record
      Total_Families      : Natural := 0;
      Metadata_Families   : Natural := 0;
      Parseable_Families  : Natural := 0;
      Bounded_Families    : Natural := 0;
      Privacy_Safe_Families : Natural := 0;
   end record;
   --  Cross-package metadata coverage counts.

   type Product_Code_Parse_Result is record
      Status      : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Kind        : Product_Code_Kind := Unknown_Product_Code;
      Checksum    : Checksum_State := Checksum_Not_Checked;
      Consumed    : Natural := 0;
      Value_First : Natural := 0;
      Value_Length : Natural := 0;
   end record;
   --  Parsed product-code label metadata.

   type Network_Diagnostic_Parse_Result is record
      Status       : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Kind         : Network_Diagnostic_Kind := Unknown_Network_Diagnostic;
      Consumed     : Natural := 0;
      Endpoint_First : Natural := 0;
      Endpoint_Length : Natural := 0;
      Detail_First : Natural := 0;
      Detail_Length : Natural := 0;
   end record;
   --  Parsed network diagnostic label metadata.

   type Validation_Constraint_Parse_Result is record
      Status       : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Relation     : Validation_Relation := No_Relation;
      Consumed     : Natural := 0;
      Field_First  : Natural := 0;
      Field_Length : Natural := 0;
      Value_First  : Natural := 0;
      Value_Length : Natural := 0;
      Actual_First : Natural := 0;
      Actual_Length : Natural := 0;
   end record;
   --  Parsed validation-constraint label metadata.

   type File_Metadata_Parse_Result is record
      Status      : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Kind        : File_Metadata_Kind := Unknown_File;
      Checksum    : Checksum_State := Checksum_Not_Checked;
      Consumed    : Natural := 0;
      Name_First  : Natural := 0;
      Name_Length : Natural := 0;
   end record;
   --  Parsed file metadata label metadata.

   type Diff_Tree_Parse_Result is record
      Status       : Humanize.Status.Status_Code := Humanize.Status.Ok;
      Consumed     : Natural := 0;
      Root_First   : Natural := 0;
      Root_Length  : Natural := 0;
      Changed      : Natural := 0;
      Added        : Natural := 0;
      Removed      : Natural := 0;
      Redacted     : Natural := 0;
   end record;
   --  Parsed structured diff tree summary.

   type Contact_Field_Set is record
      Has_Name       : Boolean := False;
      Has_Email      : Boolean := False;
      Has_Phone      : Boolean := False;
      Has_Address    : Boolean := False;
      Has_City       : Boolean := False;
      Has_Postal_Code : Boolean := False;
      Has_Country    : Boolean := False;
   end record;
   --  Caller-supplied structured contact/address field presence.

   type Validation_Result_Summary is record
      Fields       : Natural := 0;
      Errors       : Natural := 0;
      Warnings     : Natural := 0;
      Required     : Natural := 0;
      Choices      : Natural := 0;
      Dependencies : Natural := 0;
      Hidden       : Natural := 0;
   end record;
   --  Aggregated validation problem counts.

   type Diff_Tree_Summary is record
      Nodes        : Natural := 0;
      Field_Nodes  : Natural := 0;
      Object_Nodes : Natural := 0;
      List_Nodes   : Natural := 0;
      Redacted     : Natural := 0;
   end record;
   --  Structured diff tree node counts.

   subtype Terminal_Table_Capacity is Natural range 0 .. 64;

   type Terminal_Table_Spec is record
      Columns          : Terminal_Table_Capacity := 0;
      Rows             : Natural := 0;
      Width            : Natural := 0;
      Header           : Boolean := False;
      Wrapped_Cells    : Natural := 0;
      Truncated_Cells  : Natural := 0;
      ANSI_Aware       : Boolean := True;
   end record;
   --  Caller-supplied terminal table rendering metadata.

   type Label_Family_Capability is record
      Family   : String (1 .. 32) := [others => ' '];
      Length   : Natural := 0;
      Profile  : Metadata_Profile;
   end record;
   --  Bounded registry entry for one label family.

   type Label_Family_Capability_List is
     array (Positive range <>) of Label_Family_Capability;
   --  Caller-owned list of label-family capabilities.

   function Time_Zone_Label
     (Kind           : Time_Zone_Kind;
      Name           : String := "";
      Offset_Minutes : Integer := 0;
      Has_DST        : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Kind Time-zone category.
   --  @param Name Optional zone name or abbreviation.
   --  @param Offset_Minutes Offset from UTC in minutes.
   --  @param Has_DST True when the label should note daylight-saving behavior.
   --  @return Human-readable time-zone label.

   function Zoned_Time_Label
     (Local_Time     : String;
      Zone_Name      : String;
      Offset_Minutes : Integer;
      Ambiguous      : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Local_Time Caller-rendered local date/time text.
   --  @param Zone_Name Named zone or abbreviation.
   --  @param Offset_Minutes Offset from UTC in minutes.
   --  @param Ambiguous True for repeated/skipped wall-clock times.
   --  @return Human-readable zoned-time label.

   function Resolve_Time_Zone_Label
     (Name       : String;
      Local_Time : String;
      Resolution : Time_Zone_Resolution)
      return Humanize.Status.Text_Result;
   --  @param Name Named zone or abbreviation.
   --  @param Local_Time Caller-rendered local date/time text.
   --  @param Resolution Caller-supplied zone resolution metadata.
   --  @return Human-readable resolved-zone label with ambiguity/skipped metadata.

   function Time_Zone_Resolution_Label
     (Name       : String;
      Resolution : Time_Zone_Resolution)
      return Humanize.Status.Text_Result;
   --  @param Name Named zone or abbreviation.
   --  @param Resolution Caller-supplied zone resolution metadata.
   --  @return Human-readable zone-resolution metadata label.

   function Identifier_Label
     (Kind           : Identifier_Kind;
      Value          : String;
      Visible_Prefix : Natural := 6;
      Visible_Suffix : Natural := 4)
      return Humanize.Status.Text_Result;
   --  @param Kind Identifier category.
   --  @param Value Raw identifier text.
   --  @param Visible_Prefix Number of leading characters to expose.
   --  @param Visible_Suffix Number of trailing characters to expose.
   --  @return Human-readable shortened identifier label.

   function Identifier_Kind_Of
     (Value : String)
      return Identifier_Classification;
   --  @param Value Raw identifier text.
   --  @return Best-effort identifier classification.

   function Auto_Identifier_Label
     (Value : String)
      return Humanize.Status.Text_Result;
   --  @param Value Raw identifier text.
   --  @return Human-readable shortened identifier label using inferred kind.

   function Contact_Label
     (Kind           : Contact_Kind;
      Value          : String;
      Preserve_Domain : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Kind Contact category.
   --  @param Value Raw contact text.
   --  @param Preserve_Domain True to keep email domains in safe labels.
   --  @return Privacy-aware contact label.

   function Contact_Profile_Of
     (Value : String)
      return Contact_Profile;
   --  @param Value Raw contact text.
   --  @return Best-effort contact classification.

   function Auto_Contact_Label
     (Value : String)
      return Humanize.Status.Text_Result;
   --  @param Value Raw contact text.
   --  @return Privacy-aware contact label using inferred kind.

   function Product_Code_Kind_Of
     (Value : String)
      return Product_Code_Kind;
   --  @param Value Raw product, barcode, ISBN, EAN, UPC, or SKU text.
   --  @return Best-effort product-code category.

   function Product_Code_Label
     (Value : String;
      Kind  : Product_Code_Kind := Unknown_Product_Code;
      Checksum : Checksum_State := Checksum_Not_Checked)
      return Humanize.Status.Text_Result;
   --  @param Value Raw product code.
   --  @param Kind Product-code category, or Unknown_Product_Code to infer.
   --  @param Checksum Optional checksum verification state.
   --  @return Human-readable product-code label.

   function Product_Code_Checksum
     (Value : String;
      Kind  : Product_Code_Kind := Unknown_Product_Code)
      return Checksum_State;
   --  @param Value Raw product code.
   --  @param Kind Product-code category, or Unknown_Product_Code to infer.
   --  @return Deterministic checksum validation state when supported.

   function Machine_Checksum
     (Value : String;
      Kind  : Machine_Checksum_Kind)
      return Checksum_State;
   --  @param Value Raw machine identifier.
   --  @param Kind Checksum/check-digit algorithm category.
   --  @return Deterministic checksum validation state when supported.

   function Machine_Checksum_Label
     (Value : String;
      Kind  : Machine_Checksum_Kind)
      return Humanize.Status.Text_Result;
   --  @param Value Raw machine identifier.
   --  @param Kind Checksum/check-digit algorithm category.
   --  @return Human-readable machine-checksum label.

   function Parse_Product_Code_Label
     (Text : String)
      return Product_Code_Parse_Result;
   --  @param Text Label rendered by Product_Code_Label.
   --  @return Parsed product-code label metadata.

   function Scan_Product_Code_Label
     (Text : String)
      return Product_Code_Parse_Result;
   --  @param Text Text beginning with a product-code label.
   --  @return Parsed product-code label prefix.

   function Progress_Label
     (Subject : String;
      Done    : Natural;
      Total   : Natural;
      State   : Progress_State := Progress_Running)
      return Humanize.Status.Text_Result;
   --  @param Subject Work item being tracked.
   --  @param Done Completed unit count.
   --  @param Total Total unit count, or zero when unknown.
   --  @param State Current progress state.
   --  @return Human-readable progress label.

   function Progress_Bar_Label
     (Done  : Natural;
      Total : Natural;
      Width : Positive := 10)
      return Humanize.Status.Text_Result;
   --  @param Done Completed unit count.
   --  @param Total Total unit count.
   --  @param Width Number of cells in the text bar.
   --  @return Deterministic ASCII progress bar.

   function Collection_Summary_Label
     (Name       : String;
      Total      : Natural;
      Unique     : Natural := 0;
      Duplicates : Natural := 0;
      Outliers   : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Name Collection name.
   --  @param Total Total item count.
   --  @param Unique Unique item count.
   --  @param Duplicates Duplicate item count.
   --  @param Outliers Outlier item count.
   --  @return Human-readable collection statistics.

   function Top_Frequency_Label
     (Name  : String;
      Value : String;
      Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Name Collection or metric name.
   --  @param Value Most common value.
   --  @param Count Frequency count.
   --  @return Human-readable top-frequency label.

   function Enum_Label
     (Value        : String;
      Strip_Prefix : String := "";
      Strip_Suffix : String := "")
      return Humanize.Status.Text_Result;
   --  @param Value Enum-like token.
   --  @param Strip_Prefix Optional prefix removed before humanization.
   --  @param Strip_Suffix Optional suffix removed before humanization.
   --  @return Human-readable enum/state fallback label.

   function Structured_Diff_Label
     (Path       : String;
      Old_Value  : String := "";
      New_Value  : String := "";
      Redacted   : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Path Field path or setting name.
   --  @param Old_Value Previous value.
   --  @param New_Value New value.
   --  @param Redacted True to hide both values.
   --  @return Human-readable structured diff label.

   function Validation_Problem_Label
     (Field   : String;
      Kind    : Validation_Problem_Kind;
      Detail  : String := "")
      return Humanize.Status.Text_Result;
   --  @param Field Field name.
   --  @param Kind Constraint/problem category.
   --  @param Detail Optional constraint detail.
   --  @return Human-readable validation problem label.

   function Validation_Constraint_Label
     (Field    : String;
      Relation : Validation_Relation;
      Value    : String;
      Actual   : String := "")
      return Humanize.Status.Text_Result;
   --  @param Field Field name.
   --  @param Relation Structured validation relation.
   --  @param Value Expected value, bound, or peer field.
   --  @param Actual Optional actual value.
   --  @return Human-readable structured validation constraint label.

   function Validation_Choice_Label
     (Field   : String;
      Choices : String;
      Actual  : String := "")
      return Humanize.Status.Text_Result;
   --  @param Field Field name.
   --  @param Choices Caller-rendered allowed choices.
   --  @param Actual Optional actual value.
   --  @return Human-readable allowed-choice validation label.

   function Validation_Result_Label
     (Summary : Validation_Result_Summary)
      return Humanize.Status.Text_Result;
   --  @param Summary Aggregated validation problem counts.
   --  @return Human-readable validation result summary.

   function Parse_Validation_Constraint_Label
     (Text : String)
      return Validation_Constraint_Parse_Result;
   --  @param Text Label rendered by Validation_Constraint_Label.
   --  @return Parsed validation-constraint label metadata.

   function Scan_Validation_Constraint_Label
     (Text : String)
      return Validation_Constraint_Parse_Result;
   --  @param Text Text beginning with a validation-constraint label.
   --  @return Parsed validation-constraint label prefix.

   function File_Metadata_Label
     (Name     : String;
      Kind     : File_Metadata_Kind;
      Size     : String := "";
      Checksum : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name File, archive, or package name.
   --  @param Kind File metadata category.
   --  @param Size Optional caller-rendered size.
   --  @param Checksum Optional checksum or checksum state.
   --  @return Human-readable file metadata label.

   function File_Metadata_Kind_Of
     (Name         : String;
      Content_Type : String := "";
      Executable   : Boolean := False;
      Checksum     : Checksum_State := Checksum_Not_Checked)
      return File_Metadata_Classification;
   --  @param Name File, archive, or package name.
   --  @param Content_Type Optional MIME/content type.
   --  @param Executable True when caller knows the file is executable.
   --  @param Checksum Optional checksum verification state.
   --  @return Best-effort file metadata classification.

   function Auto_File_Metadata_Label
     (Name         : String;
      Content_Type : String := "";
      Size         : String := "";
      Executable   : Boolean := False;
      Checksum     : Checksum_State := Checksum_Not_Checked)
      return Humanize.Status.Text_Result;
   --  @param Name File, archive, or package name.
   --  @param Content_Type Optional MIME/content type.
   --  @param Size Optional caller-rendered size.
   --  @param Executable True when caller knows the file is executable.
   --  @param Checksum Optional checksum verification state.
   --  @return Human-readable file metadata label using inferred kind.

   function File_Signature_Label
     (Name             : String;
      Extension_Kind   : File_Metadata_Kind;
      Signature_Kind   : File_Metadata_Kind)
      return Humanize.Status.Text_Result;
   --  @param Name File name.
   --  @param Extension_Kind Kind inferred from extension.
   --  @param Signature_Kind Kind inferred from content signature.
   --  @return Human-readable extension/signature agreement label.

   function Parse_File_Metadata_Label
     (Text : String)
      return File_Metadata_Parse_Result;
   --  @param Text Label rendered by File_Metadata_Label.
   --  @return Parsed file metadata label.

   function Scan_File_Metadata_Label
     (Text : String)
      return File_Metadata_Parse_Result;
   --  @param Text Text beginning with a file metadata label.
   --  @return Parsed file metadata label prefix.

   function Network_Session_Label
     (Endpoint   : String;
      Event      : Network_Event_Kind;
      Detail     : String := "";
      Retry_After : String := "")
      return Humanize.Status.Text_Result;
   --  @param Endpoint Host, URL, or service label.
   --  @param Event Network session state.
   --  @param Detail Optional latency, redirect, TLS, or transfer detail.
   --  @param Retry_After Optional retry delay.
   --  @return Human-readable network/session label.

   function Network_Diagnostic_Label
     (Endpoint : String;
      Kind     : Network_Diagnostic_Kind;
      Detail   : String := "";
      Retry_After : String := "")
      return Humanize.Status.Text_Result;
   --  @param Endpoint Host, URL, or service label.
   --  @param Kind Network diagnostic category.
   --  @param Detail Optional diagnostic detail.
   --  @param Retry_After Optional retry delay.
   --  @return Human-readable network diagnostic label.

   function Network_Event_Kind_Of
     (Status_Code : Natural;
      Retrying    : Boolean := False;
      TLS_Failed  : Boolean := False)
      return Network_Event_Kind;
   --  @param Status_Code HTTP-like status code, or zero when unavailable.
   --  @param Retrying True when retry policy is active.
   --  @param TLS_Failed True when failure came from TLS/certificate validation.
   --  @return Best-effort network event category.

   function Network_Diagnostic_Kind_Of
     (Detail : String)
      return Network_Diagnostic_Kind;
   --  @param Detail Raw network error/status detail.
   --  @return Best-effort network diagnostic category.

   function Parse_Network_Diagnostic_Label
     (Text : String)
      return Network_Diagnostic_Parse_Result;
   --  @param Text Label rendered by Network_Diagnostic_Label.
   --  @return Parsed network diagnostic label metadata.

   function Scan_Network_Diagnostic_Label
     (Text : String)
      return Network_Diagnostic_Parse_Result;
   --  @param Text Text beginning with a network diagnostic label.
   --  @return Parsed network diagnostic label prefix.

   function Terminal_Column_Label
     (Name      : String;
      Width     : Positive;
      Alignment : Terminal_Alignment := Align_Left)
      return Humanize.Status.Text_Result;
   --  @param Name Column name.
   --  @param Width Display width.
   --  @param Alignment Text alignment.
   --  @return Human-readable terminal column metadata label.

   function Terminal_Row_Label
     (Cells     : Natural;
      Width     : Natural;
      Truncated : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Cells Number of cells in a rendered row.
   --  @param Width Rendered row width.
   --  @param Truncated True when one or more cells were truncated.
   --  @return Human-readable terminal row metadata label.

   function Terminal_Table_Layout_Label
     (Columns        : Natural;
      Rows           : Natural;
      Width          : Natural;
      Truncated_Cells : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Columns Number of rendered columns.
   --  @param Rows Number of rendered rows.
   --  @param Width Total display width.
   --  @param Truncated_Cells Count of truncated cells.
   --  @return Human-readable terminal table layout summary.

   function Terminal_Table_Render_Label
     (Spec : Terminal_Table_Spec)
      return Humanize.Status.Text_Result;
   --  @param Spec Caller-supplied table rendering metadata.
   --  @return Human-readable terminal table render summary.

   function Metadata_Profile_Label
     (Family  : String;
      Profile : Metadata_Profile)
      return Humanize.Status.Text_Result;
   --  @param Family Label family name.
   --  @param Profile Machine-readable profile values.
   --  @return Human-readable label-family metadata summary.

   function Domain_Metadata_Profile
     (Metadata : Humanize.Domain_Details.Domain_Label_Metadata)
      return Metadata_Profile;
   --  @param Metadata Existing domain label metadata.
   --  @return Cross-domain privacy/stability profile inferred from metadata.

   function Label_Family_Profile
     (Family : String)
      return Metadata_Profile;
   --  @param Family Public label family name.
   --  @return Best-effort metadata profile for a named label family.

   function Metadata_Coverage_Label
     (Summary : Metadata_Coverage_Summary)
      return Humanize.Status.Text_Result;
   --  @param Summary Cross-package metadata coverage counts.
   --  @return Human-readable metadata coverage label.

   function Metadata_Coverage
     (Items : Label_Family_Capability_List)
      return Metadata_Coverage_Summary;
   --  @param Items Label-family capability entries.
   --  @return Aggregated metadata coverage counts.

   function Enum_State_Metadata_Of
     (Value : String)
      return Enum_State_Metadata;
   --  @param Value Enum-like state token.
   --  @return Inferred enum/state metadata.

   function Enum_State_Metadata_Label
     (Value : String)
      return Humanize.Status.Text_Result;
   --  @param Value Enum-like state token.
   --  @return Human-readable enum/state metadata label.

   function Structured_Diff_Tree_Label
     (Root_Path      : String;
      Changed_Fields : Natural;
      Added_Items    : Natural := 0;
      Removed_Items  : Natural := 0;
      Redacted_Items : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Root_Path Root object/list path.
   --  @param Changed_Fields Number of changed fields.
   --  @param Added_Items Number of added fields/list entries.
   --  @param Removed_Items Number of removed fields/list entries.
   --  @param Redacted_Items Number of redacted changes.
   --  @return Human-readable structured diff tree summary.

   function Diff_Node_Label
     (Path : String;
      Kind : Diff_Node_Kind;
      Changes : Natural)
      return Humanize.Status.Text_Result;
   --  @param Path Field, object, or list path.
   --  @param Kind Diff node category.
   --  @param Changes Count of changes below this node.
   --  @return Human-readable diff node summary.

   function Diff_Tree_Metadata_Label
     (Summary : Diff_Tree_Summary)
      return Humanize.Status.Text_Result;
   --  @param Summary Structured diff node counts.
   --  @return Human-readable diff tree metadata label.

   function Parse_Structured_Diff_Tree_Label
     (Text : String)
      return Diff_Tree_Parse_Result;
   --  @param Text Label rendered by Structured_Diff_Tree_Label.
   --  @return Parsed structured diff tree summary.

   function Scan_Structured_Diff_Tree_Label
     (Text : String)
      return Diff_Tree_Parse_Result;
   --  @param Text Text beginning with a structured diff tree label.
   --  @return Parsed structured diff tree label prefix.

   function Contact_Field_Label
     (Fields : Contact_Field_Set;
      Missing_Only : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Fields Structured contact/address field presence.
   --  @param Missing_Only True to summarize missing fields instead of present fields.
   --  @return Human-readable contact field summary.

   function Parse_Feature_Label
     (Text : String)
      return Feature_Label_Parse_Result;
   --  @param Text Cross-domain label containing an optional "kind: body".
   --  @return Parsed kind/body spans and common counts.

   function Scan_Feature_Label
     (Text : String)
      return Feature_Label_Parse_Result;
   --  @param Text Text beginning with a cross-domain label.
   --  @return Parsed first-line label prefix.

   procedure Time_Zone_Label_Into
     (Kind           : Time_Zone_Kind;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Name           : String := "";
      Offset_Minutes : Integer := 0;
      Has_DST        : Boolean := False);
   --  @param Kind Time-zone category.
   --  @param Target Caller-owned output buffer.
   --  @param Written Characters written or required prefix length.
   --  @param Status Bounded render status.
   --  @param Name Optional zone name or abbreviation.
   --  @param Offset_Minutes Offset from UTC in minutes.
   --  @param Has_DST True when the label should note daylight-saving behavior.

   procedure Identifier_Label_Into
     (Kind           : Identifier_Kind;
      Value          : String;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Visible_Prefix : Natural := 6;
      Visible_Suffix : Natural := 4);
   --  @param Kind Identifier category.
   --  @param Value Raw identifier text.
   --  @param Target Caller-owned output buffer.
   --  @param Written Characters written or required prefix length.
   --  @param Status Bounded render status.
   --  @param Visible_Prefix Number of leading characters to expose.
   --  @param Visible_Suffix Number of trailing characters to expose.

   procedure Progress_Label_Into
     (Subject : String;
      Done    : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Progress_State := Progress_Running);
   --  @param Subject Work item being tracked.
   --  @param Done Completed unit count.
   --  @param Total Total unit count, or zero when unknown.
   --  @param Target Caller-owned output buffer.
   --  @param Written Characters written or required prefix length.
   --  @param Status Bounded render status.
   --  @param State Current progress state.

   procedure Metadata_Profile_Label_Into
     (Family  : String;
      Profile : Metadata_Profile;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Family Label family name.
   --  @param Profile Machine-readable profile values.
   --  @param Target Caller-owned output buffer.
   --  @param Written Characters written or required prefix length.
   --  @param Status Bounded render status.

   procedure Product_Code_Label_Into
     (Value    : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Kind     : Product_Code_Kind := Unknown_Product_Code;
      Checksum : Checksum_State := Checksum_Not_Checked);
   --  @param Value Raw product code.
   --  @param Target Caller-owned output buffer.
   --  @param Written Characters written or required prefix length.
   --  @param Status Bounded render status.
   --  @param Kind Product-code category, or Unknown_Product_Code to infer.
   --  @param Checksum Optional checksum verification state.

   procedure Network_Diagnostic_Label_Into
     (Endpoint : String;
      Kind     : Network_Diagnostic_Kind;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Detail   : String := "";
      Retry_After : String := "");
   --  @param Endpoint Host, URL, or service label.
   --  @param Kind Network diagnostic category.
   --  @param Target Caller-owned output buffer.
   --  @param Written Characters written or required prefix length.
   --  @param Status Bounded render status.
   --  @param Detail Optional diagnostic detail.
   --  @param Retry_After Optional retry delay.

   procedure Validation_Constraint_Label_Into
     (Field    : String;
      Relation : Validation_Relation;
      Value    : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Actual   : String := "");
   --  @param Field Field name.
   --  @param Relation Structured validation relation.
   --  @param Value Expected value, bound, or peer field.
   --  @param Target Caller-owned output buffer.
   --  @param Written Characters written or required prefix length.
   --  @param Status Bounded render status.
   --  @param Actual Optional actual value.

   procedure Terminal_Table_Render_Label_Into
     (Spec    : Terminal_Table_Spec;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Spec Caller-supplied table rendering metadata.
   --  @param Target Caller-owned output buffer.
   --  @param Written Characters written or required prefix length.
   --  @param Status Bounded render status.
end Humanize.Cross_Domain;
