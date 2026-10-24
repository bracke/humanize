with Ada.Strings.Fixed;
with Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Selections;
with Humanize.Strings.Support;

package body Humanize.Strings.Prose is
   package Shared renames Humanize.Strings.Support;

   function Prose_List
     (Items   : Name_List;
      Options : Prose_List_Options := Default_Prose_List_Options)
      return Humanize.Status.Text_Result renames Shared.Prose_List;

   function Sentence_From_Parts
     (Parts : Name_List)
      return Humanize.Status.Text_Result renames Shared.Sentence_From_Parts;

   function Generic_Range_Label
     (Low     : String;
      High    : String;
      Options : Generic_Range_Options)
      return Humanize.Status.Text_Result renames Shared.Generic_Range_Label;

   function Uncertainty_Label
     (Value       : String;
      Uncertainty : String;
      Unit        : String := "")
      return Humanize.Status.Text_Result renames Shared.Uncertainty_Label;

   function Uncertainty_Label
     (Context     : Humanize.Contexts.Context;
      Value       : String;
      Uncertainty : String;
      Unit        : String := "")
      return Humanize.Status.Text_Result
   is
      use type Humanize.Status.Status_Code;
      use type Ada.Strings.Unbounded.Unbounded_String;
      English : constant Humanize.Status.Text_Result := Uncertainty_Label (Value, Uncertainty, Unit);
      V       : constant String := Ada.Strings.Fixed.Trim (Value, Ada.Strings.Both);
      U       : constant String := Ada.Strings.Fixed.Trim (Uncertainty, Ada.Strings.Both);
      Tail    : constant String := Ada.Strings.Fixed.Trim (Unit, Ada.Strings.Both);
   begin
      if English.Status /= Humanize.Status.Ok or else V = "" or else U = "" then
         return English;
      end if;
      declare
         Center : constant Humanize.Status.Text_Result :=
           Humanize.I18N_Rendering.Phrase_Or
             (Context,
              Humanize.Selections.With_Arg
                (Humanize.Selections.With_Arg (Humanize.Selections.Phrase ("number.plus_minus"), "value", V),
                 "delta", U),
              English);
      begin
         if Center.Status /= Humanize.Status.Ok or else Center.Text = English.Text then
            return Center;
         end if;
         return Humanize.Bounded_Text.Ok_Text
           (Humanize.Bounded_Text.Result_Text (Center) & (if Tail = "" then "" else " " & Tail));
      end;
   end Uncertainty_Label;

   procedure Prose_List_Into
     (Items   : Name_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Prose_List_Options := Default_Prose_List_Options) renames Shared.Prose_List_Into;
end Humanize.Strings.Prose;
