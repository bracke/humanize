with Humanize.Parsing.Implementation.Date_Times;
with Humanize.Parsing.Implementation.Durations;
with Humanize.Parsing.Implementation.Numbers;
with Humanize.Parsing.Implementation.Colors;
with Humanize.Parsing.Implementation.Strings;
with Humanize.Parsing.Implementation.Units;
with Humanize.Parsing.Implementation.Domain_Labels;
with Humanize.Parsing.Bytes;
with Humanize.Parsing.Diagnostics;
with Humanize.Parsing.Normalization;
with Humanize.Parsing.Success_Labels;

package body Humanize.Parsing.Implementation is

   function Parse_Bytes
     (Text : String)
      return Byte_Parse_Result
      renames Humanize.Parsing.Bytes.Parse_Bytes;

   function Normalize_Number_Text
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Parsing.Normalization.Normalize_Number_Text;

   function Normalize_Unit_Text
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Parsing.Normalization.Normalize_Unit_Text;

   function Normalize_List_Text
     (Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.Parsing.Normalization.Normalize_List_Text;

   procedure Normalize_Number_Text_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Parsing.Normalization.Normalize_Number_Text_Into;

   procedure Normalize_Unit_Text_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Parsing.Normalization.Normalize_Unit_Text_Into;

   procedure Normalize_List_Text_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Parsing.Normalization.Normalize_List_Text_Into;

   function Diagnostic
     (Status         : Humanize.Status.Status_Code;
      Error_Position : Natural)
      return Parse_Error_Kind
      renames Humanize.Parsing.Diagnostics.Diagnostic;

   function Diagnostic
     (Status         : Humanize.Status.Status_Code;
      Error_Position : Natural;
      Error          : Parse_Error_Kind)
      return Parse_Error_Kind
      renames Humanize.Parsing.Diagnostics.Diagnostic;

   function Diagnostic_Label
     (Kind : Parse_Error_Kind)
      return Humanize.Status.Text_Result
      renames Humanize.Parsing.Diagnostics.Diagnostic_Label;

   procedure Diagnostic_Label_Into
     (Kind    : Parse_Error_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Parsing.Diagnostics.Diagnostic_Label_Into;

   function Diagnostic_Message
     (Kind           : Parse_Error_Kind;
      Error_Position : Natural := 0)
      return Humanize.Status.Text_Result
      renames Humanize.Parsing.Diagnostics.Diagnostic_Message;

   procedure Diagnostic_Message_Into
     (Kind           : Parse_Error_Kind;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Error_Position : Natural := 0)
      renames Humanize.Parsing.Diagnostics.Diagnostic_Message_Into;

   function Scan_Bytes
     (Text : String)
      return Byte_Parse_Result
      renames Humanize.Parsing.Bytes.Scan_Bytes;

   function Parse_Duration
     (Text : String)
      return Duration_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Duration;

   function Scan_Duration
     (Text : String)
      return Duration_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Scan_Duration;

   function Parse_Lenient_Duration
     (Text : String)
      return Duration_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Lenient_Duration;

   function Scan_Lenient_Duration
     (Text : String)
      return Duration_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Scan_Lenient_Duration;

   function Parse_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Parse_Result
      renames Humanize.Parsing.Implementation.Date_Times.Parse_Natural_Date;

   function Parse_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Parse_Result
      renames Humanize.Parsing.Implementation.Date_Times.Parse_Natural_Date;

   function Scan_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Parse_Result
      renames Humanize.Parsing.Implementation.Date_Times.Scan_Natural_Date;

   function Scan_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Parse_Result
      renames Humanize.Parsing.Implementation.Date_Times.Scan_Natural_Date;

   function Parse_Natural_Date_Time
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Natural_Date_Time_Parse_Result
      renames Humanize.Parsing.Implementation.Date_Times.Parse_Natural_Date_Time;

   function Scan_Natural_Date_Time
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Natural_Date_Time_Parse_Result
      renames Humanize.Parsing.Implementation.Date_Times.Scan_Natural_Date_Time;

   function Parse_Error_Label
     (Error : Parse_Error_Kind)
      return Humanize.Status.Text_Result
      renames Humanize.Parsing.Diagnostics.Parse_Error_Label;

   function Parse_Error_Context_Label
     (Error          : Parse_Error_Kind;
      Error_Position : Natural := 0)
      return Humanize.Status.Text_Result
      renames Humanize.Parsing.Diagnostics.Parse_Error_Context_Label;

   procedure Parse_Error_Label_Into
     (Error   : Parse_Error_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Parsing.Diagnostics.Parse_Error_Label_Into;

   procedure Parse_Error_Context_Label_Into
     (Error          : Parse_Error_Kind;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Error_Position : Natural := 0)
      renames Humanize.Parsing.Diagnostics.Parse_Error_Context_Label_Into;

   function Parse_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Range_Parse_Result
      renames Humanize.Parsing.Implementation.Date_Times.Parse_Natural_Date_Range;

   function Parse_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Range_Parse_Result
      renames Humanize.Parsing.Implementation.Date_Times.Parse_Natural_Date_Range;

   function Scan_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Range_Parse_Result
      renames Humanize.Parsing.Implementation.Date_Times.Scan_Natural_Date_Range;

   function Scan_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Range_Parse_Result
      renames Humanize.Parsing.Implementation.Date_Times.Scan_Natural_Date_Range;

   function Parse_Business_Calendar
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Parse_Result
      renames Humanize.Parsing.Implementation.Date_Times.Parse_Business_Calendar;

   function Scan_Business_Calendar
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Parse_Result
      renames Humanize.Parsing.Implementation.Date_Times.Scan_Business_Calendar;

   function Apply_Business_Calendar_Rule
     (Rules : in out Humanize.Durations.Business_Calendar_Rules;
      Rule  : Business_Calendar_Parse_Result)
      return Humanize.Status.Status_Code
      renames Humanize.Parsing.Implementation.Date_Times.Apply_Business_Calendar_Rule;

   function Parse_Business_Calendar_Rules
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Rules_Parse_Result
      renames Humanize.Parsing.Implementation.Date_Times.Parse_Business_Calendar_Rules;

   function Parse_Duration_Range
     (Text : String)
      return Duration_Range_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Duration_Range;

   function Scan_Duration_Range
     (Text : String)
      return Duration_Range_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Scan_Duration_Range;

   function Parse_Countdown
     (Text : String)
      return Duration_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Countdown;

   function Parse_SLA_Window
     (Text : String)
      return Duration_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_SLA_Window;

   function Parse_Age
     (Text : String)
      return Duration_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Age;

   function Parse_Modified_Ago
     (Text : String)
      return Duration_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Modified_Ago;

   function Parse_Progress
     (Text : String)
      return Proportion_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Progress;

   function Parse_Result_Count
     (Text : String)
      return List_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Result_Count;

   function Parse_Counted_Noun
     (Text : String)
      return Counted_Noun_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Counted_Noun;

   function Scan_Counted_Noun
     (Text : String)
      return Counted_Noun_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Scan_Counted_Noun;

   function Parse_Showing_Count
     (Text : String)
      return Proportion_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Showing_Count;

   function Parse_Page_Count
     (Text : String)
      return Proportion_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Page_Count;

   function Parse_ETA
     (Text : String)
      return Duration_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_ETA;

   function Scan_ETA
     (Text : String)
      return Duration_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Scan_ETA;

   function Parse_Retry_In
     (Text : String)
      return Duration_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Retry_In;

   function Scan_Retry_In
     (Text : String)
      return Duration_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Scan_Retry_In;

   function Parse_Step_Count
     (Text : String)
      return Proportion_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Step_Count;

   function Scan_Step_Count
     (Text : String)
      return Proportion_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Scan_Step_Count;

   function Parse_Attempt_Count
     (Text : String)
      return Proportion_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Attempt_Count;

   function Scan_Attempt_Count
     (Text : String)
      return Proportion_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Scan_Attempt_Count;

   function Parse_Business_Days
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Business_Days;

   function Scan_Business_Days
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Scan_Business_Days;

   function Parse_Working_Hours
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Working_Hours;

   function Scan_Working_Hours
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Scan_Working_Hours;

   function Parse_Recurrence
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Recurrence;

   function Parse_Recurrence_Detail
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Recurrence_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Recurrence_Detail;

   function Parse_Cron_Schedule
     (Text : String)
      return Recurrence_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Cron_Schedule;

   function Scan_Cron_Schedule
     (Text : String)
      return Recurrence_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Scan_Cron_Schedule;

   function Scan_Recurrence
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Scan_Recurrence;

   function Scan_Recurrence_Detail
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Recurrence_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Scan_Recurrence_Detail;

   function Parse_Throughput_Remaining
     (Text : String)
      return Proportion_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Throughput_Remaining;

   function Scan_Throughput_Remaining
     (Text : String)
      return Proportion_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Scan_Throughput_Remaining;

   function Parse_Progress_Bar
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Progress_Bar;

   function Scan_Progress_Bar
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Scan_Progress_Bar;

   function Parse_Precise_Duration
     (Text : String)
      return Precise_Duration_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Parse_Precise_Duration;

   function Scan_Precise_Duration
     (Text : String)
      return Precise_Duration_Parse_Result
      renames Humanize.Parsing.Implementation.Durations.Scan_Precise_Duration;

   function Parse_Compact_Number
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Compact_Number;

   function Parse_Cardinal
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Cardinal;

   function Scan_Cardinal
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Scan_Cardinal;

   function Parse_Scientific_Number
     (Text : String)
      return Float_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Scientific_Number;

   function Scan_Scientific_Number
     (Text : String)
      return Float_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Scan_Scientific_Number;

   function Parse_Currency
     (Text : String)
      return Currency_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Currency;

   function Scan_Currency
     (Text : String)
      return Currency_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Scan_Currency;

   function Parse_Approximate_Currency
     (Text : String)
      return Currency_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Approximate_Currency;

   function Scan_Approximate_Currency
     (Text : String)
      return Currency_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Scan_Approximate_Currency;

   function Parse_Approximate_Number
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Approximate_Number;

   function Parse_Editorial_Number
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Editorial_Number;

   function Parse_Currency_Words
     (Text : String)
      return Currency_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Currency_Words;

   function Scan_Approximate_Number
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Scan_Approximate_Number;

   function Parse_Change
     (Text : String)
      return Change_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Change;

   function Scan_Change
     (Text : String)
      return Change_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Scan_Change;

   function Parse_Number_Comparison
     (Text : String)
      return Comparison_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Number_Comparison;

   function Parse_Percent_Comparison
     (Text : String)
      return Comparison_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Percent_Comparison;

   function Parse_File_Size_Comparison
     (Text : String)
      return Comparison_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_File_Size_Comparison;

   function Parse_Date_Comparison
     (Text : String)
      return Date_Comparison_Parse_Result
      renames Humanize.Parsing.Implementation.Date_Times.Parse_Date_Comparison;

   function Scan_Date_Comparison
     (Text : String)
      return Date_Comparison_Parse_Result
      renames Humanize.Parsing.Implementation.Date_Times.Scan_Date_Comparison;

   function Parse_Palette_Contrast_Matrix
     (Text : String)
      return Palette_Contrast_Matrix_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_Palette_Contrast_Matrix;

   function Parse_Palette_Metadata_Label
     (Text : String)
      return Palette_Metadata_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_Palette_Metadata_Label;

   function Parse_APCA_Contrast_Label
     (Text : String)
      return APCA_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_APCA_Contrast_Label;

   function Parse_Color_Vision_Deficiency_Label
     (Text : String)
      return Color_Vision_Deficiency_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_Color_Vision_Deficiency_Label;

   function Parse_Color_Accessibility_Summary
     (Text : String)
      return Color_Accessibility_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_Color_Accessibility_Summary;

   function Parse_Alpha_Contrast_Label
     (Text : String)
      return Color_Difference_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_Alpha_Contrast_Label;

   function Parse_Contrast_Remediation_Label
     (Text : String)
      return Contrast_Remediation_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_Contrast_Remediation_Label;

   function Parse_RGB_Label
     (Text : String)
      return Color_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_RGB_Label;

   function Parse_RGBA_Label
     (Text : String)
      return Color_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_RGBA_Label;

   function Parse_CSS_Color_Label
     (Text : String)
      return Color_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_CSS_Color_Label;

   function Parse_Color_Summary
     (Text : String)
      return Color_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_Color_Summary;

   function Parse_HSL_Label
     (Text : String)
      return Color_Model_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_HSL_Label;

   function Parse_HSV_Label
     (Text : String)
      return Color_Model_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_HSV_Label;

   function Parse_Color_Bucket_Label
     (Text : String)
      return Color_Bucket_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_Color_Bucket_Label;

   function Parse_Color_Description
     (Text : String)
      return Color_Description_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_Color_Description;

   function Parse_Opacity_Label
     (Text : String)
      return Color_Difference_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_Opacity_Label;

   function Parse_Palette_Summary
     (Text : String)
      return Palette_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_Palette_Summary;

   function Parse_Palette_Roles
     (Text : String)
      return Palette_Roles_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_Palette_Roles;

   function Parse_Palette_Harmony_Label
     (Text : String)
      return Color_Bucket_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_Palette_Harmony_Label;

   function Parse_Palette_Contrast_Suggestion
     (Text : String)
      return Palette_Contrast_Suggestion_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_Palette_Contrast_Suggestion;

   function Parse_Palette_Accessibility_Label
     (Text : String)
      return Palette_Accessibility_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_Palette_Accessibility_Label;

   function Parse_Palette_Mood_Label
     (Text : String)
      return Palette_Mood_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_Palette_Mood_Label;

   function Parse_Advanced_Palette_Summary
     (Text : String)
      return Palette_Mood_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_Advanced_Palette_Summary;

   function Parse_Color_Difference_Label
     (Text : String)
      return Color_Difference_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_Color_Difference_Label;

   function Parse_Perceptual_Difference_Label
     (Text : String)
      return Color_Difference_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Colors.Parse_Perceptual_Difference_Label;

   function Parse_Domain_Summary
     (Text : String)
      return Domain_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Domain_Summary;

   function Parse_Phrase_Severity_Label
     (Text : String)
      return Phrase_Severity_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Phrase_Severity_Label;

   function Parse_Phrase_Tone_Label
     (Text : String)
      return Phrase_Tone_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Phrase_Tone_Label;

   function Parse_Phrase_Domain_Label
     (Text : String)
      return Phrase_Domain_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Phrase_Domain_Label;

   function Parse_Phrase_State_Label
     (Text : String)
      return Phrase_State_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Phrase_State_Label;

   function Parse_Phrase_Key
     (Text : String)
      return Phrase_Key_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Phrase_Key;

   function Parse_Phrase_Pack_Summary
     (Text : String)
      return Phrase_Pack_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Phrase_Pack_Summary;

   function Parse_Supported_Phrase_Locales
     (Text : String)
      return Phrase_Locales_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Supported_Phrase_Locales;

   function Parse_Operational_Phrase
     (Text : String)
      return Operational_Phrase_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Operational_Phrase;

   function Parse_Field_Change_Summary
     (Text : String)
      return Field_Change_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Field_Change_Summary;

   function Parse_Field_State_Summary
     (Text : String)
      return Field_State_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Field_State_Summary;

   function Parse_Sync_Summary
     (Text : String)
      return Domain_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Sync_Summary;

   function Parse_Import_Summary
     (Text : String)
      return Domain_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Import_Summary;

   function Parse_Export_Summary
     (Text : String)
      return Domain_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Export_Summary;

   function Parse_Queue_Summary
     (Text : String)
      return Queue_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Queue_Summary;

   function Parse_Cache_Summary
     (Text : String)
      return Cache_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Cache_Summary;

   function Parse_File_Size_Summary
     (Text : String)
      return File_Size_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_File_Size_Summary;

   function Parse_Transfer_Remaining
     (Text : String)
      return Transfer_Remaining_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Transfer_Remaining;

   function Parse_Disk_Usage
     (Text : String)
      return Disk_Usage_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Disk_Usage;

   function Parse_Validation_Summary
     (Text : String)
      return Validation_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Validation_Summary;

   function Parse_Field_Problem_Summary
     (Text : String)
      return Field_Problem_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Field_Problem_Summary;

   function Parse_Selection_Summary
     (Text : String)
      return Selection_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Selection_Summary;

   function Parse_More_Count
     (Text : String)
      return More_Count_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_More_Count;

   function Parse_Pagination_Range
     (Text : String)
      return Pagination_Range_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Pagination_Range;

   function Parse_Collection_Display
     (Text : String)
      return Collection_Display_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Collection_Display;

   function Parse_Text_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Text_Count_Summary;

   function Parse_Word_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Word_Count_Summary;

   function Parse_Sentence_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Sentence_Count_Summary;

   function Parse_Paragraph_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Paragraph_Count_Summary;

   function Parse_Text_Time_Label
     (Text : String)
      return Text_Time_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Text_Time_Label;

   function Parse_Reading_Time
     (Text : String)
      return Text_Time_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Reading_Time;

   function Parse_Speaking_Time
     (Text : String)
      return Text_Time_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Speaking_Time;

   function Parse_Text_Summary
     (Text : String)
      return Text_Summary_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Text_Summary;

   function Parse_Mask
     (Text : String;
      Mask_Char : Character := '*')
      return Mask_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Mask;

   function Parse_Grouped_Token
     (Text : String;
      Separator : Character := '-')
      return Grouped_Token_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Grouped_Token;

   function Parse_Masked_Token
     (Text : String;
      Separator : Character := '-';
      Mask_Char : Character := '*')
      return Grouped_Token_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Masked_Token;

   function Parse_String_Label
     (Text : String)
      return String_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_String_Label;

   function Parse_Path_Label
     (Text : String)
      return String_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Path_Label;

   function Parse_Path_Basename
     (Text : String)
      return Filename_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Path_Basename;

   function Parse_Path_Title
     (Text : String)
      return String_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Path_Title;

   function Parse_Extension_Label
     (Text : String)
      return String_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Extension_Label;

   function Parse_Shortened_Path
     (Text : String)
      return Excerpt_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Shortened_Path;

   function Parse_File_Mode_Label
     (Text : String)
      return File_Mode_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_File_Mode_Label;

   function Parse_Handle_Label
     (Text : String)
      return String_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Handle_Label;

   function Parse_Name_Label
     (Text : String)
      return String_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Name_Label;

   function Parse_Clean_Name
     (Text : String)
      return String_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Clean_Name;

   function Parse_Display_Name
     (Text : String)
      return String_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Display_Name;

   function Parse_Name_Part
     (Text : String)
      return String_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Name_Part;

   function Parse_Initials
     (Text : String)
      return Initials_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Initials;

   function Parse_Person_Initials
     (Text : String)
      return Initials_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Person_Initials;

   function Parse_Possessive_Label
     (Text : String)
      return Possessive_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Possessive_Label;

   function Parse_Possessive_Name
     (Text : String)
      return Possessive_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Possessive_Name;

   function Parse_Email_Local_Part
     (Text : String)
      return Email_Local_Part_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Email_Local_Part;

   function Parse_Safe_Filename
     (Text : String)
      return Filename_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Safe_Filename;

   function Parse_Search_Key
     (Text : String)
      return Identifier_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Search_Key;

   function Parse_Natural_Sort_Key
     (Text : String)
      return Identifier_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Natural_Sort_Key;

   function Parse_Identifier_Label
     (Text : String;
      Separator : Character := '_')
      return Identifier_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Identifier_Label;

   function Parse_Parameterize_Label
     (Text : String;
      Separator : Character := '-')
      return Identifier_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Parameterize_Label;

   function Parse_Dasherize_Label
     (Text : String)
      return Identifier_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Dasherize_Label;

   function Parse_Underscore_Label
     (Text : String)
      return Identifier_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Underscore_Label;

   function Parse_Camelize_Label
     (Text : String)
      return Identifier_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Camelize_Label;

   function Parse_Transliteration_Label
     (Text : String)
      return String_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Transliteration_Label;

   function Parse_Casefold_Label
     (Text : String)
      return Identifier_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Casefold_Label;

   function Parse_Escaped_HTML
     (Text : String)
      return Cleanup_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Escaped_HTML;

   function Parse_NL_To_BR
     (Text : String)
      return Cleanup_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_NL_To_BR;

   function Parse_BR_To_NL
     (Text : String)
      return Cleanup_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_BR_To_NL;

   function Parse_Normalized_Whitespace
     (Text : String)
      return Cleanup_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Normalized_Whitespace;

   function Parse_Squished
     (Text : String)
      return Cleanup_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Squished;

   function Parse_Stripped_Tags
     (Text : String)
      return Cleanup_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Stripped_Tags;

   function Parse_Preserved_Separator
     (Text      : String;
      Separator : Character)
      return Cleanup_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Preserved_Separator;

   function Parse_Pluralized_Word
     (Text : String)
      return String_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Pluralized_Word;

   function Parse_Singularized_Word
     (Text : String)
      return String_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Singularized_Word;

   function Parse_Person_List
     (Text : String)
      return Person_List_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Person_List;

   function Parse_Excerpt
     (Text : String;
      Ellipsis : String := "...")
      return Excerpt_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Excerpt;

   function Parse_Highlight
     (Text   : String;
      Before : String := "<mark>";
      After  : String := "</mark>")
      return Highlight_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Highlight;

   function Parse_Highlighted_Excerpt
     (Text     : String;
      Ellipsis : String := "...";
      Before   : String := "<mark>";
      After    : String := "</mark>")
      return Highlight_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Highlighted_Excerpt;

   function Parse_Inflection_Source_Label
     (Text : String)
      return Inflection_Source_Parse_Result
      renames Humanize.Parsing.Implementation.Strings.Parse_Inflection_Source_Label;

   function Scan_Compact_Number
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Scan_Compact_Number;

   function Parse_Bounded_Number
     (Text   : String;
      Suffix : String := "+")
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Bounded_Number;

   function Parse_Number_Range
     (Text : String)
      return Number_Range_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Number_Range;

   function Parse_Decimal_Range
     (Text : String)
      return Decimal_Range_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Decimal_Range;

   function Parse_Decimal_Range_Words
     (Text : String)
      return Decimal_Range_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Decimal_Range_Words;

   function Parse_Fraction_Words
     (Text : String)
      return Proportion_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Fraction_Words;

   function Parse_Uncertainty_Label
     (Text : String)
      return Uncertainty_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Uncertainty_Label;

   function Parse_Uncertainty_Words
     (Text : String)
      return Uncertainty_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Uncertainty_Words;

   function Parse_Percent_Words
     (Text : String)
      return Float_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Percent_Words;

   function Scan_Uncertainty_Label
     (Text : String)
      return Uncertainty_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Scan_Uncertainty_Label;

   function Scan_Number_Range
     (Text : String)
      return Number_Range_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Scan_Number_Range;

   function Scan_Decimal_Range
     (Text : String)
      return Decimal_Range_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Scan_Decimal_Range;

   function Parse_Proportion
     (Text : String)
      return Proportion_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Proportion;

   function Scan_Proportion
     (Text : String)
      return Proportion_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Scan_Proportion;

   function Scan_Bounded_Number
     (Text   : String;
      Suffix : String := "+")
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Scan_Bounded_Number;

   function Parse_Frequency
     (Text : String)
      return Frequency_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Frequency;

   function Scan_Frequency
     (Text : String)
      return Frequency_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Frequency;

   function Parse_Boolean_Label
     (Text : String)
      return Boolean_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Boolean_Label;

   function Scan_Boolean_Label
     (Text : String)
      return Boolean_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Scan_Boolean_Label;

   function Parse_Ternary_Label
     (Text : String)
      return Ternary_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Parse_Ternary_Label;

   function Scan_Ternary_Label
     (Text : String)
      return Ternary_Label_Parse_Result
      renames Humanize.Parsing.Implementation.Domain_Labels.Scan_Ternary_Label;

   function Parse_Rate
     (Text : String)
      return Rate_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Rate;

   function Scan_Rate
     (Text : String)
      return Rate_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Rate;

   function Parse_List
     (Text : String)
      return List_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_List;

   function Scan_List
     (Text : String)
      return List_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_List;

   function Parse_Percent
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Percent;

   function Scan_Percent
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Scan_Percent;

   function Parse_Ordinal
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Ordinal;

   function Scan_Ordinal
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Scan_Ordinal;

   function Parse_Roman
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Parse_Roman;

   function Scan_Roman
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Numbers.Scan_Roman;

   function Parse_Unit
     (Text : String)
      return Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Unit;

   function Parse_Aspect_Ratio
     (Text : String)
      return Aspect_Ratio_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Aspect_Ratio;

   function Scan_Aspect_Ratio
     (Text : String)
      return Aspect_Ratio_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Aspect_Ratio;

   function Parse_CSS_Length
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_CSS_Length;

   function Scan_CSS_Length
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_CSS_Length;

   function Parse_Compound_Unit
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Compound_Unit;

   function Parse_Database_Throughput
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Database_Throughput;

   function Scan_Database_Throughput
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Database_Throughput;

   function Parse_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Data_Rate;

   function Scan_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Data_Rate;

   function Parse_Bit_Rate
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Bit_Rate;

   function Scan_Bit_Rate
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Bit_Rate;

   function Parse_Binary_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Binary_Data_Rate;

   function Scan_Binary_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Binary_Data_Rate;

   function Parse_Memory_Bandwidth
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Memory_Bandwidth;

   function Scan_Memory_Bandwidth
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Memory_Bandwidth;

   function Parse_Latency
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Latency;

   function Scan_Latency
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Latency;

   function Parse_IOPS
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_IOPS;

   function Scan_IOPS
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_IOPS;

   function Parse_Density
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Density;

   function Scan_Density
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Density;

   function Parse_Acceleration
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Acceleration;

   function Scan_Acceleration
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Acceleration;

   function Parse_Torque
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Torque;

   function Scan_Torque
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Torque;

   function Parse_Fuel_Economy
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Fuel_Economy;

   function Scan_Fuel_Economy
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Fuel_Economy;

   function Parse_Flow_Rate
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Flow_Rate;

   function Scan_Flow_Rate
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Flow_Rate;

   function Parse_Electric_Current
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Electric_Current;

   function Scan_Electric_Current
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Electric_Current;

   function Parse_Voltage
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Voltage;

   function Scan_Voltage
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Voltage;

   function Parse_Pixel_Density
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Pixel_Density;

   function Scan_Pixel_Density
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Pixel_Density;

   function Parse_Electric_Resistance
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Electric_Resistance;

   function Scan_Electric_Resistance
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Electric_Resistance;

   function Parse_Electric_Capacitance
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Electric_Capacitance;

   function Scan_Electric_Capacitance
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Electric_Capacitance;

   function Parse_Electric_Inductance
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Electric_Inductance;

   function Scan_Electric_Inductance
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Electric_Inductance;

   function Parse_Concentration
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Concentration;

   function Scan_Concentration
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Concentration;

   function Parse_Fuel_Efficiency_MPG
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Fuel_Efficiency_MPG;

   function Scan_Fuel_Efficiency_MPG
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Fuel_Efficiency_MPG;

   function Parse_CPU_Load
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_CPU_Load;

   function Scan_CPU_Load
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_CPU_Load;

   function Parse_Battery
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Battery;

   function Scan_Battery
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Battery;

   function Parse_Screen_Size
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Screen_Size;

   function Scan_Screen_Size
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Screen_Size;

   function Parse_Typography_Size
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Typography_Size;

   function Scan_Typography_Size
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Typography_Size;

   function Parse_Audio_Level
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Audio_Level;

   function Scan_Audio_Level
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Audio_Level;

   function Parse_Signal_Strength
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Signal_Strength;

   function Scan_Signal_Strength
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Signal_Strength;

   function Parse_Storage_Endurance
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Storage_Endurance;

   function Scan_Storage_Endurance
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Storage_Endurance;

   function Parse_Refresh_Rate
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Refresh_Rate;

   function Scan_Refresh_Rate
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Refresh_Rate;

   function Parse_Luminance
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Luminance;

   function Scan_Luminance
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Luminance;

   function Parse_Print_Resolution
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Parse_Print_Resolution;

   function Scan_Print_Resolution
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Print_Resolution;

   function Scan_Compound_Unit
     (Text : String)
      return Compound_Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Compound_Unit;

   function Scan_Unit
     (Text : String)
      return Unit_Parse_Result
      renames Humanize.Parsing.Implementation.Units.Scan_Unit;

   function Classify_Scheduling_Phrase
     (Text : String)
      return Scheduling_Phrase_Result
      renames Humanize.Parsing.Implementation.Date_Times.Classify_Scheduling_Phrase;

   function Scheduling_Phrase_Label
     (Result : Scheduling_Phrase_Result)
      return Humanize.Status.Text_Result
      renames Humanize.Parsing.Success_Labels.Scheduling_Phrase_Label;

   function Scheduling_Ambiguity_Label
     (Result : Scheduling_Phrase_Result)
      return Humanize.Status.Text_Result
      renames Humanize.Parsing.Success_Labels.Scheduling_Ambiguity_Label;

   function Scheduling_Resolution_Label
     (Kind : Scheduling_Phrase_Kind)
      return Humanize.Status.Text_Result
      renames Humanize.Parsing.Success_Labels.Scheduling_Resolution_Label;

   function Parse_Value_Family_Label
     (Family : Parse_Value_Family)
      return Humanize.Status.Text_Result
      renames Humanize.Parsing.Success_Labels.Parse_Value_Family_Label;

   function Parse_Success_Explanation_Label
     (Family     : Parse_Value_Family;
      Input      : String;
      Normalized : String;
      Consumed   : Natural := 0;
      Exact      : Boolean := True)
      return Humanize.Status.Text_Result
      renames Humanize.Parsing.Success_Labels.Parse_Success_Explanation_Label;

   function Parse_Success_Explanation_Label
     (Text : String)
      return Parse_Success_Explanation
      renames Humanize.Parsing.Success_Labels.Parse_Success_Explanation_Label;

   function Scan_Success_Explanation_Label
     (Text : String)
      return Parse_Success_Explanation
      renames Humanize.Parsing.Success_Labels.Scan_Success_Explanation_Label;

   function Byte_Parse_Success_Label
     (Input  : String;
      Result : Byte_Parse_Result)
      return Humanize.Status.Text_Result
      renames Humanize.Parsing.Success_Labels.Byte_Parse_Success_Label;

   function Duration_Parse_Success_Label
     (Input  : String;
      Result : Duration_Parse_Result)
      return Humanize.Status.Text_Result
      renames Humanize.Parsing.Success_Labels.Duration_Parse_Success_Label;

   function Number_Parse_Success_Label
     (Input  : String;
      Result : Number_Parse_Result)
      return Humanize.Status.Text_Result
      renames Humanize.Parsing.Success_Labels.Number_Parse_Success_Label;

   function Unit_Parse_Success_Label
     (Input  : String;
      Result : Unit_Parse_Result)
      return Humanize.Status.Text_Result
      renames Humanize.Parsing.Success_Labels.Unit_Parse_Success_Label;

   function Scheduling_Parse_Success_Label
     (Input  : String;
      Result : Scheduling_Phrase_Result)
      return Humanize.Status.Text_Result
      renames Humanize.Parsing.Success_Labels.Scheduling_Parse_Success_Label;

   procedure Scheduling_Phrase_Label_Into
     (Result  : Scheduling_Phrase_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Parsing.Success_Labels.Scheduling_Phrase_Label_Into;

   procedure Parse_Success_Explanation_Label_Into
     (Family     : Parse_Value_Family;
      Input      : String;
      Normalized : String;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Consumed   : Natural := 0;
      Exact      : Boolean := True)
      renames Humanize.Parsing.Success_Labels.Parse_Success_Explanation_Label_Into;

end Humanize.Parsing.Implementation;
