separate (Humanize.Parsing.Implementation.Scheduling_Text_Helpers)
function Parse_Recurrence_Core
     (Core : String)
      return Recurrence_Parse_Result
   is
      Item : constant String := Clean_Lower (Core);
      Prefix_Length : Natural := 0;
      Space  : Natural := 0;
      Of_Pos : Natural := 0;
      Count  : Integer;
      Unit   : Humanize.Durations.Recurrence_Unit;
      Weekday : Natural;
      Ordinal : Integer;
      Polish_Every : constant String := "ka" & U (16#17C#) & "dy ";
      Czech_Every  : constant String :=
        "ka" & U (16#17E#) & "d" & U (16#FD#) & " ";
      Every_Prefixes : constant String :=
        "every " & ASCII.LF
        & "hver " & ASCII.LF
        & "chaque " & ASCII.LF
        & "cada " & ASCII.LF
        & "ogni " & ASCII.LF
        & "elke " & ASCII.LF
        & "varje " & ASCII.LF
        & "joka " & ASCII.LF
        & Polish_Every & ASCII.LF
        & Czech_Every & ASCII.LF
        & "her ";
      Weekday_Set_Aliases : constant String :=
        "weekday" & ASCII.LF
        & "weekdays" & ASCII.LF
        & "hverdag" & ASCII.LF
        & "wochentag" & ASCII.LF
        & "jour ouvrable" & ASCII.LF
        & "d" & U (16#ED#) & "a laborable" & ASCII.LF
        & "giorno feriale" & ASCII.LF
        & "dia " & U (16#FA#) & "til" & ASCII.LF
        & "werkdag" & ASCII.LF
        & "vardag" & ASCII.LF
        & "virkedag" & ASCII.LF
        & "arkip" & U (16#E4#) & "iv" & U (16#E4#) & ASCII.LF
        & "dzie" & U (16#144#) & " roboczy" & ASCII.LF
        & "pracovn" & U (16#ED#) & " den" & ASCII.LF
        & "i" & U (16#15F#) & " g" & U (16#FC#) & "n"
          & U (16#FC#);

      function Parse_Natural (S : String; N : out Natural) return Boolean is
         V : Natural := 0;
      begin
         if S'Length = 0 then
            return False;
         end if;

         for Ch of S loop
            if not Is_Digit (Ch) then
               return False;
            end if;
            V := V * 10 + Digit_Value (Ch);
         end loop;

         N := V;
         return True;
      end Parse_Natural;

      function Monthly_Day_Result
        (Day : Natural)
         return Recurrence_Parse_Result
      is
         Result : Recurrence_Parse_Result :=
           Recurrence_Result
             (Recurrence_Interval, 1, Humanize.Durations.Every_Month,
              Item'Length);
      begin
         Result.Day_Of_Month := Day;
         return Result;
      end Monthly_Day_Result;
begin
      if Starts_With (Item, "day ") then
         declare
            Tail : constant String :=
              Trim (Item (Item'First + 4 .. Item'Last));
            Space : Natural := 0;
            Day : Natural := 0;
         begin
            for Index in Tail'Range loop
               if Tail (Index) = ' ' then
                  Space := Index;
                  exit;
               end if;
            end loop;
            if Space /= 0
              and then Parse_Natural (Tail (Tail'First .. Space - 1), Day)
              and then Day in 1 .. 31
              and then
                (Trim (Tail (Space + 1 .. Tail'Last)) = "of each month"
                 or else Trim (Tail (Space + 1 .. Tail'Last)) = "of every month")
            then
               return Monthly_Day_Result (Day);
            end if;
         end;
      elsif Starts_With (Item, "giorno ") then
         declare
            Tail : constant String :=
              Trim (Item (Item'First + 7 .. Item'Last));
            Space : Natural := 0;
            Day : Natural := 0;
         begin
            for Index in Tail'Range loop
               if Tail (Index) = ' ' then
                  Space := Index;
                  exit;
               end if;
            end loop;
            if Space /= 0
              and then Parse_Natural (Tail (Tail'First .. Space - 1), Day)
              and then Day in 1 .. 31
              and then Trim (Tail (Space + 1 .. Tail'Last)) = "di ogni mese"
            then
               return Monthly_Day_Result (Day);
            end if;
         end;
      elsif Starts_With (Item, "p" & U (16#E4#) & "iv" & U (16#E4#) & " ") then
         declare
            Prefix : constant String := "p" & U (16#E4#) & "iv" & U (16#E4#) & " ";
            Tail : constant String :=
              Trim (Item (Item'First + Prefix'Length .. Item'Last));
            Space : Natural := 0;
            Day : Natural := 0;
         begin
            for Index in Tail'Range loop
               if Tail (Index) = ' ' then
                  Space := Index;
                  exit;
               end if;
            end loop;
            if Space /= 0
              and then Parse_Natural (Tail (Tail'First .. Space - 1), Day)
              and then Day in 1 .. 31
              and then Trim (Tail (Space + 1 .. Tail'Last)) = "joka kuukausi"
            then
               return Monthly_Day_Result (Day);
            end if;
         end;
      else
         declare
            Dot : Natural := 0;
            Day : Natural := 0;
         begin
            for Index in Item'Range loop
               if Item (Index) = '.' then
                  Dot := Index;
                  exit;
               elsif not Is_Digit (Item (Index)) then
                  exit;
               end if;
            end loop;
            if Dot /= 0
              and then Parse_Natural (Item (Item'First .. Dot - 1), Day)
              and then Day in 1 .. 31
              and then
                (Trim (Item (Dot + 1 .. Item'Last)) =
                   "dzie" & U (16#144#) & " ka" & U (16#17C#)
                   & "dego miesi" & U (16#105#) & "ca"
                 or else Trim (Item (Dot + 1 .. Item'Last)) =
                   "hver m" & U (16#E5#) & "ned")
            then
               return Monthly_Day_Result (Day);
            end if;
         end;
      end if;

      if Item = "last business day"
        or else Item = "last business day of each month"
        or else Item = "last business day of every month"
        or else Item = "last weekday"
        or else Item = "last weekday of each month"
        or else Item = "last weekday of every month"
      then
         return Recurrence_Result
           (Recurrence_Business_Day, 1, Humanize.Durations.Every_Month,
            Item'Length, Ordinal => -1);
      end if;

      Of_Pos := Find_Substring (Item, " of each month");
      if Of_Pos = 0 then
         Of_Pos := Find_Substring (Item, " of every month");
      end if;
      if Of_Pos = 0 then
         Of_Pos := Find_Substring (Item, " di ogni mese");
      end if;
      if Of_Pos = 0 then
         Of_Pos := Find_Substring (Item, " de cada mes");
      end if;
      if Of_Pos = 0 then
         Of_Pos := Find_Substring (Item, " de cada m" & U (16#EA#) & "s");
      end if;
      if Of_Pos = 0 then
         Of_Pos := Find_Substring (Item, " van elke maand");
      end if;
      if Of_Pos = 0 then
         Of_Pos := Find_Substring (Item, " joka kuukausi");
      end if;
      if Of_Pos /= 0 then
         for Index in Item'First .. Of_Pos - 1 loop
            if Item (Index) = ' ' then
               Space := Index;
               exit;
            end if;
         end loop;
         if Space /= 0 then
            Ordinal := Recurrence_Ordinal_Value (Item (Item'First .. Space - 1));
            if Ordinal /= 0
              and then
                (Trim (Item (Space + 1 .. Of_Pos - 1)) = "business day"
                 or else Trim (Item (Space + 1 .. Of_Pos - 1)) =
                   "business days")
            then
               return Recurrence_Result
                 (Recurrence_Business_Day, 1,
                  Humanize.Durations.Every_Month, Item'Length,
                  Ordinal => Ordinal);
            end if;

            Weekday := Weekday_Value_Flexible (Item (Space + 1 .. Of_Pos - 1));
            if Ordinal /= 0 and then Weekday /= 0 then
               return Recurrence_Result
                 (Recurrence_Ordinal_Weekday, 1,
                  Humanize.Durations.Every_Month, Item'Length,
                  Weekday => Weekday, Ordinal => Ordinal);
            end if;
         end if;
      end if;

      Prefix_Length := Alias_Prefix_Length (Item, Every_Prefixes);

      if Prefix_Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      declare
         Rest : constant String :=
           Trim (Item (Item'First + Prefix_Length .. Item'Last));
      begin
         if Has_Alias (Rest, Weekday_Set_Aliases) then
            return Recurrence_Result
              (Recurrence_Weekday_Set, 1, Humanize.Durations.Every_Week,
               Item'Length, Weekdays => Humanize.Durations.Weekdays);
         elsif Rest = "weekend" or else Rest = "weekends" then
            return Recurrence_Result
              (Recurrence_Weekday_Set, 1, Humanize.Durations.Every_Week,
               Item'Length, Weekdays => Humanize.Durations.Weekends);
         elsif Rest = "business day" or else Rest = "business days" then
            return Recurrence_Result
              (Recurrence_Business_Day, 1, Humanize.Durations.Every_Day,
               Item'Length);
         elsif Rest = "last weekday"
           or else Rest = "last business day"
         then
            return Recurrence_Result
              (Recurrence_Business_Day, 1, Humanize.Durations.Every_Month,
               Item'Length, Ordinal => -1);
         end if;

         if Starts_With (Rest, "other ") then
            declare
               Tail : constant String := Trim (Rest (Rest'First + 6 .. Rest'Last));
            begin
               Weekday := Weekday_Value_Flexible (Tail);
               if Weekday /= 0 then
                  return Recurrence_Result
                    (Recurrence_Weekday, 2, Humanize.Durations.Every_Week,
                     Item'Length, Weekday => Weekday);
               elsif Recurrence_Unit_Value (Tail, Unit) then
                  return Recurrence_Result
                    (Recurrence_Interval, 2, Unit, Item'Length);
               end if;
            end;
         end if;

         Weekday := Weekday_Value_Flexible (Rest);
         if Weekday /= 0 then
            return Recurrence_Result
              (Recurrence_Weekday, 1, Humanize.Durations.Every_Week,
               Item'Length, Weekday => Weekday);
         elsif Recurrence_Unit_Value (Rest, Unit) then
            return Recurrence_Result
              (Recurrence_Interval, 1, Unit, Item'Length);
         end if;

         for Index in Rest'Range loop
            if Rest (Index) = ' ' then
               Space := Index;
               exit;
            end if;
         end loop;

         if Space /= 0
           and then Parse_Natural_Count (Rest (Rest'First .. Space - 1), Count)
           and then Count > 0
           and then Recurrence_Unit_Value (Rest (Space + 1 .. Rest'Last), Unit)
         then
            return Recurrence_Result
              (Recurrence_Interval, Positive (Count), Unit, Item'Length);
         end if;
      end;

      return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Recurrence_Core;
