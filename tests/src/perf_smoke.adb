with Ada.Calendar;
with Ada.Command_Line;
with Ada.Text_IO;

with Humanize.Bytes;
with Humanize.Builds;
with Humanize.Colors;
with Humanize.Colors.Contrast;
with Humanize.Colors.CSS;
with Humanize.Capabilities;
with Humanize.Contexts;
with Humanize.Datetimes;
with Humanize.Diagnostics;
with Humanize.Domain_Details;
with Humanize.Durations;
with Humanize.Numbers;
with Humanize.Numbers.Editorial;
with Humanize.Numbers.Ranges;
with Humanize.Numbers.Scales;
with Humanize.Numbers.Spellout;
with Humanize.Numbers.Statistics;
with Humanize.Operations;
with Humanize.Parsing;
with Humanize.Phrases;
with Humanize.Phrases.Fields;
with Humanize.Phrases.Keys;
with Humanize.Phrases.Severity;
with Humanize.Phrases.Summaries;
with Humanize.Permissions;
with Humanize.Search;
with Humanize.Status;
with Humanize.Strings;
with Humanize.Strings.Core;
with Humanize.Strings.Display;
with Humanize.System_Status;
with Humanize.Tests.Support;

procedure Perf_Smoke is
   use type Ada.Calendar.Time;
   use type Humanize.Status.Status_Code;

   Errors  : Natural := 0;
   Total   : Natural := 0;

   Iterations : constant Positive := 2_000;
   Max_Seconds : constant Duration := 30.0;
   Max_Format_Seconds : constant Duration := 12.0;
   Max_Parse_Seconds : constant Duration := 18.0;
   Max_Text_Seconds : constant Duration := 10.0;
   Max_Domain_Seconds : constant Duration := 10.0;

   procedure Error (Message : String) is
   begin
      Errors := Errors + 1;
      Ada.Text_IO.Put_Line (Ada.Text_IO.Standard_Error, "error: " & Message);
   end Error;

   procedure Check_Status
     (Status : Humanize.Status.Status_Code;
      Label  : String)
   is
   begin
      if Status /= Humanize.Status.Ok then
         Error (Label & " returned non-OK status");
      end if;
   end Check_Status;

   procedure Run_Format_Bucket
     (Context : Humanize.Contexts.Context;
      Started : out Ada.Calendar.Time;
      Stopped : out Ada.Calendar.Time)
   is
   begin
      Started := Ada.Calendar.Clock;
      for I in 1 .. Iterations loop
         declare
            Bytes : constant Humanize.Status.Text_Result :=
              Humanize.Bytes.Format (Context, 1_536);
            Duration_Text : constant Humanize.Status.Text_Result :=
              Humanize.Durations.Format (Context, 90);
            Number_Text : constant Humanize.Status.Text_Result :=
              Humanize.Numbers.Compact (Context, 1_200_000);
            Editorial_Text : constant Humanize.Status.Text_Result :=
              Humanize.Numbers.Editorial.Editorial_Number (Context, 9);
            Range_Text : constant Humanize.Status.Text_Result :=
              Humanize.Numbers.Ranges.Between (Context, 3, 7);
            Scale_Text : constant Humanize.Status.Text_Result :=
              Humanize.Numbers.Scales.SI_Prefix (Context, 1_500.0, "m");
            Spellout_Text : constant Humanize.Status.Text_Result :=
              Humanize.Numbers.Spellout.Ordinal_Words (Context, 21);
            Stats_Text : constant Humanize.Status.Text_Result :=
              Humanize.Numbers.Statistics.Outlier_Summary_Label (2, 100);
            Reference : constant Ada.Calendar.Time :=
              Ada.Calendar.Time_Of (2026, 7, 18, 12.0 * 3_600.0);
            Relative_Text : constant Humanize.Status.Text_Result :=
              Humanize.Datetimes.Relative
                (Context, Reference - 3_600.0, Reference);
            Black : constant Humanize.Colors.RGB_Color :=
              (Red => 0, Green => 0, Blue => 0);
            White : constant Humanize.Colors.RGB_Color :=
              (Red => 255, Green => 255, Blue => 255);
            Contrast_Text : constant Humanize.Status.Text_Result :=
              Humanize.Colors.Contrast.Contrast_Label
                (Context, Black, White);
         begin
            Check_Status (Bytes.Status, "bytes format");
            Check_Status (Duration_Text.Status, "duration format");
            Check_Status (Number_Text.Status, "compact format");
            Check_Status (Editorial_Text.Status, "editorial number format");
            Check_Status (Range_Text.Status, "number range format");
            Check_Status (Scale_Text.Status, "number scale format");
            Check_Status (Spellout_Text.Status, "number spellout format");
            Check_Status (Stats_Text.Status, "number statistics format");
            Check_Status (Relative_Text.Status, "relative datetime format");
            Check_Status (Contrast_Text.Status, "contrast label format");
            Total := Total + I mod 3;
         end;
      end loop;
      Stopped := Ada.Calendar.Clock;
   end Run_Format_Bucket;

   procedure Run_Parse_Bucket
     (Started : out Ada.Calendar.Time;
      Stopped : out Ada.Calendar.Time)
   is
   begin
      Started := Ada.Calendar.Clock;
      for I in 1 .. Iterations loop
         declare
            Parsed_Bytes : constant Humanize.Parsing.Byte_Parse_Result :=
              Humanize.Parsing.Parse_Bytes ("1.5 KiB");
            Parsed_Duration : constant Humanize.Parsing.Duration_Parse_Result :=
              Humanize.Parsing.Parse_Duration ("2 hours, 30 minutes");
            Parsed_Number : constant Humanize.Parsing.Number_Parse_Result :=
              Humanize.Parsing.Parse_Cardinal ("forty two");
            Parsed_Color_Label :
              constant Humanize.Parsing.Color_Label_Parse_Result :=
                Humanize.Parsing.Parse_RGB_Label ("rgb(12, 34, 56)");
         begin
            Check_Status (Parsed_Bytes.Status, "bytes parse");
            Check_Status (Parsed_Duration.Status, "duration parse");
            Check_Status (Parsed_Number.Status, "cardinal parse");
            Check_Status (Parsed_Color_Label.Status, "rgb label parse");
            Total :=
              Total
              + Parsed_Bytes.Consumed
              + Parsed_Duration.Consumed
              + Parsed_Number.Consumed
              + Parsed_Color_Label.Consumed
              + I mod 3;
         end;
      end loop;
      Stopped := Ada.Calendar.Clock;
   end Run_Parse_Bucket;

   procedure Run_Text_Bucket
     (Started : out Ada.Calendar.Time;
      Stopped : out Ada.Calendar.Time)
   is
   begin
      Started := Ada.Calendar.Clock;
      for I in 1 .. Iterations loop
         declare
            Color : Humanize.Colors.CSS_Color;
            Color_Status : constant Humanize.Status.Status_Code :=
              Humanize.Colors.CSS.Parse_CSS_Color ("rgb(12 34 56)", Color);
            Title : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Title_Case_Smart ("api status and url rules");
            Core_Title : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Core.Title_Case_Smart ("api status and url rules");
            Truncated : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Truncate_Words
                ("alpha beta gamma delta epsilon", 3);
            Display_Text : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Display.Truncate_Display_Width
                ("alpha beta gamma delta epsilon", 16);
            CSS : constant Humanize.Status.Text_Result :=
              Humanize.Colors.CSS.CSS_Color_Label (Color);
         begin
            Check_Status (Color_Status, "css color parse");
            Check_Status (Title.Status, "title-case text");
            Check_Status (Core_Title.Status, "core title-case text");
            Check_Status (Truncated.Status, "truncate words text");
            Check_Status (Display_Text.Status, "display-width text");
            Check_Status (CSS.Status, "css color label");
            Total := Total + I mod 5;
         end;
      end loop;
      Stopped := Ada.Calendar.Clock;
   end Run_Text_Bucket;

   procedure Run_Domain_Bucket
     (Context : Humanize.Contexts.Context;
      Started : out Ada.Calendar.Time;
      Stopped : out Ada.Calendar.Time)
   is
   begin
      Started := Ada.Calendar.Clock;
      for I in 1 .. Iterations loop
         declare
            HTTP : constant Humanize.Status.Text_Result :=
              Humanize.System_Status.HTTP_Status_Label (503);
            Operation : constant Humanize.Status.Text_Result :=
              Humanize.Operations.Progress_Summary
                ("sync", Humanize.Operations.Running, 8, 10, Failed => 1);
            Diagnostic : constant Humanize.Status.Text_Result :=
              Humanize.Diagnostics.Issue_Summary_Label
                (Errors => 2, Warnings => 1);
            Search : constant Humanize.Status.Text_Result :=
              Humanize.Search.Search_Result_Summary_Label ("cache", 12);
            Capability : constant Humanize.Status.Text_Result :=
              Humanize.Capabilities.Capability_Matrix_Summary;
            Phrase : constant Humanize.Status.Text_Result :=
              Humanize.Phrases.Status_Phrase (Context, Humanize.Phrases.Saved);
            Field : constant Humanize.Status.Text_Result :=
              Humanize.Phrases.Fields.Field_Change_Summary
                (Context, Changed => 3, Added => 1, Removed => 1);
            Key : constant Humanize.Status.Text_Result :=
              Humanize.Phrases.Keys.Status_Key (Humanize.Phrases.Saved);
            Severity : constant Humanize.Status.Text_Result :=
              Humanize.Phrases.Severity.Severity_Label
                (Humanize.Phrases.Warning_Severity);
            Summary : constant Humanize.Status.Text_Result :=
              Humanize.Phrases.Summaries.Queue_Summary
                (Context, Queued => 4, Running => 2, Failed => 1);
            Build : constant Humanize.Status.Text_Result :=
              Humanize.Builds.Build_Label
                ("nightly", Humanize.Builds.Build_Running);
            Permission : constant Humanize.Status.Text_Result :=
              Humanize.Permissions.Permission_Label
                ("release-bot", "deploy", Humanize.Permissions.Granted);
            Parsed_Metadata :
              constant Humanize.Domain_Details.Domain_Label_Parse_Result :=
                Humanize.Domain_Details.Parse_Metadata_Summary_Label
                  ("metadata surface=deployments severity=warning "
                   & "tone=caution not final actionable");
         begin
            Check_Status (HTTP.Status, "http status label");
            Check_Status (Operation.Status, "operation progress label");
            Check_Status (Diagnostic.Status, "diagnostic summary label");
            Check_Status (Search.Status, "search result summary label");
            Check_Status (Capability.Status, "capability matrix summary");
            Check_Status (Phrase.Status, "status phrase label");
            Check_Status (Field.Status, "field phrase label");
            Check_Status (Key.Status, "phrase key label");
            Check_Status (Severity.Status, "phrase severity label");
            Check_Status (Summary.Status, "phrase summary label");
            Check_Status (Build.Status, "build label");
            Check_Status (Permission.Status, "permission label");
            Check_Status (Parsed_Metadata.Status, "metadata summary parse");
            Total := Total + I mod 7;
         end;
      end loop;
      Stopped := Ada.Calendar.Clock;
   end Run_Domain_Bucket;

   Format_Start : Ada.Calendar.Time;
   Format_Stop  : Ada.Calendar.Time;
   Parse_Start  : Ada.Calendar.Time;
   Parse_Stop   : Ada.Calendar.Time;
   Text_Start   : Ada.Calendar.Time;
   Text_Stop    : Ada.Calendar.Time;
   Domain_Start : Ada.Calendar.Time;
   Domain_Stop  : Ada.Calendar.Time;
