with Humanize.Contexts;

--  Attachments labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain
--  labels"): each is the parent's function of the same name with a Context first, and that function itself in
--  English, where the locale has no translation, and for every input the parent rejects.
package Humanize.Attachments.Localized is

   function Attachment_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Attachment_Count_Label.
   --  @return The label in Context's locale.

   function Attachment_Group_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Attachment_Group_Label.
   --  @param Count As for the parent's Attachment_Group_Label.
   --  @return The label in Context's locale.

   function Attachment_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Attachment_Kind)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Attachment_Kind_Label.
   --  @return The label in Context's locale.

   function Attachment_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Attachment_Kind := File_Attachment;
       State   : Attachment_State := Uploaded_Attachment)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Attachment_Label.
   --  @param Kind As for the parent's Attachment_Label.
   --  @param State As for the parent's Attachment_Label.
   --  @return The label in Context's locale.

   function Attachment_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Attachment_Kind;
       State   : Attachment_State;
       Options : Attachment_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Attachment_Label.
   --  @param Kind As for the parent's Attachment_Label.
   --  @param State As for the parent's Attachment_Label.
   --  @param Options As for the parent's Attachment_Label.
   --  @return The label in Context's locale.

   function Attachment_Size_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Size    : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Attachment_Size_Label.
   --  @param Size As for the parent's Attachment_Size_Label.
   --  @return The label in Context's locale.

   function Attachment_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Attachment_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Attachment_State_Label.
   --  @return The label in Context's locale.

   function Download_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Download_Label.
   --  @return The label in Context's locale.

   function Expiring_Link_Label
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Time_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Expiring_Link_Label.
   --  @param Time_Text As for the parent's Expiring_Link_Label.
   --  @return The label in Context's locale.

   function Image_Dimensions_Label
      (Context    : Humanize.Contexts.Context;
       Name       : String;
       Dimensions : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Image_Dimensions_Label.
   --  @param Dimensions As for the parent's Image_Dimensions_Label.
   --  @return The label in Context's locale.

   function Preview_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Preview_Label.
   --  @return The label in Context's locale.

   function Remove_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Remove_Label.
   --  @return The label in Context's locale.

   function Scan_Result_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Scan_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Scan_Result_Label.
   --  @param State As for the parent's Scan_Result_Label.
   --  @return The label in Context's locale.

   function Scan_Result_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Scan_State;
       Options : Attachment_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Scan_Result_Label.
   --  @param State As for the parent's Scan_Result_Label.
   --  @param Options As for the parent's Scan_Result_Label.
   --  @return The label in Context's locale.

   function Scan_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Scan_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Scan_State_Label.
   --  @return The label in Context's locale.

   function Upload_Error_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Reason  : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Upload_Error_Label.
   --  @param Reason As for the parent's Upload_Error_Label.
   --  @return The label in Context's locale.

   function Upload_Progress_Label
      (Context : Humanize.Contexts.Context;
       Done    : Natural;
       Total   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Done As for the parent's Upload_Progress_Label.
   --  @param Total As for the parent's Upload_Progress_Label.
   --  @return The label in Context's locale.

   procedure Attachment_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Attachment_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Attachment_Group_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Attachment_Group_Label.
   --  @param Count As for the parent's Attachment_Group_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Attachment_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Attachment_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Attachment_Kind_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Attachment_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Attachment_Kind := File_Attachment;
       State   : Attachment_State := Uploaded_Attachment;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Attachment_Label.
   --  @param Kind As for the parent's Attachment_Label.
   --  @param State As for the parent's Attachment_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Attachment_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Attachment_Kind;
       State   : Attachment_State;
       Options : Attachment_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Attachment_Label.
   --  @param Kind As for the parent's Attachment_Label.
   --  @param State As for the parent's Attachment_Label.
   --  @param Options As for the parent's Attachment_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Attachment_Size_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Size    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Attachment_Size_Label.
   --  @param Size As for the parent's Attachment_Size_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Attachment_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Attachment_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Attachment_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Download_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Download_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Expiring_Link_Label_Into
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Time_Text : String;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Expiring_Link_Label.
   --  @param Time_Text As for the parent's Expiring_Link_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Image_Dimensions_Label_Into
      (Context    : Humanize.Contexts.Context;
       Name       : String;
       Dimensions : String;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Image_Dimensions_Label.
   --  @param Dimensions As for the parent's Image_Dimensions_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Preview_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Preview_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Remove_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Remove_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Scan_Result_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Scan_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Scan_Result_Label.
   --  @param State As for the parent's Scan_Result_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Scan_Result_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Scan_State;
       Options : Attachment_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Scan_Result_Label.
   --  @param State As for the parent's Scan_Result_Label.
   --  @param Options As for the parent's Scan_Result_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Scan_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Scan_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Scan_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Upload_Error_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Reason  : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Upload_Error_Label.
   --  @param Reason As for the parent's Upload_Error_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Upload_Progress_Label_Into
      (Context : Humanize.Contexts.Context;
       Done    : Natural;
       Total   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Done As for the parent's Upload_Progress_Label.
   --  @param Total As for the parent's Upload_Progress_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Attachments.Localized;
