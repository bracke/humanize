separate (Humanize.Tests.Strings.Test_String_Helpers)
   procedure Check_File_Name_And_Inflection_Labels is
   begin
      Check
        (Humanize.Strings.Symbolic_File_Mode (8#0755#),
         "rwxr-xr-x", "symbolic file mode");
      Check
        (Humanize.Strings.Symbolic_File_Mode
           (8#4755#, Humanize.Strings.Regular_File),
         "-rwsr-xr-x", "symbolic file mode setuid");
      Check
        (Humanize.Strings.Symbolic_File_Mode
           (8#1777#, Humanize.Strings.Directory_File),
         "drwxrwxrwt", "symbolic file mode sticky directory");
      Check
        (Humanize.Strings.Octal_File_Mode (8#0755#),
         "755", "octal file mode compact");
      Check
        (Humanize.Strings.Octal_File_Mode
           (8#0755#, Include_Special => True, Prefix => True),
         "0755", "octal file mode full prefixed");
      Check
        (Humanize.Strings.Octal_File_Mode (8#4755#),
         "4755", "octal file mode special compact");
      Check
        (Humanize.Strings.File_Mode_Summary
           (8#0640#, Humanize.Strings.Regular_File),
         "file, owner read/write; group read; others no access",
         "file mode summary");
      Check
        (Humanize.Strings.File_Mode_Summary
           (8#1777#, Humanize.Strings.Directory_File),
         "directory, owner read/write/execute; group read/write/execute; "
         & "others read/write/execute; sticky",
         "file mode summary special");
      Parse_Status :=
        Humanize.Strings.Parse_File_Mode
          ("-rwsr-xr-x", Parsed_Mode, Parsed_Kind);
      AUnit.Assertions.Assert
        (Parse_Status = Ok
         and then Parsed_Mode = 8#4755#
         and then Parsed_Kind = Humanize.Strings.Regular_File,
         "parse symbolic file mode");
      Parse_Status :=
        Humanize.Strings.Parse_File_Mode ("0755", Parsed_Mode, Parsed_Kind);
      AUnit.Assertions.Assert
        (Parse_Status = Ok
         and then Parsed_Mode = 8#0755#
         and then Parsed_Kind = Humanize.Strings.Mode_Only,
         "parse octal file mode");
      Parse_Status :=
        Humanize.Strings.Parse_File_Mode
          ("rwxr-xr-x", Parsed_Mode, Parsed_Kind);
      AUnit.Assertions.Assert
        (Parse_Status = Ok
         and then Parsed_Mode = 8#0755#
         and then Parsed_Kind = Humanize.Strings.Mode_Only,
         "parse symbolic mode without kind");
      Parse_Status :=
        Humanize.Strings.Parse_File_Mode
          ("rwxr-xr-q", Parsed_Mode, Parsed_Kind);
      AUnit.Assertions.Assert
        (Parse_Status = Invalid_Value, "reject invalid symbolic file mode");
      Check
        (Humanize.Strings.Search_Key ("  File_02-final.TXT "),
         "file 02 final txt", "search key");
      AUnit.Assertions.Assert
        (Humanize.Strings.Natural_Less ("file2", "file10"),
         "natural less file2 before file10");
      AUnit.Assertions.Assert
        (not Humanize.Strings.Natural_Less ("file10", "file2"),
         "natural less file10 not before file2");
      AUnit.Assertions.Assert
        (Humanize.Strings.Natural_Less ("file001", "file02"),
         "natural less strips leading zeros");
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Strings.Natural_Sort_Key ("file10"))
         < Support.Text (Humanize.Strings.Natural_Sort_Key ("file100")),
         "natural sort key compares digit run lengths");
      Check
        (Humanize.Strings.Initials ("Ada Lovelace Runtime"),
         "ALR", "initials");
      Check
        (Humanize.Strings.Possessive ("Chris"),
         "Chris'", "possessive");
      Check
        (Humanize.Strings.Clean_Name ("  Ada" & ASCII.HT & "Lovelace  "),
         "Ada Lovelace", "clean name");
      Check
        (Humanize.Strings.Person_Initials ("Ada Byron Lovelace", 2),
         "AB", "person initials limit");
      Check
        (Humanize.Strings.Person_Initials ("Ada Byron Lovelace", 0),
         "ABL", "person initials unlimited");
      Check
        (Humanize.Strings.Name_Part
           ("Ada Byron Lovelace", Humanize.Strings.Display_Given_Name),
         "Ada", "given name part");
      Check
        (Humanize.Strings.Name_Part
           ("Ada Byron Lovelace", Humanize.Strings.Display_Family_Name),
         "Lovelace", "family name part");
      Check
        (Humanize.Strings.Name_Part
           ("Lovelace, Ada", Humanize.Strings.Display_Full_Name,
            (Style              => Humanize.Strings.Display_Full_Name,
             Order              => Humanize.Strings.Family_Given_Order,
             Max_Initials       => 3,
             Preserve_Handle_At => True)),
         "Ada Lovelace", "family-given full name");
      Check
        (Humanize.Strings.Handle_Label ("ada", True),
         "@ada", "handle label adds at sign");
      Check
        (Humanize.Strings.Handle_Label ("@ada", False),
         "ada", "handle label can drop at sign");
      Check
        (Humanize.Strings.Email_Local_Part ("ada@example.org"),
         "ada", "email local part");
      Check
        (Humanize.Strings.Display_Name
           ("", "ada", "ada@example.org", "Anonymous"),
         "@ada", "display name falls back to handle");
      Check
        (Humanize.Strings.Display_Name
           ("", "", "ada@example.org", "Anonymous"),
         "ada", "display name falls back to email local part");
      Check
        (Humanize.Strings.Display_Name
           ("", "", "", "Anonymous"),
         "Anonymous", "display name falls back to anonymous label");
      Check
        (Humanize.Strings.Display_Name
           ("Ada Byron Lovelace", "", "", "Anonymous",
            (Style              => Humanize.Strings.Display_Initials,
             Order              => Humanize.Strings.Given_Family_Order,
             Max_Initials       => 2,
             Preserve_Handle_At => True)),
         "AB", "display name can use initials");
      Check
        (Humanize.Strings.Possessive_Name ("  Ada  "),
         "Ada's", "possessive name cleans input");
      declare
         People : constant Humanize.Strings.Name_List :=
           [To_Unbounded_String ("Ada Lovelace"),
            To_Unbounded_String ("Grace Hopper"),
            To_Unbounded_String ("Katherine Johnson")];
         Empty_People : constant Humanize.Strings.Name_List :=
           [1 => To_Unbounded_String ("  ")];
      begin
         Check
           (Humanize.Strings.Person_List (People, 2),
            "Ada Lovelace, Grace Hopper and 1 other",
            "person list with hidden tail");
         Check
           (Humanize.Strings.Person_List (People, 1),
            "Ada Lovelace and 2 others",
            "person list one visible");
         Check
           (Humanize.Strings.Person_List (Empty_People, 2, "nobody"),
            "nobody", "person list fallback");
      end;
      Check
        (Humanize.Strings.Transliterate_ASCII (UTF8_Text),
         "haello", "transliterate ASCII");
      Check
        (Humanize.Strings.Casefold_ASCII (UTF8_Text),
         "haello", "ASCII casefold");
      Check
        (Humanize.Strings.Pluralize ("category"),
         "categories", "pluralize");
      Check
        (Humanize.Strings.Singularize ("categories"),
         "category", "singularize");
      Check
        (Humanize.Strings.Pluralize ("person"),
         "people", "pluralize irregular");
      Check
        (Humanize.Strings.Singularize ("children"),
         "child", "singularize irregular");
      Check
        (Humanize.Strings.Pluralize ("ox"),
         "oxen", "pluralize expanded irregular");
      Check
        (Humanize.Strings.Singularize ("lice"),
         "louse", "singularize expanded irregular");
      Check
        (Humanize.Strings.Pluralize ("salesman"),
         "salesmen", "pluralize compound man irregular");
      Check
        (Humanize.Strings.Singularize ("policewomen"),
         "policewoman", "singularize compound woman irregular");
      Check
        (Humanize.Strings.Pluralize ("brother"),
         "brethren", "pluralize traditional irregular");
      Check
        (Humanize.Strings.Singularize ("kine"),
         "cow", "singularize traditional irregular");
      Check
        (Humanize.Strings.Pluralize ("Person"),
         "People", "pluralize preserves title case irregular");
      Check
        (Humanize.Strings.Singularize ("PEOPLE"),
         "PERSON", "singularize preserves all-caps irregular");
      Check
        (Humanize.Strings.Pluralize ("API"),
         "APIs", "pluralize preserves acronym stem");
      Check
        (Humanize.Strings.Singularize ("APIs"),
         "API", "singularize preserves acronym stem");
      Check
        (Humanize.Strings.Pluralize_With_Dictionary
           ("schema", "schema corpus", "schemata corpora"),
         "schemata", "pluralize custom dictionary");
      Check
        (Humanize.Strings.Singularize_With_Dictionary
           ("corpora", "schema corpus", "schemata corpora"),
         "corpus", "singularize custom dictionary");
      Check
        (Humanize.Strings.Pluralize_With_Options
           ("person", "person", "persons"),
         "persons", "pluralize options default dictionary first");
      Check
        (Humanize.Strings.Pluralize_With_Options
           ("person", "person", "persons",
            (Rule_Order => Humanize.Strings.Built_In_First,
             Preserve_Case => True)),
         "people", "pluralize options built-in first");
      Check
        (Humanize.Strings.Singularize_With_Options
           ("PERSONS", "person", "persons",
            (Rule_Order => Humanize.Strings.Dictionary_First,
             Preserve_Case => False)),
         "person", "singularize options can lowercase output");
      Check
        (Humanize.Strings.Pluralize ("equipment"),
         "equipment", "pluralize uncountable");
      Check
        (Humanize.Strings.Singularize ("news"),
         "news", "singularize uncountable");
      Check
        (Humanize.Strings.Pluralize ("software"),
         "software", "pluralize technical uncountable");
      Check
        (Humanize.Strings.Singularize ("metadata"),
         "metadata", "singularize technical uncountable");
      Check
        (Humanize.Strings.Pluralize ("analysis"),
         "analyses", "pluralize is to es");
      Check
        (Humanize.Strings.Singularize ("analyses"),
         "analysis", "singularize es to is");
      Check
        (Humanize.Strings.Pluralize ("criterion"),
         "criteria", "pluralize on to a");
      Check
        (Humanize.Strings.Singularize ("criteria"),
         "criterion", "singularize a to on");
      Check
        (Humanize.Strings.Pluralize ("medium"),
         "media", "pluralize um to a");
      Check
        (Humanize.Strings.Singularize ("media"),
         "medium", "singularize media");
      Check
        (Humanize.Strings.Pluralize ("corpus"),
         "corpora", "pluralize corpus");
      Check
        (Humanize.Strings.Singularize ("genera"),
         "genus", "singularize genera");
      Check
        (Humanize.Strings.Pluralize ("schema"),
         "schemata", "pluralize schema");
      Check
        (Humanize.Strings.Singularize ("vertebrae"),
         "vertebra", "singularize vertebrae");
      Check
        (Humanize.Strings.Pluralize ("cactus"),
         "cacti", "pluralize us to i");
      Check
        (Humanize.Strings.Singularize ("cacti"),
         "cactus", "singularize i to us");
      Check
        (Humanize.Strings.Pluralize ("matrix"),
         "matrices", "pluralize ix to ices");
      Check
        (Humanize.Strings.Singularize ("matrices"),
         "matrix", "singularize ices to ix");
      Check
        (Humanize.Strings.Pluralize ("wife"),
         "wives", "pluralize fe to ves");
      Check
        (Humanize.Strings.Singularize ("wives"),
         "wife", "singularize ves to fe");
      Check
        (Humanize.Strings.Pluralize ("leaf"),
         "leaves", "pluralize f to ves");
      Check
        (Humanize.Strings.Singularize ("leaves"),
         "leaf", "singularize ves to f");
      Check
        (Humanize.Strings.Pluralize ("hero"),
         "heroes", "pluralize selected o to oes");
      Check
        (Humanize.Strings.Singularize ("heroes"),
         "hero", "singularize selected oes");
      Check
        (Humanize.Strings.Pluralize_In_Language
           ("bil", Humanize.Strings.Danish_Inflection),
         "biler", "Danish pluralize regular");
      Check
        (Humanize.Strings.Singularize_In_Language
           ("biler", Humanize.Strings.Danish_Inflection),
         "bil", "Danish singularize regular");
      Check
        (Humanize.Strings.Pluralize_In_Language
           ("Kind", Humanize.Strings.German_Inflection),
         "Kinder", "German pluralize irregular preserves case");
      Check
        (Humanize.Strings.Singularize_In_Language
           ("Frauen", Humanize.Strings.German_Inflection),
         "Frau", "German singularize irregular preserves case");
      Check
        (Humanize.Strings.Pluralize_In_Language
           ("journal", Humanize.Strings.French_Inflection),
         "journaux", "French pluralize al to aux");
      Check
        (Humanize.Strings.Singularize_In_Language
           ("bateaux", Humanize.Strings.French_Inflection),
         "bateau", "French singularize eaux");
      Check
        (Humanize.Strings.Pluralize_In_Language
           ("luz", Humanize.Strings.Spanish_Inflection),
         "luces", "Spanish pluralize z to ces");
      Check
        (Humanize.Strings.Singularize_In_Language
           ("libros", Humanize.Strings.Spanish_Inflection),
         "libro", "Spanish singularize vowel s");
      Check
        (Humanize.Strings.Pluralize_In_Language
           ("banco", Humanize.Strings.Italian_Inflection),
         "banchi", "Italian pluralize hard co to chi");
      Check
        (Humanize.Strings.Singularize_In_Language
           ("ragazze", Humanize.Strings.Italian_Inflection),
         "ragazza", "Italian singularize e to a");
      Check
        (Humanize.Strings.Pluralize_In_Language
           ("animal", Humanize.Strings.Portuguese_Inflection),
         "animais", "Portuguese pluralize l to is");
      Check
        (Humanize.Strings.Singularize_In_Language
           ("homens", Humanize.Strings.Portuguese_Inflection),
         "homem", "Portuguese singularize irregular");
      Check
        (Humanize.Strings.Pluralize_In_Language
           ("kind", Humanize.Strings.Dutch_Inflection),
         "kinderen", "Dutch pluralize irregular");
      Check
        (Humanize.Strings.Singularize_In_Language
           ("boeken", Humanize.Strings.Dutch_Inflection),
         "boek", "Dutch singularize en");
      Check
        (Humanize.Strings.Pluralize_In_Language
           ("flicka", Humanize.Strings.Swedish_Inflection),
         "flickor", "Swedish pluralize a to or");
      Check
        (Humanize.Strings.Singularize_In_Language
           ("bilar", Humanize.Strings.Swedish_Inflection),
         "bil", "Swedish singularize ar");
      Check
        (Humanize.Strings.Pluralize_In_Language
           ("bok", Humanize.Strings.Norwegian_Bokmal_Inflection),
         "boker", "Norwegian Bokmal pluralize regular");
      Check
        (Humanize.Strings.Singularize_In_Language
           ("boker", Humanize.Strings.Norwegian_Bokmal_Inflection),
         "bok", "Norwegian Bokmal singularize regular");
      Check
        (Humanize.Strings.Pluralize_In_Language
           ("talo", Humanize.Strings.Finnish_Inflection),
         "talot", "Finnish pluralize nominative t");
      Check
        (Humanize.Strings.Singularize_In_Language
           ("talot", Humanize.Strings.Finnish_Inflection),
         "talo", "Finnish singularize nominative t");
      Check
        (Humanize.Strings.Pluralize_In_Language
           ("kitap", Humanize.Strings.Turkish_Inflection),
         "kitaplar", "Turkish pluralize back-vowel harmony");
      Check
        (Humanize.Strings.Pluralize_In_Language
           ("ev", Humanize.Strings.Turkish_Inflection),
         "evler", "Turkish pluralize front-vowel harmony");
      Check
        (Humanize.Strings.Singularize_In_Language
           ("evler", Humanize.Strings.Turkish_Inflection),
         "ev", "Turkish singularize front-vowel harmony");
      Check
        (Humanize.Strings.Inflection_Language_Label
           (Humanize.Strings.Norwegian_Bokmal_Inflection),
         "nb", "inflection language label");
      AUnit.Assertions.Assert
        (Humanize.Strings.Pluralize_Source
           ("schema", "schema corpus", "schemata corpora")
         = Humanize.Strings.Dictionary_Inflection,
         "pluralize source dictionary");
      AUnit.Assertions.Assert
        (Humanize.Strings.Pluralize_Source ("person")
         = Humanize.Strings.Irregular_Inflection,
         "pluralize source irregular");
      AUnit.Assertions.Assert
        (Humanize.Strings.Pluralize_Source ("category")
         = Humanize.Strings.Rule_Inflection,
         "pluralize source rule");
      AUnit.Assertions.Assert
        (Humanize.Strings.Pluralize_Source ("equipment")
         = Humanize.Strings.Uncountable_Inflection,
         "pluralize source uncountable unchanged");
      AUnit.Assertions.Assert
        (Humanize.Strings.Singularize_Source ("news")
         = Humanize.Strings.Uncountable_Inflection,
         "singularize source uncountable unchanged");
      AUnit.Assertions.Assert
        (Humanize.Strings.Pluralize_Source_With_Options
           ("person", "person", "persons")
         = Humanize.Strings.Dictionary_Inflection,
         "pluralize source options dictionary first");
      AUnit.Assertions.Assert
        (Humanize.Strings.Pluralize_Source_With_Options
           ("person", "person", "persons",
            (Rule_Order => Humanize.Strings.Built_In_First,
             Preserve_Case => True))
         = Humanize.Strings.Irregular_Inflection,
         "pluralize source options built-in first");
      Check
        (Humanize.Strings.Inflection_Source_Label
           (Humanize.Strings.Uncountable_Inflection),
         "uncountable", "inflection source label");
   end Check_File_Name_And_Inflection_Labels;
