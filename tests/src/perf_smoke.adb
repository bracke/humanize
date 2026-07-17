with Ada.Calendar;
with Ada.Command_Line;
with Ada.Text_IO;

with Humanize.Bytes;
with Humanize.Colors;
with Humanize.Colors.CSS;
with Humanize.Contexts;
with Humanize.Diagnostics;
with Humanize.Durations;
with Humanize.Numbers;
with Humanize.Operations;
with Humanize.Parsing;
with Humanize.Search;
with Humanize.Status;
with Humanize.Strings;
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
      Format_Start := Ada.Calendar.Clock;
      for I in 1 .. Iterations loop
         declare
            Bytes : constant Humanize.Status.Text_Result :=
              Humanize.Bytes.Format (Context, 1_536);
            Duration_Text : constant Humanize.Status.Text_Result :=
              Humanize.Durations.Format (Context, 90);
            Number_Text : constant Humanize.Status.Text_Result :=
              Humanize.Numbers.Compact (Context, 1_200_000);
         begin
            Check_Status (Bytes.Status, "bytes format");
            Check_Status (Duration_Text.Status, "duration format");
            Check_Status (Number_Text.Status, "compact format");
            Total := Total + I mod 3;
         end;
      end loop;
      Format_Stop := Ada.Calendar.Clock;

      Parse_Start := Ada.Calendar.Clock;
      for I in 1 .. Iterations loop
         declare
            Parsed_Bytes : constant Humanize.Parsing.Byte_Parse_Result :=
              Humanize.Parsing.Parse_Bytes ("1.5 KiB");
            Parsed_Duration : constant Humanize.Parsing.Duration_Parse_Result :=
              Humanize.Parsing.Parse_Duration ("2 hours, 30 minutes");
            Parsed_Number : constant Humanize.Parsing.Number_Parse_Result :=
              Humanize.Parsing.Parse_Cardinal ("forty two");
         begin
            Check_Status (Parsed_Bytes.Status, "bytes parse");
            Check_Status (Parsed_Duration.Status, "duration parse");
            Check_Status (Parsed_Number.Status, "cardinal parse");
            Total :=
              Total
              + Parsed_Bytes.Consumed
              + Parsed_Duration.Consumed
              + Parsed_Number.Consumed
              + I mod 3;
         end;
      end loop;
      Parse_Stop := Ada.Calendar.Clock;

      Text_Start := Ada.Calendar.Clock;
      for I in 1 .. Iterations loop
         declare
            Color : Humanize.Colors.CSS_Color;
            Color_Status : constant Humanize.Status.Status_Code :=
              Humanize.Colors.CSS.Parse_CSS_Color ("rgb(12 34 56)", Color);
            Title : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Title_Case_Smart ("api status and url rules");
            Truncated : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Truncate_Words
                ("alpha beta gamma delta epsilon", 3);
            CSS : constant Humanize.Status.Text_Result :=
              Humanize.Colors.CSS.CSS_Color_Label (Color);
         begin
            Check_Status (Color_Status, "css color parse");
            Check_Status (Title.Status, "title-case text");
            Check_Status (Truncated.Status, "truncate words text");
            Check_Status (CSS.Status, "css color label");
            Total := Total + I mod 5;
         end;
      end loop;
      Text_Stop := Ada.Calendar.Clock;

      Domain_Start := Ada.Calendar.Clock;
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
         begin
            Check_Status (HTTP.Status, "http status label");
            Check_Status (Operation.Status, "operation progress label");
            Check_Status (Diagnostic.Status, "diagnostic summary label");
            Check_Status (Search.Status, "search result summary label");
            Total := Total + I mod 7;
         end;
      end loop;
      Domain_Stop := Ada.Calendar.Clock;
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
