with Humanize.Domain_Details;
with Humanize.Status;

--  Human-readable labels for badges, tags, chips, and compact indicators.
package Humanize.Badges is

   type Badge_Output_Mode is (Badge_Detailed, Badge_Compact,
                              Badge_Accessible, Badge_Log);
   --  Output style for badge labels with domain metadata.

   type Badge_Label_Options is record
      Mode             : Badge_Output_Mode := Badge_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;
   --  Caller-selected metadata included around badge labels.

   Default_Badge_Label_Options : constant Badge_Label_Options :=
     (Mode             => Badge_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Badge_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;

   type Badge_Tone is
     (Neutral_Tone,
      Info_Tone,
      Success_Tone,
      Warning_Tone,
      Danger_Tone,
      Muted_Tone);
   --  Caller-supplied badge visual tone.

   type Badge_State is
     (Default_Badge,
      New_Badge,
      Updated_Badge,
      Deprecated_Badge,
      Selected_Badge,
      Disabled_Badge,
      Dismissible_Badge);
   --  Caller-supplied badge state.

   type Badge_Priority is
     (Low_Priority,
      Medium_Priority,
      High_Priority,
      Critical_Priority);
   --  Caller-supplied compact priority indicator.

   function Badge_Tone_Label
     (Tone : Badge_Tone)
      return Humanize.Status.Text_Result;
   --  @param Tone Badge visual tone.
   --  @return Human-readable badge-tone label.

   function Badge_State_Label
     (State : Badge_State)
      return Humanize.Status.Text_Result;
   --  @param State Badge state.
   --  @return Human-readable badge-state label.

   function Badge_Priority_Label
     (Priority : Badge_Priority)
      return Humanize.Status.Text_Result;
   --  @param Priority Compact priority indicator.
   --  @return Human-readable badge-priority label.

   function Badge_Label
     (Name  : String;
      Tone  : Badge_Tone := Neutral_Tone;
      State : Badge_State := Default_Badge)
      return Humanize.Status.Text_Result;
   --  @param Name Badge text.
   --  @param Tone Badge visual tone.
   --  @param State Badge state.
   --  @return Human-readable badge label.

   function Badge_Label
     (Name    : String;
      Tone    : Badge_Tone;
      State   : Badge_State;
      Options : Badge_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Badge text.
   --  @param Tone Badge visual tone.
   --  @param State Badge state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable badge label with optional metadata.

   function Count_Badge_Label
     (Name  : String;
      Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Name Counted badge name.
   --  @param Count Badge count.
   --  @return Human-readable counted badge label.

   function Status_Badge_Label
     (Name : String;
      Tone : Badge_Tone)
      return Humanize.Status.Text_Result;
   --  @param Name Status badge text.
   --  @param Tone Badge visual tone.
   --  @return Human-readable status badge label.

   function Status_Badge_Label
     (Name    : String;
      Tone    : Badge_Tone;
      Options : Badge_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Status badge text.
   --  @param Tone Badge visual tone.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable status badge label with optional metadata.

   function Badge_Tone_Metadata
     (Tone : Badge_Tone)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param Tone Badge visual tone.
   --  @return Severity, tone, and final/actionable metadata for Tone.

   function Badge_State_Metadata
     (State : Badge_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Badge state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Badge_Priority_Metadata
     (Priority : Badge_Priority)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param Priority Badge priority.
   --  @return Severity, tone, and final/actionable metadata for Priority.

   function Parse_Badge_Label
     (Text  : String;
      Tone  : Badge_Tone;
      State : Badge_State := Default_Badge)
      return Badge_Label_Parse_Result;
   --  @param Text Label in rendered badge-label form.
   --  @param Tone Expected badge tone.
   --  @param State Expected badge state.
   --  @return Parsed badge name span, metadata span, metadata, and consumed length.

   function Scan_Badge_Label
     (Text  : String;
      Tone  : Badge_Tone;
      State : Badge_State := Default_Badge)
      return Badge_Label_Parse_Result;
   --  @param Text Text beginning with a badge label.
   --  @param Tone Expected badge tone.
   --  @param State Expected badge state.
   --  @return Parsed label span and consumed prefix length.

   function Parse_Status_Badge_Label
     (Text : String;
      Tone : Badge_Tone)
      return Badge_Label_Parse_Result;
   --  @param Text Label in rendered status-badge form.
   --  @param Tone Expected badge tone.
   --  @return Parsed status name span, tone span, metadata, and consumed length.

   function Scan_Status_Badge_Label
     (Text : String;
      Tone : Badge_Tone)
      return Badge_Label_Parse_Result;
   --  @param Text Text beginning with a status-badge label.
   --  @param Tone Expected badge tone.
   --  @return Parsed label span and consumed prefix length.

   function Tag_Label
     (Name : String)
      return Humanize.Status.Text_Result;
   --  @param Name Tag text.
   --  @return Human-readable tag label.

   function Tag_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Tag count.
   --  @return Human-readable tag count label.

   function Chip_Label
     (Name     : String;
      Selected : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Name Chip text.
   --  @param Selected Whether the chip is selected.
   --  @return Human-readable chip label.

   function Dismiss_Label
     (Name : String)
      return Humanize.Status.Text_Result;
   --  @param Name Dismissible badge/tag/chip text.
   --  @return Human-readable dismiss action label.

   function New_Label
     (Name : String)
      return Humanize.Status.Text_Result;
   --  @param Name Badge text.
   --  @return Human-readable new badge label.

   function Updated_Label
     (Name : String)
      return Humanize.Status.Text_Result;
   --  @param Name Badge text.
   --  @return Human-readable updated badge label.

   function Deprecated_Label
     (Name : String)
      return Humanize.Status.Text_Result;
   --  @param Name Badge text.
   --  @return Human-readable deprecated badge label.

   function Overflow_Badge_Label
     (Hidden_Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Hidden_Count Hidden badge/tag/chip count.
   --  @return Human-readable overflow badge label.

   function Priority_Badge_Label
     (Priority : Badge_Priority;
      Name     : String := "")
      return Humanize.Status.Text_Result;
   --  @param Priority Compact priority indicator.
   --  @param Name Optional priority subject.
   --  @return Human-readable priority badge label.

   procedure Badge_Tone_Label_Into
     (Tone    : Badge_Tone;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Tone Badge visual tone.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Badge_State_Label_Into
     (State   : Badge_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Badge state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Badge_Priority_Label_Into
     (Priority : Badge_Priority;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Priority Compact priority indicator.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Badge_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Tone    : Badge_Tone := Neutral_Tone;
      State   : Badge_State := Default_Badge);
   --  @param Name Badge text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Tone Badge visual tone.
   --  @param State Badge state.

   procedure Badge_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Tone    : Badge_Tone;
      State   : Badge_State;
      Options : Badge_Label_Options);
   --  @param Name Badge text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Tone Badge visual tone.
   --  @param State Badge state.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Count_Badge_Label_Into
     (Name    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Counted badge name.
   --  @param Count Badge count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Status_Badge_Label_Into
     (Name    : String;
      Tone    : Badge_Tone;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Status badge text.
   --  @param Tone Badge visual tone.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Status_Badge_Label_Into
     (Name    : String;
      Tone    : Badge_Tone;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Badge_Label_Options);
   --  @param Name Status badge text.
   --  @param Tone Badge visual tone.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Tag_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Tag text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Tag_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Tag count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Chip_Label_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Selected : Boolean := False);
   --  @param Name Chip text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Selected Whether the chip is selected.

   procedure Dismiss_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Dismissible badge/tag/chip text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure New_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Badge text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Updated_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Badge text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Deprecated_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Badge text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Overflow_Badge_Label_Into
     (Hidden_Count : Natural;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code);
   --  @param Hidden_Count Hidden badge/tag/chip count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Priority_Badge_Label_Into
     (Priority : Badge_Priority;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Name     : String := "");
   --  @param Priority Compact priority indicator.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional priority subject.

end Humanize.Badges;
