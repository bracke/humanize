with Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Durations.Schedule_Data;
with Humanize.Locales;
with Humanize.Messages;

package body Humanize.Durations.Schedules is

   use Ada.Strings.Unbounded;

   function No_Space (Image : String) return String
      renames Humanize.Bounded_Text.No_Space;

   function U (Code : Natural) return String
      renames Humanize.Bounded_Text.UTF8_Code_Point;

   function Lower (Text : String) return String
      renames Humanize.Bounded_Text.Lower_Text;

   function Locale_Prefix (Context : Humanize.Contexts.Context) return String is
     (Humanize.Locales.Locale_Prefix (Humanize.Contexts.Locale (Context)));

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Two_Digits (Value : Natural) return String is
      Tens : constant Natural := (Value / 10) mod 10;
      Ones : constant Natural := Value mod 10;
   begin
      return
        String'
          (1 => Character'Val (Character'Pos ('0') + Tens),
           2 => Character'Val (Character'Pos ('0') + Ones));
   end Two_Digits;

   function Recurrence
     (Context : Humanize.Contexts.Context;
      Every   : Positive;
      Unit    : Recurrence_Unit)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Unit_Text : constant String :=
        (case Unit is
            when Every_Second => "second",
            when Every_Minute => "minute",
            when Every_Hour => "hour",
            when Every_Day => "day",
            when Every_Week => "week",
            when Every_Month => "month",
            when Every_Quarter => "quarter",
            when Every_Year => "year");
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           ("every " & No_Space (Positive'Image (Every)) & " "
            & Unit_Text & (if Every = 1 then "" else "s")),
         Key => Humanize.Messages.No_Message);
   end Recurrence;

   function Is_Norwegian (Locale : String) return Boolean
      renames Humanize.Durations.Schedule_Data.Is_Norwegian;

   function Weekday_Name
     (Locale  : String;
      Weekday : Natural)
      return String
      renames Humanize.Durations.Schedule_Data.Weekday_Name;

   function Ordinal_Name
     (Locale  : String;
      Ordinal : Integer)
      return String
      renames Humanize.Durations.Schedule_Data.Ordinal_Name;

   function Time_Label
     (Hour        : Natural;
      Minute      : Natural;
      Use_12_Hour : Boolean)
      return String
      renames Humanize.Durations.Schedule_Data.Time_Label;

   function Every_Phrase
     (Locale : String;
      Label  : String)
      return String
      renames Humanize.Durations.Schedule_Data.Every_Phrase;

   function Schedule_Conjunction (Locale : String) return String
      renames Humanize.Durations.Schedule_Data.Schedule_Conjunction;

   function Business_Day_Label (Locale : String) return String
      renames Humanize.Durations.Schedule_Data.Business_Day_Label;

   function Schedule_Unit_Name
     (Locale : String;
      Unit   : Recurrence_Unit;
      Count  : Positive)
      return String
      renames Humanize.Durations.Schedule_Data.Schedule_Unit_Name;

   function Weekday_Set_Label
     (Locale : String;
      Set    : Weekday_Set)
      return String
   is
      Count : Natural := 0;
      Last  : Natural := 0;
      Text  : Unbounded_String;
   begin
      if Set = Weekdays then
         if Locale = "en" then
            return "weekday";
         else
            return Business_Day_Label (Locale);
         end if;
      elsif Set = Weekends then
         if Locale = "da" or else Locale = "de" or else Locale = "nl" then
            return "weekend";
         elsif Locale = "fr" then
            return "week-end";
         elsif Locale = "es" then
            return "fin de semana";
         elsif Locale = "it" then
            return "fine settimana";
         elsif Locale = "pt" then
            return "fim de semana";
         elsif Locale = "sv" then
            return "helg";
         elsif Is_Norwegian (Locale) then
            return "helg";
         elsif Locale = "fi" then
            return "viikonloppu";
         elsif Locale = "tr" then
            return "hafta sonu";
         else
            return "weekend";
         end if;
      elsif Set = Every_Day_Set then
         if Locale = "da" then
            return "dag";
         elsif Locale = "de" then
            return "Tag";
         elsif Locale = "fr" then
            return "jour";
         elsif Locale = "es" then
            return "d" & U (16#ED#) & "a";
         elsif Locale = "it" then
            return "giorno";
         elsif Locale = "pt" then
            return "dia";
         elsif Locale = "nl" then
            return "dag";
         elsif Locale = "sv" then
            return "dag";
         elsif Is_Norwegian (Locale) then
            return "dag";
         elsif Locale = "fi" then
            return "p" & U (16#E4#) & "iv" & U (16#E4#);
         elsif Locale = "tr" then
            return "g" & U (16#FC#) & "n";
         else
            return "day";
         end if;
      end if;

      for Day in Set'Range loop
         if Set (Day) then
            Count := Count + 1;
            Last := Day;
         end if;
      end loop;

      if Count = 0 then
         return "";
      elsif Count = 1 then
         return Weekday_Name (Locale, Last);
      end if;

      for Day in Set'Range loop
         if Set (Day) then
            if Length (Text) > 0 then
               if Count = 1 then
                  Append (Text, " " & Schedule_Conjunction (Locale) & " ");
               else
                  Append (Text, ", ");
               end if;
            end if;
            Append (Text, Weekday_Name (Locale, Day));
            Count := Count - 1;
         end if;
      end loop;

      return To_String (Text);
   end Weekday_Set_Label;

   function With_Time (Base : String; Options : Schedule_Options) return String is
   begin
      if Options.Has_Time then
         return Base & " at "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      else
         return Base;
      end if;
   end With_Time;

   function With_Time
     (Locale  : String;
      Base    : String;
      Options : Schedule_Options)
      return String
   is
   begin
      if not Options.Has_Time then
         return Base;
      elsif Locale = "da" then
         return Base & " kl. "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "de" then
         return Base & " um "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "fr" then
         return Base & " " & U (16#E0#) & " "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "es" then
         return Base & " a las "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "it" then
         return Base & " alle "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "pt" then
         return Base & " " & U (16#E0#) & "s "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "nl" then
         return Base & " om "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "sv" or else Is_Norwegian (Locale) then
         return Base & " kl. "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "fi" then
         return Base & " klo "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "pl" or else Locale = "cs" then
         return Base & " o "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "tr" then
         return Base & " saat "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "ro" then
         return Base & " la "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "lt" then
         return Base & " "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "sl" then
         return Base & " ob "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "id" or else Locale = "ms" then
         return Base & " pukul "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "eo" then
         return Base & " je "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "vi" then
         return Base & " luc "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "sw" then
         return Base & " saa "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "af" then
         return Base & " om "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "hu" then
         return Base & " ekkor: "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "sk" then
         return Base & " o "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "ru" then
         return Base & " " & U (16#432#) & " "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "uk" then
         return Base & " " & U (16#43E#) & " "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "ja" or else Locale = "zh" then
         return Base & " "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "ko" then
         return Base & " "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "ar" then
         return Base & " " & U (16#639#) & U (16#646#) & U (16#62F#) & " "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      elsif Locale = "hi" then
         return Base & " "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      else
         return Base & " at "
           & Time_Label (Options.Hour, Options.Minute, Options.Use_12_Hour);
      end if;
   end With_Time;

   function Schedule_Interval_Label
     (Locale : String;
      Every  : Positive;
      Unit   : Recurrence_Unit)
      return String
   is
      Unit_Text : constant String := Schedule_Unit_Name (Locale, Unit, Every);
   begin
      if Locale = "da" then
         return
           (if Every = 1 then "hver " & Unit_Text
            else "hver " & No_Space (Positive'Image (Every)) & ". "
              & Unit_Text);
      elsif Locale = "de" then
         return
           (if Every = 1 then "jeden " & Unit_Text
            else "alle " & No_Space (Positive'Image (Every)) & " "
              & Unit_Text & "n");
      elsif Locale = "fr" then
         return
           (if Every = 1 then "chaque " & Unit_Text
            else "toutes les " & No_Space (Positive'Image (Every)) & " "
              & Unit_Text & "s");
      elsif Locale = "en" then
         if Every = 1 then
            return "every " & Unit_Text;
         else
            return "every " & No_Space (Positive'Image (Every)) & " "
              & Unit_Text & "s";
         end if;
      elsif Every = 1 then
         return Every_Phrase (Locale, Unit_Text);
      else
         return Every_Phrase
           (Locale, No_Space (Positive'Image (Every)) & " " & Unit_Text);
      end if;
   end Schedule_Interval_Label;

   function Weekly_On_Label
     (Locale : String;
      Every  : Positive;
      Label  : String)
      return String
   is
      Count : constant String := No_Space (Positive'Image (Every));
   begin
      if Every = 1 then
         return Every_Phrase (Locale, Label);
      elsif Locale = "da" then
         return "hver " & Count & ". uge pa " & Label;
      elsif Locale = "de" then
         return "alle " & Count & " Wochen an " & Label;
      elsif Locale = "fr" then
         return "toutes les " & Count & " semaines le " & Label;
      elsif Locale = "es" then
         return "cada " & Count & " semanas el " & Label;
      elsif Locale = "it" then
         return "ogni " & Count & " settimane il " & Label;
      elsif Locale = "pt" then
         return "a cada " & Count & " semanas em " & Label;
      elsif Locale = "nl" then
         return "elke " & Count & " weken op " & Label;
      elsif Locale = "en" then
         return "every " & Count & " weeks on " & Label;
      else
         return "every " & Count & " weeks on " & Label;
      end if;
   end Weekly_On_Label;

   function Valid_Schedule_Time
     (Has_Time : Boolean;
      Hour     : Natural;
      Minute   : Natural)
      return Boolean is
     ((not Has_Time) or else (Hour <= 23 and then Minute <= 59));

   function Ordinal_Weekday_Monthly_Label
     (Locale  : String;
      Ordinal : Integer;
      Weekday : Natural)
      return String
   is
      Ordinal_Text : constant String := Ordinal_Name (Locale, Ordinal);
      Weekday_Text : constant String := Weekday_Name (Locale, Weekday);
   begin
      if Ordinal_Text'Length = 0 or else Weekday_Text'Length = 0 then
         return "";
      elsif Locale = "da" then
         return Ordinal_Text & " " & Weekday_Text & " hver m"
           & U (16#E5#) & "ned";
      elsif Locale = "de" then
         return Ordinal_Text & " " & Weekday_Text & " jedes Monats";
      elsif Locale = "fr" then
         return Ordinal_Text & " " & Weekday_Text & " de chaque mois";
      elsif Locale = "es" then
         return Ordinal_Text & " " & Weekday_Text & " de cada mes";
      elsif Locale = "it" then
         return Ordinal_Text & " " & Weekday_Text & " di ogni mese";
      elsif Locale = "pt" then
         return Ordinal_Text & " " & Weekday_Text & " de cada m"
           & U (16#EA#) & "s";
      elsif Locale = "nl" then
         return Ordinal_Text & " " & Weekday_Text & " van elke maand";
      elsif Locale = "sv" then
         return Ordinal_Text & " " & Weekday_Text & " varje m"
           & U (16#E5#) & "nad";
      elsif Is_Norwegian (Locale) then
         return Ordinal_Text & " " & Weekday_Text & " hver m" & U (16#E5#) & "ned";
      elsif Locale = "fi" then
         return Ordinal_Text & " " & Weekday_Text & " joka kuukausi";
      elsif Locale = "pl" then
         return Ordinal_Text & " " & Weekday_Text & " ka" & U (16#17C#)
           & "dego miesi" & U (16#105#) & "ca";
      elsif Locale = "cs" then
         return Ordinal_Text & " " & Weekday_Text & " ka" & U (16#17E#)
           & "d" & U (16#FD#) & " m" & U (16#11B#) & "s"
           & U (16#ED#) & "c";
      elsif Locale = "tr" then
         return "her ay" & U (16#131#) & "n " & Ordinal_Text
           & " " & Weekday_Text;
      elsif Locale = "ro" then
         return Ordinal_Text & " " & Weekday_Text & " in fiecare luna";
      elsif Locale = "lt" then
         return Ordinal_Text & " " & Weekday_Text & " kiekviena menesi";
      elsif Locale = "sl" then
         return Ordinal_Text & " " & Weekday_Text & " vsak mesec";
      elsif Locale = "id" or else Locale = "ms" then
         return Ordinal_Text & " " & Weekday_Text & " setiap bulan";
      elsif Locale = "eo" then
         return Ordinal_Text & " " & Weekday_Text & " cxiumonate";
      elsif Locale = "vi" then
         return Ordinal_Text & " " & Weekday_Text & " moi thang";
      elsif Locale = "sw" then
         return Ordinal_Text & " " & Weekday_Text & " kila mwezi";
      elsif Locale = "af" then
         return Ordinal_Text & " " & Weekday_Text & " elke maand";
      elsif Locale = "hu" then
         return "minden honap " & Ordinal_Text & " " & Weekday_Text;
      elsif Locale = "sk" then
         return Ordinal_Text & " " & Weekday_Text & " kazdy mesiac";
      elsif Locale = "ru" then
         return Ordinal_Text & " " & Weekday_Text & " "
           & U (16#43A#) & U (16#430#) & U (16#436#)
           & U (16#434#) & U (16#43E#) & U (16#433#)
           & U (16#43E#) & " " & U (16#43C#) & U (16#435#)
           & U (16#441#) & U (16#44F#) & U (16#446#)
           & U (16#430#);
      elsif Locale = "uk" then
         return Ordinal_Text & " " & Weekday_Text & " "
           & U (16#43A#) & U (16#43E#) & U (16#436#)
           & U (16#43D#) & U (16#43E#) & U (16#433#)
           & U (16#43E#) & " " & U (16#43C#) & U (16#456#)
           & U (16#441#) & U (16#44F#) & U (16#446#)
           & U (16#44F#);
      elsif Locale = "ja" then
         return U (16#6BCE#) & U (16#6708#) & U (16#306E#)
           & Ordinal_Text & Weekday_Text;
      elsif Locale = "ko" then
         return U (16#B9E4#) & U (16#B2EC#) & " " & Ordinal_Text
           & " " & Weekday_Text;
      elsif Locale = "zh" then
         return U (16#6BCF#) & U (16#6708#) & Ordinal_Text & Weekday_Text;
      elsif Locale = "ar" then
         return Ordinal_Text & " " & Weekday_Text & " " & U (16#645#)
           & U (16#646#) & " " & U (16#643#) & U (16#644#) & " "
           & U (16#634#) & U (16#647#) & U (16#631#);
      elsif Locale = "hi" then
         return U (16#939#) & U (16#930#) & " " & U (16#92E#)
           & U (16#939#) & U (16#940#) & U (16#928#) & U (16#947#)
           & " " & Ordinal_Text & " " & Weekday_Text;
      else
         return Ordinal_Text & " " & Weekday_Text & " of each month";
      end if;
   end Ordinal_Weekday_Monthly_Label;

   function Business_Day_Schedule_Label
     (Locale  : String;
      Ordinal : Integer)
      return String
   is
      Label : constant String := Business_Day_Label (Locale);
      Last  : constant String := Ordinal_Name (Locale, -1);
      Ordinal_Text : constant String := Ordinal_Name (Locale, Ordinal);
   begin
      if Ordinal = -1 then
         if Locale = "da" then
            return Last & " " & Label & " hver m" & U (16#E5#) & "ned";
         elsif Locale = "de" then
            return Last & " " & Label & " jedes Monats";
         elsif Locale = "fr" then
            return Last & " " & Label & " de chaque mois";
         elsif Locale = "es" then
            return U (16#FA#) & "ltimo " & Label & " de cada mes";
         elsif Locale = "it" then
            return "ultimo " & Label & " di ogni mese";
         elsif Locale = "pt" then
            return U (16#FA#) & "ltimo " & Label & " de cada m"
              & U (16#EA#) & "s";
         elsif Locale = "nl" then
            return "laatste " & Label & " van elke maand";
         elsif Locale = "sv" then
            return "sista " & Label & " varje m" & U (16#E5#) & "nad";
         elsif Is_Norwegian (Locale) then
            return "siste " & Label & " hver m" & U (16#E5#) & "ned";
         elsif Locale = "fi" then
            return "viimeinen " & Label & " joka kuukausi";
         elsif Locale = "pl" then
            return "ostatni " & Label & " ka" & U (16#17C#)
              & "dego miesi" & U (16#105#) & "ca";
         elsif Locale = "cs" then
            return "posledn" & U (16#ED#) & " " & Label & " ka"
              & U (16#17E#) & "d" & U (16#FD#) & " m"
              & U (16#11B#) & "s" & U (16#ED#) & "c";
         elsif Locale = "tr" then
            return "her ay" & U (16#131#) & "n son " & Label;
         elsif Locale = "ro" then
            return "ultima " & Label & " din fiecare luna";
         elsif Locale = "lt" then
            return "paskutine " & Label & " kiekviena menesi";
         elsif Locale = "sl" then
            return "zadnji " & Label & " vsak mesec";
         elsif Locale = "id" or else Locale = "ms" then
            return "hari kerja terakhir setiap bulan";
         elsif Locale = "eo" then
            return "lasta " & Label & " cxiumonate";
         elsif Locale = "vi" then
            return Label & " cuoi moi thang";
         elsif Locale = "sw" then
            return Label & " ya mwisho kila mwezi";
         elsif Locale = "af" then
            return "laaste " & Label & " elke maand";
         elsif Locale = "hu" then
            return "minden honap utolso " & Label & "ja";
         elsif Locale = "sk" then
            return "posledny " & Label & " kazdy mesiac";
         elsif Locale = "ja" then
            return U (16#6BCE#) & U (16#6708#) & U (16#6700#)
              & U (16#5F8C#) & U (16#306E#) & Label;
         elsif Locale = "ko" then
            return U (16#B9E4#) & U (16#B2EC#) & " "
              & U (16#B9C8#) & U (16#C9C0#) & U (16#B9C9#)
              & " " & Label;
         elsif Locale = "zh" then
            return U (16#6BCF#) & U (16#6708#) & U (16#6700#)
              & U (16#540E#) & U (16#4E00#) & U (16#4E2A#)
              & Label;
         elsif Locale = "ar" then
            return U (16#622#) & U (16#62E#) & U (16#631#)
              & " " & Label & " " & U (16#641#) & U (16#64A#)
              & " " & U (16#643#) & U (16#644#) & " "
              & U (16#634#) & U (16#647#) & U (16#631#);
         elsif Locale = "hi" then
            return U (16#939#) & U (16#930#) & " " & U (16#92E#)
              & U (16#939#) & U (16#940#) & U (16#928#)
              & U (16#947#) & " " & U (16#905#) & U (16#902#)
              & U (16#924#) & U (16#93F#) & U (16#92E#)
              & " " & Label;
         else
            return "last " & Label & " of each month";
         end if;
      elsif Ordinal in 1 .. 5 then
         if Locale = "da" then
            return Ordinal_Text & " " & Label & " hver m" & U (16#E5#)
              & "ned";
         elsif Locale = "de" then
            return Ordinal_Text & " " & Label & " jedes Monats";
         elsif Locale = "fr" then
            return Ordinal_Text & " " & Label & " de chaque mois";
         elsif Locale = "es" then
            return Ordinal_Text & " " & Label & " de cada mes";
         elsif Locale = "it" then
            return Ordinal_Text & " " & Label & " di ogni mese";
         elsif Locale = "pt" then
            return Ordinal_Text & " " & Label & " de cada m"
              & U (16#EA#) & "s";
         elsif Locale = "nl" then
            return Ordinal_Text & " " & Label & " van elke maand";
         elsif Locale = "sv" then
            return Ordinal_Text & " " & Label & " varje m" & U (16#E5#)
              & "nad";
         elsif Is_Norwegian (Locale) then
            return Ordinal_Text & " " & Label & " hver m" & U (16#E5#)
              & "ned";
         elsif Locale = "fi" then
            return Ordinal_Text & " " & Label & " joka kuukausi";
         else
            return Ordinal_Text & " " & Label & " of each month";
         end if;
      else
         return Every_Phrase (Locale, Label);
      end if;
   end Business_Day_Schedule_Label;

   function Monthly_Day_Label
     (Locale : String;
      Day    : Natural)
      return String
   is
      Image : constant String := No_Space (Natural'Image (Day));
   begin
      if Locale = "da" then
         return Image & ". hver m" & U (16#E5#) & "ned";
      elsif Locale = "de" then
         return "Tag " & Image & " jedes Monats";
      elsif Locale = "fr" then
         return "jour " & Image & " de chaque mois";
      elsif Locale = "es" then
         return "d" & U (16#ED#) & "a " & Image & " de cada mes";
      elsif Locale = "it" then
         return "giorno " & Image & " di ogni mese";
      elsif Locale = "pt" then
         return "dia " & Image & " de cada m" & U (16#EA#) & "s";
      elsif Locale = "nl" then
         return "dag " & Image & " van elke maand";
      elsif Locale = "sv" then
         return "dag " & Image & " varje m" & U (16#E5#) & "nad";
      elsif Is_Norwegian (Locale) then
         return "dag " & Image & " hver m" & U (16#E5#) & "ned";
      elsif Locale = "fi" then
         return "p" & U (16#E4#) & "iv" & U (16#E4#) & " "
           & Image & " joka kuukausi";
      elsif Locale = "pl" then
         return Image & ". dzie" & U (16#144#) & " ka" & U (16#17C#)
           & "dego miesi" & U (16#105#) & "ca";
      elsif Locale = "cs" then
         return Image & ". den ka" & U (16#17E#) & "d" & U (16#E9#)
           & "ho m" & U (16#11B#) & "s" & U (16#ED#) & "ce";
      elsif Locale = "tr" then
         return "her ay" & U (16#131#) & "n " & Image & ". g"
           & U (16#FC#) & "n" & U (16#FC#);
      elsif Locale = "ro" then
         return "ziua " & Image & " a fiecarei luni";
      elsif Locale = "lt" then
         return Image & " diena kiekviena menesi";
      elsif Locale = "sl" then
         return Image & ". dan vsakega meseca";
      elsif Locale = "id" then
         return "tanggal " & Image & " setiap bulan";
      elsif Locale = "ms" then
         return "hari " & Image & " setiap bulan";
      elsif Locale = "eo" then
         return "tago " & Image & " de cxiu monato";
      elsif Locale = "vi" then
         return "ngay " & Image & " moi thang";
      elsif Locale = "sw" then
         return "siku ya " & Image & " ya kila mwezi";
      elsif Locale = "af" then
         return "dag " & Image & " van elke maand";
      elsif Locale = "hu" then
         return "minden honap " & Image & ". napja";
      elsif Locale = "sk" then
         return Image & ". den kazdeho mesiaca";
      elsif Locale = "ru" then
         return Image & "-" & U (16#439#) & " " & U (16#434#)
           & U (16#435#) & U (16#43D#) & U (16#44C#) & " "
           & U (16#43A#) & U (16#430#) & U (16#436#) & U (16#434#)
           & U (16#43E#) & U (16#433#) & U (16#43E#) & " "
           & U (16#43C#) & U (16#435#) & U (16#441#) & U (16#44F#)
           & U (16#446#) & U (16#430#);
      elsif Locale = "uk" then
         return Image & "-" & U (16#439#) & " " & U (16#434#)
           & U (16#435#) & U (16#43D#) & U (16#44C#) & " "
           & U (16#43A#) & U (16#43E#) & U (16#436#) & U (16#43D#)
           & U (16#43E#) & U (16#433#) & U (16#43E#) & " "
           & U (16#43C#) & U (16#456#) & U (16#441#) & U (16#44F#)
           & U (16#446#) & U (16#44F#);
      elsif Locale = "ja" then
         return U (16#6BCE#) & U (16#6708#) & Image & U (16#65E5#);
      elsif Locale = "ko" then
         return U (16#B9E4#) & U (16#B2EC#) & " " & Image & U (16#C77C#);
      elsif Locale = "zh" then
         return U (16#6BCF#) & U (16#6708#) & Image & U (16#65E5#);
      elsif Locale = "ar" then
         return U (16#627#) & U (16#644#) & U (16#64A#) & U (16#648#)
           & U (16#645#) & " " & Image & " " & U (16#645#)
           & U (16#646#) & " " & U (16#643#) & U (16#644#) & " "
           & U (16#634#) & U (16#647#) & U (16#631#);
      elsif Locale = "hi" then
         return U (16#939#) & U (16#930#) & " " & U (16#92E#)
           & U (16#939#) & U (16#940#) & U (16#928#) & U (16#947#)
           & " " & Image & " " & U (16#924#) & U (16#93E#)
           & U (16#930#) & U (16#940#) & U (16#916#);
      else
         return "day " & Image & " of each month";
      end if;
   end Monthly_Day_Label;

   function Schedule
     (Context : Humanize.Contexts.Context;
      Options : Schedule_Options)
      return Humanize.Status.Text_Result
   is
      Locale : constant String := Locale_Prefix (Context);
      Base : Unbounded_String;
   begin
      case Options.Kind is
         when Schedule_Interval =>
            return
              (Status => Humanize.Status.Ok,
               Text => To_Unbounded_String
                 (With_Time
                    (Locale,
                     Schedule_Interval_Label
                       (Locale, Options.Every, Options.Unit),
                     Options)),
               Key => Humanize.Messages.No_Message);

         when Schedule_Weekday =>
            if Options.Weekday = 0 then
               return (Status => Humanize.Status.Invalid_Options, others => <>);
            end if;
            if Options.Every > 1 and then Options.Unit = Every_Week then
               Base := To_Unbounded_String
                 (Weekly_On_Label
                    (Locale, Options.Every,
                     Weekday_Name (Locale, Options.Weekday)));
            else
               Base := To_Unbounded_String
                 (Every_Phrase (Locale, Weekday_Name (Locale, Options.Weekday)));
            end if;

         when Schedule_Weekday_Set =>
            declare
               Label : constant String :=
                 Weekday_Set_Label (Locale, Options.Weekdays);
            begin
               if Label'Length = 0 then
                  return (Status => Humanize.Status.Invalid_Options, others => <>);
               end if;
               if Options.Every > 1 and then Options.Unit = Every_Week then
                  Base := To_Unbounded_String
                    (Weekly_On_Label (Locale, Options.Every, Label));
               else
                  Base := To_Unbounded_String (Every_Phrase (Locale, Label));
               end if;
            end;

         when Schedule_Ordinal_Weekday =>
            if Options.Weekday = 0 or else Options.Ordinal = 0 then
               return (Status => Humanize.Status.Invalid_Options, others => <>);
            end if;
            Base := To_Unbounded_String
              (Ordinal_Weekday_Monthly_Label
                 (Locale, Options.Ordinal, Options.Weekday));
            if Length (Base) = 0 then
               return (Status => Humanize.Status.Invalid_Options, others => <>);
            end if;

         when Schedule_Business_Day =>
            Base := To_Unbounded_String
              (Business_Day_Schedule_Label (Locale, Options.Ordinal));
      end case;

      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (With_Time (Locale, To_String (Base), Options)),
         Key => Humanize.Messages.No_Message);
   end Schedule;

   function Weekly_Schedule
     (Context     : Humanize.Contexts.Context;
      Weekdays    : Weekday_Set;
      Every       : Positive := 1;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
      return Humanize.Status.Text_Result is
   begin
      if not Valid_Schedule_Time (Has_Time, Hour, Minute) then
         return (Status => Humanize.Status.Invalid_Options, others => <>);
      end if;

      return Schedule
        (Context,
         (Kind        => Schedule_Weekday_Set,
          Every       => Every,
          Unit        => Every_Week,
          Weekday     => 0,
          Weekdays    => Weekdays,
          Ordinal     => 0,
          Has_Time    => Has_Time,
          Hour        => Hour,
          Minute      => Minute,
          Use_12_Hour => Use_12_Hour));
   end Weekly_Schedule;

   function Every_Other_Weekday_Schedule
     (Context     : Humanize.Contexts.Context;
      Weekday     : Natural;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
      return Humanize.Status.Text_Result is
   begin
      if Weekday not in 1 .. 7
        or else not Valid_Schedule_Time (Has_Time, Hour, Minute)
      then
         return (Status => Humanize.Status.Invalid_Options, others => <>);
      end if;

      return Schedule
        (Context,
         (Kind        => Schedule_Weekday,
          Every       => 2,
          Unit        => Every_Week,
          Weekday     => Weekday,
          Weekdays    => Every_Day_Set,
          Ordinal     => 0,
          Has_Time    => Has_Time,
          Hour        => Hour,
          Minute      => Minute,
          Use_12_Hour => Use_12_Hour));
   end Every_Other_Weekday_Schedule;

   function Monthly_Day_Schedule
     (Context     : Humanize.Contexts.Context;
      Day         : Natural;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
      return Humanize.Status.Text_Result
   is
      Locale : constant String := Locale_Prefix (Context);
   begin
      if Day not in 1 .. 31
        or else not Valid_Schedule_Time (Has_Time, Hour, Minute)
      then
         return (Status => Humanize.Status.Invalid_Options, others => <>);
      end if;

      declare
         Options : constant Schedule_Options :=
           (Kind        => Schedule_Interval,
            Every       => 1,
            Unit        => Every_Month,
            Weekday     => 0,
            Weekdays    => Every_Day_Set,
            Ordinal     => 0,
            Has_Time    => Has_Time,
            Hour        => Hour,
            Minute      => Minute,
            Use_12_Hour => Use_12_Hour);
      begin
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String
              (With_Time (Locale, Monthly_Day_Label (Locale, Day), Options)),
            Key => Humanize.Messages.No_Message);
      end;
   end Monthly_Day_Schedule;

   function Last_Business_Day_Schedule
     (Context     : Humanize.Contexts.Context;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
      return Humanize.Status.Text_Result is
   begin
      if not Valid_Schedule_Time (Has_Time, Hour, Minute) then
         return (Status => Humanize.Status.Invalid_Options, others => <>);
      end if;

      return Schedule
        (Context,
         (Kind        => Schedule_Business_Day,
          Every       => 1,
          Unit        => Every_Month,
          Weekday     => 0,
          Weekdays    => Every_Day_Set,
          Ordinal     => -1,
          Has_Time    => Has_Time,
          Hour        => Hour,
          Minute      => Minute,
          Use_12_Hour => Use_12_Hour));
   end Last_Business_Day_Schedule;

   function Business_Day_Schedule
     (Context     : Humanize.Contexts.Context;
      Ordinal     : Integer;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
      return Humanize.Status.Text_Result
   is
   begin
      if (Ordinal /= -1 and then Ordinal not in 1 .. 5)
        or else not Valid_Schedule_Time (Has_Time, Hour, Minute)
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      return Schedule
        (Context,
         (Kind        => Schedule_Business_Day,
          Every       => 1,
          Unit        => Every_Month,
          Weekday     => 0,
          Weekdays    => Every_Day_Set,
          Ordinal     => Ordinal,
          Has_Time    => Has_Time,
          Hour        => Hour,
          Minute      => Minute,
          Use_12_Hour => Use_12_Hour));
   end Business_Day_Schedule;

   function Cron_Schedule
     (Context : Humanize.Contexts.Context;
      Minute  : String;
      Hour    : String;
      Day     : String;
      Month   : String;
      Weekday : String)
      return Humanize.Status.Text_Result
   is
      M : constant String := Lower (Minute);
      H : constant String := Lower (Hour);
      D : constant String := Lower (Day);
      Mo : constant String := Lower (Month);
      W : constant String := Lower (Weekday);
      Locale : constant String := Locale_Prefix (Context);

      function Is_Number (Text : String; Value : out Natural) return Boolean is
         N : Natural := 0;
      begin
         if Text'Length = 0 then
            return False;
         end if;
         for Ch of Text loop
            if Ch not in '0' .. '9' then
               return False;
            end if;
            N := N * 10 + Character'Pos (Ch) - Character'Pos ('0');
         end loop;
         Value := N;
         return True;
      end Is_Number;

      function Cron_Weekday (Text : String) return Natural is
      begin
         if Text = "1" or else Text = "mon" or else Text = "monday" then
            return 1;
         elsif Text = "2" or else Text = "tue" or else Text = "tuesday" then
            return 2;
         elsif Text = "3" or else Text = "wed" or else Text = "wednesday" then
            return 3;
         elsif Text = "4" or else Text = "thu" or else Text = "thursday" then
            return 4;
         elsif Text = "5" or else Text = "fri" or else Text = "friday" then
            return 5;
         elsif Text = "6" or else Text = "sat" or else Text = "saturday" then
            return 6;
         elsif Text = "0" or else Text = "7"
           or else Text = "sun" or else Text = "sunday"
         then
            return 7;
         else
            return 0;
         end if;
      end Cron_Weekday;

      Minute_Value : Natural := 0;
      Hour_Value   : Natural := 0;
      Day_Value    : Natural := 0;
      Weekday_Value : Natural := 0;
      Opt : Schedule_Options := Default_Schedule_Options;
   begin
      if M = "*" and then H = "*" and then D = "*" and then Mo = "*"
        and then W = "*"
      then
         Opt.Kind := Schedule_Interval;
         Opt.Every := 1;
         Opt.Unit := Every_Minute;
         return Schedule (Context, Opt);
      end if;

      if not Is_Number (M, Minute_Value)
        or else Minute_Value > 59
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      if H = "*" and then D = "*" and then Mo = "*" and then W = "*" then
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String
              ("every hour at minute " & No_Space (Natural'Image (Minute_Value))),
            Key => Humanize.Messages.No_Message);
      end if;

      if not Is_Number (H, Hour_Value) or else Hour_Value > 23 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      Opt.Has_Time := True;
      Opt.Hour := Hour_Value;
      Opt.Minute := Minute_Value;

      if D = "*" and then Mo = "*" and then W = "*" then
         Opt.Kind := Schedule_Interval;
         Opt.Every := 1;
         Opt.Unit := Every_Day;
         return Schedule (Context, Opt);
      elsif D = "*" and then Mo = "*" then
         if W = "1-5" or else W = "mon-fri" then
            Opt.Kind := Schedule_Weekday_Set;
            Opt.Weekdays := Weekdays;
            return Schedule (Context, Opt);
         end if;
         Weekday_Value := Cron_Weekday (W);
         if Weekday_Value /= 0 then
            Opt.Kind := Schedule_Weekday;
            Opt.Weekday := Weekday_Value;
            return Schedule (Context, Opt);
         end if;
      elsif Mo = "*" and then W = "*" and then Is_Number (D, Day_Value)
        and then Day_Value in 1 .. 31
      then
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String
              (With_Time
                 (Locale, Monthly_Day_Label (Locale, Day_Value),
                  (Kind        => Schedule_Interval,
                   Every       => 1,
                   Unit        => Every_Day,
                   Weekday     => 0,
                   Weekdays    => Every_Day_Set,
                   Ordinal     => 0,
                   Has_Time    => True,
                   Hour        => Hour_Value,
                   Minute      => Minute_Value,
                   Use_12_Hour => False))),
            Key => Humanize.Messages.No_Message);
      end if;

      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Cron_Schedule;

   procedure Recurrence_Into
     (Context : Humanize.Contexts.Context;
      Every   : Positive;
      Unit    : Recurrence_Unit;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Recurrence (Context, Every, Unit), Target, Written, Status);
   end Recurrence_Into;

   procedure Schedule_Into
     (Context : Humanize.Contexts.Context;
      Options : Schedule_Options;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Schedule (Context, Options), Target, Written, Status);
   end Schedule_Into;

   procedure Weekly_Schedule_Into
     (Context     : Humanize.Contexts.Context;
      Weekdays    : Weekday_Set;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Every       : Positive := 1;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
   is
   begin
      Copy_Result
        (Weekly_Schedule
           (Context, Weekdays, Every, Has_Time, Hour, Minute, Use_12_Hour),
         Target, Written, Status);
   end Weekly_Schedule_Into;

   procedure Every_Other_Weekday_Schedule_Into
     (Context     : Humanize.Contexts.Context;
      Weekday     : Natural;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
   is
   begin
      Copy_Result
        (Every_Other_Weekday_Schedule
           (Context, Weekday, Has_Time, Hour, Minute, Use_12_Hour),
         Target, Written, Status);
   end Every_Other_Weekday_Schedule_Into;

   procedure Monthly_Day_Schedule_Into
     (Context     : Humanize.Contexts.Context;
      Day         : Natural;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
   is
   begin
      Copy_Result
        (Monthly_Day_Schedule
           (Context, Day, Has_Time, Hour, Minute, Use_12_Hour),
         Target, Written, Status);
   end Monthly_Day_Schedule_Into;

   procedure Last_Business_Day_Schedule_Into
     (Context     : Humanize.Contexts.Context;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
   is
   begin
      Copy_Result
        (Last_Business_Day_Schedule
           (Context, Has_Time, Hour, Minute, Use_12_Hour),
         Target, Written, Status);
   end Last_Business_Day_Schedule_Into;

   procedure Business_Day_Schedule_Into
     (Context     : Humanize.Contexts.Context;
      Ordinal     : Integer;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Has_Time    : Boolean := False;
      Hour        : Natural := 0;
      Minute      : Natural := 0;
      Use_12_Hour : Boolean := False)
   is
   begin
      Copy_Result
        (Business_Day_Schedule
           (Context, Ordinal, Has_Time, Hour, Minute, Use_12_Hour),
         Target, Written, Status);
   end Business_Day_Schedule_Into;

   procedure Cron_Schedule_Into
     (Context : Humanize.Contexts.Context;
      Minute  : String;
      Hour    : String;
      Day     : String;
      Month   : String;
      Weekday : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Cron_Schedule (Context, Minute, Hour, Day, Month, Weekday),
         Target, Written, Status);
   end Cron_Schedule_Into;

end Humanize.Durations.Schedules;
