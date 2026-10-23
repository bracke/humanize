with Ada.Strings.Fixed;

with Humanize.Locales;

separate (Humanize.Lists)
function CLDR_Count
  (Context  : Humanize.Contexts.Context;
   Quantity : Natural;
   Singular : String;
   Plural   : String)
   return Humanize.Status.Text_Result
is
begin
   if Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context)) in "en" | "" then
      return (Status => Humanize.Status.Missing_Message, others => <>);
   end if;
   declare
      --  Singular for CLDR's "one", Plural (or Singular, as no English "s"
      --  applies) otherwise: Russian 21 takes the singular.
      Result : constant Humanize.Status.Text_Result :=
        Humanize.I18N_Rendering.Render
          (Context,
           Humanize.Selections.Count_Value_Suffix
             (Humanize.Message_Keys.Lists_Count,
              Humanize.Selections.Count_Value (Quantity),
              Singular,
              (if Plural'Length > 0 then Plural else Singular)));
   begin
      if Result.Status /= Humanize.Status.Ok then
         return Result;
      end if;
      --  Without a noun the count stands alone.
      return Ok_Text (Ada.Strings.Fixed.Trim (To_String (Result.Text), Ada.Strings.Right));
   end;
end CLDR_Count;
