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

   procedure Prose_List_Into
     (Items   : Name_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Prose_List_Options := Default_Prose_List_Options) renames Shared.Prose_List_Into;
end Humanize.Strings.Prose;
