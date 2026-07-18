with Ada.Calendar;
with Ada.Strings.Unbounded;

with Humanize.Colors;
with Humanize.Colors.CSS;
with Humanize.Strings;
with Humanize.Strings.Core;
with Humanize.Strings.Display;
with Humanize.Strings.Editing;
with Humanize.Strings.Identifiers;
with Humanize.Strings.Inflections;
with Humanize.Strings.Markup;
with Humanize.Strings.Metadata;
with Humanize.Strings.Metrics;
with Humanize.Strings.Names;
with Humanize.Strings.Paths;
with Humanize.Strings.Privacy;
with Humanize.Strings.Prose;
with Humanize.Strings.Terminal;

separate (Perf_Smoke)
   procedure Run_Text_Bucket
     (Started : out Ada.Calendar.Time;
      Stopped : out Ada.Calendar.Time)
   is
      function U (Text : String) return Humanize.Strings.Name_Item
        renames Ada.Strings.Unbounded.To_Unbounded_String;

      Names : constant Humanize.Strings.Name_List :=
        [U ("Ada Lovelace"), U ("Grace Hopper"), U ("Katherine Johnson")];
   begin
      Started := Ada.Calendar.Clock;
      for I in 1 .. Iterations loop
         declare
            Color : Humanize.Colors.CSS_Color;
            Color_Status : constant Humanize.Status.Status_Code :=
              Humanize.Colors.CSS.Parse_CSS_Color ("rgb(12 34 56)", Color);
            Title : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Title_Case_Smart ("api status and url rules");
            Core_Title : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Core.Title_Case_Smart ("api status and url rules");
            Truncated : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Truncate_Words
                ("alpha beta gamma delta epsilon", 3);
            Display_Text : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Display.Truncate_Display_Width
                ("alpha beta gamma delta epsilon", 16);
            Editing_Text : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Editing.Excerpt
                ("release candidate notes mention regression risk", "regression");
            Identifier : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Identifiers.Parameterize
                ("Release Candidate ID");
            Inflection : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Inflections.Pluralize ("release");
            Markup : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Markup.Strip_Tags
                ("<p>release <strong>ready</strong></p>");
            Metadata : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Metadata.Text_Metadata_Label
                ("release notes include parser and string coverage");
            Metrics : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Metrics.Text_Summary
                ("release notes include parser and string coverage.");
            Name_Text : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Names.Display_Name
                ("Ada Lovelace", Handle => "@ada");
            Path_Text : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Paths.Path_Basename
                ("/tmp/releases/humanize.tar.gz");
            Privacy_Text : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Privacy.Safe_Email_Label
                ("release-bot@example.com");
            Prose : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Prose.Prose_List (Names);
            Terminal_Text : constant Humanize.Status.Text_Result :=
              Humanize.Strings.Terminal.Terminal_Paragraph
                ("release notes include parser and string coverage", 32);
            CSS : constant Humanize.Status.Text_Result :=
              Humanize.Colors.CSS.CSS_Color_Label (Color);
         begin
            Check_Status (Color_Status, "css color parse");
            Check_Status (Title.Status, "title-case text");
            Check_Status (Core_Title.Status, "core title-case text");
            Check_Status (Truncated.Status, "truncate words text");
            Check_Status (Display_Text.Status, "display-width text");
            Check_Status (Editing_Text.Status, "editing text");
            Check_Status (Identifier.Status, "identifier text");
            Check_Status (Inflection.Status, "inflection text");
            Check_Status (Markup.Status, "markup text");
            Check_Status (Metadata.Status, "metadata text");
            Check_Status (Metrics.Status, "metrics text");
            Check_Status (Name_Text.Status, "name text");
            Check_Status (Path_Text.Status, "path text");
            Check_Status (Privacy_Text.Status, "privacy text");
            Check_Status (Prose.Status, "prose text");
            Check_Status (Terminal_Text.Status, "terminal text");
            Check_Status (CSS.Status, "css color label");
            Total := Total + I mod 5;
         end;
      end loop;
      Stopped := Ada.Calendar.Clock;
   end Run_Text_Bucket;
