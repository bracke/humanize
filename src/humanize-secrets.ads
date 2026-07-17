with Humanize.Domain_Details;
with Humanize.Status;

--  Human-readable labels for secret, token, and credential display.
package Humanize.Secrets is
   type Secret_Output_Mode is
     (Secret_Detailed,
      Secret_Compact,
      Secret_Accessible,
      Secret_Log);

   type Secret_Label_Options is record
      Mode             : Secret_Output_Mode := Secret_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;

   Default_Secret_Label_Options : constant Secret_Label_Options :=
     (Mode             => Secret_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Secret_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;

   type Secret_Kind is
     (Api_Key,
      Live_Api_Key,
      Test_Api_Key,
      GitHub_Token,
      AWS_Access_Key,
      Google_API_Key,
      Slack_Token,
      NPM_Token,
      Bearer_Token,
      JWT_Token,
      Basic_Auth_Credential,
      Password_Secret,
      Private_Key,
      SSH_Private_Key,
      Webhook_Secret,
      OAuth_Token,
      Database_URL_Secret,
      SHA1_Fingerprint,
      SHA256_Fingerprint,
      Unknown_Secret);
   --  Broad display categories for caller-provided secret-like values.

   type Secret_Exposure is
     (Hidden_Value,
      Masked_Value,
      Suffix_Only,
      Fingerprint_Only);
   --  Display policy for secret values.

   type Privacy_Profile is
     (Public_Profile,
      Support_Profile,
      Audit_Profile,
      Debug_Profile);
   --  Cross-domain safe-display profile for sensitive identifiers.

   type Sensitive_Value_Kind is
     (Email_Value,
      Phone_Value,
      URL_Value,
      IP_Address_Value,
      Token_Value,
      File_Path_Value,
      Account_ID_Value,
      Payment_Reference_Value,
      Log_Field_Value,
      Unknown_Sensitive_Value);
   --  Broad sensitive-value categories for privacy-preserving labels.

   function Secret_Kind_For
     (Name  : String;
      Value : String := "")
      return Secret_Kind;
   --  @param Name Caller-provided key, field, environment, or header name.
   --  @param Value Optional caller-provided value used only for pattern hints.
   --  @return Broad secret category.

   function Secret_Kind_Label
     (Kind : Secret_Kind)
      return Humanize.Status.Text_Result;
   --  @param Kind Secret category.
   --  @return Human-readable category label.

   function Exposure_Label
     (Exposure : Secret_Exposure)
      return Humanize.Status.Text_Result;
   --  @param Exposure Secret display policy.
   --  @return Human-readable exposure-policy label.

   function Masked_Secret
     (Value          : String;
      Visible_Prefix : Natural := 4;
      Visible_Suffix : Natural := 4)
      return Humanize.Status.Text_Result;
   --  @param Value Secret value to mask.
   --  @param Visible_Prefix Number of leading characters to retain.
   --  @param Visible_Suffix Number of trailing characters to retain.
   --  @return Masked display value such as "abcd...wxyz".

   function Secret_Label
     (Name     : String;
      Value    : String;
      Kind     : Secret_Kind := Unknown_Secret;
      Exposure : Secret_Exposure := Suffix_Only)
      return Humanize.Status.Text_Result;
   --  @param Name Caller-provided key, field, environment, or header name.
   --  @param Value Secret value. Full values are not included in the result.
   --  @param Kind Explicit kind, or Unknown_Secret to infer a display category.
   --  @param Exposure Display policy for the secret value.
   --  @return Safe human-readable secret label.

   function Secret_Label
     (Name     : String;
      Value    : String;
      Options  : Secret_Label_Options;
      Kind     : Secret_Kind := Unknown_Secret;
      Exposure : Secret_Exposure := Suffix_Only)
      return Humanize.Status.Text_Result;
   --  @param Name Caller-provided key, field, environment, or header name.
   --  @param Value Secret value. Full values are not included in the result.
   --  @param Options Output mode and metadata inclusion policy.
   --  @param Kind Explicit kind, or Unknown_Secret to infer a display category.
   --  @param Exposure Display policy for the secret value.
   --  @return Safe human-readable secret label with optional metadata.

   function Secret_Kind_Metadata
     (Kind : Secret_Kind)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param Kind Secret category.
   --  @return Severity, tone, and final/actionable metadata for Kind.

   function Parse_Secret_Label
     (Text        : String;
      Kind        : Secret_Kind;
      Ending_Text : String)
      return Secret_Label_Parse_Result;
   --  @param Text Label in rendered safe secret-label form.
   --  @param Kind Expected secret category.
   --  @param Ending_Text Safe ending/fingerprint text rendered in the label.
   --  @return Parsed leading span, secret-kind span, metadata, and consumed length.

   function Scan_Secret_Label
     (Text        : String;
      Kind        : Secret_Kind;
      Ending_Text : String)
      return Secret_Label_Parse_Result;
   --  @param Text Text beginning with a safe secret label.
   --  @param Kind Expected secret category.
   --  @param Ending_Text Safe ending/fingerprint text rendered in the label.
   --  @return Parsed secret-label prefix and consumed length.

   function Environment_Secret_Label
     (Name  : String;
      Value : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Environment variable name.
   --  @param Value Optional environment variable value.
   --  @return Safe environment-secret label.

   function Header_Credential_Label
     (Name  : String;
      Value : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Header name.
   --  @param Value Optional header value.
   --  @return Safe credential header label.

   function Fingerprint_Label
     (Algorithm : String;
      Value     : String)
      return Humanize.Status.Text_Result;
   --  @param Algorithm Fingerprint algorithm label, such as "sha256".
   --  @param Value Fingerprint value.
   --  @return Safe fingerprint label with short suffix.

   function Secret_Count_Label
     (Total       : Natural;
      Masked      : Natural := 0;
      Unset       : Natural := 0;
      Fingerprints : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Total Total secret count.
   --  @param Masked Count of masked values.
   --  @param Unset Count of missing or unset values.
   --  @param Fingerprints Count of fingerprint-only values.
   --  @return Compact secret inventory summary.

   function Rotation_Status_Label
     (Needs_Rotation : Boolean;
      Days_Old       : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Needs_Rotation Whether caller policy says the secret should rotate.
   --  @param Days_Old Optional age supplied by caller.
   --  @return Human-readable rotation status.

   function Credential_Source_Label
     (Source : String;
      Count  : Natural := 1)
      return Humanize.Status.Text_Result;
   --  @param Source Caller-provided source label, such as "environment" or "vault".
   --  @param Count Number of credentials from the source.
   --  @return Human-readable credential-source label.

   function Privacy_Profile_Label
     (Profile : Privacy_Profile)
      return Humanize.Status.Text_Result;
   --  @param Profile Safe-display policy.
   --  @return Human-readable privacy profile label.

   function Sensitive_Value_Kind_Label
     (Kind : Sensitive_Value_Kind)
      return Humanize.Status.Text_Result;
   --  @param Kind Sensitive value category.
   --  @return Human-readable sensitive-value kind label.

   function Privacy_Profile_Exposure
     (Profile : Privacy_Profile)
      return Secret_Exposure;
   --  @param Profile Safe-display policy.
   --  @return Default secret exposure mode for the profile.

   function Safe_Display_Label
     (Kind    : Sensitive_Value_Kind;
      Value   : String;
      Profile : Privacy_Profile := Support_Profile)
      return Humanize.Status.Text_Result;
   --  @param Kind Sensitive value category.
   --  @param Value Caller-provided value.
   --  @param Profile Safe-display policy.
   --  @return Privacy-preserving display label for the value.

   procedure Safe_Display_Label_Into
     (Kind    : Sensitive_Value_Kind;
      Value   : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Profile : Privacy_Profile := Support_Profile);
   --  @param Kind Sensitive value category.
   --  @param Value Caller-provided value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Profile Safe-display policy.

   procedure Masked_Secret_Into
     (Value          : String;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Visible_Prefix : Natural := 4;
      Visible_Suffix : Natural := 4);
   --  @param Value Secret value to mask.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Visible_Prefix Number of leading characters to retain.
   --  @param Visible_Suffix Number of trailing characters to retain.

   procedure Secret_Label_Into
     (Name     : String;
      Value    : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Kind     : Secret_Kind := Unknown_Secret;
      Exposure : Secret_Exposure := Suffix_Only);
   --  @param Name Caller-provided key, field, environment, or header name.
   --  @param Value Secret value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Kind Explicit kind, or Unknown_Secret to infer a display category.
   --  @param Exposure Display policy for the secret value.

   procedure Secret_Label_Into
     (Name     : String;
      Value    : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Secret_Label_Options;
      Kind     : Secret_Kind := Unknown_Secret;
      Exposure : Secret_Exposure := Suffix_Only);
   --  @param Name Caller-provided key, field, environment, or header name.
   --  @param Value Secret value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.
   --  @param Kind Explicit kind, or Unknown_Secret to infer a display category.
   --  @param Exposure Display policy for the secret value.

   procedure Secret_Count_Label_Into
     (Total        : Natural;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Masked       : Natural := 0;
      Unset        : Natural := 0;
      Fingerprints : Natural := 0);
   --  @param Total Total secret count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Masked Count of masked values.
   --  @param Unset Count of missing or unset values.
   --  @param Fingerprints Count of fingerprint-only values.

end Humanize.Secrets;
