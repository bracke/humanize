with AUnit.Assertions;

with Ada.Strings.Unbounded;

with Humanize.Status;
with Humanize.Strings;
with Humanize.Tests.Support;

package body Humanize.Tests.Strings is
   use Humanize.Status;
   use Ada.Strings.Unbounded;
   use type Humanize.Strings.File_Mode_Kind;
   use type Humanize.Strings.Inflection_Source;

   procedure Check
     (Result   : Text_Result;
      Expected : String;
      Message  : String)
   is
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Test_String_Helpers (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      LF : constant String := [1 => ASCII.LF];
      CR : constant String := [1 => ASCII.CR];
      AE : constant String := Character'Val (16#C3#) & Character'Val (16#A6#);
      Greek_Athens : constant String :=
        Character'Val (16#CE#) & Character'Val (16#91#)
        & Character'Val (16#CE#) & Character'Val (16#B8#)
        & Character'Val (16#CE#) & Character'Val (16#AE#)
        & Character'Val (16#CE#) & Character'Val (16#BD#)
        & Character'Val (16#CE#) & Character'Val (16#B1#);
      Cyrillic_Moscow : constant String :=
        Character'Val (16#D0#) & Character'Val (16#9C#)
        & Character'Val (16#D0#) & Character'Val (16#BE#)
        & Character'Val (16#D1#) & Character'Val (16#81#)
        & Character'Val (16#D0#) & Character'Val (16#BA#)
        & Character'Val (16#D0#) & Character'Val (16#B2#)
        & Character'Val (16#D0#) & Character'Val (16#B0#);
      Hebrew_Abgd : constant String :=
        Character'Val (16#D7#) & Character'Val (16#90#)
        & Character'Val (16#D7#) & Character'Val (16#91#)
        & Character'Val (16#D7#) & Character'Val (16#92#)
        & Character'Val (16#D7#) & Character'Val (16#93#);
      Arabic_Slam : constant String :=
        Character'Val (16#D8#) & Character'Val (16#B3#)
        & Character'Val (16#D9#) & Character'Val (16#84#)
        & Character'Val (16#D8#) & Character'Val (16#A7#)
        & Character'Val (16#D9#) & Character'Val (16#85#);
      Armenian_Hay : constant String :=
        Character'Val (16#D5#) & Character'Val (16#B0#)
        & Character'Val (16#D5#) & Character'Val (16#A1#)
        & Character'Val (16#D5#) & Character'Val (16#B5#);
      Georgian_Abg : constant String :=
        Character'Val (16#E1#) & Character'Val (16#83#)
        & Character'Val (16#90#)
        & Character'Val (16#E1#) & Character'Val (16#83#)
        & Character'Val (16#91#)
        & Character'Val (16#E1#) & Character'Val (16#83#)
        & Character'Val (16#92#);
      E_Acute : constant String :=
        Character'Val (16#C3#) & Character'Val (16#A9#);
      Combining_Acute : constant String :=
        Character'Val (16#CC#) & Character'Val (16#81#);
      Devanagari_Ka : constant String :=
        Character'Val (16#E0#) & Character'Val (16#A4#)
        & Character'Val (16#95#);
      Devanagari_Vowel_I : constant String :=
        Character'Val (16#E0#) & Character'Val (16#A4#)
        & Character'Val (16#BF#);
      Arabic_Number_Sign : constant String :=
        Character'Val (16#D8#) & Character'Val (16#80#);
      Zero_Width_Space : constant String :=
        Character'Val (16#E2#) & Character'Val (16#80#)
        & Character'Val (16#8B#);
      Invalid_UTF8_Surrogate : constant String :=
        Character'Val (16#ED#) & Character'Val (16#A0#)
        & Character'Val (16#80#);
      World : constant String :=
        Character'Val (16#E4#) & Character'Val (16#B8#)
        & Character'Val (16#96#) & Character'Val (16#E7#)
        & Character'Val (16#95#) & Character'Val (16#8C#);
      Kana_Supplement : constant String :=
        Character'Val (16#F0#) & Character'Val (16#9B#)
        & Character'Val (16#80#) & Character'Val (16#80#);
      Ideographic_Stop : constant String :=
        Character'Val (16#E3#) & Character'Val (16#80#)
        & Character'Val (16#82#);
      Arabic_Question : constant String :=
        Character'Val (16#D8#) & Character'Val (16#9F#);
      Woman_Emoji : constant String :=
        Character'Val (16#F0#) & Character'Val (16#9F#)
        & Character'Val (16#91#) & Character'Val (16#A9#);
      Girl_Emoji : constant String :=
        Character'Val (16#F0#) & Character'Val (16#9F#)
        & Character'Val (16#91#) & Character'Val (16#A7#);
      ZWJ : constant String :=
        Character'Val (16#E2#) & Character'Val (16#80#)
        & Character'Val (16#8D#);
      Family_Emoji : constant String := Woman_Emoji & ZWJ & Girl_Emoji;
      Thumbs_Up : constant String :=
        Character'Val (16#F0#) & Character'Val (16#9F#)
        & Character'Val (16#91#) & Character'Val (16#8D#);
      Medium_Skin_Tone : constant String :=
        Character'Val (16#F0#) & Character'Val (16#9F#)
        & Character'Val (16#8F#) & Character'Val (16#BD#);
      Flag_DK : constant String :=
        Character'Val (16#F0#) & Character'Val (16#9F#)
        & Character'Val (16#87#) & Character'Val (16#A9#)
        & Character'Val (16#F0#) & Character'Val (16#9F#)
        & Character'Val (16#87#) & Character'Val (16#B0#);
      Variation_16 : constant String :=
        Character'Val (16#EF#) & Character'Val (16#B8#)
        & Character'Val (16#8F#);
      Variation_15 : constant String :=
        Character'Val (16#EF#) & Character'Val (16#B8#)
        & Character'Val (16#8E#);
      Heavy_Black_Heart : constant String :=
        Character'Val (16#E2#) & Character'Val (16#9D#)
        & Character'Val (16#A4#);
      Keycap_Mark : constant String :=
        Character'Val (16#E2#) & Character'Val (16#83#)
        & Character'Val (16#A3#);
      Keycap_One : constant String := "1" & Variation_16 & Keycap_Mark;
      Hangul_Jamo : constant String :=
        Character'Val (16#E1#) & Character'Val (16#84#)
        & Character'Val (16#80#) & Character'Val (16#E1#)
        & Character'Val (16#85#) & Character'Val (16#A1#)
        & Character'Val (16#E1#) & Character'Val (16#86#)
        & Character'Val (16#A8#);
      UTF8_Text : constant String := "h" & AE & "llo";
      L_Stroke : constant String :=
        Character'Val (16#C5#) & Character'Val (16#81#);
      O_Acute : constant String :=
        Character'Val (16#C3#) & Character'Val (16#B3#);
      Z_Acute : constant String :=
        Character'Val (16#C5#) & Character'Val (16#BA#);
      C_Caron : constant String :=
        Character'Val (16#C4#) & Character'Val (16#8C#);
      Red_Start : constant String := ASCII.ESC & "[31m";
      Reset : constant String := ASCII.ESC & "[0m";
      Grapheme_Text : constant String :=
        "e" & Combining_Acute & " "
        & Thumbs_Up & Medium_Skin_Tone & Family_Emoji & Flag_DK & Keycap_One;
      Unicode_Metric_Text : constant String :=
        "H" & E_Acute & "llo " & World & Ideographic_Stop;
      Decomposed_Text : constant String :=
        "cafe" & Combining_Acute & " au lait.";
      Unicode_Metrics : constant Humanize.Strings.Text_Metrics_Result :=
        Humanize.Strings.Text_Metrics (Unicode_Metric_Text);
      Metrics_Text : constant String :=
        "Alpha beta gamma delta epsilon zeta eta. Second sentence!" & LF & LF
        & "Third paragraph line";
      Buffer : String (1 .. 96);
      Written : Natural;
      Code : Status_Code;
      Parsed_Mode : Humanize.Strings.File_Mode_Value;
      Parsed_Kind : Humanize.Strings.File_Mode_Kind;
      Parse_Status : Status_Code;
   begin
      Check
        (Humanize.Strings.Truncate ("long text is good for you", 19),
         "long text is goo...", "truncate");
      Check
        (Humanize.Strings.Truncate_Words ("long text is good for you", 4),
         "long text is good ...", "truncate words");
      Check
        (Humanize.Strings.Capitalize ("wHoOaA!", Downcase => True),
         "Whooaa!", "capitalize downcase");
      Check
        (Humanize.Strings.Title_Case ("cool the          itunes cake"),
         "Cool The Itunes Cake", "title case");
      Check
        (Humanize.Strings.Title_Case_Smart ("api status and url rules"),
         "API Status and URL Rules", "smart title case");
      Check
        (Humanize.Strings.Title_Case_With_Options
           ("api status and url rules",
            (Preserve_Acronyms => False, Lowercase_Small_Words => False)),
         "Api Status And Url Rules", "configured title case");
      Check
        (Humanize.Strings.Title_Case_With_Word_Lists
           ("gpu status by api", "gpu api", "by"),
         "GPU Status by API", "custom title-case word lists");
      Check
        (Humanize.Strings.Editorial_Title
           ("api status over the url", Humanize.Strings.AP_Title),
         "API Status Over the URL", "AP editorial title");
      Check
        (Humanize.Strings.Editorial_Title
           ("api status over the url", Humanize.Strings.Chicago_Title),
         "API Status over the URL", "Chicago editorial title");
      Check
        (Humanize.Strings.Editorial_Title
           ("  API STATUS over   THE url  ", Humanize.Strings.Sentence_Title),
         "Api status over the url", "sentence editorial title");
      Check
        (Humanize.Strings.NL_To_BR ("one" & LF & "two"),
         "one<br/>two", "nl to br");
      Check
        (Humanize.Strings.BR_To_NL ("one<br/>two"),
         "one" & LF & "two", "br to nl");
      Check
        (Humanize.Strings.BR_To_NL ("one<br>"),
         "one" & LF, "br to nl trailing tag");
      Check
        (Humanize.Strings.Parameterize ("Employee Salary!!"),
         "employee-salary", "parameterize");
      Check
        (Humanize.Strings.Dasherize ("employee_salary report"),
         "employee-salary-report", "dasherize");
      Check
        (Humanize.Strings.Underscore ("EmployeeSalary report"),
         "employee_salary_report", "underscore");
      Check
        (Humanize.Strings.Camelize ("employee_salary"),
         "EmployeeSalary", "camelize");
      Check
        (Humanize.Strings.Humanize_String ("employee_salary"),
         "Employee salary", "humanize string");
      Check
        (Humanize.Strings.Deconstantize ("Humanize.Strings.Title_Case"),
         "Humanize.Strings", "deconstantize");
      Check
        (Humanize.Strings.Demodulize ("Humanize.Strings.Title_Case"),
         "Title_Case", "demodulize");
      Check
        (Humanize.Strings.Tableize ("Person"),
         "people", "tableize");
      Check
        (Humanize.Strings.Classify ("people"),
         "Person", "classify");
      Check
        (Humanize.Strings.Foreign_Key ("Humanize.Person"),
         "person_id", "foreign key");
      Check
        (Humanize.Strings.Acronym ("api status url"),
         "APISURL", "acronym");
      Check
        (Humanize.Strings.Escape_HTML ("<b>A&B</b>"),
         "&lt;b&gt;A&amp;B&lt;/b&gt;", "HTML escape");
      Check
        (Humanize.Strings.Preserve_Separator ("alpha---beta", '-'),
         "alpha-beta", "preserve separator");
      Check
        (Humanize.Strings.Normalize_Whitespace ("  alpha" & LF & " beta  "),
         "alpha beta", "normalize whitespace");
      Check
        (Humanize.Strings.Strip_Tags ("<b>alpha</b> beta"),
         "alpha beta", "strip tags");
      Check
        (Humanize.Strings.Excerpt ("alpha beta gamma delta", "gamma", 3),
         "...ta gamma de...", "excerpt");
      Check
        (Humanize.Strings.Excerpt_With_Options
           ("Alpha beta gamma", "BETA", 2, "...",
            (Case_Mode     => Humanize.Strings.Case_Insensitive,
             Boundary_Mode => Humanize.Strings.Match_Anywhere)),
         "...a beta g...", "case-insensitive excerpt");
      Check
        (Humanize.Strings.Excerpt_With_Context
           ("alpha beta gamma delta epsilon zeta eta", "delta", 2),
         "...beta gamma delta epsilon zeta...", "context excerpt");
      Check
        (Humanize.Strings.Excerpt_With_Context_Options
           ("cat scatter cat dog", "cat", 1, "...",
            (Case_Mode     => Humanize.Strings.Case_Sensitive,
             Boundary_Mode => Humanize.Strings.Match_Word)),
         "cat scatter...", "word-boundary context excerpt");
      Check
        (Humanize.Strings.Excerpt_With_Context
           ("alpha caf" & E_Acute & " gamma", "alpha", 1),
         "alpha caf" & E_Acute & "...", "Unicode context excerpt");
      AUnit.Assertions.Assert
        (Humanize.Strings.Word_Count (Metrics_Text) = 12,
         "word count metric");
      AUnit.Assertions.Assert
        (Humanize.Strings.Sentence_Count (Metrics_Text) = 3,
         "sentence count metric");
      AUnit.Assertions.Assert
        (Humanize.Strings.Paragraph_Count (Metrics_Text) = 2,
         "paragraph count metric");
      AUnit.Assertions.Assert
        (Unicode_Metrics.Words = 2
         and then Unicode_Metrics.Sentences = 1
         and then Unicode_Metrics.Paragraphs = 1
         and then Unicode_Metrics.Code_Points = 9
         and then Unicode_Metrics.Display_Width = 12,
         "Unicode text metrics");
      AUnit.Assertions.Assert
        (Humanize.Strings.Text_Metrics (Family_Emoji).Code_Points = 3
         and then Humanize.Strings.Text_Metrics
           (Family_Emoji).Display_Width = 2,
         "text metrics display width uses grapheme clusters");
      AUnit.Assertions.Assert
        (Humanize.Strings.Word_Count (Decomposed_Text) = 3,
         "combining mark stays inside word count");
      AUnit.Assertions.Assert
        (Humanize.Strings.Paragraph_Count
           ("one" & CR & LF & CR & LF & World) = 2,
         "CRLF blank line paragraph count");
      AUnit.Assertions.Assert
        (Humanize.Strings.Sentence_Count
           ("Hello " & World & Ideographic_Stop) = 1,
         "Unicode sentence terminator");
      AUnit.Assertions.Assert
        (Humanize.Strings.Sentence_Count ("Hello" & Arabic_Question) = 1,
         "Arabic question mark sentence terminator");
      Check
        (Humanize.Strings.Word_Count_Summary (Metrics_Text),
         "12 words", "word count summary");
      Check
        (Humanize.Strings.Word_Count_Summary (Unicode_Metric_Text),
         "2 words", "Unicode word count summary");
      Check
        (Humanize.Strings.Sentence_Count_Summary (Metrics_Text),
         "3 sentences", "sentence count summary");
      Check
        (Humanize.Strings.Paragraph_Count_Summary (Metrics_Text),
         "2 paragraphs", "paragraph count summary");
      Check
        (Humanize.Strings.Word_Count_Summary (""),
         "no words", "empty word count summary");
      Check
        (Humanize.Strings.Reading_Time (Metrics_Text),
         "less than 1 minute read", "reading time");
      Check
        (Humanize.Strings.Speaking_Time
         (Metrics_Text,
            (Reading_Words_Per_Minute => 200,
             Speaking_Words_Per_Minute => 5)),
         "3 minutes spoken", "speaking time");
      Check
        (Humanize.Strings.Text_Summary (Metrics_Text),
         "12 words, 3 sentences, 2 paragraphs, less than 1 minute read",
         "text summary");
      Check
        (Humanize.Strings.Text_Summary
           (Metrics_Text,
            (Include_Sentences     => False,
             Include_Paragraphs    => False,
             Include_Reading_Time  => False,
             Include_Speaking_Time => True,
             Time =>
               (Reading_Words_Per_Minute  => 200,
                Speaking_Words_Per_Minute => 5))),
         "12 words, 3 minutes spoken", "configured text summary");
      Check
        (Humanize.Strings.Text_Summary_With_Options
           (Metrics_Text,
            (Fields =>
               [Humanize.Strings.Summary_Reading_Time,
                Humanize.Strings.Summary_Words,
                Humanize.Strings.Summary_Sentences,
                Humanize.Strings.Summary_Paragraphs,
                Humanize.Strings.Summary_Speaking_Time,
                Humanize.Strings.Summary_Code_Points,
                Humanize.Strings.Summary_Display_Width],
             Field_Count => 3,
             Separator => ';',
             Space_After_Separator => True,
             Label_Style => Humanize.Strings.Compact_Labels,
             Omit_Zero_Counts => False,
             Empty_Text => '-',
             Time => Humanize.Strings.Default_Text_Time_Options)),
         "1 min read; 12 w; 3 sent", "custom text summary composition");
      Check
        (Humanize.Strings.Text_Summary_With_Options
           (UTF8_Text,
            (Fields =>
               [Humanize.Strings.Summary_Code_Points,
                Humanize.Strings.Summary_Display_Width,
                Humanize.Strings.Summary_Words,
                Humanize.Strings.Summary_Sentences,
                Humanize.Strings.Summary_Paragraphs,
                Humanize.Strings.Summary_Reading_Time,
                Humanize.Strings.Summary_Speaking_Time],
             Field_Count => 2,
             Separator => '/',
             Space_After_Separator => False,
             Label_Style => Humanize.Strings.Natural_Labels,
             Omit_Zero_Counts => False,
             Empty_Text => '-',
             Time => Humanize.Strings.Default_Text_Time_Options)),
         "5 characters/5 columns", "character text summary composition");
      Check
        (Humanize.Strings.Text_Summary_With_Options
           ("",
            (Fields =>
               [Humanize.Strings.Summary_Words,
                Humanize.Strings.Summary_Sentences,
                Humanize.Strings.Summary_Paragraphs,
                Humanize.Strings.Summary_Code_Points,
                Humanize.Strings.Summary_Display_Width,
                Humanize.Strings.Summary_Reading_Time,
                Humanize.Strings.Summary_Speaking_Time],
             Field_Count => 5,
             Separator => '|',
             Space_After_Separator => False,
             Label_Style => Humanize.Strings.Minimal_Labels,
             Omit_Zero_Counts => True,
             Empty_Text => '~',
             Time => Humanize.Strings.Default_Text_Time_Options)),
         "~", "empty omitted text summary composition");
      Check
        (Humanize.Strings.Highlight ("alpha beta beta", "beta"),
         "alpha <mark>beta</mark> <mark>beta</mark>", "highlight");
      Check
        (Humanize.Strings.Highlight_With_Options
           ("Alpha beta ALPHA", "alpha",
            Options =>
              (Match_Mode =>
                 (Case_Mode     => Humanize.Strings.Case_Insensitive,
                  Boundary_Mode => Humanize.Strings.Match_Anywhere),
               Count_Mode => Humanize.Strings.All_Matches)),
         "<mark>Alpha</mark> beta <mark>ALPHA</mark>",
         "case-insensitive highlight");
      Check
        (Humanize.Strings.Highlight_With_Options
           ("beta beta", "beta",
            Options =>
              (Match_Mode => Humanize.Strings.Default_Match_Options,
               Count_Mode => Humanize.Strings.First_Match)),
         "<mark>beta</mark> beta", "first highlight");
      Check
        (Humanize.Strings.Highlight_With_Options
           ("cat scatter cat", "cat",
            Options =>
              (Match_Mode =>
                 (Case_Mode     => Humanize.Strings.Case_Sensitive,
                  Boundary_Mode => Humanize.Strings.Match_Word),
               Count_Mode => Humanize.Strings.All_Matches)),
         "<mark>cat</mark> scatter <mark>cat</mark>",
         "word-boundary highlight");
      Check
        (Humanize.Strings.Highlighted_Excerpt
           ("A <beta> & beta", "beta", 20),
         "A &lt;<mark>beta</mark>&gt; &amp; <mark>beta</mark>",
         "HTML-safe highlighted excerpt");
      Check
        (Humanize.Strings.Mask ("1234567890", 4),
         "******7890", "mask");
      Check
        (Humanize.Strings.Normalize_Token
           (" ab12-cd34 ef56 ", Humanize.Strings.Uppercase_Token),
         "AB12CD34EF56", "normalize opaque token");
      Check
        (Humanize.Strings.Group_Token ("ab12 cd34 ef56"),
         "AB12-CD34-EF56", "group opaque token");
      Check
        (Humanize.Strings.Group_Token
           ("1234567890",
            (Group_Size => 3,
             Separator  => ' ',
             Direction  => Humanize.Strings.Group_From_Right,
             Case_Mode  => Humanize.Strings.Preserve_Token_Case)),
         "1 234 567 890", "right-group opaque token");
      Check
        (Humanize.Strings.Masked_Token ("ab12-cd34-ef56", 4),
         "****-****-EF56", "masked grouped token");
      Check
        (Humanize.Strings.Safe_Filename ("Quarterly Report (Final).PDF"),
         "quarterly-report-final.pdf", "safe filename");
      Check
        (Humanize.Strings.Safe_Filename
           ("Quarterly Report (Final).PDF",
            (Separator              => '_',
             Case_Mode              => Humanize.Strings.Preserve_Filename_Case,
             Preserve_Extension     => True,
             Max_Stem_Length        => 16,
             Empty_Fallback         => 'x',
             Reserved_Name_Fallback => '_',
             Hidden_Mode            => Humanize.Strings.Drop_Hidden_Dot)),
         "Quarterly_Report.PDF", "safe filename policy");
      Check
        (Humanize.Strings.Safe_Filename
           (".env.local",
            (Separator              => '-',
             Case_Mode              => Humanize.Strings.Lowercase_Filename,
             Preserve_Extension     => True,
             Max_Stem_Length        => 0,
             Empty_Fallback         => 'x',
             Reserved_Name_Fallback => '_',
             Hidden_Mode            => Humanize.Strings.Preserve_Hidden_File)),
         ".env.local", "safe filename hidden file");
      Check
        (Humanize.Strings.Safe_Filename
           ("CON.txt",
            (Separator              => '-',
             Case_Mode              => Humanize.Strings.Lowercase_Filename,
             Preserve_Extension     => True,
             Max_Stem_Length        => 0,
             Empty_Fallback         => 'x',
             Reserved_Name_Fallback => '_',
             Hidden_Mode            => Humanize.Strings.Drop_Hidden_Dot)),
         "con_.txt", "safe filename reserved stem");
      Check
        (Humanize.Strings.Safe_Filename
           ("###",
            (Separator              => '-',
             Case_Mode              => Humanize.Strings.Lowercase_Filename,
             Preserve_Extension     => True,
             Max_Stem_Length        => 0,
             Empty_Fallback         => 'x',
             Reserved_Name_Fallback => '_',
             Hidden_Mode            => Humanize.Strings.Drop_Hidden_Dot)),
         "x", "safe filename empty fallback");
      Check
        (Humanize.Strings.Path_Basename
           ("/home/bent/reports/quarterly-report-final.pdf"),
         "quarterly-report-final.pdf", "path basename");
      Check
        (Humanize.Strings.Path_Title
           ("/home/bent/reports/quarterly-report-final.pdf"),
         "Quarterly Report Final", "path title");
      Check
        (Humanize.Strings.Path_Title
           ("/home/bent/reports/.api-status.txt",
            (Include_Extension => True,
             Max_Stem_Length   => 0,
             Empty_Text        => '-',
             Hidden_Mode       => Humanize.Strings.Drop_Hidden_Dot,
             Title =>
               (Preserve_Acronyms => True,
                Lowercase_Small_Words => True))),
         "API Status Txt", "path title options");
      Check
        (Humanize.Strings.Extension_Label
           ("/home/bent/reports/quarterly-report-final.pdf"),
         "PDF", "extension label");
      Check
        (Humanize.Strings.Extension_Label ("/home/bent/.profile"),
         "file", "hidden file extension label");
      Check
        (Humanize.Strings.Extension_Label
           ("/home/bent/.profile",
            (Missing_Label       => Humanize.Strings.Generic_File_Label,
             Case_Mode           => Humanize.Strings.Uppercase_Filename,
             Hidden_File_Extends => True)),
         "PROFILE", "hidden file extension label option");
      Check
        (Humanize.Strings.Extension_Label
           ("/home/bent/README",
            (Missing_Label       => Humanize.Strings.No_Extension_Label,
             Case_Mode           => Humanize.Strings.Uppercase_Filename,
             Hidden_File_Extends => False)),
         "no extension", "missing extension label option");
      Check
        (Humanize.Strings.Shorten_Path
           ("/home/user/projects/humanize/src/humanize-strings.adb",
            (Max_Chars => 28, Ellipsis => '~', Separator => '/',
             Preserve_Extension => False)),
         "/home/~/humanize-strings.adb", "shorten path");
      Check
        (Humanize.Strings.Shorten_Path
           ("/home/user/projects/humanize/src/humanize-strings.adb",
            (Max_Chars => 12, Ellipsis => '~', Separator => '/',
             Preserve_Extension => True)),
         "~strings.adb", "shorten path preserving extension");
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
   end Test_String_Helpers;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize string tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_String_Helpers'Access, "string helpers");
   end Register_Tests;
end Humanize.Tests.Strings;
