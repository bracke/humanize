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

package Humanize.Parsing is

   type Parse_Error_Kind is
     (No_Parse_Error,
      Empty_Input,
      Expected_Number,
      Expected_Separator,
      Expected_Unit,
      Out_Of_Range,
      Unsupported_Form);

   type Byte_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Value  : Humanize.Bytes.Byte_Count := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Duration_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Value  : Humanize.Durations.Duration_Seconds := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Precise_Duration_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Value  : Humanize.Durations.Duration_Microseconds := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Number_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Value  : Long_Long_Integer := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Float_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Value  : Long_Float := 0.0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Currency_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Amount : Long_Float := 0.0;
      Code   : String (1 .. 16) := [others => ' '];
      Code_Length : Natural := 0;
      Kind   : Humanize.Numbers.Approximation_Kind := Humanize.Numbers.About;
      Approximate : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Change_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Value  : Long_Float := 0.0;
      Unit   : String (1 .. 32) := [others => ' '];
      Unit_Length : Natural := 0;
      Since  : String (1 .. 64) := [others => ' '];
      Since_Length : Natural := 0;
      Percent : Boolean := False;
      Points  : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Comparison_Direction is
     (Comparison_Equal,
      Comparison_Higher,
      Comparison_Lower,
      Comparison_Larger,
      Comparison_Smaller,
      Comparison_After,
      Comparison_Before);

   type Comparison_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Difference : Long_Float := 0.0;
      Direction  : Comparison_Direction := Comparison_Equal;
      Current_Label : String (1 .. 64) := [others => ' '];
      Current_Label_Length : Natural := 0;
      Baseline_Label : String (1 .. 64) := [others => ' '];
      Baseline_Label_Length : Natural := 0;
      Unit : String (1 .. 32) := [others => ' '];
      Unit_Length : Natural := 0;
      Percent : Boolean := False;
      Byte_Size : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Date_Comparison_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Years  : Natural := 0;
      Months : Natural := 0;
      Days   : Natural := 0;
      Direction : Comparison_Direction := Comparison_Equal;
      Current_Label : String (1 .. 64) := [others => ' '];
      Current_Label_Length : Natural := 0;
      Baseline_Label : String (1 .. 64) := [others => ' '];
      Baseline_Label_Length : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Palette_Contrast_Matrix_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Enhanced : Natural := 0;
      Normal : Natural := 0;
      Large_Only : Natural := 0;
      Fail : Natural := 0;
      Total : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Palette_Metadata_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Color_Count : Natural := 0;
      Pair_Count : Natural := 0;
      Enhanced : Natural := 0;
      Normal : Natural := 0;
      Large_Only : Natural := 0;
      Fail : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type APCA_Label_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Score  : Long_Float := 0.0;
      Strength : String (1 .. 32) := [others => ' '];
      Strength_Length : Natural := 0;
      Polarity : String (1 .. 48) := [others => ' '];
      Polarity_Length : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Color_Vision_Deficiency_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Deficiency : Humanize.Colors.Color_Vision_Deficiency :=
        Humanize.Colors.Protanopia;
      Risk : String (1 .. 32) := [others => ' '];
      Risk_Length : Natural := 0;
      Difference : Long_Float := 0.0;
      Has_Delta : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Color_Accessibility_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Contrast_Ratio : Long_Float := 0.0;
      Contrast_Level : String (1 .. 32) := [others => ' '];
      Contrast_Level_Length : Natural := 0;
      APCA : APCA_Label_Parse_Result;
      CVD  : Color_Vision_Deficiency_Parse_Result;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Color_Label_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Color  : Humanize.Colors.RGB_Color := (others => 0);
      Opacity : Long_Float := 1.0;
      Has_Opacity : Boolean := False;
      Is_Current : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Color_Model_Label_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      First  : Long_Float := 0.0;
      Second : Long_Float := 0.0;
      Third  : Long_Float := 0.0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Color_Bucket_Label_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Label : String (1 .. 48) := [others => ' '];
      Label_Length : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Color_Description_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Brightness : String (1 .. 32) := [others => ' '];
      Brightness_Length : Natural := 0;
      Saturation : String (1 .. 32) := [others => ' '];
      Saturation_Length : Natural := 0;
      Hue : String (1 .. 32) := [others => ' '];
      Hue_Length : Natural := 0;
      Temperature : String (1 .. 32) := [others => ' '];
      Temperature_Length : Natural := 0;
      Chroma : String (1 .. 32) := [others => ' '];
      Chroma_Length : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Palette_Summary_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Count : Natural := 0;
      Dominant_Color : String (1 .. 32) := [others => ' '];
      Dominant_Color_Length : Natural := 0;
      Spread : String (1 .. 48) := [others => ' '];
      Spread_Length : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Palette_Roles_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Background : Humanize.Colors.RGB_Color := (others => 0);
      Text_Color : Humanize.Colors.RGB_Color := (others => 0);
      Accent : Humanize.Colors.RGB_Color := (others => 0);
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Palette_Mood_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Tone : String (1 .. 32) := [others => ' '];
      Tone_Length : Natural := 0;
      Energy : String (1 .. 32) := [others => ' '];
      Energy_Length : Natural := 0;
      Temperature : String (1 .. 32) := [others => ' '];
      Temperature_Length : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Palette_Contrast_Suggestion_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Foreground : Humanize.Colors.RGB_Color := (others => 0);
      Background : Humanize.Colors.RGB_Color := (others => 0);
      Ratio : Long_Float := 0.0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Palette_Accessibility_Label_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Passing : Natural := 0;
      Total : Natural := 0;
      Normal_Text : Boolean := False;
      Large_Text_Only : Boolean := False;
      Has_Accessible_Pairs : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Color_Difference_Label_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Value : Long_Float := 0.0;
      Label : String (1 .. 48) := [others => ' '];
      Label_Length : Natural := 0;
      Perceptual : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Contrast_Remediation_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Recommended_Color : Humanize.Colors.RGB_Color := (others => 0);
      Has_Recommended_Color : Boolean := False;
      Ratio : Long_Float := 0.0;
      Target : String (1 .. 48) := [others => ' '];
      Target_Length : Natural := 0;
      Already_Passes : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Domain_Summary_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Domain : String (1 .. 32) := [others => ' '];
      Domain_Length : Natural := 0;
      State : String (1 .. 32) := [others => ' '];
      State_Length : Natural := 0;
      Completed : Natural := 0;
      Total : Natural := 0;
      Failed : Natural := 0;
      Unit : String (1 .. 32) := [others => ' '];
      Unit_Length : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Phrase_Severity_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Severity : Humanize.Phrases.Phrase_Severity :=
        Humanize.Phrases.Neutral_Severity;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Phrase_Tone_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Tone : Humanize.Phrases.Phrase_Tone := Humanize.Phrases.Neutral_Tone;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Phrase_Domain_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Domain : Humanize.Phrases.Summary_Domain :=
        Humanize.Phrases.Job_Domain;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Phrase_State_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      State : Humanize.Phrases.Summary_State :=
        Humanize.Phrases.Summary_Running;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Phrase_Key_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Prefix : String (1 .. 16) := [others => ' '];
      Prefix_Length : Natural := 0;
      Name : String (1 .. 64) := [others => ' '];
      Name_Length : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Phrase_Pack_Summary_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Pack_Count : Natural := 0;
      Has_Summaries : Boolean := False;
      Has_Comparisons : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Phrase_Locales_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Locale_Count : Natural := 0;
      Has_Generated_Locales : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Operational_Phrase_Domain is
     (Backup_Phrase_Domain,
      Incident_Phrase_Domain,
      Release_Phrase_Domain,
      Payment_Lifecycle_Phrase_Domain,
      Audit_Phrase_Domain,
      Feature_Flag_Phrase_Domain,
      Webhook_Phrase_Domain,
      API_Key_Phrase_Domain,
      Quota_Phrase_Domain,
      Invoice_Phrase_Domain,
      Database_Phrase_Domain);

   type Operational_Phrase_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Domain : Operational_Phrase_Domain := Backup_Phrase_Domain;
      Backup_Status : Humanize.Phrases.Backup_Status :=
        Humanize.Phrases.Backup_Running;
      Incident_Status : Humanize.Phrases.Incident_Status :=
        Humanize.Phrases.Incident_Investigating;
      Release_Status : Humanize.Phrases.Release_Status :=
        Humanize.Phrases.Release_Drafting;
      Payment_Lifecycle_Status : Humanize.Phrases.Payment_Lifecycle_Status :=
        Humanize.Phrases.Payment_Authorized;
      Audit_Status : Humanize.Phrases.Audit_Status :=
        Humanize.Phrases.Audit_Created;
      Feature_Flag_Status : Humanize.Phrases.Feature_Flag_Status :=
        Humanize.Phrases.Flag_Enabled;
      Webhook_Status : Humanize.Phrases.Webhook_Status :=
        Humanize.Phrases.Webhook_Pending;
      API_Key_Status : Humanize.Phrases.API_Key_Status :=
        Humanize.Phrases.API_Key_Active;
      Quota_Status : Humanize.Phrases.Quota_Status :=
        Humanize.Phrases.Quota_Available;
      Invoice_Status : Humanize.Phrases.Invoice_Status :=
        Humanize.Phrases.Invoice_Draft;
      Database_Status : Humanize.Phrases.Database_Status :=
        Humanize.Phrases.Database_Online;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Field_Change_Summary_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Total   : Natural := 0;
      Changed : Natural := 0;
      Added   : Natural := 0;
      Removed : Natural := 0;
      Unit : String (1 .. 32) := [others => ' '];
      Unit_Length : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Field_State_Change_Kind is
     (Field_State_Added,
      Field_State_Removed,
      Field_State_Unchanged);

   type Field_State_Summary_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Kind : Field_State_Change_Kind := Field_State_Added;
      Field : String (1 .. 64) := [others => ' '];
      Field_Length : Natural := 0;
      Value : String (1 .. 160) := [others => ' '];
      Value_Length : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Queue_Summary_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Queued : Natural := 0;
      Running : Natural := 0;
      Failed : Natural := 0;
      Completed : Natural := 0;
      Unit : String (1 .. 32) := [others => ' '];
      Unit_Length : Natural := 0;
      Empty : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Cache_Summary_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Hits : Natural := 0;
      Misses : Natural := 0;
      Hit_Rate : Natural := 0;
      Empty : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type File_Size_Summary_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      File_Count : Natural := 0;
      Total : Humanize.Bytes.Byte_Count := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Transfer_Remaining_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Remaining : Humanize.Bytes.Byte_Count := 0;
      Bytes_Per_Second : Humanize.Bytes.Byte_Count := 0;
      Has_Rate : Boolean := False;
      Complete : Boolean := False;
      Stalled : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Disk_Usage_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Used : Humanize.Bytes.Byte_Count := 0;
      Total : Humanize.Bytes.Byte_Count := 0;
      Percent_Used : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Validation_Severity_Label is
     (Parsed_Validation_Error,
      Parsed_Validation_Warning,
      Parsed_Validation_Info);

   type Validation_Summary_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Count  : Natural := 0;
      Severity : Validation_Severity_Label := Parsed_Validation_Error;
      Has_Details : Boolean := False;
      Details : String (1 .. 160) := [others => ' '];
      Details_Length : Natural := 0;
      Other_Count : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Field_Problem_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Field : String (1 .. 64) := [others => ' '];
      Field_Length : Natural := 0;
      Summary : Validation_Summary_Parse_Result;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Selection_Summary_Kind is
     (Selection_None,
      Selection_All,
      Selection_Partial);

   type Selection_Summary_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Kind : Selection_Summary_Kind := Selection_Partial;
      Selected : Natural := 0;
      Total : Natural := 0;
      Unit : String (1 .. 32) := [others => ' '];
      Unit_Length : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type More_Count_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Visible : Natural := 0;
      Remaining : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Pagination_Range_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      First : Natural := 0;
      Last : Natural := 0;
      Total : Natural := 0;
      Unit : String (1 .. 32) := [others => ' '];
      Unit_Length : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Collection_Display_Kind is
     (Collection_Compact,
      Collection_Summary,
      Collection_Screen_Reader);

   type Collection_Display_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Kind : Collection_Display_Kind := Collection_Summary;
      Visible : Natural := 0;
      Remaining : Natural := 0;
      Visible_Unit : String (1 .. 32) := [others => ' '];
      Visible_Unit_Length : Natural := 0;
      Remaining_Unit : String (1 .. 32) := [others => ' '];
      Remaining_Unit_Length : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Text_Count_Summary_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Count  : Natural := 0;
      Unit   : String (1 .. 32) := [others => ' '];
      Unit_Length : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Text_Time_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Minutes : Natural := 0;
      Less_Than : Boolean := False;
      Suffix : String (1 .. 16) := [others => ' '];
      Suffix_Length : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Text_Summary_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Words : Natural := 0;
      Sentences : Natural := 0;
      Paragraphs : Natural := 0;
      Reading_Minutes : Natural := 0;
      Reading_Less_Than : Boolean := False;
      Speaking_Minutes : Natural := 0;
      Speaking_Less_Than : Boolean := False;
      Code_Points : Natural := 0;
      Display_Width : Natural := 0;
      Has_Words : Boolean := False;
      Has_Sentences : Boolean := False;
      Has_Paragraphs : Boolean := False;
      Has_Reading_Time : Boolean := False;
      Has_Speaking_Time : Boolean := False;
      Has_Code_Points : Boolean := False;
      Has_Display_Width : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type String_Label_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Value : String (1 .. 160) := [others => ' '];
      Value_Length : Natural := 0;
      Word_Count : Natural := 0;
      Empty : Boolean := False;
      Has_Space : Boolean := False;
      Has_Dot : Boolean := False;
      Has_Path_Separator : Boolean := False;
      Path_Separator : Character := ASCII.NUL;
      Path_Separator_Count : Natural := 0;
      Has_At_Prefix : Boolean := False;
      Looks_Handle : Boolean := False;
      ASCII_Only : Boolean := True;
      Lowercase : Boolean := False;
      Uppercase : Boolean := False;
      Title_Case : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Initials_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Value : String (1 .. 32) := [others => ' '];
      Value_Length : Natural := 0;
      Initial_Count : Natural := 0;
      All_Uppercase : Boolean := False;
      Has_Digit : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Possessive_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Owner : String (1 .. 160) := [others => ' '];
      Owner_Length : Natural := 0;
      Apostrophe_Only : Boolean := False;
      Owner_Ends_With_S : Boolean := False;
      Owner_Word_Count : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Identifier_Label_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Value : String (1 .. 160) := [others => ' '];
      Value_Length : Natural := 0;
      Token_Count : Natural := 0;
      Separator : Character := ' ';
      Has_Separator : Boolean := False;
      Lowercase : Boolean := False;
      Camel_Case : Boolean := False;
      Natural_Sort_Key : Boolean := False;
      Numeric_Run_Count : Natural := 0;
      Leading_Separator : Boolean := False;
      Trailing_Separator : Boolean := False;
      Repeated_Separator : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Filename_Label_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Value : String (1 .. 160) := [others => ' '];
      Value_Length : Natural := 0;
      Stem_Length : Natural := 0;
      Has_Extension : Boolean := False;
      Extension : String (1 .. 32) := [others => ' '];
      Extension_Length : Natural := 0;
      Hidden : Boolean := False;
      Looks_Safe : Boolean := False;
      Extension_Lowercase : Boolean := False;
      Extension_Uppercase : Boolean := False;
      Reserved_Name : Boolean := False;
      Separator : Character := ASCII.NUL;
      Separator_Count : Natural := 0;
      Extension_Preserved : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type File_Mode_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Mode : Humanize.Strings.File_Mode_Value := 0;
      Kind : Humanize.Strings.File_Mode_Kind := Humanize.Strings.Mode_Only;
      Symbolic : Boolean := False;
      Octal : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Email_Local_Part_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Value : String (1 .. 160) := [others => ' '];
      Value_Length : Natural := 0;
      Empty : Boolean := False;
      Segment_Count : Natural := 0;
      Has_Dot : Boolean := False;
      Looks_Local_Part : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Cleanup_Label_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Value : String (1 .. 160) := [others => ' '];
      Value_Length : Natural := 0;
      Empty : Boolean := False;
      Entity_Count : Natural := 0;
      Break_Count : Natural := 0;
      Line_Feed_Count : Natural := 0;
      Whitespace_Run_Count : Natural := 0;
      Tag_Like_Count : Natural := 0;
      Separator : Character := ASCII.NUL;
      Separator_Count : Natural := 0;
      Repeated_Separator : Boolean := False;
      Leading_Separator : Boolean := False;
      Trailing_Separator : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Mask_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Masked_Count : Natural := 0;
      Visible_Count : Natural := 0;
      Mask_Char : Character := '*';
      Visible_Tail : String (1 .. 80) := [others => ' '];
      Visible_Tail_Length : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Grouped_Token_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Group_Count : Natural := 0;
      Token_Length : Natural := 0;
      Separator : Character := '-';
      Has_Separator : Boolean := False;
      Normalized : String (1 .. 160) := [others => ' '];
      Normalized_Length : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Highlight_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Match_Count : Natural := 0;
      Has_Markers : Boolean := False;
      Text_Length : Natural := 0;
      Before_Length : Natural := 0;
      After_Length : Natural := 0;
      Unbalanced_Markers : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Excerpt_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Starts_With_Ellipsis : Boolean := False;
      Ends_With_Ellipsis : Boolean := False;
      Ellipsis_Length : Natural := 0;
      Ellipsis_Count : Natural := 0;
      Has_Inner_Ellipsis : Boolean := False;
      Content : String (1 .. 160) := [others => ' '];
      Content_Length : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Person_List_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Visible_Count : Natural := 0;
      Other_Count : Natural := 0;
      Empty : Boolean := False;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Inflection_Source_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Source : Humanize.Strings.Inflection_Source :=
        Humanize.Strings.Unchanged_Inflection;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Duration_Range_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Low    : Humanize.Durations.Duration_Seconds := 0;
      High   : Humanize.Durations.Duration_Seconds := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Number_Range_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Low    : Long_Long_Integer := 0;
      High   : Long_Long_Integer := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Decimal_Range_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Low    : Long_Float := 0.0;
      High   : Long_Float := 0.0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Uncertainty_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Value  : Long_Float := 0.0;
      Uncertainty : Long_Float := 0.0;
      Low    : Long_Float := 0.0;
      High   : Long_Float := 0.0;
      Style  : Humanize.Numbers.Uncertainty_Style :=
        Humanize.Numbers.Plus_Minus_Uncertainty;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Proportion_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Count  : Natural := 0;
      Total  : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Frequency_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Count  : Humanize.Frequencies.Occurrence_Count := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Rate_Parse_Result is record
      Status    : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Count     : Humanize.Frequencies.Occurrence_Count := 0;
      Period    : Humanize.Rates.Rate_Period := Humanize.Rates.Per_Second;
      Less_Than : Boolean := False;
      Exact     : Boolean := False;
      Consumed  : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type List_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Count  : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Counted_Noun_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Count  : Natural := 0;
      Noun   : String (1 .. 64) := [others => ' '];
      Noun_Length : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Unit_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Value  : Long_Float := 0.0;
      Unit   : Humanize.Units.Unit_Kind := Humanize.Units.Meter;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Aspect_Ratio_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Width  : Natural := 0;
      Height : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Compound_Unit_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Value  : Long_Float := 0.0;
      Unit   : String (1 .. 16) := [others => ' '];
      Unit_Length : Natural := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Date_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Value  : Ada.Calendar.Time := Ada.Calendar.Clock;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Date_Range_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Low    : Ada.Calendar.Time := Ada.Calendar.Clock;
      High   : Ada.Calendar.Time := Ada.Calendar.Clock;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Business_Calendar_Parse_Kind is
     (Business_One_Off_Holiday,
      Business_Recurring_Holiday,
      Business_Half_Day,
      Business_Shutdown,
      Business_Hour_Range,
      Business_Next_Open_Hour);

   type Business_Calendar_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Kind   : Business_Calendar_Parse_Kind := Business_One_Off_Holiday;
      Date   : Ada.Calendar.Time := Ada.Calendar.Clock;
      End_Date : Ada.Calendar.Time := Ada.Calendar.Clock;
      Month  : Ada.Calendar.Month_Number := 1;
      Day    : Ada.Calendar.Day_Number := 1;
      Weekday : Natural range 0 .. 7 := 0;
      Start_Hour : Natural range 0 .. 24 := 0;
      End_Hour   : Natural range 0 .. 24 := 0;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Business_Calendar_Rules_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Rules  : Humanize.Durations.Business_Calendar_Rules;
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   type Recurrence_Parse_Kind is
     (Recurrence_Interval,
      Recurrence_Weekday,
      Recurrence_Weekday_Set,
      Recurrence_Ordinal_Weekday,
      Recurrence_Business_Day);

   type Recurrence_Parse_Result is record
      Status : Humanize.Status.Status_Code := Humanize.Status.Internal_Error;
      Kind   : Recurrence_Parse_Kind := Recurrence_Interval;
      Every  : Positive := 1;
      Unit   : Humanize.Durations.Recurrence_Unit :=
        Humanize.Durations.Every_Day;
      Weekday : Natural range 0 .. 7 := 0;
      Weekdays : Humanize.Durations.Weekday_Set :=
        Humanize.Durations.Every_Day_Set;
      Ordinal : Integer range -1 .. 5 := 0;
      Day_Of_Month : Natural range 0 .. 31 := 0;
      Month_Of_Year : Natural range 0 .. 12 := 0;
      Has_Second : Boolean := False;
      Second     : Natural range 0 .. 59 := 0;
      Has_Year   : Boolean := False;
      Year       : Natural := 0;
      Is_Last_Day_Of_Month : Boolean := False;
      Is_Nearest_Weekday   : Boolean := False;
      Is_Last_Weekday      : Boolean := False;
      Nth_Weekday          : Natural range 0 .. 5 := 0;
      Has_Time : Boolean := False;
      Hour     : Natural range 0 .. 23 := 0;
      Minute   : Natural range 0 .. 59 := 0;
      Has_Start_Date : Boolean := False;
      Start_Date     : Ada.Calendar.Time := Ada.Calendar.Clock;
      Has_End_Date   : Boolean := False;
      End_Date       : Ada.Calendar.Time := Ada.Calendar.Clock;
      Has_Occurrences : Boolean := False;
      Occurrences     : Natural := 0;
      Has_Time_Window : Boolean := False;
      Window_Start_Hour   : Natural range 0 .. 23 := 0;
      Window_Start_Minute : Natural range 0 .. 59 := 0;
      Window_End_Hour     : Natural range 0 .. 23 := 0;
      Window_End_Minute   : Natural range 0 .. 59 := 0;
      Has_Excluded_Weekdays : Boolean := False;
      Excluded_Weekdays : Humanize.Durations.Weekday_Set :=
        [others => False];
      Exact  : Boolean := False;
      Consumed : Natural := 0;
      Error_Position : Natural := 0;
      Error : Parse_Error_Kind := No_Parse_Error;
   end record;

   function Parse_Bytes
     (Text : String)
      return Byte_Parse_Result;
   --  @param Text Byte-size text such as "1.5 KiB", "2 MB", or "999 bytes".
   --  @return Parsed byte count, rounded to the nearest byte.

   function Normalize_Number_Text
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Number-like text with grouping spaces/underscores/commas.
   --  @return Locale-neutral normalized number text.

   function Normalize_Unit_Text
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Unit-like text with case and whitespace variations.
   --  @return Lowercase normalized unit text.

   function Normalize_List_Text
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text Human-readable list text.
   --  @return List text with whitespace and common localized conjunctions normalized.

   procedure Normalize_Number_Text_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Number-like text with grouping spaces/underscores/commas.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Normalize_Unit_Text_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Unit-like text with case and whitespace variations.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Normalize_List_Text_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text Human-readable list text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function Diagnostic
     (Status         : Humanize.Status.Status_Code;
      Error_Position : Natural)
      return Parse_Error_Kind;
   --  @param Status Parser status.
   --  @param Error_Position Parser error position.
   --  @return Stable parser diagnostic category.

   function Diagnostic
     (Status         : Humanize.Status.Status_Code;
      Error_Position : Natural;
      Error          : Parse_Error_Kind)
      return Parse_Error_Kind;
   --  @param Status Parser status.
   --  @param Error_Position Parser error position.
   --  @param Error Parser-supplied diagnostic category when available.
   --  @return Parser-supplied category, or a stable fallback category.

   function Diagnostic_Label
     (Kind : Parse_Error_Kind)
      return Humanize.Status.Text_Result;
   --  @param Kind Stable parser diagnostic category.
   --  @return Lowercase diagnostic label.

   procedure Diagnostic_Label_Into
     (Kind    : Parse_Error_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Kind Stable parser diagnostic category.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function Diagnostic_Message
     (Kind           : Parse_Error_Kind;
      Error_Position : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Kind Stable parser diagnostic category.
   --  @param Error_Position Optional 1-based input position.
   --  @return Short deterministic parser diagnostic message.

   procedure Diagnostic_Message_Into
     (Kind           : Parse_Error_Kind;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Error_Position : Natural := 0);
   --  @param Kind Stable parser diagnostic category.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Error_Position Optional 1-based input position.

   function Scan_Bytes
     (Text : String)
      return Byte_Parse_Result;
   --  @param Text Text beginning with a byte-size expression.
   --  @return Parsed byte count and consumed prefix length.

   function Parse_Duration
     (Text : String)
      return Duration_Parse_Result;
   --  @param Text Duration text such as "2 hours, 30 minutes" or ISO 8601
   --    duration text such as "PT1H30M" and "P2W".
   --  @return Parsed duration in seconds.

   function Scan_Duration
     (Text : String)
      return Duration_Parse_Result;
   --  @param Text Text beginning with a duration expression.
   --  @return Parsed duration and consumed prefix length.

   function Parse_Lenient_Duration
     (Text : String)
      return Duration_Parse_Result;
   --  @param Text Duration text with common aliases such as "~1.5h".
   --  @return Parsed duration in seconds.

   function Scan_Lenient_Duration
     (Text : String)
      return Duration_Parse_Result;
   --  @param Text Text beginning with a lenient duration expression.
   --  @return Parsed duration and consumed prefix length.

   function Parse_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Parse_Result;
   --  @param Reference Calendar instant used for relative date phrases.
   --  @param Text Date phrase such as "today", "in 3 days", "next friday",
   --    "next friday afternoon", "second tuesday in march",
   --    "two fridays from now", "jan 1st", "monday the 3rd",
   --    "end of next quarter", "end of fy2027", "start of q3",
   --    "week 32", ISO dates such as "2024-02-29", "2024-060",
   --    and "2024-W09-4", "3 business days from now", or
   --    "2 business days before month end".
   --  @return Parsed calendar date.

   function Parse_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Parse_Result;
   --  @param Reference Calendar instant used for relative date phrases.
   --  @param Text Natural date phrase.
   --  @param Rules Business-calendar rules for business-day phrases.
   --  @return Parsed calendar date.

   function Scan_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Parse_Result;
   --  @param Reference Calendar instant used for relative date phrases.
   --  @param Text Text beginning with a natural date phrase.
   --  @return Parsed date and consumed prefix length.

   function Scan_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Parse_Result;
   --  @param Reference Calendar instant used for relative date phrases.
   --  @param Text Text beginning with a natural date phrase.
   --  @param Rules Business-calendar rules for business-day phrases.
   --  @return Parsed date and consumed prefix length.

   function Parse_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Range_Parse_Result;
   --  @param Reference Calendar instant used for relative date range phrases.
   --  @param Text Range phrase such as "this week", "next 2 weeks",
   --    "q3 2024", "late q2", "early next week", "mid-march",
   --    "fy2025 q2", "fy2027 h1", "first half of 2026",
   --    "s2 2026", "h2 2026", "week 32", or ISO week labels such as
   --    "2024-W09".
   --  @return Parsed start and end dates as date-start calendar instants.

   function Parse_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Range_Parse_Result;
   --  @param Reference Calendar instant used for relative date range phrases.
   --  @param Text Natural date range phrase.
   --  @param Rules Business-calendar rules for nested business-day phrases.
   --  @return Parsed start and end dates as date-start calendar instants.

   function Scan_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Range_Parse_Result;
   --  @param Reference Calendar instant used for relative date range phrases.
   --  @param Text Text beginning with a natural date range phrase.
   --  @return Parsed date range and consumed prefix length.

   function Scan_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Range_Parse_Result;
   --  @param Reference Calendar instant used for relative date range phrases.
   --  @param Text Text beginning with a natural date range phrase.
   --  @param Rules Business-calendar rules for nested business-day phrases.
   --  @return Parsed date range and consumed prefix length.

   function Parse_Business_Calendar
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Parse_Result;
   --  @param Reference Calendar instant used for relative date phrases and
   --    next-open-hour calculations.
   --  @param Text Business-calendar phrase such as "holiday 2026-07-06",
   --    "recurring holiday december 25", "half-day 2026-12-24 until 12",
   --    "shutdown 2026-12-24 to 2026-12-31", "business hours monday 9-17",
   --    or "next open business hour".
   --  @return Parsed business-calendar item metadata.

   function Scan_Business_Calendar
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Parse_Result;
   --  @param Reference Calendar instant used for relative date phrases and
   --    next-open-hour calculations.
   --  @param Text Text beginning with a business-calendar phrase.
   --  @return Parsed business-calendar metadata and consumed prefix length.

   function Apply_Business_Calendar_Rule
     (Rules : in out Humanize.Durations.Business_Calendar_Rules;
      Rule  : Business_Calendar_Parse_Result)
      return Humanize.Status.Status_Code;
   --  @param Rules Business calendar rule set to update.
   --  @param Rule Parsed business-calendar phrase.
   --  @return Ok, Invalid_Argument, Invalid_Value, or Buffer_Overflow.

   function Parse_Business_Calendar_Rules
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Rules_Parse_Result;
   --  @param Reference Calendar instant used for relative rule dates.
   --  @param Text Semicolon or newline separated business-calendar phrases.
   --  @return Executable business calendar rule set.

   function Parse_Duration_Range
     (Text : String)
      return Duration_Range_Parse_Result;
   --  @param Text Duration range such as "1 hour-2 hours".
   --  @return Parsed lower and upper duration bounds.

   function Scan_Duration_Range
     (Text : String)
      return Duration_Range_Parse_Result;
   --  @param Text Text beginning with a duration range.
   --  @return Parsed range and consumed prefix length.

   function Parse_Countdown
     (Text : String)
      return Duration_Parse_Result;
   --  @param Text Countdown text such as "1 minute remaining".
   --  @return Parsed remaining duration.

   function Parse_SLA_Window
     (Text : String)
      return Duration_Parse_Result;
   --  @param Text SLA text such as "within 1 day".
   --  @return Parsed SLA window duration.

   function Parse_Age
     (Text : String)
      return Duration_Parse_Result;
   --  @param Text Age text such as "3 days old".
   --  @return Parsed age duration.

   function Parse_Modified_Ago
     (Text : String)
      return Duration_Parse_Result;
   --  @param Text Freshness text such as "modified 2 hours ago".
   --  @return Parsed elapsed duration.

   function Parse_Progress
     (Text : String)
      return Proportion_Parse_Result;
   --  @param Text Progress text such as "3 of 10 complete".
   --  @return Parsed completed and total counts.

   function Parse_Result_Count
     (Text : String)
      return List_Parse_Result;
   --  @param Text Result summary such as "no results" or "24 results".
   --  @return Parsed result count.

   function Parse_Counted_Noun
     (Text : String)
      return Counted_Noun_Parse_Result;
   --  @param Text Counted noun phrase such as "no files", "a file", or "1.2K files".
   --  @return Parsed count and noun text.

   function Scan_Counted_Noun
     (Text : String)
      return Counted_Noun_Parse_Result;
   --  @param Text Text beginning with a counted noun phrase.
   --  @return Parsed count, noun text, and consumed prefix length.

   function Parse_Showing_Count
     (Text : String)
      return Proportion_Parse_Result;
   --  @param Text Summary such as "showing 20 of 153 results".
   --  @return Parsed shown and total counts.

   function Parse_Page_Count
     (Text : String)
      return Proportion_Parse_Result;
   --  @param Text Page summary such as "page 2 of 8".
   --  @return Parsed page and total page counts.

   function Parse_ETA
     (Text : String)
      return Duration_Parse_Result;
   --  @param Text ETA phrase such as "ETA 5 minutes".
   --  @return Parsed ETA duration.

   function Scan_ETA
     (Text : String)
      return Duration_Parse_Result;
   --  @param Text Text beginning with an ETA phrase.
   --  @return Parsed ETA duration and consumed prefix length.

   function Parse_Retry_In
     (Text : String)
      return Duration_Parse_Result;
   --  @param Text Retry phrase such as "retrying in 10 seconds".
   --  @return Parsed retry delay.

   function Scan_Retry_In
     (Text : String)
      return Duration_Parse_Result;
   --  @param Text Text beginning with a retry phrase.
   --  @return Parsed retry delay and consumed prefix length.

   function Parse_Step_Count
     (Text : String)
      return Proportion_Parse_Result;
   --  @param Text Step phrase such as "step 2 of 5".
   --  @return Parsed step and total count.

   function Scan_Step_Count
     (Text : String)
      return Proportion_Parse_Result;
   --  @param Text Text beginning with a step-count phrase.
   --  @return Parsed step and total count with consumed prefix length.

   function Parse_Attempt_Count
     (Text : String)
      return Proportion_Parse_Result;
   --  @param Text Attempt phrase such as "attempt 2 of 3".
   --  @return Parsed attempt and total count.

   function Scan_Attempt_Count
     (Text : String)
      return Proportion_Parse_Result;
   --  @param Text Text beginning with an attempt-count phrase.
   --  @return Parsed attempt and total count with consumed prefix length.

   function Parse_Business_Days
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Business-day phrase such as "3 business days".
   --  @return Parsed business-day count.

   function Scan_Business_Days
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Text beginning with a business-day phrase.
   --  @return Parsed business-day count and consumed prefix length.

   function Parse_Working_Hours
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Working-hour phrase such as "8 working hours".
   --  @return Parsed working-hour count.

   function Scan_Working_Hours
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Text beginning with a working-hour phrase.
   --  @return Parsed working-hour count and consumed prefix length.

   function Parse_Recurrence
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Recurrence phrase such as "every 2 days".
   --  @return Parsed recurrence interval count.

   function Parse_Recurrence_Detail
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Recurrence_Parse_Result;
   --  @param Reference Calendar instant used for relative recurrence dates.
   --  @param Text Recurrence phrase such as "every other Tuesday",
   --    "first Monday of each month", or "every 2 weeks until 2026-12-31".
   --  @return Parsed structured recurrence metadata.

   function Parse_Cron_Schedule
     (Text : String)
      return Recurrence_Parse_Result;
   --  @param Text Five-field cron expression such as "0 9 * * 1-5".
   --  @return Parsed structured schedule metadata for common cron forms.

   function Scan_Cron_Schedule
     (Text : String)
      return Recurrence_Parse_Result;
   --  @param Text Text beginning with a cron or rendered schedule phrase.
   --  @return Parsed schedule metadata and consumed prefix length.

   function Scan_Recurrence
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Text beginning with a recurrence phrase.
   --  @return Parsed recurrence interval count and consumed prefix length.

   function Scan_Recurrence_Detail
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Recurrence_Parse_Result;
   --  @param Reference Calendar instant used for relative recurrence dates.
   --  @param Text Text beginning with a recurrence phrase.
   --  @return Parsed recurrence metadata and consumed prefix length.

   function Parse_Throughput_Remaining
     (Text : String)
      return Proportion_Parse_Result;
   --  @param Text Throughput phrase such as "120 items remaining at 4 item/s".
   --  @return Parsed remaining count and rate.

   function Scan_Throughput_Remaining
     (Text : String)
      return Proportion_Parse_Result;
   --  @param Text Text beginning with a throughput phrase.
   --  @return Parsed remaining count and rate with consumed prefix length.

   function Parse_Progress_Bar
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Progress bar phrase such as "[###-------] 30%".
   --  @return Parsed percentage.

   function Scan_Progress_Bar
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Text beginning with a progress bar phrase.
   --  @return Parsed percentage and consumed prefix length.

   function Parse_Precise_Duration
     (Text : String)
      return Precise_Duration_Parse_Result;
   --  @param Text Duration text such as "1 second and 500 milliseconds" or
   --    ISO 8601 duration text such as "PT1.5S".
   --  @return Parsed duration in microseconds.

   function Scan_Precise_Duration
     (Text : String)
      return Precise_Duration_Parse_Result;
   --  @param Text Text beginning with a precise duration expression.
   --  @return Parsed precise duration and consumed prefix length.

   function Parse_Compact_Number
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Compact number text such as "1.2K", "3 million",
   --    or shipped-locale compact suffixes.
   --  @return Parsed whole number, rounded to the nearest integer.

   function Parse_Cardinal
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Numeric or small English cardinal words such as "twenty one".
   --  @return Parsed cardinal value.

   function Scan_Cardinal
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Text beginning with a cardinal expression.
   --  @return Parsed cardinal value and consumed prefix length.

   function Parse_Scientific_Number
     (Text : String)
      return Float_Parse_Result;
   --  @param Text Scientific or engineering notation such as "1.23e6".
   --  @return Parsed floating-point value.

   function Scan_Scientific_Number
     (Text : String)
      return Float_Parse_Result;
   --  @param Text Text beginning with scientific notation.
   --  @return Parsed value and consumed prefix length.

   function Parse_Currency
     (Text : String)
      return Currency_Parse_Result;
   --  @param Text Currency text such as "12.50 USD".
   --  @return Parsed amount and currency code/symbol.

   function Scan_Currency
     (Text : String)
      return Currency_Parse_Result;
   --  @param Text Text beginning with a currency expression.
   --  @return Parsed currency expression and consumed prefix length.

   function Parse_Approximate_Currency
     (Text : String)
      return Currency_Parse_Result;
   --  @param Text Approximate currency such as "about 12.50 USD".
   --  @return Parsed approximation kind, amount, and code.

   function Scan_Approximate_Currency
     (Text : String)
      return Currency_Parse_Result;
   --  @param Text Text beginning with an approximate currency expression.
   --  @return Parsed approximate currency and consumed prefix length.

   function Parse_Approximate_Number
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Approximate number such as "about 42" or "under 10".
   --  @return Parsed target number.

   function Parse_Editorial_Number
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Editorial number text such as "seven", "1,200", or "42%".
   --  @return Parsed editorial integer value, with percent sign accepted.

   function Parse_Currency_Words
     (Text : String)
      return Currency_Parse_Result;
   --  @param Text Worded currency such as "twelve dollars and fifty cents".
   --  @return Parsed amount and major-unit label.

   function Scan_Approximate_Number
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Text beginning with an approximate number expression.
   --  @return Parsed target number and consumed prefix length.

   function Parse_Change
     (Text : String)
      return Change_Parse_Result;
   --  @param Text Change phrase such as "up 4", "-2", or "5 fewer errors".
   --  @return Parsed signed change value and optional unit/since metadata.

   function Scan_Change
     (Text : String)
      return Change_Parse_Result;
   --  @param Text Text beginning with a change phrase.
   --  @return Parsed change and consumed prefix length.

   function Parse_Number_Comparison
     (Text : String)
      return Comparison_Parse_Result;
   --  @param Text Number comparison such as "value is 3 higher than baseline".
   --  @return Parsed labels, direction, difference, and optional unit.

   function Parse_Percent_Comparison
     (Text : String)
      return Comparison_Parse_Result;
   --  @param Text Percent comparison such as "value is 12% lower than baseline".
   --  @return Parsed labels, direction, and percent difference.

   function Parse_File_Size_Comparison
     (Text : String)
      return Comparison_Parse_Result;
   --  @param Text File-size comparison such as "file is 1 KiB larger than old".
   --  @return Parsed labels, direction, and byte difference.

   function Parse_Date_Comparison
     (Text : String)
      return Date_Comparison_Parse_Result;
   --  @param Text Date comparison such as "updated is 3 days before release".
   --  @return Parsed labels, before/after/equal direction, and date components.

   function Scan_Date_Comparison
     (Text : String)
      return Date_Comparison_Parse_Result;
   --  @param Text Text beginning with a deterministic date comparison.
   --  @return Parsed date comparison and consumed prefix length.

   function Parse_Palette_Contrast_Matrix
     (Text : String)
      return Palette_Contrast_Matrix_Parse_Result;
   --  @param Text Palette contrast matrix label.
   --  @return Parsed enhanced/normal/large-only/fail counts.

   function Parse_Palette_Metadata_Label
     (Text : String)
      return Palette_Metadata_Parse_Result;
   --  @param Text Palette metadata label emitted by Humanize.Colors.
   --  @return Parsed color count, pair count, and contrast buckets.

   function Parse_APCA_Contrast_Label
     (Text : String)
      return APCA_Label_Parse_Result;
   --  @param Text APCA label such as "Lc 100, excellent, dark text on light background".
   --  @return Parsed score, strength, and polarity.

   function Parse_Color_Vision_Deficiency_Label
     (Text : String)
      return Color_Vision_Deficiency_Parse_Result;
   --  @param Text CVD risk label such as "deuteranopia low confusion risk, delta 33".
   --  @return Parsed deficiency, risk, and optional delta.

   function Parse_Color_Accessibility_Summary
     (Text : String)
      return Color_Accessibility_Parse_Result;
   --  @param Text Combined contrast/APCA/CVD accessibility summary.
   --  @return Parsed WCAG contrast, APCA, and CVD summary metadata.

   function Parse_Alpha_Contrast_Label
     (Text : String)
      return Color_Difference_Label_Parse_Result;
   --  @param Text Alpha contrast label emitted by Humanize.Colors.
   --  @return Parsed contrast ratio and level after alpha compositing.

   function Parse_Contrast_Remediation_Label
     (Text : String)
      return Contrast_Remediation_Parse_Result;
   --  @param Text Contrast remediation label emitted by Humanize.Colors.
   --  @return Parsed suggested color, ratio, target, and pass metadata.

   function Parse_RGB_Label
     (Text : String)
      return Color_Label_Parse_Result;
   --  @param Text RGB label such as "rgb(51, 102, 153)".
   --  @return Parsed RGB channels.

   function Parse_RGBA_Label
     (Text : String)
      return Color_Label_Parse_Result;
   --  @param Text RGBA label such as "rgba(51, 102, 153, 0.5)".
   --  @return Parsed RGB channels and opacity.

   function Parse_CSS_Color_Label
     (Text : String)
      return Color_Label_Parse_Result;
   --  @param Text Normalized CSS color label or "currentColor".
   --  @return Parsed CSS color label metadata.

   function Parse_Color_Summary
     (Text : String)
      return Color_Label_Parse_Result;
   --  @param Text Color summary such as "#336699 rgb(51, 102, 153)".
   --  @return Parsed summary color.

   function Parse_HSL_Label
     (Text : String)
      return Color_Model_Label_Parse_Result;
   --  @param Text HSL label such as "hsl(210, 50%, 40%)".
   --  @return Parsed hue, saturation percent, and lightness percent.

   function Parse_HSV_Label
     (Text : String)
      return Color_Model_Label_Parse_Result;
   --  @param Text HSV label such as "hsv(210, 67%, 60%)".
   --  @return Parsed hue, saturation percent, and value percent.

   function Parse_Color_Bucket_Label
     (Text : String)
      return Color_Bucket_Label_Parse_Result;
   --  @param Text Deterministic color bucket label.
   --  @return Parsed bucket label.

   function Parse_Color_Description
     (Text : String)
      return Color_Description_Parse_Result;
   --  @param Text Combined color description.
   --  @return Parsed brightness, saturation, hue, temperature, and chroma labels.

   function Parse_Opacity_Label
     (Text : String)
      return Color_Difference_Label_Parse_Result;
   --  @param Text Opacity label such as "50% translucent".
   --  @return Parsed percent value and opacity bucket label.

   function Parse_Palette_Summary
     (Text : String)
      return Palette_Summary_Parse_Result;
   --  @param Text Palette summary such as "3 colors, mostly blue, high contrast spread".
   --  @return Parsed count, dominant color, and spread label.

   function Parse_Palette_Roles
     (Text : String)
      return Palette_Roles_Parse_Result;
   --  @param Text Palette roles such as "background #FFFFFF, text #000000, accent #336699".
   --  @return Parsed role colors.

   function Parse_Palette_Harmony_Label
     (Text : String)
      return Color_Bucket_Label_Parse_Result;
   --  @param Text Palette harmony label such as "complementary palette".
   --  @return Parsed harmony label.

   function Parse_Palette_Contrast_Suggestion
     (Text : String)
      return Palette_Contrast_Suggestion_Parse_Result;
   --  @param Text Best-contrast suggestion label.
   --  @return Parsed foreground, background, and contrast ratio.

   function Parse_Palette_Accessibility_Label
     (Text : String)
      return Palette_Accessibility_Label_Parse_Result;
   --  @param Text Palette accessibility label.
   --  @return Parsed pass counts and accessibility class.

   function Parse_Palette_Mood_Label
     (Text : String)
      return Palette_Mood_Parse_Result;
   --  @param Text Palette mood label such as "dark, subtle, cool mood".
   --  @return Parsed mood tone, energy, and temperature.

   function Parse_Advanced_Palette_Summary
     (Text : String)
      return Palette_Mood_Parse_Result;
   --  @param Text Advanced palette summary.
   --  @return Parsed mood fields from the combined summary.

   function Parse_Color_Difference_Label
     (Text : String)
      return Color_Difference_Label_Parse_Result;
   --  @param Text RGB difference label such as "12% noticeable difference".
   --  @return Parsed percent and difference label.

   function Parse_Perceptual_Difference_Label
     (Text : String)
      return Color_Difference_Label_Parse_Result;
   --  @param Text OKLab difference label.
   --  @return Parsed delta and perceptual difference label.

   function Parse_Domain_Summary
     (Text : String)
      return Domain_Summary_Parse_Result;
   --  @param Text Domain summary such as "job running: 3 of 10 tasks complete".
   --  @return Parsed domain, state, completion, failure, and unit metadata.

   function Parse_Phrase_Severity_Label
     (Text : String)
      return Phrase_Severity_Parse_Result;
   --  @param Text Phrase severity label such as "danger".
   --  @return Parsed phrase severity metadata.

   function Parse_Phrase_Tone_Label
     (Text : String)
      return Phrase_Tone_Parse_Result;
   --  @param Text Phrase tone label such as "critical".
   --  @return Parsed phrase tone metadata.

   function Parse_Phrase_Domain_Label
     (Text : String)
      return Phrase_Domain_Parse_Result;
   --  @param Text Summary domain label such as "sync".
   --  @return Parsed summary domain metadata.

   function Parse_Phrase_State_Label
     (Text : String)
      return Phrase_State_Parse_Result;
   --  @param Text Summary state label such as "running".
   --  @return Parsed summary state metadata.

   function Parse_Phrase_Key
     (Text : String)
      return Phrase_Key_Parse_Result;
   --  @param Text Stable phrase key such as "ci.pipeline_failed".
   --  @return Parsed phrase key prefix and name.

   function Parse_Phrase_Pack_Summary
     (Text : String)
      return Phrase_Pack_Summary_Parse_Result;
   --  @param Text Phrase pack summary emitted by Humanize.Phrases.
   --  @return Parsed phrase pack count and feature flags.

   function Parse_Supported_Phrase_Locales
     (Text : String)
      return Phrase_Locales_Parse_Result;
   --  @param Text Supported phrase locale list emitted by Humanize.Phrases.
   --  @return Parsed locale count and generated-locale flag.

   function Parse_Operational_Phrase
     (Text : String)
      return Operational_Phrase_Parse_Result;
   --  @param Text Operational phrase text (for example, "backup stale").
   --  @return Parsed operational phrase domain and status metadata.

   function Parse_Field_Change_Summary
     (Text : String)
      return Field_Change_Summary_Parse_Result;
   --  @param Text Field change summary emitted by Humanize.Phrases.
   --  @return Parsed total, changed, added, removed, and unit metadata.

   function Parse_Field_State_Summary
     (Text : String)
      return Field_State_Summary_Parse_Result;
   --  @param Text Field added/removed/unchanged summary.
   --  @return Parsed field state-change kind, field, and value labels.

   function Parse_Sync_Summary
     (Text : String)
      return Domain_Summary_Parse_Result;
   --  @param Text Sync summary such as "sync running: 8 of 10 items complete".
   --  @return Parsed sync progress metadata.

   function Parse_Import_Summary
     (Text : String)
      return Domain_Summary_Parse_Result;
   --  @param Text Import summary such as "import running: 1 of 1 record complete".
   --  @return Parsed import progress metadata.

   function Parse_Export_Summary
     (Text : String)
      return Domain_Summary_Parse_Result;
   --  @param Text Export summary such as "export running: no files".
   --  @return Parsed export progress metadata.

   function Parse_Queue_Summary
     (Text : String)
      return Queue_Summary_Parse_Result;
   --  @param Text Queue summary such as "queue: 5 jobs queued, 2 running".
   --  @return Parsed queue counts and optional unit metadata.

   function Parse_Cache_Summary
     (Text : String)
      return Cache_Summary_Parse_Result;
   --  @param Text Cache summary such as "cache: 8 hits, 2 misses, 80% hit rate".
   --  @return Parsed cache hit/miss/rate metadata.

   function Parse_File_Size_Summary
     (Text : String)
      return File_Size_Summary_Parse_Result;
   --  @param Text File-size summary such as "3 files, 1.5 KiB".
   --  @return Parsed file count and byte total.

   function Parse_Transfer_Remaining
     (Text : String)
      return Transfer_Remaining_Parse_Result;
   --  @param Text Transfer label such as "2 MB remaining at 1 kB/s".
   --  @return Parsed remaining bytes, optional rate, stalled/complete flags.

   function Parse_Disk_Usage
     (Text : String)
      return Disk_Usage_Parse_Result;
   --  @param Text Disk usage label such as "1.5 kB of 10 kB used (15%)".
   --  @return Parsed used bytes, total bytes, and percentage.

   function Parse_Validation_Summary
     (Text : String)
      return Validation_Summary_Parse_Result;
   --  @param Text Validation summary such as "2 errors: email and password".
   --  @return Parsed validation count, severity, details, and hidden count.

   function Parse_Field_Problem_Summary
     (Text : String)
      return Field_Problem_Parse_Result;
   --  @param Text Field-prefixed validation summary such as "email: 1 error".
   --  @return Parsed field label and nested validation summary metadata.

   function Parse_Selection_Summary
     (Text : String)
      return Selection_Summary_Parse_Result;
   --  @param Text Selection summary such as "3 of 5 items selected".
   --  @return Parsed none/all/partial selection metadata.

   function Parse_More_Count
     (Text : String)
      return More_Count_Parse_Result;
   --  @param Text More-count summary such as "3 shown, +4 more".
   --  @return Parsed visible and remaining counts.

   function Parse_Pagination_Range
     (Text : String)
      return Pagination_Range_Parse_Result;
   --  @param Text Pagination range such as "21-40 of 153 results".
   --  @return Parsed first/last/total range and result noun.

   function Parse_Collection_Display
     (Text : String)
      return Collection_Display_Parse_Result;
   --  @param Text Collection display label in compact, summary, or screen-reader form.
   --  @return Parsed collection display kind and count metadata.

   function Parse_Text_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result;
   --  @param Text Count summary such as "3 words" or "no paragraphs".
   --  @return Parsed count and unit label.

   function Parse_Word_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result;
   --  @param Text Word-count summary such as "3 words".
   --  @return Parsed word count.

   function Parse_Sentence_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result;
   --  @param Text Sentence-count summary such as "1 sentence".
   --  @return Parsed sentence count.

   function Parse_Paragraph_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result;
   --  @param Text Paragraph-count summary such as "no paragraphs".
   --  @return Parsed paragraph count.

   function Parse_Text_Time_Label
     (Text : String)
      return Text_Time_Parse_Result;
   --  @param Text Time label such as "less than 1 minute read".
   --  @return Parsed minutes, less-than flag, and suffix.

   function Parse_Reading_Time
     (Text : String)
      return Text_Time_Parse_Result;
   --  @param Text Reading-time label.
   --  @return Parsed reading time.

   function Parse_Speaking_Time
     (Text : String)
      return Text_Time_Parse_Result;
   --  @param Text Speaking-time label.
   --  @return Parsed speaking time.

   function Parse_Text_Summary
     (Text : String)
      return Text_Summary_Parse_Result;
   --  @param Text Combined text summary.
   --  @return Parsed known text-summary fields.

   function Parse_Mask
     (Text : String;
      Mask_Char : Character := '*')
      return Mask_Parse_Result;
   --  @param Text Masked string output.
   --  @param Mask_Char Expected mask character.
   --  @return Parsed mask and visible-tail counts.

   function Parse_Grouped_Token
     (Text : String;
      Separator : Character := '-')
      return Grouped_Token_Parse_Result;
   --  @param Text Grouped token output.
   --  @param Separator Expected group separator.
   --  @return Parsed token grouping metadata.

   function Parse_Masked_Token
     (Text : String;
      Separator : Character := '-';
      Mask_Char : Character := '*')
      return Grouped_Token_Parse_Result;
   --  @param Text Grouped masked token output.
   --  @param Separator Expected group separator.
   --  @param Mask_Char Expected mask character.
   --  @return Parsed token grouping metadata.

   function Parse_String_Label
     (Text : String)
      return String_Label_Parse_Result;
   --  @param Text Deterministic string helper output.
   --  @return Bounded copy of the label.

   function Parse_Path_Label
     (Text : String)
      return String_Label_Parse_Result;
   --  @param Text Path, basename, title, extension, or shortened-path label.
   --  @return Bounded copy of the path label.

   function Parse_Path_Basename
     (Text : String)
      return Filename_Label_Parse_Result;
   --  @param Text Path basename output.
   --  @return Parsed basename filename metadata.

   function Parse_Path_Title
     (Text : String)
      return String_Label_Parse_Result;
   --  @param Text Path-title output.
   --  @return Bounded copy of the path title.

   function Parse_Extension_Label
     (Text : String)
      return String_Label_Parse_Result;
   --  @param Text Extension-label output.
   --  @return Bounded copy of the extension label.

   function Parse_Shortened_Path
     (Text : String)
      return Excerpt_Parse_Result;
   --  @param Text Shortened-path output.
   --  @return Parsed ellipsis and retained path metadata.

   function Parse_File_Mode_Label
     (Text : String)
      return File_Mode_Parse_Result;
   --  @param Text Octal or symbolic Unix file mode output.
   --  @return Parsed file mode bits and optional file-kind prefix.

   function Parse_Handle_Label
     (Text : String)
      return String_Label_Parse_Result;
   --  @param Text Handle label such as "@ada".
   --  @return Parsed handle label.

   function Parse_Name_Label
     (Text : String)
      return String_Label_Parse_Result;
   --  @param Text Display name, initials, or possessive-name label.
   --  @return Bounded copy of the name label.

   function Parse_Clean_Name
     (Text : String)
      return String_Label_Parse_Result;
   --  @param Text Clean-name output.
   --  @return Bounded copy of the cleaned name.

   function Parse_Display_Name
     (Text : String)
      return String_Label_Parse_Result;
   --  @param Text Display-name output.
   --  @return Bounded copy of the display name.

   function Parse_Name_Part
     (Text : String)
      return String_Label_Parse_Result;
   --  @param Text Name-part output.
   --  @return Bounded copy of the name part.

   function Parse_Initials
     (Text : String)
      return Initials_Parse_Result;
   --  @param Text Initials output such as "AL".
   --  @return Parsed initials count and uppercase metadata.

   function Parse_Person_Initials
     (Text : String)
      return Initials_Parse_Result;
   --  @param Text Person-initials output.
   --  @return Parsed person-initials metadata.

   function Parse_Possessive_Label
     (Text : String)
      return Possessive_Parse_Result;
   --  @param Text Possessive output such as "Ada's" or "Chris'".
   --  @return Parsed owner label and possessive suffix metadata.

   function Parse_Possessive_Name
     (Text : String)
      return Possessive_Parse_Result;
   --  @param Text Possessive person-name output.
   --  @return Parsed owner label and possessive suffix metadata.

   function Parse_Email_Local_Part
     (Text : String)
      return Email_Local_Part_Parse_Result;
   --  @param Text Email local-part output.
   --  @return Parsed local-part label.

   function Parse_Safe_Filename
     (Text : String)
      return Filename_Label_Parse_Result;
   --  @param Text Safe filename output.
   --  @return Parsed filename stem, extension, and safety metadata.

   function Parse_Search_Key
     (Text : String)
      return Identifier_Label_Parse_Result;
   --  @param Text Search-key output.
   --  @return Parsed normalized search-key metadata.

   function Parse_Natural_Sort_Key
     (Text : String)
      return Identifier_Label_Parse_Result;
   --  @param Text Natural-sort-key output.
   --  @return Parsed natural-sort-key metadata.

   function Parse_Identifier_Label
     (Text : String;
      Separator : Character := '_')
      return Identifier_Label_Parse_Result;
   --  @param Text Identifier transform output.
   --  @param Separator Expected token separator.
   --  @return Parsed identifier token and case metadata.

   function Parse_Parameterize_Label
     (Text : String;
      Separator : Character := '-')
      return Identifier_Label_Parse_Result;
   --  @param Text Parameterized slug output.
   --  @param Separator Expected slug separator.
   --  @return Parsed slug token metadata.

   function Parse_Dasherize_Label
     (Text : String)
      return Identifier_Label_Parse_Result;
   --  @param Text Dasherized identifier output.
   --  @return Parsed dashed identifier metadata.

   function Parse_Underscore_Label
     (Text : String)
      return Identifier_Label_Parse_Result;
   --  @param Text Underscored identifier output.
   --  @return Parsed underscored identifier metadata.

   function Parse_Camelize_Label
     (Text : String)
      return Identifier_Label_Parse_Result;
   --  @param Text Camelized identifier output.
   --  @return Parsed camel-case identifier metadata.

   function Parse_Transliteration_Label
     (Text : String)
      return String_Label_Parse_Result;
   --  @param Text ASCII transliteration output.
   --  @return Bounded copy of the transliterated label.

   function Parse_Casefold_Label
     (Text : String)
      return Identifier_Label_Parse_Result;
   --  @param Text ASCII casefold output.
   --  @return Parsed lowercase casefold metadata.

   function Parse_Escaped_HTML
     (Text : String)
      return Cleanup_Label_Parse_Result;
   --  @param Text HTML-escaped output.
   --  @return Parsed escaped-entity and tag-shape metadata.

   function Parse_NL_To_BR
     (Text : String)
      return Cleanup_Label_Parse_Result;
   --  @param Text Output with line feeds converted to HTML breaks.
   --  @return Parsed break marker metadata.

   function Parse_BR_To_NL
     (Text : String)
      return Cleanup_Label_Parse_Result;
   --  @param Text Output with HTML breaks converted to line feeds.
   --  @return Parsed line-feed metadata.

   function Parse_Normalized_Whitespace
     (Text : String)
      return Cleanup_Label_Parse_Result;
   --  @param Text Whitespace-normalized output.
   --  @return Parsed whitespace-run metadata.

   function Parse_Squished
     (Text : String)
      return Cleanup_Label_Parse_Result;
   --  @param Text Squished whitespace output.
   --  @return Parsed whitespace-run metadata.

   function Parse_Stripped_Tags
     (Text : String)
      return Cleanup_Label_Parse_Result;
   --  @param Text Tag-stripped output.
   --  @return Parsed remaining tag-like metadata.

   function Parse_Preserved_Separator
     (Text      : String;
      Separator : Character)
      return Cleanup_Label_Parse_Result;
   --  @param Text Separator-preserved output.
   --  @param Separator Separator to inspect.
   --  @return Parsed separator collapse metadata.

   function Parse_Pluralized_Word
     (Text : String)
      return String_Label_Parse_Result;
   --  @param Text Pluralized-word output.
   --  @return Bounded copy of the plural word.

   function Parse_Singularized_Word
     (Text : String)
      return String_Label_Parse_Result;
   --  @param Text Singularized-word output.
   --  @return Bounded copy of the singular word.

   function Parse_Person_List
     (Text : String)
      return Person_List_Parse_Result;
   --  @param Text Compact person list such as "Ada and 2 others".
   --  @return Parsed visible and hidden person counts.

   function Parse_Excerpt
     (Text : String;
      Ellipsis : String := "...")
      return Excerpt_Parse_Result;
   --  @param Text Excerpt output.
   --  @param Ellipsis Ellipsis marker used by the formatter.
   --  @return Parsed ellipsis flags and bounded content.

   function Parse_Highlight
     (Text   : String;
      Before : String := "<mark>";
      After  : String := "</mark>")
      return Highlight_Parse_Result;
   --  @param Text Highlighted output.
   --  @param Before Opening marker.
   --  @param After Closing marker.
   --  @return Parsed marker count and output length.

   function Parse_Highlighted_Excerpt
     (Text     : String;
      Ellipsis : String := "...";
      Before   : String := "<mark>";
      After    : String := "</mark>")
      return Highlight_Parse_Result;
   --  @param Text Highlighted excerpt output.
   --  @param Ellipsis Ellipsis marker used by the formatter.
   --  @param Before Opening marker.
   --  @param After Closing marker.
   --  @return Parsed marker and excerpt metadata.

   function Parse_Inflection_Source_Label
     (Text : String)
      return Inflection_Source_Parse_Result;
   --  @param Text Inflection-source label such as "irregular".
   --  @return Parsed inflection-source metadata.

   function Scan_Compact_Number
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Text beginning with a compact number expression.
   --  @return Parsed compact number and consumed prefix length.

   function Parse_Bounded_Number
     (Text   : String;
      Suffix : String := "+")
      return Number_Parse_Result;
   --  @param Text Bounded number text such as "100+".
   --  @param Suffix Suffix accepted after the numeric value.
   --  @return Parsed displayed number.

   function Parse_Number_Range
     (Text : String)
      return Number_Range_Parse_Result;
   --  @param Text Number range such as "1-5" or "between 3 and 7".
   --  @return Parsed lower and upper bounds.

   function Parse_Decimal_Range
     (Text : String)
      return Decimal_Range_Parse_Result;
   --  @param Text Decimal range such as "1.2 to 3.4".
   --  @return Parsed lower and upper bounds.

   function Parse_Decimal_Range_Words
     (Text : String)
      return Decimal_Range_Parse_Result;
   --  @param Text Worded decimal range such as "one point two to three".
   --  @return Parsed lower and upper bounds.

   function Parse_Fraction_Words
     (Text : String)
      return Proportion_Parse_Result;
   --  @param Text Fraction words such as "one half" or "three quarters".
   --  @return Parsed numerator and denominator.

   function Parse_Uncertainty_Label
     (Text : String)
      return Uncertainty_Parse_Result;
   --  @param Text Uncertainty label such as "12.3 +/- 0.4",
   --    "12.3 (+/- 0.4)", or "11.9 to 12.7".
   --  @return Parsed center value, symmetric uncertainty, and bounds.

   function Parse_Uncertainty_Words
     (Text : String)
      return Uncertainty_Parse_Result;
   --  @param Text Worded uncertainty such as "one plus or minus zero point one".
   --  @return Parsed center value, symmetric uncertainty, and bounds.

   function Parse_Percent_Words
     (Text : String)
      return Float_Parse_Result;
   --  @param Text Percent words such as "twelve point five percent".
   --  @return Parsed percent value.

   function Scan_Uncertainty_Label
     (Text : String)
      return Uncertainty_Parse_Result;
   --  @param Text Text beginning with an uncertainty label.
   --  @return Parsed uncertainty label and consumed prefix length.

   function Scan_Number_Range
     (Text : String)
      return Number_Range_Parse_Result;
   --  @param Text Text beginning with a number range.
   --  @return Parsed bounds and consumed prefix length.

   function Scan_Decimal_Range
     (Text : String)
      return Decimal_Range_Parse_Result;
   --  @param Text Text beginning with a decimal range.
   --  @return Parsed bounds and consumed prefix length.

   function Parse_Proportion
     (Text : String)
      return Proportion_Parse_Result;
   --  @param Text Proportion such as "1 in 4", "3 out of 10", or "2:1".
   --  @return Parsed numerator and denominator.

   function Scan_Proportion
     (Text : String)
      return Proportion_Parse_Result;
   --  @param Text Text beginning with a proportion.
   --  @return Parsed proportion and consumed prefix length.

   function Scan_Bounded_Number
     (Text   : String;
      Suffix : String := "+")
      return Number_Parse_Result;
   --  @param Text Text beginning with a bounded number expression.
   --  @param Suffix Suffix accepted after the numeric value.
   --  @return Parsed bounded number and consumed prefix length.

   function Parse_Frequency
     (Text : String)
      return Frequency_Parse_Result;
   --  @param Text Frequency text such as "once", "twice", "4 times",
   --    or shipped-locale aliases.
   --  @return Parsed occurrence count.

   function Scan_Frequency
     (Text : String)
      return Frequency_Parse_Result;
   --  @param Text Text beginning with a frequency expression.
   --  @return Parsed frequency and consumed prefix length.

   function Parse_Rate
     (Text : String)
      return Rate_Parse_Result;
   --  @param Text Rate text such as "approximately 4 times per week",
   --    including shipped-locale frequency and period aliases.
   --  @return Parsed occurrence count and rate period.

   function Scan_Rate
     (Text : String)
      return Rate_Parse_Result;
   --  @param Text Text beginning with a rate expression.
   --  @return Parsed rate and consumed prefix length.

   function Parse_List
     (Text : String)
      return List_Parse_Result;
   --  @param Text List text such as "A, B and C".
   --  @return Parsed item count for a Humanize-style conjunction list,
   --    including common shipped-locale conjunction aliases.

   function Scan_List
     (Text : String)
      return List_Parse_Result;
   --  @param Text Text beginning with a Humanize-style list expression.
   --  @return Parsed list count and consumed prefix length.

   function Parse_Percent
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Percent text such as "12.5%".
   --  @return Parsed percent value rounded to the nearest integer.

   function Scan_Percent
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Text beginning with a percent expression.
   --  @return Parsed percent value and consumed prefix length.

   function Parse_Ordinal
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Ordinal text such as "21st" or "3.".
   --  @return Parsed ordinal value.

   function Scan_Ordinal
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Text beginning with an ordinal expression.
   --  @return Parsed ordinal value and consumed prefix length.

   function Parse_Roman
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Roman numeral such as "MMXXVI".
   --  @return Parsed Roman numeral value.

   function Scan_Roman
     (Text : String)
      return Number_Parse_Result;
   --  @param Text Text beginning with a Roman numeral expression.
   --  @return Parsed Roman numeral value and consumed prefix length.

   function Parse_Unit
     (Text : String)
      return Unit_Parse_Result;
   --  @param Text Unit quantity such as "5 kilometers" or "10 km".
   --  @return Parsed unit quantity and unit kind.

   function Parse_Aspect_Ratio
     (Text : String)
      return Aspect_Ratio_Parse_Result;
   --  @param Text Aspect ratio text such as "16:9".
   --  @return Parsed width and height components.

   function Scan_Aspect_Ratio
     (Text : String)
      return Aspect_Ratio_Parse_Result;
   --  @param Text Text beginning with an aspect ratio.
   --  @return Parsed aspect ratio and consumed prefix length.

   function Parse_CSS_Length
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text CSS length such as "1.5 rem".
   --  @return Parsed value and unit suffix.

   function Scan_CSS_Length
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Text beginning with a CSS length.
   --  @return Parsed CSS length and consumed prefix length.

   function Parse_Compound_Unit
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Compound unit such as "2.5 ms" or "42 k IOPS".
   --  @return Parsed value and deterministic unit suffix.

   function Parse_Database_Throughput
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Database throughput such as "12.5 k ops/s".
   --  @return Parsed throughput amount and normalized ops/s unit label.

   function Scan_Database_Throughput
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Text beginning with a database throughput quantity.
   --  @return Parsed throughput amount, unit label, and consumed prefix length.

   function Parse_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Data rate such as "1.5 MB/s".
   --  @return Parsed decimal byte-rate amount and unit label.

   function Scan_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Text beginning with a decimal byte-rate quantity.
   --  @return Parsed data-rate amount, unit label, and consumed prefix length.

   function Parse_Bit_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Bit rate such as "1.5 Mbit/s".
   --  @return Parsed bit-rate amount and unit label.

   function Scan_Bit_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Text beginning with a bit-rate quantity.
   --  @return Parsed bit-rate amount, unit label, and consumed prefix length.

   function Parse_Binary_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Binary data rate such as "1.5 MiB/s".
   --  @return Parsed binary byte-rate amount and unit label.

   function Scan_Binary_Data_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Text beginning with a binary byte-rate quantity.
   --  @return Parsed binary data-rate amount, unit label, and consumed prefix length.

   function Parse_Memory_Bandwidth
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Memory bandwidth such as "12.5 GB/s".
   --  @return Parsed bandwidth amount and normalized byte-rate unit label.

   function Scan_Memory_Bandwidth
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Text beginning with a memory-bandwidth quantity.
   --  @return Parsed bandwidth amount, unit label, and consumed prefix length.

   function Parse_Latency
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Latency such as "2.5 ms".
   --  @return Parsed latency amount and normalized time unit label.

   function Scan_Latency
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Text beginning with a latency quantity.
   --  @return Parsed latency amount, unit label, and consumed prefix length.

   function Parse_IOPS
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Storage IOPS such as "42 k IOPS".
   --  @return Parsed IOPS amount and normalized IOPS unit label.

   function Scan_IOPS
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Text beginning with an IOPS quantity.
   --  @return Parsed IOPS amount, unit label, and consumed prefix length.

   function Parse_Density
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Density such as "12.5 kg/m3".
   --  @return Parsed density amount and unit label.

   function Scan_Density
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Acceleration
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Acceleration such as "9.8 m/s2".
   --  @return Parsed acceleration amount and unit label.

   function Scan_Acceleration
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Torque
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Torque such as "12 N m".
   --  @return Parsed torque amount and unit label.

   function Scan_Torque
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Fuel_Economy
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Fuel economy such as "5.5 L/100 km".
   --  @return Parsed fuel-economy amount and unit label.

   function Scan_Fuel_Economy
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Flow_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Flow rate such as "500 mL/s".
   --  @return Parsed flow-rate amount and unit label.

   function Scan_Flow_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Electric_Current
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Current such as "500 mA".
   --  @return Parsed current amount and unit label.

   function Scan_Electric_Current
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Voltage
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Voltage such as "12 V".
   --  @return Parsed voltage amount and unit label.

   function Scan_Voltage
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Pixel_Density
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Pixel density such as "326 ppi".
   --  @return Parsed pixel-density amount and unit label.

   function Scan_Pixel_Density
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Electric_Resistance
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Resistance such as "4.7 kohm".
   --  @return Parsed resistance amount and unit label.

   function Scan_Electric_Resistance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Electric_Capacitance
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Capacitance such as "4.7 uF".
   --  @return Parsed capacitance amount and unit label.

   function Scan_Electric_Capacitance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Electric_Inductance
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Inductance such as "4.7 mH".
   --  @return Parsed inductance amount and unit label.

   function Scan_Electric_Inductance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Concentration
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Concentration such as "2.5 mol/L".
   --  @return Parsed concentration amount and unit label.

   function Scan_Concentration
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Fuel_Efficiency_MPG
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Fuel efficiency such as "30 mpg".
   --  @return Parsed MPG amount and unit label.

   function Scan_Fuel_Efficiency_MPG
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_CPU_Load
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text CPU load such as "82.5 % CPU".
   --  @return Parsed CPU-load amount and unit label.

   function Scan_CPU_Load
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Battery
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Battery level such as "37 % battery".
   --  @return Parsed battery amount and unit label.

   function Scan_Battery
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Screen_Size
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Screen size such as "13 in screen".
   --  @return Parsed screen-size amount and unit label.

   function Scan_Screen_Size
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Typography_Size
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Typography size such as "12 pt".
   --  @return Parsed typography-size amount and unit label.

   function Scan_Typography_Size
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Audio_Level
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Audio level such as "-6 dB".
   --  @return Parsed audio-level amount and unit label.

   function Scan_Audio_Level
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Signal_Strength
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Signal strength such as "-67 dBm".
   --  @return Parsed signal-strength amount and unit label.

   function Scan_Signal_Strength
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Storage_Endurance
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Storage endurance such as "600 TBW".
   --  @return Parsed storage-endurance amount and unit label.

   function Scan_Storage_Endurance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Refresh_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Refresh rate such as "144 Hz refresh".
   --  @return Parsed refresh-rate amount and unit label.

   function Scan_Refresh_Rate
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Luminance
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Luminance such as "1000 nits".
   --  @return Parsed luminance amount and unit label.

   function Scan_Luminance
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Parse_Print_Resolution
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Print resolution such as "300 dpi".
   --  @return Parsed print-resolution amount and unit label.

   function Scan_Print_Resolution
     (Text : String)
      return Compound_Unit_Parse_Result;

   function Scan_Compound_Unit
     (Text : String)
      return Compound_Unit_Parse_Result;
   --  @param Text Text beginning with a compound unit.
   --  @return Parsed compound unit and consumed prefix length.

   function Scan_Unit
     (Text : String)
      return Unit_Parse_Result;
   --  @param Text Text beginning with a unit quantity.
   --  @return Parsed unit quantity and consumed prefix length.

end Humanize.Parsing;
