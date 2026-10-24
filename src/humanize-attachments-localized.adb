with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Selections;

package body Humanize.Attachments.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Attachment_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Attachments.Attachment_Count_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.attachments.attachment_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Attachment_Count_Label;

   function Attachment_Group_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Attachments.Attachment_Group_Label (Name => Name, Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.attachments.attachment_group_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Attachment_Group_Label;

   function Attachment_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Attachment_Kind)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Attachments.Attachment_Kind_Label (Kind => Kind);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.attachments.attachment_kind_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "kind", Lower (Attachment_Kind'Image (Kind)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Attachment_Kind_Label;

   function Attachment_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Attachment_Kind := File_Attachment;
       State   : Attachment_State := Uploaded_Attachment)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Attachments.Attachment_Label (Name => Name, Kind => Kind, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.attachments.attachment_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "kind", Lower (Attachment_Kind'Image (Kind)));
      Selection := Sel.With_Arg (Selection, "state", Lower (Attachment_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Attachment_Label;

   function Attachment_Size_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Size    : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Attachments.Attachment_Size_Label (Name => Name, Size => Size);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.attachments.attachment_size_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "size", Humanize.Bounded_Text.Clean (Size));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Attachment_Size_Label;

   function Attachment_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Attachment_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Attachments.Attachment_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.attachments.attachment_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Attachment_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Attachment_State_Label;

   function Download_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Attachments.Download_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.attachments.download_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Download_Label;

   function Expiring_Link_Label
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Time_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Attachments.Expiring_Link_Label (Name => Name, Time_Text => Time_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.attachments.expiring_link_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "time_text", Humanize.Bounded_Text.Clean (Time_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Expiring_Link_Label;

   function Image_Dimensions_Label
      (Context    : Humanize.Contexts.Context;
       Name       : String;
       Dimensions : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Attachments.Image_Dimensions_Label (Name => Name, Dimensions => Dimensions);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.attachments.image_dimensions_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "dimensions", Humanize.Bounded_Text.Clean (Dimensions));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Image_Dimensions_Label;

   function Preview_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Attachments.Preview_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.attachments.preview_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Preview_Label;

   function Remove_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Attachments.Remove_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.attachments.remove_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Remove_Label;

   function Scan_Result_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Scan_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Attachments.Scan_Result_Label (Name => Name, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.attachments.scan_result_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "state", Lower (Scan_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Scan_Result_Label;

   function Scan_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Scan_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Attachments.Scan_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.attachments.scan_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Scan_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Scan_State_Label;

   function Upload_Error_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Reason  : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Attachments.Upload_Error_Label (Name => Name, Reason => Reason);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.attachments.upload_error_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "reason", Humanize.Bounded_Text.Clean (Reason));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Upload_Error_Label;

   procedure Attachment_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Attachment_Count_Label (Context, Count), Target, Written, Status);
   end Attachment_Count_Label_Into;

   procedure Attachment_Group_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Attachment_Group_Label (Context, Name, Count), Target, Written, Status);
   end Attachment_Group_Label_Into;

   procedure Attachment_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Attachment_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Attachment_Kind_Label (Context, Kind), Target, Written, Status);
   end Attachment_Kind_Label_Into;

   procedure Attachment_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Attachment_Kind := File_Attachment;
       State   : Attachment_State := Uploaded_Attachment;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Attachment_Label (Context, Name, Kind, State), Target, Written, Status);
   end Attachment_Label_Into;

   procedure Attachment_Size_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Size    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Attachment_Size_Label (Context, Name, Size), Target, Written, Status);
   end Attachment_Size_Label_Into;

   procedure Attachment_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Attachment_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Attachment_State_Label (Context, State), Target, Written, Status);
   end Attachment_State_Label_Into;

   procedure Download_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Download_Label (Context, Name), Target, Written, Status);
   end Download_Label_Into;

   procedure Expiring_Link_Label_Into
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Time_Text : String;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Expiring_Link_Label (Context, Name, Time_Text), Target, Written, Status);
   end Expiring_Link_Label_Into;

   procedure Image_Dimensions_Label_Into
      (Context    : Humanize.Contexts.Context;
       Name       : String;
       Dimensions : String;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Image_Dimensions_Label (Context, Name, Dimensions), Target, Written, Status);
   end Image_Dimensions_Label_Into;

   procedure Preview_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Preview_Label (Context, Name), Target, Written, Status);
   end Preview_Label_Into;

   procedure Remove_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Remove_Label (Context, Name), Target, Written, Status);
   end Remove_Label_Into;

   procedure Scan_Result_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Scan_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Scan_Result_Label (Context, Name, State), Target, Written, Status);
   end Scan_Result_Label_Into;

   procedure Scan_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Scan_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Scan_State_Label (Context, State), Target, Written, Status);
   end Scan_State_Label_Into;

   procedure Upload_Error_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Reason  : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Upload_Error_Label (Context, Name, Reason), Target, Written, Status);
   end Upload_Error_Label_Into;

end Humanize.Attachments.Localized;
