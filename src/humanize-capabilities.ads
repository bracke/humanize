with Humanize.Status;

--  Capability descriptors used to summarize which humanization areas are
--  available to callers.
package Humanize.Capabilities is
   type Capability_Area is
     (Datetime_Area,
      Duration_Area,
      Bytes_Area,
      Color_Area,
      Number_Area,
      String_Area,
      Value_Area,
      Endpoint_Area,
      Resource_Area,
      Version_Area,
      Geo_Area,
      Markup_Area,
      Secret_Area,
      Schema_Area,
      Diagnostic_Area,
      Threshold_Area,
      Workflow_Area,
      Change_Area,
      Table_Area,
      Form_Area,
      Navigation_Area,
      Badge_Area,
      Notification_Area,
      Search_Area,
      Comment_Area,
      Task_Area,
      Attachment_Area,
      Event_Area,
      Payment_Area,
      System_Status_Area,
      Operation_Area,
      Comparison_Area,
      Moderation_Area,
      Account_Area,
      Deployment_Area,
      Data_Quality_Area,
      Media_Area,
      Notification_Preference_Area,
      Permission_Area,
      Build_Area,
      Domain_Detail_Area,
      List_Area,
      Frequency_Area,
      Rate_Area,
      Unit_Area,
      Phrase_Area,
      Parsing_Area,
      Metadata_Area);

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

   type Feature_Support is record
      Has_Bounded_Api      : Boolean := False;
      Has_Options          : Boolean := False;
      Has_Parse            : Boolean := False;
      Has_Scan             : Boolean := False;
      Has_Metadata         : Boolean := False;
      Has_Accessible_Mode  : Boolean := False;
      Has_Cross_Domain     : Boolean := False;
      Has_Privacy_Policy   : Boolean := False;
      Has_Terminal_Layout  : Boolean := False;
      Has_Scheduling       : Boolean := False;
      Has_Statistical_Shape : Boolean := False;
      Has_Narrative        : Boolean := False;
      Has_Label_Parts      : Boolean := False;
      Has_Diff             : Boolean := False;
      Has_Validation       : Boolean := False;
      Has_Stability        : Boolean := False;
   end record;
   --  Stable API-shape metadata for a capability area.

   type Capability_Coverage is record
      Areas          : Natural := 0;
      Bounded        : Natural := 0;
      Options        : Natural := 0;
      Parse          : Natural := 0;
      Scan           : Natural := 0;
      Metadata       : Natural := 0;
      Privacy        : Natural := 0;
      Terminal       : Natural := 0;
      Diff           : Natural := 0;
      Validation     : Natural := 0;
      Stability      : Natural := 0;
   end record;
   --  Aggregate feature-support counts across capability areas.

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

   function Area_Features
     (Area : Capability_Area)
      return Feature_Support;
   --  @param Area Public Humanize capability area.
   --  @return Stable feature-support metadata for the area.

   function Feature_Support_Label
     (Features : Feature_Support)
      return Humanize.Status.Text_Result;
   --  @param Features Feature support metadata.
   --  @return Space-separated stable feature labels.

   function Capability_Coverage_For_All
      return Capability_Coverage;
   --  @return Aggregate support counts for all public capability areas.

   function Capability_Coverage_Label
     (Coverage : Capability_Coverage)
      return Humanize.Status.Text_Result;
   --  @param Coverage Aggregate support counts.
   --  @return Human-readable capability coverage summary.

   function Capability_Matrix_Summary
      return Humanize.Status.Text_Result;
   --  @return Human-readable summary of feature coverage across all areas.

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

   procedure Capability_Matrix_Summary_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
end Humanize.Capabilities;
