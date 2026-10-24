--  Writes the phrase review page's data (data.json) to standard output:
--  every humanize phrase as each locale renders it, with the sample counts 1
--  and 5, and the translators' notes from a notes file. A domain label
--  (label.*) gets a row per choice of its first select, its text arguments
--  shown as "[name]".
--
--     phrase_review_data docs/phrase_notes.tsv > data.json
--
--  The caller's noun appears as markers -- "file", "files", "files(gen)" --
--  so a reviewer sees which of its forms each translation uses.
with Ada.Command_Line;
with Ada.Strings.Fixed;
with Ada.Strings.Maps;
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

   Runtime   : Messages.Runtime.Instance;
   Loaded    : Messages.Runtime.Load_Result;
   First_Row : Boolean := True;

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
         (+"kind", +"archive"), (+"checksum", +"abc123"), (+"expected", +"image"), (+"offset", +"UTC+02:00"),
         (+"phase", +"mid"),
         (+"date", +"9 Oct 2026"), (+"first", +"9 Oct 2026"), (+"last", +"15 Oct 2026"),
         (+"time", +"2 hours ago"), (+"low", +"10"), (+"high", +"20"), (+"delta", +"0.5"),
         (+"bounds", +"1-10"), (+"numerator", +"3 errors"), (+"denominator", +"1,000 requests"),
         (+"whole", +"20"), (+"tail", +"files"), (+"change", +"up 5"), (+"since", +"last week"),
         (+"duration", +"3 hours"), (+"relative", +"in 3 hours"), (+"case", +"nominative"), (+"style", +"long"),
         (+"degrees", +"45 deg"), (+"direction", +"northeast"), (+"distance", +"5 km"),
         (+"latitude", +"52.52 deg N"), (+"longitude", +"13.40 deg E"), (+"southwest", +"52.3 deg N, 13.1 deg E"),
         (+"northeast", +"52.7 deg N, 13.8 deg E")];
   begin
      for Name of Numbers loop
         Messages.Arguments.Set (Args, To_String (Name), Count);
      end loop;
      for Sample of Samples loop
         Messages.Arguments.Set (Args, To_String (Sample.Code), To_String (Sample.Name));
      end loop;
   end Fill;

   --  The Index'th comma-separated item of List; "" past the end.
   function Item (List : String; Index : Positive) return String is
      Seen  : Positive := 1;
      Start : Positive := List'First;
   begin
      for I in List'Range loop
         if List (I) = ',' then
            if Seen = Index then
               return List (Start .. I - 1);
            end if;
            Seen := Seen + 1;
            Start := I + 1;
         end if;
      end loop;
      return (if Seen = Index then List (Start .. List'Last) else "");
   end Item;

   --  The Index'th '|'-separated field of a phrase's arguments (1 numeric, 2
   --  select, 3 text).
   function Field (Arguments : String; Index : Positive) return String is
      Seen  : Positive := 1;
      Start : Positive := Arguments'First;
   begin
      for I in Arguments'Range loop
         if Arguments (I) = '|' then
            if Seen = Index then
               return Arguments (Start .. I - 1);
            end if;
            Seen := Seen + 1;
            Start := I + 1;
         end if;
      end loop;
      return (if Seen = Index then Arguments (Start .. Arguments'Last) else "");
   end Field;

   --  The first select argument with its own choices ("state=a/b/c"), or "".
   function First_Choices (Arguments : String) return String is
      Selects : constant String := Field (Arguments, 2);
   begin
      for I in 1 .. Selects'Length loop
         exit when Item (Selects, I) = "";
         if Ada.Strings.Fixed.Index (Item (Selects, I), "=") > 0 then
            return Item (Selects, I);
         end if;
      end loop;
      return "";
   end First_Choices;

   --  A domain label (label.*): its text arguments as "[name]" markers, its
   --  counts Count, its first choice-carrying select Choice.
   procedure Fill_Label
     (Args      : in out Messages.Arguments.Arguments;
      Arguments : String;
      Count     : String;
      Choice    : String)
   is
      Numbers : constant String := Field (Arguments, 1);
      Texts   : constant String := Field (Arguments, 3);
      Selects : constant String := Field (Arguments, 2);
      Chosen  : constant String := First_Choices (Arguments);
   begin
      for I in 1 .. Numbers'Length loop
         exit when Item (Numbers, I) = "";
         Messages.Arguments.Set (Args, Item (Numbers, I), Count);
      end loop;
      for I in 1 .. Texts'Length loop
         exit when Item (Texts, I) = "";
         Messages.Arguments.Set (Args, Item (Texts, I), "[" & Item (Texts, I) & "]");
      end loop;
      --  every select its first choice, then the row's select its Choice
      for I in 1 .. Selects'Length loop
         exit when Item (Selects, I) = "";
         declare
            One    : constant String := Item (Selects, I);
            Equals : constant Natural := Ada.Strings.Fixed.Index (One, "=");
            Slash  : constant Natural := Ada.Strings.Fixed.Index (One, "/");
         begin
            if Equals > 0 then
               Messages.Arguments.Set
                 (Args, One (One'First .. Equals - 1), One (Equals + 1 .. (if Slash = 0 then One'Last else Slash - 1)));
            end if;
         end;
      end loop;
      if Chosen /= "" then
         Messages.Arguments.Set (Args, Chosen (Chosen'First .. Ada.Strings.Fixed.Index (Chosen, "=") - 1), Choice);
      end if;
   end Fill_Label;

   function Rendered (Locale, Name, Count : String; Arguments : String := ""; Choice : String := "") return String is
      Args : Messages.Arguments.Arguments;
   begin
      Fill (Args, Count);
      if Name'Length > 6 and then Name (Name'First .. Name'First + 5) = "label." then
         Fill_Label (Args, Arguments, Count, Choice);
      end if;
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
         Name      : constant String := Humanize.Parsing.Phrases.Phrase_Name (K);
         Arguments : constant String := Humanize.Parsing.Phrases.Phrase_Arguments (K);
         Chosen    : constant String := First_Choices (Arguments);
         Equals    : constant Natural := Ada.Strings.Fixed.Index (Chosen, "=");
         --  The choices comma-separated, as Item reads them.
         Choices   : constant String :=
           (if Chosen = "" then ""
            else Ada.Strings.Fixed.Translate
              (Chosen (Equals + 1 .. Chosen'Last), Ada.Strings.Maps.To_Mapping ("/", ",")));
         Is_Label  : constant Boolean := Name'Length > 6 and then Name (Name'First .. Name'First + 5) = "label.";

         --  One row: the phrase with Choice for its first select.
         procedure Row (Choice : String) is
         begin
            Put ((if First_Row then "" else ",") & "{""key"":"
                 & Quoted
                     (Name & (if Choice = "" then "" else " " & Chosen (Chosen'First .. Equals - 1) & "=" & Choice))
                 & ",""cells"":[");
            First_Row := False;
            for I in Locales'Range loop
               declare
                  Code : constant String := To_String (Locales (I).Code);
               begin
                  Put ((if I > Locales'First then "," else "")
                       & "[" & Quoted (Rendered (Code, Name, "1", Arguments, Choice)) & ","
                       & Quoted (Rendered (Code, Name, "5", Arguments, Choice)) & "]");
               end;
            end loop;
            Put ("]}");
         end Row;
      begin
         if Choices = "" or else not Is_Label then
            Row ("");
         else
            --  a label row per choice of its first select, so each branch is reviewed
            for I in 1 .. Choices'Length loop
               exit when Item (Choices, I) = "";
               Row (Item (Choices, I));
            end loop;
         end if;
      end;
   end loop;
   Put_Line ("]}");
end Phrase_Review_Data;
