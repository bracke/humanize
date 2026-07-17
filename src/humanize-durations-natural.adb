with Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Messages;

package body Humanize.Durations.Natural is

   use Ada.Strings.Unbounded;
   use type Humanize.Status.Status_Code;

   function No_Space (Image : String) return String
      renames Humanize.Bounded_Text.No_Space;

   function Integer_Text (Value : Long_Long_Integer) return String
      renames Humanize.Bounded_Text.Image;

   function Padded_Text (Value : Standard.Natural; Width : Standard.Natural) return String
      renames Humanize.Bounded_Text.Padded_Image;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Pad2 (Value : Standard.Natural) return String is
     (Padded_Text (Value, 2));

   function Unit_Name
     (Unit_Count : Duration_Seconds;
      Singular   : String;
      Plural     : String)
      return String
   is
   begin
      if Unit_Count = 1 then
         return Singular;
      else
         return Plural;
      end if;
   end Unit_Name;

   function Natural_Unit_Name
     (Unit_Seconds : Duration_Seconds;
      Count        : Duration_Seconds)
      return String
   is
   begin
      case Unit_Seconds is
         when 60 =>
            return Unit_Name (Count, "minute", "minutes");
         when 3_600 =>
            return Unit_Name (Count, "hour", "hours");
         when 86_400 =>
            return Unit_Name (Count, "day", "days");
         when 604_800 =>
            return Unit_Name (Count, "week", "weeks");
         when 2_592_000 =>
            return Unit_Name (Count, "month", "months");
         when 31_536_000 =>
            return Unit_Name (Count, "year", "years");
         when others =>
            return Unit_Name (Count, "second", "seconds");
      end case;
   end Natural_Unit_Name;

   function Natural_Unit_Seconds
     (Seconds                  : Duration_Seconds;
      Prefer_Larger            : Boolean;
      Larger_Threshold_Percent : Standard.Natural)
      return Duration_Seconds
   is
      function Reaches_Percent
        (Value   : Duration_Seconds;
         Unit    : Duration_Seconds;
         Percent : Standard.Natural)
         return Boolean
      is
      begin
         return Value * 100 >= Unit * Duration_Seconds (Percent);
      end Reaches_Percent;
   begin
      if Seconds < 60 then
         return 1;
      elsif Seconds < 3_600 then
         if Prefer_Larger
           and then Reaches_Percent (Seconds, 3_600, Larger_Threshold_Percent)
         then
            return 3_600;
         else
            return 60;
         end if;
      elsif Seconds < 86_400 then
         if Prefer_Larger
           and then Reaches_Percent (Seconds, 86_400, Larger_Threshold_Percent)
         then
            return 86_400;
         else
            return 3_600;
         end if;
      elsif Seconds < 604_800 then
         if Prefer_Larger
           and then Reaches_Percent (Seconds, 604_800, Larger_Threshold_Percent)
         then
            return 604_800;
         else
            return 86_400;
         end if;
      elsif Seconds < 2_592_000 then
         if Prefer_Larger
           and then Reaches_Percent
             (Seconds, 2_592_000, Larger_Threshold_Percent)
         then
            return 2_592_000;
         else
            return 604_800;
         end if;
      elsif Seconds < 31_536_000 then
         if Prefer_Larger
           and then Reaches_Percent
             (Seconds, 31_536_000, Larger_Threshold_Percent)
         then
            return 31_536_000;
         else
            return 2_592_000;
         end if;
      else
         return 31_536_000;
      end if;
   end Natural_Unit_Seconds;

   function Natural_Approximation_Text
     (Prefix                    : String;
      Seconds                   : Duration_Seconds;
      Round_Up                  : Boolean;
      Options                   : Natural_Duration_Approximation_Options;
      Prefer_Larger             : Boolean := False)
      return String
   is
      Unit_Seconds : constant Duration_Seconds :=
        Natural_Unit_Seconds
          (Seconds, Prefer_Larger, Options.Larger_Unit_Threshold_Percent);
      Raw_Count : constant Duration_Seconds := Seconds / Unit_Seconds;
      Base_Count : constant Duration_Seconds :=
        Duration_Seconds'Max (1, Raw_Count);
      Remainder : constant Duration_Seconds := Seconds mod Unit_Seconds;
      Should_Round_Up : constant Boolean :=
        Round_Up
        and then Remainder > 0
        and then Remainder * 100
          >= Unit_Seconds
             * Duration_Seconds (Options.Round_Up_Threshold_Percent);
      Count : constant Duration_Seconds :=
        (if Should_Round_Up and then Raw_Count > 0
         then Base_Count + 1
         else Base_Count);
   begin
      return Prefix & " " & Integer_Text (Long_Long_Integer (Count))
        & " " & Natural_Unit_Name (Unit_Seconds, Count);
   end Natural_Approximation_Text;

   function Natural_Duration_Preset_Style
     (Seconds : Duration_Seconds;
      Preset  : Natural_Duration_Threshold_Preset)
      return Natural_Duration_Style
   is
   begin
      case Preset is
         when Threshold_Default =>
            return Plain_Duration;

         when Threshold_Rails =>
            if Seconds < 30 then
               return Few_Duration;
            elsif Seconds < 90 then
               return Plain_Duration;
            elsif Seconds < 45 * 60 then
               return Approximate_Duration;
            elsif Seconds < 90 * 60 then
               return Approximate_Duration;
            elsif Seconds < 24 * 3_600 then
               return Approximate_Duration;
            elsif Seconds < 30 * 86_400 then
               return Approximate_Duration;
            elsif Seconds < 365 * 86_400 then
               return Approximate_Duration;
            else
               return Over_Duration;
            end if;

         when Threshold_Django =>
            if Seconds < 60 then
               return Plain_Duration;
            elsif Seconds < 90 then
               return Approximate_Duration;
            elsif Seconds < 24 * 3_600 then
               return Approximate_Duration;
            elsif Seconds < 365 * 86_400 then
               return Plain_Duration;
            else
               return Over_Duration;
            end if;

         when Threshold_Conversational =>
            if Seconds < 45 then
               return Few_Duration;
            elsif Seconds < 60 then
               return Plain_Duration;
            elsif Seconds >= 45 * 60
              and then Seconds < 60 * 60
            then
               return Little_Under_Duration;
            elsif Seconds >= 23 * 3_600
              and then Seconds < 24 * 3_600
            then
               return Little_Under_Duration;
            elsif Seconds < 90 then
               return Approximate_Duration;
            elsif Seconds mod Natural_Unit_Seconds (Seconds, False, 70) = 0 then
               return Plain_Duration;
            else
               return Just_Over_Duration;
            end if;
      end case;
   end Natural_Duration_Preset_Style;

   function Natural_Duration_Internal
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Natural_Duration_Options;
      Approximation : Natural_Duration_Approximation_Options)
      return Humanize.Status.Text_Result
   is
      Abs_Seconds : constant Duration_Seconds := Duration_Seconds'Max (0, Seconds);
      Hours : constant Duration_Seconds := Abs_Seconds / 3_600;
      Minutes : constant Duration_Seconds := (Abs_Seconds mod 3_600) / 60;
      Seconds_Part : constant Duration_Seconds := Abs_Seconds mod 60;
   begin
      if Options.Style = Brief_Duration
        or else Options.Style = Brief_Precise_Duration
      then
         declare
            Text : constant String :=
              No_Space (Duration_Seconds'Image (Hours)) & " hr "
              & Pad2 (Standard.Natural (Minutes)) & " min"
              & (if Options.Style = Brief_Precise_Duration
                 then " " & Pad2 (Standard.Natural (Seconds_Part)) & " sec"
                 else "");
         begin
            return
              (Status => Humanize.Status.Ok,
               Text => To_Unbounded_String (Text),
               Key => Humanize.Messages.No_Message);
         end;
      elsif Options.Style = Few_Duration then
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String
              (if Abs_Seconds < 60 then "a few seconds"
               elsif Abs_Seconds < 300 then "a few minutes"
               else "a few " & To_String
                 (Format (Context, Abs_Seconds).Text)),
            Key => Humanize.Messages.No_Message);
      elsif Options.Style = Almost_Duration then
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String
              (Natural_Approximation_Text
                 ("almost", Abs_Seconds, Round_Up => True,
                  Options => Approximation)),
            Key => Humanize.Messages.No_Message);
      elsif Options.Style = Over_Duration then
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String
              (Natural_Approximation_Text
                 ("over", Abs_Seconds, Round_Up => False,
                  Options => Approximation)),
            Key => Humanize.Messages.No_Message);
      elsif Options.Style = Just_Over_Duration then
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String
              (Natural_Approximation_Text
                 ("just over", Abs_Seconds, Round_Up => False,
                  Options => Approximation)),
            Key => Humanize.Messages.No_Message);
      elsif Options.Style = Little_Under_Duration then
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String
              (Natural_Approximation_Text
                 ("a little under", Abs_Seconds, Round_Up => True,
                  Options => Approximation,
                  Prefer_Larger => True)),
            Key => Humanize.Messages.No_Message);
      elsif Abs_Seconds < 60 then
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String ("less than a minute"),
            Key => Humanize.Messages.No_Message);
      elsif Abs_Seconds = 1_800 and then Options.Style = Plain_Duration then
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String ("half an hour"),
            Key => Humanize.Messages.No_Message);
      elsif Options.Style = Approximate_Duration then
         declare
            Base : constant Humanize.Status.Text_Result :=
              Format (Context, Abs_Seconds);
         begin
            if Abs_Seconds = 1_800 then
               return
                 (Status => Humanize.Status.Ok,
                  Text => To_Unbounded_String ("about half an hour"),
                  Key => Humanize.Messages.No_Message);
            end if;
            if Base.Status /= Humanize.Status.Ok then
               return Base;
            end if;
            return
              (Status => Humanize.Status.Ok,
               Text => To_Unbounded_String ("about " & To_String (Base.Text)),
               Key => Humanize.Messages.No_Message);
         end;
      else
         return Format (Context, Abs_Seconds);
      end if;
   end Natural_Duration_Internal;

   function Natural_Duration
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Natural_Duration_Options := Default_Natural_Duration_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Natural_Duration_Internal
        (Context, Seconds, Options,
         Default_Natural_Duration_Approximation_Options);
   end Natural_Duration;

   function Natural_Duration
     (Context       : Humanize.Contexts.Context;
      Seconds       : Duration_Seconds;
      Options       : Natural_Duration_Options;
      Approximation : Natural_Duration_Approximation_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Natural_Duration_Internal
        (Context, Seconds, Options, Approximation);
   end Natural_Duration;

   function Natural_Duration
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Preset  : Natural_Duration_Threshold_Preset)
      return Humanize.Status.Text_Result
   is
      Abs_Seconds : constant Duration_Seconds := Duration_Seconds'Max (0, Seconds);
      Style : constant Natural_Duration_Style :=
        Natural_Duration_Preset_Style (Abs_Seconds, Preset);
      Approximation : constant Natural_Duration_Approximation_Options :=
        (case Preset is
            when Threshold_Default =>
              Default_Natural_Duration_Approximation_Options,
            when Threshold_Rails =>
              (Round_Up_Threshold_Percent => 50,
               Larger_Unit_Threshold_Percent => 75),
            when Threshold_Django =>
              (Round_Up_Threshold_Percent => 50,
               Larger_Unit_Threshold_Percent => 80),
            when Threshold_Conversational =>
              (Round_Up_Threshold_Percent => 25,
               Larger_Unit_Threshold_Percent => 70));
   begin
      return Natural_Duration_Internal
        (Context, Abs_Seconds, (Style => Style), Approximation);
   end Natural_Duration;

   function Duration_Distance
     (Context   : Humanize.Contexts.Context;
      Seconds   : Duration_Seconds;
      Direction : Duration_Distance_Direction := Duration_Distance_Plain;
      Preset    : Natural_Duration_Threshold_Preset := Threshold_Default)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Natural_Duration (Context, Duration_Seconds'Max (0, Seconds), Preset);
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;

      case Direction is
         when Duration_Distance_Plain =>
            return Base;
         when Duration_Distance_Past =>
            return
              (Status => Humanize.Status.Ok,
               Text => To_Unbounded_String (To_String (Base.Text) & " ago"),
               Key => Humanize.Messages.No_Message);
         when Duration_Distance_Future =>
            return
              (Status => Humanize.Status.Ok,
               Text => To_Unbounded_String ("in " & To_String (Base.Text)),
               Key => Humanize.Messages.No_Message);
      end case;
   end Duration_Distance;

   function Natural_Duration_Detailed
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Detailed_Duration_Options :=
        Default_Detailed_Duration_Options)
      return Humanize.Status.Text_Result
   is
      Abs_Seconds : Duration_Seconds := Duration_Seconds'Max (0, Seconds);
      Base        : Humanize.Status.Text_Result;
      Prefix      : constant String :=
        (case Options.Prefix is
            when Plain_Duration | Brief_Duration | Brief_Precise_Duration =>
               "",
            when Approximate_Duration => "about ",
            when Almost_Duration => "almost ",
            when Over_Duration => "over ",
            when Just_Over_Duration => "just over ",
            when Little_Under_Duration => "a little under ",
            when Few_Duration => "a few ");
   begin
      if Options.Round_To_Minutes and then Abs_Seconds >= 60 then
         Abs_Seconds := ((Abs_Seconds + 30) / 60) * 60;
      end if;

      Base := Format_Components
        (Context, Abs_Seconds, Options.Max_Components,
         (Largest_Unit => Year, Smallest_Unit => Second));

      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;

      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String (Prefix & To_String (Base.Text)),
         Key => Humanize.Messages.No_Message);
   end Natural_Duration_Detailed;

   procedure Natural_Duration_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Natural_Duration_Options := Default_Natural_Duration_Options)
   is
   begin
      Copy_Result
        (Natural_Duration (Context, Seconds, Options), Target, Written, Status);
   end Natural_Duration_Into;

   procedure Natural_Duration_Into
     (Context       : Humanize.Contexts.Context;
      Seconds       : Duration_Seconds;
      Target        : in out String;
      Written       : out Standard.Natural;
      Status        : out Humanize.Status.Status_Code;
      Options       : Natural_Duration_Options;
      Approximation : Natural_Duration_Approximation_Options)
   is
   begin
      Copy_Result
        (Natural_Duration (Context, Seconds, Options, Approximation),
         Target, Written, Status);
   end Natural_Duration_Into;

   procedure Natural_Duration_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Preset  : Natural_Duration_Threshold_Preset)
   is
   begin
      Copy_Result
        (Natural_Duration (Context, Seconds, Preset), Target, Written, Status);
   end Natural_Duration_Into;

   procedure Duration_Distance_Into
     (Context   : Humanize.Contexts.Context;
      Seconds   : Duration_Seconds;
      Target    : in out String;
      Written   : out Standard.Natural;
      Status    : out Humanize.Status.Status_Code;
      Direction : Duration_Distance_Direction := Duration_Distance_Plain;
      Preset    : Natural_Duration_Threshold_Preset := Threshold_Default)
   is
   begin
      Copy_Result
        (Duration_Distance (Context, Seconds, Direction, Preset),
         Target, Written, Status);
   end Duration_Distance_Into;

   procedure Natural_Duration_Detailed_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Detailed_Duration_Options :=
        Default_Detailed_Duration_Options)
   is
   begin
      Copy_Result
        (Natural_Duration_Detailed (Context, Seconds, Options),
         Target, Written, Status);
   end Natural_Duration_Detailed_Into;

end Humanize.Durations.Natural;
