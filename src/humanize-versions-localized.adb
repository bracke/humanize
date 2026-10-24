with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
with Humanize.Selections;

package body Humanize.Versions.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Commit_Distance_Label
      (Context : Humanize.Contexts.Context;
       Ahead   : Natural;
       Behind  : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Versions.Commit_Distance_Label (Ahead => Ahead, Behind => Behind);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.versions.commit_distance_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "behind", Long_Long_Integer (Behind));
      Selection := Sel.With_Arg (Selection, "ahead", Long_Long_Integer (Ahead));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Commit_Distance_Label;

   function Commit_Distance_Label
      (Context : Humanize.Contexts.Context;
       Ahead   : Natural;
       Behind  : Natural;
       Options : Version_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Versions.Commit_Distance_Label (Ahead => Ahead, Behind => Behind, Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Versions.Commit_Distance_Label (Ahead => Ahead, Behind => Behind);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Commit_Distance_Label (Context, Ahead => Ahead,
        Behind => Behind));
   end Commit_Distance_Label;

   function Compatibility_Range_Label
      (Context         : Humanize.Contexts.Context;
       Constraint_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Versions.Compatibility_Range_Label (Constraint_Text => Constraint_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.versions.compatibility_range_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_Kind : constant String := Lower (Compatibility_Range_Kind'Image (Compatibility_Range_Kind_Of
           (Humanize.Bounded_Text.Clean (Constraint_Text))));
         D_Version : constant String := (if D_Kind = "exact_range" then Humanize.Label_Values.Value_After (E,
           "exactly version ") elsif D_Kind = "minimum_range" then Humanize.Label_Values.Before
           (Humanize.Label_Values.Value_After (E, "version "), " or newer") elsif D_Kind = "maximum_range" then
           Humanize.Label_Values.Before (Humanize.Label_Values.Value_After (E, "version "), " or older") elsif D_Kind
           = "between_range" then Humanize.Label_Values.Value_After (E, "version range ") else
           Humanize.Label_Values.Value_After (E, " version "));
      begin
         Selection := Sel.With_Arg (Selection, "kind", D_Kind);
         Selection := Sel.With_Arg (Selection, "version", D_Version);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end Compatibility_Range_Label;

   function Compatibility_Range_Label
      (Context         : Humanize.Contexts.Context;
       Constraint_Text : String;
       Options         : Version_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Versions.Compatibility_Range_Label (Constraint_Text => Constraint_Text, Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Versions.Compatibility_Range_Label (Constraint_Text => Constraint_Text);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Compatibility_Range_Label (Context,
        Constraint_Text => Constraint_Text));
   end Compatibility_Range_Label;

   function Release_Label
      (Context : Humanize.Contexts.Context;
       Version : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Versions.Release_Label (Version => Version);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.versions.release_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_State : constant String := (if Humanize.Label_Values.Starts (E, "initial development release ") then
           "initial" elsif Humanize.Label_Values.Starts (E, "prerelease ") then "prerelease" elsif
           Humanize.Label_Values.Starts (E, "major release ") then "major" elsif Humanize.Label_Values.Starts (E,
           "minor release ") then "minor" else "patch");
         D_Version : constant String := Humanize.Label_Values.Value_After (E, "release ");
      begin
         Selection := Sel.With_Arg (Selection, "state", D_State);
         Selection := Sel.With_Arg (Selection, "version", D_Version);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end Release_Label;

   function Release_Label
      (Context : Humanize.Contexts.Context;
       Version : String;
       Options : Version_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Versions.Release_Label (Version => Version, Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Versions.Release_Label (Version => Version);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Release_Label (Context, Version => Version));
   end Release_Label;

   function Version_Delta_Label
      (Context      : Humanize.Contexts.Context;
       From_Version : String;
       To_Version   : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Versions.Version_Delta_Label (From_Version => From_Version, To_Version => To_Version);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.versions.version_delta_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_Delta : constant String := Lower (Version_Delta_Kind'Image (Version_Delta (From_Version, To_Version)));
         D_From : constant String := Humanize.Label_Values.Before (Humanize.Label_Values.Value_After (E, ": "),
           " -> ");
         D_To : constant String := Humanize.Label_Values.Value_After (E, " -> ");
      begin
         Selection := Sel.With_Arg (Selection, "delta", D_Delta);
         Selection := Sel.With_Arg (Selection, "from", D_From);
         Selection := Sel.With_Arg (Selection, "to", D_To);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end Version_Delta_Label;

   function Version_Delta_Label
      (Context      : Humanize.Contexts.Context;
       From_Version : String;
       To_Version   : String;
       Options      : Version_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Versions.Version_Delta_Label
          (From_Version => From_Version,
           To_Version => To_Version,
           Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Versions.Version_Delta_Label (From_Version => From_Version, To_Version => To_Version);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Version_Delta_Label (Context, From_Version =>
        From_Version, To_Version => To_Version));
   end Version_Delta_Label;

   function Version_Label
      (Context : Humanize.Contexts.Context;
       Text    : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Versions.Version_Label (Text => Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.versions.version_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_State : constant String := (if Humanize.Label_Values.Value_After (E, " prerelease ") /= E and then
           Humanize.Label_Values.Value_After (E, " build ") /= E then "both" elsif Humanize.Label_Values.Value_After
           (E, " prerelease ") /= E then "prerelease" elsif Humanize.Label_Values.Value_After (E, " build ") /= E then
           "build" else "plain");
         D_Version : constant String := Humanize.Label_Values.Before (Humanize.Label_Values.Before
           (Humanize.Label_Values.Value_After (E, "version "), " prerelease "), " build ");
         D_Prerelease : constant String := Humanize.Label_Values.Before (Humanize.Label_Values.Value_After (E,
           " prerelease "), " build ");
         D_Build : constant String := Humanize.Label_Values.Value_After (E, " build ");
      begin
         Selection := Sel.With_Arg (Selection, "state", D_State);
         Selection := Sel.With_Arg (Selection, "version", D_Version);
         Selection := Sel.With_Arg (Selection, "prerelease", D_Prerelease);
         Selection := Sel.With_Arg (Selection, "build", D_Build);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end Version_Label;

   function Version_Label
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Options : Version_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Versions.Version_Label (Text => Text, Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Versions.Version_Label (Text => Text);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Version_Label (Context, Text => Text));
   end Version_Label;

   procedure Commit_Distance_Label_Into
      (Context : Humanize.Contexts.Context;
       Ahead   : Natural;
       Behind  : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Commit_Distance_Label (Context, Ahead => Ahead, Behind => Behind),
         Target, Written, Status);
   end Commit_Distance_Label_Into;

   procedure Commit_Distance_Label_Into
      (Context : Humanize.Contexts.Context;
       Ahead   : Natural;
       Behind  : Natural;
       Options : Version_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Commit_Distance_Label (Context, Ahead => Ahead, Behind => Behind, Options => Options),
         Target, Written, Status);
   end Commit_Distance_Label_Into;

   procedure Compatibility_Range_Label_Into
      (Context         : Humanize.Contexts.Context;
       Constraint_Text : String;
       Target          : in out String;
       Written         : out Natural;
       Status          : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Compatibility_Range_Label (Context, Constraint_Text => Constraint_Text),
         Target, Written, Status);
   end Compatibility_Range_Label_Into;

   procedure Compatibility_Range_Label_Into
      (Context         : Humanize.Contexts.Context;
       Constraint_Text : String;
       Options         : Version_Label_Options;
       Target          : in out String;
       Written         : out Natural;
       Status          : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Compatibility_Range_Label (Context, Constraint_Text => Constraint_Text, Options => Options),
         Target, Written, Status);
   end Compatibility_Range_Label_Into;

   procedure Release_Label_Into
      (Context : Humanize.Contexts.Context;
       Version : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Release_Label (Context, Version => Version), Target, Written, Status);
   end Release_Label_Into;

   procedure Release_Label_Into
      (Context : Humanize.Contexts.Context;
       Version : String;
       Options : Version_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Release_Label (Context, Version => Version, Options => Options),
         Target, Written, Status);
   end Release_Label_Into;

   procedure Version_Delta_Label_Into
      (Context      : Humanize.Contexts.Context;
       From_Version : String;
       To_Version   : String;
       Target       : in out String;
       Written      : out Natural;
       Status       : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Version_Delta_Label (Context, From_Version => From_Version, To_Version => To_Version),
         Target, Written, Status);
   end Version_Delta_Label_Into;

   procedure Version_Delta_Label_Into
      (Context      : Humanize.Contexts.Context;
       From_Version : String;
       To_Version   : String;
       Options      : Version_Label_Options;
       Target       : in out String;
       Written      : out Natural;
       Status       : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Version_Delta_Label (Context, From_Version => From_Version, To_Version => To_Version, Options => Options),
         Target, Written, Status);
   end Version_Delta_Label_Into;

   procedure Version_Label_Into
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Version_Label (Context, Text => Text), Target, Written, Status);
   end Version_Label_Into;

   procedure Version_Label_Into
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Options : Version_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Version_Label (Context, Text => Text, Options => Options),
         Target, Written, Status);
   end Version_Label_Into;

end Humanize.Versions.Localized;
