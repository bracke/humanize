with Ada.Calendar;
with Ada.Containers.Indefinite_Hashed_Maps;
with Ada.Containers.Vectors;
with Ada.Strings.Fixed;
with Ada.Strings.Hash;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with System.Address_Image;

with Humanize.Bytes;
with Humanize.Catalog_Loads;
with Humanize.Durations;
with Humanize.Units;
with Humanize.Parsing.Locale_Digits;
with Humanize.Status;

package body Humanize.Parsing.Localized is

   use type Humanize.Status.Status_Code;
   use type Humanize.Bytes.Byte_Count;
   use type Humanize.Bytes.Byte_Unit_System;
   use type Ada.Calendar.Time;

   --  Where a form's number stands.
   Marker : constant Character := Character'Val (1);

   --  One way the locale writes a value: its text with the number as Marker
   --  ("vor " & Marker & " Tagen"), and the value per unit of that number --
   --  or, for a form without a number ("gestern", Arabic "ساعتان"), the value.
   type Form is record
      Pattern   : Unbounded_String;
      Counted   : Boolean := False;
      Unit      : Long_Float := 0.0;
      --  Value = number * Unit + Offset; Offset is not 0 for an affine unit
      --  (degrees Fahrenheit for Celsius).
      Offset    : Long_Float := 0.0;
      --  The samples with the smallest and largest number shown, for Fit.
      Low_Shown, Low_Value, High_Shown, High_Value : Long_Float := 0.0;
      --  The locale also writes a value of the other sign this way (Hindi
      --  "कल" is yesterday and tomorrow).
      Ambiguous : Boolean := False;
   end record;

   package Form_Vectors is new Ada.Containers.Vectors (Positive, Form);
   package Text_Vectors is new Ada.Containers.Vectors (Positive, Unbounded_String);

   --  What a locale writes for one kind of value: its forms, and the texts it
   --  joins several with.
   type Lexicon is record
      Forms : Form_Vectors.Vector;
      Joins : Text_Vectors.Vector;
   end record;

   type Lexicon_Kind is (Durations_Kind, Relative_Kind, Bytes_Kind, Measure_Kind, Dates_Kind);

   package Lexicon_Maps is new Ada.Containers.Indefinite_Hashed_Maps
     (Key_Type => String, Element_Type => Lexicon, Hash => Ada.Strings.Hash, Equivalent_Keys => "=");

   --  Lexicons learnt so far, per runtime, locale, kind and catalog load
   --  (a load can change what the formatters write): learning renders a few
   --  hundred values, reading one is a lookup.
   protected Cache is
      procedure Find (Key : String; Item : out Lexicon; Found : out Boolean);
      procedure Store (Key : String; Item : Lexicon);
   private
      Items : Lexicon_Maps.Map;
   end Cache;

   protected body Cache is
      procedure Find (Key : String; Item : out Lexicon; Found : out Boolean) is
         Position : constant Lexicon_Maps.Cursor := Items.Find (Key);
      begin
         Found := Lexicon_Maps.Has_Element (Position);
         if Found then
            Item := Lexicon_Maps.Element (Position);
         end if;
      end Find;

      procedure Store (Key : String; Item : Lexicon) is
      begin
         Items.Include (Key, Item);
      end Store;
   end Cache;

   function Plain (Context : Humanize.Contexts.Context; Text : String) return String is
     (Humanize.Parsing.Locale_Digits.Normalize (Context, Text, Quantities => True));

   --  The number at Text (From ..): ASCII digits, optionally '.' and more.
   procedure Read_Number (Text : String; From : Positive; Last : out Natural; Value : out Long_Float) is
      I : Natural := From;
   begin
      Last := 0;
      Value := 0.0;
      while I <= Text'Last and then Text (I) in '0' .. '9' loop
         I := I + 1;
      end loop;
      if I = From then
         return;
      end if;
      if I < Text'Last and then Text (I) = '.' and then Text (I + 1) in '0' .. '9' then
         I := I + 1;
         while I <= Text'Last and then Text (I) in '0' .. '9' loop
            I := I + 1;
         end loop;
      end if;
      Last := I - 1;
      if I - From > 18 then
         Last := 0;
         return;
      end if;
      Value := Long_Float'Value ((if Text (From .. Last)'Length > 0 and then Text (Last) /= '.'
                                  then Text (From .. Last) else "0"));
   exception
      when Constraint_Error =>
         Last := 0;
   end Read_Number;

   --  Record Rendered (normalized) as a form of Value: the number it shows
   --  becomes Marker and the unit Value over it; a text with no number is a
   --  form of Value itself. A text with more than one number is not a form.
   procedure Learn (Forms : in out Form_Vectors.Vector; Rendered : String; Value : Long_Float) is
      Start : Natural := 0;
      Last  : Natural := 0;
      Shown : Long_Float := 0.0;
   begin
      for I in Rendered'Range loop
         if Rendered (I) in '0' .. '9' then
            Start := I;
            Read_Number (Rendered, I, Last, Shown);
            exit;
         end if;
      end loop;
      if Start = 0 then
         for F of Forms loop
            if F.Pattern = Rendered then
               F.Ambiguous := F.Ambiguous or else F.Unit * Value < 0.0;
               return;
            end if;
         end loop;
         Forms.Append (Form'(Pattern => To_Unbounded_String (Rendered), Counted => False, Unit => Value,
                             others => <>));
         return;
      end if;
      if Last = 0 or else Shown = 0.0 then
         return;
      end if;
      for I in Last + 1 .. Rendered'Last loop
         if Rendered (I) in '0' .. '9' then
            return;
         end if;
      end loop;
      declare
         Pattern : constant Unbounded_String :=
           To_Unbounded_String (Rendered (Rendered'First .. Start - 1) & Marker & Rendered (Last + 1 .. Rendered'Last));
      begin
         for F of Forms loop
            if F.Pattern = Pattern then
               F.Ambiguous := F.Ambiguous or else F.High_Value * Value < 0.0;
               if Shown < F.Low_Shown then
                  F.Low_Shown := Shown;
                  F.Low_Value := Value;
               elsif Shown > F.High_Shown then
                  F.High_Shown := Shown;
                  F.High_Value := Value;
               end if;
               return;
            end if;
         end loop;
         Forms.Append (Form'(Pattern => Pattern, Counted => True, Unit => Value / Shown, Offset => 0.0,
                             Ambiguous => False, Low_Shown => Shown, Low_Value => Value, High_Shown => Shown,
                             High_Value => Value));
      end;
   end Learn;

   --  Each counted form's unit from its samples: the largest number shown
   --  (least rounded, "621 mi" over "1.2 mi") where the samples agree on a
   --  ratio, else the line through both (an affine unit such as Fahrenheit).
   procedure Fit (Forms : in out Form_Vectors.Vector) is
   begin
      for F of Forms loop
         if F.Counted and then F.High_Shown /= 0.0 then
            declare
               High_Ratio : constant Long_Float := F.High_Value / F.High_Shown;
               Low_Ratio  : constant Long_Float := F.Low_Value / F.Low_Shown;
            begin
               if F.High_Shown = F.Low_Shown or else abs (High_Ratio - Low_Ratio) <= 0.1 * abs High_Ratio then
                  F.Unit := High_Ratio;
                  F.Offset := 0.0;
               else
                  F.Unit := (F.High_Value - F.Low_Value) / (F.High_Shown - F.Low_Shown);
                  F.Offset := F.High_Value - F.Unit * F.High_Shown;
               end if;
            end;
         end if;
      end loop;
   end Fit;

   --  Whether Form F reads Text (From .. To) exactly; its value.
   function Reads (F : Form; Text : String; From, To : Positive; Value : out Long_Float) return Boolean is
      P : constant String := To_String (F.Pattern);
   begin
      Value := 0.0;
      if not F.Counted then
         Value := F.Unit;
         return To - From + 1 = P'Length and then Text (From .. To) = P;
      end if;
      declare
         M      : Positive := P'First;
      begin
         while P (M) /= Marker loop
            M := M + 1;
         end loop;
         declare
            Before : constant String := P (P'First .. M - 1);
            After  : constant String := P (M + 1 .. P'Last);
            Last   : Natural;
            Count  : Long_Float;
         begin
            if To - From + 1 < Before'Length + 1 + After'Length
              or else Text (From .. From + Before'Length - 1) /= Before
            then
               return False;
            end if;
            Read_Number (Text, From + Before'Length, Last, Count);
            if Last = 0 or else To - Last /= After'Length or else Text (Last + 1 .. To) /= After then
               return False;
            end if;
            Value := Count * F.Unit + F.Offset;
            return True;
         end;
      end;
   end Reads;

   --  Text read as one or more forms joined by connectors, summed.
   function Read_Joined
     (Forms : Form_Vectors.Vector; Joins : Text_Vectors.Vector; Text : String; Value : out Long_Float)
      return Boolean
   is
      function From (Start : Positive; Total : Long_Float) return Boolean is
      begin
         for Stop in reverse Start .. Text'Last loop
            for F of Forms loop
               declare
                  Part : Long_Float;
               begin
                  if Reads (F, Text, Start, Stop, Part) then
                     if Stop = Text'Last then
                        Value := Total + Part;
                        return True;
                     end if;
                     for J of Joins loop
                        declare
                           Join : constant String := To_String (J);
                        begin
                           if Join'Length > 0 and then Stop + Join'Length < Text'Last
                             and then Text (Stop + 1 .. Stop + Join'Length) = Join
                             and then From (Stop + Join'Length + 1, Total + Part)
                           then
                              return True;
                           end if;
                        end;
                     end loop;
                  end if;
               end;
            end loop;
         end loop;
         return False;
      end From;
   begin
      Value := 0.0;
      return Text'Length > 0 and then From (Text'First, 0.0);
   end Read_Joined;

   type Integer_List is array (Positive range <>) of Long_Long_Integer;
   Present_Offsets : constant Integer_List := [0, 1, -1];
   Signs           : constant Integer_List := [-1, 1];

   --  Counts that between them take every plural category CLDR has.
   Samples : constant Integer_List :=
     [1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 20, 21, 22, 25, 100, 101, 102, 103, 111, 1000];

   function Trimmed (Text : String) return String is
      First : Positive := Text'First;
      Last  : Natural := Text'Last;
   begin
      while First <= Last and then Text (First) = ' ' loop
         First := First + 1;
      end loop;
      while Last >= First and then Text (Last) = ' ' loop
         Last := Last - 1;
      end loop;
      return Text (First .. Last);
   end Trimmed;

   function Parse_Number
     (Context : Humanize.Contexts.Context;
      Text    : String)
      return Float_Parse_Result
   is
      Minus : constant String := [Character'Val (16#E2#), Character'Val (16#88#), Character'Val (16#92#)];
      Item  : constant String := Trimmed (Plain (Context, Text));
      Sign  : Long_Float := 1.0;
      First : Positive := Item'First;
      Last  : Natural;
      Value : Long_Float;
   begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      if Item (First) = '-' then
         Sign := -1.0;
         First := First + 1;
      elsif Item'Length > Minus'Length and then Item (First .. First + Minus'Length - 1) = Minus then
         Sign := -1.0;
         First := First + Minus'Length;
      end if;
      if First > Item'Last then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Read_Number (Item, First, Last, Value);
      if Last /= Item'Last then
         return (Status => Humanize.Status.Invalid_Argument, Error_Position => Last + 1, others => <>);
      end if;
      return (Status => Humanize.Status.Ok, Value => Sign * Value, Exact => True, Consumed => Text'Length,
              others => <>);
   end Parse_Number;

   Unit_Seconds : constant array (Humanize.Durations.Duration_Unit) of Long_Long_Integer :=
     [Humanize.Durations.Second => 1, Humanize.Durations.Minute => 60, Humanize.Durations.Hour => 3_600,
      Humanize.Durations.Day => 86_400, Humanize.Durations.Week => 604_800,
      Humanize.Durations.Month => 2_592_000, Humanize.Durations.Year => 31_536_000];

   function Learn_Durations (Context : Humanize.Contexts.Context) return Lexicon is
      package D renames Humanize.Durations;
      Result : Lexicon;

      function Render (Seconds : Long_Long_Integer; Largest, Smallest : D.Duration_Unit; Parts : Positive)
        return String
      is
         Rendered : constant Humanize.Status.Text_Result :=
           D.Format_Components
             (Context, D.Duration_Seconds (Seconds), Parts, (Largest_Unit => Largest, Smallest_Unit => Smallest));
      begin
         return (if Rendered.Status = Humanize.Status.Ok then Plain (Context, To_String (Rendered.Text)) else "");
      end Render;

      --  The text between the renderings of a duration's parts, in order.
      procedure Learn_Joins (Whole : String; Parts : Text_Vectors.Vector) is
         At_Index : Positive := Whole'First;
      begin
         for I in Parts.First_Index .. Parts.Last_Index loop
            --  A part the locale could not render: nothing to learn.
            exit when Length (Parts (I)) = 0 or else At_Index > Whole'Last;
            declare
               Part  : constant String := To_String (Parts (I));
               Found : constant Natural := Index (To_Unbounded_String (Whole (At_Index .. Whole'Last)), Part);
            begin
               exit when Found = 0;
               if I > Parts.First_Index then
                  declare
                     Join : constant Unbounded_String :=
                       To_Unbounded_String (Whole (At_Index .. At_Index + Found - 2));
                  begin
                     if Join /= Null_Unbounded_String and then not Result.Joins.Contains (Join) then
                        Result.Joins.Append (Join);
                     end if;
                  end;
               end if;
               At_Index := At_Index + Found - 1 + Part'Length;
               exit when At_Index > Whole'Last;
            end;
         end loop;
      end Learn_Joins;

      Pair  : Text_Vectors.Vector;
      Three : Text_Vectors.Vector;
   begin
      for Unit in D.Duration_Unit loop
         for N of Samples loop
            declare
               Seconds  : constant Long_Long_Integer := N * Unit_Seconds (Unit);
               Rendered : constant String := Render (Seconds, Unit, Unit, 1);
            begin
               if Rendered /= "" then
                  Learn (Result.Forms, Rendered, Long_Float (Seconds));
               end if;
            end;
         end loop;
      end loop;
      --  Two and three parts give the locale's joins (", ", " und ").
      Pair.Append (To_Unbounded_String (Render (2 * 3_600, D.Hour, D.Hour, 1)));
      Pair.Append (To_Unbounded_String (Render (30 * 60, D.Minute, D.Minute, 1)));
      Learn_Joins (Render (2 * 3_600 + 30 * 60, D.Hour, D.Minute, 2), Pair);
      Three.Append (To_Unbounded_String (Render (3 * 86_400, D.Day, D.Day, 1)));
      Three.Append (To_Unbounded_String (Render (2 * 3_600, D.Hour, D.Hour, 1)));
      Three.Append (To_Unbounded_String (Render (5 * 60, D.Minute, D.Minute, 1)));
      Learn_Joins (Render (3 * 86_400 + 2 * 3_600 + 5 * 60, D.Day, D.Minute, 3), Three);
      Fit (Result.Forms);
      return Result;
   end Learn_Durations;

   function Learn_Relative (Context : Humanize.Contexts.Context) return Lexicon is
      package D renames Humanize.Durations;
      Result    : Lexicon;
      Reference : constant Ada.Calendar.Time := Ada.Calendar.Time_Of (2026, 3, 10, 43_200.0);

      function Render (Offset : Long_Long_Integer) return String is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Datetimes.Relative (Context, Reference + Duration (Offset), Reference);
      begin
         return (if Rendered.Status = Humanize.Status.Ok then Plain (Context, To_String (Rendered.Text)) else "");
      end Render;
   begin
      --  The present first, so "now" reads as 0 rather than a few seconds.
      for Offset of Present_Offsets loop
         if Render (Offset) /= "" then
            Learn (Result.Forms, Render (Offset), 0.0);
         end if;
      end loop;
      --  Largest units first: a calendar word ("yesterday") is first learnt
      --  from the span it names (a day), not from 1000 minutes.
      for Sign of Signs loop
         for Unit in reverse D.Duration_Unit loop
            for N of Samples loop
               declare
                  Offset : constant Long_Long_Integer := Sign * N * Unit_Seconds (Unit);
               begin
                  --  Ada.Calendar reaches a few centuries; a century is enough.
                  exit when abs Offset > 3_200_000_000;
                  declare
                     Shown_Text : constant String := Render (Offset);
                     Last       : Natural := 0;
                     Shown      : Long_Float := 0.0;
                  begin
                     for I in Shown_Text'Range loop
                        if Shown_Text (I) in '0' .. '9' then
                           Read_Number (Shown_Text, I, Last, Shown);
                           exit;
                        end if;
                     end loop;
                     --  The formatter may say it in another unit ("2 weeks"
                     --  for 14 days): learn the unit it shows, when the offset
                     --  is a whole number of one.
                     if Last = 0 then
                        if Shown_Text /= "" then
                           Learn (Result.Forms, Shown_Text, Long_Float (Offset));
                        end if;
                     else
                        for U in D.Duration_Unit loop
                           if Long_Float (Offset) = Shown * Long_Float (Sign * Unit_Seconds (U)) then
                              Learn (Result.Forms, Shown_Text, Long_Float (Offset));
                              exit;
                           end if;
                        end loop;
                     end if;
                  end;
               end;
            end loop;
         end loop;
      end loop;
      Fit (Result.Forms);
      return Result;
   end Learn_Relative;

   function Learn_Bytes (Context : Humanize.Contexts.Context) return Lexicon is
      package B renames Humanize.Bytes;
      Result : Lexicon;
   begin
      for System in B.Binary .. B.Decimal loop
         declare
            Base : constant B.Byte_Count := (if System = B.Binary then 1_024 else 1_000);
            Unit : B.Byte_Count := 1;
         begin
            --  Up to the peta units, where the samples still fit 64 bits.
            for Power in 0 .. 5 loop
               for N of Samples loop
                  exit when N >= Long_Long_Integer (Base);
                  declare
                     Rendered : constant Humanize.Status.Text_Result :=
                       B.Format (Context, B.Byte_Count (N) * Unit,
                                 (Unit_System => System, Maximum_Fraction_Digits => 1,
                                  Suppress_Trailing_Zero => True));
                  begin
                     if Rendered.Status = Humanize.Status.Ok then
                        Learn (Result.Forms, Plain (Context, To_String (Rendered.Text)),
                               Long_Float (N) * Long_Float (Unit));
                     end if;
                  end;
               end loop;
               exit when Power = 5;
               Unit := Unit * Base;
            end loop;
         end;
      end loop;
      Fit (Result.Forms);
      return Result;
   end Learn_Bytes;

   --  Context's lexicon of Kind, learnt on first use.
   function Learn_Measures (Context : Humanize.Contexts.Context; Family : Measure_Family) return Lexicon;
   function Learn_Dates (Context : Humanize.Contexts.Context) return Lexicon;

   function Learned
     (Context : Humanize.Contexts.Context;
      Kind    : Lexicon_Kind;
      Family  : Measure_Family := Measure_Family'First)
      return Lexicon
   is
      Key   : constant String :=
        Lexicon_Kind'Image (Kind) & "|" & Measure_Family'Image (Family) & "|"
        & Humanize.Contexts.Locale (Context) & "|"
        & System.Address_Image (Humanize.Contexts.Runtime (Context).all'Address)
        & "|" & Natural'Image (Humanize.Catalog_Loads.Count);
      Item  : Lexicon;
      Found : Boolean;
   begin
      Cache.Find (Key, Item, Found);
      if not Found then
         Item :=
           (case Kind is
               when Durations_Kind => Learn_Durations (Context),
               when Relative_Kind  => Learn_Relative (Context),
               when Bytes_Kind     => Learn_Bytes (Context),
               when Measure_Kind   => Learn_Measures (Context, Family),
               when Dates_Kind     => Learn_Dates (Context));
         Cache.Store (Key, Item);
      end if;
      return Item;
   end Learned;

   --  The value of the first form that reads all of Text; Ambiguous when the
   --  locale writes another value that way too.
   function Read_Whole
     (Forms : Form_Vectors.Vector; Text : String; Value : out Long_Float; Ambiguous : out Boolean) return Boolean
   is
   begin
      Value := 0.0;
      Ambiguous := False;
      for F of Forms loop
         if Text'Length > 0 and then Reads (F, Text, Text'First, Text'Last, Value) then
            Ambiguous := F.Ambiguous;
            return True;
         end if;
      end loop;
      return False;
   end Read_Whole;

   function Parse_Duration
     (Context : Humanize.Contexts.Context;
      Text    : String)
      return Duration_Parse_Result
   is
      Words : constant Lexicon := Learned (Context, Durations_Kind);
      Item  : constant String := Trimmed (Plain (Context, Text));
      Value : Long_Float;
   begin
      if Read_Joined (Words.Forms, Words.Joins, Item, Value) then
         return (Status => Humanize.Status.Ok,
                 Value  => Humanize.Durations.Duration_Seconds (Long_Float'Rounding (Value)),
                 Exact  => Long_Float'Rounding (Value) = Value, Consumed => Text'Length, others => <>);
      end if;
      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Duration;

   function Parse_Relative
     (Context : Humanize.Contexts.Context;
      Text    : String)
      return Duration_Parse_Result
   is
      Value     : Long_Float;
      Ambiguous : Boolean;
   begin
      if Read_Whole (Learned (Context, Relative_Kind).Forms, Trimmed (Plain (Context, Text)), Value, Ambiguous) then
         return (Status => Humanize.Status.Ok,
                 Value  => Humanize.Durations.Duration_Seconds (Long_Float'Rounding (Value)),
                 Exact  => Long_Float'Rounding (Value) = Value and then not Ambiguous, Consumed => Text'Length,
                 others => <>);
      end if;
      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Relative;

   function Parse_Bytes
     (Context : Humanize.Contexts.Context;
      Text    : String)
      return Byte_Parse_Result
   is
      Value     : Long_Float;
      Ambiguous : Boolean;
   begin
      if Read_Whole (Learned (Context, Bytes_Kind).Forms, Trimmed (Plain (Context, Text)), Value, Ambiguous) then
         return (Status => Humanize.Status.Ok, Value => Humanize.Bytes.Byte_Count (Long_Float'Rounding (Value)),
                 Exact  => Long_Float'Rounding (Value) = Value and then not Ambiguous, Consumed => Text'Length,
                 others => <>);
      end if;
      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Bytes;

   function Learn_Measures (Context : Humanize.Contexts.Context; Family : Measure_Family) return Lexicon is
      package U renames Humanize.Units;
      Result : Lexicon;

      function Render (Value : Long_Float) return Humanize.Status.Text_Result is
        (case Family is
            when Length      => U.Format_Length (Context, Value),
            when Mass        => U.Format_Mass (Context, Value),
            when Volume      => U.Format_Volume (Context, Value),
            when Area        => U.Format_Area (Context, Value),
            when Speed       => U.Format_Speed (Context, Value),
            when Temperature => U.Format_Temperature (Context, Value),
            when Energy      => U.Format_Energy (Context, Value),
            when Power       => U.Format_Power (Context, Value),
            when Pressure    => U.Format_Pressure (Context, Value),
            when Frequency   => U.Format_Frequency (Context, Value),
            when Data_Rate   => U.Format_Data_Rate (Context, Value),
            when Angle       => U.Format_Angle (Context, Value),
            when Voltage     => U.Format_Voltage (Context, Value),
            when Current     => U.Format_Electric_Current (Context, Value));

      Steps : constant array (1 .. 4) of Long_Float := [1.0, 2.0, 5.0, 7.0];
      Scale : Long_Float := 1.0E-6;
   begin
      --  Values from a millionth to a trillion base units: every scale the
      --  formatter picks, each at a few numbers.
      while Scale <= 1.0E12 loop
         for Step of Steps loop
            declare
               Rendered : constant Humanize.Status.Text_Result := Render (Step * Scale);
            begin
               if Rendered.Status = Humanize.Status.Ok then
                  Learn (Result.Forms, Plain (Context, To_String (Rendered.Text)), Step * Scale);
               end if;
            end;
         end loop;
         Scale := Scale * 10.0;
      end loop;
      Fit (Result.Forms);
      return Result;
   end Learn_Measures;

   --  Date forms: Pattern holds a day, year and two-digit year marker, Unit
   --  the month, Offset the days from the reference for a day word.
   Day_Marker   : constant Character := Character'Val (2);
   Year_Marker  : constant Character := Character'Val (3);
   Short_Marker : constant Character := Character'Val (4);
   Day_Word     : constant Long_Float := -1.0;

   function Learn_Dates (Context : Humanize.Contexts.Context) return Lexicon is
      package DT renames Humanize.Datetimes;
      Result : Lexicon;
      Styles : constant array (1 .. 4) of DT.Calendar_Date_Style :=
        [DT.Calendar_Date_ISO, DT.Calendar_Date_Short, DT.Calendar_Date_Medium, DT.Calendar_Date_Long];

      --  Text with the first From replaced by Marker; Text where it is absent.
      function Mark (Text, From : String; Marker : Character) return String is
         At_Index : constant Natural := Index (To_Unbounded_String (Text), From);
      begin
         return (if At_Index = 0 then Text
                 else Text (Text'First .. At_Index - 1) & Marker & Text (At_Index + From'Length .. Text'Last));
      end Mark;
   begin
      for Style of Styles loop
         --  Seven days of each month, so a style that names the weekday has a
         --  form for each.
         for Month in Ada.Calendar.Month_Number loop
            for Day in 22 .. 28 loop
               declare
                  Rendered : constant Humanize.Status.Text_Result :=
                    DT.Calendar_Date_Label (Context, (Year => 2087, Month => Month, Day => Day, others => 0),
                                            DT.Calendar_Date_Options'(Style => Style, Fiscal_Year_Start_Month => 1));
                  Day_Text : constant String := Ada.Strings.Fixed.Trim (Natural'Image (Day), Ada.Strings.Left);
               begin
                  if Rendered.Status = Humanize.Status.Ok then
                     declare
                        Text  : constant String := Plain (Context, To_String (Rendered.Text));
                        Years : constant String :=
                          (if Index (To_Unbounded_String (Text), "2087") > 0 then Mark (Text, "2087", Year_Marker)
                           else Mark (Text, "87", Short_Marker));
                        Pattern : constant Unbounded_String := To_Unbounded_String (Mark (Years, Day_Text, Day_Marker));
                     begin
                        if not (for some F of Result.Forms => F.Pattern = Pattern) then
                           Result.Forms.Append
                             (Form'(Pattern => Pattern, Counted => False, Unit => Long_Float (Month), others => <>));
                        end if;
                     end;
                  end if;
               end;
            end loop;
         end loop;
      end loop;
      --  Day words around the reference ("gestern", "morgen").
      for Offset in -2 .. 2 loop
         declare
            Reference : constant DT.Civil_Date_Time := (Year => 2087, Month => 6, Day => 15, others => 0);
            Rendered  : constant Humanize.Status.Text_Result :=
              DT.Natural_Day (Context, (Reference with delta Day => 15 + Offset), Reference);
            Text      : constant String :=
              (if Rendered.Status = Humanize.Status.Ok then Plain (Context, To_String (Rendered.Text)) else "");
         begin
            if Text /= "" and then (for all C of Text => C not in '0' .. '9')
              and then not (for some F of Result.Forms => To_String (F.Pattern) = Text)
            then
               Result.Forms.Append
                 (Form'(Pattern => To_Unbounded_String (Text), Counted => False, Unit => Day_Word,
                        Offset => Long_Float (Offset), others => <>));
            end if;
         end;
      end loop;
      return Result;
   end Learn_Dates;

   function Parse_Measure
     (Context : Humanize.Contexts.Context;
      Family  : Measure_Family;
      Text    : String)
      return Float_Parse_Result
   is
      Value     : Long_Float;
      Ambiguous : Boolean;
   begin
      if Read_Whole (Learned (Context, Measure_Kind, Family).Forms, Trimmed (Plain (Context, Text)), Value,
                     Ambiguous)
      then
         return (Status => Humanize.Status.Ok, Value => Value, Exact => not Ambiguous, Consumed => Text'Length,
                 others => <>);
      end if;
      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Measure;

   function Parse_Date
     (Context   : Humanize.Contexts.Context;
      Text      : String;
      Reference : Humanize.Datetimes.Civil_Date_Time)
      return Civil_Date_Parse_Result
   is
      Item : constant String := Trimmed (Plain (Context, Text));

      --  Whether Pattern reads all of Item, with the day and year it holds.
      function Matches (Pattern : String; Day, Year : out Natural) return Boolean is
         P : Natural := Pattern'First;
         T : Natural := Item'First;

         function Digits_At return Natural is
            Stop : Natural := T;
         begin
            while Stop <= Item'Last and then Item (Stop) in '0' .. '9' and then Stop - T < 4 loop
               Stop := Stop + 1;
            end loop;
            return Stop - T;
         end Digits_At;
      begin
         Day := 0;
         Year := 0;
         while P <= Pattern'Last loop
            if Pattern (P) in Day_Marker | Year_Marker | Short_Marker then
               declare
                  Count : constant Natural := Digits_At;
               begin
                  if Count = 0 then
                     return False;
                  end if;
                  if Pattern (P) = Day_Marker then
                     Day := Natural'Value (Item (T .. T + Count - 1));
                  elsif Pattern (P) = Year_Marker then
                     Year := Natural'Value (Item (T .. T + Count - 1));
                  else
                     Year := 2000 + Natural'Value (Item (T .. T + Count - 1));
                  end if;
                  T := T + Count;
               end;
            elsif T > Item'Last or else Item (T) /= Pattern (P) then
               return False;
            else
               T := T + 1;
            end if;
            P := P + 1;
         end loop;
         return T > Item'Last;
      end Matches;
   begin
      for F of Learned (Context, Dates_Kind).Forms loop
         if F.Unit = Day_Word then
            if To_String (F.Pattern) = Item then
               declare
                  use Ada.Calendar;
                  Day : constant Time :=
                    Time_Of (Reference.Year, Reference.Month, Reference.Day, 43_200.0)
                    + Duration (F.Offset * 86_400.0);
               begin
                  return (Status => Humanize.Status.Ok,
                          Value  => (Year => Year (Day), Month => Month (Day), Day => Ada.Calendar.Day (Day),
                                     others => 0),
                          Exact  => True, Consumed => Text'Length);
               end;
            end if;
         else
            declare
               Day, Year : Natural;
            begin
               if Matches (To_String (F.Pattern), Day, Year)
                 and then Day in Ada.Calendar.Day_Number and then Year in Ada.Calendar.Year_Number
               then
                  return (Status => Humanize.Status.Ok,
                          Value  => (Year => Year, Month => Ada.Calendar.Month_Number (F.Unit), Day => Day,
                                     others => 0),
                          Exact  => True, Consumed => Text'Length);
               end if;
            end;
         end if;
      end loop;
      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   exception
      when Constraint_Error | Ada.Calendar.Time_Error =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Date;

end Humanize.Parsing.Localized;
