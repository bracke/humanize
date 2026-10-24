with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
with Humanize.Selections;

package body Humanize.Resources.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Cache_Hit_Rate_Label
      (Context : Humanize.Contexts.Context;
       Hits    : Resource_Count;
       Misses  : Resource_Count)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Resources.Cache_Hit_Rate_Label (Hits => Hits, Misses => Misses);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.resources.cache_hit_rate_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", (if Hits + Misses = 0 then "none" else "some"));
      Selection := Sel.With_Arg (Selection, "percent", (if Hits + Misses = 0 then "" else
        Humanize.Label_Values.Percent (Context, Long_Float (Hits) * 100.0 / Long_Float (Hits + Misses))));
      Selection := Sel.With_Arg (Selection, "hits", Long_Long_Integer (Hits));
      Selection := Sel.With_Arg (Selection, "misses", Long_Long_Integer (Misses));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Cache_Hit_Rate_Label;

   function Quota_Label
      (Context : Humanize.Contexts.Context;
       Used    : Resource_Count;
       Limit   : Resource_Count;
       Unit    : String := "units")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Resources.Quota_Label (Used => Used, Limit => Limit, Unit => Unit);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.resources.quota_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", (if Used > Limit then "exceeded" elsif Long_Float (Used) * 100.0
        / Long_Float (Limit) >= 90.0 then "near" else "available"));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer ((if Used > Limit then Used - Limit else Limit
        - Used)));
      Selection := Sel.With_Arg (Selection, "unit", Humanize.Label_Values.Unit_Or (Unit, "units"));
      Selection := Sel.With_Arg (Selection, "percent", Humanize.Label_Values.Percent (Context, Long_Float (Used) *
        100.0 / Long_Float (Limit)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Quota_Label;

   function Remaining_Label
      (Context : Humanize.Contexts.Context;
       Used    : Resource_Count;
       Total   : Resource_Count;
       Unit    : String := "units")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Resources.Remaining_Label (Used => Used, Total => Total, Unit => Unit);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.resources.remaining_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", (if Used > Total then "over" else "left"));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer ((if Used > Total then Used - Total else Total
        - Used)));
      Selection := Sel.With_Arg (Selection, "unit", Humanize.Label_Values.Unit_Or (Unit, "units"));
      Selection := Sel.With_Arg (Selection, "total", Long_Long_Integer (Total));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Remaining_Label;

   function Saturation_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Percent : Percent_Value;
       Options : Utilization_Options := Default_Utilization_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Resources.Saturation_Label (Name => Name, Percent => Percent, Options => Options);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.resources.saturation_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "named", (if Humanize.Bounded_Text.Clean (Name) = "" then "no" else
        "yes"));
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "percent", Humanize.Label_Values.Percent (Context, Long_Float (Percent)));
      Selection := Sel.With_Arg (Selection, "band", Humanize.Label_Values.Text_Of (Utilization_Band_Label (Context,
        Band_For_Percent (Long_Float (Percent), Options))));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Saturation_Label;

   function Utilization_Band_Label
      (Context : Humanize.Contexts.Context;
       Band    : Utilization_Band)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Resources.Utilization_Band_Label (Band => Band);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.resources.utilization_band_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "band", Lower (Utilization_Band'Image (Band)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Utilization_Band_Label;

   function Utilization_Label
      (Context : Humanize.Contexts.Context;
       Used    : Resource_Count;
       Total   : Resource_Count;
       Unit    : String := "units";
       Options : Utilization_Options := Default_Utilization_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Resources.Utilization_Label (Used => Used, Total => Total, Unit => Unit, Options => Options);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.resources.utilization_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "used", Long_Long_Integer (Used));
      Selection := Sel.With_Arg (Selection, "total", Long_Long_Integer (Total));
      Selection := Sel.With_Arg (Selection, "unit", Humanize.Label_Values.Unit_Or (Unit, "units"));
      Selection := Sel.With_Arg (Selection, "percent", Humanize.Label_Values.Percent (Context, Long_Float (Used) *
        100.0 / Long_Float (Total)));
      Selection := Sel.With_Arg (Selection, "band", Humanize.Label_Values.Text_Of (Utilization_Band_Label (Context,
        Utilization_Band_Of (Used, Total, Options))));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Utilization_Label;

   procedure Cache_Hit_Rate_Label_Into
      (Context : Humanize.Contexts.Context;
       Hits    : Resource_Count;
       Misses  : Resource_Count;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Cache_Hit_Rate_Label (Context, Hits => Hits, Misses => Misses),
         Target, Written, Status);
   end Cache_Hit_Rate_Label_Into;

   procedure Quota_Label_Into
      (Context : Humanize.Contexts.Context;
       Used    : Resource_Count;
       Limit   : Resource_Count;
       Unit    : String := "units";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Quota_Label (Context, Used => Used, Limit => Limit, Unit => Unit),
         Target, Written, Status);
   end Quota_Label_Into;

   procedure Remaining_Label_Into
      (Context : Humanize.Contexts.Context;
       Used    : Resource_Count;
       Total   : Resource_Count;
       Unit    : String := "units";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Remaining_Label (Context, Used => Used, Total => Total, Unit => Unit),
         Target, Written, Status);
   end Remaining_Label_Into;

   procedure Saturation_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Percent : Percent_Value;
       Options : Utilization_Options := Default_Utilization_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Saturation_Label (Context, Name => Name, Percent => Percent, Options => Options),
         Target, Written, Status);
   end Saturation_Label_Into;

   procedure Utilization_Band_Label_Into
      (Context : Humanize.Contexts.Context;
       Band    : Utilization_Band;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Utilization_Band_Label (Context, Band => Band), Target, Written, Status);
   end Utilization_Band_Label_Into;

   procedure Utilization_Label_Into
      (Context : Humanize.Contexts.Context;
       Used    : Resource_Count;
       Total   : Resource_Count;
       Unit    : String := "units";
       Options : Utilization_Options := Default_Utilization_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Utilization_Label (Context, Used => Used, Total => Total, Unit => Unit, Options => Options),
         Target, Written, Status);
   end Utilization_Label_Into;

end Humanize.Resources.Localized;
