with Ada.Calendar;
with Ada.Strings.Unbounded;
with Ada.Text_IO;

with I18N.Runtime;

with Humanize.Bytes;
with Humanize.Bounded_Text;
with Humanize.Capabilities;
with Humanize.Catalogs;
with Humanize.Colors;
with Humanize.Comparisons;
with Humanize.Contexts;
with Humanize.Cross_Domain;
with Humanize.Datetimes;
with Humanize.Domain_Details;
with Humanize.Durations;
with Humanize.Accounts;
with Humanize.Builds;
with Humanize.Deployments;
with Humanize.Lists;
with Humanize.Numbers;
with Humanize.Parsing;
with Humanize.Phrases;
with Humanize.Operations;
with Humanize.Status;
with Humanize.Strings;
with Humanize.Styles;
with Humanize.Units;

with Humanize_Demo_Runtime;

--  Minimal end-to-end Humanize example: load the built-in catalog into an
--  application-owned I18N runtime and humanize a few values in English and
--  Danish. Run from the repository root:  ./examples/bin/humanize_demo
procedure Humanize_Demo is
   use Ada.Calendar;
   use Ada.Text_IO;

   function Text (Result : Humanize.Status.Text_Result) return String is
     (Humanize.Bounded_Text.Result_Text (Result));

   Loaded    : I18N.Runtime.Load_Result;
   Reference : constant Time := Time_Of (2026, 3, 21, Day_Duration (43_200));
   Earlier   : constant Time := Reference - Duration (14_400);  --  4 hours
