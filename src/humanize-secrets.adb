with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.Secrets is
   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text
     (Result : Humanize.Status.Text_Result)
      return String
      renames Humanize.Bounded_Text.Result_Text;

   function Invalid_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Invalid_Text;

   function Clean (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Starts_With (Text : String; Prefix : String) return Boolean
      renames Humanize.Bounded_Text.Starts_With;

   function Digits_Image (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Count_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
      renames Humanize.Bounded_Text.Count_Text;

   function Domain_Options
     (Options : Secret_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Secret_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Secret_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Secret_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Secret_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Trimmed_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;

   function Contains (Text : String; Fragment : String) return Boolean
      renames Humanize.Bounded_Text.Contains_Text;

   function Is_Hex_Digit (Char : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Hex_Digit;

   function Lower_Char (Char : Character) return Character
      renames Humanize.Bounded_Text.Lower_Char;

   function Suffix (Value : String; Length : Natural := 4) return String is
      Count : constant Natural := Natural'Min (Length, Value'Length);
   begin
      if Count = 0 then
         return "";
      end if;
      return Value (Value'Last - Count + 1 .. Value'Last);
   end Suffix;

   function Normalized_Fingerprint (Value : String) return String is
      Result : Unbounded_String;
   begin
      for C of Value loop
         if C /= ':' and then C /= '-' and then C /= ' ' then
            Append (Result, Lower_Char (C));
         end if;
      end loop;
      return To_String (Result);
   end Normalized_Fingerprint;

   function Looks_Like_Hex (Value : String; Expected_Length : Natural) return Boolean is
      Normalized : constant String := Normalized_Fingerprint (Value);
   begin
      if Normalized'Length /= Expected_Length then
         return False;
      end if;

      for C of Normalized loop
         if not Is_Hex_Digit (C) then
            return False;
         end if;
      end loop;
      return True;
   end Looks_Like_Hex;

   function Secret_Kind_For
     (Name  : String;
      Value : String := "")
      return Secret_Kind
   is
      Key : constant String := Trimmed_Lower (Name);
      Val : constant String := Trimmed_Lower (Value);
   begin
      if Starts_With (Val, "sk_live_") then
         return Live_Api_Key;
      elsif Starts_With (Val, "sk_test_") then
         return Test_Api_Key;
      elsif Starts_With (Val, "ghp_")
        or else Starts_With (Val, "github_pat_")
        or else Contains (Key, "github")
      then
         return GitHub_Token;
      elsif Starts_With (Value, "AKIA")
        or else Starts_With (Value, "ASIA")
        or else Contains (Key, "aws_access_key")
      then
         return AWS_Access_Key;
      elsif Starts_With (Value, "AIza") or else Contains (Key, "google_api") then
         return Google_API_Key;
      elsif Starts_With (Val, "xoxb-") or else Starts_With (Val, "xoxp-")
        or else Starts_With (Val, "xoxa-") or else Contains (Key, "slack")
      then
         return Slack_Token;
      elsif Starts_With (Val, "npm_") or else Contains (Key, "npm_token") then
         return NPM_Token;
      elsif Starts_With (Val, "bearer ") then
         return Bearer_Token;
      elsif Starts_With (Val, "basic ") then
         return Basic_Auth_Credential;
      elsif Starts_With (Val, "eyj") or else Contains (Key, "jwt") then
         return JWT_Token;
      elsif Contains (Key, "ssh_private_key")
        or else Contains (Val, "begin openssh private key")
        or else Contains (Val, "begin rsa private key")
        or else Contains (Val, "begin ec private key")
      then
         return SSH_Private_Key;
      elsif Contains (Key, "private_key") or else Contains (Val, "begin private key") then
         return Private_Key;
      elsif Contains (Key, "password") or else Contains (Key, "passwd") then
         return Password_Secret;
      elsif Contains (Key, "webhook") then
         return Webhook_Secret;
      elsif Contains (Key, "oauth") or else Contains (Key, "refresh_token") then
         return OAuth_Token;
      elsif Contains (Key, "database_url") or else Contains (Key, "db_url") then
         return Database_URL_Secret;
      elsif Looks_Like_Hex (Value, 64) or else Contains (Key, "sha256") then
         return SHA256_Fingerprint;
      elsif Looks_Like_Hex (Value, 40) or else Contains (Key, "sha1") then
         return SHA1_Fingerprint;
      elsif Contains (Key, "api_key") or else Contains (Key, "apikey")
        or else Contains (Key, "secret") or else Contains (Key, "token")
      then
         return Api_Key;
      else
         return Unknown_Secret;
      end if;
   end Secret_Kind_For;

   function Kind_Text (Kind : Secret_Kind) return String is
   begin
      case Kind is
         when Api_Key => return "API key";
         when Live_Api_Key => return "live API key";
         when Test_Api_Key => return "test API key";
         when GitHub_Token => return "GitHub token";
         when AWS_Access_Key => return "AWS access key";
         when Google_API_Key => return "Google API key";
         when Slack_Token => return "Slack token";
         when NPM_Token => return "npm token";
         when Bearer_Token => return "bearer token";
         when JWT_Token => return "JWT token";
         when Basic_Auth_Credential => return "basic auth credential";
         when Password_Secret => return "password";
         when Private_Key => return "private key";
         when SSH_Private_Key => return "SSH private key";
         when Webhook_Secret => return "webhook secret";
         when OAuth_Token => return "OAuth token";
         when Database_URL_Secret => return "database URL secret";
         when SHA1_Fingerprint => return "SHA-1 fingerprint";
         when SHA256_Fingerprint => return "SHA-256 fingerprint";
         when Unknown_Secret => return "secret";
      end case;
   end Kind_Text;

   function Secret_Kind_Suffix (Kind : Secret_Kind) return String is
   begin
      return Kind_Text (Kind);
   end Secret_Kind_Suffix;

   function Secret_Kind_Label
     (Kind : Secret_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Secret_Kind_Suffix (Kind));
   end Secret_Kind_Label;

   function Secret_Kind_Metadata
     (Kind : Secret_Kind)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Secrets_Surface, Secret_Kind_Suffix (Kind));
   end Secret_Kind_Metadata;

   function Exposure_Label
     (Exposure : Secret_Exposure)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Exposure is
            when Hidden_Value      => "value hidden",
            when Masked_Value      => "value masked",
            when Suffix_Only       => "suffix only",
            when Fingerprint_Only  => "fingerprint only");
   end Exposure_Label;

   function Masked_Text
     (Value          : String;
      Visible_Prefix : Natural;
      Visible_Suffix : Natural)
      return String
   is
      Prefix_Count : constant Natural := Natural'Min (Visible_Prefix, Value'Length);
      Remaining : constant Natural := Value'Length - Prefix_Count;
      Suffix_Count : constant Natural := Natural'Min (Visible_Suffix, Remaining);
   begin
      if Value'Length = 0 then
         return "";
      elsif Value'Length <= Visible_Prefix + Visible_Suffix then
         return "***";
      elsif Prefix_Count = 0 then
         return "***" & Value (Value'Last - Suffix_Count + 1 .. Value'Last);
      elsif Suffix_Count = 0 then
         return Value (Value'First .. Value'First + Prefix_Count - 1) & "***";
      else
         return Value (Value'First .. Value'First + Prefix_Count - 1)
           & "..."
           & Value (Value'Last - Suffix_Count + 1 .. Value'Last);
      end if;
   end Masked_Text;

   function Masked_Secret
     (Value          : String;
      Visible_Prefix : Natural := 4;
      Visible_Suffix : Natural := 4)
      return Humanize.Status.Text_Result
   is
   begin
      if Value'Length = 0 then
         return Invalid_Text ("invalid secret");
      end if;

      return Ok_Text (Masked_Text (Value, Visible_Prefix, Visible_Suffix));
   end Masked_Secret;

   function Exposure_Text
     (Kind     : Secret_Kind;
      Value    : String;
      Exposure : Secret_Exposure)
      return String
   is
   begin
      case Exposure is
         when Hidden_Value =>
            return Secret_Kind_Suffix (Kind) & " hidden";
         when Masked_Value =>
            return Secret_Kind_Suffix (Kind) & " " & Masked_Text (Value, 4, 4);
         when Suffix_Only =>
            return Secret_Kind_Suffix (Kind) & " ending in " & Suffix (Value, 4);
         when Fingerprint_Only =>
            return Secret_Kind_Suffix (Kind) & " fingerprint ending in "
              & Suffix (Normalized_Fingerprint (Value), 8);
      end case;
   end Exposure_Text;

   function Secret_Label
     (Name     : String;
      Value    : String;
      Kind     : Secret_Kind := Unknown_Secret;
      Exposure : Secret_Exposure := Suffix_Only)
      return Humanize.Status.Text_Result
   is
      Actual : constant Secret_Kind :=
        (if Kind = Unknown_Secret then Secret_Kind_For (Name, Value) else Kind);
   begin
      if Value'Length = 0 then
         return Ok_Text (Secret_Kind_Suffix (Actual) & " unset");
      end if;

      if Actual in SHA1_Fingerprint | SHA256_Fingerprint then
         return Ok_Text (Exposure_Text (Actual, Value, Fingerprint_Only));
      end if;

      return Ok_Text (Exposure_Text (Actual, Value, Exposure));
   end Secret_Label;

   function Secret_Label
     (Name     : String;
      Value    : String;
      Options  : Secret_Label_Options;
      Kind     : Secret_Kind := Unknown_Secret;
      Exposure : Secret_Exposure := Suffix_Only)
      return Humanize.Status.Text_Result
   is
      Actual : constant Secret_Kind :=
        (if Kind = Unknown_Secret then Secret_Kind_For (Name, Value) else Kind);
      Base : constant Humanize.Status.Text_Result :=
        Secret_Label (Name, Value, Kind, Exposure);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Secret_Kind_Metadata (Actual), Domain_Options (Options));
   end Secret_Label;

   function Secret_Suffix
     (Kind        : Secret_Kind;
      Ending_Text : String)
      return String
   is
   begin
      return Secret_Kind_Suffix (Kind) & " ending in " & Ending_Text;
   end Secret_Suffix;

   function Parse_Secret_Label
     (Text        : String;
      Kind        : Secret_Kind;
      Ending_Text : String)
      return Secret_Label_Parse_Result
   is
      Result : Secret_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Secrets_Surface,
         Secret_Suffix (Kind, Ending_Text));
      Result.Metadata := Secret_Kind_Metadata (Kind);
      return Result;
   end Parse_Secret_Label;

   function Scan_Secret_Label
     (Text        : String;
      Kind        : Secret_Kind;
      Ending_Text : String)
      return Secret_Label_Parse_Result
   is
      Result : Secret_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Secrets_Surface,
         Secret_Suffix (Kind, Ending_Text));
      Result.Metadata := Secret_Kind_Metadata (Kind);
      return Result;
   end Scan_Secret_Label;

   function Environment_Secret_Label
     (Name  : String;
      Value : String := "")
      return Humanize.Status.Text_Result
   is
      Env_Name : constant String := Clean (Name);
      Kind : constant Secret_Kind := Secret_Kind_For (Name, Value);
   begin
      if Env_Name'Length = 0 then
         return Invalid_Text ("invalid environment variable");
      elsif Value'Length = 0 then
         return Ok_Text (Env_Name & " " & Secret_Kind_Suffix (Kind) & " unset");
      else
         return Ok_Text (Env_Name & " " & Exposure_Text (Kind, Value, Suffix_Only));
      end if;
   end Environment_Secret_Label;

   function Header_Credential_Label
     (Name  : String;
      Value : String := "")
      return Humanize.Status.Text_Result
   is
      Header : constant String := Clean (Name);
      Kind : constant Secret_Kind := Secret_Kind_For (Name, Value);
   begin
      if Header'Length = 0 then
         return Invalid_Text ("invalid header");
      elsif Value'Length = 0 then
         return Ok_Text (Header & " credential header unset");
      else
         return Ok_Text (Header & " " & Exposure_Text (Kind, Value, Suffix_Only));
      end if;
   end Header_Credential_Label;

   function Fingerprint_Label
     (Algorithm : String;
      Value     : String)
      return Humanize.Status.Text_Result
   is
      Alg : constant String := Trimmed_Lower (Algorithm);
      Normalized : constant String := Normalized_Fingerprint (Value);
   begin
      if Alg'Length = 0 or else Normalized'Length = 0 then
         return Invalid_Text ("invalid fingerprint");
      end if;

      return Ok_Text (Alg & " fingerprint ending in " & Suffix (Normalized, 8));
   end Fingerprint_Label;

   function Secret_Count_Label
     (Total        : Natural;
      Masked       : Natural := 0;
      Unset        : Natural := 0;
      Fingerprints : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Text : Unbounded_String :=
        To_Unbounded_String (Count_Text (Total, "secret", "secrets"));
   begin
      if Masked > 0 then
         Append (Text, ", " & Count_Text (Masked, "masked", "masked"));
      end if;
      if Unset > 0 then
         Append (Text, ", " & Count_Text (Unset, "unset", "unset"));
      end if;
      if Fingerprints > 0 then
         Append (Text, ", " & Count_Text (Fingerprints, "fingerprint", "fingerprints"));
      end if;
      return Ok_Text (To_String (Text));
   end Secret_Count_Label;

   function Rotation_Status_Label
     (Needs_Rotation : Boolean;
      Days_Old       : Natural := 0)
      return Humanize.Status.Text_Result
   is
   begin
      if Needs_Rotation and then Days_Old > 0 then
         return Ok_Text ("rotation needed, " & Digits_Image (Days_Old) & " days old");
      elsif Needs_Rotation then
         return Ok_Text ("rotation needed");
      elsif Days_Old > 0 then
         return Ok_Text ("rotation not required, " & Digits_Image (Days_Old) & " days old");
      else
         return Ok_Text ("rotation not required");
      end if;
   end Rotation_Status_Label;

   function Credential_Source_Label
     (Source : String;
      Count  : Natural := 1)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Source);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid credential source");
      end if;

      return Ok_Text
        (Count_Text (Count, "credential", "credentials") & " from " & Label);
   end Credential_Source_Label;

   function Privacy_Profile_Label
     (Profile : Privacy_Profile)
      return Humanize.Status.Text_Result
   is
   begin
      case Profile is
         when Public_Profile => return Ok_Text ("public");
         when Support_Profile => return Ok_Text ("support");
         when Audit_Profile => return Ok_Text ("audit");
         when Debug_Profile => return Ok_Text ("debug");
      end case;
   end Privacy_Profile_Label;

   function Sensitive_Kind_Text
     (Kind : Sensitive_Value_Kind)
      return String
   is
   begin
      case Kind is
         when Email_Value => return "email";
         when Phone_Value => return "phone";
         when URL_Value => return "URL";
         when IP_Address_Value => return "IP address";
         when Token_Value => return "token";
         when File_Path_Value => return "file path";
         when Account_ID_Value => return "account ID";
         when Payment_Reference_Value => return "payment reference";
         when Log_Field_Value => return "log field";
         when Unknown_Sensitive_Value => return "sensitive value";
      end case;
   end Sensitive_Kind_Text;

   function Sensitive_Value_Kind_Label
     (Kind : Sensitive_Value_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Sensitive_Kind_Text (Kind));
   end Sensitive_Value_Kind_Label;

   function Privacy_Profile_Exposure
     (Profile : Privacy_Profile)
      return Secret_Exposure
   is
   begin
      case Profile is
         when Public_Profile => return Hidden_Value;
         when Support_Profile => return Suffix_Only;
         when Audit_Profile => return Fingerprint_Only;
         when Debug_Profile => return Masked_Value;
      end case;
   end Privacy_Profile_Exposure;

   function Safe_Suffix
     (Value : String;
      Count : Natural)
      return String
   is
      Keep : constant Natural := Natural'Min (Count, Value'Length);
   begin
      if Keep = 0 then
         return "";
      else
         return Value (Value'Last - Keep + 1 .. Value'Last);
      end if;
   end Safe_Suffix;

   function Safe_Display_Label
     (Kind    : Sensitive_Value_Kind;
      Value   : String;
      Profile : Privacy_Profile := Support_Profile)
      return Humanize.Status.Text_Result
   is
      Clean_Value : constant String := Clean (Value);
      Label : constant String := Sensitive_Kind_Text (Kind);
   begin
      if Clean_Value'Length = 0 then
         return Ok_Text (Label & " not set");
      end if;

      case Profile is
         when Public_Profile =>
            return Ok_Text (Label & " redacted");
         when Support_Profile =>
            case Kind is
               when Email_Value =>
                  declare
                     At_Pos : Natural := 0;
                  begin
                     for Index in Clean_Value'Range loop
                        if Clean_Value (Index) = '@' then
                           At_Pos := Index;
                           exit;
                        end if;
                     end loop;
                     if At_Pos > 0 and then At_Pos < Clean_Value'Last then
                        return Ok_Text
                          (Label & " at " & Clean_Value (At_Pos + 1 .. Clean_Value'Last));
                     end if;
                  end;
               when Phone_Value | Token_Value | Account_ID_Value
                  | Payment_Reference_Value =>
                  return Ok_Text (Label & " ending in " & Safe_Suffix (Clean_Value, 4));
               when URL_Value =>
                  return Ok_Text ("URL redacted");
               when IP_Address_Value =>
                  return Ok_Text ("IP address redacted");
               when File_Path_Value =>
                  return Ok_Text ("file path ending in " & Safe_Suffix (Clean_Value, 24));
               when Log_Field_Value | Unknown_Sensitive_Value =>
                  return Ok_Text (Label & " redacted");
            end case;
            return Ok_Text (Label & " redacted");
         when Audit_Profile =>
            return Ok_Text
              (Label & " length " & Digits_Image (Clean_Value'Length)
               & ", ending in " & Safe_Suffix (Clean_Value, 4));
         when Debug_Profile =>
            return Ok_Text
              (Label & " "
               & Result_Text
                   (Masked_Secret (Clean_Value, 6, 6)));
      end case;
   end Safe_Display_Label;

   procedure Safe_Display_Label_Into
     (Kind    : Sensitive_Value_Kind;
      Value   : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Profile : Privacy_Profile := Support_Profile)
   is
      Result : constant Humanize.Status.Text_Result :=
        Safe_Display_Label (Kind, Value, Profile);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Safe_Display_Label_Into;

   procedure Masked_Secret_Into
     (Value          : String;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Visible_Prefix : Natural := 4;
      Visible_Suffix : Natural := 4)
   is
      Result : constant Humanize.Status.Text_Result :=
        Masked_Secret (Value, Visible_Prefix, Visible_Suffix);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Masked_Secret_Into;

   procedure Secret_Label_Into
     (Name     : String;
      Value    : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Kind     : Secret_Kind := Unknown_Secret;
      Exposure : Secret_Exposure := Suffix_Only)
   is
      Result : constant Humanize.Status.Text_Result :=
        Secret_Label (Name, Value, Kind, Exposure);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Secret_Label_Into;

   procedure Secret_Label_Into
     (Name     : String;
      Value    : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Secret_Label_Options;
      Kind     : Secret_Kind := Unknown_Secret;
      Exposure : Secret_Exposure := Suffix_Only)
   is
   begin
      Copy_Result
        (Secret_Label (Name, Value, Options, Kind, Exposure), Target, Written,
         Status);
   end Secret_Label_Into;

   procedure Secret_Count_Label_Into
     (Total        : Natural;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Masked       : Natural := 0;
      Unset        : Natural := 0;
      Fingerprints : Natural := 0)
   is
      Result : constant Humanize.Status.Text_Result :=
        Secret_Count_Label (Total, Masked, Unset, Fingerprints);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Secret_Count_Label_Into;

end Humanize.Secrets;
