separate (Humanize.Numbers.Spellout)
function CLDR_Text
  (Context    : Humanize.Contexts.Context;
   Key        : Humanize.Message_Keys.Message_Id;
   Value_Text : String)
   return Humanize.Status.Text_Result
is
begin
   if Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context)) in "en" | "" then
      return (Status => Humanize.Status.Missing_Message, others => <>);
   end if;
   declare
      Text : constant Humanize.Status.Text_Result :=
        Humanize.I18N_Rendering.Render (Context, Humanize.Selections.Text_Value (Key, Value_Text));
   begin
      return (if Ada.Strings.Unbounded.Length (Text.Text) = 0
              then (Status => Humanize.Status.Missing_Message, others => <>)
              else Text);
   end;
end CLDR_Text;
