with Humanize.Contexts;

--  Resources labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Resources.Localized is

   function Cache_Hit_Rate_Label
      (Context : Humanize.Contexts.Context;
       Hits    : Resource_Count;
       Misses  : Resource_Count)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Hits As for the parent's Cache_Hit_Rate_Label.
   --  @param Misses As for the parent's Cache_Hit_Rate_Label.
   --  @return The label in Context's locale.

   function Quota_Label
      (Context : Humanize.Contexts.Context;
       Used    : Resource_Count;
       Limit   : Resource_Count;
       Unit    : String := "units")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Used As for the parent's Quota_Label.
   --  @param Limit As for the parent's Quota_Label.
   --  @param Unit As for the parent's Quota_Label.
   --  @return The label in Context's locale.

   function Remaining_Label
      (Context : Humanize.Contexts.Context;
       Used    : Resource_Count;
       Total   : Resource_Count;
       Unit    : String := "units")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Used As for the parent's Remaining_Label.
   --  @param Total As for the parent's Remaining_Label.
   --  @param Unit As for the parent's Remaining_Label.
   --  @return The label in Context's locale.

   function Saturation_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Percent : Percent_Value;
       Options : Utilization_Options := Default_Utilization_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Saturation_Label.
   --  @param Percent As for the parent's Saturation_Label.
   --  @param Options As for the parent's Saturation_Label.
   --  @return The label in Context's locale.

   function Utilization_Band_Label
      (Context : Humanize.Contexts.Context;
       Band    : Utilization_Band)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Band As for the parent's Utilization_Band_Label.
   --  @return The label in Context's locale.

   function Utilization_Label
      (Context : Humanize.Contexts.Context;
       Used    : Resource_Count;
       Total   : Resource_Count;
       Unit    : String := "units";
       Options : Utilization_Options := Default_Utilization_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Used As for the parent's Utilization_Label.
   --  @param Total As for the parent's Utilization_Label.
   --  @param Unit As for the parent's Utilization_Label.
   --  @param Options As for the parent's Utilization_Label.
   --  @return The label in Context's locale.

   procedure Cache_Hit_Rate_Label_Into
      (Context : Humanize.Contexts.Context;
       Hits    : Resource_Count;
       Misses  : Resource_Count;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Hits As for the parent's Cache_Hit_Rate_Label.
   --  @param Misses As for the parent's Cache_Hit_Rate_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Quota_Label_Into
      (Context : Humanize.Contexts.Context;
       Used    : Resource_Count;
       Limit   : Resource_Count;
       Unit    : String := "units";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Used As for the parent's Quota_Label.
   --  @param Limit As for the parent's Quota_Label.
   --  @param Unit As for the parent's Quota_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Remaining_Label_Into
      (Context : Humanize.Contexts.Context;
       Used    : Resource_Count;
       Total   : Resource_Count;
       Unit    : String := "units";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Used As for the parent's Remaining_Label.
   --  @param Total As for the parent's Remaining_Label.
   --  @param Unit As for the parent's Remaining_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Saturation_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Percent : Percent_Value;
       Options : Utilization_Options := Default_Utilization_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Saturation_Label.
   --  @param Percent As for the parent's Saturation_Label.
   --  @param Options As for the parent's Saturation_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Utilization_Band_Label_Into
      (Context : Humanize.Contexts.Context;
       Band    : Utilization_Band;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Band As for the parent's Utilization_Band_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Utilization_Label_Into
      (Context : Humanize.Contexts.Context;
       Used    : Resource_Count;
       Total   : Resource_Count;
       Unit    : String := "units";
       Options : Utilization_Options := Default_Utilization_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Used As for the parent's Utilization_Label.
   --  @param Total As for the parent's Utilization_Label.
   --  @param Unit As for the parent's Utilization_Label.
   --  @param Options As for the parent's Utilization_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Resources.Localized;
