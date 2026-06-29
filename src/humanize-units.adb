with Humanize.I18N_Rendering;
with Humanize.Unit_Classification;

package body Humanize.Units is

   function Format
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Unit    : Unit_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.I18N_Rendering.Render
               (Context, Humanize.Unit_Classification.Classify (Value, Unit));
   end Format;

   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Unit    : Unit_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Written := 0;
      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
         return;
      end if;
      Humanize.I18N_Rendering.Render_Into
        (Context, Humanize.Unit_Classification.Classify (Value, Unit),
         Target, Written, Status);
   end Format_Into;

end Humanize.Units;
