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
