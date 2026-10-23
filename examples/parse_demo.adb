with Ada.Text_IO;

with Messages.Runtime;

with Humanize.Catalogs;
with Humanize.Contexts;
with Humanize.Parsing;
with Humanize.Parsing.Localized;
with Humanize.Parsing.Phrases;
with Humanize.Status;
with Humanize_Demo_Runtime;

procedure Parse_Demo is
   use Ada.Text_IO;
   use type Humanize.Status.Status_Code;

   Bytes : constant Humanize.Parsing.Byte_Parse_Result :=
     Humanize.Parsing.Parse_Bytes ("1.5 KiB");
   Duration : constant Humanize.Parsing.Duration_Parse_Result :=
     Humanize.Parsing.Parse_Duration ("2 hours, 30 minutes");
   Loaded : Messages.Runtime.Load_Result;
begin
   if Bytes.Status = Humanize.Status.Ok then
      Put_Line ("bytes consumed:" & Natural'Image (Bytes.Consumed));
   end if;

   if Duration.Status = Humanize.Status.Ok then
      Put_Line ("duration consumed:" & Natural'Image (Duration.Consumed));
   end if;

   --  A phrase read back in the locale that wrote it.
   Humanize.Catalogs.Load_Defaults (Humanize_Demo_Runtime.Runtime, Loaded, Locale => "de");
   declare
      Page : constant Humanize.Parsing.Phrases.Phrase_Parse_Result :=
        Humanize.Parsing.Phrases.Parse
          (Humanize.Contexts.Create (Humanize_Demo_Runtime.Runtime'Access, "de"), "page_count", "Seite 3 von 5");
   begin
      if Page.Status = Humanize.Status.Ok then
         Put_Line ("page:" & Long_Long_Integer'Image (Humanize.Parsing.Phrases.Number (Page, "page"))
                   & " of" & Long_Long_Integer'Image (Humanize.Parsing.Phrases.Number (Page, "total")));
      end if;
   end;

   --  A duration read back as German writes it.
   declare
      Span : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Localized.Parse_Duration
          (Humanize.Contexts.Create (Humanize_Demo_Runtime.Runtime'Access, "de"), "2 Stunden, 30 Minuten");
   begin
      if Span.Status = Humanize.Status.Ok then
         Put_Line ("seconds:" & Span.Value'Image);
      end if;
   end;
end Parse_Demo;
