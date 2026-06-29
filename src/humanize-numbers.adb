with Humanize.I18N_Rendering;
with Humanize.Number_Classification;

package body Humanize.Numbers is

   function Ordinal
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Gender  : Ordinal_Gender := Masculine)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.I18N_Rendering.Render
               (Context,
                Humanize.Number_Classification.Ordinal (Value, Gender));
   end Ordinal;

   procedure Ordinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Gender  : Ordinal_Gender := Masculine)
   is
   begin
      Written := 0;
      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
         return;
      end if;
      Humanize.I18N_Rendering.Render_Into
        (Context, Humanize.Number_Classification.Ordinal (Value, Gender),
         Target, Written, Status);
   end Ordinal_Into;

   function Compact
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Options : Number_Options := Default_Number_Options;
      Style   : Compact_Style := Short)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.I18N_Rendering.Render
               (Context,
                Humanize.Number_Classification.Compact
                  (Value, Options, Humanize.Contexts.Locale (Context), Style));
   end Compact;

   procedure Compact_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options;
      Style   : Compact_Style := Short)
   is
   begin
      Written := 0;
      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
         return;
      end if;
      Humanize.I18N_Rendering.Render_Into
        (Context,
         Humanize.Number_Classification.Compact
           (Value, Options, Humanize.Contexts.Locale (Context), Style),
         Target, Written, Status);
   end Compact_Into;

   function Percent
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.I18N_Rendering.Render
               (Context,
                Humanize.Number_Classification.Percent
                  (Value, Options, Humanize.Contexts.Locale (Context)));
   end Percent;

   procedure Percent_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
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
         Humanize.Number_Classification.Percent
           (Value, Options, Humanize.Contexts.Locale (Context)),
         Target, Written, Status);
   end Percent_Into;

end Humanize.Numbers;
