with Humanize.Messages;

package body Humanize.Datetime_Classification is

   use Humanize.Messages;
   use Humanize.Selections;
   use type Ada.Calendar.Time;

   Seconds_Per_Minute : constant := 60;
   Seconds_Per_Hour   : constant := 3600;
   Seconds_Per_Day    : constant := 86400;

   --  Proleptic Gregorian day number for a civil date (Hinnant's algorithm).
   --  Day 0 is 1970-01-01.
   function Days_From_Civil
     (Y : Integer;
      M : Integer;
      D : Integer)
      return Long_Long_Integer
   is
      Yr  : constant Integer := (if M <= 2 then Y - 1 else Y);
      Era : constant Integer := (if Yr >= 0 then Yr else Yr - 399) / 400;
      YOE : constant Integer := Yr - Era * 400;
      MP  : constant Integer := (if M > 2 then M - 3 else M + 9);
      DOY : constant Integer := (153 * MP + 2) / 5 + D - 1;
      DOE : constant Integer := YOE * 365 + YOE / 4 - YOE / 100 + DOY;
   begin
      return Long_Long_Integer (Era) * 146097 + Long_Long_Integer (DOE) - 719468;
   end Days_From_Civil;

   --  Civil-date day ordinal for a Time, derived from its split Y/M/D.
   function Date_Ordinal
     (T : Ada.Calendar.Time)
      return Long_Long_Integer
   is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
   begin
      Ada.Calendar.Split (T, Year, Month, Day, Seconds);
      return Days_From_Civil (Integer (Year), Integer (Month), Integer (Day));
   end Date_Ordinal;

   function Rounded_Count
     (Elapsed : Long_Long_Integer;
      Unit    : Long_Long_Integer;
      Mode    : Humanize.Datetimes.Relative_Rounding_Mode)
      return Long_Long_Integer
   is
   begin
      case Mode is
         when Humanize.Datetimes.Round_Down =>
            return Elapsed / Unit;
         when Humanize.Datetimes.Round_Nearest =>
            return (Elapsed + Unit / 2) / Unit;
         when Humanize.Datetimes.Round_Up =>
            return (Elapsed + Unit - 1) / Unit;
      end case;
   end Rounded_Count;

   function Classify
     (Value     : Ada.Calendar.Time;
      Reference : Ada.Calendar.Time;
      Options   : Humanize.Datetimes.Datetime_Options)
      return Humanize.Selections.Message_Selection
   is
      use type Humanize.Datetimes.Relative_Style;

      Abs_Diff  : Duration;
      Elapsed   : Long_Long_Integer;
      Is_Future : Boolean;
      Day_Delta : Long_Long_Integer;
   begin
      --  Absolute elapsed seconds, floored toward zero, plus direction.
      if Value >= Reference then
         Abs_Diff := Value - Reference;
         Is_Future := Value > Reference;
      else
         Abs_Diff := Reference - Value;
         Is_Future := False;
      end if;

      Elapsed := Long_Long_Integer (Abs_Diff);
      if Duration (Elapsed) > Abs_Diff then
         Elapsed := Elapsed - 1;
      end if;

      --  1. Now threshold.
      if Elapsed <= Long_Long_Integer (Options.Now_Threshold_Seconds) then
         return No_Arg (Datetime_Now);
      end if;

      --  2/3. Calendar-day words.
      Day_Delta := Date_Ordinal (Value) - Date_Ordinal (Reference);

      if Options.Use_Calendar_Words then
         case Options.Style is
            when Humanize.Datetimes.Calendar =>
               if Day_Delta = -1 then
                  return No_Arg (Datetime_Day_Previous);
               elsif Day_Delta = 0 then
                  return No_Arg (Datetime_Day_Current);
               elsif Day_Delta = 1 then
                  return No_Arg (Datetime_Day_Next);
               end if;

            when Humanize.Datetimes.Auto =>
               if Day_Delta = -1 then
                  return No_Arg (Datetime_Day_Previous);
               elsif Day_Delta = 1 then
                  return No_Arg (Datetime_Day_Next);
               end if;

            when Humanize.Datetimes.Elapsed =>
               null;
         end case;
      end if;

      --  4/5/6. Elapsed unit ladder and direction.
      declare
         Days  : constant Long_Long_Integer := Elapsed / Seconds_Per_Day;
         Count : Long_Long_Integer;
         Key   : Message_Id;
      begin
         if Elapsed < Seconds_Per_Minute then
            Count := Elapsed;
            Key :=
              (if Is_Future
               then Datetime_Relative_Second_Future
               else Datetime_Relative_Second_Past);
         elsif Elapsed < Seconds_Per_Hour then
            Count := Rounded_Count
              (Elapsed, Seconds_Per_Minute, Options.Rounding);
            Key :=
              (if Is_Future
               then Datetime_Relative_Minute_Future
               else Datetime_Relative_Minute_Past);
         elsif Elapsed < Seconds_Per_Day then
            Count := Rounded_Count
              (Elapsed, Seconds_Per_Hour, Options.Rounding);
            Key :=
              (if Is_Future
               then Datetime_Relative_Hour_Future
               else Datetime_Relative_Hour_Past);
         elsif Days < 7 then
            Count := Rounded_Count
              (Elapsed, Seconds_Per_Day, Options.Rounding);
            Key :=
              (if Is_Future
               then Datetime_Relative_Day_Future
               else Datetime_Relative_Day_Past);
         elsif Days < 30 and then Options.Prefer_Weeks then
            Count := Rounded_Count
              (Elapsed, 7 * Seconds_Per_Day, Options.Rounding);
            Key :=
              (if Is_Future
               then Datetime_Relative_Week_Future
               else Datetime_Relative_Week_Past);
         elsif Days < 365 and then Options.Prefer_Months then
            Count := Rounded_Count
              (Elapsed, 30 * Seconds_Per_Day, Options.Rounding);
            Key :=
              (if Is_Future
               then Datetime_Relative_Month_Future
               else Datetime_Relative_Month_Past);
         else
            Count := Rounded_Count
              (Elapsed, 365 * Seconds_Per_Day, Options.Rounding);
            Key :=
              (if Is_Future
               then Datetime_Relative_Year_Future
               else Datetime_Relative_Year_Past);
         end if;

         --  7. Count floors but is never less than 1 for nonzero elapsed.
         if Count < 1 then
            Count := 1;
         end if;

         return Humanize.Selections.Count (Key, Count_Value (Count));
      end;
   end Classify;

end Humanize.Datetime_Classification;
