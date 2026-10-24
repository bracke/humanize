with Humanize.I18N_Rendering;
with Humanize.Selections;

separate (Humanize.Durations.Natural)
function Localized_Natural
  (Context       : Humanize.Contexts.Context;
   Seconds       : Duration_Seconds;
   Style         : Natural_Duration_Style;
   Approximation : Natural_Duration_Approximation_Options;
   Outer_Case    : String)
   return String
is
   package Sel renames Humanize.Selections;

   type Sizes is array (Positive range <>) of Duration_Seconds;

   function Unit_Name (Unit_Seconds : Duration_Seconds) return String is
     (case Unit_Seconds is
         when 60 => "minute",
         when 3_600 => "hour",
         when 86_400 => "day",
         when 604_800 => "week",
         when 2_592_000 => "month",
         when 31_536_000 => "year",
         when others => "second");

   --  The largest unit with a whole count, as Format chooses it.
   function Format_Unit return Duration_Seconds is
   begin
      for Size of Sizes'(31_536_000, 2_592_000, 604_800, 86_400, 3_600, 60) loop
         if Seconds >= Size then
            return Size;
         end if;
      end loop;
      return 1;
   end Format_Unit;

   function Render (Selection : Sel.Message_Selection) return String is
      Text : constant Humanize.Status.Text_Result := Humanize.I18N_Rendering.Render (Context, Selection);
   begin
      return (if Text.Status = Humanize.Status.Ok then To_String (Text.Text) else "");
   end Render;

   --  A fixed phrase, told the case its frame governs.
   function Fixed (Name : String) return String is
     (Render (Sel.With_Arg (Sel.Phrase ("duration.natural." & Name), "case", Outer_Case)));

   --  Count Units in Case_Name.
   function Part (Unit_Seconds, Count : Duration_Seconds; Case_Name : String) return String is
     (Humanize.I18N_Rendering.Duration_Part
        (Context, Unit_Name (Unit_Seconds), Long_Long_Integer (Count), Case_Name));

   --  Qualifier Name ("almost") around the count, in the case it names, or
   --  else its frame's.
   function Qualified (Name : String; Unit_Seconds, Count : Duration_Seconds) return String is
      Own    : constant String := Humanize.I18N_Rendering.Phrase_Text (Context, "duration.case.natural." & Name);
      Inside : constant String := Part (Unit_Seconds, Count, (if Own = "" then Outer_Case else Own));
   begin
      return (if Inside = "" then ""
              else Humanize.I18N_Rendering.Phrase_Text_With (Context, "duration.natural." & Name, "duration", Inside));
   end Qualified;

   function Approximated (Name : String; Round_Up : Boolean; Prefer_Larger : Boolean := False) return String is
      Unit_Seconds : Duration_Seconds;
      Count        : Duration_Seconds;
   begin
      Approximate_Count (Seconds, Round_Up, Approximation, Prefer_Larger, Unit_Seconds, Count);
      return Qualified (Name, Unit_Seconds, Count);
   end Approximated;

   --  "3 Std., 5 Min.": CLDR's short units joined by its unit list.
   function Brief return String is
      Hours   : constant String :=
        Render (Sel.With_Arg (Sel.With_Arg (Sel.Phrase ("duration.brief_part"), "unit", "hour"), "value",
                              Long_Long_Integer (Seconds / 3_600)));
      Minutes : constant String :=
        Render (Sel.With_Arg (Sel.With_Arg (Sel.Phrase ("duration.brief_part"), "unit", "minute"), "value",
                              Long_Long_Integer ((Seconds mod 3_600) / 60)));
      Rest    : constant String :=
        (if Style = Brief_Precise_Duration
         then Render (Sel.With_Arg (Sel.With_Arg (Sel.Phrase ("duration.brief_part"), "unit", "second"), "value",
                                    Long_Long_Integer (Seconds mod 60)))
         else "");
   begin
      if Hours = "" or else Minutes = "" or else (Style = Brief_Precise_Duration and then Rest = "") then
         return "";
      end if;
      return Humanize.I18N_Rendering.Phrase_Text_With
        (Context, "calendar_difference.join", "value",
         Hours & "|" & Minutes & (if Rest = "" then "" else "|" & Rest));
   end Brief;
begin
   case Style is
      when Brief_Duration | Brief_Precise_Duration =>
         return Brief;
      when Few_Duration =>
         return Render
           (Sel.With_Arg
              (Sel.With_Arg
                 (Sel.Phrase ("duration.natural.few"), "unit",
                  (if Seconds < 60 then "second" elsif Seconds < 300 then "minute" else Unit_Name (Format_Unit))),
               "case", Outer_Case));
      when Almost_Duration =>
         return Approximated ("almost", Round_Up => True);
      when Over_Duration =>
         return Approximated ("over", Round_Up => False);
      when Just_Over_Duration =>
         return Approximated ("just_over", Round_Up => False);
      when Little_Under_Duration =>
         return Approximated ("little_under", Round_Up => True, Prefer_Larger => True);
      when Plain_Duration | Approximate_Duration =>
         if Seconds < 60 then
            return Fixed ("less_than_minute");
         elsif Seconds = 1_800 then
            return Fixed ((if Style = Plain_Duration then "half_hour" else "about_half_hour"));
         elsif Style = Approximate_Duration then
            return Qualified ("about", Format_Unit, Seconds / Format_Unit);
         else
            return Part (Format_Unit, Seconds / Format_Unit, Outer_Case);
         end if;
   end case;
end Localized_Natural;
