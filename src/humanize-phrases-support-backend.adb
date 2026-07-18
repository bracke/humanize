with Ada.Calendar;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Decimal_Images;
with Humanize.Bounded_Text;

package body Humanize.Phrases.Support.Backend is

   use type Humanize.Bytes.Byte_Count;
   use Humanize.Locales;
   use type Humanize.Status.Status_Code;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text
     (Result : Humanize.Status.Text_Result)
      return String
      renames Humanize.Bounded_Text.Result_Text;

   function Natural_Text (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Lower (Text : String) return String
      renames Humanize.Bounded_Text.Lower_Text;

   function Lower_Char (Char : Character) return Character
      renames Humanize.Bounded_Text.Lower_Char;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Invalid_Text return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Invalid_Value_Text;

   function B (Hex : String) return String
      renames Humanize.Bounded_Text.Hex_Bytes;

   function Severity_Label
     (Severity : Phrase_Severity)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Severity is
           when Neutral_Severity => "neutral",
           when Success_Severity => "success",
           when Warning_Severity => "warning",
           when Danger_Severity => "danger",
           when Info_Severity => "info");
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
      return Ok_Text
        (case Tone is
           when Neutral_Tone       => "neutral",
           when Positive_Tone      => "positive",
           when Attention_Tone     => "attention",
           when Critical_Tone      => "critical",
           when Informational_Tone => "informational");
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
      is separate;

   En_Locale : aliased constant String := "en";
   Da_Locale : aliased constant String := "da";
   De_Locale : aliased constant String := "de";
   Fr_Locale : aliased constant String := "fr";
   Es_Locale : aliased constant String := "es";
   It_Locale : aliased constant String := "it";
   Pt_Locale : aliased constant String := "pt";
   Nl_Locale : aliased constant String := "nl";
   Sv_Locale : aliased constant String := "sv";
   No_Locale : aliased constant String := "no";
   Nb_Locale : aliased constant String := "nb";
   Fi_Locale : aliased constant String := "fi";
   Pl_Locale : aliased constant String := "pl";
   Cs_Locale : aliased constant String := "cs";
   Tr_Locale : aliased constant String := "tr";
   Ru_Locale : aliased constant String := "ru";
   Uk_Locale : aliased constant String := "uk";
   Ja_Locale : aliased constant String := "ja";
   Ko_Locale : aliased constant String := "ko";
   Zh_Locale : aliased constant String := "zh";
   Ar_Locale : aliased constant String := "ar";
   Hi_Locale : aliased constant String := "hi";

   Phrase_Locale_Table : constant Phrase_Locale_List :=
     [En_Locale'Access,
      Da_Locale'Access,
      De_Locale'Access,
      Fr_Locale'Access,
      Es_Locale'Access,
      It_Locale'Access,
      Pt_Locale'Access,
      Nl_Locale'Access,
      Sv_Locale'Access,
      No_Locale'Access,
      Nb_Locale'Access,
      Fi_Locale'Access,
      Pl_Locale'Access,
      Cs_Locale'Access,
      Tr_Locale'Access,
      Ru_Locale'Access,
      Uk_Locale'Access,
      Ja_Locale'Access,
      Ko_Locale'Access,
      Zh_Locale'Access,
      Ar_Locale'Access,
      Hi_Locale'Access];

   Generated_Phrase_Locale_Table : constant Generated_Phrase_Locale_List :=
     [Da_Locale'Access,
      Es_Locale'Access,
      It_Locale'Access,
      Pt_Locale'Access,
      Nl_Locale'Access,
      Sv_Locale'Access,
      No_Locale'Access,
      Nb_Locale'Access,
      Fi_Locale'Access,
      Pl_Locale'Access,
      Cs_Locale'Access,
      Tr_Locale'Access,
      Ru_Locale'Access,
      Uk_Locale'Access,
      Ja_Locale'Access,
      Ko_Locale'Access,
      Zh_Locale'Access,
      Ar_Locale'Access,
      Hi_Locale'Access];

   function Phrase_Locales return Phrase_Locale_List is
   begin
      return Phrase_Locale_Table;
   end Phrase_Locales;

   function Generated_Phrase_Locales return Generated_Phrase_Locale_List is
   begin
      return Generated_Phrase_Locale_Table;
   end Generated_Phrase_Locales;

   function Is_Supported_Phrase_Locale (Locale : String) return Boolean is
      Candidate : constant String := Language_Code (Locale);
   begin
      for Phrase_Locale of Phrase_Locale_Table loop
         if Candidate = Phrase_Locale.all then
            return True;
         end if;
      end loop;
      return False;
   end Is_Supported_Phrase_Locale;

   function Is_Generated_Phrase_Locale (Locale : String) return Boolean is
      Candidate : constant String := Language_Code (Locale);
   begin
      for Phrase_Locale of Generated_Phrase_Locale_Table loop
         if Candidate = Phrase_Locale.all then
            return True;
         end if;
      end loop;
      return False;
   end Is_Generated_Phrase_Locale;

   function Supported_Phrase_Locale_Text return String is
      Text : Unbounded_String;
   begin
      for Phrase_Locale of Phrase_Locale_Table loop
         if Length (Text) > 0 then
            Append (Text, " ");
         end if;
         Append (Text, Phrase_Locale.all);
      end loop;
      return To_String (Text);
   end Supported_Phrase_Locale_Text;

   function Supported_Phrase_Locales
     return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Supported_Phrase_Locale_Text);
   end Supported_Phrase_Locales;

   function Phrase_Pack_Summary
     return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        ("ui file validation empty network auth billing workflow queue security "
         & "deployment health notification form access sync transfer search "
         & "collaboration issue task ci ticket payment backup incident release "
         & "audit flag webhook api_key quota invoice database summaries "
         & "comparisons");
   end Phrase_Pack_Summary;

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
      is separate;

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

   function File_Size_Comparison
     (Context        : Humanize.Contexts.Context;
      Current        : Humanize.Bytes.Byte_Count;
      Baseline       : Humanize.Bytes.Byte_Count;
      Current_Label  : String := "file";
      Baseline_Label : String := "baseline";
      Options        : Humanize.Bytes.Byte_Options :=
        Humanize.Bytes.Default_Byte_Options)
      return Humanize.Status.Text_Result
      is separate;

   function Date_Comparison
     (Context        : Humanize.Contexts.Context;
      Value          : Humanize.Datetimes.Civil_Date_Time;
      Reference      : Humanize.Datetimes.Civil_Date_Time;
      Value_Label    : String := "date";
      Reference_Label : String := "reference";
      Options        : Humanize.Datetimes.Calendar_Difference_Options :=
        Humanize.Datetimes.Default_Calendar_Difference_Options)
      return Humanize.Status.Text_Result
      is separate;

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
      is separate;

   function Percent_Comparison
     (Context        : Humanize.Contexts.Context;
      Current        : Long_Float;
      Baseline       : Long_Float;
      Current_Label  : String := "value";
      Baseline_Label : String := "baseline";
      Options        : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
      is separate;

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
         Result (Index) := Lower_Char (Ch);
         Index := Index + 1;
      end loop;
      return Result;
   end Key_Text;

   function Has_Generated_Phrase_Pack (Locale : String) return Boolean is
   begin
      return Is_Generated_Phrase_Locale (Locale);
   end Has_Generated_Phrase_Pack;

   function Phrase_Separator (Locale : String) return String is
   begin
      if Is_CJK (Locale) then
         return "";
      else
         return " ";
      end if;
   end Phrase_Separator;

   function Database_Token_Text (Locale, Token : String) return String
      is separate;

   function Token_Text (Locale, Token : String) return String
      is separate;

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
      return Ok_Text (Key_Text ("ui", UI_Status'Image (Status)));
   end Status_Key;

   function CI_Key
     (Status : CI_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Key_Text ("ci", CI_Status'Image (Status)));
   end CI_Key;

   function Ticket_Key
     (Status : Ticket_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Key_Text ("ticket", Ticket_Status'Image (Status)));
   end Ticket_Key;

   function Payment_Lifecycle_Key
     (Status : Payment_Lifecycle_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Key_Text ("payment", Payment_Lifecycle_Status'Image (Status)));
   end Payment_Lifecycle_Key;

   function Backup_Key
     (Status : Backup_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Key_Text ("backup", Backup_Status'Image (Status)));
   end Backup_Key;

   function Incident_Key
     (Status : Incident_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Key_Text ("incident", Incident_Status'Image (Status)));
   end Incident_Key;

   function Release_Key
     (Status : Release_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Key_Text ("release", Release_Status'Image (Status)));
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
      is separate;

   function File_Text (Locale : String; Status : File_Status) return String
      is separate;

   function Validation_Text
     (Locale : String;
      Status : Validation_Status)
      return String
      is separate;

   function Empty_Text (Locale : String; State : Empty_State) return String
      is separate;

   function Network_Text
     (Locale : String;
      Status : Network_Status)
      return String
      is separate;

   function Auth_Text (Locale : String; Status : Auth_Status) return String
      is separate;

   function Billing_Text
     (Locale : String;
      Status : Billing_Status)
      return String
      is separate;

   function Workflow_Text
     (Locale : String;
      Status : Workflow_Status)
      return String
      is separate;

   function Queue_Text (Locale : String; Status : Queue_Status) return String
      is separate;

   function Security_Text
     (Locale : String;
      Status : Security_Status)
      return String
      is separate;

   function Deployment_Text
     (Locale : String;
      Status : Deployment_Status)
      return String
      is separate;

   function Health_Text
     (Locale : String;
      Status : Health_Status)
      return String
      is separate;

   function Notification_Text
     (Locale : String;
      Status : Notification_Status)
      return String
      is separate;

   function Form_Text
     (Locale : String;
      Status : Form_Status)
      return String
      is separate;

   function Access_Text (Locale : String; Status : Access_Status) return String
      is separate;

   function Sync_Text (Locale : String; Status : Sync_Status) return String
      is separate;

   function Transfer_Text
     (Locale : String;
      Status : Transfer_Status)
      return String
      is separate;

   function Search_Text (Locale : String; Status : Search_Status) return String
      is separate;

   function Collaboration_Text
     (Locale : String;
      Status : Collaboration_Status)
      return String
      is separate;

   function Issue_Text (Locale : String; Status : Issue_Status) return String
      is separate;

   function Task_Text (Locale : String; Status : Task_Status) return String
      is separate;

   function CI_Text (Locale : String; Status : CI_Status) return String
      is separate;

   function Ticket_Text
     (Locale : String;
      Status : Ticket_Status)
      return String
      is separate;

   function Payment_Lifecycle_Text
     (Locale : String;
      Status : Payment_Lifecycle_Status)
      return String
      is separate;

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
      return Ok_Text (Phrase_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end Status_Phrase;

   function File_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : File_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (File_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end File_Phrase;

   function Validation_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Validation_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Validation_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end Validation_Phrase;

   function Empty_State_Phrase
     (Context : Humanize.Contexts.Context;
      State   : Empty_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Empty_Text (Language_Code (Humanize.Contexts.Locale (Context)), State));
   end Empty_State_Phrase;

   function Network_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Network_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Network_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end Network_Phrase;

   function Auth_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Auth_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Auth_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end Auth_Phrase;

   function Billing_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Billing_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Billing_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end Billing_Phrase;

   function Workflow_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Workflow_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Workflow_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end Workflow_Phrase;

   function Queue_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Queue_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Queue_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end Queue_Phrase;

   function Security_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Security_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Security_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end Security_Phrase;

   function Deployment_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Deployment_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Deployment_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end Deployment_Phrase;

   function Health_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Health_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Health_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end Health_Phrase;

   function Notification_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Notification_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Notification_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end Notification_Phrase;

   function Form_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Form_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Form_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end Form_Phrase;

   function Access_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Access_Status)
      return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Access_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end Access_Phrase;

   function Sync_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Sync_Status)
      return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Sync_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end Sync_Phrase;

   function Transfer_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Transfer_Status)
      return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Transfer_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end Transfer_Phrase;

   function Search_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Search_Status)
      return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Search_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end Search_Phrase;

   function Collaboration_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Collaboration_Status)
      return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Collaboration_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end Collaboration_Phrase;

   function Issue_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Issue_Status)
      return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Issue_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end Issue_Phrase;

   function Task_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Task_Status)
      return Humanize.Status.Text_Result is
   begin
      return Ok_Text (Task_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end Task_Phrase;

   function CI_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : CI_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (CI_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end CI_Phrase;

   function Ticket_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Ticket_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Ticket_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
   end Ticket_Phrase;

   function Payment_Lifecycle_Phrase
     (Context : Humanize.Contexts.Context;
      Status  : Payment_Lifecycle_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Payment_Lifecycle_Text (Language_Code (Humanize.Contexts.Locale (Context)), Status));
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
      is separate;

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
   begin
      return Ok_Text
        (Natural_Text (Total) & " "
         & (if Total = 1 then Singular else Plural) & ": "
         & Natural_Text (Changed) & " changed, "
         & Natural_Text (Added) & " added, "
         & Natural_Text (Removed) & " removed");
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

end Humanize.Phrases.Support.Backend;
