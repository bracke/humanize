separate (Humanize.Tests.Parsing.Test_Text_Domain_Round_Trips)
   procedure Check_Text_Path_And_Name_Parsers is
      Word_Summary : constant
        Humanize.Parsing.Text_Count_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Word_Count_Summary ("3 words");
      Sentence_Summary : constant
        Humanize.Parsing.Text_Count_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Sentence_Count_Summary ("1 sentence");
      Paragraph_Summary : constant
        Humanize.Parsing.Text_Count_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Paragraph_Count_Summary ("no paragraphs");
      Reading : constant Humanize.Parsing.Text_Time_Parse_Result :=
        Humanize.Parsing.Parse_Reading_Time ("less than 1 minute read");
      Speaking : constant Humanize.Parsing.Text_Time_Parse_Result :=
        Humanize.Parsing.Parse_Speaking_Time ("2 minutes spoken");
      Text_Summary : constant Humanize.Parsing.Text_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Text_Summary
          ("3 words, 1 sentence, 1 paragraph, less than 1 minute read");
      Compact_Text_Summary : constant
        Humanize.Parsing.Text_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Text_Summary
            ("3 w, 1 sent, 1 para, 1 min read, 18 ch, 18 col");
      Masked : constant Humanize.Parsing.Mask_Parse_Result :=
        Humanize.Parsing.Parse_Mask ("******7890");
      Grouped : constant Humanize.Parsing.Grouped_Token_Parse_Result :=
        Humanize.Parsing.Parse_Grouped_Token ("ABCD-EF12-3456");
      Masked_Token : constant Humanize.Parsing.Grouped_Token_Parse_Result :=
        Humanize.Parsing.Parse_Masked_Token ("****-****-3456");
      Safe_Path : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Path_Label ("report-final.pdf");
      Path_Base : constant Humanize.Parsing.Filename_Label_Parse_Result :=
        Humanize.Parsing.Parse_Path_Basename ("report-final.pdf");
      Path_Title : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Path_Title ("Report Final");
      Extension_Label : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Extension_Label ("PDF");
      Shortened_Path : constant Humanize.Parsing.Excerpt_Parse_Result :=
        Humanize.Parsing.Parse_Shortened_Path ("src~/humanize.ads");
      Symbolic_Mode : constant Humanize.Parsing.File_Mode_Parse_Result :=
        Humanize.Parsing.Parse_File_Mode_Label ("-rwsr-xr-x");
      Octal_Mode : constant Humanize.Parsing.File_Mode_Parse_Result :=
        Humanize.Parsing.Parse_File_Mode_Label ("0755");
      Bad_File_Mode : constant Humanize.Parsing.File_Mode_Parse_Result :=
        Humanize.Parsing.Parse_File_Mode_Label ("rwxr-xr-q");
      Handle : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Handle_Label ("@ada");
      Name_Label : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Name_Label ("Ada Lovelace");
      Clean_Name : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Clean_Name ("Ada Lovelace");
      Display_Name : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Display_Name ("Ada");
      Name_Part : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Name_Part ("Lovelace");
      Initials : constant Humanize.Parsing.Initials_Parse_Result :=
        Humanize.Parsing.Parse_Initials ("AL");
      Person_Initials : constant Humanize.Parsing.Initials_Parse_Result :=
        Humanize.Parsing.Parse_Person_Initials ("AGH");
      Possessive : constant Humanize.Parsing.Possessive_Parse_Result :=
        Humanize.Parsing.Parse_Possessive_Label ("Ada's");
      Possessive_Name : constant Humanize.Parsing.Possessive_Parse_Result :=
        Humanize.Parsing.Parse_Possessive_Name ("Chris'");
      Email_Local : constant Humanize.Parsing.Email_Local_Part_Parse_Result :=
        Humanize.Parsing.Parse_Email_Local_Part ("ada.lovelace");
      Safe_Filename : constant Humanize.Parsing.Filename_Label_Parse_Result :=
        Humanize.Parsing.Parse_Safe_Filename ("report-final.pdf");
      Search_Key : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
        Humanize.Parsing.Parse_Search_Key ("ada lovelace 42");
      Natural_Sort_Key : constant
        Humanize.Parsing.Identifier_Label_Parse_Result :=
          Humanize.Parsing.Parse_Natural_Sort_Key
            ("file {00000002:12}");
      Parameterized : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
        Humanize.Parsing.Parse_Parameterize_Label ("ada-lovelace");
      Dasherized : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
        Humanize.Parsing.Parse_Dasherize_Label ("ada-lovelace");
      Underscored : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
        Humanize.Parsing.Parse_Underscore_Label ("ada_lovelace");
      Camelized : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
        Humanize.Parsing.Parse_Camelize_Label ("AdaLovelace");
      Transliteration : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Transliteration_Label ("Aether");
      Casefold : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
        Humanize.Parsing.Parse_Casefold_Label ("ada lovelace");
      Escaped_HTML : constant Humanize.Parsing.Cleanup_Label_Parse_Result :=
        Humanize.Parsing.Parse_Escaped_HTML
          ("&lt;Ada&gt; &amp; &#39;Grace&#39;");
      NL_To_BR : constant Humanize.Parsing.Cleanup_Label_Parse_Result :=
        Humanize.Parsing.Parse_NL_To_BR ("Ada<br/>Grace");
      BR_To_NL : constant Humanize.Parsing.Cleanup_Label_Parse_Result :=
        Humanize.Parsing.Parse_BR_To_NL ("Ada" & ASCII.LF & "Grace");
      Normalized_Whitespace : constant
        Humanize.Parsing.Cleanup_Label_Parse_Result :=
          Humanize.Parsing.Parse_Normalized_Whitespace ("Ada Grace");
      Squished : constant Humanize.Parsing.Cleanup_Label_Parse_Result :=
        Humanize.Parsing.Parse_Squished ("Ada Grace");
      Stripped_Tags : constant Humanize.Parsing.Cleanup_Label_Parse_Result :=
        Humanize.Parsing.Parse_Stripped_Tags ("Ada Grace");
      Preserved_Separator : constant
        Humanize.Parsing.Cleanup_Label_Parse_Result :=
          Humanize.Parsing.Parse_Preserved_Separator ("Ada/Grace", '/');
      Pluralized : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Pluralized_Word ("people");
      Singularized : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Singularized_Word ("person");
      Person_List : constant Humanize.Parsing.Person_List_Parse_Result :=
        Humanize.Parsing.Parse_Person_List ("Ada, Grace and 2 others");
      Excerpt : constant Humanize.Parsing.Excerpt_Parse_Result :=
        Humanize.Parsing.Parse_Excerpt ("...middle text...");
      Highlight : constant Humanize.Parsing.Highlight_Parse_Result :=
        Humanize.Parsing.Parse_Highlight
          ("hello <mark>Ada</mark> and <mark>Ada</mark>");
      Highlighted_Excerpt : constant Humanize.Parsing.Highlight_Parse_Result :=
        Humanize.Parsing.Parse_Highlighted_Excerpt
          ("...hello <mark>Ada</mark>...");
      Inflection : constant Humanize.Parsing.Inflection_Source_Parse_Result :=
        Humanize.Parsing.Parse_Inflection_Source_Label ("irregular");
      Uncountable_Inflection : constant
        Humanize.Parsing.Inflection_Source_Parse_Result :=
          Humanize.Parsing.Parse_Inflection_Source_Label ("uncountable");
   begin
      AUnit.Assertions.Assert
        (Word_Summary.Status = Humanize.Status.Ok
         and then Word_Summary.Count = 3
         and then Word_Summary.Unit (1 .. Word_Summary.Unit_Length) = "words",
         "parse word count summary output");
      AUnit.Assertions.Assert
        (Sentence_Summary.Status = Humanize.Status.Ok
         and then Sentence_Summary.Count = 1
         and then Sentence_Summary.Unit
           (1 .. Sentence_Summary.Unit_Length) = "sentence",
         "parse sentence count summary output");
      AUnit.Assertions.Assert
        (Paragraph_Summary.Status = Humanize.Status.Ok
         and then Paragraph_Summary.Count = 0
         and then Paragraph_Summary.Unit
           (1 .. Paragraph_Summary.Unit_Length) = "paragraphs",
         "parse paragraph count summary output");
      AUnit.Assertions.Assert
        (Reading.Status = Humanize.Status.Ok
         and then Reading.Minutes = 1
         and then Reading.Less_Than
         and then Reading.Suffix (1 .. Reading.Suffix_Length) = "read",
         "parse reading time output");
      AUnit.Assertions.Assert
        (Speaking.Status = Humanize.Status.Ok
         and then Speaking.Minutes = 2
         and then not Speaking.Less_Than
         and then Speaking.Suffix (1 .. Speaking.Suffix_Length) = "spoken",
         "parse speaking time output");
      AUnit.Assertions.Assert
        (Text_Summary.Status = Humanize.Status.Ok
         and then Text_Summary.Has_Words
         and then Text_Summary.Words = 3
         and then Text_Summary.Has_Sentences
         and then Text_Summary.Sentences = 1
         and then Text_Summary.Has_Paragraphs
         and then Text_Summary.Paragraphs = 1
         and then Text_Summary.Has_Reading_Time
         and then Text_Summary.Reading_Minutes = 1
         and then Text_Summary.Reading_Less_Than,
         "parse natural text summary output");
      AUnit.Assertions.Assert
        (Compact_Text_Summary.Status = Humanize.Status.Ok
         and then Compact_Text_Summary.Words = 3
         and then Compact_Text_Summary.Sentences = 1
         and then Compact_Text_Summary.Paragraphs = 1
         and then Compact_Text_Summary.Reading_Minutes = 1
         and then Compact_Text_Summary.Code_Points = 18
         and then Compact_Text_Summary.Display_Width = 18,
         "parse compact text summary output");
      AUnit.Assertions.Assert
        (Masked.Status = Humanize.Status.Ok
         and then Masked.Masked_Count = 6
         and then Masked.Visible_Count = 4
         and then Masked.Visible_Tail
           (1 .. Masked.Visible_Tail_Length) = "7890",
         "parse masked string output");
      AUnit.Assertions.Assert
        (Grouped.Status = Humanize.Status.Ok
         and then Grouped.Group_Count = 3
         and then Grouped.Token_Length = 12
         and then Grouped.Normalized
           (1 .. Grouped.Normalized_Length) = "ABCDEF123456",
         "parse grouped token output");
      AUnit.Assertions.Assert
        (Masked_Token.Status = Humanize.Status.Ok
         and then Masked_Token.Group_Count = 3
         and then Masked_Token.Token_Length = 12,
         "parse masked token output");
      AUnit.Assertions.Assert
        (Safe_Path.Status = Humanize.Status.Ok
         and then Safe_Path.Value (1 .. Safe_Path.Value_Length) =
           "report-final.pdf"
         and then Safe_Path.Has_Dot
         and then Safe_Path.ASCII_Only,
         "parse path label output");
      AUnit.Assertions.Assert
        (Path_Base.Status = Humanize.Status.Ok
         and then Path_Base.Has_Extension
         and then Path_Base.Extension (1 .. Path_Base.Extension_Length) =
           "pdf",
         "parse path basename output");
      AUnit.Assertions.Assert
        (Path_Title.Status = Humanize.Status.Ok
         and then Path_Title.Value (1 .. Path_Title.Value_Length) =
           "Report Final"
         and then Path_Title.Word_Count = 2
         and then Path_Title.Title_Case,
         "parse path title output");
      AUnit.Assertions.Assert
        (Extension_Label.Status = Humanize.Status.Ok
         and then Extension_Label.Value
           (1 .. Extension_Label.Value_Length) = "PDF"
         and then Extension_Label.Uppercase,
         "parse extension label output");
      AUnit.Assertions.Assert
        (Shortened_Path.Status = Humanize.Status.Ok
         and then Shortened_Path.Starts_With_Ellipsis = False
         and then Shortened_Path.Ends_With_Ellipsis = False
         and then Shortened_Path.Content
           (1 .. Shortened_Path.Content_Length) = "src~/humanize.ads",
         "parse shortened path output");
      AUnit.Assertions.Assert
        (Symbolic_Mode.Status = Humanize.Status.Ok
         and then Symbolic_Mode.Mode = 8#4755#
         and then Symbolic_Mode.Kind = Humanize.Strings.Regular_File
         and then Symbolic_Mode.Symbolic
         and then not Symbolic_Mode.Octal,
         "parse symbolic file mode output");
      AUnit.Assertions.Assert
        (Octal_Mode.Status = Humanize.Status.Ok
         and then Octal_Mode.Mode = 8#0755#
         and then Octal_Mode.Kind = Humanize.Strings.Mode_Only
         and then Octal_Mode.Octal
         and then not Octal_Mode.Symbolic,
         "parse octal file mode output");
      AUnit.Assertions.Assert
        (Bad_File_Mode.Status = Humanize.Status.Invalid_Value
         and then Bad_File_Mode.Error_Position = 1
         and then Bad_File_Mode.Error = Humanize.Parsing.Expected_Number,
         "parse invalid file mode diagnostic");
      AUnit.Assertions.Assert
        (Handle.Status = Humanize.Status.Ok
         and then Handle.Value (1 .. Handle.Value_Length) = "@ada",
         "parse handle label output");
      AUnit.Assertions.Assert
        (Name_Label.Status = Humanize.Status.Ok
         and then Name_Label.Value (1 .. Name_Label.Value_Length) =
           "Ada Lovelace"
         and then Name_Label.Word_Count = 2
         and then Name_Label.Title_Case,
         "parse name label output");
      AUnit.Assertions.Assert
        (Clean_Name.Status = Humanize.Status.Ok
         and then Clean_Name.Value (1 .. Clean_Name.Value_Length) =
           "Ada Lovelace",
         "parse clean name output");
      AUnit.Assertions.Assert
        (Display_Name.Status = Humanize.Status.Ok
         and then Display_Name.Value (1 .. Display_Name.Value_Length) =
           "Ada",
         "parse display name output");
      AUnit.Assertions.Assert
        (Name_Part.Status = Humanize.Status.Ok
         and then Name_Part.Value (1 .. Name_Part.Value_Length) =
           "Lovelace",
         "parse name part output");
      AUnit.Assertions.Assert
        (Initials.Status = Humanize.Status.Ok
         and then Initials.Value (1 .. Initials.Value_Length) = "AL"
         and then Initials.Initial_Count = 2
         and then Initials.All_Uppercase
         and then not Initials.Has_Digit,
         "parse initials output");
      AUnit.Assertions.Assert
        (Person_Initials.Status = Humanize.Status.Ok
         and then Person_Initials.Initial_Count = 3,
         "parse person initials output");
      AUnit.Assertions.Assert
        (Possessive.Status = Humanize.Status.Ok
         and then Possessive.Owner (1 .. Possessive.Owner_Length) = "Ada"
         and then not Possessive.Apostrophe_Only
         and then Possessive.Owner_Word_Count = 1
         and then not Possessive.Owner_Ends_With_S,
         "parse possessive output");
      AUnit.Assertions.Assert
        (Possessive_Name.Status = Humanize.Status.Ok
         and then Possessive_Name.Owner
           (1 .. Possessive_Name.Owner_Length) = "Chris"
         and then Possessive_Name.Apostrophe_Only
         and then Possessive_Name.Owner_Ends_With_S,
         "parse possessive name output");
      AUnit.Assertions.Assert
        (Email_Local.Status = Humanize.Status.Ok
         and then Email_Local.Value (1 .. Email_Local.Value_Length) =
           "ada.lovelace"
         and then not Email_Local.Empty
         and then Email_Local.Has_Dot
         and then Email_Local.Segment_Count = 2
         and then Email_Local.Looks_Local_Part,
         "parse email local-part output");
      AUnit.Assertions.Assert
        (Safe_Filename.Status = Humanize.Status.Ok
         and then Safe_Filename.Has_Extension
         and then Safe_Filename.Extension
           (1 .. Safe_Filename.Extension_Length) = "pdf"
         and then Safe_Filename.Stem_Length = 12
         and then Safe_Filename.Looks_Safe
         and then Safe_Filename.Extension_Lowercase
         and then not Safe_Filename.Reserved_Name
         and then Safe_Filename.Separator = '-'
         and then Safe_Filename.Separator_Count = 1
         and then Safe_Filename.Extension_Preserved,
         "parse safe filename output");
      AUnit.Assertions.Assert
        (Search_Key.Status = Humanize.Status.Ok
         and then Search_Key.Token_Count = 3
         and then Search_Key.Separator = ' '
         and then Search_Key.Lowercase
         and then not Search_Key.Repeated_Separator,
         "parse search key output");
      AUnit.Assertions.Assert
        (Natural_Sort_Key.Status = Humanize.Status.Ok
         and then Natural_Sort_Key.Natural_Sort_Key
         and then Natural_Sort_Key.Numeric_Run_Count = 1
         and then Natural_Sort_Key.Token_Count = 2
         and then not Natural_Sort_Key.Leading_Separator,
         "parse natural sort key output");
      AUnit.Assertions.Assert
        (Parameterized.Status = Humanize.Status.Ok
         and then Parameterized.Token_Count = 2
         and then Parameterized.Separator = '-'
         and then Parameterized.Has_Separator
         and then not Parameterized.Trailing_Separator,
         "parse parameterized label output");
      AUnit.Assertions.Assert
        (Dasherized.Status = Humanize.Status.Ok
         and then Dasherized.Separator = '-'
         and then Dasherized.Has_Separator,
         "parse dasherized label output");
      AUnit.Assertions.Assert
        (Underscored.Status = Humanize.Status.Ok
         and then Underscored.Separator = '_'
         and then Underscored.Has_Separator,
         "parse underscored label output");
      AUnit.Assertions.Assert
        (Camelized.Status = Humanize.Status.Ok
         and then Camelized.Camel_Case
         and then Camelized.Token_Count = 2,
         "parse camelized label output");
      AUnit.Assertions.Assert
        (Transliteration.Status = Humanize.Status.Ok
         and then Transliteration.Value
           (1 .. Transliteration.Value_Length) = "Aether",
         "parse transliteration label output");
      AUnit.Assertions.Assert
        (Casefold.Status = Humanize.Status.Ok
         and then Casefold.Lowercase
         and then Casefold.Token_Count = 2,
         "parse casefold label output");
      AUnit.Assertions.Assert
        (Escaped_HTML.Status = Humanize.Status.Ok
         and then Escaped_HTML.Entity_Count = 5
         and then Escaped_HTML.Tag_Like_Count = 0,
         "parse escaped HTML output");
      AUnit.Assertions.Assert
        (NL_To_BR.Status = Humanize.Status.Ok
         and then NL_To_BR.Break_Count = 1
         and then NL_To_BR.Line_Feed_Count = 0,
         "parse NL-to-BR output");
      AUnit.Assertions.Assert
        (BR_To_NL.Status = Humanize.Status.Ok
         and then BR_To_NL.Line_Feed_Count = 1
         and then BR_To_NL.Break_Count = 0,
         "parse BR-to-NL output");
      AUnit.Assertions.Assert
        (Normalized_Whitespace.Status = Humanize.Status.Ok
         and then Normalized_Whitespace.Whitespace_Run_Count = 1,
         "parse normalized whitespace output");
      AUnit.Assertions.Assert
        (Squished.Status = Humanize.Status.Ok
         and then Squished.Whitespace_Run_Count = 1,
         "parse squished output");
      AUnit.Assertions.Assert
        (Stripped_Tags.Status = Humanize.Status.Ok
         and then Stripped_Tags.Tag_Like_Count = 0,
         "parse stripped tags output");
      AUnit.Assertions.Assert
        (Preserved_Separator.Status = Humanize.Status.Ok
         and then Preserved_Separator.Separator = '/'
         and then Preserved_Separator.Separator_Count = 1
         and then not Preserved_Separator.Repeated_Separator,
         "parse preserved separator output");
      AUnit.Assertions.Assert
        (Pluralized.Status = Humanize.Status.Ok
         and then Pluralized.Value (1 .. Pluralized.Value_Length) =
           "people",
         "parse pluralized word output");
      AUnit.Assertions.Assert
        (Singularized.Status = Humanize.Status.Ok
         and then Singularized.Value (1 .. Singularized.Value_Length) =
           "person",
         "parse singularized word output");
      AUnit.Assertions.Assert
        (Person_List.Status = Humanize.Status.Ok
         and then Person_List.Visible_Count = 2
         and then Person_List.Other_Count = 2
         and then not Person_List.Empty,
         "parse person list output");
      AUnit.Assertions.Assert
        (Excerpt.Status = Humanize.Status.Ok
         and then Excerpt.Starts_With_Ellipsis
         and then Excerpt.Ends_With_Ellipsis
         and then Excerpt.Ellipsis_Length = 3
         and then Excerpt.Ellipsis_Count = 2
         and then not Excerpt.Has_Inner_Ellipsis
         and then Excerpt.Content (1 .. Excerpt.Content_Length) =
           "middle text",
         "parse excerpt output");
      AUnit.Assertions.Assert
        (Highlight.Status = Humanize.Status.Ok
         and then Highlight.Match_Count = 2
         and then Highlight.Has_Markers
         and then Highlight.Before_Length = 6
         and then Highlight.After_Length = 7
         and then not Highlight.Unbalanced_Markers,
         "parse highlight output");
      AUnit.Assertions.Assert
        (Highlighted_Excerpt.Status = Humanize.Status.Ok
         and then Highlighted_Excerpt.Match_Count = 1
         and then Highlighted_Excerpt.Has_Markers,
         "parse highlighted excerpt output");
      AUnit.Assertions.Assert
        (Inflection.Status = Humanize.Status.Ok
         and then Inflection.Source = Humanize.Strings.Irregular_Inflection,
         "parse inflection source label output");
      AUnit.Assertions.Assert
        (Uncountable_Inflection.Status = Humanize.Status.Ok
         and then Uncountable_Inflection.Source =
           Humanize.Strings.Uncountable_Inflection,
         "parse uncountable inflection source label output");
   end Check_Text_Path_And_Name_Parsers;
