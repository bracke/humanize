with Humanize.Colors.Support;

package body Humanize.Colors.Palettes is
   package Shared renames Humanize.Colors.Support;

   function Palette_Summary
     (Colors : Color_List)
      return Humanize.Status.Text_Result renames Shared.Palette_Summary;

   function Palette_Roles
     (Colors : Color_List)
      return Humanize.Status.Text_Result renames Shared.Palette_Roles;

   function Palette_Harmony_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result renames Shared.Palette_Harmony_Label;

   function Palette_Contrast_Suggestion
     (Colors : Color_List)
      return Humanize.Status.Text_Result renames Shared.Palette_Contrast_Suggestion;

   function Palette_Accessibility_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result renames Shared.Palette_Accessibility_Label;

   function Palette_Contrast_Matrix_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result renames Shared.Palette_Contrast_Matrix_Label;

   function Palette_Metadata_For
     (Colors : Color_List)
      return Palette_Metadata renames Shared.Palette_Metadata_For;

   function Palette_Metadata_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result renames Shared.Palette_Metadata_Label;

   function Palette_Mood_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result renames Shared.Palette_Mood_Label;

   function Advanced_Palette_Summary
     (Colors : Color_List)
      return Humanize.Status.Text_Result renames Shared.Advanced_Palette_Summary;

   procedure Palette_Summary_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Palette_Summary_Into;

   procedure Palette_Roles_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Palette_Roles_Into;

   procedure Palette_Harmony_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Palette_Harmony_Label_Into;

   procedure Palette_Contrast_Suggestion_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Palette_Contrast_Suggestion_Into;

   procedure Palette_Accessibility_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Palette_Accessibility_Label_Into;

   procedure Palette_Contrast_Matrix_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Palette_Contrast_Matrix_Label_Into;

   procedure Palette_Metadata_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Palette_Metadata_Label_Into;

   procedure Palette_Mood_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Palette_Mood_Label_Into;

   procedure Advanced_Palette_Summary_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Advanced_Palette_Summary_Into;
end Humanize.Colors.Palettes;
