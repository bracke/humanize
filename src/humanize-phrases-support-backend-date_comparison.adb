separate (Humanize.Phrases.Support.Backend)
function Date_Comparison
     (Context        : Humanize.Contexts.Context;
      Value          : Humanize.Datetimes.Civil_Date_Time;
      Reference      : Humanize.Datetimes.Civil_Date_Time;
      Value_Label    : String := "date";
      Reference_Label : String := "reference";
      Options        : Humanize.Datetimes.Calendar_Difference_Options :=
        Humanize.Datetimes.Default_Calendar_Difference_Options)
      return Humanize.Status.Text_Result
   is
      use type Ada.Calendar.Time;
      Diff_Options : Humanize.Datetimes.Calendar_Difference_Options := Options;
      Difference   : Humanize.Status.Text_Result;
      Value_Time   : Ada.Calendar.Time;
      Ref_Time     : Ada.Calendar.Time;
begin
      Diff_Options.Style := Humanize.Datetimes.Calendar_Difference_Plain;
      Value_Time :=
        Ada.Calendar.Time_Of
          (Value.Year, Value.Month, Value.Day,
           Duration (Value.Hour * 3_600 + Value.Minute * 60 + Value.Second));
      Ref_Time :=
        Ada.Calendar.Time_Of
          (Reference.Year, Reference.Month, Reference.Day,
           Duration
             (Reference.Hour * 3_600
              + Reference.Minute * 60
              + Reference.Second));

      if Value_Time = Ref_Time then
         return Ok_Text
           (Value_Label & " is the same date as " & Reference_Label);
      elsif Value_Time > Ref_Time then
         Difference :=
           Humanize.Datetimes.Calendar_Difference_Label
             (Context, Reference, Value, Diff_Options);
         if Difference.Status /= Humanize.Status.Ok then
            return Difference;
         end if;
         return Ok_Text
           (Value_Label & " is " & Result_Text (Difference)
            & " after " & Reference_Label);
      else
         Difference :=
           Humanize.Datetimes.Calendar_Difference_Label
             (Context, Value, Reference, Diff_Options);
         if Difference.Status /= Humanize.Status.Ok then
            return Difference;
         end if;
         return Ok_Text
           (Value_Label & " is " & Result_Text (Difference)
            & " before " & Reference_Label);
      end if;
exception
      when others => --  defensive recovery
         return Invalid_Text;
end Date_Comparison;
