with Humanize.Phrases.Support;

package body Humanize.Phrases.Fields is
   package Shared renames Humanize.Phrases.Support;

   function Field_Change_Summary
     (Context  : Humanize.Contexts.Context;
      Changed  : Natural;
      Added    : Natural;
      Removed  : Natural;
      Singular : String := "field";
      Plural   : String := "fields")
      return Humanize.Status.Text_Result renames Shared.Field_Change_Summary;

   function Field_Diff_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Before  : String;
      After   : String)
      return Humanize.Status.Text_Result renames Shared.Field_Diff_Summary;

   function Field_Added_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String)
      return Humanize.Status.Text_Result renames Shared.Field_Added_Summary;

   function Field_Removed_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String)
      return Humanize.Status.Text_Result renames Shared.Field_Removed_Summary;

   function Field_Unchanged_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String)
      return Humanize.Status.Text_Result renames Shared.Field_Unchanged_Summary;

   procedure Field_Change_Summary_Into
     (Context  : Humanize.Contexts.Context;
      Changed  : Natural;
      Added    : Natural;
      Removed  : Natural;
      Singular : String;
      Plural   : String;
      Target   : in out String;
      Written  : out Natural;
      Code     : out Humanize.Status.Status_Code) renames Shared.Field_Change_Summary_Into;

   procedure Field_Diff_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Before  : String;
      After   : String;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Field_Diff_Summary_Into;

   procedure Field_Added_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Field_Added_Summary_Into;

   procedure Field_Removed_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Field_Removed_Summary_Into;

   procedure Field_Unchanged_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Value   : String;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Field_Unchanged_Summary_Into;
end Humanize.Phrases.Fields;
