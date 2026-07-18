separate (Humanize.Tests.Strings.Test_String_Helpers)
   procedure Check_Bounded_Unicode_And_Display_Labels is
   begin
      Humanize.Strings.Parameterize_Into
        ("Employee Salary!!", Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "employee-salary",
         "parameterize into");
      Humanize.Strings.Camelize_Into
        ("employee_salary", Buffer, Written, Code, Upper_First => False);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "employeeSalary",
         "camelize into");
      Humanize.Strings.Truncate_Into
        ("long text is good for you", 12, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "long text...",
         "truncate into");
      Humanize.Strings.Editorial_Title_Into
        ("api status over the url", Humanize.Strings.Chicago_Title,
         Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "API Status over the URL",
         "editorial title into");
      Humanize.Strings.Highlight_Into
        ("alpha beta", "beta", Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "alpha <mark>beta</mark>",
         "highlight into");
      Humanize.Strings.Reading_Time_Into
        (Metrics_Text, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok
         and then Buffer (1 .. Written) = "less than 1 minute read",
         "reading time into");
      Humanize.Strings.Word_Count_Summary_Into
        (Metrics_Text, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "12 words",
         "word count summary into");
      Humanize.Strings.Text_Summary_Into
        (Metrics_Text, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok
         and then Buffer (1 .. Written)
           = "12 words, 3 sentences, 2 paragraphs, less than 1 minute read",
         "text summary into");
      Humanize.Strings.Text_Summary_With_Options_Into
        (Metrics_Text, Buffer, Written, Code,
         (Fields =>
            [Humanize.Strings.Summary_Words,
             Humanize.Strings.Summary_Reading_Time,
             Humanize.Strings.Summary_Sentences,
             Humanize.Strings.Summary_Paragraphs,
             Humanize.Strings.Summary_Speaking_Time,
             Humanize.Strings.Summary_Code_Points,
             Humanize.Strings.Summary_Display_Width],
          Field_Count => 2,
          Separator => '|',
          Space_After_Separator => False,
          Label_Style => Humanize.Strings.Compact_Labels,
          Omit_Zero_Counts => False,
          Empty_Text => '-',
          Time => Humanize.Strings.Default_Text_Time_Options));
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "12 w|1 min read",
         "custom text summary into");
      Humanize.Strings.Excerpt_With_Context_Into
        ("alpha beta gamma delta epsilon", "gamma", Buffer, Written, Code, 1);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "...beta gamma delta...",
         "context excerpt into");
      Humanize.Strings.Highlighted_Excerpt_Into
        ("A <beta> & beta", "beta", Buffer, Written, Code, 20);
      AUnit.Assertions.Assert
        (Code = Ok
         and then Buffer (1 .. Written)
           = "A &lt;<mark>beta</mark>&gt; &amp; <mark>beta</mark>",
         "highlighted excerpt into");
      Humanize.Strings.Group_Token_Into
        ("ab12 cd34 ef56", Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "AB12-CD34-EF56",
         "group token into");
      Humanize.Strings.Masked_Token_Into
        ("ab12-cd34-ef56", Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "****-****-EF56",
         "masked token into");
      Humanize.Strings.Safe_Filename_Into
        ("Quarterly Report (Final).PDF", Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok
         and then Buffer (1 .. Written) = "quarterly-report-final.pdf",
         "safe filename into");
      Humanize.Strings.Shorten_Path_Into
        ("/home/user/projects/humanize/src/humanize-strings.adb",
         Buffer, Written, Code,
         (Max_Chars => 28, Ellipsis => '~', Separator => '/',
          Preserve_Extension => False));
      AUnit.Assertions.Assert
        (Code = Ok
         and then Buffer (1 .. Written) = "/home/~/humanize-strings.adb",
         "shorten path into");
      Humanize.Strings.Symbolic_File_Mode_Into
        (8#2750#, Buffer, Written, Code, Humanize.Strings.Directory_File);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "drwxr-s---",
         "symbolic file mode into");
      Humanize.Strings.Octal_File_Mode_Into
        (8#0755#, Buffer, Written, Code,
         Include_Special => True, Prefix => True);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "0755",
         "octal file mode into");
      Humanize.Strings.File_Mode_Summary_Into
        (8#0600#, Buffer, Written, Code, Humanize.Strings.Regular_File);
      AUnit.Assertions.Assert
        (Code = Ok
         and then Buffer (1 .. Written)
           = "file, owner read/write; group no access; others no access",
         "file mode summary into");
      Humanize.Strings.Safe_Filename_Into
        ("CON.txt", Buffer, Written, Code,
         (Separator              => '-',
          Case_Mode              => Humanize.Strings.Lowercase_Filename,
          Preserve_Extension     => True,
          Max_Stem_Length        => 0,
          Empty_Fallback         => 'x',
          Reserved_Name_Fallback => '_',
          Hidden_Mode            => Humanize.Strings.Drop_Hidden_Dot));
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "con_.txt",
         "safe filename options into");
      Humanize.Strings.Path_Title_Into
        ("/tmp/.api-status.txt", Buffer, Written, Code,
         (Include_Extension => False,
          Max_Stem_Length   => 0,
          Empty_Text        => '-',
          Hidden_Mode       => Humanize.Strings.Drop_Hidden_Dot,
          Title =>
            (Preserve_Acronyms => True,
             Lowercase_Small_Words => True)));
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "API Status",
         "path title options into");
      Humanize.Strings.Extension_Label_Into
        ("/tmp/README", Buffer, Written, Code,
         (Missing_Label       => Humanize.Strings.Empty_Extension_Label,
          Case_Mode           => Humanize.Strings.Uppercase_Filename,
          Hidden_File_Extends => False));
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 0, "extension label options into");
      Humanize.Strings.Search_Key_Into
        ("  File_02-final.TXT ", Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "file 02 final txt",
         "search key into");
      Humanize.Strings.Natural_Sort_Key_Into
        ("file10", Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok
         and then Buffer (1 .. Written) =
           Support.Text (Humanize.Strings.Natural_Sort_Key ("file10")),
         "natural sort key into");
      Humanize.Strings.Foreign_Key_Into
        ("Humanize.Person", Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "person_id",
         "foreign key into");
      Humanize.Strings.Display_Name_Into
        ("", Buffer, Written, Code, Handle => "ada");
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "@ada",
         "display name into");
      Humanize.Strings.Person_List_Into
        ([To_Unbounded_String ("Ada Lovelace"),
          To_Unbounded_String ("Grace Hopper"),
          To_Unbounded_String ("Katherine Johnson")],
         Buffer, Written, Code, Limit => 1);
      AUnit.Assertions.Assert
        (Code = Ok
         and then Buffer (1 .. Written) = "Ada Lovelace and 2 others",
         "person list into");
      Humanize.Strings.Transliterate_ASCII_Into
        (UTF8_Text, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "haello",
         "transliterate ASCII into");
      Humanize.Strings.Pluralize_With_Options_Into
        ("person", Buffer, Written, Code,
         Singulars => "person", Plurals => "persons",
         Options =>
           (Rule_Order => Humanize.Strings.Built_In_First,
            Preserve_Case => True));
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "people",
         "pluralize options into");
      Humanize.Strings.Singularize_With_Options_Into
        ("PERSONS", Buffer, Written, Code,
         Singulars => "person", Plurals => "persons",
         Options =>
           (Rule_Order => Humanize.Strings.Dictionary_First,
            Preserve_Case => False));
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "person",
         "singularize options into");
      Humanize.Strings.Pluralize_In_Language_Into
        ("journal", Humanize.Strings.French_Inflection,
         Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "journaux",
         "pluralize language into");
      AUnit.Assertions.Assert
        (Humanize.Strings.UTF8_Length (UTF8_Text) = 5,
         "UTF-8 length counts code points");
      AUnit.Assertions.Assert
        (Humanize.Strings.UTF8_Display_Width (UTF8_Text) = 5,
         "UTF-8 display width keeps Latin letters narrow");
      AUnit.Assertions.Assert
        (Humanize.Strings.UTF8_Display_Width (World) = 4,
         "UTF-8 display width counts CJK as wide");
      AUnit.Assertions.Assert
        (Humanize.Strings.UTF8_Display_Width (Kana_Supplement) = 2,
         "UTF-8 display width counts newer Kana blocks as wide");
      AUnit.Assertions.Assert
        (Humanize.Strings.UTF8_Length (Invalid_UTF8_Surrogate) = 3,
         "UTF-8 length counts invalid surrogate bytes separately");
      Check
        (Humanize.Strings.Truncate_UTF8 (UTF8_Text, 4, "."),
         "h" & AE & "l.", "UTF-8 truncate");
      Check
        (Humanize.Strings.Truncate_UTF8_Words ("alpha beta gamma", 12),
         "alpha...", "UTF-8 word truncate");
      Check
        (Humanize.Strings.UTF8_Slice (UTF8_Text, 2, 4),
         AE & "ll", "UTF-8 slice");
      AUnit.Assertions.Assert
        (Humanize.Strings.Grapheme_Length ("e" & Combining_Acute) = 1,
         "grapheme length combines accents");
      AUnit.Assertions.Assert
        (Humanize.Strings.Grapheme_Length (Thumbs_Up & Medium_Skin_Tone) = 1,
         "grapheme length combines emoji modifier");
      AUnit.Assertions.Assert
        (Humanize.Strings.Grapheme_Length (Family_Emoji) = 1,
         "grapheme length combines ZWJ sequence");
      AUnit.Assertions.Assert
        (Humanize.Strings.Grapheme_Length (Flag_DK) = 1,
         "grapheme length combines regional indicator pair");
      AUnit.Assertions.Assert
        (Humanize.Strings.Grapheme_Length (Keycap_One) = 1,
         "grapheme length combines keycap sequence");
      AUnit.Assertions.Assert
        (Humanize.Strings.Grapheme_Length (ASCII.CR & ASCII.LF) = 1,
         "grapheme length combines CRLF");
      AUnit.Assertions.Assert
        (Humanize.Strings.Grapheme_Length
           (Devanagari_Ka & Devanagari_Vowel_I) = 1,
         "grapheme length combines spacing marks");
      AUnit.Assertions.Assert
        (Humanize.Strings.Grapheme_Length (Arabic_Number_Sign & "1") = 1,
         "grapheme length combines prepended marks");
      AUnit.Assertions.Assert
        (Humanize.Strings.Grapheme_Length ("a" & ZWJ & "b") = 2,
         "grapheme length does not ZWJ-join plain text");
      AUnit.Assertions.Assert
        (Humanize.Strings.Grapheme_Length (Hangul_Jamo) = 1,
         "grapheme length combines Hangul Jamo sequence");
      AUnit.Assertions.Assert
        (Humanize.Strings.Grapheme_Length (Grapheme_Text) = 6,
         "grapheme length counts user-perceived characters");
      AUnit.Assertions.Assert
        (Humanize.Strings.Grapheme_Display_Width
           ("e" & Combining_Acute & Thumbs_Up & Medium_Skin_Tone
            & Family_Emoji & Flag_DK) = 7,
         "grapheme display width collapses emoji clusters");
      AUnit.Assertions.Assert
        (Humanize.Strings.Grapheme_Display_Width (Keycap_One) = 2,
         "grapheme display width treats keycaps as emoji width");
      AUnit.Assertions.Assert
        (Humanize.Strings.Grapheme_Display_Width
           (Heavy_Black_Heart & Variation_16) = 2,
         "grapheme display width honors emoji variation selector");
      AUnit.Assertions.Assert
        (Humanize.Strings.Grapheme_Display_Width
           (Heavy_Black_Heart & Variation_15) = 1,
         "grapheme display width honors text variation selector");
      AUnit.Assertions.Assert
        (Humanize.Strings.UTF8_Display_Width
           ("a" & Zero_Width_Space & "b") = 2,
         "UTF-8 display width ignores zero-width space");
      AUnit.Assertions.Assert
        (Humanize.Strings.Grapheme_Display_Width
           (Devanagari_Ka & Devanagari_Vowel_I) = 1,
         "grapheme display width collapses spacing marks");
      AUnit.Assertions.Assert
        (Humanize.Strings.ANSI_Display_Width
           (Red_Start & "ab" & Family_Emoji & Reset) = 4,
         "ANSI display width ignores color escapes");
      Check
        (Humanize.Strings.Truncate_Graphemes
           ("a" & "e" & Combining_Acute & "b" & "c", 3, "."),
         "ae" & Combining_Acute & ".", "grapheme truncate keeps accent");
      Check
        (Humanize.Strings.Truncate_Graphemes
           ("a" & Family_Emoji & "b" & "c", 3, "."),
         "a" & Family_Emoji & ".", "grapheme truncate keeps ZWJ emoji");
      Check
        (Humanize.Strings.Truncate_Display_Width
           ("ab" & World & "cd", 6, "."),
         "ab" & World (World'First .. World'First + 2) & ".",
         "display-width truncate keeps CJK boundary");
      Check
        (Humanize.Strings.Truncate_Display_Width
           ("a" & Family_Emoji & "bc", 4, "."),
         "a" & Family_Emoji & ".",
         "display-width truncate keeps emoji cluster");
      Check
        (Humanize.Strings.Truncate_ANSI_Display_Width
           (Red_Start & "ab" & Family_Emoji & "cd" & Reset, 5, "."),
         Red_Start & "ab" & Family_Emoji & ".",
         "ANSI display-width truncate keeps escape and emoji");
      Check
        (Humanize.Strings.Wrap_Display_Width
           ("ab" & World & " cd", 5, Indent => 2),
         "ab" & World (World'First .. World'First + 2)
         & ASCII.LF & "  " & World (World'First + 3 .. World'Last)
         & " " & ASCII.LF & "  cd",
         "display-width wrap keeps CJK boundaries");
      Check
        (Humanize.Strings.Wrap_ANSI_Display_Width
           (Red_Start & "abcd" & Reset & " ef", 4),
         Red_Start & "abcd" & Reset & ASCII.LF & "ef",
         "ANSI display-width wrap ignores escape width");
      Check
        (Humanize.Strings.Wrap_ANSI_Display_Width_Styled
           (Red_Start & "abcd ef" & Reset, 4),
         Red_Start & "abcd" & ASCII.ESC & "[0m" & ASCII.LF
         & Red_Start & "ef" & Reset,
         "ANSI styled wrap reopens active style");
   end Check_Bounded_Unicode_And_Display_Labels;
