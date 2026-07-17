with Humanize.Bounded_Text;

package body Humanize.Numbers.Statistics is
   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function Natural_Text (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Status_Text
     (Status : Humanize.Status.Status_Code;
      Text   : String)
      return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Status_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Plain_Float (Value : Long_Float) return String is
     (Humanize.Bounded_Text.Float_Image (Value));

   function With_Unit (Value : Long_Float; Unit : String) return String is
      Plain : constant String := Plain_Float (Value);
      Clean_Unit : constant String := Trim (Unit);
   begin
      if Clean_Unit'Length = 0 then
         return Plain;
      else
         return Plain & " " & Clean_Unit;
      end if;
   end With_Unit;

   function Distribution_Summary_Label
     (Count   : Natural;
      Minimum : Long_Float;
      Median  : Long_Float;
      Maximum : Long_Float;
      Unit    : String := "")
      return Humanize.Status.Text_Result
   is
   begin
      if Count = 0 then
         return Ok_Text ("no observations");
      else
         return Ok_Text
           (Natural_Text (Count) & " observations, min "
            & With_Unit (Minimum, Unit) & ", median "
            & With_Unit (Median, Unit) & ", max "
            & With_Unit (Maximum, Unit));
      end if;
   end Distribution_Summary_Label;

   function Percentile_Summary_Label
     (P50  : Long_Float;
      P95  : Long_Float;
      P99  : Long_Float;
      Unit : String := "")
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        ("p50 " & With_Unit (P50, Unit) & ", p95 "
         & With_Unit (P95, Unit) & ", p99 " & With_Unit (P99, Unit));
   end Percentile_Summary_Label;

   function Outlier_Summary_Label
     (Outliers : Natural;
      Total    : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Outliers > Total then
         return Status_Text
           (Humanize.Status.Invalid_Argument, "invalid outlier count");
      elsif Total = 0 then
         return Ok_Text ("no observations");
      else
         return Ok_Text
           (Natural_Text (Outliers) & " "
            & (if Outliers = 1 then "outlier" else "outliers")
            & " out of " & Natural_Text (Total)
            & " observations");
      end if;
   end Outlier_Summary_Label;

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
      return Humanize.Status.Text_Result
   is
      Metadata : constant Distribution_Shape_Metadata :=
        Distribution_Shape_Metadata_For
          (Count, Minimum, Q1, Median, Q3, Maximum, Mean, Stddev, Outliers);
   begin
      if Metadata.Kind = Invalid_Distribution_Shape then
         return Status_Text
           (Humanize.Status.Invalid_Argument, "invalid distribution shape");
      elsif Metadata.Kind = Wide_Spread_Shape then
         return Ok_Text
           ("wide-spread distribution from "
            & With_Unit (Minimum, Unit) & " to "
            & With_Unit (Maximum, Unit));
      else
         return Distribution_Shape_Label (Metadata, Median, Unit);
      end if;
   end Distribution_Shape_Label;

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
      return Distribution_Shape_Metadata
   is
      Range_Value : constant Long_Float := Maximum - Minimum;
      IQR         : constant Long_Float := Q3 - Q1;
      Left_Tail   : constant Long_Float := Median - Minimum;
      Right_Tail  : constant Long_Float := Maximum - Median;
      Center      : constant Long_Float :=
        (if Mean /= 0.0 then Mean else Median);
      Kind        : Distribution_Shape_Kind := Balanced_Shape;
   begin
      if Count = 0 then
         Kind := No_Distribution_Shape;
      elsif Count < 5 then
         Kind := Sample_Too_Small_Shape;
      elsif Maximum < Minimum or else Q3 < Q1 then
         Kind := Invalid_Distribution_Shape;
      elsif Range_Value = 0.0 then
         Kind := Flat_Shape;
      elsif Outliers * 5 >= Count then
         Kind := Outlier_Heavy_Shape;
      elsif Stddev > 0.0 and then Stddev * 2.0 >= abs Center then
         Kind := Volatile_Shape;
      elsif IQR <= Range_Value / 10.0 then
         Kind := Clustered_Shape;
      elsif IQR >= Range_Value / 2.0 then
         Kind := Wide_Spread_Shape;
      elsif Right_Tail >= Left_Tail * 2.0 then
         Kind := Right_Skewed_Shape;
      elsif Left_Tail >= Right_Tail * 2.0 then
         Kind := Left_Skewed_Shape;
      end if;

      return
        (Kind              => Kind,
         Count             => Count,
         Spread            => Range_Value,
         IQR               => IQR,
         Outliers          => Outliers,
         Strong_Conclusion => Count >= 20 and then Kind not in
           No_Distribution_Shape | Sample_Too_Small_Shape
             | Invalid_Distribution_Shape);
   end Distribution_Shape_Metadata_For;

   function Distribution_Shape_Label
     (Metadata : Distribution_Shape_Metadata;
      Median   : Long_Float := 0.0;
      Unit     : String := "")
      return Humanize.Status.Text_Result
   is
   begin
      case Metadata.Kind is
         when No_Distribution_Shape =>
            return Ok_Text ("no observations");
         when Sample_Too_Small_Shape =>
            return Ok_Text
              ("sample too small to describe shape, "
               & Natural_Text (Metadata.Count)
               & " observations");
         when Invalid_Distribution_Shape =>
            return Status_Text
              (Humanize.Status.Invalid_Argument,
               "invalid distribution shape");
         when Flat_Shape =>
            return Ok_Text ("flat distribution at " & With_Unit (Median, Unit));
         when Outlier_Heavy_Shape =>
            return Ok_Text
              ("outlier-heavy distribution around "
               & With_Unit (Median, Unit));
         when Volatile_Shape =>
            return Ok_Text
              ("volatile distribution around " & With_Unit (Median, Unit));
         when Clustered_Shape =>
            return Ok_Text
              ("clustered distribution around " & With_Unit (Median, Unit));
         when Wide_Spread_Shape =>
            return Ok_Text ("wide-spread distribution");
         when Right_Skewed_Shape =>
            return Ok_Text
              ("right-skewed distribution, median "
               & With_Unit (Median, Unit));
         when Left_Skewed_Shape =>
            return Ok_Text
              ("left-skewed distribution, median " & With_Unit (Median, Unit));
         when Balanced_Shape =>
            return Ok_Text
              ("mostly balanced distribution around "
               & With_Unit (Median, Unit));
      end case;
   end Distribution_Shape_Label;

   function Distribution_Shape_Kind_Text
     (Kind : Distribution_Shape_Kind)
      return String
   is
   begin
      case Kind is
         when No_Distribution_Shape => return "none";
         when Sample_Too_Small_Shape => return "sample-too-small";
         when Flat_Shape => return "flat";
         when Clustered_Shape => return "clustered";
         when Wide_Spread_Shape => return "wide-spread";
         when Right_Skewed_Shape => return "right-skewed";
         when Left_Skewed_Shape => return "left-skewed";
         when Volatile_Shape => return "volatile";
         when Outlier_Heavy_Shape => return "outlier-heavy";
         when Balanced_Shape => return "balanced";
         when Invalid_Distribution_Shape => return "invalid";
      end case;
   end Distribution_Shape_Kind_Text;

   function Distribution_Shape_Metadata_Label
     (Metadata : Distribution_Shape_Metadata)
      return Humanize.Status.Text_Result
   is
      Confidence : constant String :=
        (if Metadata.Strong_Conclusion then "strong" else "weak");
   begin
      return Ok_Text
        ("shape=" & Distribution_Shape_Kind_Text (Metadata.Kind)
         & " count=" & Natural_Text (Metadata.Count)
         & " spread=" & Plain_Float (Metadata.Spread)
         & " iqr=" & Plain_Float (Metadata.IQR)
         & " outliers=" & Natural_Text (Metadata.Outliers)
         & " confidence=" & Confidence);
   end Distribution_Shape_Metadata_Label;

   procedure Distribution_Summary_Label_Into
     (Count   : Natural;
      Minimum : Long_Float;
      Median  : Long_Float;
      Maximum : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Unit    : String := "")
   is
      Result : constant Humanize.Status.Text_Result :=
        Distribution_Summary_Label (Count, Minimum, Median, Maximum, Unit);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Distribution_Summary_Label_Into;

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
      Unit       : String := "")
   is
      Result : constant Humanize.Status.Text_Result :=
        Distribution_Shape_Label
          (Count, Minimum, Q1, Median, Q3, Maximum, Mean, Stddev, Outliers,
           Unit);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Distribution_Shape_Label_Into;
end Humanize.Numbers.Statistics;
