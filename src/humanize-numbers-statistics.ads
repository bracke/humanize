private package Humanize.Numbers.Statistics is
   function Distribution_Summary_Label
     (Count   : Natural;
      Minimum : Long_Float;
      Median  : Long_Float;
      Maximum : Long_Float;
      Unit    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Count Number of observations.
   --  @param Minimum Minimum value.
   --  @param Median Median value.
   --  @param Maximum Maximum value.
   --  @param Unit Optional caller-formatted unit label.
   --  @return Human-readable distribution summary.

   function Percentile_Summary_Label
     (P50  : Long_Float;
      P95  : Long_Float;
      P99  : Long_Float;
      Unit : String := "")
      return Humanize.Status.Text_Result;
   --  @param P50 50th percentile.
   --  @param P95 95th percentile.
   --  @param P99 99th percentile.
   --  @param Unit Optional caller-formatted unit label.
   --  @return Human-readable percentile summary.

   function Outlier_Summary_Label
     (Outliers : Natural;
      Total    : Natural)
      return Humanize.Status.Text_Result;
   --  @param Outliers Number of outlier observations.
   --  @param Total Total observations.
   --  @return Human-readable outlier summary.

   function Distribution_Shape_Label
     (Count      : Natural;
      Minimum    : Long_Float;
      Q1         : Long_Float;
      Median     : Long_Float;
      Q3         : Long_Float;
      Maximum    : Long_Float;
      Mean       : Long_Float := 0.0;
      Stddev     : Long_Float := 0.0;
      Outliers   : Natural := 0;
      Unit       : String := "")
      return Humanize.Status.Text_Result;
   --  @param Count Number of observations.
   --  @param Minimum Minimum value.
   --  @param Q1 First quartile.
   --  @param Median Median value.
   --  @param Q3 Third quartile.
   --  @param Maximum Maximum value.
   --  @param Mean Optional arithmetic mean, used when non-zero.
   --  @param Stddev Optional standard deviation.
   --  @param Outliers Optional outlier count.
   --  @param Unit Optional caller-formatted unit label.
   --  @return Conservative human-readable distribution-shape label.

   function Distribution_Shape_Metadata_For
     (Count      : Natural;
      Minimum    : Long_Float;
      Q1         : Long_Float;
      Median     : Long_Float;
      Q3         : Long_Float;
      Maximum    : Long_Float;
      Mean       : Long_Float := 0.0;
      Stddev     : Long_Float := 0.0;
      Outliers   : Natural := 0)
      return Distribution_Shape_Metadata;
   --  @param Count Number of observations.
   --  @param Minimum Minimum value.
   --  @param Q1 First quartile.
   --  @param Median Median value.
   --  @param Q3 Third quartile.
   --  @param Maximum Maximum value.
   --  @param Mean Optional arithmetic mean, used when non-zero.
   --  @param Stddev Optional standard deviation.
   --  @param Outliers Optional outlier count.
   --  @return Machine-readable distribution-shape metadata.

   function Distribution_Shape_Label
     (Metadata : Distribution_Shape_Metadata;
      Median   : Long_Float := 0.0;
      Unit     : String := "")
      return Humanize.Status.Text_Result;
   --  @param Metadata Distribution-shape metadata to render.
   --  @param Median Optional median value for contextual detail.
   --  @param Unit Optional caller-formatted unit label.
   --  @return Conservative label rendered from shape metadata.

   function Distribution_Shape_Metadata_Label
     (Metadata : Distribution_Shape_Metadata)
      return Humanize.Status.Text_Result;
   --  @param Metadata Distribution-shape metadata to render.
   --  @return Stable metadata summary for distribution shape.

   procedure Distribution_Summary_Label_Into
     (Count   : Natural;
      Minimum : Long_Float;
      Median  : Long_Float;
      Maximum : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Unit    : String := "");
   --  @param Count Number of observations.
   --  @param Minimum Minimum value.
   --  @param Median Median value.
   --  @param Maximum Maximum value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Unit Optional caller-formatted unit label.

   procedure Distribution_Shape_Label_Into
     (Count      : Natural;
      Minimum    : Long_Float;
      Q1         : Long_Float;
      Median     : Long_Float;
      Q3         : Long_Float;
      Maximum    : Long_Float;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Mean       : Long_Float := 0.0;
      Stddev     : Long_Float := 0.0;
      Outliers   : Natural := 0;
      Unit       : String := "");
end Humanize.Numbers.Statistics;
