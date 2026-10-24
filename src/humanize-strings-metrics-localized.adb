with Humanize.Bounded_Text;
with Humanize.Label_Values;

package body Humanize.Strings.Metrics.Localized is

   function Paragraph_Count_Summary
      (Context : Humanize.Contexts.Context;
       Text    : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Metrics.Paragraph_Count_Summary (Text => Text);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.metrics.paragraph_count_summary", English);
   end Paragraph_Count_Summary;

   function Reading_Time
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Options : Text_Time_Options := Default_Text_Time_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Metrics.Reading_Time (Text => Text, Options => Options);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.metrics.reading_time", English);
   end Reading_Time;

   function Sentence_Count_Summary
      (Context : Humanize.Contexts.Context;
       Text    : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Metrics.Sentence_Count_Summary (Text => Text);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.metrics.sentence_count_summary", English);
   end Sentence_Count_Summary;

   function Speaking_Time
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Options : Text_Time_Options := Default_Text_Time_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Metrics.Speaking_Time (Text => Text, Options => Options);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.metrics.speaking_time", English);
   end Speaking_Time;

   function Text_Summary
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Options : Text_Summary_Options := Default_Text_Summary_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Metrics.Text_Summary (Text => Text, Options => Options);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.metrics.text_summary", English, ", ");
   end Text_Summary;

   function Text_Summary_With_Options
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Options : Text_Summary_Composition_Options := Default_Text_Summary_Composition_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Metrics.Text_Summary_With_Options (Text => Text, Options => Options);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.metrics.text_summary_with_options", English, ", ");
   end Text_Summary_With_Options;

   function Word_Count_Summary
      (Context : Humanize.Contexts.Context;
       Text    : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Metrics.Word_Count_Summary (Text => Text);
   begin
      return Humanize.Label_Values.Shaped (Context, "label.metrics.word_count_summary", English);
   end Word_Count_Summary;

   procedure Paragraph_Count_Summary_Into
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Paragraph_Count_Summary (Context, Text => Text), Target, Written, Status);
   end Paragraph_Count_Summary_Into;

   procedure Reading_Time_Into
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Options : Text_Time_Options := Default_Text_Time_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Reading_Time (Context, Text => Text, Options => Options),
         Target, Written, Status);
   end Reading_Time_Into;

   procedure Sentence_Count_Summary_Into
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Sentence_Count_Summary (Context, Text => Text), Target, Written, Status);
   end Sentence_Count_Summary_Into;

   procedure Speaking_Time_Into
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Options : Text_Time_Options := Default_Text_Time_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Speaking_Time (Context, Text => Text, Options => Options),
         Target, Written, Status);
   end Speaking_Time_Into;

   procedure Text_Summary_Into
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Options : Text_Summary_Options := Default_Text_Summary_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Text_Summary (Context, Text => Text, Options => Options),
         Target, Written, Status);
   end Text_Summary_Into;

   procedure Text_Summary_With_Options_Into
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Options : Text_Summary_Composition_Options := Default_Text_Summary_Composition_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Text_Summary_With_Options (Context, Text => Text, Options => Options),
         Target, Written, Status);
   end Text_Summary_With_Options_Into;

   procedure Word_Count_Summary_Into
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Word_Count_Summary (Context, Text => Text), Target, Written, Status);
   end Word_Count_Summary_Into;

end Humanize.Strings.Metrics.Localized;
