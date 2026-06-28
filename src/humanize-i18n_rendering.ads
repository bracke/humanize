with Humanize.Contexts;
with Humanize.Messages;
with Humanize.Selections;
with Humanize.Status;

--  The single boundary between Humanize and the i18n runtime.
--
--  This is the only package permitted to call I18N.Runtime, I18N.Arguments, or
--  I18N.Result.Output_Text (HUM-INV-002, HUM-INV-003). It also performs the
--  I18N-status to Humanize-status mapping.
private package Humanize.I18N_Rendering is

   --  True when Key resolves through the context's locale fallback chain.
   function Available
     (Context : Humanize.Contexts.Context;
      Key     : Humanize.Messages.Message_Id)
      return Boolean;

   --  Render Selection through the context's runtime, returning an owned text
   --  result.
   function Render
     (Context   : Humanize.Contexts.Context;
      Selection : Humanize.Selections.Message_Selection)
      return Humanize.Status.Text_Result;

   --  Render Selection into caller-owned storage. Target must be 1-based; a
   --  non-1-based buffer yields Invalid_Options with Written = 0.
   procedure Render_Into
     (Context   : Humanize.Contexts.Context;
      Selection : Humanize.Selections.Message_Selection;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);

end Humanize.I18N_Rendering;
