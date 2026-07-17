with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.Domain_Details.Support is
   use type Humanize.Status.Status_Code;

   function Clean (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function Image (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Count_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
      renames Humanize.Bounded_Text.Count_Text;

   function Starts_With (Text, Prefix : String) return Boolean
      renames Humanize.Bounded_Text.Starts_With;

   function Is_Digit (Char : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;

   procedure Set_Bounded
     (Target : out String;
      Length : out Natural;
      Text   : String)
   is
      Copy_Length : constant Natural := Natural'Min (Target'Length, Text'Length);
   begin
      Target := [others => ' '];
      if Copy_Length > 0 then
         Target (Target'First .. Target'First + Copy_Length - 1) :=
           Text (Text'First .. Text'First + Copy_Length - 1);
      end if;
      Length := Copy_Length;
   end Set_Bounded;

   function Bounded_Text (Text : String; Length : Natural) return String is
   begin
      if Length = 0 then
         return "";
      else
         return Text (Text'First .. Text'First + Length - 1);
      end if;
   end Bounded_Text;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text
     (Result : Humanize.Status.Text_Result)
      return String
      renames Humanize.Bounded_Text.Result_Text;

   function Invalid_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Invalid_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Make_Label_Options
     (Mode             : Output_Mode;
      Include_Surface  : Boolean;
      Include_Severity : Boolean;
      Include_Tone     : Boolean)
      return Domain_Label_Options
   is
   begin
      return
        (Mode             => Mode,
         Include_Surface  => Include_Surface,
         Include_Severity => Include_Severity,
         Include_Tone     => Include_Tone);
   end Make_Label_Options;

   function Surface_Text (Surface : Domain_Surface) return String is
   begin
      case Surface is
         when Operations_Surface               => return "operations";
         when Comparisons_Surface              => return "comparisons";
         when Moderation_Surface               => return "moderation";
         when Accounts_Surface                 => return "accounts";
         when Deployments_Surface              => return "deployments";
         when Data_Quality_Surface             => return "data-quality";
         when Media_Surface                    => return "media";
         when Notification_Preferences_Surface => return "notification-preferences";
         when Permissions_Surface              => return "permissions";
         when Builds_Surface                   => return "builds";
         when Values_Surface                   => return "values";
         when Endpoints_Surface                => return "endpoints";
         when Resources_Surface                => return "resources";
         when Versions_Surface                 => return "versions";
         when Geo_Surface                      => return "geo";
         when Markup_Surface                   => return "markup";
         when Secrets_Surface                  => return "secrets";
         when Schema_Surface                   => return "schema";
         when Diagnostics_Surface              => return "diagnostics";
         when Thresholds_Surface               => return "thresholds";
         when Workflows_Surface                => return "workflows";
         when Changes_Surface                  => return "changes";
         when Tables_Surface                   => return "tables";
         when Forms_Surface                    => return "forms";
         when Navigation_Surface               => return "navigation";
         when Badges_Surface                   => return "badges";
         when Notifications_Surface            => return "notifications";
         when Search_Surface                   => return "search";
         when Comments_Surface                 => return "comments";
         when Tasks_Surface                    => return "tasks";
         when Attachments_Surface              => return "attachments";
         when Events_Surface                   => return "events";
         when Payments_Surface                 => return "payments";
         when System_Status_Surface            => return "system-status";
      end case;
   end Surface_Text;

   function Severity_Text (Severity : Domain_Severity) return String is
   begin
      case Severity is
         when Neutral_Severity => return "neutral";
         when Info_Severity    => return "info";
         when Success_Severity => return "success";
         when Warning_Severity => return "warning";
         when Danger_Severity  => return "danger";
      end case;
   end Severity_Text;

   function Tone_Text (Tone : Domain_Tone) return String is
   begin
      case Tone is
         when Plain_Tone    => return "plain";
         when Positive_Tone => return "positive";
         when Caution_Tone  => return "caution";
         when Critical_Tone => return "critical";
         when Muted_Tone    => return "muted";
      end case;
   end Tone_Text;

   function Surface_Label
     (Surface : Domain_Surface)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Surface_Text (Surface));
   end Surface_Label;

   function Output_Mode_Label
     (Mode : Output_Mode)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (case Mode is
            when Compact_Output    => "compact",
            when Detailed_Output   => "detailed",
            when Accessible_Output => "accessible",
            when Log_Output        => "log");
   end Output_Mode_Label;

   function Severity_Label
     (Severity : Domain_Severity)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Severity_Text (Severity));
   end Severity_Label;

   function Tone_Label
     (Tone : Domain_Tone)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Tone_Text (Tone));
   end Tone_Label;

   function Surface_Default_Severity
     (Surface : Domain_Surface)
      return Domain_Severity
   is
   begin
      case Surface is
         when Operations_Surface | Comparisons_Surface | Moderation_Surface
            | Accounts_Surface | Deployments_Surface | Data_Quality_Surface
            | Permissions_Surface | Builds_Surface | Endpoints_Surface
            | Resources_Surface | Versions_Surface | Geo_Surface
            | Markup_Surface | Secrets_Surface | Schema_Surface
            | Diagnostics_Surface | Thresholds_Surface | Workflows_Surface
            | Changes_Surface | Tables_Surface | Forms_Surface
            | Navigation_Surface | Badges_Surface | Notifications_Surface
            | Search_Surface | Comments_Surface | Tasks_Surface
            | Attachments_Surface | Events_Surface | Payments_Surface
            | System_Status_Surface =>
            return Info_Severity;
         when Media_Surface | Notification_Preferences_Surface | Values_Surface =>
            return Neutral_Severity;
      end case;
   end Surface_Default_Severity;

   function Surface_Default_Tone
     (Surface : Domain_Surface)
      return Domain_Tone
   is
   begin
      case Surface is
         when Operations_Surface | Comparisons_Surface | Deployments_Surface
            | Builds_Surface | Resources_Surface | Diagnostics_Surface
            | Thresholds_Surface | Workflows_Surface | Changes_Surface
            | System_Status_Surface =>
            return Caution_Tone;
         when Moderation_Surface | Accounts_Surface | Data_Quality_Surface
            | Permissions_Surface | Secrets_Surface | Schema_Surface
            | Forms_Surface | Navigation_Surface | Notifications_Surface
            | Search_Surface | Comments_Surface | Tasks_Surface
            | Attachments_Surface | Events_Surface | Payments_Surface =>
            return Plain_Tone;
         when Media_Surface | Notification_Preferences_Surface | Values_Surface
            | Endpoints_Surface | Versions_Surface | Geo_Surface
            | Markup_Surface | Tables_Surface | Badges_Surface =>
            return Muted_Tone;
      end case;
   end Surface_Default_Tone;

   function Contains (Text, Needle : String) return Boolean
      renames Humanize.Bounded_Text.Contains_Text;

   function State_Metadata
     (Surface     : Domain_Surface;
      State_Label : String)
      return Domain_Label_Metadata
      is separate;

   function Prefix
     (Metadata : Domain_Label_Metadata;
      Options  : Domain_Label_Options)
      return String
   is
      Result : Unbounded_String;

      procedure Add (Text : String) is
      begin
         if Length (Result) > 0 then
            Append (Result, " ");
         end if;
         Append (Result, Text);
      end Add;
   begin
      if Options.Include_Surface then
         Add (Surface_Text (Metadata.Surface));
      end if;
      if Options.Include_Severity then
         Add (Severity_Text (Metadata.Severity));
      end if;
      if Options.Include_Tone then
         Add (Tone_Text (Metadata.Tone));
      end if;
      if Length (Result) = 0 then
         return "";
      else
         return "[" & To_String (Result) & "] ";
      end if;
   end Prefix;

   function Normalize_Accessible (Text : String) return String is
      Result : Unbounded_String;
      Index  : Natural := Text'First;
   begin
      while Index <= Text'Last loop
         if Index + 2 <= Text'Last and then Text (Index .. Index + 2) = "MFA" then
            Append (Result, "multi-factor authentication");
            Index := Index + 3;
         elsif Index + 1 <= Text'Last and then Text (Index .. Index + 1) = "CI" then
            Append (Result, "continuous integration");
            Index := Index + 2;
         elsif Index + 2 <= Text'Last and then Text (Index .. Index + 2) = "API" then
            Append (Result, "A P I");
            Index := Index + 3;
         elsif Index + 2 <= Text'Last and then Text (Index .. Index + 2) = "PDF" then
            Append (Result, "P D F");
            Index := Index + 3;
         elsif Index + 7 <= Text'Last
           and then Text (Index .. Index + 7) = "SQLSTATE"
         then
            Append (Result, "S Q L state");
            Index := Index + 8;
         elsif Index + 2 <= Text'Last and then Text (Index .. Index + 2) = "ETA" then
            Append (Result, "estimated time of arrival");
            Index := Index + 3;
         elsif Index + 2 <= Text'Last and then Text (Index .. Index + 2) = "SLA" then
            Append (Result, "service level agreement");
            Index := Index + 3;
         elsif Index + 4 <= Text'Last and then Text (Index .. Index + 4) = "xfail" then
            Append (Result, "expected failure");
            Index := Index + 5;
         elsif Index + 4 <= Text'Last and then Text (Index .. Index + 4) = "xpass" then
            Append (Result, "unexpected pass");
            Index := Index + 5;
         elsif Text (Index) = '/' then
            Append (Result, " of ");
            Index := Index + 1;
         elsif Text (Index) = 'x'
           and then Index > Text'First
           and then Index < Text'Last
           and then Is_Digit (Text (Index - 1))
           and then Is_Digit (Text (Index + 1))
         then
            Append (Result, " by ");
            Index := Index + 1;
         else
            Append (Result, Text (Index));
            Index := Index + 1;
         end if;
      end loop;
      return To_String (Result);
   end Normalize_Accessible;

   function Domain_Label
     (Text     : String;
      Metadata : Domain_Label_Metadata;
      Options  : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Text);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid domain label");
      end if;

      case Options.Mode is
         when Compact_Output | Detailed_Output | Log_Output =>
            return Ok_Text (Prefix (Metadata, Options) & Label);
         when Accessible_Output =>
            return Ok_Text (Prefix (Metadata, Options) & Normalize_Accessible (Label));
      end case;
   end Domain_Label;

   function Domain_Label
     (Base     : Humanize.Status.Text_Result;
      Metadata : Domain_Label_Metadata;
      Options  : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
   is
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      else
         return Domain_Label
           (Humanize.Bounded_Text.Result_Text (Base), Metadata, Options);
      end if;
   end Domain_Label;

   function Domain_Render
     (Text     : String;
      Metadata : Domain_Label_Metadata;
      Options  : Domain_Label_Options := Default_Domain_Label_Options)
      return Domain_Render_Result
   is
      Label : constant Humanize.Status.Text_Result :=
        Domain_Label (Text, Metadata, Options);
   begin
      return
        (Status   => Label.Status,
         Text     => Label,
         Metadata => Metadata);
   end Domain_Render;

   function Match_Surface (Text : String; Surface : out Domain_Surface)
      return Boolean;
   function Match_Severity (Text : String; Severity : out Domain_Severity)
      return Boolean;
   function Match_Tone (Text : String; Tone : out Domain_Tone) return Boolean;

   function Metadata_Summary_Label
     (Metadata : Domain_Label_Metadata)
      return Humanize.Status.Text_Result
   is
      Final_Text : constant String :=
        (if Metadata.Final then "final" else "not final");
      Action_Text : constant String :=
        (if Metadata.Actionable then "actionable" else "not actionable");
   begin
      return Ok_Text ("metadata surface="
         & Result_Text
             (Surface_Label (Metadata.Surface))
         & " severity="
         & Result_Text
             (Severity_Label (Metadata.Severity))
         & " tone="
         & Result_Text (Tone_Label (Metadata.Tone))
         & " " & Final_Text & " " & Action_Text);
   end Metadata_Summary_Label;

   function Find_Text (Text, Pattern : String) return Natural
      renames Humanize.Bounded_Text.Index_Text;

   function Digit_Value (Char : Character) return Natural
      renames Humanize.Bounded_Text.Digit_Value;

   function Token_After (Text, Prefix : String) return String is
      Pos : constant Natural := Find_Text (Text, Prefix);
      First : Natural;
      Last  : Natural;
   begin
      if Pos = 0 then
         return "";
      end if;
      First := Pos + Prefix'Length;
      Last := First;
      while Last <= Text'Last and then Text (Last) /= ' ' loop
         Last := Last + 1;
      end loop;
      return Text (First .. Last - 1);
   end Token_After;

   function Parse_Metadata_Summary_Label
     (Text : String)
      return Domain_Label_Parse_Result
   is
      Item : constant String := Clean (Text);
      Result : Domain_Label_Parse_Result;
      Surface : Domain_Surface;
      Severity : Domain_Severity;
      Tone : Domain_Tone;
   begin
      if not Starts_With (Item, "metadata ") then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      end if;

      if Match_Surface (Token_After (Item, "surface="), Surface) then
         Result.Surface := Surface;
         Result.Has_Surface := True;
      end if;
      if Match_Severity (Token_After (Item, "severity="), Severity) then
         Result.Severity := Severity;
         Result.Has_Severity := True;
      end if;
      if Match_Tone (Token_After (Item, "tone="), Tone) then
         Result.Tone := Tone;
         Result.Has_Tone := True;
      end if;
      Result.Consumed := Item'Length;
      Result.Body_First := Item'First;
      Result.Body_Length := Item'Length;
      return Result;
   end Parse_Metadata_Summary_Label;

   function Scan_Metadata_Summary_Label
     (Text : String)
      return Domain_Label_Parse_Result
   is
      Last : Natural := Text'Last;
   begin
      for Index in Text'Range loop
         if Text (Index) = ASCII.LF then
            Last := Index - 1;
            exit;
         end if;
      end loop;
      if Text'Length = 0 or else Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      return Parse_Metadata_Summary_Label (Text (Text'First .. Last));
   end Scan_Metadata_Summary_Label;

   function Accessible_Label
     (Text     : String;
      Metadata : Domain_Label_Metadata)
      return Humanize.Status.Text_Result
   is
   begin
      return Domain_Label
        (Text, Metadata,
         (Mode             => Accessible_Output,
          Include_Surface  => False,
          Include_Severity => False,
          Include_Tone     => False));
   end Accessible_Label;

   function Cross_Domain_Summary
     (Primary_Label   : String;
      Secondary_Label : String;
      Metadata        : Domain_Label_Metadata;
      Options         : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
   is
      First  : constant String := Clean (Primary_Label);
      Second : constant String := Clean (Secondary_Label);
   begin
      if First'Length = 0 then
         return Invalid_Text ("invalid primary label");
      elsif Second'Length = 0 then
         return Invalid_Text ("invalid secondary label");
      else
         return Domain_Label (First & ", " & Second, Metadata, Options);
      end if;
   end Cross_Domain_Summary;

   function Three_Part_Summary
     (First_Label  : String;
      Second_Label : String;
      Third_Label  : String;
      Metadata     : Domain_Label_Metadata;
      Options      : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
   is
      First  : constant String := Clean (First_Label);
      Second : constant String := Clean (Second_Label);
      Third  : constant String := Clean (Third_Label);
   begin
      if First'Length = 0 then
         return Invalid_Text ("invalid first label");
      elsif Second'Length = 0 then
         return Invalid_Text ("invalid second label");
      elsif Third'Length = 0 then
         return Invalid_Text ("invalid third label");
      else
         return Domain_Label
           (First & ", " & Second & ", " & Third, Metadata, Options);
      end if;
   end Three_Part_Summary;

   function Deployment_Build_Summary
     (Deployment_Label : String;
      Build_Label      : String;
      Gate_Label       : String;
      Options          : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Three_Part_Summary
        (Deployment_Label,
         Build_Label,
         Gate_Label,
         State_Metadata (Deployments_Surface, Deployment_Label & " " & Gate_Label),
         Options);
   end Deployment_Build_Summary;

   function Account_Permission_Summary
     (Account_Label    : String;
      Permission_Label : String;
      Session_Label    : String;
      Options          : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Three_Part_Summary
        (Account_Label,
         Permission_Label,
         Session_Label,
         State_Metadata (Accounts_Surface, Account_Label & " " & Permission_Label),
         Options);
   end Account_Permission_Summary;

   function Media_Attachment_Summary
     (Media_Label      : String;
      Attachment_Label : String;
      Options          : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Cross_Domain_Summary
        (Media_Label,
         Attachment_Label,
         State_Metadata (Media_Surface, Media_Label & " " & Attachment_Label),
         Options);
   end Media_Attachment_Summary;

   function Operation_Status_Summary
     (Operation_Label : String;
      Status_Label    : String;
      Options         : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Cross_Domain_Summary
        (Operation_Label,
         Status_Label,
         State_Metadata (Operations_Surface, Operation_Label & " " & Status_Label),
         Options);
   end Operation_Status_Summary;

   function Data_Import_Summary
     (Quality_Label : String;
      Import_Label  : String;
      Options       : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Cross_Domain_Summary
        (Quality_Label,
         Import_Label,
         State_Metadata (Data_Quality_Surface, Quality_Label & " " & Import_Label),
         Options);
   end Data_Import_Summary;

   function Moderation_Event_Summary
     (Review_Label : String;
      Report_Label : String;
      Options      : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Cross_Domain_Summary
        (Review_Label,
         Report_Label,
         State_Metadata (Moderation_Surface, Review_Label & " " & Report_Label),
         Options);
   end Moderation_Event_Summary;

   function Payment_Event_Summary
     (Payment_Label : String;
      Invoice_Label : String;
      Options       : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Cross_Domain_Summary
        (Payment_Label,
         Invoice_Label,
         State_Metadata (Payments_Surface, Payment_Label & " " & Invoice_Label),
         Options);
   end Payment_Event_Summary;

   function Task_Event_Summary
     (Task_Label      : String;
      Checklist_Label : String;
      Options         : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Cross_Domain_Summary
        (Task_Label,
         Checklist_Label,
         State_Metadata (Tasks_Surface, Task_Label & " " & Checklist_Label),
         Options);
   end Task_Event_Summary;

   function Narrative_Summary
     (Subject  : String;
      Action   : String;
      Result   : String;
      Detail   : String := "";
      Metadata : Domain_Label_Metadata := (others => <>);
      Options  : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
   is
      S : constant String := Clean (Subject);
      A : constant String := Clean (Action);
      R : constant String := Clean (Result);
      D : constant String := Clean (Detail);
   begin
      if S'Length = 0 then
         return Invalid_Text ("invalid narrative subject");
      elsif A'Length = 0 then
         return Invalid_Text ("invalid narrative action");
      elsif R'Length = 0 then
         return Invalid_Text ("invalid narrative result");
      elsif D'Length = 0 then
         return Domain_Label (S & " " & A & ": " & R, Metadata, Options);
      else
         return Domain_Label (S & " " & A & ": " & R & "; " & D,
                              Metadata, Options);
      end if;
   end Narrative_Summary;

   function Event_Summary
     (Event_Label  : String;
      Status_Label : String;
      Actor_Label  : String := "";
      Time_Label   : String := "";
      Metadata     : Domain_Label_Metadata := (others => <>);
      Options      : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
   is
      Event  : constant String := Clean (Event_Label);
      Status : constant String := Clean (Status_Label);
      Actor  : constant String := Clean (Actor_Label);
      Time   : constant String := Clean (Time_Label);
      Detail : Unbounded_String;
   begin
      if Event'Length = 0 then
         return Invalid_Text ("invalid event label");
      elsif Status'Length = 0 then
         return Invalid_Text ("invalid event status");
      end if;

      if Actor'Length > 0 then
         Detail := To_Unbounded_String ("by " & Actor);
      end if;
      if Time'Length > 0 then
         if Length (Detail) > 0 then
            Append (Detail, ", ");
         end if;
         Append (Detail, Time);
      end if;

      return Narrative_Summary
        (Event, "completed with", Status, To_String (Detail),
         Metadata, Options);
   end Event_Summary;

   function Narrative_Summary
     (Input   : Narrative_Summary_Input;
      Options : Domain_Label_Options := Default_Domain_Label_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Narrative_Summary
        (Bounded_Text (Input.Subject, Input.Subject_Length),
         Bounded_Text (Input.Action, Input.Action_Length),
         Bounded_Text (Input.Result, Input.Result_Length),
         Bounded_Text (Input.Detail, Input.Detail_Length),
         Input.Metadata,
         Options);
   end Narrative_Summary;

   function Make_Label_Part
     (Kind : Label_Part_Kind;
      Text : String)
      return Label_Part
   is
      Result : Label_Part;
   begin
      Result.Kind := Kind;
      Set_Bounded (Result.Text, Result.Text_Length, Clean (Text));
      return Result;
   end Make_Label_Part;

   function Label_Part_Kind_Text (Kind : Label_Part_Kind) return String is
   begin
      case Kind is
         when Primary_Part   => return "primary";
         when Qualifier_Part => return "qualifier";
         when Count_Part     => return "count";
         when Unit_Part      => return "unit";
         when Severity_Part  => return "severity";
         when Safe_Value_Part => return "safe-value";
         when Action_Part    => return "action";
         when Metadata_Part  => return "metadata";
      end case;
   end Label_Part_Kind_Text;

   function Label_Part_Kind_Label
     (Kind : Label_Part_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Label_Part_Kind_Text (Kind));
   end Label_Part_Kind_Label;

   function Label_Parts_Summary
     (Parts : Label_Part_List)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      Text   : Unbounded_String;
   begin
      if Parts'Length = 0 then
         return Invalid_Text ("invalid label parts");
      end if;

      for Index in Parts'Range loop
         if Parts (Index).Text_Length = 0 then
            return Invalid_Text ("invalid label part");
         end if;
         if Length (Result) > 0 then
            Append (Result, " ");
            Append (Text, " ");
         end if;
         Append (Result, Label_Part_Kind_Text (Parts (Index).Kind));
         Append (Result, "=");
         Append
           (Result,
            Bounded_Text (Parts (Index).Text, Parts (Index).Text_Length));
         Append
           (Text,
            Bounded_Text (Parts (Index).Text, Parts (Index).Text_Length));
      end loop;

      return Ok_Text ("parts: " & To_String (Result) & " -> " & To_String (Text));
   end Label_Parts_Summary;

   function Privacy_Aware_Label_Parts_Summary
     (Parts      : Label_Part_List;
      Redact_All : Boolean := False)
      return Humanize.Status.Text_Result
   is
      Safe : Label_Part_List (Parts'Range);
   begin
      for Index in Parts'Range loop
         Safe (Index) := Parts (Index);
         if Redact_All and then Safe (Index).Kind = Safe_Value_Part then
            Set_Bounded (Safe (Index).Text, Safe (Index).Text_Length,
                         "redacted");
         end if;
      end loop;
      return Label_Parts_Summary (Safe);
   end Privacy_Aware_Label_Parts_Summary;

   function Diff_Kind_Text (Kind : Diff_Kind) return String is
   begin
      case Kind is
         when No_Diff       => return "unchanged";
         when Added_Diff    => return "added";
         when Removed_Diff  => return "removed";
         when Changed_Diff  => return "changed";
         when Renamed_Diff  => return "renamed";
         when Moved_Diff    => return "moved";
         when Redacted_Diff => return "redacted";
      end case;
   end Diff_Kind_Text;

   function Diff_Summary
     (Field_Name : String;
      Kind       : Diff_Kind;
      Old_Value  : String := "";
      New_Value  : String := "";
      Redacted   : Boolean := False)
      return Humanize.Status.Text_Result
   is
      Field : constant String := Clean (Field_Name);
      Old   : constant String := Clean (Old_Value);
      Newv  : constant String := Clean (New_Value);
   begin
      if Field'Length = 0 then
         return Invalid_Text ("invalid diff field");
      elsif Redacted or else Kind = Redacted_Diff then
         return Ok_Text (Field & " changed; values redacted");
      end if;

      case Kind is
         when No_Diff =>
            return Ok_Text (Field & " unchanged");
         when Added_Diff =>
            if Newv'Length = 0 then
               return Ok_Text (Field & " added");
            else
               return Ok_Text (Field & " added as " & Newv);
            end if;
         when Removed_Diff =>
            if Old'Length = 0 then
               return Ok_Text (Field & " removed");
            else
               return Ok_Text (Field & " removed from " & Old);
            end if;
         when Changed_Diff | Renamed_Diff | Moved_Diff =>
            if Old'Length = 0 or else Newv'Length = 0 then
               return Ok_Text (Field & " " & Diff_Kind_Text (Kind));
            else
               return Ok_Text (Field & " " & Diff_Kind_Text (Kind)
                  & " from " & Old & " to " & Newv);
            end if;
         when Redacted_Diff =>
            return Ok_Text (Field & " changed; values redacted");
      end case;
   end Diff_Summary;

   function Diff_Summary
     (Input : Diff_Summary_Input)
      return Humanize.Status.Text_Result
   is
   begin
      return Diff_Summary
        (Bounded_Text (Input.Field_Name, Input.Field_Length),
         Input.Kind,
         Bounded_Text (Input.Old_Value, Input.Old_Length),
         Bounded_Text (Input.New_Value, Input.New_Length),
         Input.Redacted);
   end Diff_Summary;

   function Text_Diff_Summary
     (Lines_Added   : Natural := 0;
      Lines_Removed : Natural := 0;
      Words_Changed : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
   begin
      if Lines_Added = 0 and then Lines_Removed = 0 and then Words_Changed = 0 then
         return Ok_Text ("no text changes");
      end if;
      if Lines_Added > 0 then
         Append (Result, Count_Text (Lines_Added, "line added", "lines added"));
      end if;
      if Lines_Removed > 0 then
         if Length (Result) > 0 then
            Append (Result, ", ");
         end if;
         Append
           (Result,
            Count_Text (Lines_Removed, "line removed", "lines removed"));
      end if;
      if Words_Changed > 0 then
         if Length (Result) > 0 then
            Append (Result, ", ");
         end if;
         Append
           (Result,
            Count_Text (Words_Changed, "word changed", "words changed"));
      end if;
      return Ok_Text (To_String (Result));
   end Text_Diff_Summary;

   function Profile_Options
     (Profile : Output_Profile)
      return Domain_Label_Options
   is
   begin
      return
        (Mode             =>
           (if Profile.Accessible then Accessible_Output
            elsif Profile.Log_Safe then Log_Output
            elsif Profile.Compact then Compact_Output
            else Profile.Mode),
         Include_Surface  => Profile.Include_Metadata,
         Include_Severity => Profile.Include_Metadata,
         Include_Tone     => Profile.Include_Metadata);
   end Profile_Options;

   function Output_Profile_Label
     (Profile : Output_Profile)
      return Humanize.Status.Text_Result
   is
      Options : constant Domain_Label_Options := Profile_Options (Profile);
   begin
      return Ok_Text ("profile mode=" &
         (case Options.Mode is
             when Compact_Output    => "compact",
             when Detailed_Output   => "detailed",
             when Accessible_Output => "accessible",
             when Log_Output        => "log")
         & " metadata=" & (if Profile.Include_Metadata then "yes" else "no")
         & " log-safe=" & (if Profile.Log_Safe then "yes" else "no")
         & " width=" & Image (Profile.Terminal_Width));
   end Output_Profile_Label;

   function Aggregate_Summary
     (Subject : String;
      Total   : Natural;
      Success : Natural := 0;
      Warning : Natural := 0;
      Failure : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Name : constant String := Clean (Subject);
      Summary : Unbounded_String;
   begin
      if Name'Length = 0 then
         return Invalid_Text ("invalid aggregate subject");
      end if;
      Append (Summary, Count_Text (Total, Name, Name & "s"));
      if Success > 0 then
         Append (Summary, ": " & Count_Text (Success, "succeeded", "succeeded"));
      end if;
      if Warning > 0 then
         Append (Summary, (if Success > 0 then ", " else ": "));
         Append (Summary, Count_Text (Warning, "warning", "warnings"));
      end if;
      if Failure > 0 then
         Append (Summary,
                 (if Success > 0 or else Warning > 0 then ", " else ": "));
         Append (Summary, Count_Text (Failure, "failed", "failed"));
      end if;
      return Ok_Text (To_String (Summary));
   end Aggregate_Summary;

   function Aggregate_Summary
     (Input : Aggregate_Summary_Input)
      return Humanize.Status.Text_Result
   is
   begin
      return Aggregate_Summary
        (Bounded_Text (Input.Subject, Input.Subject_Length),
         Input.Total, Input.Success, Input.Warning, Input.Failure);
   end Aggregate_Summary;

   function Top_Item_Summary
     (Subject : String;
      Item    : String;
      Count   : Natural)
      return Humanize.Status.Text_Result
   is
      S : constant String := Clean (Subject);
      I : constant String := Clean (Item);
   begin
      if S'Length = 0 then
         return Invalid_Text ("invalid top-item subject");
      elsif I'Length = 0 then
         return Invalid_Text ("invalid top item");
      else
         return Ok_Text ("top " & S & ": " & I & " (" & Image (Count) & ")");
      end if;
   end Top_Item_Summary;

   function Severity_Rank (Severity : Domain_Severity) return Natural is
   begin
      case Severity is
         when Neutral_Severity => return 0;
         when Info_Severity    => return 1;
         when Success_Severity => return 2;
         when Warning_Severity => return 3;
         when Danger_Severity  => return 4;
      end case;
   end Severity_Rank;

   function Higher_Severity
     (Left  : Domain_Severity;
      Right : Domain_Severity)
      return Domain_Severity
   is
   begin
      if Severity_Rank (Right) > Severity_Rank (Left) then
         return Right;
      else
         return Left;
      end if;
   end Higher_Severity;

   function Combine_Metadata
     (Primary   : Domain_Label_Metadata;
      Secondary : Domain_Label_Metadata)
      return Domain_Label_Metadata
   is
      Severity : constant Domain_Severity :=
        Higher_Severity (Primary.Severity, Secondary.Severity);
      Tone : constant Domain_Tone :=
        (if Primary.Tone = Critical_Tone or else Secondary.Tone = Critical_Tone then
            Critical_Tone
         elsif Primary.Tone = Caution_Tone or else Secondary.Tone = Caution_Tone then
            Caution_Tone
         elsif Primary.Tone = Positive_Tone or else Secondary.Tone = Positive_Tone then
            Positive_Tone
         elsif Primary.Tone = Muted_Tone and then Secondary.Tone = Muted_Tone then
            Muted_Tone
         else Plain_Tone);
   begin
      return
        (Surface    => Primary.Surface,
         Severity   => Severity,
         Tone       => Tone,
         Final      => Primary.Final and then Secondary.Final,
         Actionable => Primary.Actionable or else Secondary.Actionable);
   end Combine_Metadata;

   function Combined_Metadata_Label
     (Primary   : Domain_Label_Metadata;
      Secondary : Domain_Label_Metadata)
      return Humanize.Status.Text_Result
   is
   begin
      return Metadata_Summary_Label (Combine_Metadata (Primary, Secondary));
   end Combined_Metadata_Label;

   function Aggregate_Metadata
     (Items : Metadata_List)
      return Domain_Label_Metadata
   is
      Result : Domain_Label_Metadata := (others => <>);
   begin
      if Items'Length = 0 then
         return Result;
      end if;
      Result := Items (Items'First);
      for Index in Items'First + 1 .. Items'Last loop
         Result := Combine_Metadata (Result, Items (Index));
      end loop;
      return Result;
   end Aggregate_Metadata;

   function Aggregate_Metadata_Label
     (Items : Metadata_List)
      return Humanize.Status.Text_Result
   is
   begin
      return Metadata_Summary_Label (Aggregate_Metadata (Items));
   end Aggregate_Metadata_Label;

   function Validation_Report_Label
     (Subject  : String;
      Errors   : Natural := 0;
      Warnings : Natural := 0;
      Missing  : Natural := 0;
      Hint     : String := "")
      return Humanize.Status.Text_Result
   is
      Name : constant String := Clean (Subject);
      H    : constant String := Clean (Hint);
      Summary : Unbounded_String;
   begin
      if Name'Length = 0 then
         return Invalid_Text ("invalid validation subject");
      elsif Errors = 0 and then Warnings = 0 and then Missing = 0 then
         return Ok_Text (Name & " valid");
      end if;

      Append (Summary, Name & " validation: ");
      Append (Summary, Count_Text (Errors, "error", "errors"));
      Append (Summary, ", ");
      Append (Summary, Count_Text (Warnings, "warning", "warnings"));
      Append (Summary, ", ");
      Append (Summary, Count_Text (Missing, "missing required item",
                                   "missing required items"));
      if H'Length > 0 then
         Append (Summary, "; " & H);
      end if;
      return Ok_Text (To_String (Summary));
   end Validation_Report_Label;

   function Validation_Report_Label
     (Input : Validation_Report_Input)
      return Humanize.Status.Text_Result
   is
   begin
      return Validation_Report_Label
        (Bounded_Text (Input.Subject, Input.Subject_Length),
         Input.Errors,
         Input.Warnings,
         Input.Missing,
         Bounded_Text (Input.Hint, Input.Hint_Length));
   end Validation_Report_Label;

   function Remediation_Summary_Label
     (Primary_Action : String;
      Secondary_Action : String := "";
      Count : Natural := 1)
      return Humanize.Status.Text_Result
   is
      First : constant String := Clean (Primary_Action);
      Second : constant String := Clean (Secondary_Action);
   begin
      if First'Length = 0 then
         return Invalid_Text ("invalid remediation action");
      elsif Second'Length = 0 then
         return Ok_Text ("fix " & Count_Text (Count, "finding", "findings")
                    & ": " & First);
      else
         return Ok_Text ("fix " & Count_Text (Count, "finding", "findings")
                    & ": " & First & ", then " & Second);
      end if;
   end Remediation_Summary_Label;

   function Composition_Diagnostic_Label
     (API_Name : String;
      Field_Name : String;
      Problem : String)
      return Humanize.Status.Text_Result
   is
      API : constant String := Clean (API_Name);
      Field : constant String := Clean (Field_Name);
      Issue : constant String := Clean (Problem);
   begin
      if API'Length = 0 or else Field'Length = 0 or else Issue'Length = 0 then
         return Invalid_Text ("invalid composition diagnostic");
      else
         return Ok_Text (API & " " & Field & ": " & Issue);
      end if;
   end Composition_Diagnostic_Label;

   function Label_Family_Stability
     (Area : Domain_Surface;
      Round_Trippable : Boolean := False;
      Bounded_Available : Boolean := True)
      return Label_Stability_Metadata
   is
   begin
      return
        (Round_Trippable   => Round_Trippable,
         Lossless          => Round_Trippable,
         Approximate       => False,
         Locale_Dependent  => False,
         Privacy_Safe      => Area /= Secrets_Surface,
         Stable_For_Logs   => Area /= Secrets_Surface,
         Bounded_Available => Bounded_Available);
   end Label_Family_Stability;

   function Stability_Metadata_Label
     (Metadata : Label_Stability_Metadata)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text ("stability round-trip=" &
         (if Metadata.Round_Trippable then "yes" else "no")
         & " lossless=" & (if Metadata.Lossless then "yes" else "no")
         & " approximate=" & (if Metadata.Approximate then "yes" else "no")
         & " locale-dependent=" &
         (if Metadata.Locale_Dependent then "yes" else "no")
         & " privacy-safe=" & (if Metadata.Privacy_Safe then "yes" else "no")
         & " log-stable=" & (if Metadata.Stable_For_Logs then "yes" else "no")
         & " bounded=" & (if Metadata.Bounded_Available then "yes" else "no"));
   end Stability_Metadata_Label;

   function Example_Case_For
     (Area      : Domain_Surface;
      Name      : String;
      Input     : String;
      Expected  : String;
      Stability : Label_Stability_Metadata := (others => <>))
      return Example_Case
   is
      Result : Example_Case;
   begin
      Result.Area := Area;
      Result.Stability := Stability;
      Set_Bounded (Result.Name, Result.Name_Length, Clean (Name));
      Set_Bounded (Result.Input, Result.Input_Length, Clean (Input));
      Set_Bounded (Result.Expected, Result.Expected_Length, Clean (Expected));
      return Result;
   end Example_Case_For;

   function Example_Case_Label
     (Example : Example_Case)
      return Humanize.Status.Text_Result
   is
   begin
      if Example.Name_Length = 0 then
         return Invalid_Text ("invalid example case");
      end if;
      return Ok_Text ("example " & Surface_Text (Example.Area) & "."
         & Bounded_Text (Example.Name, Example.Name_Length)
         & ": input="
         & Bounded_Text (Example.Input, Example.Input_Length)
         & " expected="
         & Bounded_Text (Example.Expected, Example.Expected_Length));
   end Example_Case_Label;

   function Example_Case_For_Area
     (Area : Domain_Surface)
      return Example_Case
   is
   begin
      return Example_Case_For
        (Area,
         Surface_Text (Area) & "-basic",
         "status=ok",
         Surface_Text (Area) & " ok",
         Label_Family_Stability
           (Area, Round_Trippable => True, Bounded_Available => True));
   end Example_Case_For_Area;

   function Match_Surface (Text : String; Surface : out Domain_Surface)
      return Boolean
   is
   begin
      for Candidate in Domain_Surface loop
         if Text = Surface_Text (Candidate) then
            Surface := Candidate;
            return True;
         end if;
      end loop;
      return False;
   end Match_Surface;

   function Match_Severity (Text : String; Severity : out Domain_Severity)
      return Boolean
   is
   begin
      for Candidate in Domain_Severity loop
         if Text = Severity_Text (Candidate) then
            Severity := Candidate;
            return True;
         end if;
      end loop;
      return False;
   end Match_Severity;

   function Match_Tone (Text : String; Tone : out Domain_Tone) return Boolean is
   begin
      for Candidate in Domain_Tone loop
         if Text = Tone_Text (Candidate) then
            Tone := Candidate;
            return True;
         end if;
      end loop;
      return False;
   end Match_Tone;

   function Line_Text (Text : String) return String is
      Last : Natural := Text'Last;
   begin
      for Index in Text'Range loop
         if Text (Index) = ASCII.LF then
            Last := Index - 1;
            exit;
         end if;
      end loop;
      if Text'Length = 0 or else Last < Text'First then
         return "";
      else
         return Text (Text'First .. Last);
      end if;
   end Line_Text;

   function Natural_After (Text, Prefix : String) return Natural is
      Pos : constant Natural :=
        (if Prefix'Length = 0 then Text'First else Find_Text (Text, Prefix));
      Index : Natural;
      Value : Natural := 0;
   begin
      if Pos = 0 then
         return 0;
      end if;
      Index := (if Prefix'Length = 0 then Pos else Pos + Prefix'Length);
      while Index <= Text'Last and then Is_Digit (Text (Index)) loop
         Value := Value * 10 + Digit_Value (Text (Index));
         Index := Index + 1;
      end loop;
      return Value;
   end Natural_After;

   function Natural_After_Either
     (Text, First_Prefix, Second_Prefix : String)
      return Natural
   is
      First : constant Natural := Natural_After (Text, First_Prefix);
   begin
      if First /= 0 then
         return First;
      else
         return Natural_After (Text, Second_Prefix);
      end if;
   end Natural_After_Either;

   function Parse_Narrative_Summary
     (Text : String)
      return Composition_Label_Parse_Result
   is
      Item : constant String := Clean (Text);
      Colon : constant Natural := Find_Text (Item, ": ");
      Detail : constant Natural := Find_Text (Item, "; ");
      Space : Natural := 0;
      Result : Composition_Label_Parse_Result;
   begin
      if Item'Length = 0 or else Colon = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      for Index in Item'Range loop
         if Item (Index) = ' ' then
            Space := Index;
            exit;
         end if;
      end loop;
      if Space = 0 or else Space > Colon then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result.Subject_First := Item'First;
      Result.Subject_Length := Space - Item'First;
      Result.Action_First := Space + 1;
      Result.Action_Length := Colon - Space - 1;
      Result.Result_First := Colon + 2;
      if Detail = 0 then
         Result.Result_Length := Item'Last - Result.Result_First + 1;
      else
         Result.Result_Length := Detail - Result.Result_First;
         Result.Detail_First := Detail + 2;
         Result.Detail_Length := Item'Last - Result.Detail_First + 1;
      end if;
      Result.Consumed := Item'Length;
      return Result;
   end Parse_Narrative_Summary;

   function Scan_Narrative_Summary
     (Text : String)
      return Composition_Label_Parse_Result
   is
   begin
      return Parse_Narrative_Summary (Line_Text (Text));
   end Scan_Narrative_Summary;

   function Parse_Event_Summary
     (Text : String)
      return Composition_Label_Parse_Result
   is
   begin
      return Parse_Narrative_Summary (Text);
   end Parse_Event_Summary;

   function Scan_Event_Summary
     (Text : String)
      return Composition_Label_Parse_Result
   is
   begin
      return Parse_Event_Summary (Line_Text (Text));
   end Scan_Event_Summary;

   function Parse_Diff_Summary
     (Text : String)
      return Diff_Label_Parse_Result
   is
      Item : constant String := Clean (Text);
      Result : Diff_Label_Parse_Result;
      Changed : constant Natural := Find_Text (Item, " changed from ");
      Added : constant Natural := Find_Text (Item, " added as ");
      Removed : constant Natural := Find_Text (Item, " removed from ");
      Redacted : constant Natural := Find_Text (Item, " changed; values redacted");
      To_Pos : Natural;
   begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      elsif Redacted /= 0 then
         Result.Kind := Redacted_Diff;
         Result.Redacted := True;
         Result.Field_First := Item'First;
         Result.Field_Length := Redacted - Item'First;
      elsif Changed /= 0 then
         To_Pos := Find_Text (Item, " to ");
         if To_Pos = 0 then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
         Result.Kind := Changed_Diff;
         Result.Field_First := Item'First;
         Result.Field_Length := Changed - Item'First;
         Result.Old_Value_First := Changed + 14;
         Result.Old_Value_Length := To_Pos - Result.Old_Value_First;
         Result.New_Value_First := To_Pos + 4;
         Result.New_Value_Length := Item'Last - Result.New_Value_First + 1;
      elsif Added /= 0 then
         Result.Kind := Added_Diff;
         Result.Field_First := Item'First;
         Result.Field_Length := Added - Item'First;
         Result.New_Value_First := Added + 10;
         Result.New_Value_Length := Item'Last - Result.New_Value_First + 1;
      elsif Removed /= 0 then
         Result.Kind := Removed_Diff;
         Result.Field_First := Item'First;
         Result.Field_Length := Removed - Item'First;
         Result.Old_Value_First := Removed + 14;
         Result.Old_Value_Length := Item'Last - Result.Old_Value_First + 1;
      else
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result.Consumed := Item'Length;
      return Result;
   end Parse_Diff_Summary;

   function Scan_Diff_Summary
     (Text : String)
      return Diff_Label_Parse_Result
   is
   begin
      return Parse_Diff_Summary (Line_Text (Text));
   end Scan_Diff_Summary;

   function Parse_Text_Diff_Summary
     (Text : String)
      return Count_Label_Parse_Result
   is
      Item : constant String := Clean (Text);
      Result : Count_Label_Parse_Result;
   begin
      if Item = "no text changes" then
         Result.Consumed := Item'Length;
         return Result;
      elsif Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result.Lines_Added := Natural_After (Item, "");
      Result.Lines_Removed := Natural_After (Item, "added, ");
      Result.Words_Changed := Natural_After (Item, "removed, ");
      Result.Consumed := Item'Length;
      return Result;
   end Parse_Text_Diff_Summary;

   function Scan_Text_Diff_Summary
     (Text : String)
      return Count_Label_Parse_Result
   is
   begin
      return Parse_Text_Diff_Summary (Line_Text (Text));
   end Scan_Text_Diff_Summary;

   function Parse_Aggregate_Summary
     (Text : String)
      return Count_Label_Parse_Result
   is
      Item : constant String := Clean (Text);
      Space : Natural := 0;
      Colon : constant Natural := Find_Text (Item, ": ");
      Result : Count_Label_Parse_Result;
   begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result.Total := Natural_After (Item, "");
      for Index in Item'Range loop
         if Item (Index) = ' ' then
            Space := Index;
            exit;
         end if;
      end loop;
      if Space = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result.Subject_First := Space + 1;
      Result.Subject_Length :=
        (if Colon = 0 then Item'Last - Space
         else Colon - Space - 1);
      Result.Success := Natural_After (Item, ": ");
      Result.Warning := Natural_After (Item, "succeeded, ");
      Result.Failure := Natural_After (Item, "warnings, ");
      Result.Consumed := Item'Length;
      return Result;
   end Parse_Aggregate_Summary;

   function Scan_Aggregate_Summary
     (Text : String)
      return Count_Label_Parse_Result
   is
   begin
      return Parse_Aggregate_Summary (Line_Text (Text));
   end Scan_Aggregate_Summary;

   function Parse_Validation_Report_Label
     (Text : String)
      return Count_Label_Parse_Result
   is
      Item : constant String := Clean (Text);
      Marker : constant String := " validation: ";
      Pos : constant Natural := Find_Text (Item, Marker);
      Valid : constant Natural := Find_Text (Item, " valid");
      Result : Count_Label_Parse_Result;
   begin
      if Pos = 0 and then Valid = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      elsif Pos = 0 then
         Result.Subject_First := Item'First;
         Result.Subject_Length := Valid - Item'First;
         Result.Consumed := Item'Length;
         return Result;
      end if;
      Result.Subject_First := Item'First;
      Result.Subject_Length := Pos - Item'First;
      Result.Failure := Natural_After (Item, Marker);
      Result.Warning :=
        Natural_After_Either (Item, "error, ", "errors, ");
      Result.Total :=
        Natural_After_Either (Item, "warning, ", "warnings, ");
      Result.Consumed := Item'Length;
      return Result;
   end Parse_Validation_Report_Label;

   function Scan_Validation_Report_Label
     (Text : String)
      return Count_Label_Parse_Result
   is
   begin
      return Parse_Validation_Report_Label (Line_Text (Text));
   end Scan_Validation_Report_Label;

   function Parse_Stability_Metadata_Label
     (Text : String)
      return Stability_Label_Parse_Result
   is
      Item : constant String := Clean (Text);
      Result : Stability_Label_Parse_Result;
   begin
      if not Starts_With (Item, "stability ") then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result.Metadata.Round_Trippable := Find_Text (Item, "round-trip=yes") /= 0;
      Result.Metadata.Lossless := Find_Text (Item, "lossless=yes") /= 0;
      Result.Metadata.Approximate := Find_Text (Item, "approximate=yes") /= 0;
      Result.Metadata.Locale_Dependent :=
        Find_Text (Item, "locale-dependent=yes") /= 0;
      Result.Metadata.Privacy_Safe := Find_Text (Item, "privacy-safe=yes") /= 0;
      Result.Metadata.Stable_For_Logs := Find_Text (Item, "log-stable=yes") /= 0;
      Result.Metadata.Bounded_Available := Find_Text (Item, "bounded=yes") /= 0;
      Result.Consumed := Item'Length;
      return Result;
   end Parse_Stability_Metadata_Label;

   function Scan_Stability_Metadata_Label
     (Text : String)
      return Stability_Label_Parse_Result
   is
   begin
      return Parse_Stability_Metadata_Label (Line_Text (Text));
   end Scan_Stability_Metadata_Label;

   function Parse_Example_Case_Label
     (Text : String)
      return Example_Case_Parse_Result
   is
      Item : constant String := Clean (Text);
      Prefix : constant String := "example ";
      Dot : Natural := 0;
      Input_Pos : constant Natural := Find_Text (Item, ": input=");
      Expected_Pos : constant Natural := Find_Text (Item, " expected=");
      Result : Example_Case_Parse_Result;
   begin
      if not Starts_With (Item, Prefix)
        or else Input_Pos = 0
        or else Expected_Pos = 0
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      for Index in Item'First + Prefix'Length .. Input_Pos - 1 loop
         if Item (Index) = '.' then
            Dot := Index;
            exit;
         end if;
      end loop;
      if Dot = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      declare
         Surface : Domain_Surface;
      begin
         if not Match_Surface
           (Item (Item'First + Prefix'Length .. Dot - 1), Surface)
         then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
         Result.Area := Surface;
      end;
      Result.Name_First := Dot + 1;
      Result.Name_Length := Input_Pos - Result.Name_First;
      Result.Input_First := Input_Pos + 8;
      Result.Input_Length := Expected_Pos - Result.Input_First;
      Result.Expected_First := Expected_Pos + 10;
      Result.Expected_Length := Item'Last - Result.Expected_First + 1;
      Result.Consumed := Item'Length;
      return Result;
   end Parse_Example_Case_Label;

   function Scan_Example_Case_Label
     (Text : String)
      return Example_Case_Parse_Result
   is
   begin
      return Parse_Example_Case_Label (Line_Text (Text));
   end Scan_Example_Case_Label;

   function Parse_Domain_Label
     (Text : String)
      return Domain_Label_Parse_Result
   is
      Item : constant String := Clean (Text);
      Result : Domain_Label_Parse_Result;
      Start  : Natural;
      Stop   : Natural;
      Token_Start : Natural;
      Token_Stop  : Natural;
   begin
      if Item'Length = 0 then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      elsif Item (Item'First) /= '[' then
         Result.Consumed := Item'Length;
         Result.Body_First := Item'First;
         Result.Body_Length := Item'Length;
         return Result;
      end if;

      Stop := Item'First;
      while Stop <= Item'Last and then Item (Stop) /= ']' loop
         Stop := Stop + 1;
      end loop;
      if Stop > Item'Last then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      end if;

      Start := Item'First + 1;
      Token_Start := Start;
      while Token_Start < Stop loop
         Token_Stop := Token_Start;
         while Token_Stop < Stop and then Item (Token_Stop) /= ' ' loop
            Token_Stop := Token_Stop + 1;
         end loop;
         declare
            Last : constant Natural :=
              (if Token_Stop < Stop then Token_Stop - 1 else Stop - 1);
            Token : constant String := Item (Token_Start .. Last);
            Surface : Domain_Surface;
            Severity : Domain_Severity;
            Tone : Domain_Tone;
         begin
            if Match_Surface (Token, Surface) then
               Result.Surface := Surface;
               Result.Has_Surface := True;
            elsif Match_Severity (Token, Severity) then
               Result.Severity := Severity;
               Result.Has_Severity := True;
            elsif Match_Tone (Token, Tone) then
               Result.Tone := Tone;
               Result.Has_Tone := True;
            end if;
         end;
         Token_Start := Token_Stop + 1;
      end loop;
      Result.Consumed := Item'Length;
      if Stop < Item'Last then
         Result.Body_First := Stop + 2;
         Result.Body_Length := Item'Last - Result.Body_First + 1;
      end if;
      return Result;
   end Parse_Domain_Label;

   function Parse_Named_Label
     (Text          : String;
      Surface       : Domain_Surface;
      State_Suffix  : String)
      return Named_Label_Parse_Result
   is
      Item   : constant String := Clean (Text);
      Suffix : constant String := Clean (State_Suffix);
      Result : Named_Label_Parse_Result;
   begin
      Result.Surface := Surface;
      Result.Metadata := State_Metadata (Surface, Suffix);

      if Item'Length = 0 or else Suffix'Length = 0 then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      elsif Item'Length < Suffix'Length then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      end if;

      declare
         State_First : constant Natural := Item'Last - Suffix'Length + 1;
      begin
         if Item (State_First .. Item'Last) /= Suffix then
            Result.Status := Humanize.Status.Invalid_Argument;
            return Result;
         elsif State_First > Item'First and then Item (State_First - 1) = ' ' then
            Result.Name_First := Item'First;
            Result.Name_Length := State_First - Item'First - 1;
            Result.State_First := State_First;
            Result.State_Length := Suffix'Length;
            Result.Consumed := Item'Length;
            if Result.Name_Length = 0 then
               Result.Status := Humanize.Status.Invalid_Argument;
            end if;
            return Result;
         else
            Result.Status := Humanize.Status.Invalid_Argument;
            return Result;
         end if;
      end;
   end Parse_Named_Label;

   function Scan_Named_Label
     (Text          : String;
      Surface       : Domain_Surface;
      State_Suffix  : String)
      return Named_Label_Parse_Result
   is
      Result : Named_Label_Parse_Result;
   begin
      for Last in reverse Text'Range loop
         Result := Parse_Named_Label
           (Text (Text'First .. Last), Surface, State_Suffix);
         if Result.Status = Humanize.Status.Ok then
            return Result;
         end if;
      end loop;

      Result.Surface := Surface;
      Result.Metadata := State_Metadata (Surface, State_Suffix);
      Result.Status := Humanize.Status.Invalid_Argument;
      Result.Consumed := 0;
      return Result;
   end Scan_Named_Label;

   function Parse_Log_Field
     (Text : String)
      return Log_Field_Parse_Result
   is
      Item : constant String := Clean (Text);
      Equal_Pos : Natural := 0;
      Result : Log_Field_Parse_Result;
   begin
      if Item'Length = 0 then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      end if;

      for Index in Item'Range loop
         if Item (Index) = '=' then
            Equal_Pos := Index;
            exit;
         elsif Item (Index) = ' ' then
            exit;
         end if;
      end loop;

      if Equal_Pos = 0
        or else Equal_Pos = Item'First
        or else Equal_Pos = Item'Last
      then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      end if;

      Result.Key_First := Item'First;
      Result.Key_Length := Equal_Pos - Item'First;
      Result.Value_First := Equal_Pos + 1;
      Result.Value_Length := Item'Last - Equal_Pos;
      Result.Consumed := Item'Length;
      return Result;
   end Parse_Log_Field;

   function Scan_Log_Field
     (Text : String)
      return Log_Field_Parse_Result
   is
      Last : Natural := 0;
      Result : Log_Field_Parse_Result;
   begin
      for Index in Text'Range loop
         if Text (Index) = ' ' then
            Last := Index - 1;
            exit;
         end if;
      end loop;

      if Text'Length = 0 then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      elsif Last = 0 then
         return Parse_Log_Field (Text);
      elsif Last < Text'First then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      else
         return Parse_Log_Field (Text (Text'First .. Last));
      end if;
   end Scan_Log_Field;

   procedure Domain_Label_Into
     (Text     : String;
      Metadata : Domain_Label_Metadata;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Domain_Label_Options := Default_Domain_Label_Options)
   is
   begin
      Copy_Result (Domain_Label (Text, Metadata, Options), Target, Written, Status);
   end Domain_Label_Into;

   procedure Metadata_Summary_Label_Into
     (Metadata : Domain_Label_Metadata;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Metadata_Summary_Label (Metadata);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Metadata_Summary_Label_Into;

   procedure Cross_Domain_Summary_Into
     (Primary_Label   : String;
      Secondary_Label : String;
      Metadata        : Domain_Label_Metadata;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code;
      Options         : Domain_Label_Options := Default_Domain_Label_Options)
   is
   begin
      Copy_Result
        (Cross_Domain_Summary
           (Primary_Label, Secondary_Label, Metadata, Options),
         Target, Written, Status);
   end Cross_Domain_Summary_Into;

   procedure Event_Summary_Into
     (Event_Label  : String;
      Status_Label : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Actor_Label  : String := "";
      Time_Label   : String := "";
      Metadata     : Domain_Label_Metadata := (others => <>);
      Options      : Domain_Label_Options := Default_Domain_Label_Options)
   is
   begin
      Copy_Result
        (Event_Summary
           (Event_Label, Status_Label, Actor_Label, Time_Label,
            Metadata, Options),
         Target, Written, Status);
   end Event_Summary_Into;

   procedure Label_Parts_Summary_Into
     (Parts   : Label_Part_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Label_Parts_Summary (Parts), Target, Written, Status);
   end Label_Parts_Summary_Into;

   procedure Diff_Summary_Into
     (Field_Name : String;
      Kind       : Diff_Kind;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Old_Value  : String := "";
      New_Value  : String := "";
      Redacted   : Boolean := False)
   is
   begin
      Copy_Result
        (Diff_Summary (Field_Name, Kind, Old_Value, New_Value, Redacted),
         Target, Written, Status);
   end Diff_Summary_Into;

   procedure Text_Diff_Summary_Into
     (Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Lines_Added   : Natural := 0;
      Lines_Removed : Natural := 0;
      Words_Changed : Natural := 0)
   is
   begin
      Copy_Result
        (Text_Diff_Summary (Lines_Added, Lines_Removed, Words_Changed),
         Target, Written, Status);
   end Text_Diff_Summary_Into;

   procedure Output_Profile_Label_Into
     (Profile : Output_Profile;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Output_Profile_Label (Profile), Target, Written, Status);
   end Output_Profile_Label_Into;

   procedure Aggregate_Summary_Into
     (Subject : String;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Success : Natural := 0;
      Warning : Natural := 0;
      Failure : Natural := 0)
   is
   begin
      Copy_Result
        (Aggregate_Summary (Subject, Total, Success, Warning, Failure),
         Target, Written, Status);
   end Aggregate_Summary_Into;

   procedure Top_Item_Summary_Into
     (Subject : String;
      Item    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Top_Item_Summary (Subject, Item, Count),
                   Target, Written, Status);
   end Top_Item_Summary_Into;

   procedure Combined_Metadata_Label_Into
     (Primary   : Domain_Label_Metadata;
      Secondary : Domain_Label_Metadata;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Combined_Metadata_Label (Primary, Secondary),
                   Target, Written, Status);
   end Combined_Metadata_Label_Into;

   procedure Stability_Metadata_Label_Into
     (Metadata : Label_Stability_Metadata;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Stability_Metadata_Label (Metadata), Target, Written, Status);
   end Stability_Metadata_Label_Into;

   procedure Example_Case_Label_Into
     (Example : Example_Case;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Example_Case_Label (Example), Target, Written, Status);
   end Example_Case_Label_Into;

   procedure Narrative_Summary_Into
     (Subject  : String;
      Action   : String;
      Result   : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Detail   : String := "";
      Metadata : Domain_Label_Metadata := (others => <>);
      Options  : Domain_Label_Options := Default_Domain_Label_Options)
   is
   begin
      Copy_Result
        (Narrative_Summary
           (Subject, Action, Result, Detail, Metadata, Options),
         Target, Written, Status);
   end Narrative_Summary_Into;

   procedure Validation_Report_Label_Into
     (Subject  : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Errors   : Natural := 0;
      Warnings : Natural := 0;
      Missing  : Natural := 0;
      Hint     : String := "")
   is
   begin
      Copy_Result
        (Validation_Report_Label
           (Subject, Errors, Warnings, Missing, Hint),
         Target, Written, Status);
   end Validation_Report_Label_Into;
end Humanize.Domain_Details.Support;
