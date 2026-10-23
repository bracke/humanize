separate (Humanize.Datetimes.Support)
function Calendar_Difference_Label
  (Context : Humanize.Contexts.Context;
   First   : Civil_Date_Time;
   Last    : Civil_Date_Time;
   Options : Calendar_Difference_Options :=
     Default_Calendar_Difference_Options)
   return Humanize.Status.Text_Result
is
   function English return Humanize.Status.Text_Result is
      use Ada.Strings.Unbounded;
      Raw   : Unbounded_String;
      Count : Natural := 0;
   begin
      declare
         Diff : constant Calendar_Difference_Result :=
           Calendar_Difference (First, Last);
      begin
         if Diff.Direction = Same_Date then
            if Options.Include_Zero then
               return Ok_Text ("0 days");
            else
               return Ok_Text ("same day");
            end if;
         end if;

         Append_Difference_Component
           (Raw, Count, Diff.Years, "year", "years", Options);
         Append_Difference_Component
           (Raw, Count, Diff.Months, "month", "months", Options);
         Append_Difference_Component
           (Raw, Count, Diff.Days, "day", "days", Options);

         declare
            Phrase : constant String :=
              (if Length (Raw) = 0 then "0 days"
               else Join_Difference_Components (To_String (Raw)));
         begin
            if Options.Style = Calendar_Difference_Relative then
               case Diff.Direction is
                  when Same_Date =>
                     return Ok_Text ("same day");
                  when Future_Date =>
                     return Ok_Text ("in " & Phrase);
                  when Past_Date =>
                     return Ok_Text (Phrase & " ago");
               end case;
            else
               return Ok_Text (Phrase);
            end if;
         end;
      end;
   exception
      when Constraint_Error | Ada.Calendar.Time_Error => --  defensive recovery
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end English;

   --  Outside English: the components in CLDR's long units joined by its
   --  unit list, inside the locale's relative or zero phrase; "" where a
   --  part cannot render.
   function Localized return String is
      use Ada.Strings.Unbounded;
      Diff  : constant Calendar_Difference_Result := Calendar_Difference (First, Last);
      --  The case the locale's "in ..." or "... ago" frame governs, as its
      --  catalog names it; the nominative outside a frame or where none is
      --  named.
      function Governed_Case return String is
         Frame : constant String :=
           (if Diff.Direction = Future_Date then "calendar_difference.case.future"
            else "calendar_difference.case.past");
         Named : constant Humanize.Status.Text_Result :=
           Humanize.I18N_Rendering.Render (Context, Sel.Phrase (Frame));
      begin
         if Options.Style /= Calendar_Difference_Relative or else Named.Status /= Humanize.Status.Ok then
            return "nominative";
         end if;
         return To_String (Named.Text);
      end Governed_Case;
      Case_Name : constant String := Governed_Case;
      Parts : Unbounded_String;
      Count : Natural := 0;

      function Part (Value : Natural; Unit : String) return Boolean is
      begin
         if Count >= Natural (Options.Max_Components)
           or else (Value = 0 and then not Options.Include_Zero)
         then
            return True;
         end if;
         declare
            Text : constant Humanize.Status.Text_Result :=
              Humanize.I18N_Rendering.Render
                (Context,
                 Num (Sel.With_Arg (Sel.With_Arg (Sel.Phrase ("calendar_difference.part"), "unit", Unit),
                                    "case", Case_Name),
                      "value", Value));
         begin
            if Text.Status /= Humanize.Status.Ok or else Length (Text.Text) = 0 then
               return False;
            end if;
            if Count > 0 then
               Append (Parts, "|");
            end if;
            Append (Parts, Text.Text);
            Count := Count + 1;
            return True;
         end;
      end Part;

      function Phrase (Name, Difference : String) return String is
         Text : constant Humanize.Status.Text_Result :=
           Humanize.I18N_Rendering.Render
             (Context, Sel.With_Arg (Sel.Phrase (Name), "difference", Difference));
      begin
         return (if Text.Status = Humanize.Status.Ok then To_String (Text.Text) else "");
      end Phrase;
   begin
      if Diff.Direction = Same_Date then
         return Phrase ((if Options.Include_Zero then "calendar_difference.zero" else "calendar_difference.same_day"),
                        "");
      elsif not (Part (Diff.Years, "year") and then Part (Diff.Months, "month") and then Part (Diff.Days, "day")) then
         return "";
      elsif Count = 0 then
         return Phrase ("calendar_difference.zero", "");
      end if;
      declare
         Joined : constant Humanize.Status.Text_Result :=
           Humanize.I18N_Rendering.Render
             (Context, Sel.With_Arg (Sel.Phrase ("calendar_difference.join"), "value", To_String (Parts)));
         Difference : constant String :=
           (if Joined.Status = Humanize.Status.Ok then To_String (Joined.Text) else "");
      begin
         if Difference = "" then
            return "";
         elsif Options.Style /= Calendar_Difference_Relative then
            return Difference;
         elsif Diff.Direction = Future_Date then
            return Phrase ("calendar_difference.future", Difference);
         else
            return Phrase ("calendar_difference.past", Difference);
         end if;
      end;
   exception
      when Constraint_Error | Ada.Calendar.Time_Error => --  defensive recovery
         return "";
   end Localized;
begin
   if Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context)) in "en" | "" then
      return English;
   end if;
   declare
      Text : constant String := Localized;
   begin
      return (if Text = "" then English else Ok_Text (Text));
   end;
end Calendar_Difference_Label;
