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

package Humanize.Parsing.Implementation is

   function Parse_Bytes
     (Text : String)
      return Byte_Parse_Result;

   function Normalize_Number_Text
     (Text : String)
      return Humanize.Status.Text_Result;

   function Normalize_Unit_Text
     (Text : String)
      return Humanize.Status.Text_Result;

   function Normalize_List_Text
     (Text : String)
      return Humanize.Status.Text_Result;

   procedure Normalize_Number_Text_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Normalize_Unit_Text_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Normalize_List_Text_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   function Diagnostic
     (Status         : Humanize.Status.Status_Code;
      Error_Position : Natural)
      return Parse_Error_Kind;

   function Diagnostic
     (Status         : Humanize.Status.Status_Code;
      Error_Position : Natural;
      Error          : Parse_Error_Kind)
      return Parse_Error_Kind;

   function Diagnostic_Label
     (Kind : Parse_Error_Kind)
      return Humanize.Status.Text_Result;

   procedure Diagnostic_Label_Into
     (Kind    : Parse_Error_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   function Diagnostic_Message
     (Kind           : Parse_Error_Kind;
      Error_Position : Natural := 0)
      return Humanize.Status.Text_Result;

   procedure Diagnostic_Message_Into
     (Kind           : Parse_Error_Kind;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Error_Position : Natural := 0);

   function Scan_Bytes
     (Text : String)
      return Byte_Parse_Result;

   function Parse_Duration
     (Text : String)
      return Duration_Parse_Result;

   function Scan_Duration
     (Text : String)
      return Duration_Parse_Result;

   function Parse_Lenient_Duration
     (Text : String)
      return Duration_Parse_Result;

   function Scan_Lenient_Duration
     (Text : String)
      return Duration_Parse_Result;

   function Parse_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Parse_Result;

   function Parse_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Parse_Result;

   function Scan_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Parse_Result;

   function Scan_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Parse_Result;

   function Parse_Natural_Date_Time
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Natural_Date_Time_Parse_Result;

   function Scan_Natural_Date_Time
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Natural_Date_Time_Parse_Result;

   function Parse_Error_Label
     (Error : Parse_Error_Kind)
      return Humanize.Status.Text_Result;

   function Parse_Error_Context_Label
     (Error          : Parse_Error_Kind;
      Error_Position : Natural := 0)
      return Humanize.Status.Text_Result;

   procedure Parse_Error_Label_Into
     (Error   : Parse_Error_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Parse_Error_Context_Label_Into
     (Error          : Parse_Error_Kind;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Error_Position : Natural := 0);

   function Parse_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Range_Parse_Result;

   function Parse_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Range_Parse_Result;

   function Scan_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Range_Parse_Result;

   function Scan_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Range_Parse_Result;

   function Parse_Business_Calendar
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Parse_Result;

   function Scan_Business_Calendar
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Parse_Result;

   function Apply_Business_Calendar_Rule
     (Rules : in out Humanize.Durations.Business_Calendar_Rules;
      Rule  : Business_Calendar_Parse_Result)
      return Humanize.Status.Status_Code;

   function Parse_Business_Calendar_Rules
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Rules_Parse_Result;

   function Parse_Duration_Range
     (Text : String)
      return Duration_Range_Parse_Result;

   function Scan_Duration_Range
     (Text : String)
      return Duration_Range_Parse_Result;

   function Parse_Countdown
     (Text : String)
      return Duration_Parse_Result;

   function Parse_SLA_Window
     (Text : String)
      return Duration_Parse_Result;

   function Parse_Age
     (Text : String)
      return Duration_Parse_Result;

   function Parse_Modified_Ago
     (Text : String)
      return Duration_Parse_Result;

   function Parse_Progress
     (Text : String)
      return Proportion_Parse_Result;

   function Parse_Result_Count
     (Text : String)
      return List_Parse_Result;

   function Parse_Counted_Noun
     (Text : String)
      return Counted_Noun_Parse_Result;

   function Scan_Counted_Noun
     (Text : String)
      return Counted_Noun_Parse_Result;

   function Parse_Showing_Count
     (Text : String)
      return Proportion_Parse_Result;

   function Parse_Page_Count
     (Text : String)
      return Proportion_Parse_Result;

   function Parse_ETA
     (Text : String)
      return Duration_Parse_Result;

   function Scan_ETA
     (Text : String)
      return Duration_Parse_Result;

   function Parse_Retry_In
     (Text : String)
      return Duration_Parse_Result;

   function Scan_Retry_In
     (Text : String)
      return Duration_Parse_Result;

   function Parse_Step_Count
     (Text : String)
      return Proportion_Parse_Result;

   function Scan_Step_Count
     (Text : String)
      return Proportion_Parse_Result;

   function Parse_Attempt_Count
     (Text : String)
      return Proportion_Parse_Result;

   function Scan_Attempt_Count
     (Text : String)
      return Proportion_Parse_Result;

   function Parse_Business_Days
     (Text : String)
      return Number_Parse_Result;

   function Scan_Business_Days
     (Text : String)
      return Number_Parse_Result;

   function Parse_Working_Hours
     (Text : String)
      return Number_Parse_Result;

   function Scan_Working_Hours
     (Text : String)
      return Number_Parse_Result;

   function Parse_Recurrence
     (Text : String)
      return Number_Parse_Result;

   function Parse_Recurrence_Detail
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Recurrence_Parse_Result;

   function Parse_Cron_Schedule
     (Text : String)
      return Recurrence_Parse_Result;

   function Scan_Cron_Schedule
     (Text : String)
      return Recurrence_Parse_Result;

   function Scan_Recurrence
     (Text : String)
      return Number_Parse_Result;

   function Scan_Recurrence_Detail
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Recurrence_Parse_Result;

   function Parse_Throughput_Remaining
     (Text : String)
      return Proportion_Parse_Result;

   function Scan_Throughput_Remaining
     (Text : String)
      return Proportion_Parse_Result;

   function Parse_Progress_Bar
     (Text : String)
      return Number_Parse_Result;

   function Scan_Progress_Bar
     (Text : String)
      return Number_Parse_Result;

   function Parse_Precise_Duration
     (Text : String)
      return Precise_Duration_Parse_Result;

   function Scan_Precise_Duration
     (Text : String)
      return Precise_Duration_Parse_Result;

   function Parse_Compact_Number
     (Text : String)
      return Number_Parse_Result;

   function Parse_Cardinal
     (Text : String)
      return Number_Parse_Result;

   function Scan_Cardinal
     (Text : String)
      return Number_Parse_Result;

   function Parse_Scientific_Number
     (Text : String)
      return Float_Parse_Result;

   function Scan_Scientific_Number
     (Text : String)
      return Float_Parse_Result;

   function Parse_Currency
     (Text : String)
      return Currency_Parse_Result;

   function Scan_Currency
     (Text : String)
      return Currency_Parse_Result;

   function Parse_Approximate_Currency
     (Text : String)
      return Currency_Parse_Result;

   function Scan_Approximate_Currency
     (Text : String)
      return Currency_Parse_Result;

   function Parse_Approximate_Number
     (Text : String)
      return Number_Parse_Result;

   function Parse_Editorial_Number
     (Text : String)
      return Number_Parse_Result;

   function Parse_Currency_Words
     (Text : String)
      return Currency_Parse_Result;

   function Scan_Approximate_Number
     (Text : String)
      return Number_Parse_Result;

   function Parse_Change
     (Text : String)
      return Change_Parse_Result;

   function Scan_Change
     (Text : String)
      return Change_Parse_Result;

   function Parse_Number_Comparison
     (Text : String)
      return Comparison_Parse_Result;

   function Parse_Percent_Comparison
     (Text : String)
      return Comparison_Parse_Result;

   function Parse_File_Size_Comparison
     (Text : String)
      return Comparison_Parse_Result;

   function Parse_Date_Comparison
     (Text : String)
      return Date_Comparison_Parse_Result;

   function Scan_Date_Comparison
     (Text : String)
      return Date_Comparison_Parse_Result;

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

   function Parse_Domain_Summary
     (Text : String)
      return Domain_Summary_Parse_Result;

   function Parse_Phrase_Severity_Label
     (Text : String)
      return Phrase_Severity_Parse_Result;

   function Parse_Phrase_Tone_Label
     (Text : String)
      return Phrase_Tone_Parse_Result;

   function Parse_Phrase_Domain_Label
     (Text : String)
      return Phrase_Domain_Parse_Result;

   function Parse_Phrase_State_Label
     (Text : String)
      return Phrase_State_Parse_Result;

   function Parse_Phrase_Key
     (Text : String)
      return Phrase_Key_Parse_Result;

   function Parse_Phrase_Pack_Summary
     (Text : String)
      return Phrase_Pack_Summary_Parse_Result;

   function Parse_Supported_Phrase_Locales
     (Text : String)
      return Phrase_Locales_Parse_Result;

   function Parse_Operational_Phrase
     (Text : String)
      return Operational_Phrase_Parse_Result;

   function Parse_Field_Change_Summary
     (Text : String)
      return Field_Change_Summary_Parse_Result;

   function Parse_Field_State_Summary
     (Text : String)
      return Field_State_Summary_Parse_Result;

   function Parse_Sync_Summary
     (Text : String)
      return Domain_Summary_Parse_Result;

   function Parse_Import_Summary
     (Text : String)
      return Domain_Summary_Parse_Result;

   function Parse_Export_Summary
     (Text : String)
      return Domain_Summary_Parse_Result;

   function Parse_Queue_Summary
     (Text : String)
      return Queue_Summary_Parse_Result;

   function Parse_Cache_Summary
     (Text : String)
      return Cache_Summary_Parse_Result;

   function Parse_File_Size_Summary
     (Text : String)
      return File_Size_Summary_Parse_Result;

   function Parse_Transfer_Remaining
     (Text : String)
      return Transfer_Remaining_Parse_Result;

   function Parse_Disk_Usage
     (Text : String)
      return Disk_Usage_Parse_Result;

   function Parse_Validation_Summary
     (Text : String)
      return Validation_Summary_Parse_Result;

   function Parse_Field_Problem_Summary
     (Text : String)
      return Field_Problem_Parse_Result;

   function Parse_Selection_Summary
     (Text : String)
      return Selection_Summary_Parse_Result;

   function Parse_More_Count
     (Text : String)
      return More_Count_Parse_Result;

   function Parse_Pagination_Range
     (Text : String)
      return Pagination_Range_Parse_Result;

   function Parse_Collection_Display
     (Text : String)
      return Collection_Display_Parse_Result;

   function Parse_Text_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result;

   function Parse_Word_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result;

   function Parse_Sentence_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result;

   function Parse_Paragraph_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result;

   function Parse_Text_Time_Label
     (Text : String)
      return Text_Time_Parse_Result;

   function Parse_Reading_Time
     (Text : String)
      return Text_Time_Parse_Result;

   function Parse_Speaking_Time
     (Text : String)
      return Text_Time_Parse_Result;

   function Parse_Text_Summary
     (Text : String)
      return Text_Summary_Parse_Result;

   function Parse_Mask
     (Text : String;
      Mask_Char : Character := '*')
      return Mask_Parse_Result;

   function Parse_Grouped_Token
     (Text : String;
      Separator : Character := '-')
      return Grouped_Token_Parse_Result;

   function Parse_Masked_Token
     (Text : String;
      Separator : Character := '-';
      Mask_Char : Character := '*')
      return Grouped_Token_Parse_Result;

   function Parse_String_Label
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Path_Label
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Path_Basename
     (Text : String)
      return Filename_Label_Parse_Result;

   function Parse_Path_Title
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Extension_Label
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Shortened_Path
     (Text : String)
      return Excerpt_Parse_Result;

   function Parse_File_Mode_Label
     (Text : String)
      return File_Mode_Parse_Result;

   function Parse_Handle_Label
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Name_Label
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Clean_Name
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Display_Name
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Name_Part
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Initials
     (Text : String)
      return Initials_Parse_Result;

   function Parse_Person_Initials
     (Text : String)
      return Initials_Parse_Result;

   function Parse_Possessive_Label
     (Text : String)
      return Possessive_Parse_Result;

   function Parse_Possessive_Name
     (Text : String)
      return Possessive_Parse_Result;

   function Parse_Email_Local_Part
     (Text : String)
      return Email_Local_Part_Parse_Result;

   function Parse_Safe_Filename
     (Text : String)
      return Filename_Label_Parse_Result;

   function Parse_Search_Key
     (Text : String)
      return Identifier_Label_Parse_Result;

   function Parse_Natural_Sort_Key
     (Text : String)
      return Identifier_Label_Parse_Result;

   function Parse_Identifier_Label
     (Text : String;
      Separator : Character := '_')
      return Identifier_Label_Parse_Result;

   function Parse_Parameterize_Label
     (Text : String;
      Separator : Character := '-')
      return Identifier_Label_Parse_Result;

   function Parse_Dasherize_Label
     (Text : String)
      return Identifier_Label_Parse_Result;

   function Parse_Underscore_Label
     (Text : String)
      return Identifier_Label_Parse_Result;

   function Parse_Camelize_Label
     (Text : String)
      return Identifier_Label_Parse_Result;

   function Parse_Transliteration_Label
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Casefold_Label
     (Text : String)
      return Identifier_Label_Parse_Result;

   function Parse_Escaped_HTML
     (Text : String)
      return Cleanup_Label_Parse_Result;

   function Parse_NL_To_BR
     (Text : String)
      return Cleanup_Label_Parse_Result;

   function Parse_BR_To_NL
     (Text : String)
      return Cleanup_Label_Parse_Result;

   function Parse_Normalized_Whitespace
     (Text : String)
      return Cleanup_Label_Parse_Result;

   function Parse_Squished
     (Text : String)
      return Cleanup_Label_Parse_Result;

   function Parse_Stripped_Tags
     (Text : String)
      return Cleanup_Label_Parse_Result;

   function Parse_Preserved_Separator
     (Text      : String;
      Separator : Character)
      return Cleanup_Label_Parse_Result;

   function Parse_Pluralized_Word
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Singularized_Word
     (Text : String)
      return String_Label_Parse_Result;

   function Parse_Person_List
     (Text : String)
      return Person_List_Parse_Result;

   function Parse_Excerpt
     (Text : String;
      Ellipsis : String := "...")
      return Excerpt_Parse_Result;

   function Parse_Highlight
     (Text   : String;
      Before : String := "<mark>";
      After  : String := "</mark>")
      return Highlight_Parse_Result;

   function Parse_Highlighted_Excerpt
     (Text     : String;
      Ellipsis : String := "...";
      Before   : String := "<mark>";
      After    : String := "</mark>")
      return Highlight_Parse_Result;

   function Parse_Inflection_Source_Label
     (Text : String)
      return Inflection_Source_Parse_Result;

   function Scan_Compact_Number
     (Text : String)
      return Number_Parse_Result;

   function Parse_Bounded_Number
     (Text   : String;
      Suffix : String := "+")
      return Number_Parse_Result;

   function Parse_Number_Range
     (Text : String)
      return Number_Range_Parse_Result;

   function Parse_Decimal_Range
     (Text : String)
      return Decimal_Range_Parse_Result;

   function Parse_Decimal_Range_Words
     (Text : String)
      return Decimal_Range_Parse_Result;

   function Parse_Fraction_Words
     (Text : String)
      return Proportion_Parse_Result;

   function Parse_Uncertainty_Label
     (Text : String)
      return Uncertainty_Parse_Result;

   function Parse_Uncertainty_Words
     (Text : String)
      return Uncertainty_Parse_Result;

   function Parse_Percent_Words
     (Text : String)
      return Float_Parse_Result;

   function Scan_Uncertainty_Label
     (Text : String)
      return Uncertainty_Parse_Result;

   function Scan_Number_Range
     (Text : String)
      return Number_Range_Parse_Result;

   function Scan_Decimal_Range
     (Text : String)
      return Decimal_Range_Parse_Result;

   function Parse_Proportion
     (Text : String)
      return Proportion_Parse_Result;

   function Scan_Proportion
     (Text : String)
      return Proportion_Parse_Result;

   function Scan_Bounded_Number
     (Text   : String;
      Suffix : String := "+")
      return Number_Parse_Result;

   function Parse_Frequency
     (Text : String)
      return Frequency_Parse_Result;

   function Scan_Frequency
     (Text : String)
      return Frequency_Parse_Result;

   function Parse_Boolean_Label
     (Text : String)
      return Boolean_Label_Parse_Result;

   function Scan_Boolean_Label
     (Text : String)
      return Boolean_Label_Parse_Result;

   function Parse_Ternary_Label
     (Text : String)
      return Ternary_Label_Parse_Result;

   function Scan_Ternary_Label
     (Text : String)
      return Ternary_Label_Parse_Result;

   function Parse_Rate
     (Text : String)
      return Rate_Parse_Result;

   function Scan_Rate
     (Text : String)
      return Rate_Parse_Result;

   function Parse_List
     (Text : String)
      return List_Parse_Result;

   function Scan_List
     (Text : String)
      return List_Parse_Result;

   function Parse_Percent
     (Text : String)
      return Number_Parse_Result;

   function Scan_Percent
     (Text : String)
      return Number_Parse_Result;

   function Parse_Ordinal
     (Text : String)
      return Number_Parse_Result;

   function Scan_Ordinal
     (Text : String)
      return Number_Parse_Result;

   function Parse_Roman
     (Text : String)
      return Number_Parse_Result;

   function Scan_Roman
     (Text : String)
      return Number_Parse_Result;

   function Parse_Unit
     (Text : String)
      return Unit_Parse_Result;

   function Parse_Aspect_Ratio
     (Text : String)
      return Aspect_Ratio_Parse_Result;

   function Scan_Aspect_Ratio
     (Text : String)
      return Aspect_Ratio_Parse_Result;

   function Parse_CSS_Length
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_CSS_Length
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Compound_Unit
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Database_Throughput
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Database_Throughput
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Bit_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Bit_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Binary_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Binary_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Memory_Bandwidth
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Memory_Bandwidth
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Latency
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Latency
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_IOPS
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_IOPS
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Density
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Density
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Acceleration
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Acceleration
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Torque
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Torque
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Fuel_Economy
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Fuel_Economy
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Flow_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Flow_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Electric_Current
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Electric_Current
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Voltage
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Voltage
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Pixel_Density
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Pixel_Density
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Electric_Resistance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Electric_Resistance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Electric_Capacitance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Electric_Capacitance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Electric_Inductance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Electric_Inductance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Concentration
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Concentration
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Fuel_Efficiency_MPG
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Fuel_Efficiency_MPG
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_CPU_Load
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_CPU_Load
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Battery
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Battery
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Screen_Size
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Screen_Size
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Typography_Size
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Typography_Size
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Audio_Level
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Audio_Level
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Signal_Strength
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Signal_Strength
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Storage_Endurance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Storage_Endurance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Refresh_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Refresh_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Luminance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Luminance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Print_Resolution
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Print_Resolution
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Compound_Unit
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Unit
     (Text : String)
      return Unit_Parse_Result;

   function Classify_Scheduling_Phrase
     (Text : String)
      return Scheduling_Phrase_Result;

   function Scheduling_Phrase_Label
     (Result : Scheduling_Phrase_Result)
      return Humanize.Status.Text_Result;

   function Scheduling_Ambiguity_Label
     (Result : Scheduling_Phrase_Result)
      return Humanize.Status.Text_Result;

   function Scheduling_Resolution_Label
     (Kind : Scheduling_Phrase_Kind)
      return Humanize.Status.Text_Result;

   function Parse_Value_Family_Label
     (Family : Parse_Value_Family)
      return Humanize.Status.Text_Result;

   function Parse_Success_Explanation_Label
     (Family     : Parse_Value_Family;
      Input      : String;
      Normalized : String;
      Consumed   : Natural := 0;
      Exact      : Boolean := True)
      return Humanize.Status.Text_Result;

   function Parse_Success_Explanation_Label
     (Text : String)
      return Parse_Success_Explanation;

   function Scan_Success_Explanation_Label
     (Text : String)
      return Parse_Success_Explanation;

   function Byte_Parse_Success_Label
     (Input  : String;
      Result : Byte_Parse_Result)
      return Humanize.Status.Text_Result;

   function Duration_Parse_Success_Label
     (Input  : String;
      Result : Duration_Parse_Result)
      return Humanize.Status.Text_Result;

   function Number_Parse_Success_Label
     (Input  : String;
      Result : Number_Parse_Result)
      return Humanize.Status.Text_Result;

   function Unit_Parse_Success_Label
     (Input  : String;
      Result : Unit_Parse_Result)
      return Humanize.Status.Text_Result;

   function Scheduling_Parse_Success_Label
     (Input  : String;
      Result : Scheduling_Phrase_Result)
      return Humanize.Status.Text_Result;

   procedure Scheduling_Phrase_Label_Into
     (Result  : Scheduling_Phrase_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Parse_Success_Explanation_Label_Into
     (Family     : Parse_Value_Family;
      Input      : String;
      Normalized : String;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Consumed   : Natural := 0;
      Exact      : Boolean := True);
end Humanize.Parsing.Implementation;
