with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
with Humanize.Selections;

package body Humanize.Secrets.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Credential_Source_Label
      (Context : Humanize.Contexts.Context;
       Source  : String;
       Count   : Natural := 1)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Secrets.Credential_Source_Label (Source => Source, Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.secrets.credential_source_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      Selection := Sel.With_Arg (Selection, "source", Humanize.Bounded_Text.Clean (Source));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Credential_Source_Label;

   function Environment_Secret_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Value   : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Secrets.Environment_Secret_Label (Name => Name, Value => Value);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.secrets.environment_secret_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_State : constant String := (if Value'Length = 0 then "unset" else "set");
         D_Name : constant String := Humanize.Bounded_Text.Clean (Name);
         D_Kind : constant String := Humanize.Label_Values.Text_Of (Secret_Kind_Label (Context, Secret_Kind_For (Name,
           Value)));
         D_Shown : constant String := Humanize.Label_Values.Value_After (E, "ending in ");
      begin
         Selection := Sel.With_Arg (Selection, "state", D_State);
         Selection := Sel.With_Arg (Selection, "name", D_Name);
         Selection := Sel.With_Arg (Selection, "kind", D_Kind);
         Selection := Sel.With_Arg (Selection, "shown", D_Shown);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end Environment_Secret_Label;

   function Exposure_Label
      (Context  : Humanize.Contexts.Context;
       Exposure : Secret_Exposure)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Secrets.Exposure_Label (Exposure => Exposure);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.secrets.exposure_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "exposure", Lower (Secret_Exposure'Image (Exposure)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Exposure_Label;

   function Fingerprint_Label
      (Context   : Humanize.Contexts.Context;
       Algorithm : String;
       Value     : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Secrets.Fingerprint_Label (Algorithm => Algorithm, Value => Value);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.secrets.fingerprint_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_Algorithm : constant String := Humanize.Bounded_Text.Clean_Lower_Text (Algorithm);
         D_Shown : constant String := Humanize.Label_Values.Value_After (E, " fingerprint ending in ");
      begin
         Selection := Sel.With_Arg (Selection, "algorithm", D_Algorithm);
         Selection := Sel.With_Arg (Selection, "shown", D_Shown);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end Fingerprint_Label;

   function Header_Credential_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Value   : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Secrets.Header_Credential_Label (Name => Name, Value => Value);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.secrets.header_credential_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_State : constant String := (if Value'Length = 0 then "unset" else "set");
         D_Name : constant String := Humanize.Bounded_Text.Clean (Name);
         D_Kind : constant String := Humanize.Label_Values.Text_Of (Secret_Kind_Label (Context, Secret_Kind_For (Name,
           Value)));
         D_Shown : constant String := Humanize.Label_Values.Value_After (E, "ending in ");
      begin
         Selection := Sel.With_Arg (Selection, "state", D_State);
         Selection := Sel.With_Arg (Selection, "name", D_Name);
         Selection := Sel.With_Arg (Selection, "kind", D_Kind);
         Selection := Sel.With_Arg (Selection, "shown", D_Shown);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end Header_Credential_Label;

   function Privacy_Profile_Label
      (Context : Humanize.Contexts.Context;
       Profile : Privacy_Profile)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Secrets.Privacy_Profile_Label (Profile => Profile);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.secrets.privacy_profile_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "profile", Lower (Privacy_Profile'Image (Profile)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Privacy_Profile_Label;

   function Rotation_Status_Label
      (Context        : Humanize.Contexts.Context;
       Needs_Rotation : Boolean;
       Days_Old       : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Secrets.Rotation_Status_Label (Needs_Rotation => Needs_Rotation, Days_Old => Days_Old);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.secrets.rotation_status_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "needs_rotation", Lower (Boolean'Image (Needs_Rotation)));
      Selection := Sel.With_Arg (Selection, "days_old", Long_Long_Integer (Days_Old));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Rotation_Status_Label;

   function Safe_Display_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Sensitive_Value_Kind;
       Value   : String;
       Profile : Privacy_Profile := Support_Profile)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Secrets.Safe_Display_Label (Kind => Kind, Value => Value, Profile => Profile);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.secrets.safe_display_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_State : constant String := (if Humanize.Bounded_Text.Clean (Value) = "" then "not_set" elsif Profile =
           Public_Profile then "redacted" elsif Profile = Audit_Profile then "audit" elsif Profile = Debug_Profile
           then "debug" elsif Kind = URL_Value then "url_redacted" elsif Kind = IP_Address_Value then "ip_redacted"
           elsif Kind = File_Path_Value then "path_ending" elsif Kind in Log_Field_Value | Unknown_Sensitive_Value
           then "redacted" elsif Kind = Email_Value then (if Humanize.Label_Values.Ends (E, " redacted") then
           "redacted" else "at") else "ending");
         D_Label : constant String := Humanize.Label_Values.Text_Of (Sensitive_Value_Kind_Label (Context, Kind));
         D_Length : constant Long_Long_Integer := Long_Long_Integer ((if D_State = "audit" then
           Humanize.Label_Values.Leading_Count (Humanize.Label_Values.Value_After (E, " length ")) else 0));
         D_Shown : constant String := (if D_State = "at" then Humanize.Label_Values.Value_After (E, " at ") elsif
           D_State = "debug" then Humanize.Label_Values.Value_After (E, Humanize.Label_Values.Text_Of
           (Sensitive_Value_Kind_Label (Kind)) & " ") else Humanize.Label_Values.Value_After (E, "ending in "));
      begin
         Selection := Sel.With_Arg (Selection, "state", D_State);
         Selection := Sel.With_Arg (Selection, "label", D_Label);
         Selection := Sel.With_Arg (Selection, "shown", D_Shown);
         Selection := Sel.With_Arg (Selection, "length", D_Length);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end Safe_Display_Label;

   function Secret_Count_Label
      (Context      : Humanize.Contexts.Context;
       Total        : Natural;
       Masked       : Natural := 0;
       Unset        : Natural := 0;
       Fingerprints : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Secrets.Secret_Count_Label
          (Total => Total,
           Masked => Masked,
           Unset => Unset,
           Fingerprints => Fingerprints);
      Text : Humanize.Status.Text_Result := Humanize.Label_Values.Nothing;
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
        "label.secrets.secret_count_label.total", Long_Long_Integer (Total)));
      if Masked > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.secrets.secret_count_label.masked", Long_Long_Integer (Masked)));
      end if;
      if Unset > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.secrets.secret_count_label.unset", Long_Long_Integer (Unset)));
      end if;
      if Fingerprints > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.secrets.secret_count_label.fingerprints", Long_Long_Integer (Fingerprints)));
      end if;
      return Humanize.Label_Values.Localized_Or (Context, Text, English);
   end Secret_Count_Label;

   function Secret_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Secret_Kind)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Secrets.Secret_Kind_Label (Kind => Kind);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.secrets.secret_kind_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "kind", Lower (Secret_Kind'Image (Kind)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Secret_Kind_Label;

   function Secret_Label
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Value    : String;
       Kind     : Secret_Kind := Unknown_Secret;
       Exposure : Secret_Exposure := Suffix_Only)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Secrets.Secret_Label (Name => Name, Value => Value, Kind => Kind, Exposure => Exposure);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.secrets.secret_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_State : constant String := (if Value'Length = 0 then "unset" elsif (if Kind = Unknown_Secret then
           Secret_Kind_For (Name, Value) else Kind) in SHA1_Fingerprint | SHA256_Fingerprint then "fingerprint_only"
           else Lower (Secret_Exposure'Image (Exposure)));
         D_Kind : constant String := Humanize.Label_Values.Text_Of (Secret_Kind_Label (Context, (if Kind =
           Unknown_Secret then Secret_Kind_For (Name, Value) else Kind)));
         D_Shown : constant String := (if D_State = "masked_value" then Humanize.Label_Values.Value_After (E,
           Humanize.Label_Values.Text_Of (Secret_Kind_Label ((if Kind = Unknown_Secret then Secret_Kind_For (Name,
           Value) else Kind))) & " ") else Humanize.Label_Values.Value_After (E, "ending in "));
      begin
         Selection := Sel.With_Arg (Selection, "state", D_State);
         Selection := Sel.With_Arg (Selection, "kind", D_Kind);
         Selection := Sel.With_Arg (Selection, "shown", D_Shown);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end Secret_Label;

   function Secret_Label
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Value    : String;
       Options  : Secret_Label_Options;
       Kind     : Secret_Kind := Unknown_Secret;
       Exposure : Secret_Exposure := Suffix_Only)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Secrets.Secret_Label
          (Name => Name,
           Value => Value,
           Options => Options,
           Kind => Kind,
           Exposure => Exposure);
      Plain_English : constant Humanize.Status.Text_Result :=
        Secrets.Secret_Label (Name => Name, Value => Value, Kind => Kind, Exposure => Exposure);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Secret_Label (Context, Name => Name, Value =>
        Value, Kind => Kind, Exposure => Exposure));
   end Secret_Label;

   function Sensitive_Value_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Sensitive_Value_Kind)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Secrets.Sensitive_Value_Kind_Label (Kind => Kind);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.secrets.sensitive_value_kind_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "kind", Lower (Sensitive_Value_Kind'Image (Kind)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Sensitive_Value_Kind_Label;

   procedure Credential_Source_Label_Into
      (Context : Humanize.Contexts.Context;
       Source  : String;
       Count   : Natural := 1;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Credential_Source_Label (Context, Source => Source, Count => Count),
         Target, Written, Status);
   end Credential_Source_Label_Into;

   procedure Environment_Secret_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Value   : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Environment_Secret_Label (Context, Name => Name, Value => Value),
         Target, Written, Status);
   end Environment_Secret_Label_Into;

   procedure Exposure_Label_Into
      (Context  : Humanize.Contexts.Context;
       Exposure : Secret_Exposure;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Exposure_Label (Context, Exposure => Exposure), Target, Written, Status);
   end Exposure_Label_Into;

   procedure Fingerprint_Label_Into
      (Context   : Humanize.Contexts.Context;
       Algorithm : String;
       Value     : String;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Fingerprint_Label (Context, Algorithm => Algorithm, Value => Value),
         Target, Written, Status);
   end Fingerprint_Label_Into;

   procedure Header_Credential_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Value   : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Header_Credential_Label (Context, Name => Name, Value => Value),
         Target, Written, Status);
   end Header_Credential_Label_Into;

   procedure Privacy_Profile_Label_Into
      (Context : Humanize.Contexts.Context;
       Profile : Privacy_Profile;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Privacy_Profile_Label (Context, Profile => Profile), Target, Written, Status);
   end Privacy_Profile_Label_Into;

   procedure Rotation_Status_Label_Into
      (Context        : Humanize.Contexts.Context;
       Needs_Rotation : Boolean;
       Days_Old       : Natural := 0;
       Target         : in out String;
       Written        : out Natural;
       Status         : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Rotation_Status_Label (Context, Needs_Rotation => Needs_Rotation, Days_Old => Days_Old),
         Target, Written, Status);
   end Rotation_Status_Label_Into;

   procedure Safe_Display_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Sensitive_Value_Kind;
       Value   : String;
       Profile : Privacy_Profile := Support_Profile;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Safe_Display_Label (Context, Kind => Kind, Value => Value, Profile => Profile),
         Target, Written, Status);
   end Safe_Display_Label_Into;

   procedure Secret_Count_Label_Into
      (Context      : Humanize.Contexts.Context;
       Total        : Natural;
       Masked       : Natural := 0;
       Unset        : Natural := 0;
       Fingerprints : Natural := 0;
       Target       : in out String;
       Written      : out Natural;
       Status       : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Secret_Count_Label (Context, Total => Total, Masked => Masked, Unset => Unset, Fingerprints => Fingerprints),
         Target, Written, Status);
   end Secret_Count_Label_Into;

   procedure Secret_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Secret_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Secret_Kind_Label (Context, Kind => Kind), Target, Written, Status);
   end Secret_Kind_Label_Into;

   procedure Secret_Label_Into
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Value    : String;
       Kind     : Secret_Kind := Unknown_Secret;
       Exposure : Secret_Exposure := Suffix_Only;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Secret_Label (Context, Name => Name, Value => Value, Kind => Kind, Exposure => Exposure),
         Target, Written, Status);
   end Secret_Label_Into;

   procedure Secret_Label_Into
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Value    : String;
       Options  : Secret_Label_Options;
       Kind     : Secret_Kind := Unknown_Secret;
       Exposure : Secret_Exposure := Suffix_Only;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Secret_Label (Context, Name => Name, Value => Value, Options => Options, Kind => Kind, Exposure => Exposure),
         Target, Written, Status);
   end Secret_Label_Into;

   procedure Sensitive_Value_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Sensitive_Value_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Sensitive_Value_Kind_Label (Context, Kind => Kind), Target, Written, Status);
   end Sensitive_Value_Kind_Label_Into;

end Humanize.Secrets.Localized;
