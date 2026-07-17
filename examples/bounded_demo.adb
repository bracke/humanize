with Ada.Text_IO;

with I18N.Runtime;

with Humanize.Bounded_Text;
with Humanize.Bytes;
with Humanize.Catalogs;
with Humanize.Contexts;
with Humanize.Status;

with Humanize_Demo_Runtime;

procedure Bounded_Demo is
   use Ada.Text_IO;
   use type Humanize.Status.Status_Code;

   Loaded  : I18N.Runtime.Load_Result;
   Buffer  : String (1 .. 32) := (others => ' ');
   Written : Natural := 0;
   Code    : Humanize.Status.Status_Code := Humanize.Status.Ok;
begin
   Humanize.Catalogs.Load_Defaults (Humanize_Demo_Runtime.Runtime, Loaded);

   declare
      Context : constant Humanize.Contexts.Context :=
        Humanize.Contexts.Create (Humanize_Demo_Runtime.Runtime'Access, "en");
   begin
      Humanize.Bytes.Format_Into (Context, 1_536, Buffer, Written, Code);
      if Code = Humanize.Status.Ok then
         Put_Line ("bounded bytes: " & Buffer (1 .. Written));
      end if;

      Put_Line
        ("owned result: "
         & Humanize.Bounded_Text.Result_Text
             (Humanize.Bytes.Format (Context, 2_048)));
   end;
end Bounded_Demo;
