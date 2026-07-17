with Ada.Strings.Fixed;

with AUnit.Assertions;

with Humanize.Domain_Details;
with Humanize.Secrets;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Secrets is
   use Humanize.Secrets;
   use Humanize.Status;

   procedure Check
     (Result   : Text_Result;
      Expected : String;
      Message  : String)
   is
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Assert_Does_Not_Contain
     (Text     : String;
      Fragment : String;
      Message  : String)
   is
   begin
      AUnit.Assertions.Assert
        (Ada.Strings.Fixed.Index (Text, Fragment) = 0,
         Message & " leaked [" & Fragment & "] in [" & Text & "]");
   end Assert_Does_Not_Contain;

   procedure Test_Secret_Kind_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      SHA256 : constant String :=
        "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef";
   begin
      Check (Secret_Kind_Label (Secret_Kind_For ("STRIPE_KEY", "sk_live_abcdef123456")),
             "live API key", "live API key kind");
      Check (Secret_Kind_Label (Secret_Kind_For ("token", "ghp_abcdefghijklmnopqrstuvwxyz")),
             "GitHub token", "github token kind");
      Check (Secret_Kind_Label (Secret_Kind_For ("aws_access_key_id", "AKIAIOSFODNN7EXAMPLE")),
             "AWS access key", "aws key kind");
      Check (Secret_Kind_Label (Secret_Kind_For ("GOOGLE_API_KEY", "AIzaSyExampleValue")),
             "Google API key", "google api key kind");
      Check (Secret_Kind_Label (Secret_Kind_For ("SLACK_BOT_TOKEN", "xoxb-123-456-secret")),
             "Slack token", "slack token kind");
      Check (Secret_Kind_Label (Secret_Kind_For ("NPM_TOKEN", "npm_abcd1234")),
             "npm token", "npm token kind");
      Check (Secret_Kind_Label (Secret_Kind_For ("Authorization", "Bearer abc.def")),
             "bearer token", "bearer token kind");
      Check (Secret_Kind_Label (Secret_Kind_For ("SSH_PRIVATE_KEY", "-----BEGIN OPENSSH PRIVATE KEY-----")),
             "SSH private key", "ssh private key kind");
      Check (Secret_Kind_Label (Secret_Kind_For ("DATABASE_URL", "postgres://user:pass@example/db")),
             "database URL secret", "database url kind");
      Check (Secret_Kind_Label (Secret_Kind_For ("sha256", SHA256)),
             "SHA-256 fingerprint", "sha256 kind");
   end Test_Secret_Kind_Labels;

   procedure Test_Masking_And_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use type Humanize.Domain_Details.Domain_Severity;
      Full : constant String := "sk_live_abcdef1234567890";
      Label : Text_Result;
      Secret_Detailed_Label : constant Text_Result :=
        Secret_Label
          ("STRIPE_KEY", Full,
           Secret_Label_Options'
             (Mode             => Secret_Detailed,
              Include_Surface  => True,
              Include_Severity => True,
              Include_Tone     => False));
      Parsed_Secret : constant Secret_Label_Parse_Result :=
        Parse_Secret_Label
          ("STRIPE_KEY live API key ending in 7890", Live_Api_Key, "7890");
      Scanned_Secret : constant Secret_Label_Parse_Result :=
        Scan_Secret_Label
          ("STRIPE_KEY live API key ending in 7890 trailing", Live_Api_Key,
           "7890");
   begin
      Check (Masked_Secret (Full), "sk_l...7890", "default mask");
      Check (Masked_Secret (Full, 0, 6), "***567890", "suffix-only mask");
      Check (Masked_Secret ("short"), "***", "short value fully masked");

      Check
        (Secret_Label ("STRIPE_KEY", Full),
         "live API key ending in 7890",
         "safe live key label");
      Check
        (Secret_Detailed_Label,
         "[secrets danger] live API key ending in 7890",
         "secret option metadata");
      AUnit.Assertions.Assert
        (Parsed_Secret.Status = Ok
         and then Parsed_Secret.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Secret.Name_Length = 10,
         "parse secret metadata");
      AUnit.Assertions.Assert
        (Scanned_Secret.Status = Ok
         and then Scanned_Secret.Consumed = 38,
         "scan secret prefix");
      Check
        (Secret_Label ("GITHUB_TOKEN", "ghp_abcdefghijklmnopqrstuvwxyz", Exposure => Masked_Value),
         "GitHub token ghp_...wxyz",
         "masked github token label");
      Check
        (Secret_Label ("PASSWORD", ""),
         "password unset",
         "unset password label");
      Check
        (Secret_Label ("fingerprint", "0123456789abcdef0123456789abcdef01234567", SHA1_Fingerprint),
         "SHA-1 fingerprint fingerprint ending in 01234567",
         "fingerprint-only label");

      Label := Secret_Label ("STRIPE_KEY", Full);
      Assert_Does_Not_Contain (Support.Text (Label), Full, "secret label must not include full value");
   end Test_Masking_And_Labels;

   procedure Test_Context_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check
        (Environment_Secret_Label ("AWS_ACCESS_KEY_ID", "AKIAIOSFODNN7EXAMPLE"),
         "AWS_ACCESS_KEY_ID AWS access key ending in MPLE",
         "environment secret label");
      Check
        (Environment_Secret_Label ("API_TOKEN"),
         "API_TOKEN API key unset",
         "unset environment secret label");
      Check
        (Header_Credential_Label ("Authorization", "Bearer abcdefghijklmnop"),
         "Authorization bearer token ending in mnop",
         "authorization header label");
      Check
        (Fingerprint_Label ("sha256", "aa:bb:cc:dd:ee:ff"),
         "sha256 fingerprint ending in ccddeeff",
         "explicit fingerprint label");
      Check
        (Secret_Count_Label (5, Masked => 3, Unset => 1, Fingerprints => 1),
         "5 secrets, 3 masked, 1 unset, 1 fingerprint",
         "secret count label");
      Check
        (Rotation_Status_Label (True, 91),
         "rotation needed, 91 days old",
         "rotation needed label");
      Check
        (Rotation_Status_Label (False),
         "rotation not required",
         "rotation ok label");
      Check (Exposure_Label (Suffix_Only), "suffix only", "suffix exposure label");
      Check (Exposure_Label (Hidden_Value), "value hidden", "hidden exposure label");
      Check
        (Credential_Source_Label ("vault", 3),
         "3 credentials from vault",
         "credential source label");
      Check
        (Privacy_Profile_Label (Support_Profile),
         "support",
         "privacy profile label");
      Check
        (Sensitive_Value_Kind_Label (Payment_Reference_Value),
         "payment reference",
         "sensitive kind label");
      AUnit.Assertions.Assert
        (Privacy_Profile_Exposure (Public_Profile) = Hidden_Value,
         "privacy profile exposure metadata");
      Check
        (Safe_Display_Label
           (Email_Value, "ada@example.com", Support_Profile),
         "email at example.com",
         "safe display email label");
      Check
        (Safe_Display_Label
           (Token_Value, "sk_live_abcdef1234567890", Audit_Profile),
         "token length 24, ending in 7890",
         "safe display audit label");
      Assert_Does_Not_Contain
        (Support.Text
           (Safe_Display_Label
              (Token_Value, "sk_live_abcdef1234567890", Public_Profile)),
         "sk_live_abcdef1234567890",
         "safe display public label must not leak full value");

      Invalid := Environment_Secret_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid environment variable",
         "invalid environment variable rejected");

      Invalid := Credential_Source_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid credential source",
         "invalid credential source rejected");
   end Test_Context_Labels;

   procedure Test_Bounded_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Masked : String (1 .. 11);
      Tiny   : String (1 .. 8);
      Offset : String (2 .. 12);
      Written : Natural;
      Code : Status_Code;
   begin
      Masked_Secret_Into ("sk_live_abcdef1234567890", Masked, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 11 and then Masked = "sk_l...7890",
         "masked bounded exact text");

      Secret_Label_Into ("STRIPE_KEY", "sk_live_abcdef1234567890", Tiny, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 8 and then Tiny = "live API",
         "secret label overflow prefix");

      Secret_Count_Label_Into (5, Offset, Written, Code, Masked => 3);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "secret count bounded rejects non-1-based buffers");

      Masked_Secret_Into ("", Masked, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "masked secret rejects empty value");

      Secret_Label_Into
        ("STRIPE_KEY", "sk_live_abcdef1234567890", Masked, Written, Code,
         Secret_Label_Options'
           (Mode             => Secret_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 11
         and then Masked = "[secrets da",
         "secret option bounded overflow");

      Safe_Display_Label_Into
        (Token_Value, "sk_live_abcdef1234567890", Tiny, Written, Code,
         Public_Profile);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 8 and then Tiny = "token re",
         "safe display bounded overflow");
   end Test_Bounded_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize secret tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Secret_Kind_Labels'Access, "secret kind labels");
      Register_Routine (T, Test_Masking_And_Labels'Access, "masking and labels");
      Register_Routine (T, Test_Context_Labels'Access, "context labels");
      Register_Routine (T, Test_Bounded_Labels'Access, "bounded labels");
   end Register_Tests;

end Humanize.Tests.Secrets;
