with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Selections;

package body Humanize.Versions.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

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
      Selection := Sel.With_Arg (Selection, "ahead", Long_Long_Integer (Ahead));
      Selection := Sel.With_Arg (Selection, "behind", Long_Long_Integer (Behind));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Commit_Distance_Label;

   procedure Commit_Distance_Label_Into
      (Context : Humanize.Contexts.Context;
       Ahead   : Natural;
       Behind  : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Commit_Distance_Label (Context, Ahead, Behind), Target, Written, Status);
   end Commit_Distance_Label_Into;

end Humanize.Versions.Localized;
