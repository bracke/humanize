with Humanize.Bounded_Text;
with Humanize.Parsing.Implementation.Text_Helpers;
with Humanize.Phrases;
with Humanize.Status;

package body Humanize.Parsing.Implementation.Phrase_Text_Helpers is
   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;
   function Find_Substring (Text, Pattern : String) return Natural
      renames Humanize.Bounded_Text.Index_Text;
   function Count_Words (Text : String) return Natural
      renames Humanize.Parsing.Implementation.Text_Helpers.Count_Words;

   function Parse_Phrase_Severity_Label
     (Text : String)
      return Humanize.Parsing.Phrase_Severity_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Severity : Humanize.Phrases.Phrase_Severity;
   begin
      if Item = "neutral" then
         Severity := Humanize.Phrases.Neutral_Severity;
      elsif Item = "success" then
         Severity := Humanize.Phrases.Success_Severity;
      elsif Item = "warning" then
         Severity := Humanize.Phrases.Warning_Severity;
      elsif Item = "danger" then
         Severity := Humanize.Phrases.Danger_Severity;
      elsif Item = "info" then
         Severity := Humanize.Phrases.Info_Severity;
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Humanize.Parsing.Unsupported_Form,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Severity => Severity,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => Humanize.Parsing.No_Parse_Error);
   end Parse_Phrase_Severity_Label;

   function Parse_Phrase_Tone_Label
     (Text : String)
      return Humanize.Parsing.Phrase_Tone_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Tone : Humanize.Phrases.Phrase_Tone;
   begin
      if Item = "neutral" then
         Tone := Humanize.Phrases.Neutral_Tone;
      elsif Item = "positive" then
         Tone := Humanize.Phrases.Positive_Tone;
      elsif Item = "attention" then
         Tone := Humanize.Phrases.Attention_Tone;
      elsif Item = "critical" then
         Tone := Humanize.Phrases.Critical_Tone;
      elsif Item = "informational" then
         Tone := Humanize.Phrases.Informational_Tone;
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Humanize.Parsing.Unsupported_Form,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Tone => Tone,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => Humanize.Parsing.No_Parse_Error);
   end Parse_Phrase_Tone_Label;

   function Parse_Phrase_Domain_Label
     (Text : String)
      return Humanize.Parsing.Phrase_Domain_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Domain : Humanize.Phrases.Summary_Domain;
   begin
      if Item = "queue" then
         Domain := Humanize.Phrases.Queue_Domain;
      elsif Item = "job" then
         Domain := Humanize.Phrases.Job_Domain;
      elsif Item = "run" then
         Domain := Humanize.Phrases.Run_Domain;
      elsif Item = "cache" then
         Domain := Humanize.Phrases.Cache_Domain;
      elsif Item = "sync" then
         Domain := Humanize.Phrases.Sync_Domain;
      elsif Item = "import" then
         Domain := Humanize.Phrases.Import_Domain;
      elsif Item = "export" then
         Domain := Humanize.Phrases.Export_Domain;
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Humanize.Parsing.Unsupported_Form,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Domain => Domain,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => Humanize.Parsing.No_Parse_Error);
   end Parse_Phrase_Domain_Label;

   function Parse_Phrase_State_Label
     (Text : String)
      return Humanize.Parsing.Phrase_State_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      State : Humanize.Phrases.Summary_State;
   begin
      if Item = "queued" then
         State := Humanize.Phrases.Summary_Queued;
      elsif Item = "running" then
         State := Humanize.Phrases.Summary_Running;
      elsif Item = "waiting" then
         State := Humanize.Phrases.Summary_Waiting;
      elsif Item = "paused" then
         State := Humanize.Phrases.Summary_Paused;
      elsif Item = "complete" then
         State := Humanize.Phrases.Summary_Complete;
      elsif Item = "failed" then
         State := Humanize.Phrases.Summary_Failed;
      elsif Item = "stale" then
         State := Humanize.Phrases.Summary_Stale;
      elsif Item = "skipped" then
         State := Humanize.Phrases.Summary_Skipped;
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Humanize.Parsing.Unsupported_Form,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         State => State,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => Humanize.Parsing.No_Parse_Error);
   end Parse_Phrase_State_Label;

   function Contains_Word
     (Text : String;
      Word : String)
      return Boolean
   is
      Item : constant String := " " & Clean_Lower (Text) & " ";
   begin
      return Find_Substring (Item, " " & Word & " ") /= 0;
   end Contains_Word;

   function Parse_Phrase_Pack_Summary
     (Text : String)
      return Humanize.Parsing.Phrase_Pack_Summary_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Count : constant Natural := Count_Words (Item);
   begin
      if Count = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Humanize.Parsing.Empty_Input,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Pack_Count => Count,
         Has_Summaries => Contains_Word (Item, "summaries"),
         Has_Comparisons => Contains_Word (Item, "comparisons"),
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => Humanize.Parsing.No_Parse_Error);
   end Parse_Phrase_Pack_Summary;
end Humanize.Parsing.Implementation.Phrase_Text_Helpers;
