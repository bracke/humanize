with Ada.Calendar;
with Humanize.Contexts;
with Humanize.Durations;
with Humanize.Status;

private package Humanize.Datetimes.Support is
   function Relative
     (Context   : Humanize.Contexts.Context;
      Value     : Ada.Calendar.Time;
      Reference : Ada.Calendar.Time;
      Options   : Datetime_Options := Default_Datetime_Options)
      return Humanize.Status.Text_Result;
   procedure Relative_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Ada.Calendar.Time;
      Reference : Ada.Calendar.Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Datetime_Options := Default_Datetime_Options);
   function Relative_Civil
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Options   : Datetime_Options := Default_Datetime_Options)
      return Humanize.Status.Text_Result;
   function Natural_Day
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   function Natural_Time_Of_Day
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   function Calendar_Relation
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   function Date_Range
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Options : Range_Options := Default_Range_Options)
      return Humanize.Status.Text_Result;
   function Time_Range
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Options : Range_Options := Default_Range_Options)
      return Humanize.Status.Text_Result;
   function Date_Time_Range
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Options   : Range_Options := Default_Range_Options)
      return Humanize.Status.Text_Result;
   function Business_Time_Range_Label
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Rules     : Humanize.Durations.Business_Calendar_Rules;
      Options   : Range_Options := Default_Range_Options)
      return Humanize.Status.Text_Result;
   function Calendar_Range_Label
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Options   : Calendar_Range_Options := Default_Calendar_Range_Options)
      return Humanize.Status.Text_Result;
   function Offset_Label
     (Context        : Humanize.Contexts.Context;
      Offset_Minutes : Integer)
      return Humanize.Status.Text_Result;
   function Calendar_Date_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Options : Range_Options := Default_Range_Options)
      return Humanize.Status.Text_Result;
   function Calendar_Date_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Options : Calendar_Date_Options)
      return Humanize.Status.Text_Result;
   function Month_Day_Ordinal_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   function Weekday_Ordinal_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   function Fiscal_Year_Label
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
      return Humanize.Status.Text_Result;
   function Fiscal_Half_Label
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
      return Humanize.Status.Text_Result;
   function Semester_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   function Half_Year_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   function Calendar_Badge_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   function Month_Phase_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   function Quarter_Phase_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   function Half_Year_Phrase_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   function Fiscal_Year_End_Label
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
      return Humanize.Status.Text_Result;
   function Due_Status
     (Context   : Humanize.Contexts.Context;
      Due       : Civil_Date_Time;
      Reference : Civil_Date_Time)
      return Humanize.Status.Text_Result;
   function Calendar_Difference
     (First : Civil_Date_Time;
      Last  : Civil_Date_Time)
      return Calendar_Difference_Result;
   function Calendar_Difference_Label
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Options : Calendar_Difference_Options :=
        Default_Calendar_Difference_Options)
      return Humanize.Status.Text_Result;
   function Calendar_Relative_Label
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Options   : Calendar_Relative_Options :=
        Default_Calendar_Relative_Options)
      return Humanize.Status.Text_Result;
   procedure Natural_Day_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   procedure Natural_Time_Of_Day_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Calendar_Relation_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   procedure Date_Range_Into
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Range_Options := Default_Range_Options);
   procedure Time_Range_Into
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Range_Options := Default_Range_Options);
   procedure Date_Time_Range_Into
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Range_Options := Default_Range_Options);
   procedure Business_Time_Range_Label_Into
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Rules     : Humanize.Durations.Business_Calendar_Rules;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Range_Options := Default_Range_Options);
   procedure Calendar_Range_Label_Into
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Calendar_Range_Options := Default_Calendar_Range_Options);
   procedure Relative_Civil_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Datetime_Options := Default_Datetime_Options);
   procedure Offset_Label_Into
     (Context        : Humanize.Contexts.Context;
      Offset_Minutes : Integer;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code);
   procedure Calendar_Date_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Range_Options := Default_Range_Options);
   procedure Calendar_Date_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Calendar_Date_Options);
   procedure Month_Day_Ordinal_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Weekday_Ordinal_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Fiscal_Year_Label_Into
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Target                  : in out String;
      Written                 : out Natural;
      Status                  : out Humanize.Status.Status_Code;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1);
   procedure Fiscal_Half_Label_Into
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Target                  : in out String;
      Written                 : out Natural;
      Status                  : out Humanize.Status.Status_Code;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1);
   procedure Semester_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Half_Year_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Calendar_Badge_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Month_Phase_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Quarter_Phase_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Half_Year_Phrase_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Fiscal_Year_End_Label_Into
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Target                  : in out String;
      Written                 : out Natural;
      Status                  : out Humanize.Status.Status_Code;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1);
   procedure Due_Status_Into
     (Context   : Humanize.Contexts.Context;
      Due       : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   procedure Calendar_Difference_Label_Into
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Calendar_Difference_Options :=
        Default_Calendar_Difference_Options);
   procedure Calendar_Relative_Label_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Calendar_Relative_Options :=
        Default_Calendar_Relative_Options);
end Humanize.Datetimes.Support;
