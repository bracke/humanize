with Ada.Calendar;
with Ada.Command_Line;
with Ada.Text_IO;

with Humanize.Contexts;
with Humanize.Status;
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
      Stopped : out Ada.Calendar.Time) is separate;

   procedure Run_Parse_Bucket
     (Started : out Ada.Calendar.Time;
      Stopped : out Ada.Calendar.Time) is separate;

   procedure Run_Text_Bucket
     (Started : out Ada.Calendar.Time;
      Stopped : out Ada.Calendar.Time) is separate;

   procedure Run_Domain_Bucket
     (Context : Humanize.Contexts.Context;
      Started : out Ada.Calendar.Time;
      Stopped : out Ada.Calendar.Time) is separate;

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
