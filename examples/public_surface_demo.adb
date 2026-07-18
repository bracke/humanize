with Ada.Text_IO;

with I18N.Runtime;

with Humanize.Bounded_Text;
with Humanize.Catalogs;
with Humanize.Colors;
with Humanize.Colors.Contrast;
with Humanize.Colors.Models;
with Humanize.Contexts;
with Humanize.Numbers.Editorial;
with Humanize.Numbers.Ranges;
with Humanize.Numbers.Scales;
with Humanize.Numbers.Spellout;
with Humanize.Numbers.Statistics;
with Humanize.Parsing;
with Humanize.Parsing.Colors;
with Humanize.Phrases;
with Humanize.Phrases.Fields;
with Humanize.Phrases.Severity;
with Humanize.Status;
with Humanize.Strings.Core;
with Humanize.Strings.Display;
with Humanize_Demo_Runtime;

procedure Public_Surface_Demo is
   use Ada.Text_IO;

   function Text (Result : Humanize.Status.Text_Result) return String is
     (Humanize.Bounded_Text.Result_Text (Result));

   procedure Show
     (Label  : String;
      Result : Humanize.Status.Text_Result)
   is
   begin
      Put_Line ("  " & Label & " : " & Text (Result));
   end Show;

   Loaded : I18N.Runtime.Load_Result;
   Indigo : constant Humanize.Colors.RGB_Color :=
     (Red => 46, Green => 76, Blue => 146);
   White  : constant Humanize.Colors.RGB_Color :=
     (Red => 255, Green => 255, Blue => 255);
begin
   Humanize.Catalogs.Load_Defaults (Humanize_Demo_Runtime.Runtime, Loaded);

   declare
      Context : constant Humanize.Contexts.Context :=
        Humanize.Contexts.Create
          (Humanize_Demo_Runtime.Runtime'Access, "en");
      Parsed_Color : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Colors.Parse_RGB_Label ("rgb(46, 76, 146)");
   begin
      Put_Line ("Public surface:");
      Show
        ("number editorial",
         Humanize.Numbers.Editorial.Editorial_Measurement
           (Context, 9.5, "ms"));
      Show
        ("number range",
         Humanize.Numbers.Ranges.Qualified_Range
           (Context, 3, 7, Humanize.Numbers.Include_High_Only));
      Show
        ("number scale",
         Humanize.Numbers.Scales.Scientific_Notation
           (Context, 1_234_000.0));
      Show
        ("number spellout",
         Humanize.Numbers.Spellout.Currency_Words
           (Context, 12.5, "dollar", "cent", 2));
      Show
        ("number statistics",
         Humanize.Numbers.Statistics.Distribution_Shape_Label
           (Count => 20,
            Minimum => 1.0,
            Q1 => 2.0,
            Median => 3.0,
            Q3 => 4.0,
            Maximum => 12.0,
            Outliers => 1,
            Unit => "ms"));
      Show
        ("color contrast",
         Humanize.Colors.Contrast.Contrast_Label (Indigo, White));
      Show
        ("color model",
         Humanize.Colors.Models.Brightness_Label (Context, Indigo));
      Show
        ("string core",
         Humanize.Strings.Core.Title_Case_Smart ("api response url"));
      Show
        ("string display",
         Humanize.Strings.Display.Truncate_Display_Width
           ("alpha beta gamma", 10));
      Show
        ("phrase status",
         Humanize.Phrases.Status_Phrase
           (Context, Humanize.Phrases.Complete));
      Show
        ("phrase field",
         Humanize.Phrases.Fields.Field_Change_Summary
           (Context, Changed => 2, Added => 1, Removed => 0));
      Show
        ("phrase severity",
         Humanize.Phrases.Severity.Severity_Label
           (Humanize.Phrases.Warning_Severity));
      Put_Line
        ("  parsing color : "
         & Humanize.Status.Status_Code'Image (Parsed_Color.Status));
   end;
end Public_Surface_Demo;
