with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Selections;

package body Humanize.Badges.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Badge_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Tone    : Badge_Tone := Neutral_Tone;
       State   : Badge_State := Default_Badge)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Badges.Badge_Label (Name => Name, Tone => Tone, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.badges.badge_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "tone", Lower (Badge_Tone'Image (Tone)));
      Selection := Sel.With_Arg (Selection, "state", Lower (Badge_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Badge_Label;

   function Badge_Priority_Label
      (Context  : Humanize.Contexts.Context;
       Priority : Badge_Priority)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Badges.Badge_Priority_Label (Priority => Priority);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.badges.badge_priority_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "priority", Lower (Badge_Priority'Image (Priority)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Badge_Priority_Label;

   function Badge_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Badge_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Badges.Badge_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.badges.badge_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Badge_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Badge_State_Label;

   function Badge_Tone_Label
      (Context : Humanize.Contexts.Context;
       Tone    : Badge_Tone)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Badges.Badge_Tone_Label (Tone => Tone);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.badges.badge_tone_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "tone", Lower (Badge_Tone'Image (Tone)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Badge_Tone_Label;

   function Chip_Label
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Selected : Boolean := False)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Badges.Chip_Label (Name => Name, Selected => Selected);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.badges.chip_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "selected", Lower (Boolean'Image (Selected)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Chip_Label;

   function Count_Badge_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Badges.Count_Badge_Label (Name => Name, Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.badges.count_badge_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Count_Badge_Label;

   function Deprecated_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Badges.Deprecated_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.badges.deprecated_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Deprecated_Label;

   function Dismiss_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Badges.Dismiss_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.badges.dismiss_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Dismiss_Label;

   function New_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Badges.New_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.badges.new_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end New_Label;

   function Overflow_Badge_Label
      (Context      : Humanize.Contexts.Context;
       Hidden_Count : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Badges.Overflow_Badge_Label (Hidden_Count => Hidden_Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.badges.overflow_badge_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "hidden_count", Long_Long_Integer (Hidden_Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Overflow_Badge_Label;

   function Priority_Badge_Label
      (Context  : Humanize.Contexts.Context;
       Priority : Badge_Priority;
       Name     : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Badges.Priority_Badge_Label (Priority => Priority, Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.badges.priority_badge_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "priority", Lower (Badge_Priority'Image (Priority)));
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Priority_Badge_Label;

   function Status_Badge_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Tone    : Badge_Tone)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Badges.Status_Badge_Label (Name => Name, Tone => Tone);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.badges.status_badge_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "tone", Lower (Badge_Tone'Image (Tone)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Status_Badge_Label;

   function Tag_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Badges.Tag_Count_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.badges.tag_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Tag_Count_Label;

   function Tag_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Badges.Tag_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.badges.tag_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Tag_Label;

   function Updated_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Badges.Updated_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.badges.updated_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Updated_Label;

   procedure Badge_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Tone    : Badge_Tone := Neutral_Tone;
       State   : Badge_State := Default_Badge;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Badge_Label (Context, Name, Tone, State), Target, Written, Status);
   end Badge_Label_Into;

   procedure Badge_Priority_Label_Into
      (Context  : Humanize.Contexts.Context;
       Priority : Badge_Priority;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Badge_Priority_Label (Context, Priority), Target, Written, Status);
   end Badge_Priority_Label_Into;

   procedure Badge_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Badge_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Badge_State_Label (Context, State), Target, Written, Status);
   end Badge_State_Label_Into;

   procedure Badge_Tone_Label_Into
      (Context : Humanize.Contexts.Context;
       Tone    : Badge_Tone;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Badge_Tone_Label (Context, Tone), Target, Written, Status);
   end Badge_Tone_Label_Into;

   procedure Chip_Label_Into
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Selected : Boolean := False;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Chip_Label (Context, Name, Selected), Target, Written, Status);
   end Chip_Label_Into;

   procedure Count_Badge_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Count_Badge_Label (Context, Name, Count), Target, Written, Status);
   end Count_Badge_Label_Into;

   procedure Deprecated_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Deprecated_Label (Context, Name), Target, Written, Status);
   end Deprecated_Label_Into;

   procedure Dismiss_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Dismiss_Label (Context, Name), Target, Written, Status);
   end Dismiss_Label_Into;

   procedure New_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (New_Label (Context, Name), Target, Written, Status);
   end New_Label_Into;

   procedure Overflow_Badge_Label_Into
      (Context      : Humanize.Contexts.Context;
       Hidden_Count : Natural;
       Target       : in out String;
       Written      : out Natural;
       Status       : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Overflow_Badge_Label (Context, Hidden_Count), Target, Written, Status);
   end Overflow_Badge_Label_Into;

   procedure Priority_Badge_Label_Into
      (Context  : Humanize.Contexts.Context;
       Priority : Badge_Priority;
       Name     : String := "";
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Priority_Badge_Label (Context, Priority, Name), Target, Written, Status);
   end Priority_Badge_Label_Into;

   procedure Status_Badge_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Tone    : Badge_Tone;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Status_Badge_Label (Context, Name, Tone), Target, Written, Status);
   end Status_Badge_Label_Into;

   procedure Tag_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Tag_Count_Label (Context, Count), Target, Written, Status);
   end Tag_Count_Label_Into;

   procedure Tag_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Tag_Label (Context, Name), Target, Written, Status);
   end Tag_Label_Into;

   procedure Updated_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Updated_Label (Context, Name), Target, Written, Status);
   end Updated_Label_Into;

end Humanize.Badges.Localized;
