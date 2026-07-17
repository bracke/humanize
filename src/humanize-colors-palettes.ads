with Humanize.Contexts;
with Humanize.Status;

package Humanize.Colors.Palettes is

   function Palette_Summary
     (Colors : Color_List)
      return Humanize.Status.Text_Result;

   function Palette_Roles
     (Colors : Color_List)
      return Humanize.Status.Text_Result;

   function Palette_Harmony_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result;

   function Palette_Contrast_Suggestion
     (Colors : Color_List)
      return Humanize.Status.Text_Result;

   function Palette_Accessibility_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result;

   function Palette_Contrast_Matrix_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result;

   function Palette_Metadata_For
     (Colors : Color_List)
      return Palette_Metadata;

   function Palette_Metadata_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result;

   function Palette_Mood_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result;

   function Advanced_Palette_Summary
     (Colors : Color_List)
      return Humanize.Status.Text_Result;

   procedure Palette_Summary_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Palette_Roles_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Palette_Harmony_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Palette_Contrast_Suggestion_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Palette_Accessibility_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Palette_Contrast_Matrix_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Palette_Metadata_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Palette_Mood_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Advanced_Palette_Summary_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
end Humanize.Colors.Palettes;
