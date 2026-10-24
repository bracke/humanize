separate (Humanize.Durations.Formatting)
function Framed
  (Context : Humanize.Contexts.Context;
   Seconds : Duration_Seconds;
   Options : Duration_Options;
   Frame   : String;
   Shape   : Frame_Shape;
   English : Humanize.Status.Text_Result)
   return Humanize.Status.Text_Result
is
   use Humanize.Message_Keys;

   function Relative_Key (Unit : Duration_Unit; Past : Boolean) return Message_Id is
     (case Unit is
         when Second => (if Past then Datetime_Relative_Second_Past else Datetime_Relative_Second_Future),
         when Minute => (if Past then Datetime_Relative_Minute_Past else Datetime_Relative_Minute_Future),
         when Hour   => (if Past then Datetime_Relative_Hour_Past else Datetime_Relative_Hour_Future),
         when Day    => (if Past then Datetime_Relative_Day_Past else Datetime_Relative_Day_Future),
         when Week   => (if Past then Datetime_Relative_Week_Past else Datetime_Relative_Week_Future),
         when Month  => (if Past then Datetime_Relative_Month_Past else Datetime_Relative_Month_Future),
         when Year   => (if Past then Datetime_Relative_Year_Past else Datetime_Relative_Year_Future));

   --  The whole relative time CLDR writes for the unit Format chooses:
   --  "vor 3 Stunden", "через 3 часа".
   function Relative (Past : Boolean) return String is
   begin
      for Unit in reverse Options.Smallest_Unit .. Options.Largest_Unit loop
         if Seconds / Unit_Seconds (Unit) >= 1 or else Unit = Options.Smallest_Unit then
            declare
               Text : constant Humanize.Status.Text_Result :=
                 Humanize.I18N_Rendering.Render
                   (Context,
                    Sel.Count (Relative_Key (Unit, Past), Sel.Count_Value (Seconds / Unit_Seconds (Unit))));
            begin
               return (if Text.Status = Humanize.Status.Ok then To_String (Text.Text) else "");
            end;
         end if;
      end loop;
      return "";
   end Relative;

   function Localized return String is
      Inside : constant String :=
        (case Shape is
            when Framed_Duration => Cased_Duration (Context, Seconds, Options, Frame),
            when Framed_Past     => Relative (Past => True),
            when Framed_Future   => Relative (Past => False),
            when Framed_Now      => "");
   begin
      if Inside = "" and then Shape /= Framed_Now then
         return "";
      end if;
      return Humanize.I18N_Rendering.Phrase_Text_With
        (Context, "duration." & Frame,
         (case Shape is
             when Framed_Duration => "duration",
             when Framed_Past | Framed_Future => "relative",
             when Framed_Now => ""),
         Inside);
   end Localized;
begin
   if English.Status /= Humanize.Status.Ok
     or else Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context)) in "en" | ""
     or else Seconds < 0
     or else Options.Largest_Unit < Options.Smallest_Unit
   then
      return English;
   end if;
   declare
      Text : constant String := Localized;
   begin
      return (if Text = "" then English else Ok_Text (Text));
   end;
end Framed;
