with Ada.Calendar;

with Humanize.Bytes;
with Humanize.Colors;
with Humanize.Durations;
with Humanize.Frequencies;
with Humanize.Numbers;
with Humanize.Phrases;
with Humanize.Rates;
with Humanize.Status;
with Humanize.Strings;
with Humanize.Units;
with Humanize.Values;

package Humanize.Parsing.Colors is

   function Parse_Palette_Contrast_Matrix
     (Text : String)
      return Palette_Contrast_Matrix_Parse_Result;

   function Parse_Palette_Metadata_Label
     (Text : String)
      return Palette_Metadata_Parse_Result;

   function Parse_APCA_Contrast_Label
     (Text : String)
      return APCA_Label_Parse_Result;

   function Parse_Color_Vision_Deficiency_Label
     (Text : String)
      return Color_Vision_Deficiency_Parse_Result;

   function Parse_Color_Accessibility_Summary
     (Text : String)
      return Color_Accessibility_Parse_Result;

   function Parse_Alpha_Contrast_Label
     (Text : String)
      return Color_Difference_Label_Parse_Result;

   function Parse_Contrast_Remediation_Label
     (Text : String)
      return Contrast_Remediation_Parse_Result;

   function Parse_RGB_Label
     (Text : String)
      return Color_Label_Parse_Result;

   function Parse_RGBA_Label
     (Text : String)
      return Color_Label_Parse_Result;

   function Parse_CSS_Color_Label
     (Text : String)
      return Color_Label_Parse_Result;

   function Parse_Color_Summary
     (Text : String)
      return Color_Label_Parse_Result;

   function Parse_HSL_Label
     (Text : String)
      return Color_Model_Label_Parse_Result;

   function Parse_HSV_Label
     (Text : String)
      return Color_Model_Label_Parse_Result;

   function Parse_Color_Bucket_Label
     (Text : String)
      return Color_Bucket_Label_Parse_Result;

   function Parse_Color_Description
     (Text : String)
      return Color_Description_Parse_Result;

   function Parse_Opacity_Label
     (Text : String)
      return Color_Difference_Label_Parse_Result;

   function Parse_Palette_Summary
     (Text : String)
      return Palette_Summary_Parse_Result;

   function Parse_Palette_Roles
     (Text : String)
      return Palette_Roles_Parse_Result;

   function Parse_Palette_Harmony_Label
     (Text : String)
      return Color_Bucket_Label_Parse_Result;

   function Parse_Palette_Contrast_Suggestion
     (Text : String)
      return Palette_Contrast_Suggestion_Parse_Result;

   function Parse_Palette_Accessibility_Label
     (Text : String)
      return Palette_Accessibility_Label_Parse_Result;

   function Parse_Palette_Mood_Label
     (Text : String)
      return Palette_Mood_Parse_Result;

   function Parse_Advanced_Palette_Summary
     (Text : String)
      return Palette_Mood_Parse_Result;

   function Parse_Color_Difference_Label
     (Text : String)
      return Color_Difference_Label_Parse_Result;

   function Parse_Perceptual_Difference_Label
     (Text : String)
      return Color_Difference_Label_Parse_Result;
end Humanize.Parsing.Colors;
