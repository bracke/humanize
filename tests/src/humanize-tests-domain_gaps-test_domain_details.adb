separate (Humanize.Tests.Domain_Gaps)
   procedure Test_Domain_Details
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      use Humanize.Domain_Details;

      Metadata : constant Domain_Label_Metadata :=
        (Surface    => Deployments_Surface,
         Severity   => Warning_Severity,
         Tone       => Caution_Tone,
         Final      => False,
         Actionable => True);
      Detailed : constant Text_Result :=
        Domain_Label
          ("release 1.2 deployed to production",
           Metadata,
           (Mode             => Detailed_Output,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => True));
      Accessible : constant Text_Result :=
        Accessible_Label
          ("MFA enabled, image 1920x1080, 3/10 complete",
           (Surface    => Accounts_Surface,
            Severity   => Success_Severity,
            Tone       => Positive_Tone,
            Final      => True,
            Actionable => False));
      Cross : constant Text_Result :=
        Cross_Domain_Summary
          ("release 1.2 deployed",
           "2 release gates failed",
           Metadata);
      Three : constant Text_Result :=
        Three_Part_Summary
          ("Ada suspended account",
           "MFA reset required",
           "3 active sessions",
           (Surface    => Accounts_Surface,
            Severity   => Danger_Severity,
            Tone       => Critical_Tone,
            Final      => False,
            Actionable => True));
      Parsed : constant Domain_Label_Parse_Result :=
        Parse_Domain_Label
          ("[deployments warning caution] release 1.2 deployed");
      State_Meta : constant Domain_Label_Metadata :=
        State_Metadata (Builds_Surface, "release gate failed");
      Deployment_Build : constant Text_Result :=
        Deployment_Build_Summary
          ("release 1.2 deployed",
           "build passed",
           "release gate failed",
           (Mode             => Detailed_Output,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Account_Permission : constant Text_Result :=
        Account_Permission_Summary
          ("Ada suspended account",
           "Ada deploy requires approval",
           "3 active sessions");
      Operation_Status : constant Text_Result :=
        Operation_Status_Summary
          ("sync running: 8 of 10 items complete",
           "API HTTP 503 service unavailable");
      Data_Import : constant Text_Result :=
        Data_Import_Summary
          ("2 duplicate records",
           "customers.csv partial import: 98 accepted, 2 rejected");
      Rich_Accessible : constant Text_Result :=
        Accessible_Label
          ("CI API PDF SQLSTATE ETA SLA xfail xpass",
           (Surface    => Builds_Surface,
            Severity   => Info_Severity,
            Tone       => Plain_Tone,
            Final      => False,
            Actionable => False));
      Log_Field : constant Log_Field_Parse_Result :=
        Parse_Log_Field ("state=running");
      Scanned_Log_Field : constant Log_Field_Parse_Result :=
        Scan_Log_Field ("completed=8 total=10");
      Narrative : constant Text_Result :=
        Narrative_Summary
          ("deployment", "finished", "failed",
           "rollback available", Metadata);
      Event : constant Text_Result :=
        Event_Summary
          ("deployment", "failed", "Ada", "after 3 minutes", Metadata);
      Parts : constant Text_Result :=
        Label_Parts_Summary
          ([Make_Label_Part (Primary_Part, "3"),
            Make_Label_Part (Unit_Part, "files"),
            Make_Label_Part (Qualifier_Part, "remaining")]);
      Diff : constant Text_Result :=
        Diff_Summary ("title", Changed_Diff, "Draft", "Published");
      Text_Diff : constant Text_Result :=
        Text_Diff_Summary (Lines_Added => 3, Lines_Removed => 1,
                           Words_Changed => 2);
      Profile : constant Text_Result :=
        Output_Profile_Label
          ((Mode => Detailed_Output, Include_Metadata => True,
            Accessible => False, Log_Safe => True, Compact => False,
            Terminal_Width => 80));
      Aggregate : constant Text_Result :=
        Aggregate_Summary ("job", 12, Success => 9, Warning => 2,
                           Failure => 1);
      Top_Item : constant Text_Result :=
        Top_Item_Summary ("issue", "missing label", 4);
      Combined : constant Text_Result :=
        Combined_Metadata_Label
          (Metadata,
           (Surface => Diagnostics_Surface, Severity => Danger_Severity,
            Tone => Critical_Tone, Final => True, Actionable => False));
      Validation : constant Text_Result :=
        Validation_Report_Label
          ("profile form", Errors => 2, Warnings => 1, Missing => 3,
           Hint => "review required fields");
      Stability : constant Text_Result :=
        Stability_Metadata_Label
          ((Round_Trippable => True, Lossless => True, Approximate => False,
            Locale_Dependent => False, Privacy_Safe => True,
            Stable_For_Logs => True, Bounded_Available => True));
      Example : constant Example_Case :=
        Example_Case_For
          (Deployments_Surface, "deploy-fail", "status=failed",
           "deployment failed",
           (Round_Trippable => True, Lossless => True, Approximate => False,
            Locale_Dependent => False, Privacy_Safe => True,
            Stable_For_Logs => True, Bounded_Available => True));
      Buffer  : String (1 .. 18);
      Written : Natural;
      Code    : Status_Code;
   begin
      Check (Surface_Label (Deployments_Surface), "deployments", "surface label");
      Check (Output_Mode_Label (Accessible_Output), "accessible", "mode label");
      Check (Severity_Label (Danger_Severity), "danger", "severity label");
      Check (Tone_Label (Critical_Tone), "critical", "tone label");
      Check
        (Detailed,
         "[deployments warning caution] release 1.2 deployed to production",
         "domain label with metadata");
      Check
        (Accessible,
         "multi-factor authentication enabled, image 1920 by 1080, 3 of 10 complete",
         "accessible domain label");
      Check
        (Cross,
         "release 1.2 deployed, 2 release gates failed",
         "cross domain summary");
      Check
        (Three,
         "Ada suspended account, MFA reset required, 3 active sessions",
         "three part summary");
      AUnit.Assertions.Assert
        (Parsed.Status = Ok
         and then Parsed.Has_Surface
         and then Parsed.Surface = Deployments_Surface
         and then Parsed.Has_Severity
         and then Parsed.Severity = Warning_Severity
         and then Parsed.Has_Tone
         and then Parsed.Tone = Caution_Tone,
         "parse domain metadata");
      AUnit.Assertions.Assert
        (Parsed.Body_Length = 20,
         "parse domain body length");
      AUnit.Assertions.Assert
        (Log_Field.Status = Ok
         and then Log_Field.Key_Length = 5
         and then Log_Field.Value_Length = 7
         and then Log_Field.Consumed = 13,
         "parse log field");
      AUnit.Assertions.Assert
        (Scanned_Log_Field.Status = Ok
         and then Scanned_Log_Field.Key_Length = 9
         and then Scanned_Log_Field.Value_Length = 1
         and then Scanned_Log_Field.Consumed = 11,
         "scan log field");
      AUnit.Assertions.Assert
        (State_Meta.Severity = Danger_Severity
         and then State_Meta.Tone = Critical_Tone
         and then State_Meta.Actionable,
         "state metadata infers danger");
      Check
        (Deployment_Build,
         "[deployments danger] release 1.2 deployed, build passed, release gate failed",
         "deployment build summary");
      Check
        (Account_Permission,
         "Ada suspended account, Ada deploy requires approval, 3 active sessions",
         "account permission summary");
      Check
        (Operation_Status,
         "sync running: 8 of 10 items complete, API HTTP 503 service unavailable",
         "operation status summary");
      Check
        (Data_Import,
         "2 duplicate records, customers.csv partial import: 98 accepted, 2 rejected",
         "data import summary");
      Check
        (Rich_Accessible,
         "continuous integration A P I P D F S Q L state "
         & "estimated time of arrival service level agreement "
         & "expected failure unexpected pass",
         "rich accessible abbreviations");
      Check
        (Metadata_Summary_Label (Metadata),
         "metadata surface=deployments severity=warning tone=caution not final actionable",
         "metadata summary label");
      Check
        (Narrative,
         "deployment finished: failed; rollback available",
         "narrative summary");
      Check
        (Event,
         "deployment completed with: failed; by Ada, after 3 minutes",
         "event summary");
      Check
        (Parts,
         "parts: primary=3 unit=files qualifier=remaining -> 3 files remaining",
         "label parts summary");
      Check
        (Diff,
         "title changed from Draft to Published",
         "diff summary");
      Check
        (Text_Diff,
         "3 lines added, 1 line removed, 2 words changed",
         "text diff summary");
      Check
        (Profile,
         "profile mode=log metadata=yes log-safe=yes width=80",
         "output profile label");
      Check
        (Aggregate,
         "12 jobs: 9 succeeded, 2 warnings, 1 failed",
         "aggregate summary");
      Check
        (Top_Item,
         "top issue: missing label (4)",
         "top item summary");
      Check
        (Combined,
         "metadata surface=deployments severity=danger tone=critical not final actionable",
         "combined metadata label");
      Check
        (Validation,
         "profile form validation: 2 errors, 1 warning, "
         & "3 missing required items; review required fields",
         "validation report label");
      Check
        (Stability,
         "stability round-trip=yes lossless=yes approximate=no "
         & "locale-dependent=no privacy-safe=yes log-stable=yes bounded=yes",
         "stability metadata label");
      Check
        (Example_Case_Label (Example),
         "example deployments.deploy-fail: input=status=failed "
         & "expected=deployment failed",
         "example case label");
      declare
         Parsed_Narrative : constant Composition_Label_Parse_Result :=
           Parse_Narrative_Summary
             ("deployment finished: failed; rollback available");
         Scanned_Narrative : constant Composition_Label_Parse_Result :=
           Scan_Narrative_Summary
             ("deployment finished: failed; rollback available"
              & ASCII.LF & "next");
         Parsed_Event : constant Composition_Label_Parse_Result :=
           Parse_Event_Summary
             ("deployment completed with: failed; by Ada, after 3 minutes");
         Parsed_Diff : constant Diff_Label_Parse_Result :=
           Parse_Diff_Summary ("title changed from Draft to Published");
         Parsed_Text_Diff : constant Count_Label_Parse_Result :=
           Parse_Text_Diff_Summary
             ("3 lines added, 1 line removed, 2 words changed");
         Parsed_Aggregate : constant Count_Label_Parse_Result :=
           Parse_Aggregate_Summary
             ("12 jobs: 9 succeeded, 2 warnings, 1 failed");
         Parsed_Validation : constant Count_Label_Parse_Result :=
           Parse_Validation_Report_Label
             ("profile form validation: 2 errors, 1 warning, "
              & "3 missing required items; review required fields");
         Parsed_Singular_Validation : constant Count_Label_Parse_Result :=
           Parse_Validation_Report_Label
             ("field validation: 1 error, 0 warnings, "
              & "0 missing required items");
         Parsed_Valid_Validation : constant Count_Label_Parse_Result :=
           Parse_Validation_Report_Label ("field valid");
         Parsed_Stability : constant Stability_Label_Parse_Result :=
           Parse_Stability_Metadata_Label
             ("stability round-trip=yes lossless=yes approximate=no "
              & "locale-dependent=no privacy-safe=yes log-stable=yes bounded=yes");
         Parsed_Example : constant Example_Case_Parse_Result :=
           Parse_Example_Case_Label
             ("example deployments.deploy-fail: input=status=failed "
              & "expected=deployment failed");
      begin
         AUnit.Assertions.Assert
           (Parsed_Narrative.Status = Ok
            and then Parsed_Narrative.Subject_Length = 10
            and then Parsed_Narrative.Action_Length = 8
            and then Parsed_Narrative.Result_Length = 6
            and then Parsed_Narrative.Detail_Length = 18,
            "parse narrative summary");
         AUnit.Assertions.Assert
           (Scanned_Narrative.Status = Ok
            and then Scanned_Narrative.Consumed = 47,
            "scan narrative summary");
         AUnit.Assertions.Assert
           (Parsed_Event.Status = Ok
            and then Parsed_Event.Action_Length = 14
            and then Parsed_Event.Detail_Length = 23,
            "parse event summary");
         AUnit.Assertions.Assert
           (Parsed_Diff.Status = Ok
            and then Parsed_Diff.Kind = Changed_Diff
            and then Parsed_Diff.Field_Length = 5
            and then Parsed_Diff.Old_Value_Length = 5
            and then Parsed_Diff.New_Value_Length = 9,
            "parse diff summary");
         AUnit.Assertions.Assert
           (Parsed_Text_Diff.Status = Ok
            and then Parsed_Text_Diff.Lines_Added = 3
            and then Parsed_Text_Diff.Lines_Removed = 1
            and then Parsed_Text_Diff.Words_Changed = 2,
            "parse text diff summary");
         AUnit.Assertions.Assert
           (Parsed_Aggregate.Status = Ok
            and then Parsed_Aggregate.Total = 12
            and then Parsed_Aggregate.Success = 9
            and then Parsed_Aggregate.Warning = 2
            and then Parsed_Aggregate.Failure = 1,
            "parse aggregate summary");
         AUnit.Assertions.Assert
           (Parsed_Validation.Status = Ok
            and then Parsed_Validation.Subject_Length = 12
            and then Parsed_Validation.Failure = 2
            and then Parsed_Validation.Warning = 1
            and then Parsed_Validation.Total = 3,
            "parse validation report label");
         AUnit.Assertions.Assert
           (Parsed_Singular_Validation.Status = Ok
            and then Parsed_Singular_Validation.Subject_Length = 5
            and then Parsed_Singular_Validation.Failure = 1
            and then Parsed_Singular_Validation.Warning = 0
            and then Parsed_Singular_Validation.Total = 0,
            "parse singular validation report label");
         AUnit.Assertions.Assert
           (Parsed_Valid_Validation.Status = Ok
            and then Parsed_Valid_Validation.Subject_Length = 5
            and then Parsed_Valid_Validation.Failure = 0
            and then Parsed_Valid_Validation.Warning = 0
            and then Parsed_Valid_Validation.Total = 0,
            "parse valid validation report label");
         AUnit.Assertions.Assert
           (Parsed_Stability.Status = Ok
            and then Parsed_Stability.Metadata.Round_Trippable
            and then Parsed_Stability.Metadata.Lossless
            and then not Parsed_Stability.Metadata.Approximate
            and then Parsed_Stability.Metadata.Bounded_Available,
            "parse stability metadata label");
         AUnit.Assertions.Assert
           (Parsed_Example.Status = Ok
            and then Parsed_Example.Area = Deployments_Surface
            and then Parsed_Example.Name_Length = 11
            and then Parsed_Example.Input_Length = 13
            and then Parsed_Example.Expected_Length = 17,
            "parse example case label");
      end;
      declare
         Narrative_Input : Narrative_Summary_Input;
         Diff_Input : Diff_Summary_Input;
         Aggregate_Input : Aggregate_Summary_Input;
         Validation_Input : Validation_Report_Input;
      begin
         Narrative_Input.Subject (1 .. 10) := "deployment";
         Narrative_Input.Subject_Length := 10;
         Narrative_Input.Action (1 .. 8) := "finished";
         Narrative_Input.Action_Length := 8;
         Narrative_Input.Result (1 .. 6) := "failed";
         Narrative_Input.Result_Length := 6;
         Narrative_Input.Detail (1 .. 18) := "rollback available";
         Narrative_Input.Detail_Length := 18;
         Check
           (Narrative_Summary (Narrative_Input),
            "deployment finished: failed; rollback available",
            "structured narrative summary");

         Diff_Input.Field_Name (1 .. 5) := "title";
         Diff_Input.Field_Length := 5;
         Diff_Input.Kind := Redacted_Diff;
         Diff_Input.Redacted := True;
         Check
           (Diff_Summary (Diff_Input),
            "title changed; values redacted",
            "structured redacted diff summary");

         Aggregate_Input.Subject (1 .. 3) := "job";
         Aggregate_Input.Subject_Length := 3;
         Aggregate_Input.Total := 12;
         Aggregate_Input.Success := 9;
         Aggregate_Input.Warning := 2;
         Aggregate_Input.Failure := 1;
         Check
           (Aggregate_Summary (Aggregate_Input),
            "12 jobs: 9 succeeded, 2 warnings, 1 failed",
            "structured aggregate summary");

         Validation_Input.Subject (1 .. 12) := "profile form";
         Validation_Input.Subject_Length := 12;
         Validation_Input.Errors := 2;
         Validation_Input.Warnings := 1;
         Validation_Input.Missing := 3;
         Validation_Input.Hint (1 .. 22) := "review required fields";
         Validation_Input.Hint_Length := 22;
         Check
           (Validation_Report_Label (Validation_Input),
            "profile form validation: 2 errors, 1 warning, "
            & "3 missing required items; review required fields",
            "structured validation report");
      end;
      Check
        (Privacy_Aware_Label_Parts_Summary
           ([Make_Label_Part (Primary_Part, "token"),
             Make_Label_Part (Safe_Value_Part, "abcd1234")],
            Redact_All => True),
         "parts: primary=token safe-value=redacted -> token redacted",
         "privacy-aware label parts");
      Check
        (Aggregate_Metadata_Label
           ([(Surface => Deployments_Surface, Severity => Warning_Severity,
              Tone => Caution_Tone, Final => False, Actionable => True),
             (Surface => Diagnostics_Surface, Severity => Danger_Severity,
              Tone => Critical_Tone, Final => True, Actionable => False)]),
         "metadata surface=deployments severity=danger tone=critical not final actionable",
         "aggregate metadata label");
      Check
        (Remediation_Summary_Label
           ("fix required fields", "retry submission", Count => 3),
         "fix 3 findings: fix required fields, then retry submission",
         "remediation summary label");
      Check
        (Composition_Diagnostic_Label
           ("Narrative_Summary", "subject", "must not be empty"),
         "Narrative_Summary subject: must not be empty",
         "composition diagnostic label");
      Check
        (Example_Case_Label (Example_Case_For_Area (Forms_Surface)),
         "example forms.forms-basic: input=status=ok expected=forms ok",
         "example case for area");
      declare
         Parsed_Metadata : constant Domain_Label_Parse_Result :=
           Parse_Metadata_Summary_Label
             ("metadata surface=deployments severity=warning tone=caution not final actionable");
         Scanned_Metadata : constant Domain_Label_Parse_Result :=
           Scan_Metadata_Summary_Label
             ("metadata surface=deployments severity=warning tone=caution not final actionable"
              & ASCII.LF & "next");
      begin
         AUnit.Assertions.Assert
           (Parsed_Metadata.Status = Ok
            and then Parsed_Metadata.Has_Surface
            and then Parsed_Metadata.Surface = Deployments_Surface
            and then Parsed_Metadata.Has_Severity
            and then Parsed_Metadata.Severity = Warning_Severity
            and then Parsed_Metadata.Has_Tone
            and then Parsed_Metadata.Tone = Caution_Tone,
            "parse metadata summary label");
         AUnit.Assertions.Assert
           (Scanned_Metadata.Status = Ok
            and then Scanned_Metadata.Consumed = 79,
            "scan metadata summary label");
      end;
      Domain_Label_Into
        ("release 1.2 deployed to production",
         Metadata, Buffer, Written, Code,
         (Mode             => Detailed_Output,
          Include_Surface  => True,
          Include_Severity => False,
          Include_Tone     => False));
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "[deployments] rele",
         "bounded domain label overflow");
      Metadata_Summary_Label_Into (Metadata, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "metadata surface=d",
         "bounded metadata summary overflow");
      Narrative_Summary_Into
        ("deployment", "finished", "failed", Buffer, Written, Code,
         Detail => "rollback available");
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "deployment finishe",
         "bounded narrative summary overflow");
      Validation_Report_Label_Into
        ("profile form", Buffer, Written, Code, Errors => 2, Missing => 1);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "profile form valid",
         "bounded validation report overflow");
      Event_Summary_Into
        ("deployment", "failed", Buffer, Written, Code,
         Actor_Label => "Ada", Time_Label => "after 3 minutes");
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "deployment complet",
         "bounded event summary overflow");
      Label_Parts_Summary_Into
        ([Make_Label_Part (Primary_Part, "3"),
          Make_Label_Part (Unit_Part, "files")],
         Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "parts: primary=3 u",
         "bounded label parts overflow");
      Diff_Summary_Into
        ("title", Changed_Diff, Buffer, Written, Code,
         Old_Value => "Draft", New_Value => "Published");
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "title changed from",
         "bounded diff summary overflow");
      Text_Diff_Summary_Into
        (Buffer, Written, Code, Lines_Added => 3, Lines_Removed => 1);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "3 lines added, 1 l",
         "bounded text diff summary overflow");
      Output_Profile_Label_Into
        ((Mode => Detailed_Output, Include_Metadata => True,
          Accessible => False, Log_Safe => True, Compact => False,
          Terminal_Width => 80),
         Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "profile mode=log m",
         "bounded output profile overflow");
      Aggregate_Summary_Into
        ("job", 12, Buffer, Written, Code, Success => 9, Warning => 2,
         Failure => 1);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "12 jobs: 9 succeed",
         "bounded aggregate summary overflow");
      Top_Item_Summary_Into
        ("issue", "missing label", 4, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "top issue: missing",
         "bounded top item summary overflow");
      Combined_Metadata_Label_Into
        (Metadata,
         (Surface => Diagnostics_Surface, Severity => Danger_Severity,
          Tone => Critical_Tone, Final => True, Actionable => False),
         Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "metadata surface=d",
         "bounded combined metadata overflow");
      Stability_Metadata_Label_Into
        ((Round_Trippable => True, Lossless => True, Approximate => False,
          Locale_Dependent => False, Privacy_Safe => True,
          Stable_For_Logs => True, Bounded_Available => True),
         Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "stability round-tr",
         "bounded stability metadata overflow");
      Example_Case_Label_Into (Example, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 18
         and then Buffer = "example deployment",
         "bounded example case overflow");
      AUnit.Assertions.Assert
        (Domain_Label ("", Metadata).Status = Invalid_Argument,
         "empty domain label invalid");
   end Test_Domain_Details;
