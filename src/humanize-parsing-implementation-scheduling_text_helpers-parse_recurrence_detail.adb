separate (Humanize.Parsing.Implementation.Scheduling_Text_Helpers)
function Parse_Recurrence_Detail
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Recurrence_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Core_Last : Natural := Item'Last;
      Result : Recurrence_Parse_Result;
      Clause_Pos : Natural;
      At_Pos : Natural;
      At_Length : Natural := 0;
      Time_Last : Natural;
      Parsed_Date : Date_Parse_Result;
      Count : Integer;
      Has_Time : Boolean := False;
      Hour : Natural := 0;
      Minute : Natural := 0;
      Has_Time_Window : Boolean := False;
      Window_Start_Hour : Natural := 0;
      Window_Start_Minute : Natural := 0;
      Window_End_Hour : Natural := 0;
      Window_End_Minute : Natural := 0;
      Has_Excluded_Weekdays : Boolean := False;
      Excluded_Weekdays : Humanize.Durations.Weekday_Set := [others => False];
      Time_Marker_Aliases : constant String :=
        " at " & ASCII.LF
        & " kl. " & ASCII.LF
        & " um " & ASCII.LF
        & " alle " & ASCII.LF
        & " klo " & ASCII.LF
        & " o " & ASCII.LF
        & " a las " & ASCII.LF
        & " " & U (16#E0#) & " " & ASCII.LF
        & " " & U (16#E0#) & "s ";

      function Parse_Time (Value : String) return Boolean is
         T : constant String := Trim (Value);
         Colon : Natural := 0;
         H : Natural := 0;
         M : Natural := 0;

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
      begin
         for Index in T'Range loop
            if T (Index) = ':' then
               Colon := Index;
               exit;
            end if;
         end loop;

         if Colon = 0 then
            if not Parse_Natural (T, H) or else H > 23 then
               return False;
            end if;
            Hour := H;
            Minute := 0;
            return True;
         end if;

         if not Parse_Natural (T (T'First .. Colon - 1), H)
           or else not Parse_Natural (T (Colon + 1 .. T'Last), M)
           or else H > 23
           or else M > 59
         then
            return False;
         end if;

         Hour := H;
         Minute := M;
         return True;
      end Parse_Time;

      procedure Find_Time_Marker
        (Position : out Natural;
         Length   : out Natural)
      is
         First : Natural := Time_Marker_Aliases'First;
         Last  : Natural;

         procedure Consider (Pattern : String) is
            Candidate : constant Natural := Find_Substring (Item, Pattern);
         begin
            if Candidate /= 0 and then Candidate >= Position then
               Position := Candidate;
               Length := Pattern'Length;
            end if;
         end Consider;
      begin
         Position := 0;
         Length := 0;

         while First <= Time_Marker_Aliases'Last loop
            Last := First;
            while Last <= Time_Marker_Aliases'Last
              and then Time_Marker_Aliases (Last) /= ASCII.LF
            loop
               Last := Last + 1;
            end loop;

            if Last > First then
               Consider (Time_Marker_Aliases (First .. Last - 1));
            end if;

            First := Last + 1;
         end loop;
      end Find_Time_Marker;
begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      Clause_Pos := Find_Substring (Item, " except ");
      if Clause_Pos /= 0 then
         declare
            Tail_Last : Natural := Item'Last;
            Weekday : Natural := 0;
         begin
            declare
               From_Pos : constant Natural := Find_Substring (Item, " from ");
               Until_Pos : constant Natural := Find_Substring (Item, " until ");
               For_Pos : constant Natural := Find_Substring (Item, " for ");
               Between_Pos : constant Natural := Find_Substring (Item, " between ");
            begin
               if From_Pos /= 0 and then From_Pos > Clause_Pos then
                  Tail_Last := Natural'Min (Tail_Last, From_Pos - 1);
               end if;
               if Until_Pos /= 0 and then Until_Pos > Clause_Pos then
                  Tail_Last := Natural'Min (Tail_Last, Until_Pos - 1);
               end if;
               if For_Pos /= 0 and then For_Pos > Clause_Pos then
                  Tail_Last := Natural'Min (Tail_Last, For_Pos - 1);
               end if;
               if Between_Pos /= 0 and then Between_Pos > Clause_Pos then
                  Tail_Last := Natural'Min (Tail_Last, Between_Pos - 1);
               end if;
            end;

            if Tail_Last < Clause_Pos + 8 then
               return (Status => Humanize.Status.Invalid_Argument, others => <>);
            end if;
            Weekday := Weekday_Value_Flexible
              (Item (Clause_Pos + 8 .. Tail_Last));
            if Weekday = 0 then
               return (Status => Humanize.Status.Invalid_Argument, others => <>);
            end if;
            Has_Excluded_Weekdays := True;
            Excluded_Weekdays (Weekday) := True;
            Core_Last := Natural'Min (Core_Last, Clause_Pos - 1);
         end;
      end if;

      Clause_Pos := Find_Substring (Item, " between ");
      if Clause_Pos /= 0 then
         declare
            Tail_Last : Natural := Item'Last;
            And_Pos : Natural := 0;
            Start_H : Natural := 0;
            Start_M : Natural := 0;
            End_H : Natural := 0;
            End_M : Natural := 0;
         begin
            declare
               From_Pos : constant Natural := Find_Substring (Item, " from ");
               Until_Pos : constant Natural := Find_Substring (Item, " until ");
               For_Pos : constant Natural := Find_Substring (Item, " for ");
               Except_Pos : constant Natural := Find_Substring (Item, " except ");
            begin
               if From_Pos /= 0 and then From_Pos > Clause_Pos then
                  Tail_Last := Natural'Min (Tail_Last, From_Pos - 1);
               end if;
               if Until_Pos /= 0 and then Until_Pos > Clause_Pos then
                  Tail_Last := Natural'Min (Tail_Last, Until_Pos - 1);
               end if;
               if For_Pos /= 0 and then For_Pos > Clause_Pos then
                  Tail_Last := Natural'Min (Tail_Last, For_Pos - 1);
               end if;
               if Except_Pos /= 0 and then Except_Pos > Clause_Pos then
                  Tail_Last := Natural'Min (Tail_Last, Except_Pos - 1);
               end if;
            end;

            And_Pos := Find_Substring
              (Item (Clause_Pos + 9 .. Tail_Last), " and ");
            if And_Pos = 0 then
               return (Status => Humanize.Status.Invalid_Argument, others => <>);
            end if;

            if not Parse_Time (Item (Clause_Pos + 9 .. And_Pos - 1)) then
               return (Status => Humanize.Status.Invalid_Argument, others => <>);
            end if;
            Start_H := Hour;
            Start_M := Minute;
            if not Parse_Time (Item (And_Pos + 5 .. Tail_Last)) then
               return (Status => Humanize.Status.Invalid_Argument, others => <>);
            end if;
            End_H := Hour;
            End_M := Minute;

            Has_Time_Window := True;
            Window_Start_Hour := Start_H;
            Window_Start_Minute := Start_M;
            Window_End_Hour := End_H;
            Window_End_Minute := End_M;
            Core_Last := Natural'Min (Core_Last, Clause_Pos - 1);
         end;
      end if;

      Clause_Pos := Find_Substring (Item, " for ");
      if Clause_Pos /= 0 then
         declare
            Tail : constant String := Trim (Item (Clause_Pos + 5 .. Item'Last));
            Space : Natural := 0;
         begin
            for Index in Tail'Range loop
               if Tail (Index) = ' ' then
                  Space := Index;
                  exit;
               end if;
            end loop;
            if Space = 0
              or else not Parse_Natural_Count (Tail (Tail'First .. Space - 1), Count)
              or else Count <= 0
            then
               return (Status => Humanize.Status.Invalid_Argument, others => <>);
            end if;
            Core_Last := Natural'Min (Core_Last, Clause_Pos - 1);
         end;
      end if;

      Clause_Pos := Find_Substring (Item, " until ");
      if Clause_Pos /= 0 then
         Parsed_Date := Parse_Natural_Date
           (Reference, Item (Clause_Pos + 7 .. Core_Last));
         if Parsed_Date.Status /= Humanize.Status.Ok then
            return (Status => Parsed_Date.Status, others => <>);
         end if;
         Core_Last := Natural'Min (Core_Last, Clause_Pos - 1);
      end if;

      Clause_Pos := Find_Substring (Item, " from ");
      if Clause_Pos /= 0 then
         Parsed_Date := Parse_Natural_Date
           (Reference, Item (Clause_Pos + 6 .. Core_Last));
         if Parsed_Date.Status /= Humanize.Status.Ok then
            return (Status => Parsed_Date.Status, others => <>);
         end if;
         Core_Last := Natural'Min (Core_Last, Clause_Pos - 1);
      end if;

      Find_Time_Marker (At_Pos, At_Length);
      if At_Pos /= 0 then
         Time_Last := Item'Last;
         Clause_Pos := Find_Substring (Item, " from ");
         if Clause_Pos /= 0 and then Clause_Pos > At_Pos then
            Time_Last := Natural'Min (Time_Last, Clause_Pos - 1);
         end if;
         Clause_Pos := Find_Substring (Item, " until ");
         if Clause_Pos /= 0 and then Clause_Pos > At_Pos then
            Time_Last := Natural'Min (Time_Last, Clause_Pos - 1);
         end if;
         Clause_Pos := Find_Substring (Item, " for ");
         if Clause_Pos /= 0 and then Clause_Pos > At_Pos then
            Time_Last := Natural'Min (Time_Last, Clause_Pos - 1);
         end if;

         if Time_Last < At_Pos + At_Length
           or else not Parse_Time (Item (At_Pos + At_Length .. Time_Last))
         then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;

         Has_Time := True;
         Core_Last := Natural'Min (Core_Last, At_Pos - 1);
      end if;

      if Core_Last < Item'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      Result := Parse_Recurrence_Core (Item (Item'First .. Core_Last));
      if Result.Status /= Humanize.Status.Ok then
         return Result;
      end if;

      if Has_Time then
         Result.Has_Time := True;
         Result.Hour := Hour;
         Result.Minute := Minute;
      end if;

      if Has_Time_Window then
         Result.Has_Time_Window := True;
         Result.Window_Start_Hour := Window_Start_Hour;
         Result.Window_Start_Minute := Window_Start_Minute;
         Result.Window_End_Hour := Window_End_Hour;
         Result.Window_End_Minute := Window_End_Minute;
      end if;

      if Has_Excluded_Weekdays then
         Result.Has_Excluded_Weekdays := True;
         Result.Excluded_Weekdays := Excluded_Weekdays;
         if Result.Kind = Recurrence_Weekday_Set then
            for Day in Result.Weekdays'Range loop
               if Result.Excluded_Weekdays (Day) then
                  Result.Weekdays (Day) := False;
               end if;
            end loop;
         end if;
      end if;

      Clause_Pos := Find_Substring (Item, " from ");
      if Clause_Pos /= 0 then
         declare
            Tail_Last : Natural := Item'Last;
            Until_Pos : constant Natural := Find_Substring (Item, " until ");
            For_Pos   : constant Natural := Find_Substring (Item, " for ");
         begin
            if Until_Pos /= 0 and then Until_Pos > Clause_Pos then
               Tail_Last := Until_Pos - 1;
            elsif For_Pos /= 0 and then For_Pos > Clause_Pos then
               Tail_Last := For_Pos - 1;
            end if;
            Parsed_Date := Parse_Natural_Date
              (Reference, Item (Clause_Pos + 6 .. Tail_Last));
            Result.Has_Start_Date := True;
            Result.Start_Date := Parsed_Date.Value;
         end;
      end if;

      Clause_Pos := Find_Substring (Item, " until ");
      if Clause_Pos /= 0 then
         declare
            Tail_Last : Natural := Item'Last;
            For_Pos : constant Natural := Find_Substring (Item, " for ");
         begin
            if For_Pos /= 0 and then For_Pos > Clause_Pos then
               Tail_Last := For_Pos - 1;
            end if;
            Parsed_Date := Parse_Natural_Date
              (Reference, Item (Clause_Pos + 7 .. Tail_Last));
            Result.Has_End_Date := True;
            Result.End_Date := Parsed_Date.Value;
         end;
      end if;

      Clause_Pos := Find_Substring (Item, " for ");
      if Clause_Pos /= 0 then
         declare
            Tail : constant String := Trim (Item (Clause_Pos + 5 .. Item'Last));
            Space : Natural := 0;
         begin
            for Index in Tail'Range loop
               if Tail (Index) = ' ' then
                  Space := Index;
                  exit;
               end if;
            end loop;
            if not Parse_Natural_Count (Tail (Tail'First .. Space - 1), Count)
            then
               return (Status => Humanize.Status.Invalid_Argument, others => <>);
            end if;
            Result.Has_Occurrences := True;
            Result.Occurrences := Natural (Count);
         end;
      end if;

      Result.Consumed := Item'Length;
      return Result;
exception
      when Constraint_Error | Ada.Calendar.Time_Error => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Value, others => <>);
end Parse_Recurrence_Detail;
