with Humanize.Numbers;

separate (Humanize.Durations.Formatting)
function Progress_Bar
  (Context : Humanize.Contexts.Context;
   Done    : Standard.Natural;
   Total   : Positive;
   Width   : Positive := 10)
   return Humanize.Status.Text_Result
is
   Filled : constant Standard.Natural := Standard.Natural'Min (Width, Done * Width / Total);
   Percent : constant Standard.Natural := Standard.Natural'Min (100, Done * 100 / Total);
   --  The bar is ASCII everywhere; the percentage is the locale's ("30 %").
   Shown : constant Humanize.Status.Text_Result :=
     Humanize.Numbers.Percent
       (Context, Long_Float (Percent), (Maximum_Fraction_Digits => 0, Suppress_Trailing_Zero => True));
   Text : Unbounded_String;
begin
   Append (Text, "[");
   for Index in 1 .. Width loop
      Append (Text, (if Index <= Filled then "#" else "-"));
   end loop;
   Append
     (Text, "] " & (if Shown.Status = Humanize.Status.Ok then To_String (Shown.Text)
                     else No_Space (Standard.Natural'Image (Percent)) & "%"));
   return
     (Status => Humanize.Status.Ok,
      Text => Text,
      Key => Humanize.Message_Keys.No_Message);
end Progress_Bar;
