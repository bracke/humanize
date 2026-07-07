with Ada.Calendar;
with Ada.Characters.Handling;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Decimal_Images;
with Humanize.Messages;

package body Humanize.Phrases is

   use type Humanize.Bytes.Byte_Count;
   use type Humanize.Status.Status_Code;

   function Locale_Prefix (Context : Humanize.Contexts.Context) return String is
      Locale : constant String := Humanize.Contexts.Locale (Context);
   begin
      if Locale'Length >= 2 then
         return Locale (Locale'First .. Locale'First + 1);
      else
         return Locale;
      end if;
   end Locale_Prefix;

   function Severity_Label
     (Severity : Phrase_Severity)
      return Humanize.Status.Text_Result
   is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (case Severity is
              when Neutral_Severity => "neutral",
              when Success_Severity => "success",
              when Warning_Severity => "warning",
              when Danger_Severity => "danger",
              when Info_Severity => "info"),
         Key => Humanize.Messages.No_Message);
   end Severity_Label;

   function Tone_For_Severity
     (Severity : Phrase_Severity)
      return Phrase_Tone
   is
   begin
      case Severity is
         when Neutral_Severity => return Neutral_Tone;
         when Success_Severity => return Positive_Tone;
         when Warning_Severity => return Attention_Tone;
         when Danger_Severity  => return Critical_Tone;
         when Info_Severity    => return Informational_Tone;
      end case;
   end Tone_For_Severity;

   function Tone_Label
     (Tone : Phrase_Tone)
      return Humanize.Status.Text_Result
   is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (case Tone is
              when Neutral_Tone       => "neutral",
              when Positive_Tone      => "positive",
              when Attention_Tone     => "attention",
              when Critical_Tone      => "critical",
              when Informational_Tone => "informational"),
         Key => Humanize.Messages.No_Message);
   end Tone_Label;

   function Status_Severity
     (Status : UI_Status)
      return Phrase_Severity
   is
   begin
      case Status is
         when Saved | Complete =>
            return Success_Severity;
         when Retrying | Due_Soon | Unsaved =>
            return Warning_Severity;
         when Failed | Overdue =>
            return Danger_Severity;
         when Loading | Saving | Paused | Last_Seen | Updated_Just_Now =>
            return Info_Severity;
         when Empty =>
            return Neutral_Severity;
      end case;
   end Status_Severity;

   function Security_Severity
     (Status : Security_Status)
      return Phrase_Severity
   is
   begin
      case Status is
         when Secure | Encrypted =>
            return Success_Severity;
         when Token_Expired | Insecure | Vulnerable =>
            return Danger_Severity;
         when Unencrypted =>
            return Warning_Severity;
      end case;
   end Security_Severity;

   function Health_Severity
     (Status : Health_Status)
      return Phrase_Severity
   is
   begin
      case Status is
         when Healthy | Recovering =>
            return Success_Severity;
         when Degraded | Maintenance =>
            return Warning_Severity;
         when Unhealthy | Incident =>
            return Danger_Severity;
      end case;
   end Health_Severity;

   function Task_Severity
     (Status : Task_Status)
      return Phrase_Severity
   is
   begin
      case Status is
         when Done =>
            return Success_Severity;
         when Blocked_Task =>
            return Danger_Severity;
         when Waiting_On | Skipped =>
            return Warning_Severity;
         when In_Progress =>
            return Info_Severity;
         when Todo =>
            return Neutral_Severity;
      end case;
   end Task_Severity;

   function CI_Severity
     (Status : CI_Status)
      return Phrase_Severity
   is
   begin
      case Status is
         when Pipeline_Passed =>
            return Success_Severity;
         when Pipeline_Failed | Deploy_Blocked =>
            return Danger_Severity;
         when Review_Required =>
            return Warning_Severity;
         when Pipeline_Pending | Pipeline_Running =>
            return Info_Severity;
      end case;
   end CI_Severity;

   function Ticket_Severity
     (Status : Ticket_Status)
      return Phrase_Severity
   is
   begin
      case Status is
         when Ticket_Resolved | Ticket_Closed =>
            return Success_Severity;
         when Ticket_Escalated =>
            return Danger_Severity;
         when Ticket_Waiting =>
            return Warning_Severity;
         when Ticket_New | Ticket_Open =>
            return Info_Severity;
      end case;
   end Ticket_Severity;

   function Payment_Lifecycle_Severity
     (Status : Payment_Lifecycle_Status)
      return Phrase_Severity
   is
   begin
      case Status is
         when Payment_Authorized | Payment_Captured | Payment_Refunded =>
            return Success_Severity;
         when Payment_Disputed | Payment_Expired =>
            return Danger_Severity;
         when Payment_Requires_Action =>
            return Warning_Severity;
      end case;
   end Payment_Lifecycle_Severity;

   function Backup_Severity
     (Status : Backup_Status)
      return Phrase_Severity
   is
   begin
      case Status is
         when Backup_Completed =>
            return Success_Severity;
         when Backup_Failed =>
            return Danger_Severity;
         when Backup_Stale =>
            return Warning_Severity;
         when Backup_Running =>
            return Info_Severity;
      end case;
   end Backup_Severity;

   function Incident_Severity
     (Status : Incident_Status)
      return Phrase_Severity
   is
   begin
      case Status is
         when Incident_Resolved =>
            return Success_Severity;
         when Incident_Investigating | Incident_Identified =>
            return Danger_Severity;
         when Incident_Mitigated =>
            return Warning_Severity;
      end case;
   end Incident_Severity;

   function Release_Severity
     (Status : Release_Status)
      return Phrase_Severity
   is
   begin
      case Status is
         when Release_Published =>
            return Success_Severity;
         when Release_Rolled_Back =>
            return Danger_Severity;
         when Release_Ready =>
            return Info_Severity;
         when Release_Drafting =>
            return Neutral_Severity;
      end case;
   end Release_Severity;

   function Audit_Severity (Status : Audit_Status) return Phrase_Severity is
   begin
      case Status is
         when Audit_Created | Audit_Updated | Audit_Restored =>
            return Info_Severity;
         when Audit_Deleted =>
            return Warning_Severity;
      end case;
   end Audit_Severity;

   function Feature_Flag_Severity
     (Status : Feature_Flag_Status) return Phrase_Severity
   is
   begin
      case Status is
         when Flag_Enabled =>
            return Success_Severity;
         when Flag_Disabled =>
            return Neutral_Severity;
         when Flag_Rolling_Out =>
            return Info_Severity;
         when Flag_Rolled_Back =>
            return Warning_Severity;
      end case;
   end Feature_Flag_Severity;

   function Webhook_Severity (Status : Webhook_Status) return Phrase_Severity is
   begin
      case Status is
         when Webhook_Delivered =>
            return Success_Severity;
         when Webhook_Failed =>
            return Danger_Severity;
         when Webhook_Retrying =>
            return Warning_Severity;
         when Webhook_Pending =>
            return Info_Severity;
      end case;
   end Webhook_Severity;

   function API_Key_Severity (Status : API_Key_Status) return Phrase_Severity is
   begin
      case Status is
         when API_Key_Active | API_Key_Rotated =>
            return Success_Severity;
         when API_Key_Revoked | API_Key_Expired =>
            return Danger_Severity;
      end case;
   end API_Key_Severity;

   function Quota_Severity (Status : Quota_Status) return Phrase_Severity is
   begin
      case Status is
         when Quota_Available | Quota_Reset =>
            return Success_Severity;
         when Quota_Near_Limit =>
            return Warning_Severity;
         when Quota_Exceeded =>
            return Danger_Severity;
      end case;
   end Quota_Severity;

   function Invoice_Severity (Status : Invoice_Status) return Phrase_Severity is
   begin
      case Status is
         when Invoice_Paid | Invoice_Refunded =>
            return Success_Severity;
         when Invoice_Overdue | Refund_Failed =>
            return Danger_Severity;
         when Invoice_Sent =>
            return Info_Severity;
         when Invoice_Draft =>
            return Neutral_Severity;
      end case;
   end Invoice_Severity;

   function Database_Severity
     (Status : Database_Status)
      return Phrase_Severity
   is
   begin
      case Status is
         when Database_Online =>
            return Success_Severity;
         when Database_Offline | Database_Migration_Failed
            | Database_Backup_Failed =>
            return Danger_Severity;
         when Database_Degraded | Database_Replication_Lagging =>
            return Warning_Severity;
         when Database_Migrating | Database_Replicating
            | Database_Backup_Running =>
            return Info_Severity;
      end case;
   end Database_Severity;

   function Supported_Phrase_Locales
     return Humanize.Status.Text_Result
   is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           ("en da de fr es it pt nl sv no nb fi pl cs tr ru uk ja ko zh ar hi"),
         Key => Humanize.Messages.No_Message);
   end Supported_Phrase_Locales;

   function Phrase_Pack_Summary
     return Humanize.Status.Text_Result
   is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           ("ui file validation empty network auth billing workflow queue security "
            & "deployment health notification form access sync transfer search "
            & "collaboration issue task ci ticket payment backup incident release "
            & "audit flag webhook api_key quota invoice database summaries "
            & "comparisons"),
         Key => Humanize.Messages.No_Message);
   end Phrase_Pack_Summary;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result;

   function Natural_Text (Value : Natural) return String is
      Image : constant String := Natural'Image (Value);
   begin
      return Image (Image'First + 1 .. Image'Last);
   end Natural_Text;

   function Domain_Text (Domain : Summary_Domain) return String is
   begin
      case Domain is
         when Queue_Domain  => return "queue";
         when Job_Domain    => return "job";
         when Run_Domain    => return "run";
         when Cache_Domain  => return "cache";
         when Sync_Domain   => return "sync";
         when Import_Domain => return "import";
         when Export_Domain => return "export";
      end case;
   end Domain_Text;

   function Summary_State_Text (State : Summary_State) return String is
   begin
      case State is
         when Summary_Queued   => return "queued";
         when Summary_Running  => return "running";
         when Summary_Waiting  => return "waiting";
         when Summary_Paused   => return "paused";
         when Summary_Complete => return "complete";
         when Summary_Failed   => return "failed";
         when Summary_Stale    => return "stale";
         when Summary_Skipped  => return "skipped";
      end case;
   end Summary_State_Text;

   function Unit_Noun
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
   is
   begin
      if Count = 1 then
         return Singular;
      else
         return Plural;
      end if;
   end Unit_Noun;

   procedure Append_Segment
     (Text    : in out Unbounded_String;
      Segment : String)
   is
   begin
      if Length (Text) > 0 then
         Append (Text, ", ");
      end if;
      Append (Text, Segment);
   end Append_Segment;

   function Failure_Segment (Failed : Natural) return String is
   begin
      return Natural_Text (Failed) & " failed";
   end Failure_Segment;

   function Completion_Segment
     (Completed : Natural;
      Total     : Natural;
      Singular  : String;
      Plural    : String)
      return String
   is
      Noun_Count : constant Natural :=
        (if Total > 0 then Total else Completed);
   begin
      if Total = 0 then
         if Completed = 0 then
            return "no " & Plural;
         else
            return Natural_Text (Completed) & " "
              & Unit_Noun (Completed, Singular, Plural) & " complete";
         end if;
      else
         return Natural_Text (Completed) & " of " & Natural_Text (Total)
           & " " & Unit_Noun (Noun_Count, Singular, Plural) & " complete";
      end if;
   end Completion_Segment;

   function Domain_Label
     (Domain : Summary_Domain)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Domain_Text (Domain));
   end Domain_Label;

   function Summary_State_Label
     (State : Summary_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Summary_State_Text (State));
   end Summary_State_Label;

   function Domain_Summary
     (Context   : Humanize.Contexts.Context;
      Domain    : Summary_Domain;
      State     : Summary_State;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Details : Unbounded_String :=
        To_Unbounded_String
          (Completion_Segment (Completed, Total, Singular, Plural));
   begin
      if Failed > 0 then
         Append_Segment (Details, Failure_Segment (Failed));
      end if;

      return Ok_Text
        (Domain_Text (Domain) & " " & Summary_State_Text (State) & ": "
         & To_String (Details));
   end Domain_Summary;

   function Queue_Summary
     (Context   : Humanize.Contexts.Context;
      Queued    : Natural;
      Running   : Natural;
      Failed    : Natural := 0;
      Completed : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Details : Unbounded_String;
   begin
      if Queued = 0 and then Running = 0
        and then Failed = 0 and then Completed = 0
      then
         return Ok_Text ("queue empty");
      end if;

      if Queued > 0 then
         Append_Segment
           (Details,
            Natural_Text (Queued) & " " & Unit_Noun (Queued, Singular, Plural)
            & " queued");
      end if;
      if Running > 0 then
         Append_Segment (Details, Natural_Text (Running) & " running");
      end if;
      if Failed > 0 then
         Append_Segment (Details, Failure_Segment (Failed));
      end if;
      if Completed > 0 then
         Append_Segment (Details, Natural_Text (Completed) & " complete");
      end if;

      return Ok_Text ("queue: " & To_String (Details));
   end Queue_Summary;

   function Cache_Summary
     (Context : Humanize.Contexts.Context;
      Hits    : Natural;
      Misses  : Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Total : constant Natural := Hits + Misses;
      Rate  : Natural := 0;
   begin
      if Total = 0 then
         return Ok_Text ("cache: no requests");
      end if;

      Rate :=
        Natural
          ((Long_Long_Integer (Hits) * 100
            + Long_Long_Integer (Total) / 2)
           / Long_Long_Integer (Total));

      return Ok_Text
        ("cache: " & Natural_Text (Hits) & " "
         & Unit_Noun (Hits, "hit", "hits") & ", "
         & Natural_Text (Misses) & " " & Unit_Noun (Misses, "miss", "misses")
         & ", " & Natural_Text (Rate) & "% hit rate");
   end Cache_Summary;

   function Sync_Summary
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result
   is
   begin
      return Domain_Summary
        (Context, Sync_Domain, Summary_Running, Completed, Total, Failed,
         Singular, Plural);
   end Sync_Summary;

   function Import_Summary
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result
   is
   begin
      return Domain_Summary
        (Context, Import_Domain, Summary_Running, Completed, Total, Failed,
         Singular, Plural);
   end Import_Summary;

   function Export_Summary
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result
   is
   begin
      return Domain_Summary
        (Context, Export_Domain, Summary_Running, Completed, Total, Failed,
         Singular, Plural);
   end Export_Summary;

   function Comparison_Unit_Noun
     (Value    : Long_Float;
      Singular : String;
      Plural   : String)
      return String
   is
   begin
      if Singular'Length = 0 then
         return "";
      elsif abs Value = 1.0 then
         return Singular;
      elsif Plural'Length > 0 then
         return Plural;
      else
         return Singular & "s";
      end if;
   end Comparison_Unit_Noun;

   function With_Optional_Unit
     (Quantity : String;
      Value    : Long_Float;
      Singular : String;
      Plural   : String)
      return String
   is
      Noun : constant String := Comparison_Unit_Noun (Value, Singular, Plural);
   begin
      if Noun'Length = 0 then
         return Quantity;
      else
         return Quantity & " " & Noun;
      end if;
   end With_Optional_Unit;

   function Invalid_Text return Humanize.Status.Text_Result is
   begin
      return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Invalid_Text;

   function File_Size_Comparison
     (Context        : Humanize.Contexts.Context;
      Current        : Humanize.Bytes.Byte_Count;
      Baseline       : Humanize.Bytes.Byte_Count;
      Current_Label  : String := "file";
      Baseline_Label : String := "baseline";
      Options        : Humanize.Bytes.Byte_Options :=
        Humanize.Bytes.Default_Byte_Options)
      return Humanize.Status.Text_Result
   is
      Diff : Humanize.Bytes.Byte_Count;
      Size : Humanize.Status.Text_Result;
   begin
      if Current = Baseline then
         return Ok_Text
           (Current_Label & " is the same size as " & Baseline_Label);
      elsif Current > Baseline then
         Diff := Current - Baseline;
         Size := Humanize.Bytes.Format (Context, Diff, Options);
         if Size.Status /= Humanize.Status.Ok then
            return Size;
         end if;
         return Ok_Text
           (Current_Label & " is " & To_String (Size.Text)
            & " larger than " & Baseline_Label);
      else
         Diff := Baseline - Current;
         Size := Humanize.Bytes.Format (Context, Diff, Options);
         if Size.Status /= Humanize.Status.Ok then
            return Size;
         end if;
         return Ok_Text
           (Current_Label & " is " & To_String (Size.Text)
            & " smaller than " & Baseline_Label);
      end if;
   end File_Size_Comparison;

   function Date_Comparison
     (Context        : Humanize.Contexts.Context;
      Value          : Humanize.Datetimes.Civil_Date_Time;
      Reference      : Humanize.Datetimes.Civil_Date_Time;
      Value_Label    : String := "date";
      Reference_Label : String := "reference";
      Options        : Humanize.Datetimes.Calendar_Difference_Options :=
        Humanize.Datetimes.Default_Calendar_Difference_Options)
      return Humanize.Status.Text_Result
   is
      use type Ada.Calendar.Time;
      Diff_Options : Humanize.Datetimes.Calendar_Difference_Options := Options;
      Difference   : Humanize.Status.Text_Result;
      Value_Time   : Ada.Calendar.Time;
      Ref_Time     : Ada.Calendar.Time;
   begin
      Diff_Options.Style := Humanize.Datetimes.Calendar_Difference_Plain;
      Value_Time :=
        Ada.Calendar.Time_Of
          (Value.Year, Value.Month, Value.Day,
           Duration (Value.Hour * 3_600 + Value.Minute * 60 + Value.Second));
      Ref_Time :=
        Ada.Calendar.Time_Of
          (Reference.Year, Reference.Month, Reference.Day,
           Duration
             (Reference.Hour * 3_600
              + Reference.Minute * 60
              + Reference.Second));

      if Value_Time = Ref_Time then
         return Ok_Text
           (Value_Label & " is the same date as " & Reference_Label);
      elsif Value_Time > Ref_Time then
         Difference :=
           Humanize.Datetimes.Calendar_Difference_Label
             (Context, Reference, Value, Diff_Options);
         if Difference.Status /= Humanize.Status.Ok then
            return Difference;
         end if;
         return Ok_Text
           (Value_Label & " is " & To_String (Difference.Text)
            & " after " & Reference_Label);
      else
         Difference :=
           Humanize.Datetimes.Calendar_Difference_Label
             (Context, Value, Reference, Diff_Options);
         if Difference.Status /= Humanize.Status.Ok then
            return Difference;
         end if;
         return Ok_Text
           (Value_Label & " is " & To_String (Difference.Text)
            & " before " & Reference_Label);
      end if;
   exception
      when others =>
         return Invalid_Text;
   end Date_Comparison;

   function Number_Comparison
     (Context        : Humanize.Contexts.Context;
      Current        : Long_Float;
      Baseline       : Long_Float;
      Current_Label  : String := "value";
      Baseline_Label : String := "baseline";
      Unit_Singular  : String := "";
      Unit_Plural    : String := "";
      Options        : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Difference : constant Long_Float := Current - Baseline;
      Quantity   : constant String :=
        With_Optional_Unit
          (Humanize.Decimal_Images.Decimal_Image
             (abs Difference,
              Options.Maximum_Fraction_Digits,
              Options.Suppress_Trailing_Zero),
           Difference, Unit_Singular, Unit_Plural);
   begin
      if Difference = 0.0 then
         return Ok_Text (Current_Label & " is equal to " & Baseline_Label);
      elsif Difference > 0.0 then
         return Ok_Text
           (Current_Label & " is " & Quantity & " higher than "
            & Baseline_Label);
      else
         return Ok_Text
           (Current_Label & " is " & Quantity & " lower than "
            & Baseline_Label);
      end if;
   end Number_Comparison;

   function Percent_Comparison
     (Context        : Humanize.Contexts.Context;
      Current        : Long_Float;
      Baseline       : Long_Float;
      Current_Label  : String := "value";
      Baseline_Label : String := "baseline";
      Options        : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      Difference : Long_Float;
      Quantity   : Humanize.Status.Text_Result;
   begin
      if Baseline = 0.0 then
         return Invalid_Text;
      end if;

      Difference := ((Current - Baseline) / abs Baseline) * 100.0;
      Quantity := Humanize.Numbers.Percent (Context, abs Difference, Options);
      if Quantity.Status /= Humanize.Status.Ok then
         return Quantity;
      end if;

      if Difference = 0.0 then
         return Ok_Text (Current_Label & " is equal to " & Baseline_Label);
      elsif Difference > 0.0 then
         return Ok_Text
           (Current_Label & " is " & To_String (Quantity.Text)
            & " higher than " & Baseline_Label);
      else
         return Ok_Text
           (Current_Label & " is " & To_String (Quantity.Text)
            & " lower than " & Baseline_Label);
      end if;
   end Percent_Comparison;

   function Key_Text (Prefix, Image : String) return String is
      Result : String (1 .. Prefix'Length + 1 + Image'Length);
      Index  : Natural := Result'First;
   begin
      for Ch of Prefix loop
         Result (Index) := Ch;
         Index := Index + 1;
      end loop;
      Result (Index) := '.';
      Index := Index + 1;

      for Ch of Image loop
         Result (Index) := Ada.Characters.Handling.To_Lower (Ch);
         Index := Index + 1;
      end loop;
      return Result;
   end Key_Text;

   function B (Hex : String) return String is
      Result : String (1 .. Hex'Length / 2);

      function Nibble (C : Character) return Natural is
      begin
         case C is
            when '0' .. '9' =>
               return Character'Pos (C) - Character'Pos ('0');
            when 'A' .. 'F' =>
               return 10 + Character'Pos (C) - Character'Pos ('A');
            when 'a' .. 'f' =>
               return 10 + Character'Pos (C) - Character'Pos ('a');
            when others =>
               return 0;
         end case;
      end Nibble;
   begin
      for I in Result'Range loop
         Result (I) :=
           Character'Val
             (Nibble (Hex (Hex'First + 2 * (I - Result'First))) * 16
              + Nibble (Hex (Hex'First + 2 * (I - Result'First) + 1)));
      end loop;

      return Result;
   end B;

   function Has_Generated_Phrase_Pack (Locale : String) return Boolean is
   begin
      return
        Locale in "da" | "es" | "it" | "pt" | "nl" | "sv" | "no" | "nb"
        | "fi" | "pl" | "cs" | "tr" | "ru" | "uk" | "ja" | "ko" | "zh"
        | "ar" | "hi";
   end Has_Generated_Phrase_Pack;

   function Phrase_Separator (Locale : String) return String is
   begin
      if Locale in "ja" | "ko" | "zh" then
         return "";
      else
         return " ";
      end if;
   end Phrase_Separator;

   function Database_Token_Text (Locale, Token : String) return String is
   begin
      if Locale = "da" then
         if Token = "DATABASE" then
            return "database";
         end if;
         if Token = "DEGRADED" then
            return "forringet";
         end if;
         if Token = "MIGRATING" then
            return "migrerer";
         end if;
         if Token = "MIGRATION" then
            return "migrering";
         end if;
         if Token = "REPLICATING" then
            return "replikerer";
         end if;
         if Token = "REPLICATION" then
            return "replikering";
         end if;
         if Token = "LAGGING" then
            return "forsinket";
         end if;
         if Token = "BACKUP" then
            return "backup";
         end if;
         if Token = "RUNNING" then
            return "koerer";
         end if;
      elsif Locale = "es" then
         if Token = "DATABASE" then
            return "base de datos";
         end if;
         if Token = "ONLINE" then
            return "en linea";
         end if;
         if Token = "OFFLINE" then
            return "sin conexion";
         end if;
         if Token = "DEGRADED" then
            return "degradada";
         end if;
         if Token = "MIGRATING" then
            return "migrando";
         end if;
         if Token = "MIGRATION" then
            return "migracion";
         end if;
         if Token = "REPLICATING" then
            return "replicando";
         end if;
         if Token = "REPLICATION" then
            return "replicacion";
         end if;
         if Token = "LAGGING" then
            return "retrasada";
         end if;
         if Token = "BACKUP" then
            return "copia de seguridad";
         end if;
         if Token = "RUNNING" then
            return "en ejecucion";
         end if;
      elsif Locale = "it" then
         if Token = "DATABASE" then
            return "database";
         end if;
         if Token = "DEGRADED" then
            return "degradato";
         end if;
         if Token = "MIGRATING" then
            return "migrazione";
         end if;
         if Token = "MIGRATION" then
            return "migrazione";
         end if;
         if Token = "REPLICATING" then
            return "replica";
         end if;
         if Token = "REPLICATION" then
            return "replica";
         end if;
         if Token = "LAGGING" then
            return "in ritardo";
         end if;
         if Token = "BACKUP" then
            return "backup";
         end if;
         if Token = "RUNNING" then
            return "in corso";
         end if;
      elsif Locale = "pt" then
         if Token = "DATABASE" then
            return "banco de dados";
         end if;
         if Token = "DEGRADED" then
            return "degradado";
         end if;
         if Token = "MIGRATING" then
            return "migrando";
         end if;
         if Token = "MIGRATION" then
            return B ("6D69677261C3A7C3A36F");
         end if;
         if Token = "REPLICATING" then
            return "replicando";
         end if;
         if Token = "REPLICATION" then
            return B ("7265706C696361C3A7C3A36F");
         end if;
         if Token = "LAGGING" then
            return "atrasada";
         end if;
         if Token = "BACKUP" then
            return "backup";
         end if;
         if Token = "RUNNING" then
            return "em execucao";
         end if;
      elsif Locale = "nl" then
         if Token = "DATABASE" then
            return "database";
         end if;
         if Token = "DEGRADED" then
            return "verminderd";
         end if;
         if Token = "MIGRATING" then
            return "migreert";
         end if;
         if Token = "MIGRATION" then
            return "migratie";
         end if;
         if Token = "REPLICATING" then
            return "repliceert";
         end if;
         if Token = "REPLICATION" then
            return "replicatie";
         end if;
         if Token = "LAGGING" then
            return "vertraagd";
         end if;
         if Token = "BACKUP" then
            return "back-up";
         end if;
         if Token = "RUNNING" then
            return "actief";
         end if;
      elsif Locale in "sv" | "no" | "nb" then
         if Token = "DATABASE" then
            return "database";
         end if;
         if Token = "DEGRADED" then
            return "nedsatt";
         end if;
         if Token = "MIGRATING" then
            return "migrerer";
         end if;
         if Token = "MIGRATION" then
            return "migrering";
         end if;
         if Token = "REPLICATING" then
            return "replikerer";
         end if;
         if Token = "REPLICATION" then
            return "replikering";
         end if;
         if Token = "LAGGING" then
            return "forsinket";
         end if;
         if Token = "BACKUP" then
            return "backup";
         end if;
         if Token = "RUNNING" then
            return "koerer";
         end if;
      elsif Locale = "fi" then
         if Token = "DATABASE" then
            return "tietokanta";
         end if;
         if Token = "DEGRADED" then
            return "heikentynyt";
         end if;
         if Token = "MIGRATING" then
            return "siirtyy";
         end if;
         if Token = "MIGRATION" then
            return "siirto";
         end if;
         if Token = "REPLICATING" then
            return "replikoi";
         end if;
         if Token = "REPLICATION" then
            return "replikointi";
         end if;
         if Token = "LAGGING" then
            return "viiveella";
         end if;
         if Token = "BACKUP" then
            return "varmuuskopio";
         end if;
         if Token = "RUNNING" then
            return "kaynnissa";
         end if;
      elsif Locale = "pl" then
         if Token = "DATABASE" then
            return "baza danych";
         end if;
         if Token = "DEGRADED" then
            return "zdegradowana";
         end if;
         if Token = "MIGRATING" then
            return "migruje";
         end if;
         if Token = "MIGRATION" then
            return "migracja";
         end if;
         if Token = "REPLICATING" then
            return "replikuje";
         end if;
         if Token = "REPLICATION" then
            return "replikacja";
         end if;
         if Token = "LAGGING" then
            return "opozniona";
         end if;
         if Token = "BACKUP" then
            return "kopia zapasowa";
         end if;
         if Token = "RUNNING" then
            return "uruchomiona";
         end if;
      elsif Locale = "cs" then
         if Token = "DATABASE" then
            return "databaze";
         end if;
         if Token = "DEGRADED" then
            return "degradovana";
         end if;
         if Token = "MIGRATING" then
            return "migruje";
         end if;
         if Token = "MIGRATION" then
            return "migrace";
         end if;
         if Token = "REPLICATING" then
            return "replikuje";
         end if;
         if Token = "REPLICATION" then
            return "replikace";
         end if;
         if Token = "LAGGING" then
            return "zpozdena";
         end if;
         if Token = "BACKUP" then
            return "zaloha";
         end if;
         if Token = "RUNNING" then
            return "bezi";
         end if;
      elsif Locale = "tr" then
         if Token = "DATABASE" then
            return "veritabani";
         end if;
         if Token = "ONLINE" then
            return "cevrimici";
         end if;
         if Token = "OFFLINE" then
            return "cevrimdisi";
         end if;
         if Token = "DEGRADED" then
            return "bozulmus";
         end if;
         if Token = "MIGRATING" then
            return "tasiniyor";
         end if;
         if Token = "MIGRATION" then
            return "tasima";
         end if;
         if Token = "REPLICATING" then
            return "cogaliyor";
         end if;
         if Token = "REPLICATION" then
            return "cogaltma";
         end if;
         if Token = "LAGGING" then
            return "gecikiyor";
         end if;
         if Token = "BACKUP" then
            return "yedekleme";
         end if;
         if Token = "RUNNING" then
            return "calisiyor";
         end if;
      elsif Locale = "ru" then
         if Token = "DATABASE" then
            return B ("D0B1D0B0D0B7D0B020D0B4D0B0D0BDD0BDD18BD185");
         end if;
         if Token = "ONLINE" then
            return B ("D0B2D0BAD0BBD18ED187D0B5D0BDD0B0");
         end if;
         if Token = "OFFLINE" then
            return B ("D0BDD0B5D0B4D0BED181D182D183D0BFD0BDD0B0");
         end if;
         if Token = "DEGRADED" then
            return B ("D0B4D0B5D0B3D180D0B0D0B4D0B8D180D0BED0B2D0B0D0BDD0B0");
         end if;
         if Token = "MIGRATING" then
            return B ("D0BCD0B8D0B3D180D0B8D180D183D0B5D182");
         end if;
         if Token = "MIGRATION" then
            return B ("D0BCD0B8D0B3D180D0B0D186D0B8D18F");
         end if;
         if Token = "REPLICATING" then
            return B ("D180D0B5D0BFD0BBD0B8D186D0B8D180D183D0B5D182D181D18F");
         end if;
         if Token = "REPLICATION" then
            return B ("D180D0B5D0BFD0BBD0B8D0BAD0B0D186D0B8D18F");
         end if;
         if Token = "LAGGING" then
            return B ("D0BED182D181D182D0B0D0B5D182");
         end if;
         if Token = "BACKUP" then
            return B
              ("D180D0B5D0B7D0B5D180D0B2D0BDD0BED0B520D0BA"
               & "D0BED0BFD0B8D180D0BED0B2D0B0D0BDD0B8D0B5");
         end if;
         if Token = "RUNNING" then
            return B ("D0B2D18BD0BFD0BED0BBD0BDD18FD0B5D182D181D18F");
         end if;
      elsif Locale = "uk" then
         if Token = "DATABASE" then
            return B ("D0B1D0B0D0B7D0B020D0B4D0B0D0BDD0B8D185");
         end if;
         if Token = "ONLINE" then
            return B ("D0B4D0BED181D182D183D0BFD0BDD0B0");
         end if;
         if Token = "OFFLINE" then
            return B ("D0BDD0B5D0B4D0BED181D182D183D0BFD0BDD0B0");
         end if;
         if Token = "DEGRADED" then
            return B ("D0B4D0B5D0B3D180D0B0D0B4D0BED0B2D0B0D0BDD0B0");
         end if;
         if Token = "MIGRATING" then
            return B ("D0BCD196D0B3D180D183D194");
         end if;
         if Token = "MIGRATION" then
            return B ("D0BCD196D0B3D180D0B0D186D196D18F");
         end if;
         if Token = "REPLICATING" then
            return B ("D180D0B5D0BFD0BBD196D0BAD183D194D182D18CD181D18F");
         end if;
         if Token = "REPLICATION" then
            return B ("D180D0B5D0BFD0BBD196D0BAD0B0D186D196D18F");
         end if;
         if Token = "LAGGING" then
            return B ("D0B2D196D0B4D181D182D0B0D194");
         end if;
         if Token = "BACKUP" then
            return B
              ("D180D0B5D0B7D0B5D180D0B2D0BDD0B520D0BA"
               & "D0BED0BFD196D18ED0B2D0B0D0BDD0BDD18F");
         end if;
         if Token = "RUNNING" then
            return B ("D0B2D0B8D0BAD0BED0BDD183D194D182D18CD181D18F");
         end if;
      elsif Locale = "ja" then
         if Token = "DATABASE" then
            return B ("E38387E383BCE382BFE38399E383BCE382B9");
         end if;
         if Token = "ONLINE" then
            return B ("E382AAE383B3E383A9E382A4E383B3");
         end if;
         if Token = "OFFLINE" then
            return B ("E382AAE38395E383A9E382A4E383B3");
         end if;
         if Token = "DEGRADED" then
            return B ("E58AA3E58C96");
         end if;
         if Token = "MIGRATING" then
            return B ("E7A7BBE8A18CE4B8AD");
         end if;
         if Token = "MIGRATION" then
            return B ("E7A7BBE8A18C");
         end if;
         if Token = "REPLICATING" then
            return B ("E383ACE38397E383AAE382B1E383BCE38388E4B8AD");
         end if;
         if Token = "REPLICATION" then
            return B ("E383ACE38397E383AAE382B1E383BCE382B7E383A7E383B3");
         end if;
         if Token = "LAGGING" then
            return B ("E98185E5BBB6");
         end if;
         if Token = "BACKUP" then
            return B ("E38390E38383E382AFE382A2E38383E38397");
         end if;
         if Token = "RUNNING" then
            return B ("E5AE9FE8A18CE4B8AD");
         end if;
      elsif Locale = "ko" then
         if Token = "DATABASE" then
            return B ("EB8DB0EC9DB4ED84B0EBB2A0EC9DB4EC8AA4");
         end if;
         if Token = "ONLINE" then
            return B ("EC98A8EB9DBCEC9DB8");
         end if;
         if Token = "OFFLINE" then
            return B ("EC98A4ED9484EB9DBCEC9DB8");
         end if;
         if Token = "DEGRADED" then
            return B ("EC8000ED9598EB90A8");
         end if;
         if Token = "MIGRATING" then
            return B ("ECA09CEC9DB4EAB7B8EBA088EC9DB4EC8598E4B8AD");
         end if;
         if Token = "MIGRATION" then
            return B ("EBA788EC9DB4EAB7B8EBA088EC9DB4EC8598");
         end if;
         if Token = "REPLICATING" then
            return B ("EBA088ED948CEB9FACEBA6ACEC9DB4ECBC80EC9DB4EC8598E4B8AD");
         end if;
         if Token = "REPLICATION" then
            return B ("EBA088ED948CEB9FACEBA6ACEC9DB4ECBC80EC9DB4EC8598");
         end if;
         if Token = "LAGGING" then
            return B ("ECA780EC97B0");
         end if;
         if Token = "BACKUP" then
            return B ("EBB0B1EC9785");
         end if;
         if Token = "RUNNING" then
            return B ("EC8BA4ED9689E4B8AD");
         end if;
      elsif Locale = "zh" then
         if Token = "DATABASE" then
            return B ("E695B0E68DAEE5BA93");
         end if;
         if Token = "ONLINE" then
            return B ("E59CA8E7BABF");
         end if;
         if Token = "OFFLINE" then
            return B ("E7A6BBE7BABF");
         end if;
         if Token = "DEGRADED" then
            return B ("E9998DE7BAA7");
         end if;
         if Token = "MIGRATING" then
            return B ("E8BF81E7A7BBE4B8AD");
         end if;
         if Token = "MIGRATION" then
            return B ("E8BF81E7A7BB");
         end if;
         if Token = "REPLICATING" then
            return B ("E5A48DE588B6E4B8AD");
         end if;
         if Token = "REPLICATION" then
            return B ("E5A48DE588B6");
         end if;
         if Token = "LAGGING" then
            return B ("E6BB9EE5908E");
         end if;
         if Token = "BACKUP" then
            return B ("E5A487E4BBBD");
         end if;
         if Token = "RUNNING" then
            return B ("E8BF90E8A18CE4B8AD");
         end if;
      elsif Locale = "ar" then
         if Token = "DATABASE" then
            return B ("D982D8A7D8B9D8AFD8A920D8A8D98AD8A7D986D8A7D8AA");
         end if;
         if Token = "ONLINE" then
            return B ("D985D8AAD8B5D984D8A9");
         end if;
         if Token = "OFFLINE" then
            return B ("D8BAD98AD8B120D985D8AAD8B5D984D8A9");
         end if;
         if Token = "DEGRADED" then
            return B ("D985D8AAD8AFD987D988D8B1D8A9");
         end if;
         if Token = "MIGRATING" then
            return B ("D982D98AD8AF20D8A7D984D8AAD8B1D8ADD98AD984");
         end if;
         if Token = "MIGRATION" then
            return B ("D8AAD8B1D8ADD98AD984");
         end if;
         if Token = "REPLICATING" then
            return B ("D982D98AD8AF20D8A7D984D986D8B3D8AE");
         end if;
         if Token = "REPLICATION" then
            return B ("D986D8B3D8AE");
         end if;
         if Token = "LAGGING" then
            return B ("D985D8AAD8A3D8AED8B1");
         end if;
         if Token = "BACKUP" then
            return B ("D986D8B3D8AE20D8A7D8ADD8AAD98AD8A7D8B7D98A");
         end if;
         if Token = "RUNNING" then
            return B ("D982D98AD8AF20D8A7D984D8AAD986D981D98AD8B0");
         end if;
      elsif Locale = "hi" then
         if Token = "DATABASE" then
            return B ("E0A4A1E0A587E0A49FE0A4BEE0A4ACE0A587E0A4B8");
         end if;
         if Token = "ONLINE" then
            return B ("E0A491E0A4A8E0A4B2E0A4BEE0A487E0A4A8");
         end if;
         if Token = "OFFLINE" then
            return B ("E0A491E0A4ABE0A4B2E0A4BEE0A487E0A4A8");
         end if;
         if Token = "DEGRADED" then
            return B ("E0A485E0A4B5E0A4A8E0A4A4");
         end if;
         if Token = "MIGRATING" then
            return B ("E0A4AAE0A58DE0A4B0E0A4B5E0A4BEE0A4B8E0A4BFE0A4A4");
         end if;
         if Token = "MIGRATION" then
            return B ("E0A4AAE0A58DE0A4B0E0A4B5E0A4BEE0A4B8");
         end if;
         if Token = "REPLICATING" then
            return B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BFE0A495E0A583E0A4A4");
         end if;
         if Token = "REPLICATION" then
            return B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BFE0A495E0A583E0A4A4E0A4BF");
         end if;
         if Token = "LAGGING" then
            return B ("E0A4AAE0A580E0A49BE0A587");
         end if;
         if Token = "BACKUP" then
            return B ("E0A4ACE0A588E0A495E0A485E0A4AA");
         end if;
         if Token = "RUNNING" then
            return B ("E0A49AE0A4B2E0A4B0E0A4B9E0A4BE");
         end if;
      end if;

      return Ada.Characters.Handling.To_Lower (Token);
   end Database_Token_Text;

   function Token_Text (Locale, Token : String) return String is
   begin
      if Token in "DATABASE" | "ONLINE" | "OFFLINE" | "DEGRADED"
        | "MIGRATING" | "MIGRATION" | "REPLICATING" | "REPLICATION"
        | "LAGGING" | "BACKUP" | "RUNNING"
      then
         return Database_Token_Text (Locale, Token);
      end if;

      if Locale = "da" then
         if Token = "EMPTY" then
            return "tom";
         end if;
         if Token = "LOADING" then
            return "indlaeser";
         end if;
         if Token = "SAVING" then
            return "gemmer";
         end if;
         if Token = "SAVED" then
            return "gemt";
         end if;
         if Token = "FAILED" then
            return "mislykket";
         end if;
         if Token = "PERMISSION" then
            return "adgang";
         end if;
         if Token = "DENIED" then
            return B ("6EC3A667746574");
         end if;
         if Token = "PIPELINE" then
            return "pipeline";
         end if;
         if Token = "PAYMENT" then
            return "betaling";
         end if;
         if Token = "REQUIRES" then
            return B ("6B72C3A6766572");
         end if;
         if Token = "ACTION" then
            return "handling";
         end if;
      elsif Locale = "es" then
         if Token = "EMPTY" then
            return B ("766163C3AD6F");
         end if;
         if Token = "LOADING" then
            return "cargando";
         end if;
         if Token = "SAVING" then
            return "guardando";
         end if;
         if Token = "SAVED" then
            return "guardado";
         end if;
         if Token = "FAILED" then
            return "fallido";
         end if;
         if Token = "PERMISSION" then
            return "permiso";
         end if;
         if Token = "DENIED" then
            return "denegado";
         end if;
         if Token = "PIPELINE" then
            return "pipeline";
         end if;
         if Token = "PAYMENT" then
            return "pago";
         end if;
         if Token = "REQUIRES" then
            return "requiere";
         end if;
         if Token = "ACTION" then
            return B ("61636369C3B36E");
         end if;
      elsif Locale = "it" then
         if Token = "EMPTY" then
            return "vuoto";
         end if;
         if Token = "LOADING" then
            return "caricamento";
         end if;
         if Token = "SAVING" then
            return "salvataggio";
         end if;
         if Token = "SAVED" then
            return "salvato";
         end if;
         if Token = "FAILED" then
            return "fallito";
         end if;
         if Token = "PERMISSION" then
            return "permesso";
         end if;
         if Token = "DENIED" then
            return "negato";
         end if;
         if Token = "PIPELINE" then
            return "pipeline";
         end if;
         if Token = "PAYMENT" then
            return "pagamento";
         end if;
         if Token = "REQUIRES" then
            return "richiede";
         end if;
         if Token = "ACTION" then
            return "azione";
         end if;
      elsif Locale = "pt" then
         if Token = "EMPTY" then
            return "vazio";
         end if;
         if Token = "LOADING" then
            return "carregando";
         end if;
         if Token = "SAVING" then
            return "salvando";
         end if;
         if Token = "SAVED" then
            return "salvo";
         end if;
         if Token = "FAILED" then
            return "falhou";
         end if;
         if Token = "PERMISSION" then
            return B ("7065726D697373C3A36F");
         end if;
         if Token = "DENIED" then
            return "negada";
         end if;
         if Token = "PIPELINE" then
            return "pipeline";
         end if;
         if Token = "PAYMENT" then
            return "pagamento";
         end if;
         if Token = "REQUIRES" then
            return "requer";
         end if;
         if Token = "ACTION" then
            return B ("61C3A7C3A36F");
         end if;
      elsif Locale = "nl" then
         if Token = "EMPTY" then
            return "leeg";
         end if;
         if Token = "LOADING" then
            return "laden";
         end if;
         if Token = "SAVING" then
            return "opslaan";
         end if;
         if Token = "SAVED" then
            return "opgeslagen";
         end if;
         if Token = "FAILED" then
            return "mislukt";
         end if;
         if Token = "PERMISSION" then
            return "toegang";
         end if;
         if Token = "DENIED" then
            return "geweigerd";
         end if;
         if Token = "PIPELINE" then
            return "pipeline";
         end if;
         if Token = "PAYMENT" then
            return "betaling";
         end if;
         if Token = "REQUIRES" then
            return "vereist";
         end if;
         if Token = "ACTION" then
            return "actie";
         end if;
      elsif Locale = "sv" then
         if Token = "EMPTY" then
            return "tom";
         end if;
         if Token = "LOADING" then
            return "laddar";
         end if;
         if Token = "SAVING" then
            return "sparar";
         end if;
         if Token = "SAVED" then
            return "sparad";
         end if;
         if Token = "FAILED" then
            return "misslyckades";
         end if;
         if Token = "PERMISSION" then
            return B ("C3A5746B6F6D7374");
         end if;
         if Token = "DENIED" then
            return "nekad";
         end if;
         if Token = "PIPELINE" then
            return "pipeline";
         end if;
         if Token = "PAYMENT" then
            return "betalning";
         end if;
         if Token = "REQUIRES" then
            return B ("6B72C3A4766572");
         end if;
         if Token = "ACTION" then
            return B ("C3A57467C3A47264");
         end if;
      elsif Locale in "no" | "nb" then
         if Token = "EMPTY" then
            return "tom";
         end if;
         if Token = "LOADING" then
            return "laster";
         end if;
         if Token = "SAVING" then
            return "lagrer";
         end if;
         if Token = "SAVED" then
            return "lagret";
         end if;
         if Token = "FAILED" then
            return "mislyktes";
         end if;
         if Token = "PERMISSION" then
            return "tilgang";
         end if;
         if Token = "DENIED" then
            return "nektet";
         end if;
         if Token = "PIPELINE" then
            return "pipeline";
         end if;
         if Token = "PAYMENT" then
            return "betaling";
         end if;
         if Token = "REQUIRES" then
            return "krever";
         end if;
         if Token = "ACTION" then
            return "handling";
         end if;
      elsif Locale = "fi" then
         if Token = "EMPTY" then
            return B ("7479686AC3A4");
         end if;
         if Token = "LOADING" then
            return "ladataan";
         end if;
         if Token = "SAVING" then
            return "tallennetaan";
         end if;
         if Token = "SAVED" then
            return "tallennettu";
         end if;
         if Token = "FAILED" then
            return "epaonnistui";
         end if;
         if Token = "PERMISSION" then
            return "lupa";
         end if;
         if Token = "DENIED" then
            return "estetty";
         end if;
         if Token = "PIPELINE" then
            return "putki";
         end if;
         if Token = "PAYMENT" then
            return "maksu";
         end if;
         if Token = "REQUIRES" then
            return "vaatii";
         end if;
         if Token = "ACTION" then
            return "toimen";
         end if;
      elsif Locale = "pl" then
         if Token = "EMPTY" then
            return "pusty";
         end if;
         if Token = "LOADING" then
            return "ladowanie";
         end if;
         if Token = "SAVING" then
            return "zapisywanie";
         end if;
         if Token = "SAVED" then
            return "zapisano";
         end if;
         if Token = "FAILED" then
            return "niepowodzenie";
         end if;
         if Token = "PERMISSION" then
            return "uprawnienie";
         end if;
         if Token = "DENIED" then
            return "odmowa";
         end if;
         if Token = "PIPELINE" then
            return "potok";
         end if;
         if Token = "PAYMENT" then
            return B ("70C58261746E6FC59BC487");
         end if;
         if Token = "REQUIRES" then
            return "wymaga";
         end if;
         if Token = "ACTION" then
            return "dzialania";
         end if;
      elsif Locale = "cs" then
         if Token = "EMPTY" then
            return B ("7072C3A17A646EC3BD");
         end if;
         if Token = "LOADING" then
            return B ("6E61C48D6974C3A16EC3AD");
         end if;
         if Token = "SAVING" then
            return B ("756B6CC3A164C3A16EC3AD");
         end if;
         if Token = "SAVED" then
            return B ("756C6FC5BE656E6F");
         end if;
         if Token = "FAILED" then
            return "selhalo";
         end if;
         if Token = "PERMISSION" then
            return B ("6F7072C3A1766EC49B6EC3AD");
         end if;
         if Token = "DENIED" then
            return "odmitnuto";
         end if;
         if Token = "PIPELINE" then
            return "pipeline";
         end if;
         if Token = "PAYMENT" then
            return "platba";
         end if;
         if Token = "REQUIRES" then
            return B ("7679C5BE6164756A65");
         end if;
         if Token = "ACTION" then
            return "akci";
         end if;
      elsif Locale = "tr" then
         if Token = "EMPTY" then
            return B ("626FC59F");
         end if;
         if Token = "LOADING" then
            return B ("79C3BC6B6C656E69796F72");
         end if;
         if Token = "SAVING" then
            return "kaydediliyor";
         end if;
         if Token = "SAVED" then
            return "kaydedildi";
         end if;
         if Token = "FAILED" then
            return B ("6261C59F6172C4B173C4B17A");
         end if;
         if Token = "PERMISSION" then
            return "izin";
         end if;
         if Token = "DENIED" then
            return "reddedildi";
         end if;
         if Token = "PIPELINE" then
            return "hat";
         end if;
         if Token = "PAYMENT" then
            return B ("C3B664656D65");
         end if;
         if Token = "REQUIRES" then
            return "gerektirir";
         end if;
         if Token = "ACTION" then
            return "eylem";
         end if;
      elsif Locale = "ru" then
         if Token = "EMPTY" then
            return B ("D0BFD183D181D182D0BE");
         end if;
         if Token = "LOADING" then
            return B ("D0B7D0B0D0B3D180D183D0B7D0BAD0B0");
         end if;
         if Token = "SAVING" then
            return B ("D181D0BED185D180D0B0D0BDD0B5D0BDD0B8D0B5");
         end if;
         if Token = "SAVED" then
            return B ("D181D0BED185D180D0B0D0BDD0B5D0BDD0BE");
         end if;
         if Token = "FAILED" then
            return B ("D181D0B1D0BED0B9");
         end if;
         if Token = "PERMISSION" then
            return B ("D0B4D0BED181D182D183D0BF");
         end if;
         if Token = "DENIED" then
            return B ("D0B7D0B0D0BFD180D0B5D189D0B5D0BD");
         end if;
         if Token = "PIPELINE" then
            return B ("D0BAD0BED0BDD0B2D0B5D0B9D0B5D180");
         end if;
         if Token = "PAYMENT" then
            return B ("D0BFD0BBD0B0D182D0B5D0B6");
         end if;
         if Token = "REQUIRES" then
            return B ("D182D180D0B5D0B1D183D0B5D182");
         end if;
         if Token = "ACTION" then
            return B ("D0B4D0B5D0B9D181D182D0B2D0B8D0B5");
         end if;
      elsif Locale = "uk" then
         if Token = "EMPTY" then
            return B ("D0BFD183D181D182D0BE");
         end if;
         if Token = "LOADING" then
            return B ("D0B7D0B0D0B2D0B0D0BDD182D0B0D0B6D0B5D0BDD0BDD18F");
         end if;
         if Token = "SAVING" then
            return B ("D0B7D0B1D0B5D180D0B5D0B6D0B5D0BDD0BDD18F");
         end if;
         if Token = "SAVED" then
            return B ("D0B7D0B1D0B5D180D0B5D0B6D0B5D0BDD0BE");
         end if;
         if Token = "FAILED" then
            return B ("D0B7D0B1D196D0B9");
         end if;
         if Token = "PERMISSION" then
            return B ("D0B4D0BED181D182D183D0BF");
         end if;
         if Token = "DENIED" then
            return B ("D0B7D0B0D0B1D0BED180D0BED0BDD0B5D0BDD0BE");
         end if;
         if Token = "PIPELINE" then
            return B ("D0BAD0BED0BDD0B2D0B5D194D180");
         end if;
         if Token = "PAYMENT" then
            return B ("D0BFD0BBD0B0D182D196D0B6");
         end if;
         if Token = "REQUIRES" then
            return B ("D0BFD0BED182D180D0B5D0B1D183D194");
         end if;
         if Token = "ACTION" then
            return B ("D0B4D196D197");
         end if;
      elsif Locale = "ja" then
         if Token = "EMPTY" then
            return B ("E7A9BA");
         end if;
         if Token = "LOADING" then
            return B ("E8AAADE381BFE8BEBCE381BFE4B8AD");
         end if;
         if Token = "SAVING" then
            return B ("E4BF9DE5AD98E4B8AD");
         end if;
         if Token = "SAVED" then
            return B ("E4BF9DE5AD98E6B888E381BF");
         end if;
         if Token = "FAILED" then
            return B ("E5A4B1E69597");
         end if;
         if Token = "PERMISSION" then
            return B ("E6A8A9E99990");
         end if;
         if Token = "DENIED" then
            return B ("E68B92E590A6");
         end if;
         if Token = "PIPELINE" then
            return B ("E38391E382A4E38397E383A9E382A4E383B3");
         end if;
         if Token = "PAYMENT" then
            return B ("E694AFE68995E38184");
         end if;
         if Token = "REQUIRES" then
            return B ("E8A681");
         end if;
         if Token = "ACTION" then
            return B ("E5AFBEE5BF9C");
         end if;
      elsif Locale = "ko" then
         if Token = "EMPTY" then
            return B ("EBB984EC9684EC9E88EC9D8C");
         end if;
         if Token = "LOADING" then
            return B ("EBA19CEB939CE4B8AD");
         end if;
         if Token = "SAVING" then
            return B ("ECB880EC9EA5E4B8AD");
         end if;
         if Token = "SAVED" then
            return B ("ECB880EC9EA5EB90A8");
         end if;
         if Token = "FAILED" then
            return B ("EC8BA4ED8CA8");
         end if;
         if Token = "PERMISSION" then
            return B ("EAB68CEB8F84");
         end if;
         if Token = "DENIED" then
            return B ("EAB1B0EBB680EB90A8");
         end if;
         if Token = "PIPELINE" then
            return B ("ED8C8CEC9DB4ED948CEB9DBC");
         end if;
         if Token = "PAYMENT" then
            return B ("EAB2B0ECA09C");
         end if;
         if Token = "REQUIRES" then
            return B ("ED9584EC9A94");
         end if;
         if Token = "ACTION" then
            return B ("ECA791EC9785");
         end if;
      elsif Locale = "zh" then
         if Token = "EMPTY" then
            return B ("E7A9BA");
         end if;
         if Token = "LOADING" then
            return B ("E58AA0E8BDBDE4B8AD");
         end if;
         if Token = "SAVING" then
            return B ("E4BF9DE5AD98E4B8AD");
         end if;
         if Token = "SAVED" then
            return B ("E5B7B2E4BF9DE5AD98");
         end if;
         if Token = "FAILED" then
            return B ("E5A4B1E8B4A5");
         end if;
         if Token = "PERMISSION" then
            return B ("E69D83E99990");
         end if;
         if Token = "DENIED" then
            return B ("E8A2ABE68B92");
         end if;
         if Token = "PIPELINE" then
            return B ("E6B581E6B0B4E7BABF");
         end if;
         if Token = "PAYMENT" then
            return B ("E694AFE4BB98");
         end if;
         if Token = "REQUIRES" then
            return B ("E99C80E8A681");
         end if;
         if Token = "ACTION" then
            return B ("E6938DE4BD9C");
         end if;
      elsif Locale = "ar" then
         if Token = "EMPTY" then
            return B ("D981D8A7D8B1D8BA");
         end if;
         if Token = "LOADING" then
            return B ("D8ACD8A7D8B120D8A7D984D8AAD8ADD985D98AD984");
         end if;
         if Token = "SAVING" then
            return B ("D8ACD8A7D8B120D8A7D984D8ADD981D8B8");
         end if;
         if Token = "SAVED" then
            return B ("D985D8ADD981D988D8B8");
         end if;
         if Token = "FAILED" then
            return B ("D981D8B4D984");
         end if;
         if Token = "PERMISSION" then
            return B ("D8A5D8B0D986");
         end if;
         if Token = "DENIED" then
            return B ("D985D8B1D981D988D8B6");
         end if;
         if Token = "PIPELINE" then
            return B ("D8AED8B720D8A7D984D8AAD986D981D98AD8B0");
         end if;
         if Token = "PAYMENT" then
            return B ("D8AFD981D8B9");
         end if;
         if Token = "REQUIRES" then
            return B ("D98AD8AAD8B7D984D8A8");
         end if;
         if Token = "ACTION" then
            return B ("D8A5D8ACD8B1D8A7D8A1");
         end if;
      elsif Locale = "hi" then
         if Token = "EMPTY" then
            return B ("E0A496E0A4BEE0A4B2E0A580");
         end if;
         if Token = "LOADING" then
            return B ("E0A4B2E0A58BE0A4A120E0A4B9E0A58B20E0A4B0E0A4B9E0A4BE");
         end if;
         if Token = "SAVING" then
            return B ("E0A4B8E0A4B9E0A587E0A49CE0A4BE20E0A49CE0A4BE20E0A4B0E0A4B9E0A4BE");
         end if;
         if Token = "SAVED" then
            return B ("E0A4B8E0A4B9E0A587E0A49CE0A4BE20E0A497E0A4AFE0A4BE");
         end if;
         if Token = "FAILED" then
            return B ("E0A485E0A4B8E0A4ABE0A4B2");
         end if;
         if Token = "PERMISSION" then
            return B ("E0A485E0A4A8E0A581E0A4AEE0A4A4E0A4BF");
         end if;
         if Token = "DENIED" then
            return B ("E0A485E0A4B8E0A58DE0A4B5E0A580E0A495E0A583E0A4A4");
         end if;
         if Token = "PIPELINE" then
            return B ("E0A4AAE0A4BEE0A487E0A4AAE0A4B2E0A4BEE0A487E0A4A8");
         end if;
         if Token = "PAYMENT" then
            return B ("E0A4ADE0A581E0A497E0A4A4E0A4BEE0A4A8");
         end if;
         if Token = "REQUIRES" then
            return B ("E0A486E0A4B5E0A4B6E0A58DE0A4AFE0A495");
         end if;
         if Token = "ACTION" then
            return B ("E0A495E0A4BEE0A4B0E0A58DE0A4B0E0A4B5E0A4BEE0A488");
         end if;
      end if;

      return Ada.Characters.Handling.To_Lower (Token);
   end Token_Text;

   function Generated_Phrase (Locale, Image : String) return String is
      Result : Unbounded_String;
      First  : Positive := Image'First;
      Sep    : constant String := Phrase_Separator (Locale);

      procedure Add_Token (Last : Natural) is
         Token : constant String := Image (First .. Last);
      begin
         if Length (Result) > 0 then
            Append (Result, Sep);
         end if;
         Append (Result, Token_Text (Locale, Token));
      end Add_Token;
   begin
      for I in Image'Range loop
         if Image (I) = '_' then
            if I > First then
               Add_Token (I - 1);
            end if;
            First := I + 1;
         end if;
      end loop;

      if First <= Image'Last then
         Add_Token (Image'Last);
      end if;

      return To_String (Result);
   end Generated_Phrase;

   function Status_Key
     (Status : UI_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String (Key_Text ("ui", UI_Status'Image (Status))),
         Key => Humanize.Messages.No_Message);
   end Status_Key;

   function CI_Key
     (Status : CI_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String (Key_Text ("ci", CI_Status'Image (Status))),
         Key => Humanize.Messages.No_Message);
   end CI_Key;

   function Ticket_Key
     (Status : Ticket_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (Key_Text ("ticket", Ticket_Status'Image (Status))),
         Key => Humanize.Messages.No_Message);
   end Ticket_Key;

   function Payment_Lifecycle_Key
     (Status : Payment_Lifecycle_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (Key_Text ("payment", Payment_Lifecycle_Status'Image (Status))),
         Key => Humanize.Messages.No_Message);
   end Payment_Lifecycle_Key;

   function Backup_Key
     (Status : Backup_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (Key_Text ("backup", Backup_Status'Image (Status))),
         Key => Humanize.Messages.No_Message);
   end Backup_Key;

   function Incident_Key
     (Status : Incident_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (Key_Text ("incident", Incident_Status'Image (Status))),
         Key => Humanize.Messages.No_Message);
   end Incident_Key;

   function Release_Key
     (Status : Release_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (Key_Text ("release", Release_Status'Image (Status))),
         Key => Humanize.Messages.No_Message);
   end Release_Key;

   function Audit_Key
     (Status : Audit_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Key_Text ("audit", Audit_Status'Image (Status)));
   end Audit_Key;

   function Feature_Flag_Key
     (Status : Feature_Flag_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Key_Text ("flag", Feature_Flag_Status'Image (Status)));
   end Feature_Flag_Key;

   function Webhook_Key
     (Status : Webhook_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Key_Text ("webhook", Webhook_Status'Image (Status)));
   end Webhook_Key;

   function API_Key_Key
     (Status : API_Key_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Key_Text ("api_key", API_Key_Status'Image (Status)));
   end API_Key_Key;

   function Quota_Key
     (Status : Quota_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Key_Text ("quota", Quota_Status'Image (Status)));
   end Quota_Key;

   function Invoice_Key
     (Status : Invoice_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Key_Text ("invoice", Invoice_Status'Image (Status)));
   end Invoice_Key;

   function Phrase_Text
     (Locale : String;
      Status : UI_Status)
      return String
   is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, UI_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Empty => return "leer";
            when Loading => return "wird geladen";
            when Saving => return "wird gespeichert";
            when Saved => return "gespeichert";
            when Unsaved => return "ungespeichert";
            when Retrying => return "erneuter Versuch";
            when Paused => return "pausiert";
            when Complete => return "abgeschlossen";
            when Failed => return "fehlgeschlagen";
            when Due_Soon => return "bald fallig";
            when Overdue => return "uberfallig";
            when Last_Seen => return "zuletzt gesehen";
            when Updated_Just_Now => return "gerade aktualisiert";
         end case;
      elsif Locale = "fr" then
         case Status is
            when Empty => return "vide";
            when Loading => return "chargement";
            when Saving => return "enregistrement";
            when Saved => return "enregistre";
            when Unsaved => return "non enregistre";
            when Retrying => return "nouvel essai";
            when Paused => return "en pause";
            when Complete => return "termine";
            when Failed => return "echec";
            when Due_Soon => return "bientot du";
            when Overdue => return "en retard";
            when Last_Seen => return "vu recemment";
            when Updated_Just_Now => return "mis a jour a l'instant";
         end case;
      else
         case Status is
            when Empty => return "empty";
            when Loading => return "loading";
            when Saving => return "saving";
            when Saved => return "saved";
            when Unsaved => return "unsaved";
            when Retrying => return "retrying";
            when Paused => return "paused";
            when Complete => return "complete";
            when Failed => return "failed";
            when Due_Soon => return "due soon";
            when Overdue => return "overdue";
            when Last_Seen => return "last seen";
            when Updated_Just_Now => return "updated just now";
         end case;
      end if;
   end Phrase_Text;

   function File_Text (Locale : String; Status : File_Status) return String is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, File_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Uploading => return "wird hochgeladen";
            when Downloading => return "wird heruntergeladen";
            when Copying => return "wird kopiert";
            when Moving => return "wird verschoben";
            when Deleting => return "wird geloscht";
            when Deleted => return "geloscht";
            when Restoring => return "wird wiederhergestellt";
            when Synced => return "synchronisiert";
         end case;
      else
         case Status is
            when Uploading => return "uploading";
            when Downloading => return "downloading";
            when Copying => return "copying";
            when Moving => return "moving";
            when Deleting => return "deleting";
            when Deleted => return "deleted";
            when Restoring => return "restoring";
            when Synced => return "synced";
         end case;
      end if;
   end File_Text;

   function Validation_Text
     (Locale : String;
      Status : Validation_Status)
      return String
   is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Validation_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Required => return "erforderlich";
            when Optional => return "optional";
            when Invalid => return "ungultig";
            when Too_Short => return "zu kurz";
            when Too_Long => return "zu lang";
            when Out_Of_Range => return "ausserhalb des Bereichs";
            when Already_Exists => return "existiert bereits";
         end case;
      else
         case Status is
            when Required => return "required";
            when Optional => return "optional";
            when Invalid => return "invalid";
            when Too_Short => return "too short";
            when Too_Long => return "too long";
            when Out_Of_Range => return "out of range";
            when Already_Exists => return "already exists";
         end case;
      end if;
   end Validation_Text;

   function Empty_Text (Locale : String; State : Empty_State) return String is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Empty_State'Image (State));
      elsif Locale = "de" then
         case State is
            when No_Items => return "keine Elemente";
            when No_Results => return "keine Ergebnisse";
            when No_Messages => return "keine Nachrichten";
            when No_Selection => return "keine Auswahl";
            when Nothing_To_Show => return "nichts anzuzeigen";
         end case;
      else
         case State is
            when No_Items => return "no items";
            when No_Results => return "no results";
            when No_Messages => return "no messages";
            when No_Selection => return "no selection";
            when Nothing_To_Show => return "nothing to show";
         end case;
      end if;
   end Empty_Text;

   function Network_Text
     (Locale : String;
      Status : Network_Status)
      return String
   is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Network_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Offline => return "offline";
            when Online => return "online";
            when Connecting => return "Verbindung wird hergestellt";
            when Syncing => return "wird synchronisiert";
            when Sync_Failed => return "Synchronisierung fehlgeschlagen";
            when Permission_Denied => return "Zugriff verweigert";
            when Read_Only => return "schreibgeschutzt";
         end case;
      else
         case Status is
            when Offline => return "offline";
            when Online => return "online";
            when Connecting => return "connecting";
            when Syncing => return "syncing";
            when Sync_Failed => return "sync failed";
            when Permission_Denied => return "permission denied";
            when Read_Only => return "read only";
         end case;
      end if;
   end Network_Text;

   function Auth_Text (Locale : String; Status : Auth_Status) return String is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Auth_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Signed_In => return "angemeldet";
            when Signed_Out => return "abgemeldet";
            when Session_Expired => return "Sitzung abgelaufen";
            when Locked => return "gesperrt";
            when Two_Factor_Required => return "Zwei-Faktor erforderlich";
         end case;
      else
         case Status is
            when Signed_In => return "signed in";
            when Signed_Out => return "signed out";
            when Session_Expired => return "session expired";
            when Locked => return "locked";
            when Two_Factor_Required => return "two-factor required";
         end case;
      end if;
   end Auth_Text;

   function Billing_Text
     (Locale : String;
      Status : Billing_Status)
      return String
   is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Billing_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Trialing => return "Testphase";
            when Payment_Due => return "Zahlung fallig";
            when Payment_Failed => return "Zahlung fehlgeschlagen";
            when Paid => return "bezahlt";
            when Past_Due => return "uberfallig";
            when Canceled => return "gekundigt";
         end case;
      else
         case Status is
            when Trialing => return "trialing";
            when Payment_Due => return "payment due";
            when Payment_Failed => return "payment failed";
            when Paid => return "paid";
            when Past_Due => return "past due";
            when Canceled => return "canceled";
         end case;
      end if;
   end Billing_Text;

   function Workflow_Text
     (Locale : String;
      Status : Workflow_Status)
      return String
   is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Workflow_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Draft => return "Entwurf";
            when In_Review => return "in Prufung";
            when Approved => return "genehmigt";
            when Rejected => return "abgelehnt";
            when Published => return "veroffentlicht";
            when Archived => return "archiviert";
         end case;
      else
         case Status is
            when Draft => return "draft";
            when In_Review => return "in review";
            when Approved => return "approved";
            when Rejected => return "rejected";
            when Published => return "published";
            when Archived => return "archived";
         end case;
      end if;
   end Workflow_Text;

   function Queue_Text (Locale : String; Status : Queue_Status) return String is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Queue_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Queued => return "in Warteschlange";
            when Running => return "laufend";
            when Waiting => return "wartend";
            when Blocked => return "blockiert";
            when Canceled_Job => return "Auftrag abgebrochen";
            when Completed_Job => return "Auftrag abgeschlossen";
         end case;
      else
         case Status is
            when Queued => return "queued";
            when Running => return "running";
            when Waiting => return "waiting";
            when Blocked => return "blocked";
            when Canceled_Job => return "job canceled";
            when Completed_Job => return "job completed";
         end case;
      end if;
   end Queue_Text;

   function Security_Text
     (Locale : String;
      Status : Security_Status)
      return String
   is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Security_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Secure => return "sicher";
            when Insecure => return "unsicher";
            when Vulnerable => return "verwundbar";
            when Encrypted => return "verschlusselt";
            when Unencrypted => return "unverschlusselt";
            when Token_Expired => return "Token abgelaufen";
         end case;
      else
         case Status is
            when Secure => return "secure";
            when Insecure => return "insecure";
            when Vulnerable => return "vulnerable";
            when Encrypted => return "encrypted";
            when Unencrypted => return "unencrypted";
            when Token_Expired => return "token expired";
         end case;
      end if;
   end Security_Text;

   function Deployment_Text
     (Locale : String;
      Status : Deployment_Status)
      return String
   is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Deployment_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Deploying => return "Bereitstellung lauft";
            when Deployed => return "bereitgestellt";
            when Rolling_Back => return "Rollback lauft";
            when Rolled_Back => return "zuruckgesetzt";
            when Build_Failed => return "Build fehlgeschlagen";
            when Checks_Passed => return "Prufungen bestanden";
         end case;
      else
         case Status is
            when Deploying => return "deploying";
            when Deployed => return "deployed";
            when Rolling_Back => return "rolling back";
            when Rolled_Back => return "rolled back";
            when Build_Failed => return "build failed";
            when Checks_Passed => return "checks passed";
         end case;
      end if;
   end Deployment_Text;

   function Health_Text
     (Locale : String;
      Status : Health_Status)
      return String
   is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Health_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Healthy => return "gesund";
            when Degraded => return "eingeschrankt";
            when Unhealthy => return "ungesund";
            when Incident => return "Storung";
            when Maintenance => return "Wartung";
            when Recovering => return "erholt sich";
         end case;
      else
         case Status is
            when Healthy => return "healthy";
            when Degraded => return "degraded";
            when Unhealthy => return "unhealthy";
            when Incident => return "incident";
            when Maintenance => return "maintenance";
            when Recovering => return "recovering";
         end case;
      end if;
   end Health_Text;

   function Notification_Text
     (Locale : String;
      Status : Notification_Status)
      return String
   is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Notification_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Unread => return "ungelesen";
            when Read => return "gelesen";
            when Muted => return "stummgeschaltet";
            when Snoozed => return "zuruckgestellt";
            when Sent => return "gesendet";
            when Delivered => return "zugestellt";
         end case;
      else
         case Status is
            when Unread => return "unread";
            when Read => return "read";
            when Muted => return "muted";
            when Snoozed => return "snoozed";
            when Sent => return "sent";
            when Delivered => return "delivered";
         end case;
      end if;
   end Notification_Text;

   function Form_Text
     (Locale : String;
      Status : Form_Status)
      return String
   is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Form_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Valid_Input => return "gultige Eingabe";
            when Invalid_Input => return "ungultige Eingabe";
            when Dirty => return "geandert";
            when Pristine => return "unverandert";
            when Submitted => return "gesendet";
            when Submission_Failed => return "Senden fehlgeschlagen";
         end case;
      else
         case Status is
            when Valid_Input => return "valid input";
            when Invalid_Input => return "invalid input";
            when Dirty => return "changed";
            when Pristine => return "unchanged";
            when Submitted => return "submitted";
            when Submission_Failed => return "submission failed";
         end case;
      end if;
   end Form_Text;

   function Access_Text (Locale : String; Status : Access_Status) return String is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Access_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Allowed => return "erlaubt";
            when Denied => return "verweigert";
            when Owner => return "Besitzer";
            when Admin => return "Administrator";
            when Viewer => return "Betrachter";
            when Editor => return "Bearbeiter";
         end case;
      else
         case Status is
            when Allowed => return "allowed";
            when Denied => return "denied";
            when Owner => return "owner";
            when Admin => return "admin";
            when Viewer => return "viewer";
            when Editor => return "editor";
         end case;
      end if;
   end Access_Text;

   function Sync_Text (Locale : String; Status : Sync_Status) return String is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Sync_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Sync_Idle => return "Synchronisierung bereit";
            when Syncing_Now => return "Synchronisierung lauft";
            when Sync_Queued => return "Synchronisierung geplant";
            when Sync_Conflict => return "Synchronisierungskonflikt";
            when Sync_Complete => return "Synchronisierung abgeschlossen";
            when Sync_Error => return "Synchronisierungsfehler";
         end case;
      else
         case Status is
            when Sync_Idle => return "sync idle";
            when Syncing_Now => return "syncing now";
            when Sync_Queued => return "sync queued";
            when Sync_Conflict => return "sync conflict";
            when Sync_Complete => return "sync complete";
            when Sync_Error => return "sync error";
         end case;
      end if;
   end Sync_Text;

   function Transfer_Text
     (Locale : String;
      Status : Transfer_Status)
      return String
   is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Transfer_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Importing => return "Import lauft";
            when Imported => return "importiert";
            when Import_Failed => return "Import fehlgeschlagen";
            when Exporting => return "Export lauft";
            when Exported => return "exportiert";
            when Export_Failed => return "Export fehlgeschlagen";
         end case;
      else
         case Status is
            when Importing => return "importing";
            when Imported => return "imported";
            when Import_Failed => return "import failed";
            when Exporting => return "exporting";
            when Exported => return "exported";
            when Export_Failed => return "export failed";
         end case;
      end if;
   end Transfer_Text;

   function Search_Text (Locale : String; Status : Search_Status) return String is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Search_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Filtering => return "Filterung lauft";
            when Filtered => return "gefiltert";
            when No_Matches => return "keine Treffer";
            when Search_Ready => return "Suche bereit";
            when Search_Failed => return "Suche fehlgeschlagen";
            when Query_Too_Short => return "Suchanfrage zu kurz";
         end case;
      else
         case Status is
            when Filtering => return "filtering";
            when Filtered => return "filtered";
            when No_Matches => return "no matches";
            when Search_Ready => return "search ready";
            when Search_Failed => return "search failed";
            when Query_Too_Short => return "query too short";
         end case;
      end if;
   end Search_Text;

   function Collaboration_Text
     (Locale : String;
      Status : Collaboration_Status)
      return String
   is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Collaboration_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Active_Now => return "jetzt aktiv";
            when Away => return "abwesend";
            when Do_Not_Disturb => return "nicht storen";
            when Typing => return "tippt";
            when Viewing => return "sieht an";
            when Editing => return "bearbeitet";
         end case;
      else
         case Status is
            when Active_Now => return "active now";
            when Away => return "away";
            when Do_Not_Disturb => return "do not disturb";
            when Typing => return "typing";
            when Viewing => return "viewing";
            when Editing => return "editing";
         end case;
      end if;
   end Collaboration_Text;

   function Issue_Text (Locale : String; Status : Issue_Status) return String is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Issue_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Open => return "offen";
            when Closed => return "geschlossen";
            when Reopened => return "wieder geoffnet";
            when Assigned => return "zugewiesen";
            when Unassigned => return "nicht zugewiesen";
            when Merged => return "zusammengefuhrt";
         end case;
      else
         case Status is
            when Open => return "open";
            when Closed => return "closed";
            when Reopened => return "reopened";
            when Assigned => return "assigned";
            when Unassigned => return "unassigned";
            when Merged => return "merged";
         end case;
      end if;
   end Issue_Text;

   function Task_Text (Locale : String; Status : Task_Status) return String is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Task_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Todo => return "zu erledigen";
            when In_Progress => return "in Arbeit";
            when Done => return "erledigt";
            when Skipped => return "ubersprungen";
            when Blocked_Task => return "blockiert";
            when Waiting_On => return "wartet auf";
         end case;
      else
         case Status is
            when Todo => return "to do";
            when In_Progress => return "in progress";
            when Done => return "done";
            when Skipped => return "skipped";
            when Blocked_Task => return "blocked";
            when Waiting_On => return "waiting on";
         end case;
      end if;
   end Task_Text;

   function CI_Text (Locale : String; Status : CI_Status) return String is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, CI_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Pipeline_Pending => return "Pipeline ausstehend";
            when Pipeline_Running => return "Pipeline lauft";
            when Pipeline_Passed => return "Pipeline bestanden";
            when Pipeline_Failed => return "Pipeline fehlgeschlagen";
            when Review_Required => return "Review erforderlich";
            when Deploy_Blocked => return "Deployment blockiert";
         end case;
      else
         case Status is
            when Pipeline_Pending => return "pipeline pending";
            when Pipeline_Running => return "pipeline running";
            when Pipeline_Passed => return "pipeline passed";
            when Pipeline_Failed => return "pipeline failed";
            when Review_Required => return "review required";
            when Deploy_Blocked => return "deploy blocked";
         end case;
      end if;
   end CI_Text;

   function Ticket_Text
     (Locale : String;
      Status : Ticket_Status)
      return String
   is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Ticket_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Ticket_New => return "Ticket neu";
            when Ticket_Open => return "Ticket offen";
            when Ticket_Waiting => return "Ticket wartet";
            when Ticket_Escalated => return "Ticket eskaliert";
            when Ticket_Resolved => return "Ticket gelost";
            when Ticket_Closed => return "Ticket geschlossen";
         end case;
      else
         case Status is
            when Ticket_New => return "ticket new";
            when Ticket_Open => return "ticket open";
            when Ticket_Waiting => return "ticket waiting";
            when Ticket_Escalated => return "ticket escalated";
            when Ticket_Resolved => return "ticket resolved";
            when Ticket_Closed => return "ticket closed";
         end case;
      end if;
   end Ticket_Text;

   function Payment_Lifecycle_Text
     (Locale : String;
      Status : Payment_Lifecycle_Status)
      return String
   is
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase
           (Locale, Payment_Lifecycle_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Payment_Authorized => return "Zahlung autorisiert";
            when Payment_Captured => return "Zahlung eingezogen";
            when Payment_Refunded => return "Zahlung erstattet";
            when Payment_Disputed => return "Zahlung angefochten";
            when Payment_Requires_Action => return "Zahlung erfordert Aktion";
            when Payment_Expired => return "Zahlung abgelaufen";
         end case;
      else
         case Status is
            when Payment_Authorized => return "payment authorized";
            when Payment_Captured => return "payment captured";
            when Payment_Refunded => return "payment refunded";
            when Payment_Disputed => return "payment disputed";
            when Payment_Requires_Action => return "payment requires action";
            when Payment_Expired => return "payment expired";
         end case;
      end if;
   end Payment_Lifecycle_Text;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String (Text),
         Key    => Humanize.Messages.No_Message);
   end Ok_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
      Text : constant String := To_String (Result.Text);
   begin
      Written := 0;
      if Target'First /= 1 then
         Code := Humanize.Status.Invalid_Options;
      elsif Text'Length > Target'Length then
         if Target'Length > 0 then
            Target (Target'First .. Target'Last) :=
              Text (Text'First .. Text'First + Target'Length - 1);
         end if;
         Written := Target'Length;
         Code := Humanize.Status.Buffer_Overflow;
      else
         if Text'Length > 0 then
            Target (Target'First .. Target'First + Text'Length - 1) := Text;
         end if;
         Written := Text'Length;
         Code := Humanize.Status.Ok;
      end if;
   end Copy_Result;

   procedure Severity_Label_Into
     (Severity : Phrase_Severity;
      Target   : in out String;
      Written  : out Natural;
      Code     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Severity_Label (Severity), Target, Written, Code);
   end Severity_Label_Into;

   procedure Tone_Label_Into
     (Tone    : Phrase_Tone;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Tone_Label (Tone), Target, Written, Code);
   end Tone_Label_Into;

   function Status_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : UI_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Phrase_Text (Locale_Prefix (Context), Status));
   end Status_Phrase;

   function File_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : File_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (File_Text (Locale_Prefix (Context), Status));
   end File_Phrase;

   function Validation_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Validation_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Validation_Text (Locale_Prefix (Context), Status));
   end Validation_Phrase;

   function Empty_State_Phrase
     (Context : Humanize.Contexts.Context;
      State   : Empty_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Empty_Text (Locale_Prefix (Context), State));
   end Empty_State_Phrase;

   function Network_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Network_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Network_Text (Locale_Prefix (Context), Status));
   end Network_Phrase;

   function Auth_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Auth_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Auth_Text (Locale_Prefix (Context), Status));
   end Auth_Phrase;

   function Billing_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Billing_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Billing_Text (Locale_Prefix (Context), Status));
   end Billing_Phrase;

   function Workflow_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Workflow_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Workflow_Text (Locale_Prefix (Context), Status));
   end Workflow_Phrase;

   function Queue_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Queue_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Queue_Text (Locale_Prefix (Context), Status));
   end Queue_Phrase;

   function Security_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Security_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Security_Text (Locale_Prefix (Context), Status));
   end Security_Phrase;

   function Deployment_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Deployment_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Deployment_Text (Locale_Prefix (Context), Status));
   end Deployment_Phrase;

   function Health_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Health_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Health_Text (Locale_Prefix (Context), Status));
   end Health_Phrase;

   function Notification_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Notification_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Notification_Text (Locale_Prefix (Context), Status));
   end Notification_Phrase;

   function Form_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Form_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Form_Text (Locale_Prefix (Context), Status));
   end Form_Phrase;

   function Access_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Access_Status)
      return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Access_Text (Locale_Prefix (Context), Status));
   end Access_Phrase;

   function Sync_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Sync_Status)
      return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Sync_Text (Locale_Prefix (Context), Status));
   end Sync_Phrase;

   function Transfer_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Transfer_Status)
      return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Transfer_Text (Locale_Prefix (Context), Status));
   end Transfer_Phrase;

   function Search_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Search_Status)
      return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Search_Text (Locale_Prefix (Context), Status));
   end Search_Phrase;

   function Collaboration_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Collaboration_Status)
      return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Collaboration_Text (Locale_Prefix (Context), Status));
   end Collaboration_Phrase;

   function Issue_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Issue_Status)
      return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Issue_Text (Locale_Prefix (Context), Status));
   end Issue_Phrase;

   function Task_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Task_Status)
      return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Task_Text (Locale_Prefix (Context), Status));
   end Task_Phrase;

   function CI_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : CI_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (CI_Text (Locale_Prefix (Context), Status));
   end CI_Phrase;

   function Ticket_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Ticket_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Ticket_Text (Locale_Prefix (Context), Status));
   end Ticket_Phrase;

   function Payment_Lifecycle_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Payment_Lifecycle_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Payment_Lifecycle_Text (Locale_Prefix (Context), Status));
   end Payment_Lifecycle_Phrase;

   function Backup_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Backup_Status)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      case Status is
         when Backup_Running =>
            return Ok_Text ("backup running");
         when Backup_Completed =>
            return Ok_Text ("backup completed");
         when Backup_Failed =>
            return Ok_Text ("backup failed");
         when Backup_Stale =>
            return Ok_Text ("backup stale");
      end case;
   end Backup_Phrase;

   function Incident_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Incident_Status)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      case Status is
         when Incident_Investigating =>
            return Ok_Text ("investigating incident");
         when Incident_Identified =>
            return Ok_Text ("incident identified");
         when Incident_Mitigated =>
            return Ok_Text ("incident mitigated");
         when Incident_Resolved =>
            return Ok_Text ("incident resolved");
      end case;
   end Incident_Phrase;

   function Release_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Release_Status)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      case Status is
         when Release_Drafting =>
            return Ok_Text ("release drafting");
         when Release_Ready =>
            return Ok_Text ("release ready");
         when Release_Published =>
            return Ok_Text ("release published");
         when Release_Rolled_Back =>
            return Ok_Text ("release rolled back");
      end case;
   end Release_Phrase;

   function Audit_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Audit_Status)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      case Status is
         when Audit_Created => return Ok_Text ("audit entry created");
         when Audit_Updated => return Ok_Text ("audit entry updated");
         when Audit_Deleted => return Ok_Text ("audit entry deleted");
         when Audit_Restored => return Ok_Text ("audit entry restored");
      end case;
   end Audit_Phrase;

   function Feature_Flag_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Feature_Flag_Status)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      case Status is
         when Flag_Enabled => return Ok_Text ("feature flag enabled");
         when Flag_Disabled => return Ok_Text ("feature flag disabled");
         when Flag_Rolling_Out => return Ok_Text ("feature flag rolling out");
         when Flag_Rolled_Back => return Ok_Text ("feature flag rolled back");
      end case;
   end Feature_Flag_Phrase;

   function Webhook_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Webhook_Status)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      case Status is
         when Webhook_Pending => return Ok_Text ("webhook pending");
         when Webhook_Delivered => return Ok_Text ("webhook delivered");
         when Webhook_Failed => return Ok_Text ("webhook failed");
         when Webhook_Retrying => return Ok_Text ("webhook retrying");
      end case;
   end Webhook_Phrase;

   function API_Key_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : API_Key_Status)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      case Status is
         when API_Key_Active => return Ok_Text ("API key active");
         when API_Key_Revoked => return Ok_Text ("API key revoked");
         when API_Key_Expired => return Ok_Text ("API key expired");
         when API_Key_Rotated => return Ok_Text ("API key rotated");
      end case;
   end API_Key_Phrase;

   function Quota_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Quota_Status)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      case Status is
         when Quota_Available => return Ok_Text ("quota available");
         when Quota_Near_Limit => return Ok_Text ("quota near limit");
         when Quota_Exceeded => return Ok_Text ("quota exceeded");
         when Quota_Reset => return Ok_Text ("quota reset");
      end case;
   end Quota_Phrase;

   function Invoice_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Invoice_Status)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      case Status is
         when Invoice_Draft => return Ok_Text ("invoice draft");
         when Invoice_Sent => return Ok_Text ("invoice sent");
         when Invoice_Paid => return Ok_Text ("invoice paid");
         when Invoice_Refunded => return Ok_Text ("invoice refunded");
         when Invoice_Overdue => return Ok_Text ("invoice overdue");
         when Refund_Failed => return Ok_Text ("refund failed");
      end case;
   end Invoice_Phrase;

   function Database_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Database_Status)
      return Humanize.Status.Text_Result
   is
      Locale : constant String := Locale_Prefix (Context);
   begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Ok_Text (Generated_Phrase (Locale, Database_Status'Image (Status)));
      end if;

      case Status is
         when Database_Online =>
            return Ok_Text ("database online");
         when Database_Offline =>
            return Ok_Text ("database offline");
         when Database_Degraded =>
            return Ok_Text ("database degraded");
         when Database_Migrating =>
            return Ok_Text ("database migrating");
         when Database_Migration_Failed =>
            return Ok_Text ("database migration failed");
         when Database_Replicating =>
            return Ok_Text ("database replicating");
         when Database_Replication_Lagging =>
            return Ok_Text ("database replication lagging");
         when Database_Backup_Running =>
            return Ok_Text ("database backup running");
         when Database_Backup_Failed =>
            return Ok_Text ("database backup failed");
      end case;
   end Database_Phrase;

   function Field_Change_Summary
     (Context  : Humanize.Contexts.Context;
      Changed  : Natural;
      Added    : Natural;
      Removed  : Natural;
      Singular : String := "field";
      Plural   : String := "fields")
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Total : constant Natural := Changed + Added + Removed;

      function Image (Value : Natural) return String is
         Raw : constant String := Natural'Image (Value);
      begin
         return Raw (Raw'First + 1 .. Raw'Last);
      end Image;
   begin
      return Ok_Text
        (Image (Total) & " "
         & (if Total = 1 then Singular else Plural) & ": "
         & Image (Changed) & " changed, "
         & Image (Added) & " added, "
         & Image (Removed) & " removed");
   end Field_Change_Summary;

   function Field_Diff_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Before  : String;
      After   : String)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text
        (Field & " changed from " & Before & " to " & After);
   end Field_Diff_Summary;

   function Field_Added_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text (Field & " added as " & Value);
   end Field_Added_Summary;

   function Field_Removed_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text (Field & " removed (was " & Value & ")");
   end Field_Removed_Summary;

   function Field_Unchanged_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text (Field & " unchanged at " & Value);
   end Field_Unchanged_Summary;

   procedure Status_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : UI_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Status_Phrase (Context, Status);
   begin
      Copy_Result (Result, Target, Written, Code);
   end Status_Phrase_Into;

   procedure CI_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : CI_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (CI_Phrase (Context, Status), Target, Written, Code);
   end CI_Phrase_Into;

   procedure Ticket_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Ticket_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Ticket_Phrase (Context, Status), Target, Written, Code);
   end Ticket_Phrase_Into;

   procedure Payment_Lifecycle_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Payment_Lifecycle_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Payment_Lifecycle_Phrase (Context, Status), Target, Written, Code);
   end Payment_Lifecycle_Phrase_Into;

   procedure Backup_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Backup_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Backup_Phrase (Context, Status), Target, Written, Code);
   end Backup_Phrase_Into;

   procedure Incident_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Incident_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Incident_Phrase (Context, Status), Target, Written, Code);
   end Incident_Phrase_Into;

   procedure Release_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Release_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Release_Phrase (Context, Status), Target, Written, Code);
   end Release_Phrase_Into;

   procedure Audit_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Audit_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Audit_Phrase (Context, Status), Target, Written, Code);
   end Audit_Phrase_Into;

   procedure Feature_Flag_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Feature_Flag_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Feature_Flag_Phrase (Context, Status), Target, Written, Code);
   end Feature_Flag_Phrase_Into;

   procedure Webhook_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Webhook_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Webhook_Phrase (Context, Status), Target, Written, Code);
   end Webhook_Phrase_Into;

   procedure API_Key_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : API_Key_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (API_Key_Phrase (Context, Status), Target, Written, Code);
   end API_Key_Phrase_Into;

   procedure Quota_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Quota_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Quota_Phrase (Context, Status), Target, Written, Code);
   end Quota_Phrase_Into;

   procedure Invoice_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Invoice_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Invoice_Phrase (Context, Status), Target, Written, Code);
   end Invoice_Phrase_Into;

   procedure Database_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Database_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Database_Phrase (Context, Status), Target, Written, Code);
   end Database_Phrase_Into;

   procedure Field_Change_Summary_Into
     (Context  : Humanize.Contexts.Context;
      Changed  : Natural;
      Added    : Natural;
      Removed  : Natural;
      Singular : String;
      Plural   : String;
      Target   : in out String;
      Written  : out Natural;
      Code     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Field_Change_Summary
           (Context, Changed, Added, Removed, Singular, Plural),
         Target, Written, Code);
   end Field_Change_Summary_Into;

   procedure Field_Diff_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Before  : String;
      After   : String;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Field_Diff_Summary (Context, Field, Before, After),
         Target, Written, Code);
   end Field_Diff_Summary_Into;

   procedure Field_Added_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Field_Added_Summary (Context, Field, Value),
         Target, Written, Code);
   end Field_Added_Summary_Into;

   procedure Field_Removed_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Field_Removed_Summary (Context, Field, Value),
         Target, Written, Code);
   end Field_Removed_Summary_Into;

   procedure Field_Unchanged_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Field_Unchanged_Summary (Context, Field, Value),
         Target, Written, Code);
   end Field_Unchanged_Summary_Into;

   procedure Supported_Phrase_Locales_Into
     (Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Supported_Phrase_Locales, Target, Written, Code);
   end Supported_Phrase_Locales_Into;

   procedure Phrase_Pack_Summary_Into
     (Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Phrase_Pack_Summary, Target, Written, Code);
   end Phrase_Pack_Summary_Into;

   procedure Domain_Label_Into
     (Domain  : Summary_Domain;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Domain_Label (Domain), Target, Written, Code);
   end Domain_Label_Into;

   procedure Summary_State_Label_Into
     (State   : Summary_State;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Summary_State_Label (State), Target, Written, Code);
   end Summary_State_Label_Into;

   procedure Domain_Summary_Into
     (Context   : Humanize.Contexts.Context;
      Domain    : Summary_Domain;
      State     : Summary_State;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural;
      Singular  : String;
      Plural    : String;
      Target    : in out String;
      Written   : out Natural;
      Code      : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Domain_Summary
           (Context, Domain, State, Completed, Total, Failed, Singular, Plural),
         Target, Written, Code);
   end Domain_Summary_Into;

   procedure Queue_Summary_Into
     (Context   : Humanize.Contexts.Context;
      Queued    : Natural;
      Running   : Natural;
      Failed    : Natural;
      Completed : Natural;
      Singular  : String;
      Plural    : String;
      Target    : in out String;
      Written   : out Natural;
      Code      : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Queue_Summary
           (Context, Queued, Running, Failed, Completed, Singular, Plural),
         Target, Written, Code);
   end Queue_Summary_Into;

   procedure Cache_Summary_Into
     (Context : Humanize.Contexts.Context;
      Hits    : Natural;
      Misses  : Natural;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Cache_Summary (Context, Hits, Misses), Target, Written, Code);
   end Cache_Summary_Into;

   procedure Sync_Summary_Into
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural;
      Singular  : String;
      Plural    : String;
      Target    : in out String;
      Written   : out Natural;
      Code      : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Sync_Summary
           (Context, Completed, Total, Failed, Singular, Plural),
         Target, Written, Code);
   end Sync_Summary_Into;

   procedure Import_Summary_Into
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural;
      Singular  : String;
      Plural    : String;
      Target    : in out String;
      Written   : out Natural;
      Code      : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Import_Summary
           (Context, Completed, Total, Failed, Singular, Plural),
         Target, Written, Code);
   end Import_Summary_Into;

   procedure Export_Summary_Into
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural;
      Singular  : String;
      Plural    : String;
      Target    : in out String;
      Written   : out Natural;
      Code      : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Export_Summary
           (Context, Completed, Total, Failed, Singular, Plural),
         Target, Written, Code);
   end Export_Summary_Into;

   procedure File_Size_Comparison_Into
     (Context        : Humanize.Contexts.Context;
      Current        : Humanize.Bytes.Byte_Count;
      Baseline       : Humanize.Bytes.Byte_Count;
      Current_Label  : String;
      Baseline_Label : String;
      Target         : in out String;
      Written        : out Natural;
      Code           : out Humanize.Status.Status_Code;
      Options        : Humanize.Bytes.Byte_Options :=
        Humanize.Bytes.Default_Byte_Options)
   is
   begin
      Copy_Result
        (File_Size_Comparison
           (Context, Current, Baseline, Current_Label, Baseline_Label, Options),
         Target, Written, Code);
   end File_Size_Comparison_Into;

   procedure Date_Comparison_Into
     (Context         : Humanize.Contexts.Context;
      Value           : Humanize.Datetimes.Civil_Date_Time;
      Reference       : Humanize.Datetimes.Civil_Date_Time;
      Value_Label     : String;
      Reference_Label : String;
      Target          : in out String;
      Written         : out Natural;
      Code            : out Humanize.Status.Status_Code;
      Options         : Humanize.Datetimes.Calendar_Difference_Options :=
        Humanize.Datetimes.Default_Calendar_Difference_Options)
   is
   begin
      Copy_Result
        (Date_Comparison
           (Context, Value, Reference, Value_Label, Reference_Label, Options),
         Target, Written, Code);
   end Date_Comparison_Into;

   procedure Number_Comparison_Into
     (Context        : Humanize.Contexts.Context;
      Current        : Long_Float;
      Baseline       : Long_Float;
      Current_Label  : String;
      Baseline_Label : String;
      Unit_Singular  : String;
      Unit_Plural    : String;
      Target         : in out String;
      Written        : out Natural;
      Code           : out Humanize.Status.Status_Code;
      Options        : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result
        (Number_Comparison
           (Context, Current, Baseline, Current_Label, Baseline_Label,
            Unit_Singular, Unit_Plural, Options),
         Target, Written, Code);
   end Number_Comparison_Into;

   procedure Percent_Comparison_Into
     (Context        : Humanize.Contexts.Context;
      Current        : Long_Float;
      Baseline       : Long_Float;
      Current_Label  : String;
      Baseline_Label : String;
      Target         : in out String;
      Written        : out Natural;
      Code           : out Humanize.Status.Status_Code;
      Options        : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
   is
   begin
      Copy_Result
        (Percent_Comparison
           (Context, Current, Baseline, Current_Label, Baseline_Label,
            Options),
         Target, Written, Code);
   end Percent_Comparison_Into;

   procedure Status_Key_Into
     (Status  : UI_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Status_Key (Status), Target, Written, Code);
   end Status_Key_Into;

   procedure CI_Key_Into
     (Status  : CI_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (CI_Key (Status), Target, Written, Code);
   end CI_Key_Into;

   procedure Ticket_Key_Into
     (Status  : Ticket_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Ticket_Key (Status), Target, Written, Code);
   end Ticket_Key_Into;

   procedure Payment_Lifecycle_Key_Into
     (Status  : Payment_Lifecycle_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Payment_Lifecycle_Key (Status), Target, Written, Code);
   end Payment_Lifecycle_Key_Into;

   procedure Backup_Key_Into
     (Status  : Backup_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Backup_Key (Status), Target, Written, Code);
   end Backup_Key_Into;

   procedure Incident_Key_Into
     (Status  : Incident_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Incident_Key (Status), Target, Written, Code);
   end Incident_Key_Into;

   procedure Release_Key_Into
     (Status  : Release_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Release_Key (Status), Target, Written, Code);
   end Release_Key_Into;

   procedure File_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : File_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (File_Phrase (Context, Status), Target, Written, Code);
   end File_Phrase_Into;

   procedure Validation_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Validation_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Validation_Phrase (Context, Status), Target, Written, Code);
   end Validation_Phrase_Into;

   procedure Empty_State_Phrase_Into
     (Context : Humanize.Contexts.Context;
      State   : Empty_State;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Empty_State_Phrase (Context, State), Target, Written, Code);
   end Empty_State_Phrase_Into;

   procedure Network_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Network_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Network_Phrase (Context, Status), Target, Written, Code);
   end Network_Phrase_Into;

   procedure Auth_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Auth_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Auth_Phrase (Context, Status), Target, Written, Code);
   end Auth_Phrase_Into;

   procedure Billing_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Billing_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Billing_Phrase (Context, Status), Target, Written, Code);
   end Billing_Phrase_Into;

   procedure Workflow_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Workflow_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Workflow_Phrase (Context, Status), Target, Written, Code);
   end Workflow_Phrase_Into;

   procedure Queue_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Queue_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Queue_Phrase (Context, Status), Target, Written, Code);
   end Queue_Phrase_Into;

   procedure Security_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Security_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Security_Phrase (Context, Status), Target, Written, Code);
   end Security_Phrase_Into;

   procedure Deployment_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Deployment_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Deployment_Phrase (Context, Status), Target, Written, Code);
   end Deployment_Phrase_Into;

   procedure Health_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Health_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Health_Phrase (Context, Status), Target, Written, Code);
   end Health_Phrase_Into;

   procedure Notification_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Notification_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Notification_Phrase (Context, Status), Target, Written, Code);
   end Notification_Phrase_Into;

   procedure Form_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Form_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Form_Phrase (Context, Status), Target, Written, Code);
   end Form_Phrase_Into;

   procedure Access_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Access_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Access_Phrase (Context, Status), Target, Written, Code);
   end Access_Phrase_Into;

   procedure Sync_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Sync_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Sync_Phrase (Context, Status), Target, Written, Code);
   end Sync_Phrase_Into;

   procedure Transfer_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Transfer_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Transfer_Phrase (Context, Status), Target, Written, Code);
   end Transfer_Phrase_Into;

   procedure Search_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Search_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Search_Phrase (Context, Status), Target, Written, Code);
   end Search_Phrase_Into;

   procedure Collaboration_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Collaboration_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Collaboration_Phrase (Context, Status), Target, Written, Code);
   end Collaboration_Phrase_Into;

   procedure Issue_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Issue_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Issue_Phrase (Context, Status), Target, Written, Code);
   end Issue_Phrase_Into;

   procedure Task_Phrase_Into
     (Context : Humanize.Contexts.Context;
      Status  : Task_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Task_Phrase (Context, Status), Target, Written, Code);
   end Task_Phrase_Into;

end Humanize.Phrases;