begin
   Humanize.Catalogs.Load_Defaults (Humanize_Demo_Runtime.Runtime, Loaded);

   declare
      English : constant Humanize.Contexts.Context :=
        Humanize.Contexts.Create
          (Humanize_Demo_Runtime.Runtime'Access, "en");
      Danish  : constant Humanize.Contexts.Context :=
        Humanize.Contexts.Create
          (Humanize_Demo_Runtime.Runtime'Access, "da-DK");
      Spanish : constant Humanize.Contexts.Context :=
        Humanize.Contexts.Create
          (Humanize_Demo_Runtime.Runtime'Access, "es");
      Swedish : constant Humanize.Contexts.Context :=
        Humanize.Contexts.Create
          (Humanize_Demo_Runtime.Runtime'Access, "sv-SE");
      Finnish : constant Humanize.Contexts.Context :=
        Humanize.Contexts.Create
          (Humanize_Demo_Runtime.Runtime'Access, "fi-FI");
      Turkish : constant Humanize.Contexts.Context :=
        Humanize.Contexts.Create
          (Humanize_Demo_Runtime.Runtime'Access, "tr-TR");
   begin
      Put_Line ("English:");
      Put_Line
        ("  duration 90s : "
         & Text (Humanize.Durations.Format (English, 90)));
      Put_Line
        ("  bytes 1536   : "
         & Text (Humanize.Bytes.Format (English, 1536)));
      Put_Line
        ("  files total  : "
         & Text
             (Humanize.Bytes.File_Size_Summary
                (English, 3, 1536)));
      Put_Line
        ("  transfer     : "
         & Text
             (Humanize.Bytes.Transfer_Remaining_Label
                (English, 2_000_000, 1_000)));
      Put_Line
        ("  disk usage   : "
         & Text
             (Humanize.Bytes.Disk_Usage_Label
                (English, 1_500, 10_000,
                 Humanize.Bytes.Decimal_Byte_Options)));
      Put_Line
        ("  4 hours ago  : "
         & Text (Humanize.Datetimes.Relative (English, Earlier, Reference)));
      Put_Line
        ("  detailed ago : "
         & Text
             (Humanize.Datetimes.Relative
                (English,
                 Reference - Duration (5_400),
                 Reference,
                 (Style => Humanize.Datetimes.Elapsed,
                  Now_Threshold_Seconds => 0,
                  Use_Calendar_Words => False,
                  Prefer_Weeks => True,
                  Prefer_Months => True,
                  Rounding => Humanize.Datetimes.Round_Down,
                  Max_Units => 2,
                  Calendar_Words_Only => False))));
      New_Line;
      Put_Line ("Danish:");
      Put_Line
        ("  duration 90s : "
         & Text (Humanize.Durations.Format (Danish, 90)));
      Put_Line
        ("  bytes 1536   : "
         & Text (Humanize.Bytes.Format (Danish, 1536)));
      Put_Line
        ("  4 hours ago  : "
         & Text (Humanize.Datetimes.Relative (Danish, Earlier, Reference)));
      New_Line;
      Put_Line ("Numbers / multi-unit (English):");
      Put_Line
        ("  ordinal 21   : "
         & Text (Humanize.Numbers.Ordinal (English, 21)));
      Put_Line
        ("  compact 1.2M : "
         & Text (Humanize.Numbers.Compact (English, 1_200_000)));
      Put_Line
        ("  3661 seconds : "
         & Text (Humanize.Durations.Format_Components (English, 3661, 3)));
      Put_Line
        ("  5 kilometers : "
         & Text (Humanize.Units.Format (English, 5, Humanize.Units.Kilometer)));
      Put_Line
        ("  1.5 km       : "
         & Text (Humanize.Units.Format
                   (English, 1.5, Humanize.Units.Kilometer)));
      Put_Line
        ("  long 1.2M    : "
         & Text (Humanize.Numbers.Compact
                   (English, 1_200_000,
                    Humanize.Numbers.Default_Number_Options,
                    Humanize.Numbers.Long)));
      Put_Line
        ("  percent 12.5 : "
         & Text (Humanize.Numbers.Percent (English, 12.5)));
      Put_Line
        ("  editorial     : "
         & Text (Humanize.Numbers.Editorial_Number (English, 9))
         & ", " & Text (Humanize.Numbers.Editorial_Age (English, 5))
         & ", " & Text (Humanize.Numbers.Editorial_Ordinal (English, 11)));
      Put_Line
        ("  signed words  : "
         & Text (Humanize.Numbers.Signed_Cardinal (English, -42)));
      Put_Line
        ("  locale words  : "
         & Text (Humanize.Numbers.Locale_Cardinal (Danish, 5)));
      Put_Line
        ("  spanish words : "
         & Text (Humanize.Numbers.Locale_Cardinal (Spanish, 16)));
      Put_Line
        ("  swedish words : "
         & Text (Humanize.Numbers.Locale_Cardinal (Swedish, 2_345)));
      Put_Line
        ("  finnish words : "
         & Text (Humanize.Numbers.Locale_Cardinal (Finnish, 2_345)));
      Put_Line
        ("  turkish words : "
         & Text (Humanize.Numbers.Locale_Cardinal (Turkish, 2_345)));
      Put_Line
        ("  currency      : "
         & Text (Humanize.Numbers.Approximate_Currency
                   (English, 12.5, "USD", Humanize.Numbers.About)));
      Put_Line
        ("  scientific    : "
         & Text
             (Humanize.Numbers.Scientific_Notation
                (English, 1_234_000.0,
                 (Maximum_Fraction_Digits => 2,
                  Suppress_Trailing_Zero => True))));
      Put_Line
        ("  roman         : "
         & Text (Humanize.Numbers.Roman (2026)));
      Put_Line
        ("  SI prefix     : "
         & Text (Humanize.Numbers.SI_Prefix (English, 1_500.0, "m")));
      Put_Line
        ("  decimal words : "
         & Text (Humanize.Numbers.Decimal_Words (English, 12.5, 2)));
      Put_Line
        ("  fraction words: "
         & Text (Humanize.Numbers.Fraction_Words (English, 3, 4)));
      Put_Line
        ("  ordinal words : "
         & Text (Humanize.Numbers.Ordinal_Words (English, 21)));
      Put_Line
        ("  currency words: "
         & Text
             (Humanize.Numbers.Currency_Words
                (English, 12.5, "dollar", "cent", 2)));
      Put_Line
        ("  locale 342    : "
         & Text (Humanize.Numbers.Locale_Cardinal (English, 342)));
      Put_Line
        ("  locale 1342   : "
         & Text (Humanize.Numbers.Locale_Cardinal (English, 1_342)));
      Put_Line
        ("  number range  : "
         & Text (Humanize.Numbers.Between (English, 3, 7)));
      Put_Line
        ("  inclusive rng : "
         & Text (Humanize.Numbers.Qualified_Range (English, 3, 7)));
      Put_Line
        ("  tolerance rng : "
         & Text (Humanize.Numbers.Tolerance_Range (English, 10, 2)));
      Put_Line
        ("  decimal range : "
         & Text
             (Humanize.Numbers.Decimal_Range
                (English, 1.25, 3.5,
                 (Maximum_Fraction_Digits => 2,
                  Suppress_Trailing_Zero => True))));
      Put_Line
        ("  decimal words : "
         & Text
             (Humanize.Numbers.Decimal_Range_Words
                (English, 1.25, 3.5, 2)));
      Put_Line
        ("  uncertainty   : "
         & Text (Humanize.Numbers.Uncertainty_Label (English, 12.3, 0.4)));
      Put_Line
        ("  threshold     : "
         & Text
             (Humanize.Numbers.Threshold
                (English, 10, Humanize.Numbers.At_Least_Threshold)));
      Put_Line
        ("  range status  : "
         & Text (Humanize.Numbers.Range_Position (English, 5, 3, 7)));
      Put_Line
        ("  proportion    : "
         & Text (Humanize.Numbers.Out_Of (English, 3, 10)));
      Put_Line
        ("  ratio per     : "
         & Text
             (Humanize.Numbers.Ratio_Per
                (English, 2, 1, "error", "file")));
      Put_Line
        ("  change        : "
         & Text (Humanize.Numbers.Percent_Change (English, -12.5)));
      Put_Line
        ("  status phrase : "
         & Text (Humanize.Phrases.Status_Phrase
                   (English, Humanize.Phrases.Loading)));
      Put_Line
        ("  file phrase   : "
         & Text (Humanize.Phrases.File_Phrase
                   (English, Humanize.Phrases.Uploading)));
      Put_Line
        ("  auth phrase   : "
         & Text (Humanize.Phrases.Auth_Phrase
                   (English, Humanize.Phrases.Session_Expired)));
      Put_Line
        ("  db phrase es  : "
         & Text (Humanize.Phrases.Database_Phrase
                   (Spanish,
                    Humanize.Phrases.Database_Replication_Lagging)));
      Put_Line
        ("  security      : "
         & Text (Humanize.Phrases.Security_Phrase
                   (English, Humanize.Phrases.Token_Expired)));
      Put_Line
        ("  health        : "
         & Text (Humanize.Phrases.Health_Phrase
                   (English, Humanize.Phrases.Degraded)));
      Put_Line
        ("  issue         : "
         & Text (Humanize.Phrases.Issue_Phrase
                   (English, Humanize.Phrases.Merged)));
      Put_Line
        ("  job summary   : "
         & Text
             (Humanize.Phrases.Domain_Summary
                (English, Humanize.Phrases.Job_Domain,
                 Humanize.Phrases.Summary_Running, 3, 10, 1,
                 "task", "tasks")));
      Put_Line
        ("  cache summary : "
         & Text (Humanize.Phrases.Cache_Summary (English, 8, 2)));
      Put_Line
        ("  file compare  : "
         & Text
             (Humanize.Phrases.File_Size_Comparison
                (English, 3_900_000, 1_600_000, "file A", "file B",
                 Humanize.Bytes.Decimal_Byte_Options)));
      Put_Line
        ("  date compare  : "
         & Text
             (Humanize.Phrases.Date_Comparison
                (English,
                 (Year => 2026, Month => 3, Day => 18, others => 0),
                 (Year => 2026, Month => 3, Day => 21, others => 0),
                 "updated", "release")));
      Put_Line
        ("  pct compare   : "
         & Text
             (Humanize.Phrases.Percent_Comparison
                (English, 88.0, 100.0, "score", "baseline")));
      Put_Line
        ("  operation     : "
         & Text
             (Humanize.Operations.Progress_Summary
                ("sync", Humanize.Operations.Running, 8, 10,
                 Failed => 1)));
      Put_Line
        ("  operation log : "
         & Text
             (Humanize.Operations.Progress_Summary
                ("sync", Humanize.Operations.Running, 8, 10,
                 Failed => 1, Skipped => 0, Retried => 0, Canceled => 0,
                 Singular => "item", Plural => "items",
                 Options =>
                   (Mode => Humanize.Operations.Operation_Log,
                    Include_Extras => True))));
      Put_Line
        ("  comparison log: "
         & Text
             (Humanize.Comparisons.Multi_Value_Summary
                ("settings", 3, 7, 10,
                 (Mode => Humanize.Comparisons.Comparison_Log))));
      Put_Line
        ("  account       : "
         & Text
             (Humanize.Accounts.Last_Active_Label
                ("Ada", "2 hours ago")));
      Put_Line
        ("  account meta  : "
         & Text
             (Humanize.Accounts.Account_Label
                ("Ada", Humanize.Accounts.Locked_Account,
                 (Mode             => Humanize.Accounts.Account_Detailed,
                  Include_Surface  => True,
                  Include_Severity => True,
                  Include_Tone     => False))));
      Put_Line
        ("  deploy        : "
         & Text
             (Humanize.Deployments.Deployment_Label
                ("release 1.2", "production",
                 Humanize.Deployments.Deployed)));
      Put_Line
        ("  build         : "
         & Text
             (Humanize.Builds.Test_Count_Label
                (2, Humanize.Builds.Flaky_Test)));
      Put_Line
        ("  accessible    : "
         & Text
             (Humanize.Domain_Details.Accessible_Label
                ("MFA enabled, image 1920x1080, 3/10 complete",
                 (Surface    => Humanize.Domain_Details.Accounts_Surface,
                  Severity   => Humanize.Domain_Details.Success_Severity,
                  Tone       => Humanize.Domain_Details.Positive_Tone,
                  Final      => True,
                  Actionable => False))));
      Put_Line
        ("  compact time  : "
         & Text (Humanize.Durations.Format_Compact (English, 5_405, 2)));
      Put_Line
        ("  clock time    : "
         & Text (Humanize.Durations.Format_Clock (English, 5_405)));
      Put_Line
        ("  interval      : "
         & Text (Humanize.Durations.Interval (English, 3_600, 7_200)));
      Put_Line
        ("  backup age    : "
         & Text (Humanize.Durations.Backup_Age (English, 86_400)));
      Put_Line
        ("  progress      : "
         & Text (Humanize.Durations.Percent_Complete (English, 75.0)));
      Put_Line
        ("  step          : "
         & Text (Humanize.Durations.Step_Count (English, 2, 5)));
      Put_Line
        ("  business days : "
         & Text (Humanize.Durations.Business_Days (English, 3)));
      Put_Line
        ("  natural time  : "
         & Text (Humanize.Durations.Natural_Duration (English, 1_800)));
      Put_Line
        ("  brief precise : "
         & Text
             (Humanize.Durations.Natural_Duration
                (English, 3_930, (Style => Humanize.Durations.Brief_Precise_Duration))));
      Put_Line
        ("  detailed time : "
         & Text
             (Humanize.Durations.Natural_Duration_Detailed
                (English, 3_930,
                 (Max_Components => 2,
                  Round_To_Minutes => True,
                  Prefix => Humanize.Durations.Approximate_Duration))));
      Put_Line
        ("  long duration : "
         & Text
             (Humanize.Durations.Format
                (English, Humanize.Durations.Duration_Seconds (365 * 86_400))));
      Put_Line
        ("  business date : "
         & Text
             (Humanize.Durations.Business_Date_Label
                (English,
                 Ada.Calendar.Time_Of (2026, 7, 3, 0.0),
                 1,
                 Humanize.Durations.Holiday_List'
                   ([1 => Ada.Calendar.Time_Of (2026, 7, 6, 0.0)]))));
      Put_Line
        ("  calendar date : "
         & Text
             (Humanize.Datetimes.Calendar_Date_Label
                (English,
                 (Year => 2026, Month => 3, Day => 21, others => 0),
                 Humanize.Styles.Calendar_Date_Options
                   (Humanize.Styles.Verbose))));
      Put_Line
        ("  business hour : "
         & Text
             (Humanize.Durations.Business_Hour_Label
                (English,
                 Ada.Calendar.Time_Of (2026, 7, 3, 16.0 * 3_600.0),
                 2)));
      Put_Line
        ("  target2 date  : "
         & Text
             (Humanize.Durations.Business_Calendar_Label
                (English,
                 Ada.Calendar.Time_Of (2026, 4, 2, 0.0),
                 16,
                 Humanize.Durations.TARGET2_Business_Calendar_Rules
                   (2026))));
      Put_Line
        ("  range         : "
         & Text
             (Humanize.Datetimes.Date_Range
                (English,
                 (Year => 2026, Month => 3, Day => 21, others => 0),
                 (Year => 2026, Month => 3, Day => 23, others => 0),
                 Humanize.Styles.Range_Options
                   (Humanize.Styles.Compact_UI))));
      Put_Line
        ("  calendar range: "
         & Text
             (Humanize.Datetimes.Calendar_Range_Label
                (English,
                 (Year => 2026, Month => 3, Day => 21, others => 0),
                 (Year => 2026, Month => 3, Day => 23, others => 0),
                 (Year => 2026, Month => 3, Day => 21, others => 0))));
      Put_Line
        ("  calendar diff : "
         & Text
             (Humanize.Datetimes.Calendar_Difference_Label
                (English,
                 (Year => 2026, Month => 3, Day => 21, others => 0),
                 (Year => 2027, Month => 5, Day => 1, others => 0),
                 (Max_Components => 3,
                  Include_Zero => False,
                  Style =>
                    Humanize.Datetimes.Calendar_Difference_Relative))));
      Put_Line
        ("  time range    : "
         & Text
             (Humanize.Datetimes.Date_Time_Range
                (English,
                 (Year => 2026, Month => 3, Day => 21, Hour => 9,
                  others => 0),
                 (Year => 2026, Month => 3, Day => 21, Hour => 17,
                  others => 0),
                 (Year => 2026, Month => 3, Day => 21, others => 0),
                 (Elide_Same_Month => True,
                  Elide_Same_Year => False,
                  Include_Weekday => False,
                  Separator => '-',
                  Use_Month_Names => False,
                  Use_12_Hour_Time => False,
                  Relative_When_Same_Day => True))));
      Put_Line
        ("  data rate     : "
         & Text (Humanize.Units.Format_Data_Rate (English, 1_500.0)));
      Put_Line
        ("  bit rate      : "
         & Text (Humanize.Units.Format_Bit_Rate (English, 1_500_000.0)));
      Put_Line
        ("  css length    : "
         & Text (Humanize.Units.Format_CSS_Length (English, 1.5, "rem")));
      Put_Line
        ("  aspect ratio  : "
         & Text (Humanize.Units.Format_Aspect_Ratio (English, 1920, 1080)));
      Put_Line
        ("  capacitance   : "
         & Text
             (Humanize.Units.Format_Electric_Capacitance
                (English, 0.000_004_7)));
      Put_Line
        ("  cooking temp  : "
         & Text
             (Humanize.Units.Format_Cooking_Temperature (English, 350.0)));
      Put_Line
        ("  latency       : "
         & Text (Humanize.Units.Format_Latency (English, 2_500.0)));
      Put_Line
        ("  signal        : "
         & Text (Humanize.Units.Format_Signal_Strength (English, -67.0)));
      Put_Line
        ("  luminance     : "
         & Text (Humanize.Units.Format_Luminance (English, 1_000.0)));
      Put_Line
        ("  memory bw     : "
         & Text (Humanize.Units.Format_Memory_Bandwidth
                   (English, 12_500_000_000.0)));
      Put_Line
        ("  cpu load      : "
         & Text (Humanize.Units.Format_CPU_Load (English, 82.5)));
      Put_Line
        ("  battery       : "
         & Text (Humanize.Units.Format_Battery (English, 37.0)));
      Put_Line
        ("  geo distance  : "
         & Text
             (Humanize.Units.Format_Geographic_Distance
                (English, 12_345.0)));
      Put_Line
        ("  color         : "
         & Text
             (Humanize.Colors.Color_Summary
                ((Red => 51, Green => 102, Blue => 153))));
      Put_Line
        ("  palette       : "
         & Text
             (Humanize.Colors.Palette_Harmony_Label
                (Humanize.Colors.Color_List'
                   ([1 => (Red => 51, Green => 102, Blue => 153),
                     2 => (Red => 240, Green => 240, Blue => 240)]))));
      Put_Line
        ("  palette a11y  : "
         & Text
             (Humanize.Colors.Palette_Accessibility_Label
                (Humanize.Colors.Color_List'
                   ([1 => (Red => 0, Green => 0, Blue => 0),
                     2 => (Red => 255, Green => 255, Blue => 255)]))));
      Put_Line
        ("  palette matrix: "
         & Text
             (Humanize.Colors.Palette_Contrast_Matrix_Label
                (Humanize.Colors.Color_List'
                   ([1 => (Red => 0, Green => 0, Blue => 0),
                     2 => (Red => 51, Green => 102, Blue => 153),
                     3 => (Red => 255, Green => 255, Blue => 255)]))));
      Put_Line
        ("  contrast      : "
         & Text
             (Humanize.Colors.Contrast_Label
                ((Red => 0, Green => 0, Blue => 0),
                 (Red => 255, Green => 255, Blue => 255))));
      Put_Line
        ("  apca          : "
         & Text
             (Humanize.Colors.APCA_Contrast_Label
                ((Red => 0, Green => 0, Blue => 0),
                 (Red => 255, Green => 255, Blue => 255))));
      Put_Line
        ("  cvd risk      : "
         & Text
             (Humanize.Colors.Color_Vision_Deficiency_Label
                ((Red => 255, Green => 0, Blue => 0),
                 (Red => 0, Green => 255, Blue => 0),
                 Humanize.Colors.Deuteranopia)));
      Put_Line
        ("  color a11y    : "
         & Text
             (Humanize.Colors.Color_Accessibility_Summary
                ((Red => 0, Green => 0, Blue => 0),
                 (Red => 255, Green => 255, Blue => 255))));
      Put_Line
        ("  perceptual    : "
         & Text
             (Humanize.Colors.Perceptual_Difference_Label
                ((Red => 51, Green => 102, Blue => 153),
                 (Red => 52, Green => 101, Blue => 150))));
      Put_Line
        ("  due           : "
         & Text (Humanize.Datetimes.Due_Status
                   (English,
                    (Year => 2026, Month => 3, Day => 23, others => 0),
                    (Year => 2026, Month => 3, Day => 21, others => 0))));
      Put_Line
        ("  counted noun  : "
         & Text
             (Humanize.Lists.Counted_Noun
                (English, 1_250, "file",
                 Options =>
                   (Number_Style => Humanize.Lists.Compact_Count,
                    Zero_Style => Humanize.Lists.No_Zero,
                    Include_Noun => True,
                    Compact_At => 1_000,
                    Prefer_Article => False))));
      Put_Line
        ("  selected      : "
         & Text (Humanize.Lists.Selection_Count (English, 3, 5, "item")));
      Put_Line
        ("  showing       : "
         & Text (Humanize.Lists.Showing_Count (English, 20, 153)));
      Put_Line
        ("  more          : "
         & Text (Humanize.Lists.More_Count (English, 3, 4)));
      Put_Line
        ("  collection    : "
         & Text
             (Humanize.Lists.Collection_Display
                (English, 3, 4,
                 Options =>
                   (Style => Humanize.Lists.Screen_Reader_Display))));
      Put_Line
        ("  accessible    : "
         & Text (Humanize.Durations.Accessible_Progress (English, 3, 10)));
      Put_Line
        ("  page range    : "
         & Text (Humanize.Lists.Pagination_Range (English, 21, 40, 153)));
      Put_Line
        ("  validation    : "
         & Text
             (Humanize.Lists.Validation_Summary
                (English,
                 [Ada.Strings.Unbounded.To_Unbounded_String
                    ("email is invalid"),
                  Ada.Strings.Unbounded.To_Unbounded_String
                    ("password is too short")])));
      declare
         Parsed : constant Humanize.Parsing.Unit_Parse_Result :=
           Humanize.Parsing.Scan_Unit ("5 km (planned)");
         Percent : constant Humanize.Parsing.Number_Parse_Result :=
           Humanize.Parsing.Scan_Percent ("12.5% selected");
      begin
         Put_Line
           ("  scan unit     : consumed"
            & Natural'Image (Parsed.Consumed));
         Put_Line
           ("  scan percent  : consumed"
            & Natural'Image (Percent.Consumed));
         Put_Line
           ("  utf8 length   :"
            & Natural'Image
                (Humanize.Strings.UTF8_Length
                   ("h" & Character'Val (16#C3#)
                    & Character'Val (16#A6#) & "llo")));
         Put_Line
           ("  parse ratio   : consumed"
            & Natural'Image
                (Humanize.Parsing.Scan_Aspect_Ratio
                   ("16:9 preview").Consumed));
         Put_Line
           ("  parse sci     : consumed"
            & Natural'Image
                (Humanize.Parsing.Scan_Scientific_Number
                   ("1.23e6 cached").Consumed));
         Put_Line
           ("  parse roman   : consumed"
            & Natural'Image
                (Humanize.Parsing.Scan_Roman
                   ("MMXXVI cached").Consumed));
         Put_Line
           ("  parse range   : consumed"
            & Natural'Image
                (Humanize.Parsing.Scan_Duration_Range
                   ("1 hour-2 hours window").Consumed));
         Put_Line
           ("  parse uncert  : consumed"
            & Natural'Image
                (Humanize.Parsing.Scan_Uncertainty_Label
                   ("12.3 +/- 0.4 measured").Consumed));
         Put_Line
           ("  parse date    : consumed"
            & Natural'Image
                (Humanize.Parsing.Scan_Natural_Date
                   (Reference, "week 32; preview").Consumed));
         Put_Line
           ("  parse richdate: consumed"
            & Natural'Image
                (Humanize.Parsing.Scan_Natural_Date
                   (Reference, "next friday afternoon; preview").Consumed));
         Put_Line
           ("  parse bus wkdy: consumed"
            & Natural'Image
                (Humanize.Parsing.Scan_Natural_Date
                   (Reference, "next business friday; preview").Consumed));
         Put_Line
           ("  parse business: consumed"
            & Natural'Image
                (Humanize.Parsing.Scan_Business_Calendar
                   (Reference, "business hours monday 9-17; cached").Consumed));
         Put_Line
           ("  parse rules   : holidays"
            & Natural'Image
                (Humanize.Parsing.Parse_Business_Calendar_Rules
                   (Reference, "holiday 2026-07-06; business hours 9-17")
                   .Rules.Holiday_Count));
         Put_Line
           ("  parse progress: total"
            & Natural'Image
                (Humanize.Parsing.Parse_Progress
                   ("3 of 10 complete").Total));
         Put_Line
           ("  parse prop    : total"
            & Natural'Image
                (Humanize.Parsing.Parse_Proportion
                   ("1 in 4").Total));
         Put_Line
           ("  parse retry   : seconds"
            & Humanize.Durations.Duration_Seconds'Image
                (Humanize.Parsing.Parse_Retry_In
                   ("retrying in 10 seconds").Value));
         Put_Line
           ("  parse op      : state"
            & Humanize.Phrases.Backup_Status'Image
                (Humanize.Parsing.Parse_Operational_Phrase
                   ("backup stale").Backup_Status));
         Put_Line
           ("  parse db op   : state"
            & Humanize.Phrases.Database_Status'Image
                (Humanize.Parsing.Parse_Operational_Phrase
                   ("database replication lagging").Database_Status));
         Put_Line
           ("  parse fields  : changed"
            & Natural'Image
                (Humanize.Parsing.Parse_Field_Change_Summary
                   ("4 fields: 2 changed, 1 added, 1 removed").Changed));
         Put_Line
           ("  parse lenient : seconds"
            & Humanize.Durations.Duration_Seconds'Image
                (Humanize.Parsing.Parse_Lenient_Duration
                   ("in about 1.5hrs").Value));
         Put_Line
           ("  scan retry    : consumed"
            & Natural'Image
                (Humanize.Parsing.Scan_Retry_In
                   ("retrying in 10 seconds; cached").Consumed));
         Put_Line
           ("  parse recur   : weekday"
            & Natural'Image
                (Humanize.Parsing.Scan_Recurrence_Detail
                   (Reference, "every other Tuesday; cached").Weekday));
         Put_Line
           ("  recur window  : start"
            & Natural'Image
                (Humanize.Parsing.Parse_Recurrence_Detail
                   (Reference,
                    "every 15 minutes between 09:00 and 17:00")
                 .Window_Start_Hour));
         Put_Line
           ("  scan cron     : consumed"
            & Natural'Image
                (Humanize.Parsing.Scan_Cron_Schedule
                   ("0 9 * * 1-5; cached").Consumed));
         Put_Line
           ("  cron quartz   : year"
            & Natural'Image
                (Humanize.Parsing.Parse_Cron_Schedule
                   ("30 15 8 15 JAN ? 2027").Year));
         Put_Line
           ("  scan db ops   : consumed"
            & Natural'Image
                (Humanize.Parsing.Scan_Database_Throughput
                   ("12.5 k ops/s; cached").Consumed));
         Put_Line
           ("  scan latency  : consumed"
            & Natural'Image
                (Humanize.Parsing.Scan_Latency
                   ("2.5 ms; cached").Consumed));
         Put_Line
           ("  parse membw   : value"
            & Long_Float'Image
                (Humanize.Parsing.Parse_Memory_Bandwidth
                   ("12.5 GB/s").Value));
         Put_Line
           ("  parse iops    : value"
            & Long_Float'Image
                (Humanize.Parsing.Parse_IOPS ("42 k IOPS").Value));
         declare
            Bad_Bytes : constant Humanize.Parsing.Byte_Parse_Result :=
              Humanize.Parsing.Parse_Bytes ("42 widgets");
         begin
            Put_Line
              ("  parse diag    : "
               & Text
                   (Humanize.Parsing.Diagnostic_Message
                      (Humanize.Parsing.Diagnostic
                         (Bad_Bytes.Status,
                          Bad_Bytes.Error_Position,
                          Bad_Bytes.Error),
                       Bad_Bytes.Error_Position)));
         end;
         declare
            Buffer  : String (1 .. 32);
            Written : Natural;
            Status  : Humanize.Status.Status_Code;
         begin
            Humanize.Numbers.Compact_Into
              (English, 1_200_000, Buffer, Written, Status);
            Put_Line
              ("  bounded       : "
               & Buffer (Buffer'First .. Buffer'First + Written - 1));
         end;
         Put_Line
           ("  byte metadata : "
            & Humanize.Bytes.Byte_Render_Unit'Image
                (Humanize.Bytes.Format_Metadata
                   (1536, Humanize.Bytes.Binary_Byte_Options).Unit));
         Put_Line
           ("  capability    : "
            & Text
                (Humanize.Capabilities.Area_Label
                   (Humanize.Capabilities.Parsing_Area))
            & " / "
            & Text
                (Humanize.Capabilities.Rendering_Source_Label
                   (Humanize.Capabilities.Area_Rendering_Source
                      (Humanize.Capabilities.Parsing_Area))));
         Put_Line
           ("  cap features  : "
            & Text
                (Humanize.Capabilities.Feature_Support_Label
                   (Humanize.Capabilities.Area_Features
                      (Humanize.Capabilities.Domain_Detail_Area))));
         Put_Line
           ("  cap matrix    : "
            & Text (Humanize.Capabilities.Capability_Matrix_Summary));
         Put_Line
           ("  color name    : "
            & Text
                (Humanize.Colors.Descriptive_Color_Name
                   ((Red => 30, Green => 90, Blue => 180))));
         Put_Line
           ("  VIN checksum  : "
            & Text
                (Humanize.Cross_Domain.Machine_Checksum_Label
                   ("1M8GDM9AXKP042788",
                    Humanize.Cross_Domain.VIN_Checksum)));
         Put_Line
           ("  text change   : "
            & Text
                (Humanize.Strings.Text_Change_Label
                   ("Alpha beta.", "alpha beta")));
         Put_Line
           ("  data shape    : "
            & Text
                (Humanize.Strings.Data_Shape_Label
                   ("{""users"": [{""name"": ""Ada""}, null]}")));
         declare
            Address : Humanize.Strings.Address_Fields;
         begin
            Address.City (1 .. 6) := "London";
            Address.City_Length := 6;
            Address.Country (1 .. 2) := "UK";
            Address.Country_Length := 2;
            Put_Line
              ("  safe address  : "
               & Text (Humanize.Strings.Privacy_Address_Label (Address)));
         end;
         Put_Line
           ("  smart title   : "
            & Text
                (Humanize.Strings.Title_Case_Smart
                   ("api status and url rules")));
         Put_Line
           ("  table row     : "
            & Text (Humanize.Strings.Table_Row_2 ("Name", "Ada", 8)));
         Put_Line
           ("  title options : "
            & Text
                 (Humanize.Strings.Title_Case_With_Options
                   ("api status and url rules",
                    (Preserve_Acronyms => False,
                     Lowercase_Small_Words => False))));
         Put_Line
           ("  title lists   : "
            & Text
                (Humanize.Strings.Title_Case_With_Word_Lists
                   ("gpu status by api", "gpu api", "by")));
         Put_Line
           ("  utf8 slice    : "
            & Text
                (Humanize.Strings.UTF8_Slice
                   ("h" & Character'Val (16#C3#)
                    & Character'Val (16#A6#) & "llo", 2, 4)));
         Put_Line
           ("  utf8 words    : "
            & Text
                (Humanize.Strings.Truncate_UTF8_Words
                   ("alpha beta gamma", 12)));
         Put_Line
           ("  utf8 width    :"
            & Natural'Image
                (Humanize.Strings.UTF8_Display_Width
                   ("h" & Character'Val (16#C3#)
                    & Character'Val (16#A6#) & "llo")));
         declare
            Combining_Acute : constant String :=
              Character'Val (16#CC#) & Character'Val (16#81#);
            Woman_Emoji : constant String :=
              Character'Val (16#F0#) & Character'Val (16#9F#)
              & Character'Val (16#91#) & Character'Val (16#A9#);
            Girl_Emoji : constant String :=
              Character'Val (16#F0#) & Character'Val (16#9F#)
              & Character'Val (16#91#) & Character'Val (16#A7#);
            ZWJ : constant String :=
              Character'Val (16#E2#) & Character'Val (16#80#)
              & Character'Val (16#8D#);
            Family_Emoji : constant String := Woman_Emoji & ZWJ & Girl_Emoji;
            Grapheme_Text : constant String :=
              "e" & Combining_Acute & Family_Emoji & "z";
         begin
            Put_Line
              ("  graphemes     :"
               & Natural'Image
                   (Humanize.Strings.Grapheme_Length (Grapheme_Text)));
            Put_Line
              ("  grapheme cut  : "
               & Text
                   (Humanize.Strings.Truncate_Graphemes
                      (Grapheme_Text & "q", 3, ".")));
            Put_Line
              ("  grapheme slice: "
               & Text
                   (Humanize.Strings.Grapheme_Slice (Grapheme_Text, 2, 2)));
         end;
         Put_Line
           ("  unicode words : "
            & Text
                (Humanize.Strings.Word_Count_Summary
                   ("H" & Character'Val (16#C3#) & Character'Val (16#A9#)
                    & "llo " & Character'Val (16#E4#)
                    & Character'Val (16#B8#) & Character'Val (16#96#)
                    & Character'Val (16#E7#) & Character'Val (16#95#)
                    & Character'Val (16#8C#))));
         Put_Line
           ("  word count    : "
            & Text
                (Humanize.Strings.Word_Count_Summary
                   ("Alpha beta gamma. Second sentence.")));
         Put_Line
           ("  reading time  : "
            & Text
                (Humanize.Strings.Reading_Time
                   ("Alpha beta gamma. Second sentence.")));
         Put_Line
           ("  text summary  : "
            & Text
                (Humanize.Strings.Text_Summary
                   ("Alpha beta gamma. Second sentence.")));
         Put_Line
           ("  summary opts  : "
            & Text
                (Humanize.Strings.Text_Summary_With_Options
                   ("Alpha beta gamma. Second sentence.",
                    (Fields =>
                       [Humanize.Strings.Summary_Words,
                        Humanize.Strings.Summary_Reading_Time,
                        Humanize.Strings.Summary_Sentences,
                        Humanize.Strings.Summary_Paragraphs,
                        Humanize.Strings.Summary_Speaking_Time,
                        Humanize.Strings.Summary_Code_Points,
                        Humanize.Strings.Summary_Display_Width],
                     Field_Count => 2,
                     Separator => '|',
                     Space_After_Separator => False,
                     Label_Style => Humanize.Strings.Compact_Labels,
                     Omit_Zero_Counts => False,
                     Empty_Text => '-',
                     Time => Humanize.Strings.Default_Text_Time_Options))));
         Put_Line
           ("  context text  : "
            & Text
                (Humanize.Strings.Excerpt_With_Context
                   ("alpha beta gamma delta epsilon zeta", "delta", 2)));
         Put_Line
           ("  highlight opt : "
            & Text
                (Humanize.Strings.Highlight_With_Options
                   ("Alpha beta ALPHA", "alpha",
                    Options =>
                      (Match_Mode =>
                         (Case_Mode => Humanize.Strings.Case_Insensitive,
                          Boundary_Mode => Humanize.Strings.Match_Anywhere),
                       Count_Mode => Humanize.Strings.All_Matches))));
         Put_Line
           ("  safe excerpt  : "
            & Text
                (Humanize.Strings.Highlighted_Excerpt
                   ("A <beta> & beta", "beta", 20)));
         Put_Line
           ("  casefold      : "
            & Text
                (Humanize.Strings.Casefold_ASCII
                   ("h" & Character'Val (16#C3#)
                    & Character'Val (16#A6#) & "llo")));
         Put_Line
           ("  custom plural : "
            & Text
                (Humanize.Strings.Pluralize_With_Dictionary
                   ("schema", "schema corpus", "schemata corpora")));
         Put_Line
           ("  squish        : "
            & Text (Humanize.Strings.Squish ("  alpha" & ASCII.LF & " beta  ")));
         Put_Line
           ("  mask          : "
            & Text (Humanize.Strings.Mask ("1234567890", 4)));
         Put_Line
           ("  token group   : "
            & Text (Humanize.Strings.Group_Token ("ab12 cd34 ef56")));
         Put_Line
           ("  token mask    : "
            & Text (Humanize.Strings.Masked_Token ("ab12-cd34-ef56", 4)));
         Put_Line
           ("  safe file     : "
            & Text
                (Humanize.Strings.Safe_Filename
                   ("Quarterly Report (Final).PDF")));
         Put_Line
           ("  safe policy   : "
            & Text
                (Humanize.Strings.Safe_Filename
                   ("CON Report.PDF",
                    (Separator              => '_',
                     Case_Mode              =>
                       Humanize.Strings.Preserve_Filename_Case,
                     Preserve_Extension     => True,
                     Max_Stem_Length        => 10,
                     Empty_Fallback         => 'x',
                     Reserved_Name_Fallback => '_',
                     Hidden_Mode            =>
                       Humanize.Strings.Drop_Hidden_Dot))));
         Put_Line
           ("  short path    : "
            & Text
                (Humanize.Strings.Shorten_Path
                   ("/home/user/projects/humanize/src/humanize-strings.adb",
                    (Max_Chars => 28,
                     Ellipsis => '~',
                     Separator => '/',
                     Preserve_Extension => False))));
         Put_Line
           ("  search key    : "
            & Text (Humanize.Strings.Search_Key ("  File_02-final.TXT ")));
         Put_Line
           ("  natural sort  : "
            & Boolean'Image (Humanize.Strings.Natural_Less ("file2", "file10")));
         Put_Line
           ("  translit      : "
            & Text
                (Humanize.Strings.Transliterate_ASCII
                   ("h" & Character'Val (16#C3#)
                    & Character'Val (16#A6#) & "llo")));
         Put_Line
           ("  translit am   : "
            & Text
                (Humanize.Strings.Transliterate_ASCII
                   (Character'Val (16#D5#) & Character'Val (16#B0#)
                    & Character'Val (16#D5#) & Character'Val (16#A1#)
                    & Character'Val (16#D5#) & Character'Val (16#B5#))));
         Put_Line
           ("  translit ka   : "
            & Text
                (Humanize.Strings.Transliterate_ASCII
                   (Character'Val (16#E1#) & Character'Val (16#83#)
                    & Character'Val (16#90#)
                    & Character'Val (16#E1#) & Character'Val (16#83#)
                    & Character'Val (16#91#)
                    & Character'Val (16#E1#) & Character'Val (16#83#)
                    & Character'Val (16#92#))));
         Put_Line
           ("  foreign key   : "
            & Text (Humanize.Strings.Foreign_Key ("Humanize.Person")));
         Put_Line
           ("  display name  : "
            & Text (Humanize.Strings.Display_Name ("", "ada")));
         Put_Line
           ("  people        : "
            & Text
                (Humanize.Strings.Person_List
                   ([Ada.Strings.Unbounded.To_Unbounded_String
                       ("Ada Lovelace"),
                     Ada.Strings.Unbounded.To_Unbounded_String
                       ("Grace Hopper"),
                     Ada.Strings.Unbounded.To_Unbounded_String
                       ("Katherine Johnson")],
                    Limit => 2)));
         Put_Line
           ("  severity      : "
            & Text
                (Humanize.Phrases.Severity_Label
                   (Humanize.Phrases.Security_Severity
                      (Humanize.Phrases.Token_Expired))));
         Put_Line
           ("  backup key    : "
            & Text
                (Humanize.Phrases.Backup_Key
                   (Humanize.Phrases.Backup_Stale)));
         Put_Line
           ("  field diff    : "
             & Text
                (Humanize.Phrases.Field_Diff_Summary
                   (English, "email", "old@example.com", "new@example.com")));
         Put_Line
           ("  ci phrase     : "
            & Text
                (Humanize.Phrases.CI_Phrase
                   (English, Humanize.Phrases.Pipeline_Failed)));
         Put_Line
           ("  ticket phrase : "
            & Text
                (Humanize.Phrases.Ticket_Phrase
                   (English, Humanize.Phrases.Ticket_Escalated)));
         Put_Line
           ("  payment phrase: "
            & Text
                (Humanize.Phrases.Payment_Lifecycle_Phrase
                   (English, Humanize.Phrases.Payment_Requires_Action)));
      end;
      New_Line;
      Put_Line ("Spanish:");
      Put_Line
        ("  bytes 1536   : "
         & Text (Humanize.Bytes.Format (Spanish, 1536)));
      Put_Line
        ("  4 hours ago  : "
         & Text (Humanize.Datetimes.Relative (Spanish, Earlier, Reference)));
      Put_Line
        ("  3 kilometers : "
         & Text (Humanize.Units.Format (Spanish, 3, Humanize.Units.Kilometer)));
      Put_Line
        ("  1.5 km       : "
         & Text (Humanize.Units.Format
                   (Spanish, 1.5, Humanize.Units.Kilometer)));
   end;
end Humanize_Demo;
