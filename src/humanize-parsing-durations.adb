with Ada.Strings.Unbounded;

with Humanize.Parsing.Implementation.CLDR_Vocabulary;
with Humanize.Parsing.Implementation.Durations;
with Humanize.Status;

package body Humanize.Parsing.Durations is
   package Impl renames Humanize.Parsing.Implementation.Durations;
   package Vocabulary renames Humanize.Parsing.Implementation.CLDR_Vocabulary;

   --  CLDR writes no-break spaces into what humanize renders -- French
   --  "2 secondes", narrow-no-break before a unit -- and the parser's word
   --  tables are spelled with ASCII spaces, so each such space is read as
   --  ASCII spaces of its own length: what a parse consumes still counts
   --  the caller's bytes.
   function Spaced (Text : String) return String is
      NBSP   : constant String := Character'Val (16#C2#) & Character'Val (16#A0#);
      Narrow : constant String := Character'Val (16#E2#) & Character'Val (16#80#) & Character'Val (16#AF#);
      Thin   : constant String := Character'Val (16#E2#) & Character'Val (16#80#) & Character'Val (16#89#);
      Result : String (1 .. Text'Length);
      Last   : Natural := 0;
      Index  : Natural := Text'First;
   begin
      while Index <= Text'Last loop
         if Index + 1 <= Text'Last and then Text (Index .. Index + 1) = NBSP then
            Result (Last + 1 .. Last + 2) := "  ";
            Last := Last + 2;
            Index := Index + 2;
         elsif Index + 2 <= Text'Last
           and then (Text (Index .. Index + 2) = Narrow or else Text (Index .. Index + 2) = Thin)
         then
            Result (Last + 1 .. Last + 3) := "   ";
            Last := Last + 3;
            Index := Index + 3;
         else
            Last := Last + 1;
            Result (Last) := Text (Index);
            Index := Index + 1;
         end if;
      end loop;
      return Result (1 .. Last);
   end Spaced;

   --  CLDR names one or two of a unit in some languages with a word and no
   --  number -- Arabic "ساعة" an hour, "ساعتان" two -- also inside a list
   --  ("ساعة, دقيقة و ثانية"). Each such word is given its count, so the
   --  parser reads "2 ساعتان".
   function Spell_Counts (Text : String) return String is
      Result     : Ada.Strings.Unbounded.Unbounded_String;
      Index      : Natural := Text'First;
      After_Digit : Boolean := False;
   begin
      while Index <= Text'Last loop
         if Text (Index) = ' ' or else Text (Index) = ',' then
            Ada.Strings.Unbounded.Append (Result, Text (Index));
            Index := Index + 1;
         else
            declare
               Stop : Natural := Index;
            begin
               while Stop < Text'Last and then Text (Stop + 1) /= ' ' and then Text (Stop + 1) /= ',' loop
                  Stop := Stop + 1;
               end loop;
               declare
                  Word    : constant String := Text (Index .. Stop);
                  Count   : Natural;
                  Seconds : Long_Long_Integer;
               begin
                  Vocabulary.Counted (Word, Count, Seconds);
                  if Seconds /= 0 and then not After_Digit then
                     Ada.Strings.Unbounded.Append (Result, Count'Image (2 .. Count'Image'Last) & " ");
                  end if;
                  Ada.Strings.Unbounded.Append (Result, Word);
                  After_Digit := Word (Word'Last) in '0' .. '9';
               end;
               Index := Stop + 1;
            end;
         end if;
      end loop;
      return Ada.Strings.Unbounded.To_String (Result);
   end Spell_Counts;

   --  CLDR writes some units before the number -- Swahili "sekunde 2", and
   --  in a list "saa 1, dakika 1 na sekunde 1" -- where the parser reads the
   --  number first. Each known unit word followed by a number is turned
   --  round, a comma after the number staying at the end of the pair.
   function Number_First (Text : String) return String is
      use Ada.Strings.Unbounded;

      function Is_Number (Token : String) return Boolean is
      begin
         if Token = "" then
            return False;
         end if;
         for C of Token loop
            if C not in '0' .. '9' | '.' then
               return False;
            end if;
         end loop;
         return True;
      end Is_Number;

      Result : Unbounded_String;
      Index  : Natural := Text'First;
   begin
      while Index <= Text'Last loop
         if Text (Index) = ' ' then
            Append (Result, ' ');
            Index := Index + 1;
         else
            declare
               Word_End : Natural := Index;
            begin
               while Word_End < Text'Last and then Text (Word_End + 1) /= ' ' loop
                  Word_End := Word_End + 1;
               end loop;
               declare
                  Word : constant String := Text (Index .. Word_End);
                  Next_First : constant Natural := Word_End + 2;
                  Next_Last  : Natural := Next_First - 1;
               begin
                  while Next_Last < Text'Last and then Text (Next_Last + 1) /= ' ' loop
                     Next_Last := Next_Last + 1;
                  end loop;
                  declare
                     Next  : constant String :=
                       (if Next_First <= Text'Last then Text (Next_First .. Next_Last) else "");
                     Comma : constant Boolean := Next'Length > 0 and then Next (Next'Last) = ',';
                     Bare  : constant String :=
                       (if Comma then Next (Next'First .. Next'Last - 1) else Next);
                     --  The word after the number, which would be the number's
                     --  own unit in "y 1 segundo": then "y" is no unit here.
                     After_First : constant Natural := Next_Last + 2;
                     After_Last  : Natural := After_First - 1;
                  begin
                     while After_Last < Text'Last and then Text (After_Last + 1) /= ' ' loop
                        After_Last := After_Last + 1;
                     end loop;
                     if Word_End < Text'Last and then Text (Word_End + 1) = ' '
                       and then Is_Number (Bare)
                       and then Vocabulary.Unit_Seconds (Word) /= 0
                       and then
                         (Comma or else After_First > Text'Last
                          or else Vocabulary.Unit_Seconds (Text (After_First .. After_Last)) = 0)
                     then
                        Append (Result, Bare & " " & Word & (if Comma then "," else ""));
                        Index := Next_Last + 1;
                     else
                        Append (Result, Word);
                        Index := Word_End + 1;
                     end if;
                  end;
               end;
            end;
         end if;
      end loop;
      return To_String (Result);
   end Number_First;

   function Parse_Duration
     (Text : String)
      return Duration_Parse_Result
   is
      use type Humanize.Status.Status_Code;
      Plain   : constant String := Spaced (Text);
      Counted : constant String := Number_First (Spell_Counts (Plain));
      Result  : Duration_Parse_Result := Impl.Parse_Duration (Text => Counted);
   begin
      --  What was read is the caller's text, whatever the counts added.
      if Counted /= Plain and then Result.Status = Humanize.Status.Ok
        and then Result.Consumed = Counted'Length
      then
         Result.Consumed := Text'Length;
      end if;
      return Result;
   end Parse_Duration;

   function Scan_Duration
     (Text : String)
      return Duration_Parse_Result is
     (Impl.Scan_Duration (Text => Spaced (Text)));

   function Parse_Lenient_Duration
     (Text : String)
      return Duration_Parse_Result is
     (Impl.Parse_Lenient_Duration (Text => Spaced (Text)));

   function Scan_Lenient_Duration
     (Text : String)
      return Duration_Parse_Result is
     (Impl.Scan_Lenient_Duration (Text => Spaced (Text)));

   function Parse_Duration_Range
     (Text : String)
      return Duration_Range_Parse_Result is
     (Impl.Parse_Duration_Range (Text => Spaced (Text)));

   function Scan_Duration_Range
     (Text : String)
      return Duration_Range_Parse_Result is
     (Impl.Scan_Duration_Range (Text => Spaced (Text)));

   function Parse_Countdown
     (Text : String)
      return Duration_Parse_Result is
     (Impl.Parse_Countdown (Text => Spaced (Text)));

   function Parse_SLA_Window
     (Text : String)
      return Duration_Parse_Result is
     (Impl.Parse_SLA_Window (Text => Spaced (Text)));

   function Parse_Age
     (Text : String)
      return Duration_Parse_Result is
     (Impl.Parse_Age (Text => Spaced (Text)));

   function Parse_Modified_Ago
     (Text : String)
      return Duration_Parse_Result is
     (Impl.Parse_Modified_Ago (Text => Spaced (Text)));

   function Parse_Progress
     (Text : String)
      return Proportion_Parse_Result is
     (Impl.Parse_Progress (Text => Spaced (Text)));

   function Parse_Result_Count
     (Text : String)
      return List_Parse_Result is
     (Impl.Parse_Result_Count (Text => Spaced (Text)));

   function Parse_Counted_Noun
     (Text : String)
      return Counted_Noun_Parse_Result is
     (Impl.Parse_Counted_Noun (Text => Spaced (Text)));

   function Scan_Counted_Noun
     (Text : String)
      return Counted_Noun_Parse_Result is
     (Impl.Scan_Counted_Noun (Text => Spaced (Text)));

   function Parse_Showing_Count
     (Text : String)
      return Proportion_Parse_Result is
     (Impl.Parse_Showing_Count (Text => Spaced (Text)));

   function Parse_Page_Count
     (Text : String)
      return Proportion_Parse_Result is
     (Impl.Parse_Page_Count (Text => Spaced (Text)));

   function Parse_ETA
     (Text : String)
      return Duration_Parse_Result is
     (Impl.Parse_ETA (Text => Spaced (Text)));

   function Scan_ETA
     (Text : String)
      return Duration_Parse_Result is
     (Impl.Scan_ETA (Text => Spaced (Text)));

   function Parse_Retry_In
     (Text : String)
      return Duration_Parse_Result is
     (Impl.Parse_Retry_In (Text => Spaced (Text)));

   function Scan_Retry_In
     (Text : String)
      return Duration_Parse_Result is
     (Impl.Scan_Retry_In (Text => Spaced (Text)));

   function Parse_Step_Count
     (Text : String)
      return Proportion_Parse_Result is
     (Impl.Parse_Step_Count (Text => Spaced (Text)));

   function Scan_Step_Count
     (Text : String)
      return Proportion_Parse_Result is
     (Impl.Scan_Step_Count (Text => Spaced (Text)));

   function Parse_Attempt_Count
     (Text : String)
      return Proportion_Parse_Result is
     (Impl.Parse_Attempt_Count (Text => Spaced (Text)));

   function Scan_Attempt_Count
     (Text : String)
      return Proportion_Parse_Result is
     (Impl.Scan_Attempt_Count (Text => Spaced (Text)));

   function Parse_Business_Days
     (Text : String)
      return Number_Parse_Result is
     (Impl.Parse_Business_Days (Text => Spaced (Text)));

   function Scan_Business_Days
     (Text : String)
      return Number_Parse_Result is
     (Impl.Scan_Business_Days (Text => Spaced (Text)));

   function Parse_Working_Hours
     (Text : String)
      return Number_Parse_Result is
     (Impl.Parse_Working_Hours (Text => Spaced (Text)));

   function Scan_Working_Hours
     (Text : String)
      return Number_Parse_Result is
     (Impl.Scan_Working_Hours (Text => Spaced (Text)));

   function Parse_Recurrence
     (Text : String)
      return Number_Parse_Result is
     (Impl.Parse_Recurrence (Text => Spaced (Text)));

   function Parse_Recurrence_Detail
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Recurrence_Parse_Result is
     (Impl.Parse_Recurrence_Detail (Reference => Reference, Text => Spaced (Text)));

   function Parse_Cron_Schedule
     (Text : String)
      return Recurrence_Parse_Result is
     (Impl.Parse_Cron_Schedule (Text => Spaced (Text)));

   function Scan_Cron_Schedule
     (Text : String)
      return Recurrence_Parse_Result is
     (Impl.Scan_Cron_Schedule (Text => Spaced (Text)));

   function Scan_Recurrence
     (Text : String)
      return Number_Parse_Result is
     (Impl.Scan_Recurrence (Text => Spaced (Text)));

   function Scan_Recurrence_Detail
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Recurrence_Parse_Result is
     (Impl.Scan_Recurrence_Detail (Reference => Reference, Text => Spaced (Text)));

   function Parse_Throughput_Remaining
     (Text : String)
      return Proportion_Parse_Result is
     (Impl.Parse_Throughput_Remaining (Text => Spaced (Text)));

   function Scan_Throughput_Remaining
     (Text : String)
      return Proportion_Parse_Result is
     (Impl.Scan_Throughput_Remaining (Text => Spaced (Text)));

   function Parse_Progress_Bar
     (Text : String)
      return Number_Parse_Result is
     (Impl.Parse_Progress_Bar (Text => Spaced (Text)));

   function Scan_Progress_Bar
     (Text : String)
      return Number_Parse_Result is
     (Impl.Scan_Progress_Bar (Text => Spaced (Text)));

   function Parse_Precise_Duration
     (Text : String)
      return Precise_Duration_Parse_Result is
     (Impl.Parse_Precise_Duration (Text => Spaced (Text)));

   function Scan_Precise_Duration
     (Text : String)
      return Precise_Duration_Parse_Result is
     (Impl.Scan_Precise_Duration (Text => Spaced (Text)));
end Humanize.Parsing.Durations;
