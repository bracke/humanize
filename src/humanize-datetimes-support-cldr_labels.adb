separate (Humanize.Datetimes.Support)
package body CLDR_Labels is

      --  The pieces the CLDR labels are made of, each rendered in the context's
      --  locale through its locale-neutral catalog entry.
      function Clock_Time_Text (Context : Humanize.Contexts.Context; Value : Civil_Date_Time)
        return Humanize.Status.Text_Result
      is (Humanize.I18N_Rendering.Render
            (Context,
             Humanize.Selections.Text_Value
               (Humanize.Message_Keys.Datetime_Clock_Time,
                Pad2 (Natural (Value.Hour)) & ":" & Pad2 (Natural (Value.Minute)) & ":"
                & Pad2 (Natural (Value.Second)))));

      function Clock_Date_Text
        (Context : Humanize.Contexts.Context;
         Key     : Humanize.Message_Keys.Message_Id;
         Value   : Civil_Date_Time)
         return Humanize.Status.Text_Result
      is (Humanize.I18N_Rendering.Render
            (Context, Humanize.Selections.Text_Value (Key, ISO_Date (Value))));

      Weekday_Codes : constant array (0 .. 6) of String (1 .. 3) :=
        ["mon", "tue", "wed", "thu", "fri", "sat", "sun"];

      function Is_English (Context : Humanize.Contexts.Context) return Boolean is
         Locale : constant String := Humanize.Contexts.Locale (Context);
      begin
         return Locale'Length >= 2
           and then Locale (Locale'First .. Locale'First + 1) = "en"
           and then (Locale'Length = 2 or else Locale (Locale'First + 2) in '-' | '_');
      end Is_English;

      function Calendar_Clock_Label
        (Context   : Humanize.Contexts.Context;
         Value     : Civil_Date_Time;
         Reference : Civil_Date_Time)
         return Humanize.Status.Text_Result
      is
         Days : constant Integer := Day_Diff (Date_Only (Reference), Date_Only (Value));
         Time : constant Humanize.Status.Text_Result := Clock_Time_Text (Context, Value);
         Day  : constant Humanize.Status.Text_Result :=
           (if abs Days <= 1 then Natural_Day (Context, Value, Reference)
            elsif abs Days <= 6 then Clock_Date_Text (Context, Humanize.Message_Keys.Datetime_Clock_Weekday, Value)
            else Clock_Date_Text (Context, Humanize.Message_Keys.Datetime_Clock_Date, Value));
      begin
         if Day.Status /= Humanize.Status.Ok then
            return Day;
         elsif Time.Status /= Humanize.Status.Ok then
            return Time;
         end if;
         return Ok_Text
           (Ada.Strings.Unbounded.To_String (Day.Text) & " "
            & Ada.Strings.Unbounded.To_String (Time.Text));
      exception
         when Constraint_Error | Ada.Calendar.Time_Error => --  defensive recovery
            return (Status => Humanize.Status.Invalid_Value, others => <>);
      end Calendar_Clock_Label;

      --  Calendar_Relative_Label outside English: CLDR's named days, "letzten
      --  Montag" within the weekday window, the localized date beyond it, and
      --  the clock time where asked. The English idioms -- tonight, later
      --  today, this weekend -- have no CLDR form and stay English's own.
      function Relative_Label
        (Context   : Humanize.Contexts.Context;
         Value     : Civil_Date_Time;
         Reference : Civil_Date_Time;
         Options   : Calendar_Relative_Options)
         return Humanize.Status.Text_Result
      is
         Days : constant Integer := Day_Diff (Date_Only (Reference), Date_Only (Value));
      begin
         if abs Days <= 1 then
            if Options.Include_Time_Of_Day then
               return Calendar_Clock_Label (Context, Value, Reference);
            end if;
            return Natural_Day (Context, Value, Reference);
         elsif abs Days <= Integer (Options.Weekday_Window) then
            return Humanize.I18N_Rendering.Render
              (Context,
               Humanize.Selections.Text_Value
                 ((if Days < 0 then Humanize.Message_Keys.Datetime_Weekday_Previous
                   else Humanize.Message_Keys.Datetime_Weekday_Next),
                  Weekday_Codes (Weekday_Number (Value))));
         end if;
         return Clock_Date_Text (Context, Humanize.Message_Keys.Datetime_Clock_Date, Value);
      end Relative_Label;

end CLDR_Labels;
