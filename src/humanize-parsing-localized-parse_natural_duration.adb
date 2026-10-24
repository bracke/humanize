separate (Humanize.Parsing.Localized)
function Parse_Natural_Duration
  (Context : Humanize.Contexts.Context;
   Text    : String)
   return Natural_Duration_Parse_Result
is
   package D renames Humanize.Durations;
   use type D.Duration_Seconds;

   Item  : constant String := Trimmed (Text);
   Seen  : constant Number_List := Numbers_In (Context, Item);
   Sizes : constant array (Positive range <>) of D.Duration_Seconds :=
     [1, 60, 3_600, 86_400, 604_800, 2_592_000, 31_536_000];

   --  The whole numbers Item shows, and 0, 1 and 2; with the lengths the
   --  numberless phrases word: under a minute, a few minutes, half an hour.
   Counts : array (1 .. Seen'Length + 3) of D.Duration_Seconds := [0, 1, 2, others => 0];
   Fixed  : constant array (Positive range <>) of D.Duration_Seconds := [30, 120, 1_800];

   function Image (Result : Humanize.Status.Text_Result) return String is
     (if Result.Status = Humanize.Status.Ok then To_String (Result.Text) else "");

   --  The style whose wording of Seconds stands inside Item, the longest:
   --  "about 2 hours" in "about 2 hours ago" (a case-governing frame may
   --  inflect it out of sight, which leaves Plain).
   function Inner_Style (Seconds : D.Duration_Seconds) return D.Natural_Duration_Style is
      Best   : D.Natural_Duration_Style := D.Plain_Duration;
      Length : Natural := 0;
   begin
      for Style in D.Natural_Duration_Style loop
         declare
            Wording : constant String := Image (D.Natural_Duration (Context, Seconds, (Style => Style)));
         begin
            if Wording'Length > Length and then Ada.Strings.Fixed.Index (Item, Wording) /= 0 then
               Best := Style;
               Length := Wording'Length;
            end if;
         end;
      end loop;
      return Best;
   end Inner_Style;

   --  Item as Seconds words it, in some style or preset.
   function Reads (Seconds : D.Duration_Seconds; Result : out Natural_Duration_Parse_Result) return Boolean is
   begin
      for Style in D.Natural_Duration_Style loop
         if Image (D.Natural_Duration (Context, Seconds, (Style => Style))) = Item then
            Result := (Status => Humanize.Status.Ok, Style => Style, Direction => D.Duration_Distance_Plain,
                       Seconds => Seconds);
            return True;
         end if;
      end loop;
      for Direction in D.Duration_Distance_Past .. D.Duration_Distance_Future loop
         for Preset in D.Natural_Duration_Threshold_Preset loop
            if Image (D.Duration_Distance (Context, Seconds, Direction, Preset)) = Item then
               Result := (Status => Humanize.Status.Ok, Style => Inner_Style (Seconds),
                          Direction => Direction, Seconds => Seconds);
               return True;
            end if;
         end loop;
      end loop;
      return False;
   end Reads;

   Result : Natural_Duration_Parse_Result;
begin
   for Index in Seen'Range loop
      if Seen (Index).Decimals = 0 and then Seen (Index).Value < 1.0E9 then
         Counts (Index + 3) := D.Duration_Seconds (Seen (Index).Value);
      end if;
   end loop;
   for Seconds of Fixed loop
      if Reads (Seconds, Result) then
         return Result;
      end if;
   end loop;
   for Count of Counts loop
      for Size of Sizes loop
         if Reads (Count * Size, Result) then
            return Result;
         end if;
      end loop;
   end loop;
   return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Natural_Duration;
