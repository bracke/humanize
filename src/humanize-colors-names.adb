with Humanize.Colors.Support;

package body Humanize.Colors.Names is
   package Shared renames Humanize.Colors.Support;

   function Hue_Family_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Shared.Hue_Family_Label;

   function Hue_Family_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result renames Shared.Hue_Family_Label;

   function Saturation_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Shared.Saturation_Label;

   function Saturation_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result renames Shared.Saturation_Label;

   function Temperature_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Shared.Temperature_Label;

   function Temperature_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result renames Shared.Temperature_Label;

   function Chroma_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Shared.Chroma_Label;

   function Chroma_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result renames Shared.Chroma_Label;

   function Color_Description
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Shared.Color_Description;

   function Color_Description
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result renames Shared.Color_Description;

   function Nearest_Color_Name
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Shared.Nearest_Color_Name;

   function Descriptive_Color_Name
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Shared.Descriptive_Color_Name;

   function Color_Summary
     (Color : RGB_Color)
      return Humanize.Status.Text_Result renames Shared.Color_Summary;

   procedure Hue_Family_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Hue_Family_Label_Into;

   procedure Hue_Family_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Hue_Family_Label_Into;

   procedure Saturation_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Saturation_Label_Into;

   procedure Saturation_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Saturation_Label_Into;

   procedure Temperature_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Temperature_Label_Into;

   procedure Temperature_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Temperature_Label_Into;

   procedure Chroma_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Chroma_Label_Into;

   procedure Chroma_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Chroma_Label_Into;

   procedure Color_Description_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Color_Description_Into;

   procedure Color_Description_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Color_Description_Into;

   procedure Nearest_Color_Name_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Nearest_Color_Name_Into;

   procedure Color_Summary_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Color_Summary_Into;

   procedure Descriptive_Color_Name_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Descriptive_Color_Name_Into;
end Humanize.Colors.Names;
