with Humanize.Contexts;

--  Badges labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Badges.Localized is

   function Badge_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Tone    : Badge_Tone := Neutral_Tone;
       State   : Badge_State := Default_Badge)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Badge_Label.
   --  @param Tone As for the parent's Badge_Label.
   --  @param State As for the parent's Badge_Label.
   --  @return The label in Context's locale.

   function Badge_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Tone    : Badge_Tone;
       State   : Badge_State;
       Options : Badge_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Badge_Label.
   --  @param Tone As for the parent's Badge_Label.
   --  @param State As for the parent's Badge_Label.
   --  @param Options As for the parent's Badge_Label.
   --  @return The label in Context's locale.

   function Badge_Priority_Label
      (Context  : Humanize.Contexts.Context;
       Priority : Badge_Priority)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Priority As for the parent's Badge_Priority_Label.
   --  @return The label in Context's locale.

   function Badge_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Badge_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Badge_State_Label.
   --  @return The label in Context's locale.

   function Badge_Tone_Label
      (Context : Humanize.Contexts.Context;
       Tone    : Badge_Tone)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Tone As for the parent's Badge_Tone_Label.
   --  @return The label in Context's locale.

   function Chip_Label
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Selected : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Chip_Label.
   --  @param Selected As for the parent's Chip_Label.
   --  @return The label in Context's locale.

   function Count_Badge_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Count_Badge_Label.
   --  @param Count As for the parent's Count_Badge_Label.
   --  @return The label in Context's locale.

   function Deprecated_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Deprecated_Label.
   --  @return The label in Context's locale.

   function Dismiss_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Dismiss_Label.
   --  @return The label in Context's locale.

   function New_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's New_Label.
   --  @return The label in Context's locale.

   function Overflow_Badge_Label
      (Context      : Humanize.Contexts.Context;
       Hidden_Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Hidden_Count As for the parent's Overflow_Badge_Label.
   --  @return The label in Context's locale.

   function Priority_Badge_Label
      (Context  : Humanize.Contexts.Context;
       Priority : Badge_Priority;
       Name     : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Priority As for the parent's Priority_Badge_Label.
   --  @param Name As for the parent's Priority_Badge_Label.
   --  @return The label in Context's locale.

   function Status_Badge_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Tone    : Badge_Tone)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Status_Badge_Label.
   --  @param Tone As for the parent's Status_Badge_Label.
   --  @return The label in Context's locale.

   function Status_Badge_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Tone    : Badge_Tone;
       Options : Badge_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Status_Badge_Label.
   --  @param Tone As for the parent's Status_Badge_Label.
   --  @param Options As for the parent's Status_Badge_Label.
   --  @return The label in Context's locale.

   function Tag_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Tag_Count_Label.
   --  @return The label in Context's locale.

   function Tag_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Tag_Label.
   --  @return The label in Context's locale.

   function Updated_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Updated_Label.
   --  @return The label in Context's locale.

   procedure Badge_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Tone    : Badge_Tone := Neutral_Tone;
       State   : Badge_State := Default_Badge;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Badge_Label.
   --  @param Tone As for the parent's Badge_Label.
   --  @param State As for the parent's Badge_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Badge_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Tone    : Badge_Tone;
       State   : Badge_State;
       Options : Badge_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Badge_Label.
   --  @param Tone As for the parent's Badge_Label.
   --  @param State As for the parent's Badge_Label.
   --  @param Options As for the parent's Badge_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Badge_Priority_Label_Into
      (Context  : Humanize.Contexts.Context;
       Priority : Badge_Priority;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Priority As for the parent's Badge_Priority_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Badge_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Badge_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Badge_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Badge_Tone_Label_Into
      (Context : Humanize.Contexts.Context;
       Tone    : Badge_Tone;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Tone As for the parent's Badge_Tone_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Chip_Label_Into
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Selected : Boolean := False;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Chip_Label.
   --  @param Selected As for the parent's Chip_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Count_Badge_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Count_Badge_Label.
   --  @param Count As for the parent's Count_Badge_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Deprecated_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Deprecated_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Dismiss_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Dismiss_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure New_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's New_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Overflow_Badge_Label_Into
      (Context      : Humanize.Contexts.Context;
       Hidden_Count : Natural;
       Target       : in out String;
       Written      : out Natural;
       Status       : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Hidden_Count As for the parent's Overflow_Badge_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Priority_Badge_Label_Into
      (Context  : Humanize.Contexts.Context;
       Priority : Badge_Priority;
       Name     : String := "";
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Priority As for the parent's Priority_Badge_Label.
   --  @param Name As for the parent's Priority_Badge_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Status_Badge_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Tone    : Badge_Tone;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Status_Badge_Label.
   --  @param Tone As for the parent's Status_Badge_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Status_Badge_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Tone    : Badge_Tone;
       Options : Badge_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Status_Badge_Label.
   --  @param Tone As for the parent's Status_Badge_Label.
   --  @param Options As for the parent's Status_Badge_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Tag_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Tag_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Tag_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Tag_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Updated_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Updated_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Badges.Localized;
