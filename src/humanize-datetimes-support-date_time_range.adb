separate (Humanize.Datetimes.Support)
function Date_Time_Range
  (Context   : Humanize.Contexts.Context;
   First     : Civil_Date_Time;
   Last      : Civil_Date_Time;
   Reference : Civil_Date_Time;
   Options   : Range_Options := Default_Range_Options)
   return Humanize.Status.Text_Result
is
   Sep : constant String := [1 => Options.Separator];
   Day_Label : Humanize.Status.Text_Result;

   function Moment_Value (Value : Civil_Date_Time) return String is
     (ISO_Date (Value) & "T" & Clock_Value (Value) & "Z");

   Localized : constant Humanize.Status.Text_Result :=
     (if Same_Date (First, Last) and then Options.Relative_When_Same_Day
      then Time_Range (Context, First, Last, Options)
      else CLDR_Interval
             (Context, Humanize.Message_Keys.Datetime_Range_Moment,
              Moment_Value (First) & "/" & Moment_Value (Last)));
begin
   --  Outside English, CLDR's interval formats ("9. Okt. 2026, 14:00–15:30
   --  Uhr"); a relative day keeps its day word before the times.
   if Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context)) not in "en" | ""
     and then Localized.Status = Humanize.Status.Ok and then Ada.Strings.Unbounded.Length (Localized.Text) > 0
   then
      if Same_Date (First, Last) and then Options.Relative_When_Same_Day then
         Day_Label := Natural_Day (Context, First, Reference);
         if Day_Label.Status = Humanize.Status.Ok then
            return Ok_Text (Result_Text (Day_Label) & " " & Result_Text (Localized));
         end if;
      else
         return Localized;
      end if;
   end if;
   if Same_Date (First, Last) then
      if Options.Relative_When_Same_Day then
         Day_Label := Natural_Day (Context, First, Reference);
         if Day_Label.Status /= Humanize.Status.Ok then
            return Day_Label;
         end if;
         return Ok_Text
           (Result_Text (Day_Label) & " "
            & Time_Label (First, Options) & Sep & Time_Label (Last, Options));
      else
         return Ok_Text
           (Date_Label (Context, First, Options, True) & " "
            & Time_Label (First, Options) & Sep & Time_Label (Last, Options));
      end if;
   elsif Options.Elide_Same_Year and then First.Year = Last.Year then
      return Ok_Text
        (Date_Label (Context, First, Options, True) & " "
         & Time_Label (First, Options) & Sep
         & Date_Label (Context, Last, Options, False) & " "
         & Time_Label (Last, Options));
   else
      return Ok_Text
        (Date_Label (Context, First, Options, True) & " "
         & Time_Label (First, Options) & Sep
         & Date_Label (Context, Last, Options, True) & " "
         & Time_Label (Last, Options));
   end if;
end Date_Time_Range;
