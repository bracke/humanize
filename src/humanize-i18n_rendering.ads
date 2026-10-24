with Humanize.Contexts;
with Humanize.Message_Keys;
with Humanize.Selections;
with Humanize.Status;

--  The single boundary between Humanize and the i18n runtime.
--
--  This is the only package permitted to call Messages.Runtime, Messages.Arguments, or
--  Messages.Result.Output_Text (HUM-INV-002, HUM-INV-003). It also performs the
--  I18N-status to Humanize-status mapping.
private package Humanize.I18N_Rendering is

   --  True when Key resolves through the context's locale fallback chain.
   function Available
     (Context : Humanize.Contexts.Context;
      Key     : Humanize.Message_Keys.Message_Id)
      return Boolean;

   --  Return a context backed by Humanize's built-in catalog runtime. Loaded is
   --  False if the built-in catalog could not be loaded.
   function Default_Context
     (Locale : String;
      Loaded : out Boolean)
      return Humanize.Contexts.Context;

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

   --  A phrase outside English, through its template in the context's
   --  locale; English -- the formatter's own wording, computed by the caller
   --  -- in English, where the locale has no translation, or where it fails.
   function Phrase_Or
     (Context   : Humanize.Contexts.Context;
      Selection : Humanize.Selections.Message_Selection;
      English   : Humanize.Status.Text_Result)
      return Humanize.Status.Text_Result;

   --  Selection with a caller's noun as phrase arguments: "one" (Singular),
   --  "other" (Plural, or Singular when Plural is ""), and "zero", "two",
   --  "few" and "many" -- the forms registered on Context for that plural
   --  (Humanize.Contexts.With_Noun_Forms), else the plural -- and
   --  "genitive_one"/"genitive_other"/"accusative_one"/"accusative_other",
   --  "locative_one"/"locative_other"/"instrumental_one"/"instrumental_other",
   --  else the singular or plural; and "gender", the registered gender or
   --  "other".
   function With_Nouns
     (Context   : Humanize.Contexts.Context;
      Selection : Humanize.Selections.Message_Selection;
      Singular  : String;
      Plural    : String)
      return Humanize.Selections.Message_Selection;

   --  The caller's noun for Count by the locale's plural rules -- Russian 21
   --  takes the singular, Polish 5 the registered many form -- and by the
   --  caller's English choice in English or where the locale's rules cannot
   --  render.
   function Noun
     (Context  : Humanize.Contexts.Context;
      Count    : Long_Float;
      Singular : String;
      Plural   : String;
      English  : String)
      return String;

   --  A calendar difference's components -- at most Max_Components of Years,
   --  Months and Days, zeros only with Include_Zero -- in CLDR's long units
   --  and grammatical case Case_Name ("nominative" for none), joined by the
   --  locale's unit list: German dative "2 Jahren und 3 Monaten". "" where a
   --  part cannot render, or no component is left.
   function Difference_Parts
     (Context        : Humanize.Contexts.Context;
      Years          : Natural;
      Months         : Natural;
      Days           : Natural;
      Max_Components : Natural;
      Include_Zero   : Boolean;
      Case_Name      : String)
      return String;

   --  Count Units ("hour") in CLDR's long unit and grammatical case Case_Name
   --  ("nominative" for none): German dative "3 Tagen". "" where it cannot
   --  render.
   function Duration_Part
     (Context   : Humanize.Contexts.Context;
      Unit      : String;
      Count     : Long_Long_Integer;
      Case_Name : String)
      return String;

   --  Phrase Name's text without arguments ("duration.case.stale_for"); ""
   --  where the locale has none.
   function Phrase_Text
     (Context : Humanize.Contexts.Context;
      Name    : String)
      return String;

   --  Phrase Name's text with the one argument Argument = Value (none where
   --  Argument is ""); "" where the locale cannot render it.
   function Phrase_Text_With
     (Context  : Humanize.Contexts.Context;
      Name     : String;
      Argument : String;
      Value    : String)
      return String;

end Humanize.I18N_Rendering;
