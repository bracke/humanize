separate (Humanize.Datetimes.Support)
function Time_Range
  (Context : Humanize.Contexts.Context;
   First   : Civil_Date_Time;
   Last    : Civil_Date_Time;
   Options : Range_Options := Default_Range_Options)
   return Humanize.Status.Text_Result
is
   Localized : constant Humanize.Status.Text_Result :=
     CLDR_Interval
       (Context, Humanize.Message_Keys.Datetime_Range_Time, Clock_Value (First) & "/" & Clock_Value (Last));
begin
   if Localized.Status = Humanize.Status.Ok and then Ada.Strings.Unbounded.Length (Localized.Text) > 0 then
      return Localized;
   end if;
   return Ok_Text
     (Time_Label (First, Options) & [1 => Options.Separator]
      & Time_Label (Last, Options));
end Time_Range;
