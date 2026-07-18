separate (Humanize.Tests.Strings.Test_String_Helpers)
   procedure Check_Text_And_Path_Labels is
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
   end Check_Text_And_Path_Labels;
