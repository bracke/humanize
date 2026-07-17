with Humanize.Domain_Details;
with Humanize.Status;

--  Deterministic labels for capacity, quota, availability, and utilization.
package Humanize.Resources is
   type Resource_Output_Mode is
     (Resource_Detailed,
      Resource_Compact,
      Resource_Accessible,
      Resource_Log);

   type Resource_Label_Options is record
      Mode             : Resource_Output_Mode := Resource_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;

   Default_Resource_Label_Options : constant Resource_Label_Options :=
     (Mode             => Resource_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Resource_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;

   subtype Resource_Count is Long_Long_Integer range 0 .. Long_Long_Integer'Last;

   subtype Percent_Value is Long_Float range 0.0 .. Long_Float'Last;

   type Utilization_Band is
     (Empty_Utilization,
      Low_Utilization,
      Normal_Utilization,
      High_Utilization,
      Critical_Utilization,
      Full_Utilization,
      Over_Limit_Utilization);
   --  Utilization categories for caller-supplied resource values.

   type Utilization_Options is record
      Low_Threshold      : Percent_Value := 20.0;
      High_Threshold     : Percent_Value := 80.0;
      Critical_Threshold : Percent_Value := 95.0;
   end record;
   --  Thresholds used to classify utilization percentages.

   Default_Utilization_Options : constant Utilization_Options :=
     (Low_Threshold      => 20.0,
      High_Threshold     => 80.0,
      Critical_Threshold => 95.0);

   function Utilization_Band_Of
     (Used    : Resource_Count;
      Total   : Resource_Count;
      Options : Utilization_Options := Default_Utilization_Options)
      return Utilization_Band;
   --  @param Used Used resource units.
   --  @param Total Total resource units.
   --  @param Options Threshold policy.
   --  @return Utilization band for Used divided by Total.

   function Utilization_Band_Label
     (Band : Utilization_Band)
      return Humanize.Status.Text_Result;
   --  @param Band Utilization category.
   --  @return Stable human-readable band label.

   function Utilization_Label
     (Used    : Resource_Count;
      Total   : Resource_Count;
      Unit    : String := "units";
      Options : Utilization_Options := Default_Utilization_Options)
      return Humanize.Status.Text_Result;
   --  @param Used Used resource units.
   --  @param Total Total resource units.
   --  @param Unit Resource unit label.
   --  @param Options Threshold policy.
   --  @return Human-readable utilization label.

   procedure Utilization_Label_Into
     (Used    : Resource_Count;
      Total   : Resource_Count;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Unit    : String := "units";
      Options : Utilization_Options := Default_Utilization_Options);
   --  @param Used Used resource units.
   --  @param Total Total resource units.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Unit Resource unit label.
   --  @param Options Threshold policy.

   function Remaining_Label
     (Used  : Resource_Count;
      Total : Resource_Count;
      Unit  : String := "units")
      return Humanize.Status.Text_Result;
   --  @param Used Used resource units.
   --  @param Total Total resource units.
   --  @param Unit Resource unit label.
   --  @return Human-readable remaining-capacity label.

   function Quota_Label
     (Used  : Resource_Count;
      Limit : Resource_Count;
      Unit  : String := "units")
      return Humanize.Status.Text_Result;
   --  @param Used Used quota units.
   --  @param Limit Quota limit.
   --  @param Unit Resource unit label.
   --  @return Human-readable quota status label.

   procedure Quota_Label_Into
     (Used    : Resource_Count;
      Limit   : Resource_Count;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Unit    : String := "units");
   --  @param Used Used quota units.
   --  @param Limit Quota limit.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Unit Resource unit label.

   function Availability_Label
     (Available : Resource_Count;
      Total     : Resource_Count;
      Singular  : String := "replica";
      Plural    : String := "replicas")
      return Humanize.Status.Text_Result;
   --  @param Available Available resource count.
   --  @param Total Total resource count.
   --  @param Singular Singular resource noun.
   --  @param Plural Plural resource noun.
   --  @return Human-readable availability label.

   procedure Availability_Label_Into
     (Available : Resource_Count;
      Total     : Resource_Count;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Singular  : String := "replica";
      Plural    : String := "replicas");
   --  @param Available Available resource count.
   --  @param Total Total resource count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Singular Singular resource noun.
   --  @param Plural Plural resource noun.

   function Cache_Hit_Rate_Label
     (Hits   : Resource_Count;
      Misses : Resource_Count)
      return Humanize.Status.Text_Result;
   --  @param Hits Cache hit count.
   --  @param Misses Cache miss count.
   --  @return Human-readable cache hit-rate label.

   function Saturation_Label
     (Name    : String;
      Percent : Percent_Value;
      Options : Utilization_Options := Default_Utilization_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Resource name such as "CPU" or "queue".
   --  @param Percent Utilization percentage.
   --  @param Options Threshold policy.
   --  @return Human-readable saturation label.

   function Saturation_Label
     (Name       : String;
      Percent    : Percent_Value;
      Options    : Resource_Label_Options;
      Thresholds : Utilization_Options := Default_Utilization_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Resource name such as "CPU" or "queue".
   --  @param Percent Utilization percentage.
   --  @param Options Output mode and metadata inclusion policy.
   --  @param Thresholds Threshold policy.
   --  @return Human-readable saturation label with optional metadata.

   function Utilization_Band_Metadata
     (Band : Utilization_Band)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param Band Utilization category.
   --  @return Severity, tone, and final/actionable metadata for Band.

   function Parse_Saturation_Label
     (Text : String;
      Band : Utilization_Band)
      return Resource_Label_Parse_Result;
   --  @param Text Label in rendered saturation-label form.
   --  @param Band Expected utilization band suffix.
   --  @return Parsed resource name/percent span, band span, metadata, and consumed length.

   function Scan_Saturation_Label
     (Text : String;
      Band : Utilization_Band)
      return Resource_Label_Parse_Result;
   --  @param Text Text beginning with a saturation label.
   --  @param Band Expected utilization band suffix.
   --  @return Parsed saturation-label prefix and consumed length.

   procedure Saturation_Label_Into
     (Name       : String;
      Percent    : Percent_Value;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Options    : Resource_Label_Options;
      Thresholds : Utilization_Options := Default_Utilization_Options);
   --  @param Name Resource name such as "CPU" or "queue".
   --  @param Percent Utilization percentage.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.
   --  @param Thresholds Threshold policy.

end Humanize.Resources;
