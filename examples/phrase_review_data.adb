--  Writes the phrase review page's data (data.json) to standard output:
--  every humanize phrase as each locale renders it, with the sample counts 1
--  and 5, and the translators' notes from a notes file.
--
--     phrase_review_data docs/phrase_notes.tsv > data.json
--
--  The caller's noun appears as markers -- "file", "files", "files(gen)" --
--  so a reviewer sees which of its forms each translation uses.
with Ada.Command_Line;
with Ada.Strings.Unbounded;
with Ada.Text_IO;

with Messages.Arguments;
with Messages.Result;
with Messages.Runtime;

with Humanize.Catalogs;
with Humanize.Parsing.Phrases;

procedure Phrase_Review_Data is
   use Ada.Strings.Unbounded;
   use Ada.Text_IO;

   Runtime : Messages.Runtime.Instance;
   Loaded  : Messages.Runtime.Load_Result;

   type Locale_Row is record
      Code : Unbounded_String;
      Name : Unbounded_String;
   end record;

   function "+" (Text : String) return Unbounded_String renames To_Unbounded_String;

   Locales : constant array (Positive range <>) of Locale_Row :=
     [(+"en", +"English"), (+"en-GB", +"English (UK)"), (+"en-CA", +"English (Canada)"),
      (+"da", +"Danish"), (+"de", +"German"),
      (+"de-CH", +"German (Switzerland)"), (+"de-LI", +"German (Liechtenstein)"), (+"fr", +"French"),
      (+"fr-CA", +"French (Canada)"), (+"fr-CH", +"French (Switzerland)"), (+"fr-BE", +"French (Belgium)"),
      (+"es", +"Spanish"), (+"es-419", +"Spanish (Latin America)"), (+"it", +"Italian"),
      (+"pt", +"Portuguese (Brazil)"), (+"pt-PT", +"Portuguese (Portugal)"), (+"nl", +"Dutch"),
      (+"sv", +"Swedish"), (+"no", +"Norwegian"),
      (+"nb", +("Norwegian Bokm" & Character'Val (16#C3#) & Character'Val (16#A5#) & "l")), (+"fi", +"Finnish"),
      (+"pl", +"Polish"), (+"cs", +"Czech"), (+"sk", +"Slovak"), (+"sl", +"Slovenian"),
      (+"ru", +"Russian"), (+"uk", +"Ukrainian"), (+"lt", +"Lithuanian"), (+"hu", +"Hungarian"),
      (+"ro", +"Romanian"), (+"tr", +"Turkish"), (+"id", +"Indonesian"), (+"ms", +"Malay"),
      (+"eo", +"Esperanto"), (+"vi", +"Vietnamese"), (+"sw", +"Swahili"), (+"af", +"Afrikaans"),
      (+"ja", +"Japanese"), (+"ko", +"Korean"), (+"zh", +"Chinese (Simplified)"),
      (+"zh-Hant", +"Chinese (Traditional)"), (+"zh-HK", +"Chinese (Hong Kong)"), (+"ar", +"Arabic"),
      (+"hi", +"Hindi")];

   --  Text as a JSON string literal.
   function Quoted (Text : String) return String is
      Result : Unbounded_String := +"""";
   begin
      for C of Text loop
         case C is
            when '"' => Append (Result, "\""");
            when '\' => Append (Result, "\\");
            when Character'Val (10) => Append (Result, "\n");
            when Character'Val (0) .. Character'Val (9) | Character'Val (11) .. Character'Val (31) =>
               null;
            when others => Append (Result, C);
         end case;
      end loop;
      Append (Result, """");
      return To_String (Result);
   end Quoted;

   procedure Fill (Args : in out Messages.Arguments.Arguments; Count : String) is
      Numbers : constant array (Positive range <>) of Unbounded_String :=
        [+"total", +"matching", +"visible", +"remaining", +"page", +"size", +"first", +"last", +"position",
         +"selected", +"showing", +"count", +"hidden", +"done", +"step", +"attempt", +"rate", +"days",
         +"hours", +"every", +"hits", +"misses", +"changed", +"added", +"removed", +"available",
         +"unavailable", +"code", +"done", +"unique", +"duplicates", +"outliers",
         +"part", +"year", +"number",
         +"fields", +"errors", +"warnings", +"required", +"hidden"];
      Samples : constant array (Positive range <>) of Locale_Row :=
        [(+"one", +"file"), (+"other", +"files"), (+"zero", +"files(zero)"), (+"two", +"files(two)"),
         (+"few", +"files(few)"), (+"many", +"files(many)"), (+"genitive_one", +"file(gen)"),
         (+"genitive_other", +"files(gen)"), (+"accusative_one", +"file(acc)"),
         (+"accusative_other", +"files(acc)"),
         (+"locative_one", +"file(loc)"), (+"locative_other", +"files(loc)"), (+"instrumental_one", +"file(ins)"),
         (+"instrumental_other", +"files(ins)"), (+"gender", +"other"), (+"severity", +"warning"),
         (+"unit", +"item"),
         (+"field", +"Title"), (+"before", +"Draft"), (+"after", +"Final"), (+"value", +"2.5"),
         (+"current", +"Today"), (+"baseline", +"Yesterday"), (+"quantity", +"5 MB"),
         (+"details", +"3 files queued, 1 failed"), (+"domain", +"sync"), (+"state", +"running"),
         (+"difference", +"2 years"), (+"measure", +"12.5 %"), (+"percent", +"50"), (+"name", +"Import"),
         (+"signal", +"SIGKILL killed"), (+"choices", +"S, M, L"), (+"actual", +"XL"),
         (+"endpoint", +"api.example.com"), (+"subject", +"Import"), (+"text", +"[label]"),
         (+"detail", +"expired"), (+"reason", +"killed"), (+"path", +"user.email"),
         (+"kind", +"archive"), (+"checksum", +"abc123"), (+"expected", +"image"), (+"offset", +"UTC+02:00"), (+"phase", +"mid"),
         (+"date", +"9 Oct 2026"), (+"first", +"9 Oct 2026"), (+"last", +"15 Oct 2026"),
         (+"time", +"2 hours ago"), (+"low", +"10"), (+"high", +"20"), (+"delta", +"0.5"),
         (+"bounds", +"1-10"), (+"numerator", +"3 errors"), (+"denominator", +"1,000 requests"),
         (+"whole", +"20"), (+"tail", +"files"), (+"change", +"up 5"), (+"since", +"last week")];
   begin
      for Name of Numbers loop
         Messages.Arguments.Set (Args, To_String (Name), Count);
      end loop;
      for Sample of Samples loop
         Messages.Arguments.Set (Args, To_String (Sample.Code), To_String (Sample.Name));
      end loop;
   end Fill;

   function Rendered (Locale, Name, Count : String) return String is
      Args : Messages.Arguments.Arguments;
   begin
      Fill (Args, Count);
      declare
         Result : constant Messages.Result.Render_Result :=
           Messages.Runtime.Render (Runtime, Locale, "humanize.phrase." & Name, Args);
      begin
         return (if Messages.Result."=" (Result.Status, Messages.Result.Success)
                 then Messages.Result.Output_Text (Result.Text) else "");
      end;
   end Rendered;

   --  The notes file's lines for Locale, as a JSON array.
   function Notes (Locale : String) return String is
      Result : Unbounded_String := +"[";
      File   : File_Type;
   begin
      if Ada.Command_Line.Argument_Count < 1 then
         return "[]";
      end if;
      Open (File, In_File, Ada.Command_Line.Argument (1));
      while not End_Of_File (File) loop
         declare
            Line : constant String := Get_Line (File);
         begin
            if Line'Length > Locale'Length
              and then Line (Line'First .. Line'First + Locale'Length) = Locale & ASCII.HT
            then
               if Length (Result) > 1 then
                  Append (Result, ",");
               end if;
               Append (Result, Quoted (Line (Line'First + Locale'Length + 1 .. Line'Last)));
            end if;
         end;
      end loop;
      Close (File);
      Append (Result, "]");
      return To_String (Result);
   end Notes;
begin
   Humanize.Catalogs.Load_Defaults (Runtime, Loaded);
   Put ("{""locales"":[");
   for I in Locales'Range loop
      Put ((if I > Locales'First then "," else "")
           & "{""code"":" & Quoted (To_String (Locales (I).Code)) & ",""name"":"
           & Quoted (To_String (Locales (I).Name)) & ",""notes"":" & Notes (To_String (Locales (I).Code)) & "}");
   end loop;
   Put ("],""keys"":[");
   for K in 1 .. Humanize.Parsing.Phrases.Phrase_Count loop
      declare
         Name : constant String := Humanize.Parsing.Phrases.Phrase_Name (K);
      begin
         Put ((if K > 1 then "," else "") & "{""key"":" & Quoted (Name) & ",""cells"":[");
         for I in Locales'Range loop
            declare
               Code : constant String := To_String (Locales (I).Code);
            begin
               Put ((if I > Locales'First then "," else "")
                    & "[" & Quoted (Rendered (Code, Name, "1")) & "," & Quoted (Rendered (Code, Name, "5")) & "]");
            end;
         end loop;
         Put ("]}");
      end;
   end loop;
   Put_Line ("]}");
end Phrase_Review_Data;
