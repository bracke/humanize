with Ada.Calendar.Formatting;
with Ada.Characters.Handling;
with Ada.Strings.Unbounded;

with Humanize.Datetime_Classification;
with Humanize.I18N_Rendering;
with Humanize.Messages;
with Humanize.Selections;

package body Humanize.Datetimes is

   use type Ada.Calendar.Time;
   use type Humanize.Status.Status_Code;
   use type Humanize.Selections.Argument_Kind;

   procedure Copy_Text
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   function No_Space (Image : String) return String is
     (if Image'Length > 0 and then Image (Image'First) = ' '
      then Image (Image'First + 1 .. Image'Last)
      else Image);

   function B (Hex : String) return String is
      Result : String (1 .. Hex'Length / 2);

      function Nibble (C : Character) return Natural is
      begin
         case C is
            when '0' .. '9' =>
               return Character'Pos (C) - Character'Pos ('0');
            when 'A' .. 'F' =>
               return 10 + Character'Pos (C) - Character'Pos ('A');
            when 'a' .. 'f' =>
               return 10 + Character'Pos (C) - Character'Pos ('a');
            when others =>
               return 0;
         end case;
      end Nibble;
   begin
      for I in Result'Range loop
         Result (I) :=
           Character'Val
             (Nibble (Hex (Hex'First + 2 * (I - Result'First))) * 16
              + Nibble (Hex (Hex'First + 2 * (I - Result'First) + 1)));
      end loop;

      return Result;
   end B;

   function Language (Context : Humanize.Contexts.Context) return String is
      Locale : constant String := Humanize.Contexts.Locale (Context);
      Last   : Natural := Locale'Last;
   begin
      for Index in Locale'Range loop
         if Locale (Index) = '-' or else Locale (Index) = '_' then
            Last := Index - 1;
            exit;
         end if;
      end loop;

      return Ada.Characters.Handling.To_Lower (Locale (Locale'First .. Last));
   end Language;

   type Slavic_Form is (One_Form, Few_Form, Many_Form);
   type Relative_Unit is
     (Rel_Second, Rel_Minute, Rel_Hour, Rel_Day, Rel_Week, Rel_Month,
      Rel_Year);

   function Slavic_Form_For
     (Lang  : String;
      Count : Long_Long_Integer)
      return Slavic_Form
   is
      Mod_10  : constant Long_Long_Integer := Count mod 10;
      Mod_100 : constant Long_Long_Integer := Count mod 100;
   begin
      if Lang = "pl" then
         if Count = 1 then
            return One_Form;
         elsif Mod_10 in 2 .. 4 and then not (Mod_100 in 12 .. 14) then
            return Few_Form;
         else
            return Many_Form;
         end if;
      elsif Lang = "cs" then
         if Count = 1 then
            return One_Form;
         elsif Count in 2 .. 4 then
            return Few_Form;
         else
            return Many_Form;
         end if;
      else
         if Mod_10 = 1 and then Mod_100 /= 11 then
            return One_Form;
         elsif Mod_10 in 2 .. 4 and then not (Mod_100 in 12 .. 14) then
            return Few_Form;
         else
            return Many_Form;
         end if;
      end if;
   end Slavic_Form_For;

   function Slavic_Relative_Name
     (Lang : String;
      Unit : Relative_Unit;
      Form : Slavic_Form)
      return String
   is
   begin
      if Lang = "pl" then
         case Unit is
            when Rel_Second =>
               return (case Form is
                         when One_Form => "sekunda",
                         when Few_Form => "sekundy",
                         when Many_Form => "sekund");
            when Rel_Minute =>
               return (case Form is
                         when One_Form => "minuta",
                         when Few_Form => "minuty",
                         when Many_Form => "minut");
            when Rel_Hour =>
               return (case Form is
                         when One_Form => "godzina",
                         when Few_Form => "godziny",
                         when Many_Form => "godzin");
            when Rel_Day =>
               return (case Form is
                         when One_Form => B ("647A6965C584"),
                         when Few_Form => "dni",
                         when Many_Form => "dni");
            when Rel_Week =>
               return (case Form is
                         when One_Form => B ("7479647A6965C584"),
                         when Few_Form => "tygodnie",
                         when Many_Form => "tygodni");
            when Rel_Month =>
               return (case Form is
                         when One_Form => B ("6D69657369C48563"),
                         when Few_Form => B ("6D69657369C4856365"),
                         when Many_Form => B ("6D69657369C4996379"));
            when Rel_Year =>
               return (case Form is
                         when One_Form => "rok",
                         when Few_Form => "lata",
                         when Many_Form => "lat");
         end case;
      elsif Lang = "cs" then
         case Unit is
            when Rel_Second =>
               return (case Form is
                         when One_Form => "sekunda",
                         when Few_Form => "sekundy",
                         when Many_Form => "sekund");
            when Rel_Minute =>
               return (case Form is
                         when One_Form => "minuta",
                         when Few_Form => "minuty",
                         when Many_Form => "minut");
            when Rel_Hour =>
               return (case Form is
                         when One_Form => "hodina",
                         when Few_Form => "hodiny",
                         when Many_Form => "hodin");
            when Rel_Day =>
               return (case Form is
                         when One_Form => "den",
                         when Few_Form => "dny",
                         when Many_Form => B ("646EC5AF"));
            when Rel_Week =>
               return (case Form is
                         when One_Form => B ("74C3BD64656E"),
                         when Few_Form => B ("74C3BD646E79"),
                         when Many_Form => B ("74C3BD646EC5AF"));
            when Rel_Month =>
               return (case Form is
                         when One_Form => B ("6DC49B73C3AD63"),
                         when Few_Form => B ("6DC49B73C3AD6365"),
                         when Many_Form => B ("6DC49B73C3AD63C5AF"));
            when Rel_Year =>
               return (case Form is
                         when One_Form => "rok",
                         when Few_Form => "roky",
                         when Many_Form => "let");
         end case;
      elsif Lang = "ru" then
         case Unit is
            when Rel_Second =>
               return (case Form is
                         when One_Form => B ("D181D0B5D0BAD183D0BDD0B4D0B0"),
                         when Few_Form => B ("D181D0B5D0BAD183D0BDD0B4D18B"),
                         when Many_Form => B ("D181D0B5D0BAD183D0BDD0B4"));
            when Rel_Minute =>
               return (case Form is
                         when One_Form => B ("D0BCD0B8D0BDD183D182D0B0"),
                         when Few_Form => B ("D0BCD0B8D0BDD183D182D18B"),
                         when Many_Form => B ("D0BCD0B8D0BDD183D182"));
            when Rel_Hour =>
               return (case Form is
                         when One_Form => B ("D187D0B0D181"),
                         when Few_Form => B ("D187D0B0D181D0B0"),
                         when Many_Form => B ("D187D0B0D181D0BED0B2"));
            when Rel_Day =>
               return (case Form is
                         when One_Form => B ("D0B4D0B5D0BDD18C"),
                         when Few_Form => B ("D0B4D0BDD18F"),
                         when Many_Form => B ("D0B4D0BDD0B5D0B9"));
            when Rel_Week =>
               return (case Form is
                         when One_Form => B ("D0BDD0B5D0B4D0B5D0BBD18F"),
                         when Few_Form => B ("D0BDD0B5D0B4D0B5D0BBD0B8"),
                         when Many_Form => B ("D0BDD0B5D0B4D0B5D0BBD18C"));
            when Rel_Month =>
               return (case Form is
                         when One_Form => B ("D0BCD0B5D181D18FD186"),
                         when Few_Form => B ("D0BCD0B5D181D18FD186D0B0"),
                         when Many_Form => B ("D0BCD0B5D181D18FD186D0B5D0B2"));
            when Rel_Year =>
               return (case Form is
                         when One_Form => B ("D0B3D0BED0B4"),
                         when Few_Form => B ("D0B3D0BED0B4D0B0"),
                         when Many_Form => B ("D0BBD0B5D182"));
         end case;
      elsif Lang = "uk" then
         case Unit is
            when Rel_Second =>
               return (case Form is
                         when One_Form => B ("D181D0B5D0BAD183D0BDD0B4D0B0"),
                         when Few_Form => B ("D181D0B5D0BAD183D0BDD0B4D0B8"),
                         when Many_Form => B ("D181D0B5D0BAD183D0BDD0B4"));
            when Rel_Minute =>
               return (case Form is
                         when One_Form => B ("D185D0B2D0B8D0BBD0B8D0BDD0B0"),
                         when Few_Form => B ("D185D0B2D0B8D0BBD0B8D0BDD0B8"),
                         when Many_Form => B ("D185D0B2D0B8D0BBD0B8D0BD"));
            when Rel_Hour =>
               return (case Form is
                         when One_Form => B ("D0B3D0BED0B4D0B8D0BDD0B0"),
                         when Few_Form => B ("D0B3D0BED0B4D0B8D0BDD0B8"),
                         when Many_Form => B ("D0B3D0BED0B4D0B8D0BD"));
            when Rel_Day =>
               return (case Form is
                         when One_Form => B ("D0B4D0B5D0BDD18C"),
                         when Few_Form => B ("D0B4D0BDD196"),
                         when Many_Form => B ("D0B4D0BDD196D0B2"));
            when Rel_Week =>
               return (case Form is
                         when One_Form => B ("D182D0B8D0B6D0B4D0B5D0BDD18C"),
                         when Few_Form => B ("D182D0B8D0B6D0BDD196"),
                         when Many_Form => B ("D182D0B8D0B6D0BDD196D0B2"));
            when Rel_Month =>
               return (case Form is
                         when One_Form => B ("D0BCD196D181D18FD186D18C"),
                         when Few_Form => B ("D0BCD196D181D18FD186D196"),
                         when Many_Form => B ("D0BCD196D181D18FD186D196D0B2"));
            when Rel_Year =>
               return (case Form is
                         when One_Form => B ("D180D196D0BA"),
                         when Few_Form => B ("D180D0BED0BAD0B8"),
                         when Many_Form => B ("D180D0BED0BAD196D0B2"));
         end case;
      else
         return "";
      end if;
   end Slavic_Relative_Name;

   function Slavic_Relative_Result
     (Context   : Humanize.Contexts.Context;
      Selection : Humanize.Selections.Message_Selection)
      return Humanize.Status.Text_Result
   is
      use Humanize.Messages;

      Lang      : constant String := Language (Context);
      Unit      : Relative_Unit := Rel_Second;
      Is_Future : Boolean := False;
   begin
      if not (Lang = "pl" or else Lang = "cs" or else Lang = "ru" or else Lang = "uk") then
         return (Status => Humanize.Status.Runtime_Error, others => <>);
      end if;

      if Selection.Arguments /= Humanize.Selections.Count_Argument then
         return (Status => Humanize.Status.Runtime_Error, others => <>);
      end if;

      case Selection.Key is
         when Datetime_Relative_Second_Past =>
            Unit := Rel_Second;
         when Datetime_Relative_Second_Future =>
            Unit := Rel_Second;
            Is_Future := True;
         when Datetime_Relative_Minute_Past =>
            Unit := Rel_Minute;
         when Datetime_Relative_Minute_Future =>
            Unit := Rel_Minute;
            Is_Future := True;
         when Datetime_Relative_Hour_Past =>
            Unit := Rel_Hour;
         when Datetime_Relative_Hour_Future =>
            Unit := Rel_Hour;
            Is_Future := True;
         when Datetime_Relative_Day_Past =>
            Unit := Rel_Day;
         when Datetime_Relative_Day_Future =>
            Unit := Rel_Day;
            Is_Future := True;
         when Datetime_Relative_Week_Past =>
            Unit := Rel_Week;
         when Datetime_Relative_Week_Future =>
            Unit := Rel_Week;
            Is_Future := True;
         when Datetime_Relative_Month_Past =>
            Unit := Rel_Month;
         when Datetime_Relative_Month_Future =>
            Unit := Rel_Month;
            Is_Future := True;
         when Datetime_Relative_Year_Past =>
            Unit := Rel_Year;
         when Datetime_Relative_Year_Future =>
            Unit := Rel_Year;
            Is_Future := True;
         when others =>
            return (Status => Humanize.Status.Runtime_Error, others => <>);
      end case;

      declare
         Count : constant Long_Long_Integer :=
           Long_Long_Integer (Selection.Count);
         Core : constant String :=
           No_Space (Long_Long_Integer'Image (Count)) & " "
           & Slavic_Relative_Name
               (Lang, Unit, Slavic_Form_For (Lang, Count));
         Text : constant String :=
           (if Is_Future then
              (if Lang = "pl" or else Lang = "cs" then "za " & Core
               elsif Lang = "ru" then B ("D187D0B5D180D0B5D0B720") & Core
               else B ("D187D0B5D180D0B5D0B720") & Core)
            else
              (if Lang = "pl" then Core & " temu"
               elsif Lang = "cs" then Core & B ("207A70C49B74")
               elsif Lang = "ru" then Core & B ("20D0BDD0B0D0B7D0B0D0B4")
               else Core & B ("20D182D0BED0BCD183")));
      begin
         return
           (Status => Humanize.Status.Ok,
            Text   => Ada.Strings.Unbounded.To_Unbounded_String (Text),
            Key    => Humanize.Messages.No_Message);
      end;
   end Slavic_Relative_Result;

   function Future_Relative_Unit
     (Key       : Humanize.Messages.Message_Id;
      Unit      : out Relative_Unit;
      Is_Future : out Boolean)
      return Boolean
   is
      use Humanize.Messages;
   begin
      Is_Future := True;
      case Key is
         when Datetime_Relative_Second_Future =>
            Unit := Rel_Second;
         when Datetime_Relative_Minute_Future =>
            Unit := Rel_Minute;
         when Datetime_Relative_Hour_Future =>
            Unit := Rel_Hour;
         when Datetime_Relative_Day_Future =>
            Unit := Rel_Day;
         when Datetime_Relative_Week_Future =>
            Unit := Rel_Week;
         when Datetime_Relative_Month_Future =>
            Unit := Rel_Month;
         when Datetime_Relative_Year_Future =>
            Unit := Rel_Year;
         when others =>
            Is_Future := False;
            return False;
      end case;
      return True;
   end Future_Relative_Unit;

   function Generated_Future_Relative_Name
     (Lang : String;
      Unit : Relative_Unit)
      return String
   is
   begin
      if Lang = "fi" then
         case Unit is
            when Rel_Second => return "sekunnin";
            when Rel_Minute => return "minuutin";
            when Rel_Hour   => return "tunnin";
            when Rel_Day    => return B ("70C3A46976C3A46E");
            when Rel_Week   => return "viikon";
            when Rel_Month  => return "kuukauden";
            when Rel_Year   => return "vuoden";
         end case;
      elsif Lang = "tr" then
         case Unit is
            when Rel_Second => return "saniye";
            when Rel_Minute => return "dakika";
            when Rel_Hour   => return "saat";
            when Rel_Day    => return B ("67C3BC6E");
            when Rel_Week   => return "hafta";
            when Rel_Month  => return "ay";
            when Rel_Year   => return B ("79C4B16C");
         end case;
      elsif Lang = "ko" then
         case Unit is
            when Rel_Second => return B ("ECB488");
            when Rel_Minute => return B ("EBB684");
            when Rel_Hour   => return B ("EC8B9CEAB084");
            when Rel_Day    => return B ("EC9DBC");
            when Rel_Week   => return B ("ECA3BC");
            when Rel_Month  => return B ("EAB09CEC9B94");
            when Rel_Year   => return B ("EB8584");
         end case;
      elsif Lang = "hi" then
         case Unit is
            when Rel_Second => return B ("E0A4B8E0A587E0A495E0A482E0A4A1");
            when Rel_Minute => return B ("E0A4AEE0A4BFE0A4A8E0A49F");
            when Rel_Hour   => return B ("E0A498E0A482E0A49FE0A587");
            when Rel_Day    => return B ("E0A4A6E0A4BFE0A4A8");
            when Rel_Week   =>
               return B ("E0A4B8E0A4AAE0A58DE0A4A4E0A4BEE0A4B9");
            when Rel_Month  =>
               return B ("E0A4AEE0A4B9E0A580E0A4A8E0A587");
            when Rel_Year   => return B ("E0A4B8E0A4BEE0A4B2");
         end case;
      else
         return "";
      end if;
   end Generated_Future_Relative_Name;

   function Generated_Future_Relative_Result
     (Context   : Humanize.Contexts.Context;
      Selection : Humanize.Selections.Message_Selection)
      return Humanize.Status.Text_Result
   is
      Lang      : constant String := Language (Context);
      Unit      : Relative_Unit := Rel_Second;
      Is_Future : Boolean := False;
   begin
      if not (Lang = "fi" or else Lang = "tr" or else Lang = "ko"
              or else Lang = "hi")
      then
         return (Status => Humanize.Status.Runtime_Error, others => <>);
      end if;

      if Selection.Arguments /= Humanize.Selections.Count_Argument
        or else not Future_Relative_Unit (Selection.Key, Unit, Is_Future)
        or else not Is_Future
      then
         return (Status => Humanize.Status.Runtime_Error, others => <>);
      end if;

      declare
         Count : constant String :=
           No_Space
             (Long_Long_Integer'Image
                (Long_Long_Integer (Selection.Count)));
         Name : constant String := Generated_Future_Relative_Name (Lang, Unit);
         Text : constant String :=
           (if Lang = "fi" then Count & " " & Name & " kuluttua"
            elsif Lang = "tr" then Count & " " & Name & " sonra"
            elsif Lang = "ko" then Count & " " & Name & " " & B ("ED9B84")
            else Count & " " & Name & " " & B ("E0A4ACE0A4BEE0A4A6"));
      begin
         if Name'Length = 0 then
            return (Status => Humanize.Status.Runtime_Error, others => <>);
         end if;

         return
           (Status => Humanize.Status.Ok,
            Text   => Ada.Strings.Unbounded.To_Unbounded_String (Text),
            Key    => Humanize.Messages.No_Message);
      end;
   end Generated_Future_Relative_Result;

   --  Apply the spec's semantic fallback for calendar-day keys: if the special
   --  key is not present in the runtime, substitute the generic relative key.
   function Resolve_Selection
     (Context   : Humanize.Contexts.Context;
      Selection : Humanize.Selections.Message_Selection)
      return Humanize.Selections.Message_Selection
   is
      use Humanize.Messages;
   begin
      case Selection.Key is
         when Datetime_Day_Previous =>
            if not Humanize.I18N_Rendering.Available
                     (Context, Datetime_Day_Previous)
            then
               return Humanize.Selections.Count
                        (Datetime_Relative_Day_Past, 1);
            end if;

         when Datetime_Day_Current =>
            if not Humanize.I18N_Rendering.Available
                     (Context, Datetime_Day_Current)
            then
               return Humanize.Selections.No_Arg (Datetime_Now);
            end if;

         when Datetime_Day_Next =>
            if not Humanize.I18N_Rendering.Available
                     (Context, Datetime_Day_Next)
            then
               return Humanize.Selections.Count
                        (Datetime_Relative_Day_Future, 1);
            end if;

         when others =>
            null;
      end case;

      return Selection;
   end Resolve_Selection;

   function Days_From_Civil
     (Y : Integer;
      M : Integer;
      D : Integer)
      return Long_Long_Integer
   is
      Yr  : constant Integer := (if M <= 2 then Y - 1 else Y);
      Era : constant Integer := (if Yr >= 0 then Yr else Yr - 399) / 400;
      YOE : constant Integer := Yr - Era * 400;
      MP  : constant Integer := (if M > 2 then M - 3 else M + 9);
      DOY : constant Integer := (153 * MP + 2) / 5 + D - 1;
      DOE : constant Integer := YOE * 365 + YOE / 4 - YOE / 100 + DOY;
   begin
      return Long_Long_Integer (Era) * 146097 + Long_Long_Integer (DOE)
        - 719468;
   end Days_From_Civil;

   function Date_Ordinal
     (T : Ada.Calendar.Time)
      return Long_Long_Integer
   is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
   begin
      Ada.Calendar.Split (T, Year, Month, Day, Seconds);
      return Days_From_Civil (Integer (Year), Integer (Month), Integer (Day));
   end Date_Ordinal;

   function ISO_Date (Value : Ada.Calendar.Time) return String is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
      function Trim (Image : String) return String is
        (if Image'Length > 0 and then Image (Image'First) = ' '
         then Image (Image'First + 1 .. Image'Last)
         else Image);
      function Pad2_Local (Value : Natural) return String is
         Raw : constant String := Trim (Natural'Image (Value));
      begin
         if Raw'Length = 1 then
            return "0" & Raw;
         else
            return Raw;
         end if;
      end Pad2_Local;
   begin
      Ada.Calendar.Split (Value, Year, Month, Day, Seconds);
      return Trim (Ada.Calendar.Year_Number'Image (Year)) & "-"
        & Pad2_Local (Natural (Month)) & "-" & Pad2_Local (Natural (Day));
   end ISO_Date;

   function Direct_Text (Text : String) return Humanize.Status.Text_Result is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text   => Ada.Strings.Unbounded.To_Unbounded_String (Text),
         Key    => Humanize.Messages.No_Message);
   end Direct_Text;

   function Calendar_Only_Relative
     (Context   : Humanize.Contexts.Context;
      Value     : Ada.Calendar.Time;
      Reference : Ada.Calendar.Time)
      return Humanize.Status.Text_Result
   is
      Day_Delta : constant Long_Long_Integer :=
        Date_Ordinal (Value) - Date_Ordinal (Reference);
      Selection : Humanize.Selections.Message_Selection :=
        Humanize.Selections.No_Arg (Humanize.Messages.No_Message);
   begin
      if Day_Delta = -1 then
         Selection :=
           Resolve_Selection
             (Context,
              Humanize.Selections.No_Arg
                (Humanize.Messages.Datetime_Day_Previous));
      elsif Day_Delta = 0 then
         Selection :=
           Resolve_Selection
             (Context,
              Humanize.Selections.No_Arg
                (Humanize.Messages.Datetime_Day_Current));
      elsif Day_Delta = 1 then
         Selection :=
           Resolve_Selection
             (Context,
              Humanize.Selections.No_Arg
                (Humanize.Messages.Datetime_Day_Next));
      else
         return Direct_Text (ISO_Date (Value));
      end if;

      return Humanize.I18N_Rendering.Render (Context, Selection);
   end Calendar_Only_Relative;

   function Elapsed_Seconds
     (Value     : Ada.Calendar.Time;
      Reference : Ada.Calendar.Time)
      return Long_Long_Integer
   is
      Abs_Diff : Duration;
      Elapsed  : Long_Long_Integer;
   begin
      if Value >= Reference then
         Abs_Diff := Value - Reference;
      else
         Abs_Diff := Reference - Value;
      end if;
      Elapsed := Long_Long_Integer (Abs_Diff);
      if Duration (Elapsed) > Abs_Diff then
         Elapsed := Elapsed - 1;
      end if;
      return Elapsed;
   end Elapsed_Seconds;

   function Detailed_Relative
     (Context   : Humanize.Contexts.Context;
      Value     : Ada.Calendar.Time;
      Reference : Ada.Calendar.Time;
      Options   : Datetime_Options)
      return Humanize.Status.Text_Result
   is
      Seconds : constant Long_Long_Integer := Elapsed_Seconds (Value, Reference);
      Base    : Humanize.Status.Text_Result;
   begin
      if Seconds <= Long_Long_Integer (Options.Now_Threshold_Seconds) then
         return Humanize.I18N_Rendering.Render
           (Context, Humanize.Selections.No_Arg (Humanize.Messages.Datetime_Now));
      end if;

      Base := Humanize.Durations.Format_Components
        (Context, Humanize.Durations.Duration_Seconds (Seconds),
         Options.Max_Units);
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      elsif Value >= Reference then
         return Direct_Text
           ("in " & Ada.Strings.Unbounded.To_String (Base.Text));
      else
         return Direct_Text
           (Ada.Strings.Unbounded.To_String (Base.Text) & " ago");
      end if;
   end Detailed_Relative;

   function Relative
     (Context   : Humanize.Contexts.Context;
      Value     : Ada.Calendar.Time;
      Reference : Ada.Calendar.Time;
      Options   : Datetime_Options := Default_Datetime_Options)
      return Humanize.Status.Text_Result
   is
      Selection : constant Humanize.Selections.Message_Selection :=
        Resolve_Selection
          (Context,
           Humanize.Datetime_Classification.Classify
             (Value, Reference, Options));
   begin
      if Options.Calendar_Words_Only then
         return Calendar_Only_Relative (Context, Value, Reference);
      elsif Options.Max_Units = 2 then
         return Detailed_Relative (Context, Value, Reference, Options);
      else
         declare
            Slavic : constant Humanize.Status.Text_Result :=
              Slavic_Relative_Result (Context, Selection);
         begin
            if Slavic.Status = Humanize.Status.Ok then
               return Slavic;
            end if;
         end;
         declare
            Generated_Future : constant Humanize.Status.Text_Result :=
              Generated_Future_Relative_Result (Context, Selection);
         begin
            if Generated_Future.Status = Humanize.Status.Ok then
               return Generated_Future;
            end if;
         end;
         return Humanize.I18N_Rendering.Render (Context, Selection);
      end if;
   end Relative;

   procedure Relative_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Ada.Calendar.Time;
      Reference : Ada.Calendar.Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Datetime_Options := Default_Datetime_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Relative (Context, Value, Reference, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Relative_Into;

   function To_Time (Item : Civil_Date_Time) return Ada.Calendar.Time is
   begin
      return Ada.Calendar.Time_Of
               (Year    => Item.Year,
                Month   => Item.Month,
                Day     => Item.Day,
                Seconds => Ada.Calendar.Day_Duration
                             (Item.Hour * 3600 + Item.Minute * 60
                              + Item.Second));
   end To_Time;

   function Is_Valid_Civil (Item : Civil_Date_Time) return Boolean is
      Value : constant Ada.Calendar.Time := To_Time (Item);
      pragma Unreferenced (Value);
   begin
      return True;
   exception
      when others =>
         return False;
   end Is_Valid_Civil;

   function Pad2 (Value : Natural) return String is
      Image : constant String := Natural'Image (Value);
      Raw   : constant String := Image (Image'First + 1 .. Image'Last);
   begin
      if Raw'Length = 1 then
         return "0" & Raw;
      else
         return Raw;
      end if;
   end Pad2;

   function ISO_Date (Item : Civil_Date_Time) return String is
      Year_Image : constant String := Ada.Calendar.Year_Number'Image (Item.Year);
   begin
      return Year_Image (Year_Image'First + 1 .. Year_Image'Last)
        & "-" & Pad2 (Natural (Item.Month))
        & "-" & Pad2 (Natural (Item.Day));
   end ISO_Date;

   function Time_Image (Item : Civil_Date_Time) return String is
   begin
      return Pad2 (Item.Hour) & ":" & Pad2 (Item.Minute);
   end Time_Image;

   function Month_Name
     (Context : Humanize.Contexts.Context;
      Month   : Ada.Calendar.Month_Number)
      return String
   is
      Locale : constant String := Humanize.Contexts.Locale (Context);
   begin
      if Locale'Length >= 2 and then Locale (Locale'First .. Locale'First + 1) = "de" then
         case Month is
            when 1 => return "Jan.";
            when 2 => return "Feb.";
            when 3 => return "Marz";
            when 4 => return "Apr.";
            when 5 => return "Mai";
            when 6 => return "Juni";
            when 7 => return "Juli";
            when 8 => return "Aug.";
            when 9 => return "Sept.";
            when 10 => return "Okt.";
            when 11 => return "Nov.";
            when 12 => return "Dez.";
         end case;
      elsif Locale'Length >= 2 and then Locale (Locale'First .. Locale'First + 1) = "fr" then
         case Month is
            when 1 => return "janv.";
            when 2 => return "fevr.";
            when 3 => return "mars";
            when 4 => return "avr.";
            when 5 => return "mai";
            when 6 => return "juin";
            when 7 => return "juil.";
            when 8 => return "aout";
            when 9 => return "sept.";
            when 10 => return "oct.";
            when 11 => return "nov.";
            when 12 => return "dec.";
         end case;
      else
         case Month is
            when 1 => return "Jan";
            when 2 => return "Feb";
            when 3 => return "Mar";
            when 4 => return "Apr";
            when 5 => return "May";
            when 6 => return "Jun";
            when 7 => return "Jul";
            when 8 => return "Aug";
            when 9 => return "Sep";
            when 10 => return "Oct";
            when 11 => return "Nov";
            when 12 => return "Dec";
         end case;
      end if;
   end Month_Name;

   function Full_Month_Name
     (Context : Humanize.Contexts.Context;
      Month   : Ada.Calendar.Month_Number)
      return String
   is
      Locale : constant String := Humanize.Contexts.Locale (Context);
   begin
      if Locale'Length >= 2 and then Locale (Locale'First .. Locale'First + 1) = "de" then
         case Month is
            when 1 => return "Januar";
            when 2 => return "Februar";
            when 3 => return "Marz";
            when 4 => return "April";
            when 5 => return "Mai";
            when 6 => return "Juni";
            when 7 => return "Juli";
            when 8 => return "August";
            when 9 => return "September";
            when 10 => return "Oktober";
            when 11 => return "November";
            when 12 => return "Dezember";
         end case;
      elsif Locale'Length >= 2 and then Locale (Locale'First .. Locale'First + 1) = "fr" then
         case Month is
            when 1 => return "janvier";
            when 2 => return "fevrier";
            when 3 => return "mars";
            when 4 => return "avril";
            when 5 => return "mai";
            when 6 => return "juin";
            when 7 => return "juillet";
            when 8 => return "aout";
            when 9 => return "septembre";
            when 10 => return "octobre";
            when 11 => return "novembre";
            when 12 => return "decembre";
         end case;
      else
         case Month is
            when 1 => return "January";
            when 2 => return "February";
            when 3 => return "March";
            when 4 => return "April";
            when 5 => return "May";
            when 6 => return "June";
            when 7 => return "July";
            when 8 => return "August";
            when 9 => return "September";
            when 10 => return "October";
            when 11 => return "November";
            when 12 => return "December";
         end case;
      end if;
   end Full_Month_Name;

   function Month_Date
     (Context : Humanize.Contexts.Context;
      Item    : Civil_Date_Time)
      return String
   is
   begin
      return Month_Name (Context, Item.Month) & " "
        & No_Space (Natural'Image (Natural (Item.Day)));
   end Month_Date;

   function Ordinal_Suffix (Value : Natural) return String is
      Last_Two : constant Natural := Value mod 100;
      Last_One : constant Natural := Value mod 10;
   begin
      if Last_Two in 11 .. 13 then
         return "th";
      end if;

      case Last_One is
         when 1 => return "st";
         when 2 => return "nd";
         when 3 => return "rd";
         when others => return "th";
      end case;
   end Ordinal_Suffix;

   function Ordinal_Day (Day : Ada.Calendar.Day_Number) return String is
      Value : constant Natural := Natural (Day);
   begin
      return No_Space (Natural'Image (Value)) & Ordinal_Suffix (Value);
   end Ordinal_Day;

   function Phase_Name (Position : Natural; Total : Natural) return String is
   begin
      if Total = 0 then
         return "early";
      elsif Position * 3 <= Total then
         return "early";
      elsif Position * 3 <= Total * 2 then
         return "mid";
      else
         return "late";
      end if;
   end Phase_Name;

   function Civil_Month_Last_Day
     (Year  : Ada.Calendar.Year_Number;
      Month : Ada.Calendar.Month_Number)
      return Ada.Calendar.Day_Number
   is
   begin
      case Month is
         when 1 | 3 | 5 | 7 | 8 | 10 | 12 =>
            return 31;
         when 4 | 6 | 9 | 11 =>
            return 30;
         when 2 =>
            if (Year mod 400 = 0) or else (Year mod 4 = 0 and then Year mod 100 /= 0) then
               return 29;
            else
               return 28;
            end if;
      end case;
   end Civil_Month_Last_Day;

   function Weekday_Name (Item : Civil_Date_Time) return String is
      Day : constant Ada.Calendar.Formatting.Day_Name :=
        Ada.Calendar.Formatting.Day_Of_Week
          (Ada.Calendar.Time_Of (Item.Year, Item.Month, Item.Day, 0.0));
   begin
      case Day is
         when Ada.Calendar.Formatting.Monday    => return "Mon";
         when Ada.Calendar.Formatting.Tuesday   => return "Tue";
         when Ada.Calendar.Formatting.Wednesday => return "Wed";
         when Ada.Calendar.Formatting.Thursday  => return "Thu";
         when Ada.Calendar.Formatting.Friday    => return "Fri";
         when Ada.Calendar.Formatting.Saturday  => return "Sat";
         when Ada.Calendar.Formatting.Sunday    => return "Sun";
      end case;
   end Weekday_Name;

   function Full_Weekday_Name (Item : Civil_Date_Time) return String is
      Day : constant Ada.Calendar.Formatting.Day_Name :=
        Ada.Calendar.Formatting.Day_Of_Week
          (Ada.Calendar.Time_Of (Item.Year, Item.Month, Item.Day, 0.0));
   begin
      case Day is
         when Ada.Calendar.Formatting.Monday    => return "Monday";
         when Ada.Calendar.Formatting.Tuesday   => return "Tuesday";
         when Ada.Calendar.Formatting.Wednesday => return "Wednesday";
         when Ada.Calendar.Formatting.Thursday  => return "Thursday";
         when Ada.Calendar.Formatting.Friday    => return "Friday";
         when Ada.Calendar.Formatting.Saturday  => return "Saturday";
         when Ada.Calendar.Formatting.Sunday    => return "Sunday";
      end case;
   end Full_Weekday_Name;

   function Date_Label
     (Context : Humanize.Contexts.Context;
      Item    : Civil_Date_Time;
      Options : Range_Options;
      Include_Year : Boolean := True)
      return String
   is
      Base : constant String :=
        (if Options.Use_Month_Names then
            Month_Date (Context, Item)
            & (if Include_Year
               then ", " & No_Space
                 (Ada.Calendar.Year_Number'Image (Item.Year))
               else "")
         elsif Include_Year then
            ISO_Date (Item)
         else
            Pad2 (Natural (Item.Month)) & "-" & Pad2 (Natural (Item.Day)));
   begin
      if Options.Include_Weekday then
         return Weekday_Name (Item) & " " & Base;
      else
         return Base;
      end if;
   end Date_Label;

   function Calendar_Date_Preset_Label
     (Context : Humanize.Contexts.Context;
      Item    : Civil_Date_Time;
      Options : Calendar_Date_Options)
      return String
   is
      Year_Image : constant String :=
        No_Space (Ada.Calendar.Year_Number'Image (Item.Year));
      Day_Image : constant String :=
        No_Space (Natural'Image (Natural (Item.Day)));
      Quarter : constant Natural := (Natural (Item.Month) - 1) / 3 + 1;
      Fiscal_Offset : constant Natural :=
        (Natural (Item.Month) + 12
         - Natural (Options.Fiscal_Year_Start_Month)) mod 12;
      Fiscal_Quarter : constant Natural := Fiscal_Offset / 3 + 1;
      Fiscal_Half : constant Natural := Fiscal_Offset / 6 + 1;
      Fiscal_Year : constant Natural :=
        (if Options.Fiscal_Year_Start_Month = 1 then Natural (Item.Year)
         else Natural (Item.Year)
           + (if Item.Month >= Options.Fiscal_Year_Start_Month then 1 else 0));
      Calendar_Half : constant Natural := (Natural (Item.Month) - 1) / 6 + 1;
      Month_Phase : constant String :=
        Phase_Name
          (Natural (Item.Day),
           Natural (Civil_Month_Last_Day (Item.Year, Item.Month)));
      Quarter_Phase : constant String :=
        Phase_Name (((Natural (Item.Month) - 1) mod 3) + 1, 3);
   begin
      case Options.Style is
         when Calendar_Date_ISO =>
            return ISO_Date (Item);
         when Calendar_Date_Short =>
            return Pad2 (Natural (Item.Month)) & "/"
              & Pad2 (Natural (Item.Day)) & "/" & Year_Image;
         when Calendar_Date_Medium =>
            return Month_Name (Context, Item.Month) & " "
              & Day_Image & ", " & Year_Image;
         when Calendar_Date_Long =>
            return Full_Weekday_Name (Item) & ", "
              & Full_Month_Name (Context, Item.Month) & " "
              & Day_Image & ", " & Year_Image;
         when Calendar_Date_Weekday =>
            return Weekday_Name (Item) & " "
              & Month_Name (Context, Item.Month) & " "
              & Day_Image & ", " & Year_Image;
         when Calendar_Date_Month_Year =>
            return Month_Name (Context, Item.Month) & " " & Year_Image;
         when Calendar_Date_Year_Month =>
            return Year_Image & "-" & Pad2 (Natural (Item.Month));
         when Calendar_Date_Quarter =>
            return "Q" & No_Space (Natural'Image (Quarter)) & " " & Year_Image;
         when Calendar_Date_Fiscal_Quarter =>
            return "FY" & No_Space (Natural'Image (Fiscal_Year))
              & " Q" & No_Space (Natural'Image (Fiscal_Quarter));
         when Calendar_Date_Month_Day_Ordinal =>
            return Month_Name (Context, Item.Month) & " " & Ordinal_Day (Item.Day);
         when Calendar_Date_Weekday_Ordinal =>
            return Full_Weekday_Name (Item) & " the " & Ordinal_Day (Item.Day);
         when Calendar_Date_Fiscal_Year =>
            return "FY" & No_Space (Natural'Image (Fiscal_Year));
         when Calendar_Date_Fiscal_Half =>
            return "FY" & No_Space (Natural'Image (Fiscal_Year))
              & " H" & No_Space (Natural'Image (Fiscal_Half));
         when Calendar_Date_Semester =>
            return "S" & No_Space (Natural'Image (Calendar_Half))
              & " " & Year_Image;
         when Calendar_Date_Half_Year =>
            return "H" & No_Space (Natural'Image (Calendar_Half))
              & " " & Year_Image;
         when Calendar_Date_Month_Phase =>
            return
              (if Month_Phase = "mid" then "mid-" else Month_Phase & " ")
              & Full_Month_Name (Context, Item.Month) & " " & Year_Image;
         when Calendar_Date_Quarter_Phase =>
            return Quarter_Phase & " Q" & No_Space (Natural'Image (Quarter))
              & " " & Year_Image;
         when Calendar_Date_Half_Year_Phrase =>
            return (if Calendar_Half = 1 then "first" else "second")
              & " half of " & Year_Image;
         when Calendar_Date_Fiscal_Year_End =>
            return "end of FY" & No_Space (Natural'Image (Fiscal_Year));
         when Calendar_Date_Compact_Badge =>
            return Month_Name (Context, Item.Month) & " " & Day_Image;
      end case;
   end Calendar_Date_Preset_Label;

   function Time_Image_12 (Item : Civil_Date_Time) return String is
      Hour_12 : constant Natural :=
        (if Item.Hour = 0 then 12
         elsif Item.Hour > 12 then Item.Hour - 12
         else Item.Hour);
      Suffix : constant String := (if Item.Hour < 12 then " AM" else " PM");
   begin
      if Item.Minute = 0 then
         return No_Space (Natural'Image (Hour_12)) & Suffix;
      else
         return No_Space (Natural'Image (Hour_12)) & ":"
           & Pad2 (Item.Minute) & Suffix;
      end if;
   end Time_Image_12;

   function Time_Label
     (Item    : Civil_Date_Time;
      Options : Range_Options)
      return String
   is
   begin
      if Options.Use_12_Hour_Time then
         return Time_Image_12 (Item);
      else
         return Time_Image (Item);
      end if;
   end Time_Label;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text   => Ada.Strings.Unbounded.To_Unbounded_String (Text),
         Key    => Humanize.Messages.No_Message);
   end Ok_Text;

   function Month_Index (Item : Civil_Date_Time) return Integer is
     (Integer (Item.Year) * 12 + Integer (Item.Month));

   function Week_Index (Item : Civil_Date_Time) return Integer is
      Epoch : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (1970, 1, 1, 0.0);
      Date : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (Item.Year, Item.Month, Item.Day, 0.0);
   begin
      return Integer ((Date - Epoch) / 86_400.0) / 7;
   end Week_Index;

   procedure Copy_Text
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Written := 0;
      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
      elsif Text'Length > Target'Length then
         if Target'Length > 0 then
            Target (Target'First .. Target'Last) :=
              Text (Text'First .. Text'First + Target'Length - 1);
         end if;
         Written := Target'Length;
         Status := Humanize.Status.Buffer_Overflow;
      else
         if Text'Length > 0 then
            Target (Target'First .. Target'First + Text'Length - 1) := Text;
         end if;
         Written := Text'Length;
         Status := Humanize.Status.Ok;
      end if;
   end Copy_Text;

   function Relative_Civil
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Options   : Datetime_Options := Default_Datetime_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Relative (Context, To_Time (Value), To_Time (Reference), Options);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Relative_Civil;

   function Natural_Day
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time)
      return Humanize.Status.Text_Result
   is
      Value_Date     : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (Value.Year, Value.Month, Value.Day, 0.0);
      Reference_Date : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of
          (Reference.Year, Reference.Month, Reference.Day, 0.0);
      Days : constant Integer :=
        Integer ((Value_Date - Reference_Date) / 86_400.0);
   begin
      case Days is
         when -1 =>
            return Humanize.I18N_Rendering.Render
              (Context,
               Resolve_Selection
                 (Context,
                  Humanize.Selections.No_Arg
                    (Humanize.Messages.Datetime_Day_Previous)));
         when 0 =>
            return Humanize.I18N_Rendering.Render
              (Context,
               Resolve_Selection
                 (Context,
                  Humanize.Selections.No_Arg
                    (Humanize.Messages.Datetime_Day_Current)));
         when 1 =>
            return Humanize.I18N_Rendering.Render
              (Context,
               Resolve_Selection
                 (Context,
                  Humanize.Selections.No_Arg
                    (Humanize.Messages.Datetime_Day_Next)));
         when others =>
            return
              (Status => Humanize.Status.Ok,
               Text   => Ada.Strings.Unbounded.To_Unbounded_String (ISO_Date (Value)),
               Key    => Humanize.Messages.No_Message);
      end case;
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Natural_Day;

   function Natural_Time_Of_Day
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if Value.Hour < 5 then
         return Ok_Text ("night");
      elsif Value.Hour < 12 then
         return Ok_Text ("morning");
      elsif Value.Hour < 17 then
         return Ok_Text ("afternoon");
      elsif Value.Hour < 21 then
         return Ok_Text ("evening");
      else
         return Ok_Text ("night");
      end if;
   end Natural_Time_Of_Day;

   function Calendar_Relation
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Week_Diff  : constant Integer := Week_Index (Value) - Week_Index (Reference);
      Month_Diff : constant Integer :=
        Month_Index (Value) - Month_Index (Reference);
      Year_Diff  : constant Integer :=
        Integer (Value.Year) - Integer (Reference.Year);
   begin
      if Week_Diff in -1 .. 1 then
         case Week_Diff is
            when -1 => return Ok_Text ("last week");
            when 0  => return Ok_Text ("this week");
            when others => return Ok_Text ("next week");
         end case;
      elsif Month_Diff in -1 .. 1 then
         case Month_Diff is
            when -1 => return Ok_Text ("last month");
            when 0  => return Ok_Text ("this month");
            when others => return Ok_Text ("next month");
         end case;
      elsif Year_Diff in -1 .. 1 then
         case Year_Diff is
            when -1 => return Ok_Text ("last year");
            when 0  => return Ok_Text ("this year");
            when others => return Ok_Text ("next year");
         end case;
      else
         return Ok_Text (ISO_Date (Value));
      end if;
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Calendar_Relation;

   function Date_Range
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Options : Range_Options := Default_Range_Options)
      return Humanize.Status.Text_Result
   is
      Sep : constant String := [1 => Options.Separator];
   begin
      if Options.Use_Month_Names then
         if Options.Elide_Same_Month
           and then First.Year = Last.Year
           and then First.Month = Last.Month
         then
            return Ok_Text
              ((if Options.Include_Weekday then Weekday_Name (First) & " "
                else "")
               & Month_Name (Context, First.Month) & " "
               & No_Space (Natural'Image (Natural (First.Day))) & Sep
               & (if Options.Include_Weekday then Weekday_Name (Last) & " "
                  else "")
               & No_Space (Natural'Image (Natural (Last.Day))));
         elsif Options.Elide_Same_Year and then First.Year = Last.Year then
            return Ok_Text
              (Date_Label (Context, First, Options, False) & Sep
               & Date_Label (Context, Last, Options, False)
               & ", " & No_Space (Ada.Calendar.Year_Number'Image (First.Year)));
         else
            return Ok_Text
              (Date_Label (Context, First, Options, True) & " " & Sep & " "
               & Date_Label (Context, Last, Options, True));
         end if;
      end if;

      if Options.Elide_Same_Month
        and then First.Year = Last.Year
        and then First.Month = Last.Month
      then
         return Ok_Text
           ((if Options.Include_Weekday then Weekday_Name (First) & " " else "")
            & ISO_Date (First) & Sep
            & (if Options.Include_Weekday then Weekday_Name (Last) & " " else "")
            & Pad2 (Natural (Last.Day)));
      elsif Options.Elide_Same_Year and then First.Year = Last.Year then
         return Ok_Text
           (Date_Label (Context, First, Options, True) & Sep
            & Date_Label (Context, Last, Options, False));
      else
         return Ok_Text
           (Date_Label (Context, First, Options, True) & " " & Sep & " "
            & Date_Label (Context, Last, Options, True));
      end if;
   end Date_Range;

   function Time_Range
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Options : Range_Options := Default_Range_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text
        (Time_Label (First, Options) & [1 => Options.Separator]
         & Time_Label (Last, Options));
   end Time_Range;

   function Same_Date (Left, Right : Civil_Date_Time) return Boolean is
     (Left.Year = Right.Year
      and then Left.Month = Right.Month
      and then Left.Day = Right.Day);

   function Date_Time_Range
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Options   : Range_Options := Default_Range_Options)
      return Humanize.Status.Text_Result
   is
      Sep : constant String := [1 => Options.Separator];
      Day_Label : Humanize.Status.Text_Result;
   begin
      if Same_Date (First, Last) then
         if Options.Relative_When_Same_Day then
            Day_Label := Natural_Day (Context, First, Reference);
            if Day_Label.Status /= Humanize.Status.Ok then
               return Day_Label;
            end if;
            return Ok_Text
              (Ada.Strings.Unbounded.To_String (Day_Label.Text) & " "
               & Time_Label (First, Options) & Sep & Time_Label (Last, Options));
         else
            return Ok_Text
              (Date_Label (Context, First, Options, True) & " "
               & Time_Label (First, Options) & Sep & Time_Label (Last, Options));
         end if;
      elsif Options.Elide_Same_Year and then First.Year = Last.Year then
         return Ok_Text
           (Date_Label (Context, First, Options, True) & " "
            & Time_Label (First, Options) & Sep
            & Date_Label (Context, Last, Options, False) & " "
            & Time_Label (Last, Options));
      else
         return Ok_Text
           (Date_Label (Context, First, Options, True) & " "
            & Time_Label (First, Options) & Sep
            & Date_Label (Context, Last, Options, True) & " "
            & Time_Label (Last, Options));
      end if;
   end Date_Time_Range;

   procedure Rule_Weekday_Hours
     (Value      : Civil_Date_Time;
      Rules      : Humanize.Durations.Business_Calendar_Rules;
      Start_Hour : out Natural;
      End_Hour   : out Natural)
   is
      Day : constant Ada.Calendar.Formatting.Day_Name :=
        Ada.Calendar.Formatting.Day_Of_Week
          (Ada.Calendar.Time_Of (Value.Year, Value.Month, Value.Day, 0.0));
      Hours : constant Humanize.Durations.Weekday_Business_Hours :=
        Rules.Options.Weekday_Hours;
   begin
      case Day is
         when Ada.Calendar.Formatting.Monday =>
            Start_Hour := Hours.Monday_Start;
            End_Hour := Hours.Monday_End;
         when Ada.Calendar.Formatting.Tuesday =>
            Start_Hour := Hours.Tuesday_Start;
            End_Hour := Hours.Tuesday_End;
         when Ada.Calendar.Formatting.Wednesday =>
            Start_Hour := Hours.Wednesday_Start;
            End_Hour := Hours.Wednesday_End;
         when Ada.Calendar.Formatting.Thursday =>
            Start_Hour := Hours.Thursday_Start;
            End_Hour := Hours.Thursday_End;
         when Ada.Calendar.Formatting.Friday =>
            Start_Hour := Hours.Friday_Start;
            End_Hour := Hours.Friday_End;
         when Ada.Calendar.Formatting.Saturday =>
            Start_Hour := Hours.Saturday_Start;
            End_Hour := Hours.Saturday_End;
         when Ada.Calendar.Formatting.Sunday =>
            Start_Hour := Hours.Sunday_Start;
            End_Hour := Hours.Sunday_End;
      end case;
   end Rule_Weekday_Hours;

   function Business_Open
     (Value : Civil_Date_Time;
      Rules : Humanize.Durations.Business_Calendar_Rules)
      return Boolean
   is
      Start_Hour : Natural;
      End_Hour   : Natural;
      Date_Time  : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (Value.Year, Value.Month, Value.Day, 0.0);
      In_Break : constant Boolean :=
        Rules.Options.Break_Start_Hour < Rules.Options.Break_End_Hour
        and then Value.Hour >= Rules.Options.Break_Start_Hour
        and then Value.Hour < Rules.Options.Break_End_Hour;
   begin
      if not Humanize.Durations.Is_Business_Day (Date_Time, Rules) then
         return False;
      end if;
      Rule_Weekday_Hours (Value, Rules, Start_Hour, End_Hour);
      for Half of Humanize.Durations.Rule_Half_Days (Rules) loop
         declare
            Half_Date : constant Ada.Calendar.Time := Half.Date;
            Year  : Ada.Calendar.Year_Number;
            Month : Ada.Calendar.Month_Number;
            Day   : Ada.Calendar.Day_Number;
            Secs  : Ada.Calendar.Day_Duration;
         begin
            Ada.Calendar.Split (Half_Date, Year, Month, Day, Secs);
            if Year = Value.Year and then Month = Value.Month and then Day = Value.Day
            then
               End_Hour := Natural'Min (End_Hour, Half.End_Hour);
            end if;
         end;
      end loop;
      return Start_Hour < End_Hour
        and then not In_Break
        and then Value.Hour >= Start_Hour
        and then Value.Hour < End_Hour;
   end Business_Open;

   function Business_Time_Range_Label
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Rules     : Humanize.Durations.Business_Calendar_Rules;
      Options   : Range_Options := Default_Range_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Date_Time_Range (Context, First, Last, Reference, Options);
      Label : constant String :=
        (if Business_Open (First, Rules) and then Business_Open (Last, Rules)
         then "business hours" else "outside business hours");
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;
      return Ok_Text
        (Ada.Strings.Unbounded.To_String (Base.Text) & " (" & Label & ")");
   end Business_Time_Range_Label;

   function Date_Only (Item : Civil_Date_Time) return Civil_Date_Time is
     ((Year => Item.Year, Month => Item.Month, Day => Item.Day, others => 0));

   function Has_Time (Item : Civil_Date_Time) return Boolean is
     (Item.Hour /= 0 or else Item.Minute /= 0 or else Item.Second /= 0);

   function Add_Days
     (Item : Civil_Date_Time;
      Days : Integer)
      return Civil_Date_Time
   is
      Base : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (Item.Year, Item.Month, Item.Day, 0.0);
      Shifted : constant Ada.Calendar.Time := Base + Duration (Days) * 86_400.0;
      Year  : Ada.Calendar.Year_Number;
      Month : Ada.Calendar.Month_Number;
      Day   : Ada.Calendar.Day_Number;
      Secs  : Ada.Calendar.Day_Duration;
   begin
      Ada.Calendar.Split (Shifted, Year, Month, Day, Secs);
      return (Year => Year, Month => Month, Day => Day, others => 0);
   end Add_Days;

   function Day_Diff (First, Last : Civil_Date_Time) return Integer is
      First_Time : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (First.Year, First.Month, First.Day, 0.0);
      Last_Time : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (Last.Year, Last.Month, Last.Day, 0.0);
   begin
      return Integer ((Last_Time - First_Time) / 86_400.0);
   end Day_Diff;

   function Weekday_Number (Item : Civil_Date_Time) return Natural is
      Day : constant Ada.Calendar.Formatting.Day_Name :=
        Ada.Calendar.Formatting.Day_Of_Week
          (Ada.Calendar.Time_Of (Item.Year, Item.Month, Item.Day, 0.0));
   begin
      case Day is
         when Ada.Calendar.Formatting.Monday    => return 0;
         when Ada.Calendar.Formatting.Tuesday   => return 1;
         when Ada.Calendar.Formatting.Wednesday => return 2;
         when Ada.Calendar.Formatting.Thursday  => return 3;
         when Ada.Calendar.Formatting.Friday    => return 4;
         when Ada.Calendar.Formatting.Saturday  => return 5;
         when Ada.Calendar.Formatting.Sunday    => return 6;
      end case;
   end Weekday_Number;

   function Week_Start (Item : Civil_Date_Time) return Civil_Date_Time is
     (Add_Days (Date_Only (Item), -Integer (Weekday_Number (Item))));

   function Weekend_Start (Item : Civil_Date_Time) return Civil_Date_Time is
     (Add_Days (Week_Start (Item), 5));

   function Time_Seconds (Item : Civil_Date_Time) return Natural is
     (Item.Hour * 3_600 + Item.Minute * 60 + Item.Second);

   function Period_Suffix (Item : Civil_Date_Time) return String is
   begin
      if Item.Hour < 5 then
         return "night";
      elsif Item.Hour < 12 then
         return "morning";
      elsif Item.Hour < 17 then
         return "afternoon";
      elsif Item.Hour < 21 then
         return "evening";
      else
         return "night";
      end if;
   end Period_Suffix;

   function Weekend_Relative_Label
     (Value     : Civil_Date_Time;
      Reference : Civil_Date_Time)
      return String
   is
      Value_Start : constant Civil_Date_Time := Weekend_Start (Value);
      Ref_Start   : constant Civil_Date_Time := Weekend_Start (Reference);
      Diff        : constant Integer := Day_Diff (Ref_Start, Value_Start) / 7;
   begin
      if Diff = -1 then
         return "last weekend";
      elsif Diff = 0 then
         return "this weekend";
      elsif Diff = 1 then
         return "next weekend";
      else
         return "";
      end if;
   end Weekend_Relative_Label;

   function Calendar_Relative_Label
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Options   : Calendar_Relative_Options :=
        Default_Calendar_Relative_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      declare
         Days       : constant Integer :=
           Day_Diff (Date_Only (Reference), Date_Only (Value));
         Period     : constant String := Period_Suffix (Value);
         Weekday    : constant Natural := Weekday_Number (Value);
         Is_Weekend : constant Boolean := Weekday >= 5;
         Time_Label : constant String :=
           (if Options.Include_Time_Of_Day then " " & Period else "");
      begin
         if Options.Prefer_Weekend
           and then Is_Weekend
           and then not Has_Time (Value)
         then
            declare
               Weekend : constant String :=
                 Weekend_Relative_Label (Value, Reference);
            begin
               if Weekend'Length > 0 then
                  return Ok_Text (Weekend);
               end if;
            end;
         end if;

         if Days = 0 then
            if Options.Include_Time_Of_Day
              and then Options.Use_Tonight
              and then Value.Hour >= 17
            then
               return Ok_Text ("tonight");
            elsif Options.Include_Time_Of_Day
              and then Options.Use_Later_Today
              and then Time_Seconds (Value) > Time_Seconds (Reference)
            then
               return Ok_Text ("later today");
            elsif Options.Include_Time_Of_Day then
               return Ok_Text ("this " & Period);
            else
               return Ok_Text ("today");
            end if;
         elsif Days = -1 then
            return Ok_Text ("yesterday" & Time_Label);
         elsif Days = 1 then
            return Ok_Text ("tomorrow" & Time_Label);
         elsif abs Days <= Integer (Options.Weekday_Window) then
            if Days < 0 then
               return Ok_Text ("last " & Full_Weekday_Name (Value));
            elsif Days > 0 then
               return Ok_Text ("next " & Full_Weekday_Name (Value));
            end if;
         end if;

         return Ok_Text (ISO_Date (Value));
      end;
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Calendar_Relative_Label;

   function Leap_Year (Year : Ada.Calendar.Year_Number) return Boolean is
      Y : constant Natural := Natural (Year);
   begin
      return (Y mod 4 = 0 and then Y mod 100 /= 0) or else Y mod 400 = 0;
   end Leap_Year;

   function Last_Day_Of_Month
     (Year  : Ada.Calendar.Year_Number;
      Month : Ada.Calendar.Month_Number)
      return Ada.Calendar.Day_Number
   is
   begin
      case Month is
         when 1 | 3 | 5 | 7 | 8 | 10 | 12 => return 31;
         when 4 | 6 | 9 | 11 => return 30;
         when 2 => return (if Leap_Year (Year) then 29 else 28);
      end case;
   end Last_Day_Of_Month;

   function Add_Months_Clamped
     (Item   : Civil_Date_Time;
      Months : Natural)
      return Civil_Date_Time
   is
      Start_Index  : constant Integer :=
        Integer (Item.Year) * 12 + Integer (Item.Month) - 1;
      Target_Index : constant Integer := Start_Index + Integer (Months);
      Target_Year  : constant Ada.Calendar.Year_Number :=
        Ada.Calendar.Year_Number (Target_Index / 12);
      Target_Month : constant Ada.Calendar.Month_Number :=
        Ada.Calendar.Month_Number (Target_Index mod 12 + 1);
      Target_Day   : constant Ada.Calendar.Day_Number :=
        Ada.Calendar.Day_Number'Min
          (Item.Day, Last_Day_Of_Month (Target_Year, Target_Month));
   begin
      return
        (Year => Target_Year, Month => Target_Month, Day => Target_Day,
         others => 0);
   end Add_Months_Clamped;

   function Calendar_Difference_Forward
     (First : Civil_Date_Time;
      Last  : Civil_Date_Time)
      return Calendar_Difference_Result
   is
      Months_Total : Natural :=
        Natural
          ((Integer (Last.Year) - Integer (First.Year)) * 12
           + Integer (Last.Month) - Integer (First.Month));
      Anchor : Civil_Date_Time;
      Years  : Natural;
      Months : Natural;
      Days   : Natural;
   begin
      loop
         Anchor := Add_Months_Clamped (First, Months_Total);
         exit when Day_Diff (Anchor, Last) >= 0;
         Months_Total := Months_Total - 1;
      end loop;

      Years := Months_Total / 12;
      Months := Months_Total mod 12;
      Days := Natural (Day_Diff (Anchor, Last));

      return
        (Years     => Years,
         Months    => Months,
         Days      => Days,
         Direction => Future_Date);
   end Calendar_Difference_Forward;

   function Calendar_Difference
     (First : Civil_Date_Time;
      Last  : Civil_Date_Time)
      return Calendar_Difference_Result
   is
      First_Date : constant Civil_Date_Time := Date_Only (First);
      Last_Date  : constant Civil_Date_Time := Date_Only (Last);
      First_Time : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of
          (First_Date.Year, First_Date.Month, First_Date.Day, 0.0);
      Last_Time  : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of
          (Last_Date.Year, Last_Date.Month, Last_Date.Day, 0.0);
   begin
      if First_Time = Last_Time then
         return (others => <>);
      elsif First_Time < Last_Time then
         return Calendar_Difference_Forward (First_Date, Last_Date);
      else
         declare
            Result : Calendar_Difference_Result :=
              Calendar_Difference_Forward (Last_Date, First_Date);
         begin
            Result.Direction := Past_Date;
            return Result;
         end;
      end if;
   end Calendar_Difference;

   function Calendar_Difference_Unit
     (Value    : Natural;
      Singular : String;
      Plural   : String)
      return String
   is
   begin
      return No_Space (Natural'Image (Value)) & " "
        & (if Value = 1 then Singular else Plural);
   end Calendar_Difference_Unit;

   procedure Append_Difference_Component
     (Text        : in out Ada.Strings.Unbounded.Unbounded_String;
      Count       : in out Natural;
      Value       : Natural;
      Singular    : String;
      Plural      : String;
      Options     : Calendar_Difference_Options)
   is
      use Ada.Strings.Unbounded;
   begin
      if Count >= Natural (Options.Max_Components) then
         return;
      elsif Value = 0 and then not Options.Include_Zero then
         return;
      end if;

      if Length (Text) > 0 then
         Append (Text, ASCII.LF);
      end if;

      Append (Text, Calendar_Difference_Unit (Value, Singular, Plural));
      Count := Count + 1;
   end Append_Difference_Component;

   function Join_Difference_Components (Raw : String) return String is
      Start_Index  : Natural := Raw'First;
      First_Start  : Natural := Raw'First;
      First_End    : Natural := 0;
      Second_Start : Natural := 0;
      Second_End   : Natural := 0;
      Third_Start  : Natural := 0;
      Third_End    : Natural := 0;
      Count        : Natural := 0;

      procedure Add_Part (Part_Start, Part_End : Natural) is
      begin
         Count := Count + 1;
         case Count is
            when 1 =>
               First_Start := Part_Start;
               First_End := Part_End;
            when 2 =>
               Second_Start := Part_Start;
               Second_End := Part_End;
            when others =>
               Third_Start := Part_Start;
               Third_End := Part_End;
         end case;
      end Add_Part;
   begin
      for Index in Raw'Range loop
         if Raw (Index) = ASCII.LF then
            Add_Part (Start_Index, Index - 1);
            Start_Index := Index + 1;
         end if;
      end loop;

      if Raw'Length > 0 then
         Add_Part (Start_Index, Raw'Last);
      end if;

      case Count is
         when 0 =>
            return "";
         when 1 =>
            return Raw (First_Start .. First_End);
         when 2 =>
            return Raw (First_Start .. First_End)
              & " and " & Raw (Second_Start .. Second_End);
         when others =>
            return Raw (First_Start .. First_End)
              & ", " & Raw (Second_Start .. Second_End)
              & " and " & Raw (Third_Start .. Third_End);
      end case;
   end Join_Difference_Components;

   function Calendar_Difference_Label
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Options : Calendar_Difference_Options :=
        Default_Calendar_Difference_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      use Ada.Strings.Unbounded;
      Raw   : Unbounded_String;
      Count : Natural := 0;
   begin
      declare
         Diff : constant Calendar_Difference_Result :=
           Calendar_Difference (First, Last);
      begin
         if Diff.Direction = Same_Date then
            if Options.Include_Zero then
               return Ok_Text ("0 days");
            else
               return Ok_Text ("same day");
            end if;
         end if;

         Append_Difference_Component
           (Raw, Count, Diff.Years, "year", "years", Options);
         Append_Difference_Component
           (Raw, Count, Diff.Months, "month", "months", Options);
         Append_Difference_Component
           (Raw, Count, Diff.Days, "day", "days", Options);

         declare
            Phrase : constant String :=
              (if Length (Raw) = 0 then "0 days"
               else Join_Difference_Components (To_String (Raw)));
         begin
            if Options.Style = Calendar_Difference_Relative then
               case Diff.Direction is
                  when Same_Date =>
                     return Ok_Text ("same day");
                  when Future_Date =>
                     return Ok_Text ("in " & Phrase);
                  when Past_Date =>
                     return Ok_Text (Phrase & " ago");
               end case;
            else
               return Ok_Text (Phrase);
            end if;
         end;
      end;
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Calendar_Difference_Label;

   function Month_End (Item : Civil_Date_Time) return Civil_Date_Time is
     ((Year  => Item.Year,
       Month => Item.Month,
       Day   => Last_Day_Of_Month (Item.Year, Item.Month),
       others => 0));

   function Month_Label
     (Context : Humanize.Contexts.Context;
      Item    : Civil_Date_Time)
      return String
   is
   begin
      return Calendar_Date_Preset_Label
        (Context, Item,
         (Style => Calendar_Date_Month_Year, Fiscal_Year_Start_Month => 1));
   end Month_Label;

   function Quarter_Info
     (Item              : Civil_Date_Time;
      Fiscal_Start      : Ada.Calendar.Month_Number;
      Quarter           : out Natural;
      Quarter_Start     : out Civil_Date_Time;
      Quarter_End       : out Civil_Date_Time;
      Quarter_Year      : out Natural)
      return Boolean
   is
      Offset : constant Natural :=
        (Natural (Item.Month) + 12 - Natural (Fiscal_Start)) mod 12;
      Start_Offset : constant Natural := (Offset / 3) * 3;
      Start_Month_Natural : constant Natural :=
        ((Natural (Fiscal_Start) + Start_Offset - 1) mod 12) + 1;
      End_Month_Natural : constant Natural :=
        ((Start_Month_Natural + 1) mod 12) + 1;
      Start_Year : Ada.Calendar.Year_Number := Item.Year;
      End_Year   : Ada.Calendar.Year_Number := Item.Year;
   begin
      Quarter := Offset / 3 + 1;
      if Start_Month_Natural > Natural (Item.Month) then
         Start_Year := Start_Year - 1;
      end if;
      if End_Month_Natural < Start_Month_Natural then
         End_Year := Start_Year + 1;
      else
         End_Year := Start_Year;
      end if;
      Quarter_Start :=
        (Year => Start_Year,
         Month => Ada.Calendar.Month_Number (Start_Month_Natural),
         Day => 1,
         others => 0);
      Quarter_End :=
        (Year => End_Year,
         Month => Ada.Calendar.Month_Number (End_Month_Natural),
         Day => Last_Day_Of_Month
           (End_Year, Ada.Calendar.Month_Number (End_Month_Natural)),
         others => 0);
      Quarter_Year :=
        Natural (Item.Year) + (if Item.Month >= Fiscal_Start then 1 else 0);
      return True;
   end Quarter_Info;

   function Quarter_Label
     (Item         : Civil_Date_Time;
      Fiscal_Start : Ada.Calendar.Month_Number)
      return String
   is
      Quarter       : Natural;
      Quarter_Start : Civil_Date_Time;
      Quarter_End   : Civil_Date_Time;
      Quarter_Year  : Natural;
      Success       : constant Boolean :=
        Quarter_Info
          (Item, Fiscal_Start, Quarter, Quarter_Start,
           Quarter_End, Quarter_Year);
      pragma Unreferenced (Quarter_Start, Quarter_End, Success);
   begin
      if Fiscal_Start = 1 then
         return "Q" & No_Space (Natural'Image (Quarter)) & " "
           & No_Space (Natural'Image (Natural (Item.Year)));
      else
         return "FY" & No_Space (Natural'Image (Quarter_Year))
           & " Q" & No_Space (Natural'Image (Quarter));
      end if;
   end Quarter_Label;

   function Polished_Date_Range
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Options : Calendar_Range_Options)
      return String
   is
      pragma Unreferenced (Options);
      First_Day : constant String :=
        No_Space (Natural'Image (Natural (First.Day)));
      Last_Day : constant String :=
        No_Space (Natural'Image (Natural (Last.Day)));
      First_Year : constant String :=
        No_Space (Ada.Calendar.Year_Number'Image (First.Year));
      Last_Year : constant String :=
        No_Space (Ada.Calendar.Year_Number'Image (Last.Year));
   begin
      if First.Year = Last.Year and then First.Month = Last.Month then
         return Month_Name (Context, First.Month) & " "
           & First_Day & "-" & Last_Day & ", " & First_Year;
      elsif First.Year = Last.Year then
         return Month_Name (Context, First.Month) & " " & First_Day
           & "-" & Month_Name (Context, Last.Month) & " " & Last_Day
           & ", " & First_Year;
      else
         return Month_Name (Context, First.Month) & " " & First_Day
           & ", " & First_Year & "-" & Month_Name (Context, Last.Month)
           & " " & Last_Day & ", " & Last_Year;
      end if;
   end Polished_Date_Range;

   function Calendar_Range_Label
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Options   : Calendar_Range_Options := Default_Calendar_Range_Options)
      return Humanize.Status.Text_Result
   is
      First_Date  : constant Civil_Date_Time := Date_Only (First);
      Last_Date   : constant Civil_Date_Time := Date_Only (Last);
      Ref_Date    : constant Civil_Date_Time := Date_Only (Reference);
      Ref_Week    : constant Civil_Date_Time := Week_Start (Ref_Date);
      Ref_Weekend : constant Civil_Date_Time := Weekend_Start (Ref_Date);
      Range_Opts  : constant Range_Options :=
        (Elide_Same_Month => True,
         Elide_Same_Year => True,
         Include_Weekday => False,
         Separator => '-',
         Use_Month_Names => Options.Use_Month_Names,
         Use_12_Hour_Time => Options.Use_12_Hour_Time,
         Relative_When_Same_Day => True);
      Quarter       : Natural;
      Q_Start       : Civil_Date_Time;
      Q_End         : Civil_Date_Time;
      Q_Year        : Natural;
   begin
      if Options.Style = Calendar_Range_Time_Today
        or else (Options.Style = Calendar_Range_Auto
                 and then Same_Date (First, Last)
                 and then (Has_Time (First) or else Has_Time (Last)))
      then
         declare
            Day : constant Humanize.Status.Text_Result :=
              Natural_Day (Context, First_Date, Ref_Date);
         begin
            if Day.Status /= Humanize.Status.Ok then
               return Day;
            end if;
            return Ok_Text
              (Time_Label (First, Range_Opts) & "-"
               & Time_Label (Last, Range_Opts) & " "
               & Ada.Strings.Unbounded.To_String (Day.Text));
         end;
      end if;

      if Options.Style = Calendar_Range_Weekend
        or else (Options.Style = Calendar_Range_Auto
                 and then Same_Date (First_Date, Weekend_Start (First_Date))
                 and then Same_Date (Last_Date, Add_Days (First_Date, 1)))
      then
         declare
            Offset : constant Integer := Day_Diff (Ref_Weekend, First_Date) / 7;
         begin
            if Offset = -1 then
               return Ok_Text ("last weekend");
            elsif Offset = 0 then
               return Ok_Text ("this weekend");
            elsif Offset = 1 then
               return Ok_Text ("next weekend");
            else
               return Ok_Text ("weekend of " & Calendar_Date_Preset_Label
                 (Context, First_Date,
                  (Style => Calendar_Date_Medium,
                   Fiscal_Year_Start_Month => 1)));
            end if;
         end;
      end if;

      if Options.Style = Calendar_Range_Week
        or else (Options.Style = Calendar_Range_Auto
                 and then Same_Date (First_Date, Week_Start (First_Date))
                 and then Same_Date (Last_Date, Add_Days (First_Date, 6)))
      then
         declare
            Offset : constant Integer := Day_Diff (Ref_Week, First_Date) / 7;
         begin
            if Offset = -1 then
               return Ok_Text ("last week");
            elsif Offset = 0 then
               return Ok_Text ("this week");
            elsif Offset = 1 then
               return Ok_Text ("next week");
            else
               return Ok_Text ("week of " & Calendar_Date_Preset_Label
                 (Context, First_Date,
                  (Style => Calendar_Date_Medium,
                   Fiscal_Year_Start_Month => 1)));
            end if;
         end;
      end if;

      if Options.Style = Calendar_Range_Month
        or else (Options.Style = Calendar_Range_Auto
                 and then First_Date.Day = 1
                 and then Same_Date (Last_Date, Month_End (First_Date)))
      then
         return Ok_Text (Month_Label (Context, First_Date));
      end if;

      if Options.Style = Calendar_Range_Quarter
        or else Options.Style = Calendar_Range_Auto
      then
         if Quarter_Info
              (First_Date, Options.Fiscal_Year_Start_Month,
               Quarter, Q_Start, Q_End, Q_Year)
           and then Same_Date (First_Date, Q_Start)
           and then Same_Date (Last_Date, Q_End)
         then
            return Ok_Text
              (Quarter_Label (First_Date, Options.Fiscal_Year_Start_Month));
         elsif Options.Style = Calendar_Range_Quarter then
            return Ok_Text
              (Quarter_Label (First_Date, Options.Fiscal_Year_Start_Month));
         end if;
      end if;

      if Options.Style = Calendar_Range_Date_Times then
         return Date_Time_Range (Context, First, Last, Reference, Range_Opts);
      else
         return Ok_Text
           (if Options.Use_Month_Names
            then Polished_Date_Range (Context, First_Date, Last_Date, Options)
            else Ada.Strings.Unbounded.To_String
              (Date_Range (Context, First_Date, Last_Date, Range_Opts).Text));
      end if;
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Calendar_Range_Label;

   procedure Natural_Day_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Natural_Day (Context, Value, Reference);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Natural_Day_Into;

   procedure Natural_Time_Of_Day_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Natural_Time_Of_Day (Context, Value);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Natural_Time_Of_Day_Into;

   procedure Calendar_Relation_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Calendar_Relation (Context, Value, Reference);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Calendar_Relation_Into;

   procedure Date_Range_Into
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Range_Options := Default_Range_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Date_Range (Context, First, Last, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Date_Range_Into;

   procedure Time_Range_Into
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Range_Options := Default_Range_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Time_Range (Context, First, Last, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Time_Range_Into;

   procedure Date_Time_Range_Into
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Range_Options := Default_Range_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Date_Time_Range (Context, First, Last, Reference, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Date_Time_Range_Into;

   procedure Business_Time_Range_Label_Into
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Rules     : Humanize.Durations.Business_Calendar_Rules;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Range_Options := Default_Range_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Business_Time_Range_Label
          (Context, First, Last, Reference, Rules, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Business_Time_Range_Label_Into;

   procedure Calendar_Range_Label_Into
     (Context   : Humanize.Contexts.Context;
      First     : Civil_Date_Time;
      Last      : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Calendar_Range_Options := Default_Calendar_Range_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Calendar_Range_Label (Context, First, Last, Reference, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Calendar_Range_Label_Into;

   procedure Relative_Civil_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Datetime_Options := Default_Datetime_Options)
   is
   begin
      Relative_Into
        (Context, To_Time (Value), To_Time (Reference),
         Target, Written, Status, Options);
   exception
      when others =>
         Written := 0;
         Status := Humanize.Status.Invalid_Value;
   end Relative_Civil_Into;

   function Offset_Label
     (Context        : Humanize.Contexts.Context;
      Offset_Minutes : Integer)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Sign : constant String := (if Offset_Minutes < 0 then "-" else "+");
      Abs_Minutes : constant Natural := Natural (abs Offset_Minutes);
   begin
      if Abs_Minutes > 24 * 60 then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      return Ok_Text
        ("UTC" & Sign & Pad2 (Abs_Minutes / 60) & ":"
         & Pad2 (Abs_Minutes mod 60));
   end Offset_Label;

   function Calendar_Date_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Options : Range_Options := Default_Range_Options)
      return Humanize.Status.Text_Result
   is
   begin
      if not Is_Valid_Civil (Value) then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      return Ok_Text (Date_Label (Context, Value, Options, True));
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Calendar_Date_Label;

   function Calendar_Date_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Options : Calendar_Date_Options)
      return Humanize.Status.Text_Result
   is
   begin
      if not Is_Valid_Civil (Value) then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      return Ok_Text (Calendar_Date_Preset_Label (Context, Value, Options));
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Calendar_Date_Label;

   function Month_Day_Ordinal_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result
   is
   begin
      return Calendar_Date_Label
        (Context, Value,
         Calendar_Date_Options'
           (Style => Calendar_Date_Month_Day_Ordinal,
            Fiscal_Year_Start_Month => 1));
   end Month_Day_Ordinal_Label;

   function Weekday_Ordinal_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result
   is
   begin
      return Calendar_Date_Label
        (Context, Value,
         Calendar_Date_Options'
           (Style => Calendar_Date_Weekday_Ordinal,
            Fiscal_Year_Start_Month => 1));
   end Weekday_Ordinal_Label;

   function Fiscal_Year_Label
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
      return Humanize.Status.Text_Result
   is
   begin
      return Calendar_Date_Label
        (Context, Value,
         Calendar_Date_Options'
           (Style => Calendar_Date_Fiscal_Year,
            Fiscal_Year_Start_Month => Fiscal_Year_Start_Month));
   end Fiscal_Year_Label;

   function Fiscal_Half_Label
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
      return Humanize.Status.Text_Result
   is
   begin
      return Calendar_Date_Label
        (Context, Value,
         Calendar_Date_Options'
           (Style => Calendar_Date_Fiscal_Half,
            Fiscal_Year_Start_Month => Fiscal_Year_Start_Month));
   end Fiscal_Half_Label;

   function Semester_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result
   is
   begin
      return Calendar_Date_Label
        (Context, Value,
         Calendar_Date_Options'
           (Style => Calendar_Date_Semester,
            Fiscal_Year_Start_Month => 1));
   end Semester_Label;

   function Half_Year_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result
   is
   begin
      return Calendar_Date_Label
        (Context, Value,
         Calendar_Date_Options'
           (Style => Calendar_Date_Half_Year,
            Fiscal_Year_Start_Month => 1));
   end Half_Year_Label;

   function Calendar_Badge_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result
   is
   begin
      return Calendar_Date_Label
        (Context, Value,
         Calendar_Date_Options'
           (Style => Calendar_Date_Compact_Badge,
          Fiscal_Year_Start_Month => 1));
   end Calendar_Badge_Label;

   function Month_Phase_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result
   is
   begin
      return Calendar_Date_Label
        (Context, Value,
         Calendar_Date_Options'
           (Style => Calendar_Date_Month_Phase,
            Fiscal_Year_Start_Month => 1));
   end Month_Phase_Label;

   function Quarter_Phase_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result
   is
   begin
      return Calendar_Date_Label
        (Context, Value,
         Calendar_Date_Options'
           (Style => Calendar_Date_Quarter_Phase,
            Fiscal_Year_Start_Month => 1));
   end Quarter_Phase_Label;

   function Half_Year_Phrase_Label
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time)
      return Humanize.Status.Text_Result
   is
   begin
      return Calendar_Date_Label
        (Context, Value,
         Calendar_Date_Options'
           (Style => Calendar_Date_Half_Year_Phrase,
            Fiscal_Year_Start_Month => 1));
   end Half_Year_Phrase_Label;

   function Fiscal_Year_End_Label
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
      return Humanize.Status.Text_Result
   is
   begin
      return Calendar_Date_Label
        (Context, Value,
         Calendar_Date_Options'
           (Style => Calendar_Date_Fiscal_Year_End,
            Fiscal_Year_Start_Month => Fiscal_Year_Start_Month));
   end Fiscal_Year_End_Label;

   function Due_Status
     (Context   : Humanize.Contexts.Context;
      Due       : Civil_Date_Time;
      Reference : Civil_Date_Time)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Due_Time : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (Due.Year, Due.Month, Due.Day, 0.0);
      Ref_Time : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (Reference.Year, Reference.Month, Reference.Day, 0.0);
      Days : constant Integer := Integer ((Due_Time - Ref_Time) / 86_400.0);
   begin
      if Days < 0 then
         return Ok_Text
           ("overdue by " & No_Space (Integer'Image (-Days))
            & (if Days = -1 then " day" else " days"));
      elsif Days = 0 then
         return Ok_Text ("due today");
      elsif Days = 1 then
         return Ok_Text ("due tomorrow");
      else
         return Ok_Text
           ("due in " & No_Space (Integer'Image (Days)) & " days");
      end if;
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Due_Status;

   procedure Offset_Label_Into
     (Context        : Humanize.Contexts.Context;
      Offset_Minutes : Integer;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Offset_Label (Context, Offset_Minutes);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Offset_Label_Into;

   procedure Calendar_Date_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Range_Options := Default_Range_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Calendar_Date_Label (Context, Value, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
           Target, Written, Status);
      end if;
   end Calendar_Date_Label_Into;

   procedure Calendar_Date_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Calendar_Date_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Calendar_Date_Label (Context, Value, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Calendar_Date_Label_Into;

   procedure Month_Day_Ordinal_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Month_Day_Ordinal_Label (Context, Value);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Month_Day_Ordinal_Label_Into;

   procedure Weekday_Ordinal_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Weekday_Ordinal_Label (Context, Value);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Weekday_Ordinal_Label_Into;

   procedure Fiscal_Year_Label_Into
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Target                  : in out String;
      Written                 : out Natural;
      Status                  : out Humanize.Status.Status_Code;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
   is
      Result : constant Humanize.Status.Text_Result :=
        Fiscal_Year_Label (Context, Value, Fiscal_Year_Start_Month);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Fiscal_Year_Label_Into;

   procedure Fiscal_Half_Label_Into
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Target                  : in out String;
      Written                 : out Natural;
      Status                  : out Humanize.Status.Status_Code;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
   is
      Result : constant Humanize.Status.Text_Result :=
        Fiscal_Half_Label (Context, Value, Fiscal_Year_Start_Month);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Fiscal_Half_Label_Into;

   procedure Semester_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Semester_Label (Context, Value);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Semester_Label_Into;

   procedure Half_Year_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Half_Year_Label (Context, Value);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Half_Year_Label_Into;

   procedure Calendar_Badge_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Calendar_Badge_Label (Context, Value);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Calendar_Badge_Label_Into;

   procedure Month_Phase_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Month_Phase_Label (Context, Value);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Month_Phase_Label_Into;

   procedure Quarter_Phase_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Quarter_Phase_Label (Context, Value);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Quarter_Phase_Label_Into;

   procedure Half_Year_Phrase_Label_Into
     (Context : Humanize.Contexts.Context;
      Value   : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Half_Year_Phrase_Label (Context, Value);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Half_Year_Phrase_Label_Into;

   procedure Fiscal_Year_End_Label_Into
     (Context                 : Humanize.Contexts.Context;
      Value                   : Civil_Date_Time;
      Target                  : in out String;
      Written                 : out Natural;
      Status                  : out Humanize.Status.Status_Code;
      Fiscal_Year_Start_Month : Ada.Calendar.Month_Number := 1)
   is
      Result : constant Humanize.Status.Text_Result :=
        Fiscal_Year_End_Label (Context, Value, Fiscal_Year_Start_Month);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Fiscal_Year_End_Label_Into;

   procedure Due_Status_Into
     (Context   : Humanize.Contexts.Context;
      Due       : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Due_Status (Context, Due, Reference);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Due_Status_Into;

   procedure Calendar_Difference_Label_Into
     (Context : Humanize.Contexts.Context;
      First   : Civil_Date_Time;
      Last    : Civil_Date_Time;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Calendar_Difference_Options :=
        Default_Calendar_Difference_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Calendar_Difference_Label (Context, First, Last, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Calendar_Difference_Label_Into;

   procedure Calendar_Relative_Label_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Calendar_Relative_Options :=
        Default_Calendar_Relative_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Calendar_Relative_Label (Context, Value, Reference, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text
           (Ada.Strings.Unbounded.To_String (Result.Text),
            Target, Written, Status);
      end if;
   end Calendar_Relative_Label_Into;

end Humanize.Datetimes;
