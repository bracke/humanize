with Ada.Calendar;
with Ada.Containers.Vectors;

with Humanize.I18N_Rendering;
with Humanize.Message_Keys;
with Humanize.Selections;

separate (Humanize.Parsing.Localized)
function Parse_Clock_Label
  (Context   : Humanize.Contexts.Context;
   Text      : String;
   Reference : Humanize.Datetimes.Civil_Date_Time)
   return Civil_Date_Parse_Result
is
   package DT renames Humanize.Datetimes;

   Hour_Marker   : constant Character := Character'Val (5);
   Minute_Marker : constant Character := Character'Val (6);

   --  A time form: the locale's clock time with the hour and minute as
   --  markers, the hour it shows and the hour of the day that means.
   type Time_Form is record
      Pattern : Unbounded_String;
      Shown   : Natural := 0;
      Hour    : Natural := 0;
   end record;
   package Time_Vectors is new Ada.Containers.Vectors (Positive, Time_Form);

   function Pad2 (N : Natural) return String is
     ((if N < 10 then "0" else "") & Ada.Strings.Fixed.Trim (Natural'Image (N), Ada.Strings.Left));

   function Rendered (Selection : Humanize.Selections.Message_Selection) return String is
      Result : constant Humanize.Status.Text_Result := Humanize.I18N_Rendering.Render (Context, Selection);
   begin
      return (if Result.Status = Humanize.Status.Ok then Plain (Context, To_String (Result.Text)) else "");
   end Rendered;

   function ISO (Day : DT.Civil_Date_Time) return String is
     (Ada.Strings.Fixed.Trim (Natural'Image (Natural (Day.Year)), Ada.Strings.Left) & "-"
      & Pad2 (Natural (Day.Month)) & "-" & Pad2 (Natural (Day.Day)));

   --  Reference moved by Days, at noon so no zone shifts the date.
   function Shifted (Days : Integer) return DT.Civil_Date_Time is
      use Ada.Calendar;
      Moved : constant Time :=
        Time_Of (Reference.Year, Reference.Month, Reference.Day, 43_200.0) + Duration (Days) * 86_400.0;
   begin
      return (Year => Year (Moved), Month => Month (Moved), Day => Ada.Calendar.Day (Moved), others => 0);
   end Shifted;

   --  Text with the first From marked; Text where it is absent.
   function Mark (Item, From : String; Marker : Character) return String is
      At_Index : constant Natural := Ada.Strings.Fixed.Index (Item, From);
   begin
      return (if At_Index = 0 then Item
              else Item (Item'First .. At_Index - 1) & Marker & Item (At_Index + From'Length .. Item'Last));
   end Mark;

   Times : Time_Vectors.Vector;

   --  A day word the locale writes for two days (Hindi "कल" is yesterday and
   --  tomorrow): the reading is not exact.
   Ambiguous : Boolean := False;

   --  Whether Pattern reads all of Item, with the hour and minute shown.
   function Matches (Pattern, Item : String; Hour, Minute : out Natural) return Boolean is
      P : Natural := Pattern'First;
      T : Natural := Item'First;
   begin
      Hour := 0;
      Minute := 0;
      while P <= Pattern'Last loop
         if Pattern (P) in Hour_Marker | Minute_Marker then
            declare
               Stop : Natural := T;
            begin
               while Stop <= Item'Last and then Item (Stop) in '0' .. '9' and then Stop - T < 2 loop
                  Stop := Stop + 1;
               end loop;
               if Stop = T then
                  return False;
               end if;
               if Pattern (P) = Hour_Marker then
                  Hour := Natural'Value (Item (T .. Stop - 1));
               else
                  Minute := Natural'Value (Item (T .. Stop - 1));
               end if;
               T := Stop;
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

   --  Item as a clock time: the hour of the day and the minute.
   function Read_Time (Item : String; Hour, Minute : out Natural) return Boolean is
      Shown : Natural;
   begin
      for F of Times loop
         if Matches (To_String (F.Pattern), Item, Shown, Minute) and then Shown = F.Shown and then Minute < 60 then
            Hour := F.Hour;
            return True;
         end if;
      end loop;
      Hour := 0;
      Minute := 0;
      return False;
   end Read_Time;

   --  Item as a day: a day word, a weekday within a week (the past one), or
   --  a date.
   function Read_Day (Item : String; Day : out DT.Civil_Date_Time) return Boolean is
   begin
      for Offset in -1 .. 1 loop
         declare
            Word : constant Humanize.Status.Text_Result := DT.Natural_Day (Context, Shifted (Offset), Reference);
         begin
            if Word.Status = Humanize.Status.Ok and then Plain (Context, To_String (Word.Text)) = Item then
               Day := Shifted (Offset);
               for Other in Offset + 1 .. 1 loop
                  declare
                     Again : constant Humanize.Status.Text_Result :=
                       DT.Natural_Day (Context, Shifted (Other), Reference);
                  begin
                     Ambiguous := Ambiguous
                       or else (Again.Status = Humanize.Status.Ok
                                and then Plain (Context, To_String (Again.Text)) = Item);
                  end;
               end loop;
               return True;
            end if;
         end;
      end loop;
      for Offset in reverse -6 .. 6 loop
         if abs Offset > 1
           and then Rendered (Humanize.Selections.Text_Value
                                (Humanize.Message_Keys.Datetime_Clock_Weekday, ISO (Shifted (-abs Offset))))
                    = Item
         then
            Day := Shifted (-abs Offset);
            return True;
         end if;
      end loop;
      declare
         As_Date : constant Civil_Date_Parse_Result := Parse_Date (Context, Item, Reference);
      begin
         Day := As_Date.Value;
         return As_Date.Status = Humanize.Status.Ok;
      end;
   end Read_Day;

   Item : constant String := Trimmed (Plain (Context, Text));
begin
   --  Every hour at :47, so the minute and the hour mark apart.
   for Hour in 0 .. 23 loop
      declare
         Shown_Text : constant String :=
           Rendered (Humanize.Selections.Text_Value
                       (Humanize.Message_Keys.Datetime_Clock_Time, Pad2 (Hour) & ":47:00"));
         Minute_Marked : constant String := Mark (Shown_Text, "47", Minute_Marker);
      begin
         for Shown in reverse 0 .. 23 loop
            declare
               Image : constant String := Ada.Strings.Fixed.Trim (Natural'Image (Shown), Ada.Strings.Left);
               Padded : constant String := Pad2 (Shown);
            begin
               if Ada.Strings.Fixed.Index (Minute_Marked, Padded) > 0 then
                  Times.Append
                    (Time_Form'(To_Unbounded_String (Mark (Minute_Marked, Padded, Hour_Marker)), Shown, Hour));
                  exit;
               elsif Ada.Strings.Fixed.Index (Minute_Marked, Image) > 0 then
                  Times.Append
                    (Time_Form'(To_Unbounded_String (Mark (Minute_Marked, Image, Hour_Marker)), Shown, Hour));
                  exit;
               end if;
            end;
         end loop;
      end;
   end loop;
   --  The label is "<day> <time>"; try each space as the boundary.
   for Split in Item'Range loop
      if Item (Split) = ' ' then
         declare
            Day          : DT.Civil_Date_Time;
            Hour, Minute : Natural;
         begin
            if Read_Time (Item (Split + 1 .. Item'Last), Hour, Minute)
              and then Read_Day (Item (Item'First .. Split - 1), Day)
            then
               return (Status   => Humanize.Status.Ok,
                       Value    => (Day with delta Hour => Hour, Minute => Minute),
                       Exact    => not Ambiguous,
                       Consumed => Text'Length);
            end if;
         end;
      end if;
   end loop;
   return (Status => Humanize.Status.Invalid_Argument, others => <>);
exception
   when Constraint_Error | Ada.Calendar.Time_Error =>
      return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Clock_Label;
