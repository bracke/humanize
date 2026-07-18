with Humanize.Status;

--  Metadata string summaries for hashes, versions, MIME types, and encodings.
package Humanize.Strings.Metadata is

   function Text_Change_Metadata_For
     (Old_Text : String;
      New_Text : String)
      return Text_Change_Metadata;

   function Text_Change_Label
     (Old_Text : String;
      New_Text : String)
      return Humanize.Status.Text_Result;

   function Data_Shape_Label
     (Shape : Data_Shape_Metadata)
      return Humanize.Status.Text_Result;

   function Infer_Data_Shape
     (Text : String)
      return Data_Shape_Metadata;

   function Data_Shape_Label
     (Text : String)
      return Humanize.Status.Text_Result;

   function Label_Coverage_Audit_Label
     (Coverage : Label_Coverage_Metadata)
      return Humanize.Status.Text_Result;

   function Transliteration_Coverage_Label
     (Text : String)
      return Humanize.Status.Text_Result;

   function Text_Boundary_Summary_Label
     (Text : String)
      return Humanize.Status.Text_Result;

   function Text_Metadata_Label
     (Text : String)
      return Humanize.Status.Text_Result;

   procedure Transliteration_Coverage_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Text_Boundary_Summary_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Text_Metadata_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Text_Change_Label_Into
     (Old_Text : String;
      New_Text : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);

   procedure Data_Shape_Label_Into
     (Shape   : Data_Shape_Metadata;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
end Humanize.Strings.Metadata;
