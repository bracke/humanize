separate (Humanize.Tests.Strings.Test_String_Helpers)
   procedure Check_Terminal_Prose_And_Metadata_Labels is
   begin
      Check
        (Humanize.Strings.Key_Value_Line ("Status", "ok"),
         "Status: ok",
         "key value line");
      Check
        (Humanize.Strings.Aligned_Key_Value_Line ("ID", "42", 6),
         "ID     : 42",
         "aligned key value line");
      Check
        (Humanize.Strings.Table_Row_2 ("Name", "Alice", 8),
         "Name      Alice",
         "two-column table row");
      Check
        (Humanize.Strings.Table_Row_3 ("ID", "Name", "42", 4, 6),
         "ID    Name    42",
         "three-column table row");
      Check
        (Humanize.Strings.Table_2
           ([To_Unbounded_String ("Name"), To_Unbounded_String ("Plan")],
            [To_Unbounded_String ("Alice"), To_Unbounded_String ("Pro")],
            6),
         "Name    Alice" & ASCII.LF & "Plan    Pro",
         "two-column table");
      Check
        (Humanize.Strings.Table_3
           ([To_Unbounded_String ("ID"), To_Unbounded_String ("Role")],
            [To_Unbounded_String ("Name"), To_Unbounded_String ("Admin")],
            [To_Unbounded_String ("42"), To_Unbounded_String ("yes")],
            4, 6),
         "ID    Name    42" & ASCII.LF & "Role  Admin   yes",
         "three-column table");
      Check
        (Humanize.Strings.Transliterate_ASCII
           (L_Stroke & O_Acute & "d" & Z_Acute & " " & C_Caron & "esko"),
         "Lodz Cesko",
         "Latin Extended transliteration");
      Check
        (Humanize.Strings.Transliterate_ASCII (Greek_Athens),
         "Athina", "Greek transliteration");
      Check
        (Humanize.Strings.Transliterate_ASCII (Cyrillic_Moscow),
         "Moskva", "Cyrillic transliteration");
      Check
        (Humanize.Strings.Transliterate_ASCII (Hebrew_Abgd),
         "abgd", "Hebrew transliteration");
      Check
        (Humanize.Strings.Transliterate_ASCII (Arabic_Slam),
         "slam", "Arabic transliteration");
      Check
        (Humanize.Strings.Transliterate_ASCII (Armenian_Hay),
         "hay", "Armenian transliteration");
      Check
        (Humanize.Strings.Transliterate_ASCII (Georgian_Abg),
         "abg", "Georgian transliteration");
      Check
        (Humanize.Strings.Grapheme_Slice
           ("a" & "e" & Combining_Acute & Family_Emoji & "z", 2, 3),
         "e" & Combining_Acute & Family_Emoji,
         "grapheme slice keeps clusters");
      Check
        (Humanize.Strings.Truncate_Grapheme_Words
           ("alpha " & Family_Emoji & " beta", 10),
         "alpha...", "grapheme word truncate");
      Humanize.Strings.Truncate_UTF8_Into
        (UTF8_Text, 4, Buffer, Written, Code, ".");
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "h" & AE & "l.",
         "UTF-8 truncate into");
      Humanize.Strings.UTF8_Slice_Into
        (UTF8_Text, 2, 4, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = AE & "ll",
         "UTF-8 slice into");
      Humanize.Strings.Truncate_Graphemes_Into
        ("a" & Family_Emoji & "b" & "c", 3, Buffer, Written, Code, ".");
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "a" & Family_Emoji & ".",
         "grapheme truncate into");
      Humanize.Strings.Truncate_Display_Width_Into
        ("a" & Family_Emoji & "bc", 4, Buffer, Written, Code, ".");
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "a" & Family_Emoji & ".",
         "display-width truncate into");
      Humanize.Strings.Truncate_ANSI_Display_Width_Into
        (Red_Start & "ab" & Family_Emoji & "cd" & Reset,
         5, Buffer, Written, Code, ".");
      AUnit.Assertions.Assert
        (Code = Ok
         and then Buffer (1 .. Written) = Red_Start & "ab" & Family_Emoji & ".",
         "ANSI display-width truncate into");
      Humanize.Strings.Wrap_ANSI_Display_Width_Into
        (Red_Start & "abcd" & Reset & " ef", 4, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok
         and then Buffer (1 .. Written) =
           Red_Start & "abcd" & Reset & ASCII.LF & "ef",
         "ANSI display-width wrap into");
      Humanize.Strings.Aligned_Key_Value_Line_Into
        ("ID", "42", 6, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "ID     : 42",
         "aligned key value line into");
      Humanize.Strings.Table_Row_3_Into
        ("ID", "Name", "42", 4, 6, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "ID    Name    42",
         "three-column table row into");
      Humanize.Strings.Table_2_Into
        ([To_Unbounded_String ("Name"), To_Unbounded_String ("Plan")],
         [To_Unbounded_String ("Alice"), To_Unbounded_String ("Pro")],
         6, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok
         and then Buffer (1 .. Written) =
           "Name    Alice" & ASCII.LF & "Plan    Pro",
         "two-column table into");
      Humanize.Strings.Grapheme_Slice_Into
        ("a" & "e" & Combining_Acute & Family_Emoji & "z",
         2, 3, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok
         and then Buffer (1 .. Written) = "e" & Combining_Acute & Family_Emoji,
         "grapheme slice into");
      Humanize.Strings.Truncate_Grapheme_Words_Into
        ("alpha " & Family_Emoji & " beta", 10, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "alpha...",
         "grapheme word truncate into");

      Check
        (Humanize.Strings.Slug
           ("M" & Character'Val (16#C3#) & Character'Val (16#BC#)
            & "nchen API"),
         "munchen-api", "slug label");
      Check
        (Humanize.Strings.Safe_Email_Label ("ada@example.com"),
         "email at example.com", "safe email label");
      Check
        (Humanize.Strings.Safe_Phone_Label ("+1 (555) 123-9876"),
         "phone ending in 9876", "safe phone label");
      Check
        (Humanize.Strings.Safe_Handle_Label ("@adalovelace"),
         "handle @a***e", "safe handle label");
      Check
        (Humanize.Strings.Code_Symbol_Label ("Humanize.Strings.Slug"),
         "code symbol humanize strings slug", "code symbol label");
      Check
        (Humanize.Strings.Source_Location_Label ("src/humanize.adb", 42, 7),
         "humanize.adb:42:7", "source location label");
      Check
        (Humanize.Strings.Transliteration_Coverage_Label
           (Character'Val (16#CE#) & Character'Val (16#91#)
            & Character'Val (16#CE#) & Character'Val (16#B8#)),
         "3 ASCII characters from 2 input characters",
         "transliteration coverage label");
      Check
        (Humanize.Strings.Text_Boundary_Summary_Label ("One. Two."),
         "9 graphemes, 2 words, 2 sentences, 1 paragraphs, width 9",
         "text boundary summary label");
      Check
        (Humanize.Strings.Terminal_Paragraph
           ("alpha beta gamma", 10, "> ", "  "),
         "> alpha" & ASCII.LF & "  beta" & ASCII.LF & "  gamma",
         "terminal paragraph label");
      Check
        (Humanize.Strings.Terminal_Bullet_List
           ([To_Unbounded_String ("alpha beta"),
             To_Unbounded_String ("gamma")],
            10),
         "- alpha" & ASCII.LF & "  beta" & ASCII.LF & "- gamma",
         "terminal bullet list label");
      Check
        (Humanize.Strings.Text_Metadata_Label ("alpha"),
         "text metadata: graphemes=5 words=1 display-width=5 ansi-width=5",
         "text metadata label");
      Check
        (Humanize.Strings.Terminal_Section
           ("Summary", "alpha beta gamma",
            (Width => 10, Prefix => ' ', Continuation => ' ',
             Bullet => '-', Mode => Humanize.Strings.Terminal_Detailed,
             Use_Color => False)),
         "Summary" & ASCII.LF & "alpha" & ASCII.LF & "  beta"
         & ASCII.LF & "  gamma",
         "terminal section label");
      Check
        (Humanize.Strings.Terminal_Key_Value_Block
           ([To_Unbounded_String ("status")],
            [To_Unbounded_String ("ready now")],
            (Width => 12, Prefix => ' ', Continuation => ' ',
             Bullet => '-', Mode => Humanize.Strings.Terminal_Detailed,
             Use_Color => False)),
         "status: ready" & ASCII.LF & "  now",
         "terminal key value block");
      Check
        (Humanize.Strings.Terminal_Status_Block
           ("ready", "all checks passed",
            (Width => 12, Prefix => '>', Continuation => ' ',
             Bullet => '-', Mode => Humanize.Strings.Terminal_Detailed,
             Use_Color => False)),
         "> ready" & ASCII.LF & "  all checks" & ASCII.LF & "  passed",
         "terminal status block");
      Check
        (Humanize.Strings.Prose_List
           ([To_Unbounded_String ("alpha"),
             To_Unbounded_String ("beta"),
             To_Unbounded_String ("gamma")]),
         "alpha, beta, and gamma",
         "prose list label");
      Check
        (Humanize.Strings.Prose_List
           ([To_Unbounded_String ("alpha"),
             To_Unbounded_String (""),
             To_Unbounded_String ("gamma")],
            (Conjunction => 'o', Oxford_Comma => False, Empty_Text => '-')),
         "alpha or gamma",
         "prose list options");
      Check
        (Humanize.Strings.Sentence_From_Parts
           ([To_Unbounded_String ("sync completed"),
             To_Unbounded_String ("2 warnings"),
             To_Unbounded_String ("")]),
         "Sync completed; 2 warnings.",
         "sentence from parts");
      Check
        (Humanize.Strings.Generic_Range_Label
           ("10", "20",
            (Low_Boundary => Humanize.Strings.Inclusive_Boundary,
             High_Boundary => Humanize.Strings.Exclusive_Boundary,
             Separator => '-', Unit => "ms              ",
             Unit_Length => 2)),
         "10 - 20 ms (inclusive low, exclusive high)",
         "generic range label");
      Check
        (Humanize.Strings.Generic_Range_Label
           ("", "5",
            (Low_Boundary => Humanize.Strings.Open_Boundary,
             High_Boundary => Humanize.Strings.Inclusive_Boundary,
             Separator => '-', Unit => [others => ' '], Unit_Length => 0)),
         "up to 5",
         "open generic range label");
      Check
        (Humanize.Strings.Uncertainty_Label ("12.5", "0.2", "ms"),
         "12.5 +/- 0.2 ms",
         "uncertainty label");
      Check
        (Humanize.Strings.Text_Change_Label
           ("alpha beta gamma", "alpha beta gamma delta"),
         "text change: minor edit, 3 old words, 4 new words, 1 changed word",
         "text change label");
      Check
        (Humanize.Strings.Text_Change_Label
           ("Alpha beta.", "alpha beta"),
         "text change: minor edit, 2 old words, 2 new words, "
         & "no changed words, punctuation-only",
         "punctuation-only text change label");
      declare
         Meta : constant Humanize.Strings.Text_Change_Metadata :=
           Humanize.Strings.Text_Change_Metadata_For
             ("alpha  beta", "alpha beta");
      begin
         AUnit.Assertions.Assert
           (Meta.Kind = Humanize.Strings.Text_Whitespace_Only
            and then Meta.Changed_Words = 0,
            "text change metadata whitespace");
      end;
      declare
         Address : Humanize.Strings.Address_Fields;
      begin
         Address.Name (1 .. 3) := "Ada";
         Address.Name_Length := 3;
         Address.Street (1 .. 11) := "1 Logic Way";
         Address.Street_Length := 11;
         Address.City (1 .. 6) := "London";
         Address.City_Length := 6;
         Address.Postal_Code (1 .. 6) := "SW1A 1";
         Address.Postal_Length := 6;
         Address.Country (1 .. 2) := "UK";
         Address.Country_Length := 2;
         Check
           (Humanize.Strings.Address_Label (Address),
            "Ada, 1 Logic Way, London SW1A 1, UK",
            "address label");
         Check
           (Humanize.Strings.Address_Metadata_Label (Address),
            "address metadata: 5 fields present, 1 field missing",
            "address metadata label");
         Check
           (Humanize.Strings.Privacy_Address_Label (Address),
            "address near London, UK",
            "privacy address label");
      end;
      Check
        (Humanize.Strings.Data_Shape_Label
           (Humanize.Strings.Data_Shape_Metadata'
              (Kind => Humanize.Strings.Object_Shape, Fields => 5, Items => 0,
               Nulls => 1, Mixed_Types => 0, Max_Depth => 3)),
         "data shape: object, 5 fields, no items, 1 null, no mixed types, "
         & "depth 3",
         "data shape label");
      Check
         (Humanize.Strings.Data_Shape_Label
           ("{""users"": [{""name"": ""Ada""}, null]}"),
         "data shape: mixed, 2 fields, 1 item, 1 null, 1 mixed type, "
         & "depth 3",
         "inferred data shape label");
      Check
        (Humanize.Strings.Label_Coverage_Audit_Label
           ((Families => 12, Bounded => 11, Parseable => 10, Metadata => 9,
             Stable => 12, Privacy_Safe => 8)),
         "label coverage: 12 families, 11 bounded, 10 parseable, "
         & "9 with metadata, 12 stable, 8 privacy-safe",
         "label coverage audit label");
      Humanize.Strings.Text_Metadata_Label_Into
        ("alpha", Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok
         and then Buffer (1 .. Written) =
           "text metadata: graphemes=5 words=1 display-width=5 ansi-width=5",
         "text metadata bounded label");
      Humanize.Strings.Prose_List_Into
        ([To_Unbounded_String ("alpha"), To_Unbounded_String ("beta")],
         Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "alpha and beta",
         "prose list bounded label");
      Humanize.Strings.Data_Shape_Label_Into
        ((Kind => Humanize.Strings.Array_Shape, Fields => 0, Items => 3,
          Nulls => 1, Mixed_Types => 1, Max_Depth => 2),
         Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok
         and then Buffer (1 .. Written) =
           "data shape: array, no fields, 3 items, 1 null, "
           & "1 mixed type, depth 2",
         "data shape bounded label");
      Humanize.Strings.Slug_Into
        ("S" & Character'Val (16#C3#) & Character'Val (16#A3#)
         & "o Paulo", Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "sao-paulo",
         "slug bounded label");
   end Check_Terminal_Prose_And_Metadata_Labels;
