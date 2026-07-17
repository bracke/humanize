with Humanize.Bounded_Text;

package body Humanize.Resources is
   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function Image (Value : Long_Long_Integer) return String
      renames Humanize.Bounded_Text.Image;

   function Percent_Image (Value : Long_Float) return String is
      Rounded : constant Long_Long_Integer :=
        Long_Long_Integer (Long_Float'Rounding (Value));
   begin
      return Image (Rounded) & "%";
   end Percent_Image;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text
     (Result : Humanize.Status.Text_Result)
      return String
      renames Humanize.Bounded_Text.Result_Text;

   function Invalid_Text return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Invalid_Value_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Domain_Options
     (Options : Resource_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Resource_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Resource_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Resource_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Resource_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Percent_Used
     (Used  : Resource_Count;
      Total : Resource_Count)
      return Long_Float
   is
   begin
      if Total = 0 then
         return 0.0;
      end if;
      return Long_Float (Used) * 100.0 / Long_Float (Total);
   end Percent_Used;

   function Band_For_Percent
     (Percent : Long_Float;
      Options : Utilization_Options)
      return Utilization_Band
   is
   begin
      if Percent = 0.0 then
         return Empty_Utilization;
      elsif Percent > 100.0 then
         return Over_Limit_Utilization;
      elsif Percent >= 100.0 then
         return Full_Utilization;
      elsif Percent >= Options.Critical_Threshold then
         return Critical_Utilization;
      elsif Percent >= Options.High_Threshold then
         return High_Utilization;
      elsif Percent <= Options.Low_Threshold then
         return Low_Utilization;
      else
         return Normal_Utilization;
      end if;
   end Band_For_Percent;

   function Utilization_Band_Of
     (Used    : Resource_Count;
      Total   : Resource_Count;
      Options : Utilization_Options := Default_Utilization_Options)
      return Utilization_Band
   is
   begin
      if Total = 0 then
         return Over_Limit_Utilization;
      end if;

      return Band_For_Percent (Percent_Used (Used, Total), Options);
   end Utilization_Band_Of;

   function Utilization_Band_Label
     (Band : Utilization_Band)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Band is
            when Empty_Utilization      => "empty",
            when Low_Utilization        => "low utilization",
            when Normal_Utilization     => "normal utilization",
            when High_Utilization       => "high utilization",
            when Critical_Utilization   => "critical utilization",
            when Full_Utilization       => "full",
            when Over_Limit_Utilization => "over limit");
   end Utilization_Band_Label;

   function Band_Text (Band : Utilization_Band) return String is
      Result : constant Humanize.Status.Text_Result :=
        Utilization_Band_Label (Band);
   begin
      return Result_Text (Result);
   end Band_Text;

   function Utilization_Band_Suffix (Band : Utilization_Band) return String is
   begin
      return Band_Text (Band);
   end Utilization_Band_Suffix;

   function Utilization_Band_Metadata
     (Band : Utilization_Band)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Resources_Surface,
         Utilization_Band_Suffix (Band));
   end Utilization_Band_Metadata;

   function Clean_Unit (Unit : String) return String is
      Clean : constant String := Trim (Unit);
   begin
      if Clean = "" then
         return "units";
      else
         return Clean;
      end if;
   end Clean_Unit;

   function Utilization_Label
     (Used    : Resource_Count;
      Total   : Resource_Count;
      Unit    : String := "units";
      Options : Utilization_Options := Default_Utilization_Options)
      return Humanize.Status.Text_Result
   is
      Percent : Long_Float;
      Band    : Utilization_Band;
   begin
      if Total = 0 then
         return Invalid_Text;
      end if;

      Percent := Percent_Used (Used, Total);
      Band := Band_For_Percent (Percent, Options);
      return Ok_Text
        (Image (Used) & " of " & Image (Total) & " " & Clean_Unit (Unit)
         & " used (" & Percent_Image (Percent) & ", "
         & Utilization_Band_Suffix (Band) & ")");
   end Utilization_Label;

   procedure Utilization_Label_Into
     (Used    : Resource_Count;
      Total   : Resource_Count;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Unit    : String := "units";
      Options : Utilization_Options := Default_Utilization_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Utilization_Label (Used, Total, Unit, Options);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Utilization_Label_Into;

   function Remaining_Label
     (Used  : Resource_Count;
      Total : Resource_Count;
      Unit  : String := "units")
      return Humanize.Status.Text_Result
   is
      Remaining : constant Long_Long_Integer := Long_Long_Integer (Total) - Long_Long_Integer (Used);
   begin
      if Total = 0 then
         return Invalid_Text;
      elsif Remaining < 0 then
         return Ok_Text
           (Image (-Remaining) & " " & Clean_Unit (Unit) & " over capacity");
      else
         return Ok_Text
           (Image (Remaining) & " of " & Image (Total) & " " & Clean_Unit (Unit)
            & " remaining");
      end if;
   end Remaining_Label;

   function Quota_Label
     (Used  : Resource_Count;
      Limit : Resource_Count;
      Unit  : String := "units")
      return Humanize.Status.Text_Result
   is
      Remaining : constant Long_Long_Integer := Long_Long_Integer (Limit) - Long_Long_Integer (Used);
      Percent   : Long_Float;
   begin
      if Limit = 0 then
         return Invalid_Text;
      end if;

      Percent := Percent_Used (Used, Limit);
      if Remaining < 0 then
         return Ok_Text
           ("quota exceeded by " & Image (-Remaining) & " " & Clean_Unit (Unit)
            & " (" & Percent_Image (Percent) & " used)");
      elsif Percent >= 90.0 then
         return Ok_Text
           ("quota near limit: " & Image (Remaining) & " " & Clean_Unit (Unit)
            & " remaining (" & Percent_Image (Percent) & " used)");
      else
         return Ok_Text
           ("quota available: " & Image (Remaining) & " " & Clean_Unit (Unit)
            & " remaining (" & Percent_Image (Percent) & " used)");
      end if;
   end Quota_Label;

   procedure Quota_Label_Into
     (Used    : Resource_Count;
      Limit   : Resource_Count;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Unit    : String := "units")
   is
      Result : constant Humanize.Status.Text_Result :=
        Quota_Label (Used, Limit, Unit);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Quota_Label_Into;

   function Availability_Label
     (Available : Resource_Count;
      Total     : Resource_Count;
      Singular  : String := "replica";
      Plural    : String := "replicas")
      return Humanize.Status.Text_Result
   is
      Noun : constant String := (if Total = 1 then Trim (Singular) else Trim (Plural));
   begin
      if Total = 0 or else Available > Total then
         return Invalid_Text;
      elsif Available = Total then
         return Ok_Text
           (Image (Available) & " of " & Image (Total) & " " & Noun & " available");
      elsif Available = 0 then
         return Ok_Text ("no " & Noun & " available");
      else
         return Ok_Text
           (Image (Available) & " of " & Image (Total) & " " & Noun
            & " available, " & Image (Long_Long_Integer (Total - Available)) & " unavailable");
      end if;
   end Availability_Label;

   procedure Availability_Label_Into
     (Available : Resource_Count;
      Total     : Resource_Count;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Singular  : String := "replica";
      Plural    : String := "replicas")
   is
      Result : constant Humanize.Status.Text_Result :=
        Availability_Label (Available, Total, Singular, Plural);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Availability_Label_Into;

   function Cache_Hit_Rate_Label
     (Hits   : Resource_Count;
      Misses : Resource_Count)
      return Humanize.Status.Text_Result
   is
      Total : constant Resource_Count := Hits + Misses;
      Percent : Long_Float;
   begin
      if Total = 0 then
         return Ok_Text ("cache hit rate unavailable: no requests");
      end if;

      Percent := Percent_Used (Hits, Total);
      return Ok_Text
        ("cache hit rate " & Percent_Image (Percent) & ": "
         & Image (Hits) & " hits, " & Image (Misses) & " misses");
   end Cache_Hit_Rate_Label;

   function Saturation_Label
     (Name    : String;
      Percent : Percent_Value;
      Options : Utilization_Options := Default_Utilization_Options)
      return Humanize.Status.Text_Result
   is
      Clean_Name : constant String := (if Trim (Name) = "" then "resource" else Trim (Name));
      Band       : constant Utilization_Band :=
        Band_For_Percent (Long_Float (Percent), Options);
   begin
      return Ok_Text
        (Clean_Name & " " & Percent_Image (Long_Float (Percent)) & " "
         & Utilization_Band_Suffix (Band));
   end Saturation_Label;

   function Saturation_Label
     (Name       : String;
      Percent    : Percent_Value;
      Options    : Resource_Label_Options;
      Thresholds : Utilization_Options := Default_Utilization_Options)
      return Humanize.Status.Text_Result
   is
      Band : constant Utilization_Band :=
        Band_For_Percent (Long_Float (Percent), Thresholds);
      Base : constant Humanize.Status.Text_Result :=
        Saturation_Label (Name, Percent, Thresholds);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Utilization_Band_Metadata (Band), Domain_Options (Options));
   end Saturation_Label;

   function Parse_Saturation_Label
     (Text : String;
      Band : Utilization_Band)
      return Resource_Label_Parse_Result
   is
      Result : Resource_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Resources_Surface,
         Utilization_Band_Suffix (Band));
      Result.Metadata := Utilization_Band_Metadata (Band);
      return Result;
   end Parse_Saturation_Label;

   function Scan_Saturation_Label
     (Text : String;
      Band : Utilization_Band)
      return Resource_Label_Parse_Result
   is
      Result : Resource_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Resources_Surface,
         Utilization_Band_Suffix (Band));
      Result.Metadata := Utilization_Band_Metadata (Band);
      return Result;
   end Scan_Saturation_Label;

   procedure Saturation_Label_Into
     (Name       : String;
      Percent    : Percent_Value;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Options    : Resource_Label_Options;
      Thresholds : Utilization_Options := Default_Utilization_Options)
   is
   begin
      Copy_Result
        (Saturation_Label (Name, Percent, Options, Thresholds), Target,
         Written, Status);
   end Saturation_Label_Into;

end Humanize.Resources;
