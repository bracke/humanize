with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Messages;

package body Humanize.Capabilities is
   procedure Copy_Text
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Written := 0;
      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
      elsif Text'Length > Target'Length then
         if Target'Length > 0 then
            Target (Target'First .. Target'Last) :=
              Text (Text'First .. Text'First + Target'Length - 1);
         end if;
         Written := Target'Length;
         Status := Humanize.Status.Buffer_Overflow;
      else
         if Text'Length > 0 then
            Target (Target'First .. Target'First + Text'Length - 1) := Text;
         end if;
         Written := Text'Length;
         Status := Humanize.Status.Ok;
      end if;
   end Copy_Text;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String (Text),
         Key    => Humanize.Messages.No_Message);
   end Ok_Text;

   function Area_Label
     (Area : Capability_Area)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Area is
            when Datetime_Area  => "datetimes",
            when Duration_Area  => "durations",
            when Bytes_Area     => "bytes",
            when Color_Area     => "colors",
            when Number_Area    => "numbers",
            when String_Area    => "strings",
            when List_Area      => "lists",
            when Frequency_Area => "frequencies",
            when Rate_Area      => "rates",
            when Unit_Area      => "units",
            when Phrase_Area    => "phrases",
            when Parsing_Area   => "parsing",
            when Metadata_Area  => "metadata");
   end Area_Label;

   function Area_Rendering_Source
     (Area : Capability_Area)
      return Humanize.Rendering_Source
   is
   begin
      case Area is
         when Datetime_Area | Duration_Area | Bytes_Area | Number_Area
            | List_Area | Frequency_Area | Rate_Area | Unit_Area =>
            return Humanize.Locale_Rendered;
         when Color_Area | String_Area | Phrase_Area | Parsing_Area
            | Metadata_Area =>
            return Humanize.Deterministic_Text;
      end case;
   end Area_Rendering_Source;

   function Area_Locale_Behavior
     (Area : Capability_Area)
      return Locale_Behavior
   is
   begin
      case Area is
         when Frequency_Area | Rate_Area | Unit_Area =>
            return Catalog_Localized;
         when Phrase_Area =>
            return Deterministic_Locale_Aware;
         when Color_Area | String_Area | Parsing_Area | Metadata_Area =>
            return Deterministic_English;
         when Datetime_Area | Duration_Area | Bytes_Area | Number_Area
            | List_Area =>
            return Mixed_Localized_Deterministic;
      end case;
   end Area_Locale_Behavior;

   function Rendering_Source_Label
     (Source : Humanize.Rendering_Source)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Source is
            when Humanize.Locale_Rendered     => "locale-rendered",
            when Humanize.Deterministic_Text  => "deterministic-text");
   end Rendering_Source_Label;

   function Locale_Behavior_Label
     (Behavior : Locale_Behavior)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Behavior is
            when Catalog_Localized =>
               "catalog-localized",
            when Deterministic_Locale_Aware =>
               "deterministic-locale-aware",
            when Deterministic_English =>
               "deterministic-english",
            when Mixed_Localized_Deterministic =>
               "mixed-localized-deterministic");
   end Locale_Behavior_Label;

   function Capability_Summary
     return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        ("datetimes durations bytes colors numbers strings lists frequencies rates "
         & "units phrases parsing metadata");
   end Capability_Summary;

   function Locale_Behavior_Summary
     return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        ("catalog-localized deterministic-locale-aware "
         & "deterministic-english mixed-localized-deterministic");
   end Locale_Behavior_Summary;

   procedure Area_Label_Into
     (Area    : Capability_Area;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Area_Label (Area);
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Area_Label_Into;

   procedure Rendering_Source_Label_Into
     (Source  : Humanize.Rendering_Source;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Rendering_Source_Label (Source);
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Rendering_Source_Label_Into;

   procedure Locale_Behavior_Label_Into
     (Behavior : Locale_Behavior;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Locale_Behavior_Label (Behavior);
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Locale_Behavior_Label_Into;

   procedure Capability_Summary_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Capability_Summary;
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Capability_Summary_Into;

   procedure Locale_Behavior_Summary_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Locale_Behavior_Summary;
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Locale_Behavior_Summary_Into;
end Humanize.Capabilities;