begin
   declare
      Context : constant Humanize.Contexts.Context :=
        Humanize.Tests.Support.En;
   begin
      Run_Format_Bucket (Context, Format_Start, Format_Stop);
      Run_Parse_Bucket (Parse_Start, Parse_Stop);
      Run_Text_Bucket (Text_Start, Text_Stop);
      Run_Domain_Bucket (Context, Domain_Start, Domain_Stop);
   end;

   if Total < Iterations * 36 then
      Error ("performance smoke total was unexpectedly small");
   end if;

   declare
      Format_Elapsed : constant Duration := Format_Stop - Format_Start;
      Parse_Elapsed  : constant Duration := Parse_Stop - Parse_Start;
      Text_Elapsed   : constant Duration := Text_Stop - Text_Start;
      Domain_Elapsed : constant Duration := Domain_Stop - Domain_Start;
      Elapsed        : constant Duration :=
        Format_Elapsed + Parse_Elapsed + Text_Elapsed + Domain_Elapsed;
   begin
      Ada.Text_IO.Put_Line
        ("perf smoke format: "
         & Positive'Image (Iterations)
         & " iterations in"
         & Duration'Image (Format_Elapsed)
         & " seconds");
      Ada.Text_IO.Put_Line
        ("perf smoke parse: "
         & Positive'Image (Iterations)
         & " iterations in"
         & Duration'Image (Parse_Elapsed)
         & " seconds");
      Ada.Text_IO.Put_Line
        ("perf smoke text: "
         & Positive'Image (Iterations)
         & " iterations in"
         & Duration'Image (Text_Elapsed)
         & " seconds");
      Ada.Text_IO.Put_Line
        ("perf smoke domain: "
         & Positive'Image (Iterations)
         & " iterations in"
         & Duration'Image (Domain_Elapsed)
         & " seconds");
      Ada.Text_IO.Put_Line
        ("perf smoke total: "
         & Positive'Image (Iterations)
         & " iterations in"
         & Duration'Image (Elapsed)
         & " seconds");
      if Format_Elapsed > Max_Format_Seconds then
         Error ("format performance smoke exceeded loose baseline");
      end if;
      if Parse_Elapsed > Max_Parse_Seconds then
         Error ("parse performance smoke exceeded loose baseline");
      end if;
      if Text_Elapsed > Max_Text_Seconds then
         Error ("text performance smoke exceeded loose baseline");
      end if;
      if Domain_Elapsed > Max_Domain_Seconds then
         Error ("domain performance smoke exceeded loose baseline");
      end if;
      if Elapsed > Max_Seconds then
         Error ("performance smoke exceeded loose baseline");
      end if;
   end;

   if Errors = 0 then
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
   else
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
   end if;
exception
   when others =>
      Ada.Text_IO.Put_Line
        (Ada.Text_IO.Standard_Error,
         "error: performance smoke failed unexpectedly");
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
end Perf_Smoke;
