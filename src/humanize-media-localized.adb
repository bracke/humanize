with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
with Humanize.Selections;

package body Humanize.Media.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Duration_Label
      (Context       : Humanize.Contexts.Context;
       Duration_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Media.Duration_Label (Duration_Text => Duration_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.media.duration_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "duration_text", Humanize.Bounded_Text.Clean (Duration_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Duration_Label;

   function Media_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Media_Kind)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Media.Media_Kind_Label (Kind => Kind);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.media.media_kind_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "kind", Lower (Media_Kind'Image (Kind)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Media_Kind_Label;

   function Media_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Media_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Media.Media_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.media.media_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Media_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Media_State_Label;

   function Media_Summary
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Media_Kind;
       State   : Media_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Media.Media_Summary (Name => Name, Kind => Kind, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.media.media_summary");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Media_State'Image (State)));
      Selection := Sel.With_Arg (Selection, "kind", Lower (Media_Kind'Image (Kind)));
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Media_Summary;

   function Media_Summary
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Media_Kind;
       State   : Media_State;
       Options : Media_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Media.Media_Summary (Name => Name, Kind => Kind, State => State, Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Media.Media_Summary (Name => Name, Kind => Kind, State => State);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Media_Summary (Context, Name => Name, Kind =>
        Kind, State => State));
   end Media_Summary;

   function Page_Count_Label
      (Context : Humanize.Contexts.Context;
       Pages   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Media.Page_Count_Label (Pages => Pages);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.media.page_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "pages", Long_Long_Integer (Pages));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Page_Count_Label;

   function Resolution_Label
      (Context : Humanize.Contexts.Context;
       Width   : Positive;
       Height  : Positive)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Media.Resolution_Label (Width => Width, Height => Height);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.media.resolution_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "width", Long_Long_Integer (Width));
      Selection := Sel.With_Arg (Selection, "height", Long_Long_Integer (Height));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Resolution_Label;

   procedure Duration_Label_Into
      (Context       : Humanize.Contexts.Context;
       Duration_Text : String;
       Target        : in out String;
       Written       : out Natural;
       Status        : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Duration_Label (Context, Duration_Text => Duration_Text),
         Target, Written, Status);
   end Duration_Label_Into;

   procedure Media_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Media_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Media_Kind_Label (Context, Kind => Kind), Target, Written, Status);
   end Media_Kind_Label_Into;

   procedure Media_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Media_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Media_State_Label (Context, State => State), Target, Written, Status);
   end Media_State_Label_Into;

   procedure Media_Summary_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Media_Kind;
       State   : Media_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Media_Summary (Context, Name => Name, Kind => Kind, State => State),
         Target, Written, Status);
   end Media_Summary_Into;

   procedure Media_Summary_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Media_Kind;
       State   : Media_State;
       Options : Media_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Media_Summary (Context, Name => Name, Kind => Kind, State => State, Options => Options),
         Target, Written, Status);
   end Media_Summary_Into;

   procedure Page_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Pages   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Page_Count_Label (Context, Pages => Pages), Target, Written, Status);
   end Page_Count_Label_Into;

   procedure Resolution_Label_Into
      (Context : Humanize.Contexts.Context;
       Width   : Positive;
       Height  : Positive;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Resolution_Label (Context, Width => Width, Height => Height),
         Target, Written, Status);
   end Resolution_Label_Into;

end Humanize.Media.Localized;
