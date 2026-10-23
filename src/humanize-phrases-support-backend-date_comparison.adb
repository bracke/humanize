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

      --  The difference in the case the locale's "after"/"before" frame
      --  governs (date_comparison.case.<frame>), else Nominative as rendered.
      function In_Case (Frame : String; First, Last : Humanize.Datetimes.Civil_Date_Time; Nominative : String)
        return String
      is
         Named : constant Humanize.Status.Text_Result :=
           Humanize.I18N_Rendering.Render (Context, Sel.Phrase ("date_comparison.case." & Frame));
      begin
         if Named.Status /= Humanize.Status.Ok or else Length (Named.Text) = 0 then
            return Nominative;
         end if;
         declare
            Diff  : constant Humanize.Datetimes.Calendar_Difference_Result :=
              Humanize.Datetimes.Calendar_Difference (First, Last);
            Parts : constant String :=
              Humanize.I18N_Rendering.Difference_Parts
                (Context, Diff.Years, Diff.Months, Diff.Days, Natural (Options.Max_Components),
                 Options.Include_Zero, To_String (Named.Text));
         begin
            return (if Parts = "" then Nominative else Parts);
         end;
      end In_Case;
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
         return Compared
           (Context, "date_comparison.same", Value_Label, Reference_Label, "",
            Value_Label & " is the same date as " & Reference_Label);
      elsif Value_Time > Ref_Time then
         Difference :=
           Humanize.Datetimes.Calendar_Difference_Label
             (Context, Reference, Value, Diff_Options);
         if Difference.Status /= Humanize.Status.Ok then
            return Difference;
         end if;
         return Compared
           (Context, "date_comparison.after", Value_Label, Reference_Label,
            In_Case ("after", Reference, Value, Result_Text (Difference)),
            Value_Label & " is " & Result_Text (Difference) & " after " & Reference_Label);
      else
         Difference :=
           Humanize.Datetimes.Calendar_Difference_Label
             (Context, Value, Reference, Diff_Options);
         if Difference.Status /= Humanize.Status.Ok then
            return Difference;
         end if;
         return Compared
           (Context, "date_comparison.before", Value_Label, Reference_Label,
            In_Case ("before", Value, Reference, Result_Text (Difference)),
            Value_Label & " is " & Result_Text (Difference) & " before " & Reference_Label);
      end if;
exception
      when Constraint_Error | Ada.Calendar.Time_Error => --  defensive recovery
         return Invalid_Text;
end Date_Comparison;
