with Ada.Text_IO;

with Humanize.Parsing;
with Humanize.Status;

procedure Parse_Demo is
   use Ada.Text_IO;
   use type Humanize.Status.Status_Code;

   Bytes : constant Humanize.Parsing.Byte_Parse_Result :=
     Humanize.Parsing.Parse_Bytes ("1.5 KiB");
   Duration : constant Humanize.Parsing.Duration_Parse_Result :=
     Humanize.Parsing.Parse_Duration ("2 hours, 30 minutes");
begin
   if Bytes.Status = Humanize.Status.Ok then
      Put_Line ("bytes consumed:" & Natural'Image (Bytes.Consumed));
   end if;

   if Duration.Status = Humanize.Status.Ok then
      Put_Line ("duration consumed:" & Natural'Image (Duration.Consumed));
   end if;
end Parse_Demo;
