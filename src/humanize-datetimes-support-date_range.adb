separate (Humanize.Datetimes.Support)
function Date_Range
  (Context : Humanize.Contexts.Context;
   First   : Civil_Date_Time;
   Last    : Civil_Date_Time;
   Options : Range_Options := Default_Range_Options)
   return Humanize.Status.Text_Result
is
   Sep : constant String := [1 => Options.Separator];
begin
   if Options.Use_Month_Names
     and then Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context)) not in "en" | ""
   then
      --  Outside English, CLDR's interval format: the month and year
      --  written once where they are shared ("9.–15. Okt. 2026").
      declare
         Localized : constant Humanize.Status.Text_Result :=
           Humanize.I18N_Rendering.Render
             (Context,
              Humanize.Selections.Text_Value
                ((if Options.Include_Weekday then Humanize.Message_Keys.Datetime_Range_Weekday
                  else Humanize.Message_Keys.Datetime_Range_Day),
                 ISO_Date (First) & "/" & ISO_Date (Last)));
      begin
         if Localized.Status = Humanize.Status.Ok and then Ada.Strings.Unbounded.Length (Localized.Text) > 0 then
            return Localized;
         end if;
      end;
   end if;
   if Options.Use_Month_Names then
      if Options.Elide_Same_Month
        and then First.Year = Last.Year
        and then First.Month = Last.Month
      then
         return Ok_Text
           ((if Options.Include_Weekday then Weekday_Name (First) & " "
             else "")
            & Month_Name (Context, First.Month) & " "
            & Natural_Text (Natural (First.Day)) & Sep
            & (if Options.Include_Weekday then Weekday_Name (Last) & " "
               else "")
            & Natural_Text (Natural (Last.Day)));
      elsif Options.Elide_Same_Year and then First.Year = Last.Year then
         return Ok_Text
           (Date_Label (Context, First, Options, False) & Sep
            & Date_Label (Context, Last, Options, False)
            & ", " & Natural_Text (Natural (First.Year)));
      else
         return Ok_Text
           (Date_Label (Context, First, Options, True) & " " & Sep & " "
            & Date_Label (Context, Last, Options, True));
      end if;
   end if;

   if Options.Elide_Same_Month
     and then First.Year = Last.Year
     and then First.Month = Last.Month
   then
      return Ok_Text
        ((if Options.Include_Weekday then Weekday_Name (First) & " " else "")
         & ISO_Date (First) & Sep
         & (if Options.Include_Weekday then Weekday_Name (Last) & " " else "")
         & Pad2 (Natural (Last.Day)));
   elsif Options.Elide_Same_Year and then First.Year = Last.Year then
      return Ok_Text
        (Date_Label (Context, First, Options, True) & Sep
         & Date_Label (Context, Last, Options, False));
   else
      return Ok_Text
        (Date_Label (Context, First, Options, True) & " " & Sep & " "
         & Date_Label (Context, Last, Options, True));
   end if;
end Date_Range;
