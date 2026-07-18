separate (Humanize.Tests.Parsing)
   procedure Test_Round_Trip_Parsers
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);

      Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("12.5 USD");
      Approx_Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Approximate_Currency ("under 12.5 USD");
      Prefix_Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("USD 12.5");
      Attached_Prefix_Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("USD12.5");
      Symbol_Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("$ 12.5");
      Attached_Symbol_Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("$12.5");
      Scan_Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Scan_Currency ("$20");
      Currency_Missing_Code : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("12.5");
      Currency_With_Trailing_Text : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("12.5 USD now");
      Prefix_With_Trailing_Text : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("USD 12.5 now");
      Symbol_With_Trailing_Text : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("$ 12.5 now");
      Approx_Number : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Approximate_Number ("about 42");
      Change : constant Humanize.Parsing.Change_Parse_Result :=
        Humanize.Parsing.Parse_Change ("down 12.5%");
      Unit_Change : constant Humanize.Parsing.Change_Parse_Result :=
        Humanize.Parsing.Parse_Change ("5 fewer errors since yesterday");
      Number_Comparison : constant Humanize.Parsing.Comparison_Parse_Result :=
        Humanize.Parsing.Parse_Number_Comparison
          ("value is 3 errors higher than baseline");
      Percent_Comparison : constant Humanize.Parsing.Comparison_Parse_Result :=
        Humanize.Parsing.Parse_Percent_Comparison
          ("value is 12.5% lower than baseline");
      File_Comparison : constant Humanize.Parsing.Comparison_Parse_Result :=
        Humanize.Parsing.Parse_File_Size_Comparison
          ("file is 1 KiB larger than old file");
      Date_Before : constant
        Humanize.Parsing.Date_Comparison_Parse_Result :=
          Humanize.Parsing.Parse_Date_Comparison
            ("updated is 3 days before release");
      Date_After : constant
        Humanize.Parsing.Date_Comparison_Parse_Result :=
          Humanize.Parsing.Parse_Date_Comparison
            ("published is 1 year, 2 months and 3 days after release");
      Date_Same : constant
        Humanize.Parsing.Date_Comparison_Parse_Result :=
          Humanize.Parsing.Parse_Date_Comparison
            ("published is the same date as release");
      Scanned_Date : constant
        Humanize.Parsing.Date_Comparison_Parse_Result :=
          Humanize.Parsing.Scan_Date_Comparison
            ("updated is 3 days before release; cached");
      Equal_Comparison : constant Humanize.Parsing.Comparison_Parse_Result :=
        Humanize.Parsing.Parse_Number_Comparison
          ("value is equal to baseline");
      Matrix : constant
        Humanize.Parsing.Palette_Contrast_Matrix_Parse_Result :=
          Humanize.Parsing.Parse_Palette_Contrast_Matrix
            ("1 enhanced, 1 normal, 1 large-only, 0 fail out of 3 pairs");
      Palette_Metadata : constant
        Humanize.Parsing.Palette_Metadata_Parse_Result :=
          Humanize.Parsing.Parse_Palette_Metadata_Label
            ("3 colors, 3 pairs: 1 enhanced, 1 normal, 1 large-only, 0 fail");
      APCA : constant Humanize.Parsing.APCA_Label_Parse_Result :=
        Humanize.Parsing.Parse_APCA_Contrast_Label
          ("Lc 100, excellent, dark text on light background");
      CVD : constant
        Humanize.Parsing.Color_Vision_Deficiency_Parse_Result :=
          Humanize.Parsing.Parse_Color_Vision_Deficiency_Label
            ("deuteranopia low confusion risk, delta 33");
      Summary : constant Humanize.Parsing.Color_Accessibility_Parse_Result :=
        Humanize.Parsing.Parse_Color_Accessibility_Summary
          ("21:1 enhanced contrast; Lc 100, excellent, "
           & "dark text on light background; protanopia distinct");
      RGB_Label : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_RGB_Label ("rgb(51, 102, 153)");
      RGBA_Label : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_RGBA_Label ("rgba(51, 102, 153, 0.5)");
      CSS_Label : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_CSS_Color_Label ("currentColor");
      Color_Summary : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_Color_Summary
          ("#336699 rgb(51, 102, 153)");
      HSL_Label : constant Humanize.Parsing.Color_Model_Label_Parse_Result :=
        Humanize.Parsing.Parse_HSL_Label ("hsl(210, 50%, 40%)");
      HSV_Label : constant Humanize.Parsing.Color_Model_Label_Parse_Result :=
        Humanize.Parsing.Parse_HSV_Label ("hsv(210, 67%, 60%)");
      Color_Bucket : constant
        Humanize.Parsing.Color_Bucket_Label_Parse_Result :=
          Humanize.Parsing.Parse_Color_Bucket_Label ("moderate chroma");
      Localized_Color_Bucket : constant
        Humanize.Parsing.Color_Bucket_Label_Parse_Result :=
          Humanize.Parsing.Parse_Color_Bucket_Label ("mittleres Chroma");
      Color_Description : constant
        Humanize.Parsing.Color_Description_Parse_Result :=
          Humanize.Parsing.Parse_Color_Description
            ("dark, muted blue, cool, moderate chroma");
      Localized_Color_Description : constant
        Humanize.Parsing.Color_Description_Parse_Result :=
          Humanize.Parsing.Parse_Color_Description
            ("dunkel, gedaempft blau, kuehl, mittleres Chroma");
      Localized_Accessibility : constant
        Humanize.Parsing.Color_Accessibility_Parse_Result :=
          Humanize.Parsing.Parse_Color_Accessibility_Summary
            ("21:1 erhoehter Kontrast; Lc 100, excellent, "
             & "dark text on light background; protanopia distinct");
      Alpha_Contrast : constant
        Humanize.Parsing.Color_Difference_Label_Parse_Result :=
          Humanize.Parsing.Parse_Alpha_Contrast_Label
            ("3.9:1 large-text contrast after alpha compositing");
      Remediation_Pass : constant
        Humanize.Parsing.Contrast_Remediation_Parse_Result :=
          Humanize.Parsing.Parse_Contrast_Remediation_Label
            ("current foreground meets normal text contrast at 21:1");
      Remediation_Use : constant
        Humanize.Parsing.Contrast_Remediation_Parse_Result :=
          Humanize.Parsing.Parse_Contrast_Remediation_Label
            ("use #767676 for 4.5:1 normal text contrast");
      Opacity : constant Humanize.Parsing.Color_Difference_Label_Parse_Result :=
        Humanize.Parsing.Parse_Opacity_Label ("50% translucent");
      Palette_Summary : constant
        Humanize.Parsing.Palette_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Palette_Summary
            ("3 colors, mostly blue, high contrast spread");
      Palette_Roles : constant Humanize.Parsing.Palette_Roles_Parse_Result :=
        Humanize.Parsing.Parse_Palette_Roles
          ("background #FFFFFF, text #000000, accent #336699");
      Palette_Harmony : constant
        Humanize.Parsing.Color_Bucket_Label_Parse_Result :=
          Humanize.Parsing.Parse_Palette_Harmony_Label
            ("complementary palette");
      Palette_Contrast : constant
        Humanize.Parsing.Palette_Contrast_Suggestion_Parse_Result :=
          Humanize.Parsing.Parse_Palette_Contrast_Suggestion
            ("best contrast #000000 on #FFFFFF at 21:1");
      Palette_Accessibility : constant
        Humanize.Parsing.Palette_Accessibility_Label_Parse_Result :=
          Humanize.Parsing.Parse_Palette_Accessibility_Label
            ("1 of 3 pairs pass normal text contrast");
      Palette_Mood : constant Humanize.Parsing.Palette_Mood_Parse_Result :=
        Humanize.Parsing.Parse_Palette_Mood_Label
          ("dark, subtle, cool mood");
      Advanced_Palette : constant Humanize.Parsing.Palette_Mood_Parse_Result :=
        Humanize.Parsing.Parse_Advanced_Palette_Summary
          ("complementary palette, dark, subtle, cool mood, "
           & "1 of 3 pairs pass normal text contrast; background #FFFFFF, "
           & "text #000000, accent #336699");
      Color_Difference : constant
        Humanize.Parsing.Color_Difference_Label_Parse_Result :=
          Humanize.Parsing.Parse_Color_Difference_Label
            ("12% noticeable difference");
      Perceptual_Difference : constant
        Humanize.Parsing.Color_Difference_Label_Parse_Result :=
          Humanize.Parsing.Parse_Perceptual_Difference_Label
            ("OKLab delta 12.5, noticeable perceptual difference");
      CIEDE2000_Difference : constant
        Humanize.Parsing.Color_Difference_Label_Parse_Result :=
          Humanize.Parsing.Parse_Perceptual_Difference_Label
            ("CIEDE2000 delta 12.5, noticeable perceptual difference");
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
      Domain_Summary : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Domain_Summary
          ("job running: 3 of 10 tasks complete, 1 failed");
      Empty_Domain : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Domain_Summary
          ("export running: no files");
      Queue_Summary : constant Humanize.Parsing.Queue_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Queue_Summary
          ("queue: 5 jobs queued, 2 running, 1 failed, 4 complete");
      Empty_Queue : constant Humanize.Parsing.Queue_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Queue_Summary ("queue empty");
      Cache_Summary : constant Humanize.Parsing.Cache_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Cache_Summary
          ("cache: 8 hits, 2 misses, 80% hit rate");
      Empty_Cache : constant Humanize.Parsing.Cache_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Cache_Summary ("cache: no requests");
      Phrase_Severity : constant
        Humanize.Parsing.Phrase_Severity_Parse_Result :=
          Humanize.Parsing.Parse_Phrase_Severity_Label ("danger");
      Phrase_Tone : constant Humanize.Parsing.Phrase_Tone_Parse_Result :=
        Humanize.Parsing.Parse_Phrase_Tone_Label ("critical");
      Phrase_Domain : constant Humanize.Parsing.Phrase_Domain_Parse_Result :=
        Humanize.Parsing.Parse_Phrase_Domain_Label ("sync");
      Phrase_State : constant Humanize.Parsing.Phrase_State_Parse_Result :=
        Humanize.Parsing.Parse_Phrase_State_Label ("running");
      Phrase_Key : constant Humanize.Parsing.Phrase_Key_Parse_Result :=
        Humanize.Parsing.Parse_Phrase_Key ("ci.pipeline_failed");
      Phrase_Packs : constant
        Humanize.Parsing.Phrase_Pack_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Phrase_Pack_Summary
            ("ui file validation empty network auth billing workflow queue "
             & "security deployment health notification form access sync "
             & "transfer search collaboration issue task ci ticket payment "
             & "backup incident release audit flag webhook api_key quota "
             & "invoice database "
             & "summaries comparisons");
      Phrase_Locales_Text : constant Humanize.Status.Text_Result :=
        Humanize.Phrases.Supported_Phrase_Locales;
      Phrase_Locales : constant
        Humanize.Parsing.Phrase_Locales_Parse_Result :=
          Humanize.Parsing.Parse_Supported_Phrase_Locales
            (Support.Text (Phrase_Locales_Text));
      Invalid_Phrase_Locales : constant
        Humanize.Parsing.Phrase_Locales_Parse_Result :=
          Humanize.Parsing.Parse_Supported_Phrase_Locales ("en ro");
      Sync_Summary : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Sync_Summary
          ("sync running: 8 of 10 items complete, 1 failed");
      Import_Summary : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Import_Summary
          ("import running: 1 of 1 record complete");
      Export_Summary : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Export_Summary ("export running: no files");
      Unknown_Total_Summary : constant
        Humanize.Parsing.Domain_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Domain_Summary
            ("job complete: 3 tasks complete");
      File_Size : constant Humanize.Parsing.File_Size_Summary_Parse_Result :=
        Humanize.Parsing.Parse_File_Size_Summary ("3 files, 1.5 KiB");
      Empty_File_Size : constant
        Humanize.Parsing.File_Size_Summary_Parse_Result :=
          Humanize.Parsing.Parse_File_Size_Summary ("no files, 0 bytes");
      Transfer : constant Humanize.Parsing.Transfer_Remaining_Parse_Result :=
        Humanize.Parsing.Parse_Transfer_Remaining
          ("2 MB remaining at 1 kB/s");
      Transfer_Complete : constant
        Humanize.Parsing.Transfer_Remaining_Parse_Result :=
          Humanize.Parsing.Parse_Transfer_Remaining ("transfer complete");
      Transfer_Stalled : constant
        Humanize.Parsing.Transfer_Remaining_Parse_Result :=
          Humanize.Parsing.Parse_Transfer_Remaining
            ("2 MB remaining, stalled");
      Disk : constant Humanize.Parsing.Disk_Usage_Parse_Result :=
        Humanize.Parsing.Parse_Disk_Usage ("1.5 kB of 10 kB used (15%)");
      Validation : constant Humanize.Parsing.Validation_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Validation_Summary
          ("3 errors: email is invalid, password is too short and 1 other");
      Validation_Headline : constant
        Humanize.Parsing.Validation_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Validation_Summary ("3 errors");
      Validation_Ok : constant
        Humanize.Parsing.Validation_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Validation_Summary ("no errors");
      Validation_Warning : constant
        Humanize.Parsing.Validation_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Validation_Summary ("2 warnings");
      Field_Problems : constant Humanize.Parsing.Field_Problem_Parse_Result :=
        Humanize.Parsing.Parse_Field_Problem_Summary
          ("email: 2 errors: is invalid and is already used");
      No_Selection : constant Humanize.Parsing.Selection_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Selection_Summary ("no items selected");
      All_Selected : constant
        Humanize.Parsing.Selection_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Selection_Summary ("all 5 items selected");
      Partial_Selection : constant
        Humanize.Parsing.Selection_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Selection_Summary
            ("3 of 5 items selected");
      More : constant Humanize.Parsing.More_Count_Parse_Result :=
        Humanize.Parsing.Parse_More_Count ("3 shown, +4 more");
      Pagination : constant Humanize.Parsing.Pagination_Range_Parse_Result :=
        Humanize.Parsing.Parse_Pagination_Range ("21-40 of 153 results");
      Collection_Summary : constant
        Humanize.Parsing.Collection_Display_Parse_Result :=
          Humanize.Parsing.Parse_Collection_Display ("3 shown, +4 more");
      Collection_Compact_More : constant
        Humanize.Parsing.Collection_Display_Parse_Result :=
          Humanize.Parsing.Parse_Collection_Display ("+4");
      Collection_Compact_Visible : constant
        Humanize.Parsing.Collection_Display_Parse_Result :=
          Humanize.Parsing.Parse_Collection_Display ("3");
      Collection_Screen : constant
        Humanize.Parsing.Collection_Display_Parse_Result :=
          Humanize.Parsing.Parse_Collection_Display
            ("3 items shown, 4 items available");
   begin
      AUnit.Assertions.Assert
        (Currency.Status = Humanize.Status.Ok
         and then Currency.Amount = 12.5
         and then Currency.Code (1 .. Currency.Code_Length) = "USD"
         and then not Currency.Approximate,
         "parse deterministic currency output");
      AUnit.Assertions.Assert
         (Approx_Currency.Status = Humanize.Status.Ok
          and then Approx_Currency.Amount = 12.5
          and then Approx_Currency.Code (1 .. Approx_Currency.Code_Length) =
           "USD"
         and then Approx_Currency.Approximate
         and then Approx_Currency.Kind = Humanize.Numbers.Under,
         "parse approximate currency output");
      AUnit.Assertions.Assert
        (Prefix_Currency.Status = Humanize.Status.Ok
         and then Prefix_Currency.Amount = 12.5
         and then Prefix_Currency.Code (1 .. Prefix_Currency.Code_Length) = "USD",
         "parse currency prefix format");
      AUnit.Assertions.Assert
        (Prefix_Currency.Consumed = 8,
         "parse currency prefix consumed length");
      AUnit.Assertions.Assert
        (Attached_Prefix_Currency.Status = Humanize.Status.Ok
         and then Attached_Prefix_Currency.Amount = 12.5
         and then Attached_Prefix_Currency.Code
           (1 .. Attached_Prefix_Currency.Code_Length) = "USD",
         "parse currency prefix-attached format");
      AUnit.Assertions.Assert
        (Symbol_Currency.Status = Humanize.Status.Ok
         and then Symbol_Currency.Amount = 12.5
         and then Symbol_Currency.Code (1 .. Symbol_Currency.Code_Length) = "USD"
         and then Symbol_Currency.Consumed = 6,
         "parse currency symbol format");
      AUnit.Assertions.Assert
        (Attached_Symbol_Currency.Status = Humanize.Status.Ok
         and then Attached_Symbol_Currency.Amount = 12.5
         and then Attached_Symbol_Currency.Code
           (1 .. Attached_Symbol_Currency.Code_Length) = "USD",
         "parse currency symbol-attached format");
      AUnit.Assertions.Assert
        (Scan_Currency.Status = Humanize.Status.Ok
         and then Scan_Currency.Amount = 20.0
         and then Scan_Currency.Code (1 .. Scan_Currency.Code_Length) = "USD"
         and then Scan_Currency.Consumed = 3,
         "scan currency output");
      AUnit.Assertions.Assert
        (Currency_Missing_Code.Status = Humanize.Status.Invalid_Argument,
         "reject currency without code");
      AUnit.Assertions.Assert
        (Currency_With_Trailing_Text.Status = Humanize.Status.Invalid_Argument,
         "reject currency with trailing text (number-first)");
      AUnit.Assertions.Assert
        (Prefix_With_Trailing_Text.Status = Humanize.Status.Invalid_Argument,
         "reject currency with trailing text (prefix-first)");
      AUnit.Assertions.Assert
        (Symbol_With_Trailing_Text.Status = Humanize.Status.Invalid_Argument,
         "reject currency with trailing text (symbol)");
      AUnit.Assertions.Assert
        (Approx_Number.Status = Humanize.Status.Ok
         and then Approx_Number.Value = 42,
         "parse approximate number output");
      AUnit.Assertions.Assert
        (Change.Status = Humanize.Status.Ok
         and then Change.Value = -12.5
         and then Change.Percent
         and then not Change.Points,
         "parse percent change output");
      AUnit.Assertions.Assert
        (Unit_Change.Status = Humanize.Status.Ok
         and then Unit_Change.Value = -5.0
         and then Unit_Change.Unit (1 .. Unit_Change.Unit_Length) = "errors"
         and then Unit_Change.Since (1 .. Unit_Change.Since_Length) =
           "yesterday",
         "parse comparative unit change output");
      AUnit.Assertions.Assert
        (Number_Comparison.Status = Humanize.Status.Ok
         and then Number_Comparison.Direction =
           Humanize.Parsing.Comparison_Higher
         and then Number_Comparison.Difference = 3.0
         and then Number_Comparison.Unit
           (1 .. Number_Comparison.Unit_Length) = "errors"
         and then Number_Comparison.Current_Label
           (1 .. Number_Comparison.Current_Label_Length) = "value"
         and then Number_Comparison.Baseline_Label
           (1 .. Number_Comparison.Baseline_Label_Length) = "baseline",
         "parse number comparison output");
      AUnit.Assertions.Assert
        (Percent_Comparison.Status = Humanize.Status.Ok
         and then Percent_Comparison.Direction =
           Humanize.Parsing.Comparison_Lower
         and then Percent_Comparison.Difference = 12.5
         and then Percent_Comparison.Percent,
         "parse percent comparison output");
      AUnit.Assertions.Assert
        (File_Comparison.Status = Humanize.Status.Ok
         and then File_Comparison.Direction =
           Humanize.Parsing.Comparison_Larger
         and then File_Comparison.Difference = 1024.0
         and then File_Comparison.Byte_Size,
         "parse file-size comparison output");
      AUnit.Assertions.Assert
        (Date_Before.Status = Humanize.Status.Ok
         and then Date_Before.Direction =
           Humanize.Parsing.Comparison_Before
         and then Date_Before.Days = 3
         and then Date_Before.Current_Label
           (1 .. Date_Before.Current_Label_Length) = "updated"
         and then Date_Before.Baseline_Label
           (1 .. Date_Before.Baseline_Label_Length) = "release",
         "parse date before comparison output");
      AUnit.Assertions.Assert
        (Date_After.Status = Humanize.Status.Ok
         and then Date_After.Direction =
           Humanize.Parsing.Comparison_After
         and then Date_After.Years = 1
         and then Date_After.Months = 2
         and then Date_After.Days = 3,
         "parse date after comparison output");
      AUnit.Assertions.Assert
        (Date_Same.Status = Humanize.Status.Ok
         and then Date_Same.Direction =
           Humanize.Parsing.Comparison_Equal
         and then Date_Same.Years = 0
         and then Date_Same.Months = 0
         and then Date_Same.Days = 0,
         "parse same-date comparison output");
      AUnit.Assertions.Assert
        (Scanned_Date.Status = Humanize.Status.Ok
         and then Scanned_Date.Consumed = 32
         and then Scanned_Date.Direction =
           Humanize.Parsing.Comparison_Before,
         "scan date comparison output");
      AUnit.Assertions.Assert
        (Equal_Comparison.Status = Humanize.Status.Ok
         and then Equal_Comparison.Direction =
           Humanize.Parsing.Comparison_Equal
         and then Equal_Comparison.Difference = 0.0,
         "parse equal comparison output");
      AUnit.Assertions.Assert
        (Matrix.Status = Humanize.Status.Ok
         and then Matrix.Enhanced = 1
         and then Matrix.Normal = 1
         and then Matrix.Large_Only = 1
         and then Matrix.Fail = 0
         and then Matrix.Total = 3,
         "parse palette contrast matrix output");
      AUnit.Assertions.Assert
        (Palette_Metadata.Status = Humanize.Status.Ok
         and then Palette_Metadata.Color_Count = 3
         and then Palette_Metadata.Pair_Count = 3
         and then Palette_Metadata.Enhanced = 1
         and then Palette_Metadata.Normal = 1
         and then Palette_Metadata.Large_Only = 1
         and then Palette_Metadata.Fail = 0,
         "parse palette metadata label output");
      AUnit.Assertions.Assert
        (APCA.Status = Humanize.Status.Ok
         and then APCA.Score = 100.0
         and then APCA.Strength (1 .. APCA.Strength_Length) = "excellent"
         and then APCA.Polarity (1 .. APCA.Polarity_Length) =
           "dark text on light background",
         "parse APCA contrast label output");
      AUnit.Assertions.Assert
        (CVD.Status = Humanize.Status.Ok
         and then CVD.Deficiency = Humanize.Colors.Deuteranopia
         and then CVD.Risk (1 .. CVD.Risk_Length) =
           "low confusion risk"
         and then CVD.Difference = 33.0
         and then CVD.Has_Delta,
         "parse color vision deficiency label output");
      AUnit.Assertions.Assert
        (Summary.Status = Humanize.Status.Ok
         and then Summary.Contrast_Ratio = 21.0
         and then Summary.Contrast_Level
           (1 .. Summary.Contrast_Level_Length) = "enhanced"
         and then Summary.APCA.Score = 100.0
         and then Summary.CVD.Deficiency = Humanize.Colors.Protanopia
         and then Summary.CVD.Risk (1 .. Summary.CVD.Risk_Length) =
           "distinct"
         and then not Summary.CVD.Has_Delta,
         "parse combined color accessibility summary output");
      AUnit.Assertions.Assert
        (RGB_Label.Status = Humanize.Status.Ok
         and then RGB_Label.Color.Red = 51
         and then RGB_Label.Color.Green = 102
         and then RGB_Label.Color.Blue = 153
         and then not RGB_Label.Has_Opacity,
         "parse RGB label output");
      AUnit.Assertions.Assert
        (RGBA_Label.Status = Humanize.Status.Ok
         and then RGBA_Label.Color.Red = 51
         and then RGBA_Label.Color.Green = 102
         and then RGBA_Label.Color.Blue = 153
         and then RGBA_Label.Has_Opacity
         and then RGBA_Label.Opacity = 0.5,
         "parse RGBA label output");
      AUnit.Assertions.Assert
        (CSS_Label.Status = Humanize.Status.Ok
         and then CSS_Label.Is_Current,
         "parse CSS currentColor label output");
      AUnit.Assertions.Assert
        (Color_Summary.Status = Humanize.Status.Ok
         and then Color_Summary.Color.Red = 51
         and then Color_Summary.Color.Green = 102
         and then Color_Summary.Color.Blue = 153,
         "parse color summary output");
      AUnit.Assertions.Assert
        (HSL_Label.Status = Humanize.Status.Ok
         and then HSL_Label.First = 210.0
         and then HSL_Label.Second = 50.0
         and then HSL_Label.Third = 40.0,
         "parse HSL label output");
      AUnit.Assertions.Assert
        (HSV_Label.Status = Humanize.Status.Ok
         and then HSV_Label.First = 210.0
         and then HSV_Label.Second = 67.0
         and then HSV_Label.Third = 60.0,
         "parse HSV label output");
      AUnit.Assertions.Assert
        (Color_Bucket.Status = Humanize.Status.Ok
         and then Color_Bucket.Label (1 .. Color_Bucket.Label_Length) =
           "moderate chroma",
         "parse color bucket label output");
      AUnit.Assertions.Assert
        (Localized_Color_Bucket.Status = Humanize.Status.Ok
         and then Localized_Color_Bucket.Label
           (1 .. Localized_Color_Bucket.Label_Length) = "mittleres chroma",
         "parse localized color bucket label output");
      AUnit.Assertions.Assert
        (Color_Description.Status = Humanize.Status.Ok
         and then Color_Description.Brightness
           (1 .. Color_Description.Brightness_Length) = "dark"
         and then Color_Description.Saturation
           (1 .. Color_Description.Saturation_Length) = "muted"
         and then Color_Description.Hue
           (1 .. Color_Description.Hue_Length) = "blue"
         and then Color_Description.Temperature
           (1 .. Color_Description.Temperature_Length) = "cool"
         and then Color_Description.Chroma
           (1 .. Color_Description.Chroma_Length) = "moderate chroma",
         "parse color description output");
      AUnit.Assertions.Assert
        (Localized_Color_Description.Status = Humanize.Status.Ok
         and then Localized_Color_Description.Brightness
           (1 .. Localized_Color_Description.Brightness_Length) = "dunkel"
         and then Localized_Color_Description.Saturation
           (1 .. Localized_Color_Description.Saturation_Length) = "gedaempft"
         and then Localized_Color_Description.Hue
           (1 .. Localized_Color_Description.Hue_Length) = "blau"
         and then Localized_Color_Description.Temperature
           (1 .. Localized_Color_Description.Temperature_Length) = "kuehl"
         and then Localized_Color_Description.Chroma
           (1 .. Localized_Color_Description.Chroma_Length) = "mittleres chroma",
         "parse localized color description output");
      AUnit.Assertions.Assert
        (Localized_Accessibility.Status = Humanize.Status.Ok
         and then Localized_Accessibility.Contrast_Ratio = 21.0
         and then Localized_Accessibility.Contrast_Level
           (1 .. Localized_Accessibility.Contrast_Level_Length)
           = "erhoehter Kontrast",
         "parse localized color accessibility summary output");
      AUnit.Assertions.Assert
        (Alpha_Contrast.Status = Humanize.Status.Ok
         and then Alpha_Contrast.Value = 3.9
         and then Alpha_Contrast.Label
           (1 .. Alpha_Contrast.Label_Length) = "large-text"
         and then not Alpha_Contrast.Perceptual,
         "parse alpha contrast label output");
      AUnit.Assertions.Assert
        (Remediation_Pass.Status = Humanize.Status.Ok
         and then Remediation_Pass.Already_Passes
         and then not Remediation_Pass.Has_Recommended_Color
         and then Remediation_Pass.Ratio = 21.0
         and then Remediation_Pass.Target
           (1 .. Remediation_Pass.Target_Length) = "normal text",
         "parse contrast remediation pass output");
      AUnit.Assertions.Assert
        (Remediation_Use.Status = Humanize.Status.Ok
         and then not Remediation_Use.Already_Passes
         and then Remediation_Use.Has_Recommended_Color
         and then Remediation_Use.Recommended_Color =
           (Red => 16#76#, Green => 16#76#, Blue => 16#76#)
         and then Remediation_Use.Ratio = 4.5
         and then Remediation_Use.Target
           (1 .. Remediation_Use.Target_Length) = "normal text",
         "parse contrast remediation suggestion output");
      AUnit.Assertions.Assert
        (Opacity.Status = Humanize.Status.Ok
         and then Opacity.Value = 50.0
         and then Opacity.Label (1 .. Opacity.Label_Length) =
           "translucent",
         "parse opacity label output");
      AUnit.Assertions.Assert
        (Palette_Summary.Status = Humanize.Status.Ok
         and then Palette_Summary.Count = 3
         and then Palette_Summary.Dominant_Color
           (1 .. Palette_Summary.Dominant_Color_Length) = "blue"
         and then Palette_Summary.Spread
           (1 .. Palette_Summary.Spread_Length) = "high contrast spread",
         "parse palette summary output");
      AUnit.Assertions.Assert
        (Palette_Roles.Status = Humanize.Status.Ok
         and then Palette_Roles.Background.Red = 255
         and then Palette_Roles.Background.Green = 255
         and then Palette_Roles.Background.Blue = 255
         and then Palette_Roles.Text_Color.Red = 0
         and then Palette_Roles.Accent.Red = 51
         and then Palette_Roles.Accent.Green = 102
         and then Palette_Roles.Accent.Blue = 153,
         "parse palette roles output");
      AUnit.Assertions.Assert
        (Palette_Harmony.Status = Humanize.Status.Ok
         and then Palette_Harmony.Label
           (1 .. Palette_Harmony.Label_Length) = "complementary palette",
         "parse palette harmony output");
      AUnit.Assertions.Assert
        (Palette_Contrast.Status = Humanize.Status.Ok
         and then Palette_Contrast.Foreground.Red = 0
         and then Palette_Contrast.Background.Red = 255
         and then Palette_Contrast.Ratio = 21.0,
         "parse palette contrast suggestion output");
      AUnit.Assertions.Assert
        (Palette_Accessibility.Status = Humanize.Status.Ok
         and then Palette_Accessibility.Passing = 1
         and then Palette_Accessibility.Total = 3
         and then Palette_Accessibility.Normal_Text
         and then Palette_Accessibility.Has_Accessible_Pairs,
         "parse palette accessibility output");
      AUnit.Assertions.Assert
        (Palette_Mood.Status = Humanize.Status.Ok
         and then Palette_Mood.Tone (1 .. Palette_Mood.Tone_Length) = "dark"
         and then Palette_Mood.Energy
           (1 .. Palette_Mood.Energy_Length) = "subtle"
         and then Palette_Mood.Temperature
           (1 .. Palette_Mood.Temperature_Length) = "cool",
         "parse palette mood output");
      AUnit.Assertions.Assert
        (Advanced_Palette.Status = Humanize.Status.Ok
         and then Advanced_Palette.Tone
           (1 .. Advanced_Palette.Tone_Length) = "dark"
         and then Advanced_Palette.Energy
           (1 .. Advanced_Palette.Energy_Length) = "subtle"
         and then Advanced_Palette.Temperature
           (1 .. Advanced_Palette.Temperature_Length) = "cool",
         "parse advanced palette summary output");
      AUnit.Assertions.Assert
        (Color_Difference.Status = Humanize.Status.Ok
         and then Color_Difference.Value = 12.0
         and then Color_Difference.Label
           (1 .. Color_Difference.Label_Length) =
             "noticeable difference"
         and then not Color_Difference.Perceptual,
         "parse color difference label output");
      AUnit.Assertions.Assert
        (Perceptual_Difference.Status = Humanize.Status.Ok
         and then Perceptual_Difference.Value = 12.5
         and then Perceptual_Difference.Label
           (1 .. Perceptual_Difference.Label_Length) =
             "noticeable perceptual difference"
         and then Perceptual_Difference.Perceptual,
         "parse perceptual difference label output");
      AUnit.Assertions.Assert
        (CIEDE2000_Difference.Status = Humanize.Status.Ok
         and then CIEDE2000_Difference.Value = 12.5
         and then CIEDE2000_Difference.Label
           (1 .. CIEDE2000_Difference.Label_Length) =
             "noticeable perceptual difference"
         and then CIEDE2000_Difference.Perceptual,
         "parse CIEDE2000 perceptual difference label output");
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
      AUnit.Assertions.Assert
        (Domain_Summary.Status = Humanize.Status.Ok
         and then Domain_Summary.Domain
           (1 .. Domain_Summary.Domain_Length) = "job"
         and then Domain_Summary.State
           (1 .. Domain_Summary.State_Length) = "running"
         and then Domain_Summary.Completed = 3
         and then Domain_Summary.Total = 10
         and then Domain_Summary.Failed = 1
         and then Domain_Summary.Unit
           (1 .. Domain_Summary.Unit_Length) = "tasks",
         "parse domain summary output");
      AUnit.Assertions.Assert
        (Empty_Domain.Status = Humanize.Status.Ok
         and then Empty_Domain.Completed = 0
         and then Empty_Domain.Total = 0
         and then Empty_Domain.Unit
           (1 .. Empty_Domain.Unit_Length) = "files",
         "parse empty domain summary output");
      AUnit.Assertions.Assert
        (Queue_Summary.Status = Humanize.Status.Ok
         and then Queue_Summary.Queued = 5
         and then Queue_Summary.Running = 2
         and then Queue_Summary.Failed = 1
         and then Queue_Summary.Completed = 4
         and then Queue_Summary.Unit
           (1 .. Queue_Summary.Unit_Length) = "jobs",
         "parse queue summary output");
      AUnit.Assertions.Assert
        (Empty_Queue.Status = Humanize.Status.Ok
         and then Empty_Queue.Empty,
         "parse empty queue summary output");
      AUnit.Assertions.Assert
        (Cache_Summary.Status = Humanize.Status.Ok
         and then Cache_Summary.Hits = 8
         and then Cache_Summary.Misses = 2
         and then Cache_Summary.Hit_Rate = 80,
         "parse cache summary output");
      AUnit.Assertions.Assert
        (Empty_Cache.Status = Humanize.Status.Ok
         and then Empty_Cache.Empty,
         "parse empty cache summary output");
      AUnit.Assertions.Assert
        (Phrase_Severity.Status = Humanize.Status.Ok
         and then Phrase_Severity.Severity =
           Humanize.Phrases.Danger_Severity,
         "parse phrase severity label output");
      AUnit.Assertions.Assert
        (Phrase_Tone.Status = Humanize.Status.Ok
         and then Phrase_Tone.Tone = Humanize.Phrases.Critical_Tone,
         "parse phrase tone label output");
      AUnit.Assertions.Assert
        (Phrase_Domain.Status = Humanize.Status.Ok
         and then Phrase_Domain.Domain = Humanize.Phrases.Sync_Domain,
         "parse phrase domain label output");
      AUnit.Assertions.Assert
        (Phrase_State.Status = Humanize.Status.Ok
         and then Phrase_State.State = Humanize.Phrases.Summary_Running,
         "parse phrase state label output");
      AUnit.Assertions.Assert
        (Phrase_Key.Status = Humanize.Status.Ok
         and then Phrase_Key.Prefix (1 .. Phrase_Key.Prefix_Length) = "ci"
         and then Phrase_Key.Name (1 .. Phrase_Key.Name_Length) =
           "pipeline_failed",
         "parse phrase key output");
      AUnit.Assertions.Assert
        (Phrase_Packs.Status = Humanize.Status.Ok
         and then Phrase_Packs.Pack_Count = 36
         and then Phrase_Packs.Has_Summaries
         and then Phrase_Packs.Has_Comparisons,
         "parse phrase pack summary output");
      AUnit.Assertions.Assert
        (Phrase_Locales.Status = Humanize.Status.Ok
         and then Phrase_Locales.Locale_Count =
           Humanize.Phrases.Phrase_Locale_Count
         and then Phrase_Locales.Has_Generated_Locales,
         "parse supported phrase locales output");
      AUnit.Assertions.Assert
        (Invalid_Phrase_Locales.Status = Humanize.Status.Invalid_Argument
         and then Invalid_Phrase_Locales.Error =
           Humanize.Parsing.Unsupported_Form
         and then Invalid_Phrase_Locales.Error_Position = 4,
         "parse unsupported phrase locale output");
      AUnit.Assertions.Assert
        (Sync_Summary.Status = Humanize.Status.Ok
         and then Sync_Summary.Domain (1 .. Sync_Summary.Domain_Length) =
           "sync"
         and then Sync_Summary.Completed = 8
         and then Sync_Summary.Total = 10
         and then Sync_Summary.Failed = 1
         and then Sync_Summary.Unit (1 .. Sync_Summary.Unit_Length) =
           "items",
         "parse sync summary output");
      AUnit.Assertions.Assert
        (Import_Summary.Status = Humanize.Status.Ok
         and then Import_Summary.Domain (1 .. Import_Summary.Domain_Length) =
           "import"
         and then Import_Summary.Completed = 1
         and then Import_Summary.Total = 1
         and then Import_Summary.Unit (1 .. Import_Summary.Unit_Length) =
           "record",
         "parse import summary output");
      AUnit.Assertions.Assert
        (Export_Summary.Status = Humanize.Status.Ok
         and then Export_Summary.Domain (1 .. Export_Summary.Domain_Length) =
           "export"
         and then Export_Summary.Completed = 0
         and then Export_Summary.Total = 0
         and then Export_Summary.Unit (1 .. Export_Summary.Unit_Length) =
           "files",
         "parse export summary output");
      AUnit.Assertions.Assert
        (Unknown_Total_Summary.Status = Humanize.Status.Ok
         and then Unknown_Total_Summary.Completed = 3
         and then Unknown_Total_Summary.Total = 0
         and then Unknown_Total_Summary.Unit
           (1 .. Unknown_Total_Summary.Unit_Length) = "tasks",
         "parse unknown-total domain summary output");
      AUnit.Assertions.Assert
        (File_Size.Status = Humanize.Status.Ok
         and then File_Size.File_Count = 3
         and then File_Size.Total = 1536,
         "parse file-size summary output");
      AUnit.Assertions.Assert
        (Empty_File_Size.Status = Humanize.Status.Ok
         and then Empty_File_Size.File_Count = 0
         and then Empty_File_Size.Total = 0,
         "parse empty file-size summary output");
      AUnit.Assertions.Assert
        (Transfer.Status = Humanize.Status.Ok
         and then Transfer.Remaining = 2_000_000
         and then Transfer.Bytes_Per_Second = 1_000
         and then Transfer.Has_Rate,
         "parse transfer remaining with rate output");
      AUnit.Assertions.Assert
        (Transfer_Complete.Status = Humanize.Status.Ok
         and then Transfer_Complete.Complete,
         "parse transfer complete output");
      AUnit.Assertions.Assert
        (Transfer_Stalled.Status = Humanize.Status.Ok
         and then Transfer_Stalled.Remaining = 2_000_000
         and then Transfer_Stalled.Stalled,
         "parse stalled transfer output");
      AUnit.Assertions.Assert
        (Disk.Status = Humanize.Status.Ok
         and then Disk.Used = 1_500
         and then Disk.Total = 10_000
         and then Disk.Percent_Used = 15,
         "parse disk usage output");
      AUnit.Assertions.Assert
        (Validation.Status = Humanize.Status.Ok
         and then Validation.Count = 3
         and then Validation.Severity =
           Humanize.Parsing.Parsed_Validation_Error
         and then Validation.Has_Details
         and then Validation.Other_Count = 1
         and then Validation.Details (1 .. Validation.Details_Length) =
           "email is invalid, password is too short and 1 other",
         "parse detailed validation summary output");
      AUnit.Assertions.Assert
        (Validation_Headline.Status = Humanize.Status.Ok
         and then Validation_Headline.Count = 3
         and then Validation_Headline.Severity =
           Humanize.Parsing.Parsed_Validation_Error
         and then not Validation_Headline.Has_Details,
         "parse validation summary headline");
      AUnit.Assertions.Assert
        (Validation_Ok.Status = Humanize.Status.Ok
         and then Validation_Ok.Count = 0
         and then Validation_Ok.Severity =
           Humanize.Parsing.Parsed_Validation_Error,
         "parse empty validation summary");
      AUnit.Assertions.Assert
        (Validation_Warning.Status = Humanize.Status.Ok
         and then Validation_Warning.Count = 2
         and then Validation_Warning.Severity =
           Humanize.Parsing.Parsed_Validation_Warning,
         "parse validation warning summary");
      AUnit.Assertions.Assert
        (Field_Problems.Status = Humanize.Status.Ok
         and then Field_Problems.Field
           (1 .. Field_Problems.Field_Length) = "email"
         and then Field_Problems.Summary.Count = 2
         and then Field_Problems.Summary.Details
           (1 .. Field_Problems.Summary.Details_Length) =
             "is invalid and is already used",
         "parse field problem summary output");
      AUnit.Assertions.Assert
        (No_Selection.Status = Humanize.Status.Ok
         and then No_Selection.Kind = Humanize.Parsing.Selection_None
         and then No_Selection.Selected = 0
         and then No_Selection.Total = 0
         and then No_Selection.Unit (1 .. No_Selection.Unit_Length) =
           "items",
         "parse empty selection summary output");
      AUnit.Assertions.Assert
        (All_Selected.Status = Humanize.Status.Ok
         and then All_Selected.Kind = Humanize.Parsing.Selection_All
         and then All_Selected.Selected = 5
         and then All_Selected.Total = 5
         and then All_Selected.Unit (1 .. All_Selected.Unit_Length) =
           "items",
         "parse all selection summary output");
      AUnit.Assertions.Assert
        (Partial_Selection.Status = Humanize.Status.Ok
         and then Partial_Selection.Kind = Humanize.Parsing.Selection_Partial
         and then Partial_Selection.Selected = 3
         and then Partial_Selection.Total = 5
         and then Partial_Selection.Unit
           (1 .. Partial_Selection.Unit_Length) = "items",
         "parse partial selection summary output");
      AUnit.Assertions.Assert
        (More.Status = Humanize.Status.Ok
         and then More.Visible = 3
         and then More.Remaining = 4,
         "parse more-count summary output");
      AUnit.Assertions.Assert
        (Pagination.Status = Humanize.Status.Ok
         and then Pagination.First = 21
         and then Pagination.Last = 40
         and then Pagination.Total = 153
         and then Pagination.Unit (1 .. Pagination.Unit_Length) = "results",
         "parse pagination range output");
      AUnit.Assertions.Assert
        (Collection_Summary.Status = Humanize.Status.Ok
         and then Collection_Summary.Kind =
           Humanize.Parsing.Collection_Summary
         and then Collection_Summary.Visible = 3
         and then Collection_Summary.Remaining = 4,
         "parse collection summary output");
      AUnit.Assertions.Assert
        (Collection_Compact_More.Status = Humanize.Status.Ok
         and then Collection_Compact_More.Kind =
           Humanize.Parsing.Collection_Compact
         and then Collection_Compact_More.Visible = 0
         and then Collection_Compact_More.Remaining = 4,
         "parse compact collection remaining output");
      AUnit.Assertions.Assert
        (Collection_Compact_Visible.Status = Humanize.Status.Ok
         and then Collection_Compact_Visible.Kind =
           Humanize.Parsing.Collection_Compact
         and then Collection_Compact_Visible.Visible = 3
         and then Collection_Compact_Visible.Remaining = 0,
         "parse compact collection visible output");
      AUnit.Assertions.Assert
        (Collection_Screen.Status = Humanize.Status.Ok
         and then Collection_Screen.Kind =
           Humanize.Parsing.Collection_Screen_Reader
         and then Collection_Screen.Visible = 3
         and then Collection_Screen.Remaining = 4
         and then Collection_Screen.Visible_Unit
           (1 .. Collection_Screen.Visible_Unit_Length) = "items"
         and then Collection_Screen.Remaining_Unit
           (1 .. Collection_Screen.Remaining_Unit_Length) = "items",
         "parse screen-reader collection output");
   end Test_Round_Trip_Parsers;
