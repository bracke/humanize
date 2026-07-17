with Humanize.Domain_Details;
with Humanize.Status;

--  Human-readable labels for attachments, uploads, previews, and file items.
package Humanize.Attachments is

   type Attachment_Output_Mode is
     (Attachment_Detailed, Attachment_Compact,
      Attachment_Accessible, Attachment_Log);
   --  Output style for attachment labels with domain metadata.

   type Attachment_Label_Options is record
      Mode             : Attachment_Output_Mode := Attachment_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;
   --  Caller-selected metadata included around attachment labels.

   Default_Attachment_Label_Options : constant Attachment_Label_Options :=
     (Mode             => Attachment_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Attachment_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;

   type Attachment_State is
     (Pending_Attachment,
      Uploading_Attachment,
      Uploaded_Attachment,
      Failed_Attachment,
      Removed_Attachment,
      Blocked_Attachment);
   --  Caller-supplied attachment/upload state.

   type Attachment_Kind is
     (File_Attachment,
      Image_Attachment,
      Video_Attachment,
      Audio_Attachment,
      Document_Attachment,
      Archive_Attachment,
      Link_Attachment);
   --  Caller-supplied attachment kind.

   type Scan_State is
     (Not_Scanned,
      Scanning,
      Safe,
      Suspicious,
      Infected);
   --  Caller-supplied attachment security scan state.

   function Attachment_State_Label
     (State : Attachment_State)
      return Humanize.Status.Text_Result;
   --  @param State Attachment/upload state.
   --  @return Human-readable attachment-state label.

   function Attachment_Kind_Label
     (Kind : Attachment_Kind)
      return Humanize.Status.Text_Result;
   --  @param Kind Attachment kind.
   --  @return Human-readable attachment-kind label.

   function Scan_State_Label
     (State : Scan_State)
      return Humanize.Status.Text_Result;
   --  @param State Attachment security scan state.
   --  @return Human-readable scan-state label.

   function Attachment_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Attachment count.
   --  @return Human-readable attachment count label.

   function Attachment_Label
     (Name  : String;
      Kind  : Attachment_Kind := File_Attachment;
      State : Attachment_State := Uploaded_Attachment)
      return Humanize.Status.Text_Result;
   --  @param Name Attachment display name.
   --  @param Kind Attachment kind.
   --  @param State Attachment/upload state.
   --  @return Human-readable attachment label.

   function Attachment_Label
     (Name    : String;
      Kind    : Attachment_Kind;
      State   : Attachment_State;
      Options : Attachment_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Attachment display name.
   --  @param Kind Attachment kind.
   --  @param State Attachment/upload state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable attachment label with optional metadata.

   function Upload_Progress_Label
     (Done  : Natural;
      Total : Natural)
      return Humanize.Status.Text_Result;
   --  @param Done Completed upload item count.
   --  @param Total Total upload item count.
   --  @return Human-readable upload progress label.

   function Attachment_Size_Label
     (Name : String;
      Size : String)
      return Humanize.Status.Text_Result;
   --  @param Name Attachment display name.
   --  @param Size Caller-supplied human-readable size label.
   --  @return Human-readable attachment size label.

   function Preview_Label
     (Name : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Optional attachment display name.
   --  @return Human-readable preview action label.

   function Download_Label
     (Name : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Optional attachment display name.
   --  @return Human-readable download action label.

   function Remove_Label
     (Name : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Optional attachment display name.
   --  @return Human-readable remove attachment action label.

   function Scan_Result_Label
     (Name  : String;
      State : Scan_State)
      return Humanize.Status.Text_Result;
   --  @param Name Attachment display name.
   --  @param State Attachment security scan state.
   --  @return Human-readable attachment scan result label.

   function Scan_Result_Label
     (Name    : String;
      State   : Scan_State;
      Options : Attachment_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Attachment display name.
   --  @param State Attachment security scan state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable scan result label with optional metadata.

   function Attachment_State_Metadata
     (State : Attachment_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Attachment/upload state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Scan_State_Metadata
     (State : Scan_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Attachment security scan state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Parse_Attachment_Label
     (Text  : String;
      Kind  : Attachment_Kind;
      State : Attachment_State)
      return Attachment_Label_Parse_Result;
   --  @param Text Label in rendered attachment-label form.
   --  @param Kind Expected attachment kind.
   --  @param State Expected attachment state.
   --  @return Parsed attachment name span, state span, metadata, and consumed length.

   function Scan_Attachment_Label
     (Text  : String;
      Kind  : Attachment_Kind;
      State : Attachment_State)
      return Attachment_Label_Parse_Result;
   --  @param Text Text beginning with an attachment label.
   --  @param Kind Expected attachment kind.
   --  @param State Expected attachment state.
   --  @return Parsed label span and consumed prefix length.

   function Parse_Scan_Result_Label
     (Text  : String;
      State : Scan_State)
      return Attachment_Label_Parse_Result;
   --  @param Text Label in rendered scan-result form.
   --  @param State Expected scan state.
   --  @return Parsed attachment name span, scan span, metadata, and consumed length.

   function Scan_Scan_Result_Label
     (Text  : String;
      State : Scan_State)
      return Attachment_Label_Parse_Result;
   --  @param Text Text beginning with a scan-result label.
   --  @param State Expected scan state.
   --  @return Parsed label span and consumed prefix length.

   function Upload_Error_Label
     (Name   : String;
      Reason : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Attachment display name.
   --  @param Reason Optional upload failure reason.
   --  @return Human-readable upload error label.

   function Attachment_Group_Label
     (Name  : String;
      Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Name Attachment group name.
   --  @param Count Attachment count in the group.
   --  @return Human-readable attachment group label.

   function Image_Dimensions_Label
     (Name       : String;
      Dimensions : String)
      return Humanize.Status.Text_Result;
   --  @param Name Image attachment display name.
   --  @param Dimensions Caller-supplied image dimensions label.
   --  @return Human-readable image dimensions label.

   function Expiring_Link_Label
     (Name      : String;
      Time_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Name Attachment or link display name.
   --  @param Time_Text Caller-supplied expiry time/distance label.
   --  @return Human-readable expiring attachment link label.

   procedure Attachment_State_Label_Into
     (State   : Attachment_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Attachment/upload state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Attachment_Kind_Label_Into
     (Kind    : Attachment_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Kind Attachment kind.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Scan_State_Label_Into
     (State   : Scan_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Attachment security scan state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Attachment_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Attachment count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Attachment_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : Attachment_Kind := File_Attachment;
      State   : Attachment_State := Uploaded_Attachment);
   --  @param Name Attachment display name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Kind Attachment kind.
   --  @param State Attachment/upload state.

   procedure Attachment_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : Attachment_Kind;
      State   : Attachment_State;
      Options : Attachment_Label_Options);
   --  @param Name Attachment display name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Kind Attachment kind.
   --  @param State Attachment/upload state.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Upload_Progress_Label_Into
     (Done    : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Done Completed upload item count.
   --  @param Total Total upload item count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Attachment_Size_Label_Into
     (Name    : String;
      Size    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Attachment display name.
   --  @param Size Caller-supplied human-readable size label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Preview_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional attachment display name.

   procedure Download_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional attachment display name.

   procedure Remove_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional attachment display name.

   procedure Scan_Result_Label_Into
     (Name    : String;
      State   : Scan_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Attachment display name.
   --  @param State Attachment security scan state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Scan_Result_Label_Into
     (Name    : String;
      State   : Scan_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Attachment_Label_Options);
   --  @param Name Attachment display name.
   --  @param State Attachment security scan state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Upload_Error_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Reason  : String := "");
   --  @param Name Attachment display name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Reason Optional upload failure reason.

   procedure Attachment_Group_Label_Into
     (Name    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Attachment group name.
   --  @param Count Attachment count in the group.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Image_Dimensions_Label_Into
     (Name       : String;
      Dimensions : String;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   --  @param Name Image attachment display name.
   --  @param Dimensions Caller-supplied image dimensions label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Expiring_Link_Label_Into
     (Name      : String;
      Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Name Attachment or link display name.
   --  @param Time_Text Caller-supplied expiry time/distance label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Attachments;
