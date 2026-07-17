with Humanize.Phrases.Support;

package body Humanize.Phrases.Summaries is
   package Shared renames Humanize.Phrases.Support;

   function Domain_Label
     (Domain : Summary_Domain)
      return Humanize.Status.Text_Result renames Shared.Domain_Label;

   function Summary_State_Label
     (State : Summary_State)
      return Humanize.Status.Text_Result renames Shared.Summary_State_Label;

   function Domain_Summary
     (Context   : Humanize.Contexts.Context;
      Domain    : Summary_Domain;
      State     : Summary_State;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result renames Shared.Domain_Summary;

   function Queue_Summary
     (Context   : Humanize.Contexts.Context;
      Queued    : Natural;
      Running   : Natural;
      Failed    : Natural := 0;
      Completed : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result renames Shared.Queue_Summary;

   function Cache_Summary
     (Context : Humanize.Contexts.Context;
      Hits    : Natural;
      Misses  : Natural)
      return Humanize.Status.Text_Result renames Shared.Cache_Summary;

   function Sync_Summary
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result renames Shared.Sync_Summary;

   function Import_Summary
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result renames Shared.Import_Summary;

   function Export_Summary
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result renames Shared.Export_Summary;

   function File_Size_Comparison
     (Context        : Humanize.Contexts.Context;
      Current        : Humanize.Bytes.Byte_Count;
      Baseline       : Humanize.Bytes.Byte_Count;
      Current_Label  : String := "file";
      Baseline_Label : String := "baseline";
      Options        : Humanize.Bytes.Byte_Options :=
        Humanize.Bytes.Default_Byte_Options)
      return Humanize.Status.Text_Result renames Shared.File_Size_Comparison;

   function Date_Comparison
     (Context        : Humanize.Contexts.Context;
      Value          : Humanize.Datetimes.Civil_Date_Time;
      Reference      : Humanize.Datetimes.Civil_Date_Time;
      Value_Label    : String := "date";
      Reference_Label : String := "reference";
      Options        : Humanize.Datetimes.Calendar_Difference_Options :=
        Humanize.Datetimes.Default_Calendar_Difference_Options)
      return Humanize.Status.Text_Result renames Shared.Date_Comparison;

   function Number_Comparison
     (Context        : Humanize.Contexts.Context;
      Current        : Long_Float;
      Baseline       : Long_Float;
      Current_Label  : String := "value";
      Baseline_Label : String := "baseline";
      Unit_Singular  : String := "";
      Unit_Plural    : String := "";
      Options        : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result renames Shared.Number_Comparison;

   function Percent_Comparison
     (Context        : Humanize.Contexts.Context;
      Current        : Long_Float;
      Baseline       : Long_Float;
      Current_Label  : String := "value";
      Baseline_Label : String := "baseline";
      Options        : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result renames Shared.Percent_Comparison;

   procedure Domain_Label_Into
     (Domain  : Summary_Domain;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Domain_Label_Into;

   procedure Summary_State_Label_Into
     (State   : Summary_State;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Summary_State_Label_Into;

   procedure Domain_Summary_Into
     (Context   : Humanize.Contexts.Context;
      Domain    : Summary_Domain;
      State     : Summary_State;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural;
      Singular  : String;
      Plural    : String;
      Target    : in out String;
      Written   : out Natural;
      Code      : out Humanize.Status.Status_Code) renames Shared.Domain_Summary_Into;

   procedure Queue_Summary_Into
     (Context   : Humanize.Contexts.Context;
      Queued    : Natural;
      Running   : Natural;
      Failed    : Natural;
      Completed : Natural;
      Singular  : String;
      Plural    : String;
      Target    : in out String;
      Written   : out Natural;
      Code      : out Humanize.Status.Status_Code) renames Shared.Queue_Summary_Into;

   procedure Cache_Summary_Into
     (Context : Humanize.Contexts.Context;
      Hits    : Natural;
      Misses  : Natural;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Cache_Summary_Into;

   procedure Sync_Summary_Into
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural;
      Singular  : String;
      Plural    : String;
      Target    : in out String;
      Written   : out Natural;
      Code      : out Humanize.Status.Status_Code) renames Shared.Sync_Summary_Into;

   procedure Import_Summary_Into
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural;
      Singular  : String;
      Plural    : String;
      Target    : in out String;
      Written   : out Natural;
      Code      : out Humanize.Status.Status_Code) renames Shared.Import_Summary_Into;

   procedure Export_Summary_Into
     (Context   : Humanize.Contexts.Context;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural;
      Singular  : String;
      Plural    : String;
      Target    : in out String;
      Written   : out Natural;
      Code      : out Humanize.Status.Status_Code) renames Shared.Export_Summary_Into;

   procedure File_Size_Comparison_Into
     (Context        : Humanize.Contexts.Context;
      Current        : Humanize.Bytes.Byte_Count;
      Baseline       : Humanize.Bytes.Byte_Count;
      Current_Label  : String;
      Baseline_Label : String;
      Target         : in out String;
      Written        : out Natural;
      Code           : out Humanize.Status.Status_Code;
      Options        : Humanize.Bytes.Byte_Options :=
        Humanize.Bytes.Default_Byte_Options) renames Shared.File_Size_Comparison_Into;

   procedure Date_Comparison_Into
     (Context         : Humanize.Contexts.Context;
      Value           : Humanize.Datetimes.Civil_Date_Time;
      Reference       : Humanize.Datetimes.Civil_Date_Time;
      Value_Label     : String;
      Reference_Label : String;
      Target          : in out String;
      Written         : out Natural;
      Code            : out Humanize.Status.Status_Code;
      Options         : Humanize.Datetimes.Calendar_Difference_Options :=
        Humanize.Datetimes.Default_Calendar_Difference_Options) renames Shared.Date_Comparison_Into;

   procedure Number_Comparison_Into
     (Context        : Humanize.Contexts.Context;
      Current        : Long_Float;
      Baseline       : Long_Float;
      Current_Label  : String;
      Baseline_Label : String;
      Unit_Singular  : String;
      Unit_Plural    : String;
      Target         : in out String;
      Written        : out Natural;
      Code           : out Humanize.Status.Status_Code;
      Options        : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options) renames Shared.Number_Comparison_Into;

   procedure Percent_Comparison_Into
     (Context        : Humanize.Contexts.Context;
      Current        : Long_Float;
      Baseline       : Long_Float;
      Current_Label  : String;
      Baseline_Label : String;
      Target         : in out String;
      Written        : out Natural;
      Code           : out Humanize.Status.Status_Code;
      Options        : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options) renames Shared.Percent_Comparison_Into;
end Humanize.Phrases.Summaries;
