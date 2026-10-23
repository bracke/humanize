with Humanize.Parsing.Phrases;

separate (Humanize.Parsing.Localized)
function Parse_Calendar_Difference
  (Context : Humanize.Contexts.Context;
   Text    : String)
   return Calendar_Difference_Parse_Result
is
   package DT renames Humanize.Datetimes;
   Item : constant String := Trimmed (Text);

   --  Part read by Kind's lexicon, as a difference pointing Direction's way.
   function Read (Kind : Lexicon_Kind; Part : String; Direction : Difference_Direction)
      return Calendar_Difference_Parse_Result
   is
      Words : constant Lexicon := Learned (Context, Kind);
      Value : Long_Float;
   begin
      if Read_Joined (Words.Forms, Words.Joins, Trimmed (Plain (Context, Part)), Value)
        and then Value >= 0.0 and then Value < Long_Float (Natural'Last)
      then
         declare
            Whole : constant Natural := Natural (Value);
         begin
            return (Status => Humanize.Status.Ok, Years => Whole / 10_000, Months => Whole / 100 mod 100,
                    Days => Whole mod 100, Direction => Direction);
         end;
      end if;
      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Read;

   --  Item as the label writes one day ("am selben Tag", "same day").
   function Same_Day return Boolean is
      Day      : constant DT.Civil_Date_Time := (Year => 2001, Month => 1, Day => 1, others => <>);
      Rendered : constant Humanize.Status.Text_Result :=
        DT.Calendar_Difference_Label
          (Context, Day, Day,
           (DT.Default_Calendar_Difference_Options with delta Style => DT.Calendar_Difference_Relative));
   begin
      return Rendered.Status = Humanize.Status.Ok and then To_String (Rendered.Text) = Item;
   end Same_Day;

   Plain_Reading : constant Calendar_Difference_Parse_Result := Read (Difference_Kind, Item, Unstated);
begin
   if Plain_Reading.Status = Humanize.Status.Ok then
      return Plain_Reading;
   elsif Same_Day then
      return (Status => Humanize.Status.Ok, Direction => Same_Day, others => <>);
   end if;
   --  A relative difference: its frame, then the part inside in the case the
   --  frame governs.
   for Direction in Past .. Future loop
      declare
         Frame  : constant String :=
           (if Direction = Future then "calendar_difference.future" else "calendar_difference.past");
         Inside : constant Humanize.Parsing.Phrases.Phrase_Parse_Result :=
           Humanize.Parsing.Phrases.Parse (Context, Frame, Item);
      begin
         if Inside.Status = Humanize.Status.Ok and then Inside.Text_Count >= 1 then
            declare
               Reading : constant Calendar_Difference_Parse_Result :=
                 Read ((if Direction = Future then Difference_Future_Kind else Difference_Past_Kind),
                       To_String (Inside.Texts (1)), Direction);
            begin
               if Reading.Status = Humanize.Status.Ok then
                  return Reading;
               end if;
            end;
         end if;
      end;
   end loop;
   return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Calendar_Difference;
