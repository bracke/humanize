with Humanize.Colors;

private package Humanize.Parsing.Implementation.Color_Text_Helpers is
   function Parse_Float_Field
     (Text  : String;
      Value : out Long_Float)
      return Boolean;
   function Parse_Percent_Field
     (Text  : String;
      Value : out Long_Float)
      return Boolean;
   function To_Channel (Value : Natural) return Humanize.Colors.Color_Channel;
   function Parse_Palette_Contrast_Matrix
     (Text : String)
      return Humanize.Parsing.Palette_Contrast_Matrix_Parse_Result;
   function Parse_Palette_Metadata_Label
     (Text : String)
      return Humanize.Parsing.Palette_Metadata_Parse_Result;
   function Parse_APCA_Contrast_Label
     (Text : String)
      return Humanize.Parsing.APCA_Label_Parse_Result;
   function Deficiency_From_Text
     (Text       : String;
      Deficiency : out Humanize.Colors.Color_Vision_Deficiency)
      return Boolean;
   function Parse_Contrast_Label
     (Text : String;
      Ratio : out Long_Float;
      Level : out String;
      Level_Length : out Natural)
      return Boolean;
   function Parse_Alpha_Contrast_Label
     (Text : String)
      return Humanize.Parsing.Color_Difference_Label_Parse_Result;
   function Parse_Color_Vision_Deficiency_Label
     (Text : String)
      return Humanize.Parsing.Color_Vision_Deficiency_Parse_Result;
   function Parse_Color_Accessibility_Summary
     (Text : String)
      return Humanize.Parsing.Color_Accessibility_Parse_Result;
   function Parse_Contrast_Remediation_Label
     (Text : String)
      return Humanize.Parsing.Contrast_Remediation_Parse_Result;
   function Parse_RGB_Components
     (Text        : String;
      Prefix      : String;
      Need_Alpha  : Boolean;
      Color       : out Humanize.Colors.RGB_Color;
      Opacity     : out Long_Float)
      return Boolean;
   function RGB_Label_Error
     (Text       : String;
      Prefix     : String;
      Need_Alpha : Boolean)
      return Humanize.Parsing.Color_Label_Parse_Result;
   function Parse_RGB_Label
     (Text : String)
      return Humanize.Parsing.Color_Label_Parse_Result;
   function Parse_RGBA_Label
     (Text : String)
      return Humanize.Parsing.Color_Label_Parse_Result;
   function Parse_CSS_Color_Label
     (Text : String)
      return Humanize.Parsing.Color_Label_Parse_Result;
   function Parse_Color_Summary
     (Text : String)
      return Humanize.Parsing.Color_Label_Parse_Result;
   function Parse_HSL_Label
     (Text : String)
      return Humanize.Parsing.Color_Model_Label_Parse_Result;
   function Parse_HSV_Label
     (Text : String)
      return Humanize.Parsing.Color_Model_Label_Parse_Result;
   function Is_Color_Bucket_Label (Item : String) return Boolean;
   function Parse_Color_Bucket_Label
     (Text : String)
      return Humanize.Parsing.Color_Bucket_Label_Parse_Result;
   function Parse_Color_Description
     (Text : String)
      return Humanize.Parsing.Color_Description_Parse_Result;
   function Parse_Opacity_Label
     (Text : String)
      return Humanize.Parsing.Color_Difference_Label_Parse_Result;
   function Parse_Palette_Summary
     (Text : String)
      return Humanize.Parsing.Palette_Summary_Parse_Result;
   function Parse_Palette_Roles
     (Text : String)
      return Humanize.Parsing.Palette_Roles_Parse_Result;
   function Parse_Palette_Harmony_Label
     (Text : String)
      return Humanize.Parsing.Color_Bucket_Label_Parse_Result;
   function Parse_Palette_Contrast_Suggestion
     (Text : String)
      return Humanize.Parsing.Palette_Contrast_Suggestion_Parse_Result;
   function Parse_Palette_Accessibility_Label
     (Text : String)
      return Humanize.Parsing.Palette_Accessibility_Label_Parse_Result;
   function Parse_Palette_Mood_Label
     (Text : String)
      return Humanize.Parsing.Palette_Mood_Parse_Result;
   function Parse_Advanced_Palette_Summary
     (Text : String)
      return Humanize.Parsing.Palette_Mood_Parse_Result;
   function Parse_Color_Difference_Label
     (Text : String)
      return Humanize.Parsing.Color_Difference_Label_Parse_Result;
   function Parse_Perceptual_Difference_Label
     (Text : String)
      return Humanize.Parsing.Color_Difference_Label_Parse_Result;
end Humanize.Parsing.Implementation.Color_Text_Helpers;
