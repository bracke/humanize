with Humanize.Status;

package Humanize.Capabilities is
   type Capability_Area is
     (Datetime_Area,
      Duration_Area,
      Bytes_Area,
      Color_Area,
      Number_Area,
      String_Area,
      List_Area,
      Frequency_Area,
      Rate_Area,
      Unit_Area,
      Phrase_Area,
      Parsing_Area);

   type Locale_Behavior is
     (Catalog_Localized,
      Deterministic_Locale_Aware,
      Deterministic_English,
      Mixed_Localized_Deterministic);
   --  Catalog_Localized means output is primarily rendered by i18n catalogs.
   --  Deterministic_Locale_Aware means Humanize owns fixed wording but selects
   --  shipped locale variants itself.
   --  Deterministic_English means Humanize owns fixed English/structural text.
   --  Mixed_Localized_Deterministic means the area contains both catalog output
   --  and Humanize-owned deterministic labels or fallbacks.

   function Area_Label
     (Area : Capability_Area)
      return Humanize.Status.Text_Result;
   --  @param Area Public Humanize capability area.
   --  @return Lowercase stable area label.

   function Area_Rendering_Source
     (Area : Capability_Area)
      return Humanize.Rendering_Source;
   --  @param Area Public Humanize capability area.
   --  @return Whether the area renders through locale catalogs or fixed text.

   function Area_Locale_Behavior
     (Area : Capability_Area)
      return Locale_Behavior;
   --  @param Area Public Humanize capability area.
   --  @return Stable locale behavior classification for the area.

   function Rendering_Source_Label
     (Source : Humanize.Rendering_Source)
      return Humanize.Status.Text_Result;
   --  @param Source Rendering-source metadata value.
   --  @return Lowercase stable source label.

   function Locale_Behavior_Label
     (Behavior : Locale_Behavior)
      return Humanize.Status.Text_Result;
   --  @param Behavior Locale behavior metadata value.
   --  @return Lowercase stable behavior label.

   procedure Area_Label_Into
     (Area    : Capability_Area;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Area Public Humanize capability area.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Rendering_Source_Label_Into
     (Source  : Humanize.Rendering_Source;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Source Rendering-source metadata value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Locale_Behavior_Label_Into
     (Behavior : Locale_Behavior;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Behavior Locale behavior metadata value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function Capability_Summary
     return Humanize.Status.Text_Result;
   --  @return Space-separated public capability area labels.

   function Locale_Behavior_Summary
     return Humanize.Status.Text_Result;
   --  @return Space-separated locale behavior labels used by Humanize.

   procedure Capability_Summary_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Locale_Behavior_Summary_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
end Humanize.Capabilities;
