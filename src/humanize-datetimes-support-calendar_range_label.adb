separate (Humanize.Datetimes.Support)
function Calendar_Range_Label
  (Context   : Humanize.Contexts.Context;
   First     : Civil_Date_Time;
   Last      : Civil_Date_Time;
   Reference : Civil_Date_Time;
   Options   : Calendar_Range_Options := Default_Calendar_Range_Options)
   return Humanize.Status.Text_Result
is
   First_Date  : constant Civil_Date_Time := Date_Only (First);
   Last_Date   : constant Civil_Date_Time := Date_Only (Last);
   Ref_Date    : constant Civil_Date_Time := Date_Only (Reference);
   Ref_Week    : constant Civil_Date_Time := Week_Start (Ref_Date);
   Ref_Weekend : constant Civil_Date_Time := Weekend_Start (Ref_Date);
   Range_Opts  : constant Range_Options :=
     (Elide_Same_Month => True,
      Elide_Same_Year => True,
      Include_Weekday => False,
      Separator => '-',
      Use_Month_Names => Options.Use_Month_Names,
      Use_12_Hour_Time => Options.Use_12_Hour_Time,
      Relative_When_Same_Day => True);
   Quarter       : Natural;
   Q_Start       : Civil_Date_Time;
   Q_End         : Civil_Date_Time;
   Q_Year        : Natural;
begin
   if Options.Style = Calendar_Range_Time_Today
     or else (Options.Style = Calendar_Range_Auto
              and then Same_Date (First, Last)
              and then (Has_Time (First) or else Has_Time (Last)))
   then
      declare
         Day : constant Humanize.Status.Text_Result :=
           Natural_Day (Context, First_Date, Ref_Date);
      begin
         if Day.Status /= Humanize.Status.Ok then
            return Day;
         end if;
         return Ok_Text
           (Time_Label (First, Range_Opts) & "-"
            & Time_Label (Last, Range_Opts) & " "
            & Result_Text (Day));
      end;
   end if;

   if Options.Style = Calendar_Range_Weekend
     or else (Options.Style = Calendar_Range_Auto
              and then Same_Date (First_Date, Weekend_Start (First_Date))
              and then Same_Date (Last_Date, Add_Days (First_Date, 1)))
   then
      declare
         Offset : constant Integer := Day_Diff (Ref_Weekend, First_Date) / 7;
      begin
         if Offset = -1 then
            return Ok_Text ("last weekend");
         elsif Offset = 0 then
            return Ok_Text ("this weekend");
         elsif Offset = 1 then
            return Ok_Text ("next weekend");
         else
            return Ok_Text ("weekend of " & Calendar_Date_Preset_Label
              (Context, First_Date,
               (Style => Calendar_Date_Medium,
                Fiscal_Year_Start_Month => 1)));
         end if;
      end;
   end if;

   if Options.Style = Calendar_Range_Week
     or else (Options.Style = Calendar_Range_Auto
              and then Same_Date (First_Date, Week_Start (First_Date))
              and then Same_Date (Last_Date, Add_Days (First_Date, 6)))
   then
      declare
         Offset : constant Integer := Day_Diff (Ref_Week, First_Date) / 7;
      begin
         if Offset = -1 then
            return Ok_Text ("last week");
         elsif Offset = 0 then
            return Ok_Text ("this week");
         elsif Offset = 1 then
            return Ok_Text ("next week");
         else
            return Ok_Text ("week of " & Calendar_Date_Preset_Label
              (Context, First_Date,
               (Style => Calendar_Date_Medium,
                Fiscal_Year_Start_Month => 1)));
         end if;
      end;
   end if;

   if Options.Style = Calendar_Range_Month
     or else (Options.Style = Calendar_Range_Auto
              and then First_Date.Day = 1
              and then Same_Date (Last_Date, Month_End (First_Date)))
   then
      return Ok_Text (Month_Label (Context, First_Date));
   end if;

   if Options.Style = Calendar_Range_Quarter
     or else Options.Style = Calendar_Range_Auto
   then
      if Quarter_Info
           (First_Date, Options.Fiscal_Year_Start_Month,
            Quarter, Q_Start, Q_End, Q_Year)
        and then Same_Date (First_Date, Q_Start)
        and then Same_Date (Last_Date, Q_End)
      then
         return Ok_Text
           (Quarter_Label (First_Date, Options.Fiscal_Year_Start_Month));
      elsif Options.Style = Calendar_Range_Quarter then
         return Ok_Text
           (Quarter_Label (First_Date, Options.Fiscal_Year_Start_Month));
      end if;
   end if;

   if Options.Style = Calendar_Range_Date_Times then
      return Date_Time_Range (Context, First, Last, Reference, Range_Opts);
   else
      return Ok_Text
        (if Options.Use_Month_Names
         then Polished_Date_Range (Context, First_Date, Last_Date, Options)
         else Result_Text
           (Date_Range (Context, First_Date, Last_Date, Range_Opts)));
   end if;
exception
   when others => --  defensive recovery
      return (Status => Humanize.Status.Invalid_Value, others => <>);
end Calendar_Range_Label;
