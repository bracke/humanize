separate (Humanize.Durations.Formatting)
function Interval
  (Context : Humanize.Contexts.Context;
   Low     : Duration_Seconds;
   High    : Duration_Seconds;
   Options : Duration_Options := Default_Duration_Options;
   Phrase  : Duration_Phrase_Options := Default_Duration_Phrase_Options)
   return Humanize.Status.Text_Result
is
   Left  : constant Humanize.Status.Text_Result := Format (Context, Low, Options);
   Right : constant Humanize.Status.Text_Result := Format (Context, High, Options);
   Prefix : constant String :=
     (case Phrase.Style is
         when Natural_Wording => "between ",
         when Compact_Label => "");
   Joiner : constant String :=
     (case Phrase.Style is
         when Natural_Wording => " and ",
         when Compact_Label => "-");
begin
   if Low < 0 or else High < 0 or else High < Low then
      return (Status => Humanize.Status.Invalid_Value, others => <>);
   elsif Left.Status /= Humanize.Status.Ok then
      return Left;
   elsif Right.Status /= Humanize.Status.Ok then
      return Right;
   elsif Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context)) not in "en" | "" then
      --  Outside English: CLDR's range, or the locale's "between" phrase
      --  with both ends in the case it governs.
      if Phrase.Style = Compact_Label then
         return Format_Range (Context, Low, High, Options);
      end if;
      declare
         Text : constant Humanize.Status.Text_Result :=
           Humanize.I18N_Rendering.Render
             (Context,
              Sel.With_Arg
                (Sel.With_Arg
                   (Sel.Phrase ("duration.between"), "low", Cased_Duration (Context, Low, Options, "between")),
                 "high", Cased_Duration (Context, High, Options, "between")));
      begin
         if Text.Status = Humanize.Status.Ok then
            return (Status => Humanize.Status.Ok, Text => Text.Text, Key => Humanize.Message_Keys.No_Message);
         end if;
      end;
   end if;
   return
     (Status => Humanize.Status.Ok,
      Text   => To_Unbounded_String
        (Prefix & To_String (Left.Text) & Joiner & To_String (Right.Text)),
      Key    => Humanize.Message_Keys.No_Message);
end Interval;
