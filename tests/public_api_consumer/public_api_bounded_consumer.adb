with Ada.Command_Line;

with I18N.Runtime;

with Humanize.Bytes;
with Humanize.Catalogs;
with Humanize.Contexts;
with Humanize.Status;

with Public_API_Consumer_Runtime;

procedure Public_API_Bounded_Consumer is
   use type Humanize.Status.Status_Code;

   Loaded  : I18N.Runtime.Load_Result;
   Buffer  : String (1 .. 32) := (others => ' ');
   Written : Natural := 0;
   Code    : Humanize.Status.Status_Code := Humanize.Status.Ok;
begin
   Humanize.Catalogs.Load_Defaults
     (Public_API_Consumer_Runtime.Runtime, Loaded);

   declare
      Context : constant Humanize.Contexts.Context :=
        Humanize.Contexts.Create
          (Public_API_Consumer_Runtime.Runtime'Access, "en");
   begin
      Humanize.Bytes.Format_Into (Context, 1_536, Buffer, Written, Code);
   end;

   Ada.Command_Line.Set_Exit_Status
     (if Code = Humanize.Status.Ok and then Written > 0
      then Ada.Command_Line.Success
      else Ada.Command_Line.Failure);
end Public_API_Bounded_Consumer;
