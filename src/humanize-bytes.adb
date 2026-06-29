with Humanize.Byte_Classification;
with Humanize.I18N_Rendering;
with Humanize.Selections;

package body Humanize.Bytes is

   function Format
     (Context : Humanize.Contexts.Context;
      Bytes   : Byte_Count;
      Options : Byte_Options := Default_Byte_Options)
      return Humanize.Status.Text_Result
   is
      Selection : constant Humanize.Selections.Message_Selection :=
        Humanize.Byte_Classification.Classify
          (Bytes, Options, Humanize.Contexts.Locale (Context));
   begin
      return Humanize.I18N_Rendering.Render (Context, Selection);
   end Format;

   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Bytes   : Byte_Count;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Byte_Options := Default_Byte_Options)
   is
      Selection : constant Humanize.Selections.Message_Selection :=
        Humanize.Byte_Classification.Classify
          (Bytes, Options, Humanize.Contexts.Locale (Context));
   begin
      Written := 0;

      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
         return;
      end if;

      Humanize.I18N_Rendering.Render_Into
        (Context, Selection, Target, Written, Status);
   end Format_Into;

end Humanize.Bytes;
