with Humanize.Parsing.Implementation.Colors;

package body Humanize.Parsing.Colors is
   package Impl renames Humanize.Parsing.Implementation.Colors;

   function Parse_Palette_Contrast_Matrix
     (Text : String)
      return Palette_Contrast_Matrix_Parse_Result renames Impl.Parse_Palette_Contrast_Matrix;

   function Parse_Palette_Metadata_Label
     (Text : String)
      return Palette_Metadata_Parse_Result renames Impl.Parse_Palette_Metadata_Label;

   function Parse_APCA_Contrast_Label
     (Text : String)
      return APCA_Label_Parse_Result renames Impl.Parse_APCA_Contrast_Label;

   function Parse_Color_Vision_Deficiency_Label
     (Text : String)
      return Color_Vision_Deficiency_Parse_Result renames Impl.Parse_Color_Vision_Deficiency_Label;

   function Parse_Color_Accessibility_Summary
     (Text : String)
      return Color_Accessibility_Parse_Result renames Impl.Parse_Color_Accessibility_Summary;

   function Parse_Alpha_Contrast_Label
     (Text : String)
      return Color_Difference_Label_Parse_Result renames Impl.Parse_Alpha_Contrast_Label;

   function Parse_Contrast_Remediation_Label
     (Text : String)
      return Contrast_Remediation_Parse_Result renames Impl.Parse_Contrast_Remediation_Label;

   function Parse_RGB_Label
     (Text : String)
      return Color_Label_Parse_Result renames Impl.Parse_RGB_Label;

   function Parse_RGBA_Label
     (Text : String)
      return Color_Label_Parse_Result renames Impl.Parse_RGBA_Label;

   function Parse_CSS_Color_Label
     (Text : String)
      return Color_Label_Parse_Result renames Impl.Parse_CSS_Color_Label;

   function Parse_Color_Summary
     (Text : String)
      return Color_Label_Parse_Result renames Impl.Parse_Color_Summary;

   function Parse_HSL_Label
     (Text : String)
      return Color_Model_Label_Parse_Result renames Impl.Parse_HSL_Label;

   function Parse_HSV_Label
     (Text : String)
      return Color_Model_Label_Parse_Result renames Impl.Parse_HSV_Label;

   function Parse_Color_Bucket_Label
     (Text : String)
      return Color_Bucket_Label_Parse_Result renames Impl.Parse_Color_Bucket_Label;

   function Parse_Color_Description
     (Text : String)
      return Color_Description_Parse_Result renames Impl.Parse_Color_Description;

   function Parse_Opacity_Label
     (Text : String)
      return Color_Difference_Label_Parse_Result renames Impl.Parse_Opacity_Label;

   function Parse_Palette_Summary
     (Text : String)
      return Palette_Summary_Parse_Result renames Impl.Parse_Palette_Summary;

   function Parse_Palette_Roles
     (Text : String)
      return Palette_Roles_Parse_Result renames Impl.Parse_Palette_Roles;

   function Parse_Palette_Harmony_Label
     (Text : String)
      return Color_Bucket_Label_Parse_Result renames Impl.Parse_Palette_Harmony_Label;

   function Parse_Palette_Contrast_Suggestion
     (Text : String)
      return Palette_Contrast_Suggestion_Parse_Result renames Impl.Parse_Palette_Contrast_Suggestion;

   function Parse_Palette_Accessibility_Label
     (Text : String)
      return Palette_Accessibility_Label_Parse_Result renames Impl.Parse_Palette_Accessibility_Label;

   function Parse_Palette_Mood_Label
     (Text : String)
      return Palette_Mood_Parse_Result renames Impl.Parse_Palette_Mood_Label;

   function Parse_Advanced_Palette_Summary
     (Text : String)
      return Palette_Mood_Parse_Result renames Impl.Parse_Advanced_Palette_Summary;

   function Parse_Color_Difference_Label
     (Text : String)
      return Color_Difference_Label_Parse_Result renames Impl.Parse_Color_Difference_Label;

   function Parse_Perceptual_Difference_Label
     (Text : String)
      return Color_Difference_Label_Parse_Result renames Impl.Parse_Perceptual_Difference_Label;
end Humanize.Parsing.Colors;
