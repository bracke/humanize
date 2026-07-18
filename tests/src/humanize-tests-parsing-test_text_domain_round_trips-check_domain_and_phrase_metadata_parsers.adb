separate (Humanize.Tests.Parsing.Test_Text_Domain_Round_Trips)
   procedure Check_Domain_And_Phrase_Metadata_Parsers is
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
   begin
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
   end Check_Domain_And_Phrase_Metadata_Parsers;
