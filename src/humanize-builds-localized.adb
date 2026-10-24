with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Selections;

package body Humanize.Builds.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Artifact_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Artifact_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Builds.Artifact_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.builds.artifact_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Artifact_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Artifact_State_Label;

   function Benchmark_Label
      (Context     : Humanize.Contexts.Context;
       Name        : String;
       Result_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Builds.Benchmark_Label (Name => Name, Result_Text => Result_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.builds.benchmark_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "result_text", Humanize.Bounded_Text.Clean (Result_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Benchmark_Label;

   function Build_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Build_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Builds.Build_Label (Name => Name, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.builds.build_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "state", Lower (Build_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Build_Label;

   function Build_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Build_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Builds.Build_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.builds.build_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Build_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Build_State_Label;

   function Coverage_Label
      (Context      : Humanize.Contexts.Context;
       Percent_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Builds.Coverage_Label (Percent_Text => Percent_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.builds.coverage_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "percent_text", Humanize.Bounded_Text.Clean (Percent_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Coverage_Label;

   function Gate_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Gate_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Builds.Gate_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.builds.gate_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Gate_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Gate_State_Label;

   function Test_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       State   : Test_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Builds.Test_Count_Label (Count => Count, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.builds.test_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      Selection := Sel.With_Arg (Selection, "state", Lower (Test_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Test_Count_Label;

   function Test_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Test_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Builds.Test_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.builds.test_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Test_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Test_State_Label;

   procedure Artifact_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Artifact_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Artifact_State_Label (Context, State), Target, Written, Status);
   end Artifact_State_Label_Into;

   procedure Benchmark_Label_Into
      (Context     : Humanize.Contexts.Context;
       Name        : String;
       Result_Text : String;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Benchmark_Label (Context, Name, Result_Text), Target, Written, Status);
   end Benchmark_Label_Into;

   procedure Build_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Build_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Build_Label (Context, Name, State), Target, Written, Status);
   end Build_Label_Into;

   procedure Build_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Build_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Build_State_Label (Context, State), Target, Written, Status);
   end Build_State_Label_Into;

   procedure Coverage_Label_Into
      (Context      : Humanize.Contexts.Context;
       Percent_Text : String;
       Target       : in out String;
       Written      : out Natural;
       Status       : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Coverage_Label (Context, Percent_Text), Target, Written, Status);
   end Coverage_Label_Into;

   procedure Gate_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Gate_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Gate_State_Label (Context, State), Target, Written, Status);
   end Gate_State_Label_Into;

   procedure Test_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       State   : Test_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Test_Count_Label (Context, Count, State), Target, Written, Status);
   end Test_Count_Label_Into;

   procedure Test_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Test_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Test_State_Label (Context, State), Target, Written, Status);
   end Test_State_Label_Into;

end Humanize.Builds.Localized;
