with Humanize.I18N_Rendering;
with Humanize.Number_Classification;

package body Humanize.Numbers is

   function Ordinal
     (Context : Humanize.Contexts.Context;
      Value   : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.I18N_Rendering.Render
               (Context, Humanize.Number_Classification.Ordinal (Value));
   end Ordinal;

   procedure Ordinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
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
        (Context, Humanize.Number_Classification.Ordinal (Value),
         Target, Written, Status);
   end Ordinal_Into;

   function Compact
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Options : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.I18N_Rendering.Render
               (Context,
                Humanize.Number_Classification.Compact (Value, Options));
   end Compact;

   procedure Compact_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options)
   is
   begin
      Written := 0;
      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
         return;
      end if;
      Humanize.I18N_Rendering.Render_Into
        (Context,
         Humanize.Number_Classification.Compact (Value, Options),
         Target, Written, Status);
   end Compact_Into;

end Humanize.Numbers;
