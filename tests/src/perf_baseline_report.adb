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

procedure Perf_Baseline_Report is
   use type Ada.Calendar.Time;
   use type Humanize.Status.Status_Code;

   Iterations : constant Positive := 10_000;
   Errors     : Natural := 0;
   Sink       : Natural := 0;

   procedure Check_Status
     (Status : Humanize.Status.Status_Code;
      Label  : String)
   is
   begin
      if Status /= Humanize.Status.Ok then
         Errors := Errors + 1;
         Ada.Text_IO.Put_Line (Ada.Text_IO.Standard_Error, "error: " & Label);
      end if;
   end Check_Status;

   procedure Report
     (Label : String;
      Start : Ada.Calendar.Time;
      Stop  : Ada.Calendar.Time)
   is
   begin
      Ada.Text_IO.Put_Line
        (Label & ": " & Positive'Image (Iterations)
         & " iterations in" & Duration'Image (Stop - Start) & " seconds");
   end Report;

   Context : constant Humanize.Contexts.Context :=
     Humanize.Tests.Support.En;
   Start : Ada.Calendar.Time;
   Stop  : Ada.Calendar.Time;
begin
   Start := Ada.Calendar.Clock;
   for I in 1 .. Iterations loop
      declare
         Result : constant Humanize.Status.Text_Result :=
           Humanize.Bytes.Format
             (Context, Humanize.Bytes.Byte_Count (I * 1_024));
      begin
         Check_Status (Result.Status, "bytes format");
         Sink := Sink + I mod 7;
      end;
   end loop;
   Stop := Ada.Calendar.Clock;
   Report ("bytes-format", Start, Stop);

   Start := Ada.Calendar.Clock;
   for I in 1 .. Iterations loop
      declare
         Result : constant Humanize.Status.Text_Result :=
           Humanize.Durations.Format
             (Context, Humanize.Durations.Duration_Seconds (I mod 10_000));
      begin
         Check_Status (Result.Status, "duration format");
         Sink := Sink + I mod 5;
      end;
   end loop;
   Stop := Ada.Calendar.Clock;
   Report ("duration-format", Start, Stop);

   Start := Ada.Calendar.Clock;
   for I in 1 .. Iterations loop
      declare
         Result : constant Humanize.Status.Text_Result :=
           Humanize.Numbers.Compact (Context, Long_Long_Integer (I) * 1_000);
      begin
         Check_Status (Result.Status, "number compact");
         Sink := Sink + I mod 3;
      end;
   end loop;
   Stop := Ada.Calendar.Clock;
   Report ("number-compact", Start, Stop);

   Start := Ada.Calendar.Clock;
   for I in 1 .. Iterations loop
      declare
         Result : constant Humanize.Status.Text_Result :=
           Humanize.Strings.Title_Case_Smart ("api status and url rules");
      begin
         Check_Status (Result.Status, "string title-case");
         Sink := Sink + I mod 11;
      end;
   end loop;
   Stop := Ada.Calendar.Clock;
   Report ("strings-title-case", Start, Stop);

   Start := Ada.Calendar.Clock;
   for I in 1 .. Iterations loop
      declare
         Color : Humanize.Colors.CSS_Color;
         Color_Status : constant Humanize.Status.Status_Code :=
           Humanize.Colors.CSS.Parse_CSS_Color ("rgb(12 34 56)", Color);
         Result : constant Humanize.Status.Text_Result :=
           Humanize.Colors.CSS.CSS_Color_Label (Color);
      begin
         Check_Status (Color_Status, "css color parse");
         Check_Status (Result.Status, "css color label");
         Sink := Sink + I mod 13;
      end;
   end loop;
   Stop := Ada.Calendar.Clock;
   Report ("colors-css-label", Start, Stop);

   Start := Ada.Calendar.Clock;
   for I in 1 .. Iterations loop
      declare
         Result : constant Humanize.Status.Text_Result :=
           Humanize.System_Status.HTTP_Status_Label (503);
      begin
         Check_Status (Result.Status, "http status label");
         Sink := Sink + I mod 17;
      end;
   end loop;
   Stop := Ada.Calendar.Clock;
   Report ("system-status-http", Start, Stop);

   Start := Ada.Calendar.Clock;
   for I in 1 .. Iterations loop
      declare
         Result : constant Humanize.Status.Text_Result :=
           Humanize.Operations.Progress_Summary
             ("sync", Humanize.Operations.Running, 8, 10, Failed => 1);
      begin
         Check_Status (Result.Status, "operation progress");
         Sink := Sink + I mod 19;
      end;
   end loop;
   Stop := Ada.Calendar.Clock;
   Report ("operations-progress", Start, Stop);

   Start := Ada.Calendar.Clock;
   for I in 1 .. Iterations loop
      declare
         Result : constant Humanize.Status.Text_Result :=
           Humanize.Diagnostics.Issue_Summary_Label
             (Errors => 2, Warnings => 1);
      begin
         Check_Status (Result.Status, "diagnostic summary");
         Sink := Sink + I mod 23;
      end;
   end loop;
   Stop := Ada.Calendar.Clock;
   Report ("diagnostics-summary", Start, Stop);

   Start := Ada.Calendar.Clock;
   for I in 1 .. Iterations loop
      declare
         Result : constant Humanize.Status.Text_Result :=
           Humanize.Search.Search_Result_Summary_Label ("cache", 12);
      begin
         Check_Status (Result.Status, "search summary");
         Sink := Sink + I mod 29;
      end;
   end loop;
   Stop := Ada.Calendar.Clock;
   Report ("search-summary", Start, Stop);

   Start := Ada.Calendar.Clock;
   for I in 1 .. Iterations loop
      declare
         Result : constant Humanize.Parsing.Byte_Parse_Result :=
           Humanize.Parsing.Parse_Bytes ("1.5 KiB");
      begin
         Check_Status (Result.Status, "bytes parse");
         Sink := Sink + Result.Consumed + I mod 2;
      end;
   end loop;
   Stop := Ada.Calendar.Clock;
   Report ("bytes-parse", Start, Stop);

   if Sink = 0 or else Errors > 0 then
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
   else
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
   end if;
exception
   when others =>
      Ada.Text_IO.Put_Line
        (Ada.Text_IO.Standard_Error, "error: perf baseline report failed");
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
end Perf_Baseline_Report;
