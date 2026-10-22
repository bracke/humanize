with Humanize.Parsing.Implementation.Date_Times;

package body Humanize.Parsing.Date_Times is
   package Impl renames Humanize.Parsing.Implementation.Date_Times;

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

   function Parse_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Parse_Result is
     (Impl.Parse_Natural_Date (Reference => Reference, Text => Spaced (Text)));

   function Parse_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Parse_Result is
     (Impl.Parse_Natural_Date (Reference => Reference, Text => Spaced (Text), Rules => Rules));

   function Scan_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Parse_Result is
     (Impl.Scan_Natural_Date (Reference => Reference, Text => Spaced (Text)));

   function Scan_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Parse_Result is
     (Impl.Scan_Natural_Date (Reference => Reference, Text => Spaced (Text), Rules => Rules));

   function Parse_Natural_Date_Time
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Natural_Date_Time_Parse_Result is
     (Impl.Parse_Natural_Date_Time (Reference => Reference, Text => Spaced (Text)));

   function Scan_Natural_Date_Time
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Natural_Date_Time_Parse_Result is
     (Impl.Scan_Natural_Date_Time (Reference => Reference, Text => Spaced (Text)));

   function Parse_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Range_Parse_Result is
     (Impl.Parse_Natural_Date_Range (Reference => Reference, Text => Spaced (Text)));

   function Parse_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Range_Parse_Result is
     (Impl.Parse_Natural_Date_Range (Reference => Reference, Text => Spaced (Text), Rules => Rules));

   function Scan_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Range_Parse_Result is
     (Impl.Scan_Natural_Date_Range (Reference => Reference, Text => Spaced (Text)));

   function Scan_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Range_Parse_Result is
     (Impl.Scan_Natural_Date_Range (Reference => Reference, Text => Spaced (Text), Rules => Rules));

   function Parse_Business_Calendar
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Parse_Result is
     (Impl.Parse_Business_Calendar (Reference => Reference, Text => Spaced (Text)));

   function Scan_Business_Calendar
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Parse_Result is
     (Impl.Scan_Business_Calendar (Reference => Reference, Text => Spaced (Text)));

   function Apply_Business_Calendar_Rule
     (Rules : in out Humanize.Durations.Business_Calendar_Rules;
      Rule  : Business_Calendar_Parse_Result)
      return Humanize.Status.Status_Code renames Impl.Apply_Business_Calendar_Rule;

   function Parse_Business_Calendar_Rules
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Rules_Parse_Result is
     (Impl.Parse_Business_Calendar_Rules (Reference => Reference, Text => Spaced (Text)));

   function Parse_Date_Comparison
     (Text : String)
      return Date_Comparison_Parse_Result is
     (Impl.Parse_Date_Comparison (Text => Spaced (Text)));

   function Scan_Date_Comparison
     (Text : String)
      return Date_Comparison_Parse_Result is
     (Impl.Scan_Date_Comparison (Text => Spaced (Text)));

   function Classify_Scheduling_Phrase
     (Text : String)
      return Scheduling_Phrase_Result is
     (Impl.Classify_Scheduling_Phrase (Text => Spaced (Text)));
end Humanize.Parsing.Date_Times;
