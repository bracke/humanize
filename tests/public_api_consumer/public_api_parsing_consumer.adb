with Ada.Command_Line;

with Humanize.Parsing;
with Humanize.Status;

procedure Public_API_Parsing_Consumer is
   use type Humanize.Status.Status_Code;

   Bytes : constant Humanize.Parsing.Byte_Parse_Result :=
     Humanize.Parsing.Parse_Bytes ("1.5 KiB");
   Duration : constant Humanize.Parsing.Duration_Parse_Result :=
     Humanize.Parsing.Parse_Duration ("2 hours, 30 minutes");
   Number : constant Humanize.Parsing.Number_Parse_Result :=
     Humanize.Parsing.Parse_Cardinal ("forty two");
begin
   Ada.Command_Line.Set_Exit_Status
     (if Bytes.Status = Humanize.Status.Ok
       and then Duration.Status = Humanize.Status.Ok
       and then Number.Status = Humanize.Status.Ok
      then Ada.Command_Line.Success
      else Ada.Command_Line.Failure);
end Public_API_Parsing_Consumer;
