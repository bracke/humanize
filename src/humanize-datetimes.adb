with Humanize.Datetimes.Support;

package body Humanize.Datetimes is

   function Relative
     (Context   : Humanize.Contexts.Context;
      Value     : Ada.Calendar.Time;
      Reference : Ada.Calendar.Time;
      Options   : Datetime_Options := Default_Datetime_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Relative;

   procedure Relative_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Ada.Calendar.Time;
      Reference : Ada.Calendar.Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Datetime_Options := Default_Datetime_Options)
      renames Humanize.Datetimes.Support.Relative_Into;

   function Relative_Civil
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Options   : Datetime_Options := Default_Datetime_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Relative_Civil;

   function Natural_Day
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Natural_Day;

   function Natural_Time_Of_Day
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Natural_Time_Of_Day;

   function Calendar_Relation
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Calendar_Relation;

   function Date_Range
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Options : Range_Options := Default_Range_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Date_Range;

   function Time_Range
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Options : Range_Options := Default_Range_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Time_Range;

   function Date_Time_Range
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Options   : Range_Options := Default_Range_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Date_Time_Range;

   function Business_Time_Range_Label
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Rules     : Humanize.Durations.Business_Calendar_Rules;
      Options   : Range_Options := Default_Range_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Business_Time_Range_Label;

   function Calendar_Range_Label
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Options   : Calendar_Range_Options := Default_Calendar_Range_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Calendar_Range_Label;

   function Offset_Label
     (Context        : Humanize.Contexts.Context;
      Offset_Minutes : Integer)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Offset_Label;

   function Calendar_Date_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Options : Range_Options := Default_Range_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Calendar_Date_Label;

   function Calendar_Date_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Options : Calendar_Date_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Calendar_Date_Label;

   function Month_Day_Ordinal_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Month_Day_Ordinal_Label;

   function Weekday_Ordinal_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Weekday_Ordinal_Label;

   function Fiscal_Year_Label
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Fiscal_Year_Label;

   function Fiscal_Half_Label
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Fiscal_Half_Label;

   function Semester_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Semester_Label;

   function Half_Year_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Half_Year_Label;

   function Calendar_Badge_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Calendar_Badge_Label;

   function Month_Phase_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Month_Phase_Label;

   function Quarter_Phase_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Quarter_Phase_Label;

   function Half_Year_Phrase_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Half_Year_Phrase_Label;

   function Fiscal_Year_End_Label
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Fiscal_Year_End_Label;

   function Due_Status
     (Context   : Humanize.Contexts.Context;
      Due       : Civil_Date_Time;
      Reference : Civil_Date_Time)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Due_Status;

   function Calendar_Difference
     (First : Civil_Date_Time;
      Last  : Civil_Date_Time)
      return Calendar_Difference_Result
      renames Humanize.Datetimes.Support.Calendar_Difference;

   function Calendar_Difference_Label
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Options : Calendar_Difference_Options :=
        Default_Calendar_Difference_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Calendar_Difference_Label;

   function Calendar_Relative_Label
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Options   : Calendar_Relative_Options :=
        Default_Calendar_Relative_Options)
      return Humanize.Status.Text_Result
      renames Humanize.Datetimes.Support.Calendar_Relative_Label;

   procedure Natural_Day_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
      renames Humanize.Datetimes.Support.Natural_Day_Into;

   procedure Natural_Time_Of_Day_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Datetimes.Support.Natural_Time_Of_Day_Into;

   procedure Calendar_Relation_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
      renames Humanize.Datetimes.Support.Calendar_Relation_Into;

   procedure Date_Range_Into
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Range_Options := Default_Range_Options)
      renames Humanize.Datetimes.Support.Date_Range_Into;

   procedure Time_Range_Into
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Range_Options := Default_Range_Options)
      renames Humanize.Datetimes.Support.Time_Range_Into;

   procedure Date_Time_Range_Into
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Range_Options := Default_Range_Options)
      renames Humanize.Datetimes.Support.Date_Time_Range_Into;

   procedure Business_Time_Range_Label_Into
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Rules     : Humanize.Durations.Business_Calendar_Rules;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Range_Options := Default_Range_Options)
      renames Humanize.Datetimes.Support.Business_Time_Range_Label_Into;

   procedure Calendar_Range_Label_Into
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Calendar_Range_Options := Default_Calendar_Range_Options)
      renames Humanize.Datetimes.Support.Calendar_Range_Label_Into;

   procedure Relative_Civil_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Datetime_Options := Default_Datetime_Options)
      renames Humanize.Datetimes.Support.Relative_Civil_Into;

   procedure Offset_Label_Into
     (Context        : Humanize.Contexts.Context;
      Offset_Minutes : Integer;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code)
      renames Humanize.Datetimes.Support.Offset_Label_Into;

   procedure Calendar_Date_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Range_Options := Default_Range_Options)
      renames Humanize.Datetimes.Support.Calendar_Date_Label_Into;

   procedure Calendar_Date_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Calendar_Date_Options)
      renames Humanize.Datetimes.Support.Calendar_Date_Label_Into;

   procedure Month_Day_Ordinal_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Datetimes.Support.Month_Day_Ordinal_Label_Into;

   procedure Weekday_Ordinal_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Datetimes.Support.Weekday_Ordinal_Label_Into;

   procedure Fiscal_Year_Label_Into
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Target                  : in out String;
      Written                 : out Natural;
      Status                  : out Humanize.Status.Status_Code;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
      renames Humanize.Datetimes.Support.Fiscal_Year_Label_Into;

   procedure Fiscal_Half_Label_Into
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Target                  : in out String;
      Written                 : out Natural;
      Status                  : out Humanize.Status.Status_Code;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
      renames Humanize.Datetimes.Support.Fiscal_Half_Label_Into;

   procedure Semester_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Datetimes.Support.Semester_Label_Into;

   procedure Half_Year_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Datetimes.Support.Half_Year_Label_Into;

   procedure Calendar_Badge_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Datetimes.Support.Calendar_Badge_Label_Into;

   procedure Month_Phase_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Datetimes.Support.Month_Phase_Label_Into;

   procedure Quarter_Phase_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Datetimes.Support.Quarter_Phase_Label_Into;

   procedure Half_Year_Phrase_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Datetimes.Support.Half_Year_Phrase_Label_Into;

   procedure Fiscal_Year_End_Label_Into
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Target                  : in out String;
      Written                 : out Natural;
      Status                  : out Humanize.Status.Status_Code;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
      renames Humanize.Datetimes.Support.Fiscal_Year_End_Label_Into;

   procedure Due_Status_Into
     (Context   : Humanize.Contexts.Context;
      Due       : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
      renames Humanize.Datetimes.Support.Due_Status_Into;

   procedure Calendar_Difference_Label_Into
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Calendar_Difference_Options :=
        Default_Calendar_Difference_Options)
      renames Humanize.Datetimes.Support.Calendar_Difference_Label_Into;

   procedure Calendar_Relative_Label_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Calendar_Relative_Options :=
        Default_Calendar_Relative_Options)
      renames Humanize.Datetimes.Support.Calendar_Relative_Label_Into;

end Humanize.Datetimes;
