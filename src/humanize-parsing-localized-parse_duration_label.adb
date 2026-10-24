separate (Humanize.Parsing.Localized)
function Parse_Duration_Label
  (Context : Humanize.Contexts.Context;
   Text    : String)
   return Duration_Label_Parse_Result
is
   package D renames Humanize.Durations;
   use type D.Duration_Seconds;

   Item  : constant String := Trimmed (Text);
   Seen  : constant Number_List := Numbers_In (Context, Item);
   Sizes : constant array (Positive range <>) of D.Duration_Seconds :=
     [1, 60, 3_600, 86_400, 604_800, 2_592_000, 31_536_000];

   --  The whole numbers Item shows, and 0, 1 and 2 (Arabic writes one and
   --  two hours in words).
   Counts : array (1 .. Seen'Length + 3) of D.Duration_Seconds := [0, 1, 2, others => 0];

   function Image (Result : Humanize.Status.Text_Result) return String is
     (if Result.Status = Humanize.Status.Ok then To_String (Result.Text) else "");

   function Label (Kind : Duration_Label_Kind; Seconds : D.Duration_Seconds) return String is
     (Image
        (case Kind is
            when Countdown_Label  => D.Countdown (Context, Seconds),
            when Within_Label     => D.SLA_Window (Context, Seconds),
            when Next_Label       => D.Next_Window (Context, Seconds),
            when Between_Label    => (Status => Humanize.Status.Invalid_Argument, others => <>),
            when Age_Label        => D.Age (Context, Seconds),
            when Stale_Label      => D.Stale_For (Context, Seconds),
            when Backup_Age_Label => D.Backup_Age (Context, Seconds),
            when ETA_Label        => D.ETA (Context, Seconds),
            when Expires_Label    => D.Expires_In (Context, Seconds),
            when Retry_Label      => D.Retry_In (Context, Seconds),
            when Modified_Label   => D.Modified_Ago (Context, Seconds),
            when Synced_Label     => D.Synced_Ago (Context, Seconds)));
begin
   for Index in Seen'Range loop
      if Seen (Index).Decimals = 0 and then Seen (Index).Value < 1.0E9 then
         Counts (Index + 3) := D.Duration_Seconds (Seen (Index).Value);
      end if;
   end loop;
   --  Each label of each count in each unit, as the formatters write them.
   for Count of Counts loop
      for Size of Sizes loop
         for Kind in Duration_Label_Kind loop
            if Kind /= Between_Label and then Label (Kind, Count * Size) = Item then
               return (Status => Humanize.Status.Ok, Kind => Kind, Seconds => Count * Size, High => 0);
            end if;
         end loop;
      end loop;
   end loop;
   for Low_Count of Counts loop
      for Low_Size of Sizes loop
         for High_Count of Counts loop
            for High_Size of Sizes loop
               if Low_Count * Low_Size <= High_Count * High_Size
                 and then Image (D.Interval (Context, Low_Count * Low_Size, High_Count * High_Size)) = Item
               then
                  return (Status => Humanize.Status.Ok, Kind => Between_Label,
                          Seconds => Low_Count * Low_Size, High => High_Count * High_Size);
               end if;
            end loop;
         end loop;
      end loop;
   end loop;
   return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Duration_Label;
