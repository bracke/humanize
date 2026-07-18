separate (Humanize.Tests.Compatibility)
   procedure Check_Deterministic_Helper_Roundtrips is
      Color : constant Humanize.Colors.RGB_Color :=
        (Red => 16#33#, Green => 16#66#, Blue => 16#99#);
      Black : constant Humanize.Colors.RGB_Color :=
        (Red => 0, Green => 0, Blue => 0);
      White : constant Humanize.Colors.RGB_Color :=
        (Red => 255, Green => 255, Blue => 255);
      Palette : constant Humanize.Colors.Color_List :=
        [1 => Color, 2 => Black, 3 => White];
      Validation_Issues : constant Humanize.Lists.Text_List :=
        [1 => To_Unbounded_String ("email is invalid"),
         2 => To_Unbounded_String ("password is too short")];
      Field_Issues : constant Humanize.Lists.Text_List :=
        [1 => To_Unbounded_String ("is invalid")];

      RGB_Text : constant String :=
        Rendered (Humanize.Colors.RGB_Label (Color), "RGB label");
      RGB : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_RGB_Label (RGB_Text);
      RGBA_Text : constant String :=
        Rendered (Humanize.Colors.RGBA_Label (Color, 0.5), "RGBA label");
      RGBA : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_RGBA_Label (RGBA_Text);
      Summary_Text : constant String :=
        Rendered (Humanize.Colors.Color_Summary (Color), "color summary");
      Summary : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_Color_Summary (Summary_Text);
      HSL_Text : constant String :=
        Rendered (Humanize.Colors.HSL_Label (Color), "HSL label");
      HSL : constant Humanize.Parsing.Color_Model_Label_Parse_Result :=
        Humanize.Parsing.Parse_HSL_Label (HSL_Text);
      HSV_Text : constant String :=
        Rendered (Humanize.Colors.HSV_Label (Color), "HSV label");
      HSV : constant Humanize.Parsing.Color_Model_Label_Parse_Result :=
        Humanize.Parsing.Parse_HSV_Label (HSV_Text);
      Description_Text : constant String :=
        Rendered
          (Humanize.Colors.Color_Description (Color), "color description");
      Description : constant Humanize.Parsing.Color_Description_Parse_Result :=
        Humanize.Parsing.Parse_Color_Description (Description_Text);
      Palette_Text : constant String :=
        Rendered (Humanize.Colors.Palette_Summary (Palette),
                  "palette summary");
      Palette_Result : constant Humanize.Parsing.Palette_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Palette_Summary (Palette_Text);
      Accessibility_Text : constant String :=
        Rendered (Humanize.Colors.Color_Accessibility_Summary (Black, White),
                  "color accessibility summary");
      Accessibility : constant
        Humanize.Parsing.Color_Accessibility_Parse_Result :=
          Humanize.Parsing.Parse_Color_Accessibility_Summary
            (Accessibility_Text);
      Difference_Text : constant String :=
        Rendered (Humanize.Colors.Color_Difference_Label (Black, White),
                  "color difference");
      Difference : constant
        Humanize.Parsing.Color_Difference_Label_Parse_Result :=
          Humanize.Parsing.Parse_Color_Difference_Label (Difference_Text);

      Filename_Text : constant String :=
        Rendered (Humanize.Strings.Safe_Filename ("Hello, Ada!.txt"),
                  "safe filename");
      Filename : constant Humanize.Parsing.Filename_Label_Parse_Result :=
        Humanize.Parsing.Parse_Safe_Filename (Filename_Text);
      Basename_Text : constant String :=
        Rendered
          (Humanize.Strings.Path_Basename ("/tmp/report-final.pdf"),
           "path basename");
      Basename : constant Humanize.Parsing.Filename_Label_Parse_Result :=
        Humanize.Parsing.Parse_Path_Basename (Basename_Text);
      Title_Text : constant String :=
        Rendered
          (Humanize.Strings.Path_Title ("/tmp/report-final.pdf"),
           "path title");
      Title : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Path_Title (Title_Text);
      Extension_Text : constant String :=
        Rendered
          (Humanize.Strings.Extension_Label ("/tmp/report-final.pdf"),
           "extension label");
      Extension : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Extension_Label (Extension_Text);
      Handle_Text : constant String :=
        Rendered (Humanize.Strings.Handle_Label ("ada"), "handle label");
      Handle : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Handle_Label (Handle_Text);
      Initials_Text : constant String :=
        Rendered (Humanize.Strings.Person_Initials ("Ada Lovelace"),
                  "person initials");
      Initials : constant Humanize.Parsing.Initials_Parse_Result :=
        Humanize.Parsing.Parse_Person_Initials (Initials_Text);
      Possessive_Text : constant String :=
        Rendered (Humanize.Strings.Possessive_Name ("Ada"),
                  "possessive name");
      Possessive : constant Humanize.Parsing.Possessive_Parse_Result :=
        Humanize.Parsing.Parse_Possessive_Name (Possessive_Text);
      Token_Text : constant String :=
        Rendered (Humanize.Strings.Group_Token ("ABCDEF123456"),
                  "group token");
      Token : constant Humanize.Parsing.Grouped_Token_Parse_Result :=
        Humanize.Parsing.Parse_Grouped_Token (Token_Text);
      Mask_Text : constant String :=
        Rendered (Humanize.Strings.Mask ("secret-token", 4), "mask text");
      Mask : constant Humanize.Parsing.Mask_Parse_Result :=
        Humanize.Parsing.Parse_Mask (Mask_Text);
      Text_Summary_Text : constant String :=
        Rendered
          (Humanize.Strings.Text_Summary
             ("Ada writes tests. Bob reads them."),
           "text summary");
      Text_Summary : constant Humanize.Parsing.Text_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Text_Summary (Text_Summary_Text);
      Parameterized_Text : constant String :=
        Rendered (Humanize.Strings.Parameterize ("Ada Lovelace"),
                  "parameterize label");
      Parameterized : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
        Humanize.Parsing.Parse_Parameterize_Label (Parameterized_Text);
      Dasherized_Text : constant String :=
        Rendered (Humanize.Strings.Dasherize ("ada_lovelace"),
                  "dasherize label");
      Dasherized : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
        Humanize.Parsing.Parse_Dasherize_Label (Dasherized_Text);
      Underscore_Text : constant String :=
        Rendered (Humanize.Strings.Underscore ("AdaLovelace"),
                  "underscore label");
      Underscore : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
        Humanize.Parsing.Parse_Underscore_Label (Underscore_Text);
      Camel_Text : constant String :=
        Rendered (Humanize.Strings.Camelize ("ada_lovelace"),
                  "camelize label");
      Camel : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
        Humanize.Parsing.Parse_Camelize_Label (Camel_Text);
      Inflection_Text : constant String :=
        Rendered
          (Humanize.Strings.Inflection_Source_Label
             (Humanize.Strings.Pluralize_Source ("child")),
           "inflection source label");
      Inflection : constant Humanize.Parsing.Inflection_Source_Parse_Result :=
        Humanize.Parsing.Parse_Inflection_Source_Label (Inflection_Text);

      File_Size_Text : constant String :=
        Rendered
          (Humanize.Bytes.File_Size_Summary (Support.En, 3, 1_536),
           "file-size summary");
      File_Size : constant Humanize.Parsing.File_Size_Summary_Parse_Result :=
        Humanize.Parsing.Parse_File_Size_Summary (File_Size_Text);
      Transfer_Text : constant String :=
        Rendered
          (Humanize.Bytes.Transfer_Remaining_Label
             (Support.En, 1_536, 512),
           "transfer remaining");
      Transfer : constant Humanize.Parsing.Transfer_Remaining_Parse_Result :=
        Humanize.Parsing.Parse_Transfer_Remaining (Transfer_Text);
      Disk_Text : constant String :=
        Rendered
          (Humanize.Bytes.Disk_Usage_Label (Support.En, 1_536, 3_072),
           "disk usage");
      Disk : constant Humanize.Parsing.Disk_Usage_Parse_Result :=
        Humanize.Parsing.Parse_Disk_Usage (Disk_Text);

      Validation_Text : constant String :=
        Rendered
          (Humanize.Lists.Validation_Summary
             (Support.En, Validation_Issues),
           "validation summary");
      Validation : constant Humanize.Parsing.Validation_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Validation_Summary (Validation_Text);
      Field_Text : constant String :=
        Rendered
          (Humanize.Lists.Field_Problem_Summary
             (Support.En, "email", Field_Issues),
           "field problem summary");
      Field : constant Humanize.Parsing.Field_Problem_Parse_Result :=
        Humanize.Parsing.Parse_Field_Problem_Summary (Field_Text);
      Selection_Text : constant String :=
        Rendered
          (Humanize.Lists.Selection_Summary
             (Support.En, 3, 5, "item"),
           "selection summary");
      Selection : constant Humanize.Parsing.Selection_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Selection_Summary (Selection_Text);
      More_Text : constant String :=
        Rendered
          (Humanize.Lists.More_Count (Support.En, 3, 4),
           "more count");
      More : constant Humanize.Parsing.More_Count_Parse_Result :=
        Humanize.Parsing.Parse_More_Count (More_Text);
      Pagination_Text : constant String :=
        Rendered
          (Humanize.Lists.Pagination_Range
             (Support.En, 21, 40, 153),
           "pagination range");
      Pagination : constant Humanize.Parsing.Pagination_Range_Parse_Result :=
        Humanize.Parsing.Parse_Pagination_Range (Pagination_Text);
      Collection_Text : constant String :=
        Rendered
          (Humanize.Lists.Collection_Display (Support.En, 3, 4),
           "collection display");
      Collection : constant Humanize.Parsing.Collection_Display_Parse_Result :=
        Humanize.Parsing.Parse_Collection_Display (Collection_Text);

      Severity_Text : constant String :=
        Rendered
          (Humanize.Phrases.Severity_Label
             (Humanize.Phrases.Danger_Severity),
           "phrase severity label");
      Severity : constant Humanize.Parsing.Phrase_Severity_Parse_Result :=
        Humanize.Parsing.Parse_Phrase_Severity_Label (Severity_Text);
      Tone_Text : constant String :=
        Rendered
          (Humanize.Phrases.Tone_Label (Humanize.Phrases.Critical_Tone),
           "phrase tone label");
      Tone : constant Humanize.Parsing.Phrase_Tone_Parse_Result :=
        Humanize.Parsing.Parse_Phrase_Tone_Label (Tone_Text);
      Domain_Label_Text : constant String :=
        Rendered
          (Humanize.Phrases.Domain_Label (Humanize.Phrases.Sync_Domain),
           "phrase domain label");
      Domain_Label : constant Humanize.Parsing.Phrase_Domain_Parse_Result :=
        Humanize.Parsing.Parse_Phrase_Domain_Label (Domain_Label_Text);
      State_Label_Text : constant String :=
        Rendered
          (Humanize.Phrases.Summary_State_Label
             (Humanize.Phrases.Summary_Running),
           "phrase state label");
      State_Label : constant Humanize.Parsing.Phrase_State_Parse_Result :=
        Humanize.Parsing.Parse_Phrase_State_Label (State_Label_Text);
      Key_Text : constant String :=
        Rendered
          (Humanize.Phrases.CI_Key (Humanize.Phrases.Pipeline_Failed),
           "phrase key");
      Key : constant Humanize.Parsing.Phrase_Key_Parse_Result :=
        Humanize.Parsing.Parse_Phrase_Key (Key_Text);
      Pack_Text : constant String :=
        Rendered (Humanize.Phrases.Phrase_Pack_Summary,
                  "phrase pack summary");
      Pack : constant Humanize.Parsing.Phrase_Pack_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Phrase_Pack_Summary (Pack_Text);
      Locales_Text : constant String :=
        Rendered (Humanize.Phrases.Supported_Phrase_Locales,
                  "supported phrase locales");
      Locales : constant Humanize.Parsing.Phrase_Locales_Parse_Result :=
        Humanize.Parsing.Parse_Supported_Phrase_Locales (Locales_Text);

      Domain_Text : constant String :=
        Rendered
          (Humanize.Phrases.Domain_Summary
             (Support.En, Humanize.Phrases.Job_Domain,
              Humanize.Phrases.Summary_Running, 3, 10, 1,
              "task", "tasks"),
           "domain summary");
      Domain : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Domain_Summary (Domain_Text);
      Queue_Text : constant String :=
        Rendered
          (Humanize.Phrases.Queue_Summary
             (Support.En, 4, 2, 1, 3, "job", "jobs"),
           "queue summary");
      Queue : constant Humanize.Parsing.Queue_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Queue_Summary (Queue_Text);
      Cache_Text : constant String :=
        Rendered
          (Humanize.Phrases.Cache_Summary (Support.En, 8, 2),
           "cache summary");
      Cache : constant Humanize.Parsing.Cache_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Cache_Summary (Cache_Text);
      Sync_Text : constant String :=
        Rendered
          (Humanize.Phrases.Sync_Summary
             (Support.En, 3, 5, 1, "file", "files"),
           "sync summary");
      Sync : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Sync_Summary (Sync_Text);
      Import_Text : constant String :=
        Rendered
          (Humanize.Phrases.Import_Summary
             (Support.En, 2, 4, 0, "row", "rows"),
           "import summary");
      Import : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Import_Summary (Import_Text);
      Export_Text : constant String :=
        Rendered
          (Humanize.Phrases.Export_Summary
             (Support.En, 6, 6, 0, "file", "files"),
           "export summary");
      Export : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Export_Summary (Export_Text);
   begin
      AUnit.Assertions.Assert
        (RGB.Status = Ok and then RGB.Color = Color,
         "RGB formatter/parser roundtrip [" & RGB_Text & "]");
      AUnit.Assertions.Assert
        (RGBA.Status = Ok and then RGBA.Color = Color
         and then RGBA.Has_Opacity,
         "RGBA formatter/parser roundtrip [" & RGBA_Text & "]");
      AUnit.Assertions.Assert
        (Summary.Status = Ok and then Summary.Color = Color,
         "color summary formatter/parser roundtrip [" & Summary_Text & "]");
      AUnit.Assertions.Assert
        (HSL.Status = Ok and then HSL.Exact,
         "HSL formatter/parser roundtrip [" & HSL_Text & "]");
      AUnit.Assertions.Assert
        (HSV.Status = Ok and then HSV.Exact,
         "HSV formatter/parser roundtrip [" & HSV_Text & "]");
      AUnit.Assertions.Assert
        (Description.Status = Ok and then Description.Hue_Length > 0,
         "color description formatter/parser roundtrip ["
         & Description_Text & "]");
      AUnit.Assertions.Assert
        (Palette_Result.Status = Ok and then Palette_Result.Count = 3,
         "palette summary formatter/parser roundtrip [" & Palette_Text & "]");
      AUnit.Assertions.Assert
        (Accessibility.Status = Ok
         and then Accessibility.Contrast_Ratio >= 21.0,
         "color accessibility formatter/parser roundtrip ["
         & Accessibility_Text & "]");
      AUnit.Assertions.Assert
        (Difference.Status = Ok and then Difference.Value > 0.0,
         "color difference formatter/parser roundtrip ["
         & Difference_Text & "]");

      AUnit.Assertions.Assert
        (Filename.Status = Ok and then Filename.Looks_Safe
         and then Filename.Has_Extension,
         "safe filename formatter/parser roundtrip [" & Filename_Text & "]");
      AUnit.Assertions.Assert
        (Basename.Status = Ok and then Basename.Has_Extension,
         "path basename formatter/parser roundtrip [" & Basename_Text & "]");
      AUnit.Assertions.Assert
        (Title.Status = Ok and then Title.Title_Case,
         "path title formatter/parser roundtrip [" & Title_Text & "]");
      AUnit.Assertions.Assert
        (Extension.Status = Ok and then Extension.Uppercase,
         "extension formatter/parser roundtrip [" & Extension_Text & "]");
      AUnit.Assertions.Assert
        (Handle.Status = Ok and then Handle.Looks_Handle,
         "handle formatter/parser roundtrip [" & Handle_Text & "]");
      AUnit.Assertions.Assert
        (Initials.Status = Ok and then Initials.Initial_Count = 2,
         "initials formatter/parser roundtrip [" & Initials_Text & "]");
      AUnit.Assertions.Assert
        (Possessive.Status = Ok and then Possessive.Owner_Length = 3,
         "possessive formatter/parser roundtrip [" & Possessive_Text & "]");
      AUnit.Assertions.Assert
        (Token.Status = Ok and then Token.Group_Count = 3,
         "token formatter/parser roundtrip [" & Token_Text & "]");
      AUnit.Assertions.Assert
        (Mask.Status = Ok and then Mask.Visible_Count = 4,
         "mask formatter/parser roundtrip [" & Mask_Text & "]");
      AUnit.Assertions.Assert
        (Text_Summary.Status = Ok
         and then Text_Summary.Has_Words
         and then Text_Summary.Has_Sentences,
         "text summary formatter/parser roundtrip ["
         & Text_Summary_Text & "]");
      AUnit.Assertions.Assert
        (Parameterized.Status = Ok
         and then Parameterized.Has_Separator
         and then Parameterized.Separator = '-',
         "parameterize formatter/parser roundtrip ["
         & Parameterized_Text & "]");
      AUnit.Assertions.Assert
        (Dasherized.Status = Ok
         and then Dasherized.Has_Separator
         and then Dasherized.Separator = '-',
         "dasherize formatter/parser roundtrip [" & Dasherized_Text & "]");
      AUnit.Assertions.Assert
        (Underscore.Status = Ok
         and then Underscore.Has_Separator
         and then Underscore.Separator = '_',
         "underscore formatter/parser roundtrip [" & Underscore_Text & "]");
      AUnit.Assertions.Assert
        (Camel.Status = Ok and then Camel.Camel_Case,
         "camelize formatter/parser roundtrip [" & Camel_Text & "]");
      AUnit.Assertions.Assert
        (Inflection.Status = Ok
         and then Inflection.Source = Humanize.Strings.Irregular_Inflection,
         "inflection source formatter/parser roundtrip ["
         & Inflection_Text & "]");

      AUnit.Assertions.Assert
        (File_Size.Status = Ok
         and then File_Size.File_Count = 3
         and then File_Size.Total = 1_536,
         "file-size formatter/parser roundtrip [" & File_Size_Text & "]");
      AUnit.Assertions.Assert
        (Transfer.Status = Ok
         and then Transfer.Remaining = 1_536
         and then Transfer.Has_Rate
         and then Transfer.Bytes_Per_Second = 512,
         "transfer formatter/parser roundtrip [" & Transfer_Text & "]");
      AUnit.Assertions.Assert
        (Disk.Status = Ok
         and then Disk.Used = 1_536
         and then Disk.Total = 3_072
         and then Disk.Percent_Used = 50,
         "disk formatter/parser roundtrip [" & Disk_Text & "]");

      AUnit.Assertions.Assert
        (Validation.Status = Ok
         and then Validation.Count = 2
         and then Validation.Severity =
           Humanize.Parsing.Parsed_Validation_Error,
         "validation formatter/parser roundtrip [" & Validation_Text & "]");
      AUnit.Assertions.Assert
        (Field.Status = Ok
         and then Field.Field_Length = 5
         and then Field.Summary.Count = 1,
         "field problem formatter/parser roundtrip [" & Field_Text & "]");
      AUnit.Assertions.Assert
        (Selection.Status = Ok
         and then Selection.Kind = Humanize.Parsing.Selection_Partial
         and then Selection.Selected = 3
         and then Selection.Total = 5,
         "selection formatter/parser roundtrip [" & Selection_Text & "]");
      AUnit.Assertions.Assert
        (More.Status = Ok
         and then More.Visible = 3
         and then More.Remaining = 4,
         "more-count formatter/parser roundtrip [" & More_Text & "]");
      AUnit.Assertions.Assert
        (Pagination.Status = Ok
         and then Pagination.First = 21
         and then Pagination.Last = 40
         and then Pagination.Total = 153,
         "pagination formatter/parser roundtrip [" & Pagination_Text & "]");
      AUnit.Assertions.Assert
        (Collection.Status = Ok
         and then Collection.Visible = 3
         and then Collection.Remaining = 4,
         "collection formatter/parser roundtrip [" & Collection_Text & "]");

      AUnit.Assertions.Assert
        (Severity.Status = Ok
         and then Severity.Severity = Humanize.Phrases.Danger_Severity,
         "phrase severity formatter/parser roundtrip [" & Severity_Text & "]");
      AUnit.Assertions.Assert
        (Tone.Status = Ok
         and then Tone.Tone = Humanize.Phrases.Critical_Tone,
         "phrase tone formatter/parser roundtrip [" & Tone_Text & "]");
      AUnit.Assertions.Assert
        (Domain_Label.Status = Ok
         and then Domain_Label.Domain = Humanize.Phrases.Sync_Domain,
         "phrase domain formatter/parser roundtrip ["
         & Domain_Label_Text & "]");
      AUnit.Assertions.Assert
        (State_Label.Status = Ok
         and then State_Label.State = Humanize.Phrases.Summary_Running,
         "phrase state formatter/parser roundtrip ["
         & State_Label_Text & "]");
      AUnit.Assertions.Assert
        (Key.Status = Ok
         and then Key.Prefix_Length = 2
         and then Key.Name_Length > 0,
         "phrase key formatter/parser roundtrip [" & Key_Text & "]");
      AUnit.Assertions.Assert
        (Pack.Status = Ok
         and then Pack.Pack_Count > 0
         and then Pack.Has_Summaries,
         "phrase pack formatter/parser roundtrip [" & Pack_Text & "]");
      AUnit.Assertions.Assert
        (Locales.Status = Ok
         and then Locales.Locale_Count > 8
         and then Locales.Has_Generated_Locales,
         "phrase locales formatter/parser roundtrip [" & Locales_Text & "]");

      AUnit.Assertions.Assert
        (Domain.Status = Ok
         and then Domain.Completed = 3
         and then Domain.Total = 10
         and then Domain.Failed = 1,
         "domain summary formatter/parser roundtrip [" & Domain_Text & "]");
      AUnit.Assertions.Assert
        (Queue.Status = Ok
         and then Queue.Queued = 4
         and then Queue.Running = 2
         and then Queue.Failed = 1
         and then Queue.Completed = 3,
         "queue summary formatter/parser roundtrip [" & Queue_Text & "]");
      AUnit.Assertions.Assert
        (Cache.Status = Ok
         and then Cache.Hits = 8
         and then Cache.Misses = 2
         and then Cache.Hit_Rate = 80,
         "cache summary formatter/parser roundtrip [" & Cache_Text & "]");
      AUnit.Assertions.Assert
        (Sync.Status = Ok
         and then Sync.Completed = 3
         and then Sync.Total = 5
         and then Sync.Failed = 1,
         "sync summary formatter/parser roundtrip [" & Sync_Text & "]");
      AUnit.Assertions.Assert
        (Import.Status = Ok
         and then Import.Completed = 2
         and then Import.Total = 4,
         "import summary formatter/parser roundtrip [" & Import_Text & "]");
      AUnit.Assertions.Assert
        (Export.Status = Ok
         and then Export.Completed = 6
         and then Export.Total = 6,
         "export summary formatter/parser roundtrip [" & Export_Text & "]");
   end Check_Deterministic_Helper_Roundtrips;
