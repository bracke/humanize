with Humanize.Strings.Support;

package body Humanize.Strings.Metadata is
   package Shared renames Humanize.Strings.Support;

   function Text_Change_Metadata_For
     (Old_Text : String;
      New_Text : String)
      return Text_Change_Metadata renames Shared.Text_Change_Metadata_For;

   function Text_Change_Label
     (Old_Text : String;
      New_Text : String)
      return Humanize.Status.Text_Result renames Shared.Text_Change_Label;

   function Data_Shape_Label
     (Shape : Data_Shape_Metadata)
      return Humanize.Status.Text_Result renames Shared.Data_Shape_Label;

   function Infer_Data_Shape
     (Text : String)
      return Data_Shape_Metadata renames Shared.Infer_Data_Shape;

   function Data_Shape_Label
     (Text : String)
      return Humanize.Status.Text_Result renames Shared.Data_Shape_Label;

   function Label_Coverage_Audit_Label
     (Coverage : Label_Coverage_Metadata)
      return Humanize.Status.Text_Result renames Shared.Label_Coverage_Audit_Label;

   function Transliteration_Coverage_Label
     (Text : String)
      return Humanize.Status.Text_Result renames Shared.Transliteration_Coverage_Label;

   function Text_Boundary_Summary_Label
     (Text : String)
      return Humanize.Status.Text_Result renames Shared.Text_Boundary_Summary_Label;

   function Text_Metadata_Label
     (Text : String)
      return Humanize.Status.Text_Result renames Shared.Text_Metadata_Label;

   procedure Transliteration_Coverage_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Transliteration_Coverage_Label_Into;

   procedure Text_Boundary_Summary_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Text_Boundary_Summary_Label_Into;

   procedure Text_Metadata_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Text_Metadata_Label_Into;

   procedure Text_Change_Label_Into
     (Old_Text : String;
      New_Text : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code) renames Shared.Text_Change_Label_Into;

   procedure Data_Shape_Label_Into
     (Shape   : Data_Shape_Metadata;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Data_Shape_Label_Into;
end Humanize.Strings.Metadata;
