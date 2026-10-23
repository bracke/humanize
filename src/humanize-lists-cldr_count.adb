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
      --  The noun form for the count's CLDR category: Russian 21 takes the
      --  singular, Polish 5 the registered many form.
      Result : constant Humanize.Status.Text_Result :=
        Humanize.I18N_Rendering.Render
          (Context,
           Humanize.I18N_Rendering.With_Nouns
             (Context,
              Humanize.Selections.With_Arg
                (Humanize.Selections.Phrase ("count"), "count", Long_Long_Integer (Quantity)),
              Singular, Plural));
   begin
      if Result.Status /= Humanize.Status.Ok then
         return Result;
      end if;
      --  Without a noun the count stands alone.
      return Ok_Text (Ada.Strings.Fixed.Trim (To_String (Result.Text), Ada.Strings.Right));
   end;
end CLDR_Count;
