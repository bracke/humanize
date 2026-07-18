separate (Humanize.Tests.Architecture)
   procedure Test_Capability_Metadata
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Summary : constant Humanize.Status.Text_Result :=
        Humanize.Capabilities.Capability_Summary;
      Source : constant Humanize.Status.Text_Result :=
        Humanize.Capabilities.Rendering_Source_Label
          (Humanize.Capabilities.Area_Rendering_Source
             (Humanize.Capabilities.Phrase_Area));
      Behavior : constant Humanize.Status.Text_Result :=
        Humanize.Capabilities.Locale_Behavior_Label
          (Humanize.Capabilities.Area_Locale_Behavior
             (Humanize.Capabilities.Number_Area));
      Behavior_Summary : constant Humanize.Status.Text_Result :=
        Humanize.Capabilities.Locale_Behavior_Summary;
      Account_Features : constant Humanize.Capabilities.Feature_Support :=
        Humanize.Capabilities.Area_Features
          (Humanize.Capabilities.Account_Area);
      Domain_Features : constant Humanize.Capabilities.Feature_Support :=
        Humanize.Capabilities.Area_Features
          (Humanize.Capabilities.Domain_Detail_Area);
      Feature_Label : constant Humanize.Status.Text_Result :=
        Humanize.Capabilities.Feature_Support_Label (Domain_Features);
      Coverage : constant Humanize.Capabilities.Capability_Coverage :=
        Humanize.Capabilities.Capability_Coverage_For_All;
      Coverage_Label : constant Humanize.Status.Text_Result :=
        Humanize.Capabilities.Capability_Matrix_Summary;
      Buffer : String (1 .. 48);
      Written : Natural;
      Bounded_Status : Humanize.Status.Status_Code;
   begin
      AUnit.Assertions.Assert
        (Summary.Status = Humanize.Status.Ok
         and then Support.Text (Summary)
           = "datetimes durations bytes colors numbers strings values endpoints resources "
             & "versions geo markup secrets schema diagnostics thresholds workflows "
             & "changes tables forms navigation badges notifications search "
             & "comments tasks attachments events payments system-status "
             & "operations comparisons moderation accounts deployments data-quality "
             & "media notification-preferences permissions builds domain-details "
             & "lists frequencies "
             & "rates units phrases parsing metadata",
         "capability summary metadata");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Number_Area) = Humanize.Locale_Rendered,
         "number area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Color_Area)
            = Humanize.Deterministic_Text,
         "color area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Value_Area)
            = Humanize.Deterministic_Text,
         "value area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Endpoint_Area)
            = Humanize.Deterministic_Text,
         "endpoint area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Resource_Area)
            = Humanize.Deterministic_Text,
         "resource area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Version_Area)
            = Humanize.Deterministic_Text,
         "version area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Geo_Area)
            = Humanize.Deterministic_Text,
         "geo area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Markup_Area)
            = Humanize.Deterministic_Text,
         "markup area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Secret_Area)
            = Humanize.Deterministic_Text,
         "secret area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Schema_Area)
            = Humanize.Deterministic_Text,
         "schema area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Diagnostic_Area)
            = Humanize.Deterministic_Text,
         "diagnostic area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Threshold_Area)
            = Humanize.Deterministic_Text,
         "threshold area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Workflow_Area)
            = Humanize.Deterministic_Text,
         "workflow area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Change_Area)
            = Humanize.Deterministic_Text,
         "change area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Table_Area)
            = Humanize.Deterministic_Text,
         "table area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Form_Area)
            = Humanize.Deterministic_Text,
         "form area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Navigation_Area)
            = Humanize.Deterministic_Text,
         "navigation area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Badge_Area)
            = Humanize.Deterministic_Text,
         "badge area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Notification_Area)
            = Humanize.Deterministic_Text,
         "notification area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Search_Area)
            = Humanize.Deterministic_Text,
         "search area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Comment_Area)
            = Humanize.Deterministic_Text,
         "comment area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Task_Area)
            = Humanize.Deterministic_Text,
         "task area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Attachment_Area)
            = Humanize.Deterministic_Text,
         "attachment area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Event_Area)
            = Humanize.Deterministic_Text,
         "event area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Payment_Area)
            = Humanize.Deterministic_Text,
         "payment area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.System_Status_Area)
            = Humanize.Deterministic_Text,
         "system status area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Operation_Area)
            = Humanize.Deterministic_Text,
         "operation area rendering source");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Rendering_Source
           (Humanize.Capabilities.Domain_Detail_Area)
            = Humanize.Deterministic_Text,
         "domain detail area rendering source");
      AUnit.Assertions.Assert
        (Source.Status = Humanize.Status.Ok
         and then Support.Text (Source) = "deterministic-text",
         "rendering source label");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Unit_Area)
            = Humanize.Capabilities.Catalog_Localized,
         "unit area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Phrase_Area)
            = Humanize.Capabilities.Deterministic_Locale_Aware,
         "phrase area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Parsing_Area)
            = Humanize.Capabilities.Deterministic_English,
         "parsing area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Value_Area)
            = Humanize.Capabilities.Deterministic_English,
         "value area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Endpoint_Area)
            = Humanize.Capabilities.Deterministic_English,
         "endpoint area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Resource_Area)
            = Humanize.Capabilities.Deterministic_English,
         "resource area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Version_Area)
            = Humanize.Capabilities.Deterministic_English,
         "version area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Geo_Area)
            = Humanize.Capabilities.Deterministic_English,
         "geo area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Markup_Area)
            = Humanize.Capabilities.Deterministic_English,
         "markup area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Secret_Area)
            = Humanize.Capabilities.Deterministic_English,
         "secret area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Schema_Area)
            = Humanize.Capabilities.Deterministic_English,
         "schema area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Diagnostic_Area)
            = Humanize.Capabilities.Deterministic_English,
         "diagnostic area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Threshold_Area)
            = Humanize.Capabilities.Deterministic_English,
         "threshold area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Workflow_Area)
            = Humanize.Capabilities.Deterministic_English,
         "workflow area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Change_Area)
            = Humanize.Capabilities.Deterministic_English,
         "change area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Table_Area)
            = Humanize.Capabilities.Deterministic_English,
         "table area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Form_Area)
            = Humanize.Capabilities.Deterministic_English,
         "form area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Navigation_Area)
            = Humanize.Capabilities.Deterministic_English,
         "navigation area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Badge_Area)
            = Humanize.Capabilities.Deterministic_English,
         "badge area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Notification_Area)
            = Humanize.Capabilities.Deterministic_English,
         "notification area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Search_Area)
            = Humanize.Capabilities.Deterministic_English,
         "search area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Comment_Area)
            = Humanize.Capabilities.Deterministic_English,
         "comment area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Task_Area)
            = Humanize.Capabilities.Deterministic_English,
         "task area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Attachment_Area)
            = Humanize.Capabilities.Deterministic_English,
         "attachment area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Event_Area)
            = Humanize.Capabilities.Deterministic_English,
         "event area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Payment_Area)
            = Humanize.Capabilities.Deterministic_English,
         "payment area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.System_Status_Area)
            = Humanize.Capabilities.Deterministic_English,
         "system status area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Operation_Area)
            = Humanize.Capabilities.Deterministic_English,
         "operation area locale behavior");
      AUnit.Assertions.Assert
        (Humanize.Capabilities.Area_Locale_Behavior
           (Humanize.Capabilities.Domain_Detail_Area)
            = Humanize.Capabilities.Deterministic_English,
         "domain detail area locale behavior");
      AUnit.Assertions.Assert
        (Behavior.Status = Humanize.Status.Ok
         and then Support.Text (Behavior) = "mixed-localized-deterministic",
         "number area mixed locale behavior label");
      AUnit.Assertions.Assert
        (Behavior_Summary.Status = Humanize.Status.Ok
         and then Support.Text (Behavior_Summary)
           = "catalog-localized deterministic-locale-aware deterministic-english mixed-localized-deterministic",
         "locale behavior summary metadata");
      AUnit.Assertions.Assert
        (Account_Features.Has_Bounded_Api
         and then Account_Features.Has_Options
         and then Account_Features.Has_Parse
         and then Account_Features.Has_Scan
         and then Account_Features.Has_Metadata
         and then Account_Features.Has_Accessible_Mode
         and then not Account_Features.Has_Cross_Domain
         and then Account_Features.Has_Privacy_Policy,
         "account feature support metadata");
      AUnit.Assertions.Assert
        (Domain_Features.Has_Narrative
         and then Domain_Features.Has_Label_Parts
         and then Domain_Features.Has_Diff
         and then Domain_Features.Has_Validation
         and then Domain_Features.Has_Stability,
         "domain detail composition feature metadata");
      AUnit.Assertions.Assert
        (Feature_Label.Status = Humanize.Status.Ok
         and then Support.Text (Feature_Label)
           = "bounded options parse scan metadata accessible cross-domain "
             & "privacy narrative label-parts diff validation stability",
         "domain detail feature support label");
      AUnit.Assertions.Assert
        (Coverage.Areas = 48
         and then Coverage.Bounded = 47
         and then Coverage.Parse >= 35
         and then Coverage.Scan >= 35
         and then Coverage.Metadata >= 45,
         "capability coverage counts");
      AUnit.Assertions.Assert
        (Coverage_Label.Status = Humanize.Status.Ok
         and then Support.Text (Coverage_Label)'Length > 40
         and then Support.Text (Coverage_Label)
           (Support.Text (Coverage_Label)'First
            .. Support.Text (Coverage_Label)'First + 19)
           = "capability coverage:",
         "capability matrix summary label");
      Humanize.Capabilities.Capability_Matrix_Summary_Into
        (Buffer, Written, Bounded_Status);
      AUnit.Assertions.Assert
        (Bounded_Status = Humanize.Status.Buffer_Overflow
         and then Written = Buffer'Length
         and then Buffer = "capability coverage: 48 areas, 47 bounded, 38 pa",
         "bounded capability matrix summary");

      declare
         procedure Check_Area
           (Area     : Humanize.Capabilities.Capability_Area;
            Bounded  : Boolean;
            Parse    : Boolean;
            Scan     : Boolean;
            Metadata : Boolean)
         is
            Features : constant Humanize.Capabilities.Feature_Support :=
              Humanize.Capabilities.Area_Features (Area);
         begin
            AUnit.Assertions.Assert
              (Features.Has_Bounded_Api = Bounded
               and then Features.Has_Parse = Parse
               and then Features.Has_Scan = Scan
               and then Features.Has_Metadata = Metadata,
               "capability feature drift for "
               & Humanize.Capabilities.Capability_Area'Image (Area));
         end Check_Area;
      begin
         Check_Area
           (Humanize.Capabilities.Datetime_Area, True, False, False, True);
         Check_Area
           (Humanize.Capabilities.Bytes_Area, True, False, False, True);
         Check_Area
           (Humanize.Capabilities.Color_Area, True, True, False, True);
         Check_Area
           (Humanize.Capabilities.Value_Area, True, False, False, True);
         Check_Area
           (Humanize.Capabilities.Endpoint_Area, True, True, True, True);
         Check_Area
           (Humanize.Capabilities.Account_Area, True, True, True, True);
         Check_Area
           (Humanize.Capabilities.Metadata_Area, False, False, False, True);

         for Area in Humanize.Capabilities.Capability_Area loop
            declare
               Features : constant Humanize.Capabilities.Feature_Support :=
                 Humanize.Capabilities.Area_Features (Area);
            begin
               AUnit.Assertions.Assert
                 ((not Features.Has_Scan) or else Features.Has_Parse,
                  "scan support requires parse support for "
                  & Humanize.Capabilities.Capability_Area'Image (Area));
            end;
         end loop;
      end;
   end Test_Capability_Metadata;
