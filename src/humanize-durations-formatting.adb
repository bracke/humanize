with Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Decimal_Images;
with Humanize.Duration_Classification;
with Humanize.I18N_Rendering;
with Humanize.Lists;
with Humanize.Locales;
with Humanize.Messages;
with Humanize.Selections;

package body Humanize.Durations.Formatting is

   use Ada.Strings.Unbounded;
   use type Humanize.Status.Status_Code;

   type Precise_Component is record
      Unit  : Precise_Duration_Unit := Millisecond;
      Count : Long_Long_Integer := 0;
   end record;

   type Precise_Component_List is array (Positive range <>) of Precise_Component;

   function No_Space (Image : String) return String
      renames Humanize.Bounded_Text.No_Space;

   function Natural_Text (Value : Standard.Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Integer_Text (Value : Long_Long_Integer) return String
      renames Humanize.Bounded_Text.Image;

   function Padded_Text (Value : Standard.Natural; Width : Standard.Natural) return String
      renames Humanize.Bounded_Text.Padded_Image;

   function Padded_Text (Value : Long_Long_Integer; Width : Standard.Natural) return String
      renames Humanize.Bounded_Text.Padded_Image;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text
     (Result : Humanize.Status.Text_Result)
      return String
      renames Humanize.Bounded_Text.Result_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   procedure Copy_Text
     (Text    : String;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function U (Code : Standard.Natural) return String
      renames Humanize.Bounded_Text.UTF8_Code_Point;

   function B (Hex : String) return String
      renames Humanize.Bounded_Text.Hex_Bytes;

   function Lower (Text : String) return String
      renames Humanize.Bounded_Text.Lower_Text;

   function Locale_Prefix (Locale : String) return String
      renames Humanize.Locales.Locale_Prefix;

   function Locale_Prefix (Context : Humanize.Contexts.Context) return String is
     (Humanize.Locales.Locale_Prefix (Humanize.Contexts.Locale (Context)));

   function Is_Digit (Char : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;

   function Digit_Value (Char : Character) return Standard.Natural
      renames Humanize.Bounded_Text.Digit_Value;

   function Two_Digits (Value : Standard.Natural) return String is
      Tens : constant Standard.Natural := (Value / 10) mod 10;
      Ones : constant Standard.Natural := Value mod 10;
   begin
      return
        String'
          (1 => Character'Val (Character'Pos ('0') + Tens),
           2 => Character'Val (Character'Pos ('0') + Ones));
   end Two_Digits;

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

   type Slavic_Form is (One_Form, Few_Form, Many_Form);

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

   function Slavic_Duration_Name
     (Lang : String;
      Unit : Duration_Unit;
      Form : Slavic_Form)
      return String
   is
   begin
      if Lang = "pl" then
         case Unit is
            when Second =>
               return (case Form is
                         when One_Form => "sekunda",
                         when Few_Form => "sekundy",
                         when Many_Form => "sekund");
            when Minute =>
               return (case Form is
                         when One_Form => "minuta",
                         when Few_Form => "minuty",
                         when Many_Form => "minut");
            when Hour =>
               return (case Form is
                         when One_Form => "godzina",
                         when Few_Form => "godziny",
                         when Many_Form => "godzin");
            when Day =>
               return (case Form is
                         when One_Form => B ("647A6965C584"),
                         when Few_Form => "dni",
                         when Many_Form => "dni");
            when Week =>
               return (case Form is
                         when One_Form => B ("7479647A6965C584"),
                         when Few_Form => "tygodnie",
                         when Many_Form => "tygodni");
            when Month =>
               return (case Form is
                         when One_Form => B ("6D69657369C48563"),
                         when Few_Form => B ("6D69657369C4856365"),
                         when Many_Form => B ("6D69657369C4996379"));
            when Year =>
               return (case Form is
                         when One_Form => "rok",
                         when Few_Form => "lata",
                         when Many_Form => "lat");
         end case;
      elsif Lang = "cs" then
         case Unit is
            when Second =>
               return (case Form is
                         when One_Form => "sekunda",
                         when Few_Form => "sekundy",
                         when Many_Form => "sekund");
            when Minute =>
               return (case Form is
                         when One_Form => "minuta",
                         when Few_Form => "minuty",
                         when Many_Form => "minut");
            when Hour =>
               return (case Form is
                         when One_Form => "hodina",
                         when Few_Form => "hodiny",
                         when Many_Form => "hodin");
            when Day =>
               return (case Form is
                         when One_Form => "den",
                         when Few_Form => "dny",
                         when Many_Form => B ("646EC5AF"));
            when Week =>
               return (case Form is
                         when One_Form => B ("74C3BD64656E"),
                         when Few_Form => B ("74C3BD646E79"),
                         when Many_Form => B ("74C3BD646EC5AF"));
            when Month =>
               return (case Form is
                         when One_Form => B ("6DC49B73C3AD63"),
                         when Few_Form => B ("6DC49B73C3AD6365"),
                         when Many_Form => B ("6DC49B73C3AD63C5AF"));
            when Year =>
               return (case Form is
                         when One_Form => "rok",
                         when Few_Form => "roky",
                         when Many_Form => "let");
         end case;
      elsif Lang = "ru" then
         case Unit is
            when Second =>
               return (case Form is
                         when One_Form => B ("D181D0B5D0BAD183D0BDD0B4D0B0"),
                         when Few_Form => B ("D181D0B5D0BAD183D0BDD0B4D18B"),
                         when Many_Form => B ("D181D0B5D0BAD183D0BDD0B4"));
            when Minute =>
               return (case Form is
                         when One_Form => B ("D0BCD0B8D0BDD183D182D0B0"),
                         when Few_Form => B ("D0BCD0B8D0BDD183D182D18B"),
                         when Many_Form => B ("D0BCD0B8D0BDD183D182"));
            when Hour =>
               return (case Form is
                         when One_Form => B ("D187D0B0D181"),
                         when Few_Form => B ("D187D0B0D181D0B0"),
                         when Many_Form => B ("D187D0B0D181D0BED0B2"));
            when Day =>
               return (case Form is
                         when One_Form => B ("D0B4D0B5D0BDD18C"),
                         when Few_Form => B ("D0B4D0BDD18F"),
                         when Many_Form => B ("D0B4D0BDD0B5D0B9"));
            when Week =>
               return (case Form is
                         when One_Form => B ("D0BDD0B5D0B4D0B5D0BBD18F"),
                         when Few_Form => B ("D0BDD0B5D0B4D0B5D0BBD0B8"),
                         when Many_Form => B ("D0BDD0B5D0B4D0B5D0BBD18C"));
            when Month =>
               return (case Form is
                         when One_Form => B ("D0BCD0B5D181D18FD186"),
                         when Few_Form => B ("D0BCD0B5D181D18FD186D0B0"),
                         when Many_Form => B ("D0BCD0B5D181D18FD186D0B5D0B2"));
            when Year =>
               return (case Form is
                         when One_Form => B ("D0B3D0BED0B4"),
                         when Few_Form => B ("D0B3D0BED0B4D0B0"),
                         when Many_Form => B ("D0BBD0B5D182"));
         end case;
      elsif Lang = "uk" then
         case Unit is
            when Second =>
               return (case Form is
                         when One_Form => B ("D181D0B5D0BAD183D0BDD0B4D0B0"),
                         when Few_Form => B ("D181D0B5D0BAD183D0BDD0B4D0B8"),
                         when Many_Form => B ("D181D0B5D0BAD183D0BDD0B4"));
            when Minute =>
               return (case Form is
                         when One_Form => B ("D185D0B2D0B8D0BBD0B8D0BDD0B0"),
                         when Few_Form => B ("D185D0B2D0B8D0BBD0B8D0BDD0B8"),
                         when Many_Form => B ("D185D0B2D0B8D0BBD0B8D0BD"));
            when Hour =>
               return (case Form is
                         when One_Form => B ("D0B3D0BED0B4D0B8D0BDD0B0"),
                         when Few_Form => B ("D0B3D0BED0B4D0B8D0BDD0B8"),
                         when Many_Form => B ("D0B3D0BED0B4D0B8D0BD"));
            when Day =>
               return (case Form is
                         when One_Form => B ("D0B4D0B5D0BDD18C"),
                         when Few_Form => B ("D0B4D0BDD196"),
                         when Many_Form => B ("D0B4D0BDD196D0B2"));
            when Week =>
               return (case Form is
                         when One_Form => B ("D182D0B8D0B6D0B4D0B5D0BDD18C"),
                         when Few_Form => B ("D182D0B8D0B6D0BDD196"),
                         when Many_Form => B ("D182D0B8D0B6D0BDD196D0B2"));
            when Month =>
               return (case Form is
                         when One_Form => B ("D0BCD196D181D18FD186D18C"),
                         when Few_Form => B ("D0BCD196D181D18FD186D196"),
                         when Many_Form => B ("D0BCD196D181D18FD186D196D0B2"));
            when Year =>
               return (case Form is
                         when One_Form => B ("D180D196D0BA"),
                         when Few_Form => B ("D180D0BED0BAD0B8"),
                         when Many_Form => B ("D180D0BED0BAD196D0B2"));
         end case;
      else
         return "";
      end if;
   end Slavic_Duration_Name;

   function Slavic_Duration_Result
     (Context : Humanize.Contexts.Context;
      Count   : Long_Long_Integer;
      Unit    : Duration_Unit)
      return Humanize.Status.Text_Result
   is
      Lang : constant String :=
        Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context));
   begin
      if Lang = "pl" or else Lang = "cs" or else Lang = "ru" or else Lang = "uk" then
         declare
            Name : constant String :=
              Slavic_Duration_Name (Lang, Unit, Slavic_Form_For (Lang, Count));
         begin
            if Name'Length > 0 then
               return Ok_Text
                 (Integer_Text (Count) & " " & Name);
            end if;
         end;
      end if;

      return (Status => Humanize.Status.Runtime_Error, others => <>);
   end Slavic_Duration_Result;

   function Duration_Size (Unit : Duration_Unit) return Duration_Seconds is
     (case Unit is
         when Second => 1,
         when Minute => 60,
         when Hour   => 3_600,
         when Day    => 86_400,
         when Week   => 7 * 86_400,
         when Month  => 30 * 86_400,
         when Year   => 365 * 86_400);

   function Slavic_Format_Selection
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options)
      return Humanize.Status.Text_Result
   is
      Lang : constant String :=
        Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context));
   begin
      if not (Lang = "pl" or else Lang = "cs" or else Lang = "ru" or else Lang = "uk") then
         return (Status => Humanize.Status.Runtime_Error, others => <>);
      end if;

      if Seconds = 0 then
         return Slavic_Duration_Result
           (Context, 0, Options.Smallest_Unit);
      end if;

      for Unit in reverse Options.Smallest_Unit .. Options.Largest_Unit loop
         if Seconds / Duration_Size (Unit) >= 1 then
            return Slavic_Duration_Result
              (Context, Long_Long_Integer (Seconds / Duration_Size (Unit)), Unit);
         end if;
      end loop;

      return Slavic_Duration_Result
        (Context, 0, Options.Smallest_Unit);
   end Slavic_Format_Selection;

   function Slavic_Precise_Name
     (Lang : String;
      Unit : Precise_Duration_Unit;
      Form : Slavic_Form)
      return String
   is
   begin
      if Unit = Precise_Second then
         return Slavic_Duration_Name (Lang, Second, Form);
      elsif Unit = Precise_Minute then
         return Slavic_Duration_Name (Lang, Minute, Form);
      elsif Unit = Precise_Hour then
         return Slavic_Duration_Name (Lang, Hour, Form);
      elsif Unit = Precise_Day then
         return Slavic_Duration_Name (Lang, Day, Form);
      elsif Lang = "pl" then
         case Unit is
            when Microsecond =>
               return (case Form is
                         when One_Form => "mikrosekunda",
                         when Few_Form => "mikrosekundy",
                         when Many_Form => "mikrosekund");
            when Millisecond =>
               return (case Form is
                         when One_Form => "milisekunda",
                         when Few_Form => "milisekundy",
                         when Many_Form => "milisekund");
            when others =>
               return "";
         end case;
      elsif Lang = "cs" then
         case Unit is
            when Microsecond =>
               return (case Form is
                         when One_Form => "mikrosekunda",
                         when Few_Form => "mikrosekundy",
                         when Many_Form => "mikrosekund");
            when Millisecond =>
               return (case Form is
                         when One_Form => "milisekunda",
                         when Few_Form => "milisekundy",
                         when Many_Form => "milisekund");
            when others =>
               return "";
         end case;
      elsif Lang = "ru" then
         case Unit is
            when Microsecond =>
               return (case Form is
                         when One_Form => B ("D0BCD0B8D0BAD180D0BED181D0B5D0BAD183D0BDD0B4D0B0"),
                         when Few_Form => B ("D0BCD0B8D0BAD180D0BED181D0B5D0BAD183D0BDD0B4D18B"),
                         when Many_Form => B ("D0BCD0B8D0BAD180D0BED181D0B5D0BAD183D0BDD0B4"));
            when Millisecond =>
               return (case Form is
                         when One_Form => B ("D0BCD0B8D0BBD0BBD0B8D181D0B5D0BAD183D0BDD0B4D0B0"),
                         when Few_Form => B ("D0BCD0B8D0BBD0BBD0B8D181D0B5D0BAD183D0BDD0B4D18B"),
                         when Many_Form => B ("D0BCD0B8D0BBD0BBD0B8D181D0B5D0BAD183D0BDD0B4"));
            when others =>
               return "";
         end case;
      elsif Lang = "uk" then
         case Unit is
            when Microsecond =>
               return (case Form is
                         when One_Form => B ("D0BCD196D0BAD180D0BED181D0B5D0BAD183D0BDD0B4D0B0"),
                         when Few_Form => B ("D0BCD196D0BAD180D0BED181D0B5D0BAD183D0BDD0B4D0B8"),
                         when Many_Form => B ("D0BCD196D0BAD180D0BED181D0B5D0BAD183D0BDD0B4"));
            when Millisecond =>
               return (case Form is
                         when One_Form => B ("D0BCD196D0BBD196D181D0B5D0BAD183D0BDD0B4D0B0"),
                         when Few_Form => B ("D0BCD196D0BBD196D181D0B5D0BAD183D0BDD0B4D0B8"),
                         when Many_Form => B ("D0BCD196D0BBD196D181D0B5D0BAD183D0BDD0B4"));
            when others =>
               return "";
         end case;
      else
         return "";
      end if;
   end Slavic_Precise_Name;

   function Slavic_Precise_Result
     (Context   : Humanize.Contexts.Context;
      Component : Precise_Component)
      return Humanize.Status.Text_Result
   is
      Lang : constant String :=
        Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context));
   begin
      if Lang = "pl" or else Lang = "cs" or else Lang = "ru" or else Lang = "uk" then
         declare
            Name : constant String :=
              Slavic_Precise_Name
                (Lang, Component.Unit,
                 Slavic_Form_For (Lang, Component.Count));
         begin
            if Name'Length > 0 then
               return Ok_Text
                 (Integer_Text (Component.Count)
                  & " " & Name);
            end if;
         end;
      end if;

      return (Status => Humanize.Status.Runtime_Error, others => <>);
   end Slavic_Precise_Result;

   function Unit_Seconds
     (Unit : Duration_Unit)
      return Duration_Seconds
   is
   begin
      case Unit is
         when Year   => return 31_536_000;
         when Month  => return 2_592_000;
         when Week   => return 604_800;
         when Day    => return 86_400;
         when Hour   => return 3_600;
         when Minute => return 60;
         when Second => return 1;
      end case;
   end Unit_Seconds;

   function Format_Metadata
     (Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Duration_Render_Metadata
   is
      Remaining : Duration_Seconds :=
        (if Seconds < 0 then -Seconds else Seconds);
      Result : Duration_Render_Metadata :=
        (Status => Humanize.Status.Ok,
         Negative => Seconds < 0,
         others => <>);

      procedure Take
        (Unit  : Duration_Unit;
         Count : out Standard.Natural)
      is
         Size : constant Duration_Seconds := Unit_Seconds (Unit);
      begin
         if Unit <= Options.Largest_Unit
           and then Unit >= Options.Smallest_Unit
           and then Size > 0
         then
            Count := Standard.Natural (Remaining / Size);
            Remaining := Remaining mod Size;
            if Count > 0 then
               Result.Component_Count := Result.Component_Count + 1;
            end if;
         else
            Count := 0;
         end if;
      end Take;
   begin
      if Options.Largest_Unit < Options.Smallest_Unit then
         return (Status => Humanize.Status.Invalid_Options, others => <>);
      end if;

      Take (Year, Result.Years);
      Take (Month, Result.Months);
      Take (Week, Result.Weeks);
      Take (Day, Result.Days);
      Take (Hour, Result.Hours);
      Take (Minute, Result.Minutes);
      Take (Second, Result.Seconds);
      return Result;
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Format_Metadata;

   function Format
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
   is
      Result : constant Humanize.Duration_Classification.Outcome :=
        Humanize.Duration_Classification.Classify (Seconds, Options);
   begin
      case Result.Kind is
         when Humanize.Duration_Classification.Ok_Selection =>
            declare
               Slavic : constant Humanize.Status.Text_Result :=
                 Slavic_Format_Selection (Context, Seconds, Options);
            begin
               if Slavic.Status = Humanize.Status.Ok then
                  return Slavic;
               end if;
            end;
            return Humanize.I18N_Rendering.Render (Context, Result.Selection);
         when Humanize.Duration_Classification.Value_Invalid =>
            return (Status => Humanize.Status.Invalid_Value, others => <>);
         when Humanize.Duration_Classification.Options_Invalid =>
            return (Status => Humanize.Status.Invalid_Options, others => <>);
      end case;
   end Format;

   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
      Result : constant Humanize.Duration_Classification.Outcome :=
        Humanize.Duration_Classification.Classify (Seconds, Options);
   begin
      Written := 0;

      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
         return;
      end if;

      case Result.Kind is
         when Humanize.Duration_Classification.Ok_Selection =>
            declare
               Slavic : constant Humanize.Status.Text_Result :=
                 Slavic_Format_Selection (Context, Seconds, Options);
            begin
               if Slavic.Status = Humanize.Status.Ok then
                  Copy_Text (To_String (Slavic.Text), Target, Written, Status);
               else
                  Humanize.I18N_Rendering.Render_Into
                    (Context, Result.Selection, Target, Written, Status);
               end if;
            end;
         when Humanize.Duration_Classification.Value_Invalid =>
            Status := Humanize.Status.Invalid_Value;
         when Humanize.Duration_Classification.Options_Invalid =>
            Status := Humanize.Status.Invalid_Options;
      end case;
   end Format_Into;

   function Format_Components
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive;
      Options        : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
   is
      Outcome : constant Humanize.Duration_Classification.Multi_Outcome :=
        Humanize.Duration_Classification.Classify_Multi
          (Seconds, Options, Max_Components);
      Joined  : Unbounded_String;
   begin
      case Outcome.Kind is
         when Humanize.Duration_Classification.Value_Invalid =>
            return (Status => Humanize.Status.Invalid_Value, others => <>);
         when Humanize.Duration_Classification.Options_Invalid =>
            return (Status => Humanize.Status.Invalid_Options, others => <>);
         when Humanize.Duration_Classification.Ok_Selection =>
            null;
      end case;

      declare
         Parts : array (1 .. Outcome.Length) of Unbounded_String;
         --  The locale conjunction joining the final component ("and"/"og"/...).
         Conj_Result : constant Humanize.Status.Text_Result :=
           Humanize.I18N_Rendering.Render
             (Context, Humanize.Selections.No_Arg (Humanize.Messages.List_And));
         Conjunction : constant String :=
           (if Conj_Result.Status = Humanize.Status.Ok
            then To_String (Conj_Result.Text)
            else "and");
      begin
         for Index in 1 .. Outcome.Length loop
            declare
               Part : constant Humanize.Status.Text_Result :=
                 Slavic_Duration_Result
                   (Context, Outcome.Items (Index).Count, Outcome.Items (Index).Unit);
               Rendered : constant Humanize.Status.Text_Result :=
                 (if Part.Status = Humanize.Status.Ok
                  then Part
                  else Humanize.I18N_Rendering.Render
                         (Context,
                          Humanize.Duration_Classification.Component_Selection
                            (Outcome.Items (Index))));
            begin
               if Rendered.Status /= Humanize.Status.Ok then
                  return Rendered;  --  propagate the first render failure
               end if;
               Parts (Index) := Rendered.Text;
            end;
         end loop;

         --  Join: non-final components with ", ", the last with the conjunction
         --  (for example "1 hour, 1 minute and 1 second").
         if Outcome.Length = 1 then
            Joined := Parts (1);
         else
            for Index in 1 .. Outcome.Length - 1 loop
               if Index > 1 then
                  Append (Joined, ", ");
               end if;
               Append (Joined, Parts (Index));
            end loop;
            Append (Joined, " " & Conjunction & " ");
            Append (Joined, Parts (Outcome.Length));
         end if;
      end;

      return
        (Status => Humanize.Status.Ok,
         Text   => Joined,
         Key    => Humanize.Messages.No_Message);
   end Format_Components;

   procedure Format_Components_Into
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive;
      Target         : in out String;
      Written        : out Standard.Natural;
      Status         : out Humanize.Status.Status_Code;
      Options        : Duration_Options := Default_Duration_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Format_Components (Context, Seconds, Max_Components, Options);
      Text   : constant String := To_String (Result.Text);
   begin
      Written := 0;

      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
         return;
      end if;

      if Result.Status /= Humanize.Status.Ok then
         Status := Result.Status;
         return;
      end if;

      if Text'Length > Target'Length then
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
   end Format_Components_Into;

   function Unit_Suffix (Unit : Duration_Unit) return String is
   begin
      case Unit is
         when Second => return "s";
         when Minute => return "m";
         when Hour   => return "h";
         when Day    => return "d";
         when Week   => return "w";
         when Month  => return "mo";
         when Year   => return "y";
      end case;
   end Unit_Suffix;

   function Format_Compact
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive := 2;
      Options        : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Outcome : constant Humanize.Duration_Classification.Multi_Outcome :=
        Humanize.Duration_Classification.Classify_Multi
          (Seconds, Options, Max_Components);
      Result  : Unbounded_String;
   begin
      case Outcome.Kind is
         when Humanize.Duration_Classification.Value_Invalid =>
            return (Status => Humanize.Status.Invalid_Value, others => <>);
         when Humanize.Duration_Classification.Options_Invalid =>
            return (Status => Humanize.Status.Invalid_Options, others => <>);
         when Humanize.Duration_Classification.Ok_Selection =>
            null;
      end case;

      for Index in 1 .. Outcome.Length loop
         if Index > 1 then
            Append (Result, " ");
         end if;
         Append
           (Result,
            No_Space (Long_Long_Integer'Image (Outcome.Items (Index).Count))
            & Unit_Suffix (Outcome.Items (Index).Unit));
      end loop;

      return
        (Status => Humanize.Status.Ok,
         Text   => Result,
         Key    => Humanize.Messages.No_Message);
   end Format_Compact;

   procedure Format_Compact_Into
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive;
      Target         : in out String;
      Written        : out Standard.Natural;
      Status         : out Humanize.Status.Status_Code;
      Options        : Duration_Options := Default_Duration_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Format_Compact (Context, Seconds, Max_Components, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Format_Compact_Into;

   function Two_Digits (Value : Long_Long_Integer) return String is
      Image : constant String := No_Space (Long_Long_Integer'Image (Value));
   begin
      if Value < 10 then
         return "0" & Image;
      else
         return Image;
      end if;
   end Two_Digits;

   function Format_Clock
     (Context      : Humanize.Contexts.Context;
      Seconds      : Duration_Seconds;
      Always_Hours : Boolean := True)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Total   : constant Long_Long_Integer := Long_Long_Integer (Seconds);
      Hours   : Long_Long_Integer;
      Minutes : Long_Long_Integer;
      Secs    : Long_Long_Integer;
      Text    : Unbounded_String;
   begin
      if Seconds < 0 then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      Hours := Total / 3_600;
      Minutes := (Total mod 3_600) / 60;
      Secs := Total mod 60;

      if Always_Hours or else Hours > 0 then
         Append (Text, Two_Digits (Hours) & ":");
      end if;
      Append (Text, Two_Digits (Minutes) & ":" & Two_Digits (Secs));

      return
        (Status => Humanize.Status.Ok,
         Text   => Text,
         Key    => Humanize.Messages.No_Message);
   end Format_Clock;

   procedure Format_Clock_Into
     (Context      : Humanize.Contexts.Context;
      Seconds      : Duration_Seconds;
      Target       : in out String;
      Written      : out Standard.Natural;
      Status       : out Humanize.Status.Status_Code;
      Always_Hours : Boolean := True)
   is
      Result : constant Humanize.Status.Text_Result :=
        Format_Clock (Context, Seconds, Always_Hours);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Format_Clock_Into;

   function Unit_Size (Unit : Precise_Duration_Unit) return Long_Long_Integer is
   begin
      case Unit is
         when Microsecond    => return 1;
         when Millisecond    => return 1_000;
         when Precise_Second => return 1_000_000;
         when Precise_Minute => return 60 * 1_000_000;
         when Precise_Hour   => return 3_600 * 1_000_000;
         when Precise_Day    => return 86_400 * 1_000_000;
      end case;
   end Unit_Size;

   function Message_For
     (Unit : Precise_Duration_Unit)
      return Humanize.Messages.Message_Id
   is
   begin
      case Unit is
         when Microsecond =>
            return Humanize.Messages.Duration_Unit_Microsecond;
         when Millisecond =>
            return Humanize.Messages.Duration_Unit_Millisecond;
         when Precise_Second =>
            return Humanize.Messages.Duration_Unit_Second;
         when Precise_Minute =>
            return Humanize.Messages.Duration_Unit_Minute;
         when Precise_Hour =>
            return Humanize.Messages.Duration_Unit_Hour;
         when Precise_Day =>
            return Humanize.Messages.Duration_Unit_Day;
      end case;
   end Message_For;

   function Render_Precise_Component
     (Context   : Humanize.Contexts.Context;
      Component : Precise_Component)
      return Humanize.Status.Text_Result
   is
   begin
      declare
         Slavic : constant Humanize.Status.Text_Result :=
           Slavic_Precise_Result (Context, Component);
      begin
         if Slavic.Status = Humanize.Status.Ok then
            return Slavic;
         end if;
      end;

      return Humanize.I18N_Rendering.Render
        (Context,
         Humanize.Selections.Count
           (Message_For (Component.Unit),
            Humanize.Selections.Count_Value (Component.Count)));
   end Render_Precise_Component;

   function Format_Precise
     (Context           : Humanize.Contexts.Context;
      Microseconds      : Duration_Microseconds;
      Max_Components    : Positive;
      Minimum_Unit      : Precise_Duration_Unit)
      return Humanize.Status.Text_Result
   is
   begin
      return Format_Precise
        (Context, Microseconds, Max_Components,
         (Minimum_Unit     => Minimum_Unit,
          Suppressed_Units => [others => False]));
   end Format_Precise;

   function Format_Precise
     (Context           : Humanize.Contexts.Context;
      Microseconds      : Duration_Microseconds;
      Max_Components    : Positive;
      Options           : Precise_Duration_Options :=
        Default_Precise_Duration_Options)
      return Humanize.Status.Text_Result
   is
      Remaining : Long_Long_Integer;
      Items     : Precise_Component_List (1 .. 6);
      Length    : Standard.Natural := 0;
   begin
      if Microseconds < 0 then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      Remaining := Long_Long_Integer (Microseconds);

      for Unit in reverse Precise_Duration_Unit loop
         if Unit >= Options.Minimum_Unit
           and then not Options.Suppressed_Units (Unit)
         then
            declare
               Size  : constant Long_Long_Integer := Unit_Size (Unit);
               Count : constant Long_Long_Integer := Remaining / Size;
            begin
               if Count > 0 or else (Remaining = 0 and then Length = 0) then
                  Length := Length + 1;
                  Items (Length) := (Unit => Unit, Count => Count);
                  Remaining := Remaining - Count * Size;
                  exit when Length = Max_Components;
               end if;
            end;
         end if;
      end loop;

      if Length = 0 then
         Length := 1;
         Items (1) := (Unit => Options.Minimum_Unit, Count => 0);
      end if;

      declare
         Parts : Humanize.Lists.Text_List (1 .. Length);
      begin
         for Index in 1 .. Length loop
            declare
               Part : constant Humanize.Status.Text_Result :=
                 Render_Precise_Component (Context, Items (Index));
            begin
               if Part.Status /= Humanize.Status.Ok then
                  return Part;
               end if;
               Parts (Index) := Part.Text;
            end;
         end loop;

         return Humanize.Lists.Format (Context, Parts);
      end;
   end Format_Precise;

   procedure Format_Precise_Into
     (Context           : Humanize.Contexts.Context;
      Microseconds      : Duration_Microseconds;
      Max_Components    : Positive;
      Target            : in out String;
      Written           : out Standard.Natural;
      Status            : out Humanize.Status.Status_Code;
      Minimum_Unit      : Precise_Duration_Unit)
   is
   begin
      Format_Precise_Into
        (Context, Microseconds, Max_Components, Target, Written, Status,
         (Minimum_Unit     => Minimum_Unit,
          Suppressed_Units => [others => False]));
   end Format_Precise_Into;

   procedure Format_Precise_Into
     (Context           : Humanize.Contexts.Context;
      Microseconds      : Duration_Microseconds;
      Max_Components    : Positive;
      Target            : in out String;
      Written           : out Standard.Natural;
      Status            : out Humanize.Status.Status_Code;
      Options           : Precise_Duration_Options :=
        Default_Precise_Duration_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Format_Precise (Context, Microseconds, Max_Components, Options);
      Text   : constant String := To_String (Result.Text);
   begin
      Written := 0;

      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
         return;
      end if;

      if Result.Status /= Humanize.Status.Ok then
         Status := Result.Status;
         return;
      end if;

      if Text'Length > Target'Length then
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
   end Format_Precise_Into;

   function Format_Range
     (Context : Humanize.Contexts.Context;
      Low     : Duration_Seconds;
      High    : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
   is
      Left  : constant Humanize.Status.Text_Result :=
        Format (Context, Low, Options);
      Right : constant Humanize.Status.Text_Result :=
        Format (Context, High, Options);
   begin
      if Low < 0 or else High < 0 or else High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      elsif Left.Status /= Humanize.Status.Ok then
         return Left;
      elsif Right.Status /= Humanize.Status.Ok then
         return Right;
      else
         return
           (Status => Humanize.Status.Ok,
            Text   => To_Unbounded_String
              (To_String (Left.Text) & "-" & To_String (Right.Text)),
            Key    => Humanize.Messages.No_Message);
      end if;
   end Format_Range;

   function Countdown
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Format (Context, Seconds, Options);
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String (To_String (Base.Text) & " remaining"),
         Key    => Humanize.Messages.No_Message);
   end Countdown;

   function SLA_Window
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Format (Context, Seconds, Options);
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String ("within " & To_String (Base.Text)),
         Key    => Humanize.Messages.No_Message);
   end SLA_Window;

   function Duration_Text
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options)
      return Humanize.Status.Text_Result is
   begin
      if Seconds = 0 then
         return
           (Status => Humanize.Status.Ok,
            Text   => To_Unbounded_String ("just now"),
            Key    => Humanize.Messages.No_Message);
      else
         return Format (Context, Seconds, Options);
      end if;
   end Duration_Text;

   function With_Base
     (Base   : Humanize.Status.Text_Result;
      Prefix : String := "";
      Suffix : String := "")
      return Humanize.Status.Text_Result is
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String (Prefix & To_String (Base.Text) & Suffix),
         Key    => Humanize.Messages.No_Message);
   end With_Base;

   function Interval
     (Context : Humanize.Contexts.Context;
      Low     : Duration_Seconds;
      High    : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options;
      Phrase  : Duration_Phrase_Options := Default_Duration_Phrase_Options)
      return Humanize.Status.Text_Result
   is
      Left  : constant Humanize.Status.Text_Result := Format (Context, Low, Options);
      Right : constant Humanize.Status.Text_Result := Format (Context, High, Options);
      Prefix : constant String :=
        (case Phrase.Style is
            when Natural_Wording => "between ",
            when Compact_Label => "");
      Joiner : constant String :=
        (case Phrase.Style is
            when Natural_Wording => " and ",
            when Compact_Label => "-");
   begin
      if Low < 0 or else High < 0 or else High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      elsif Left.Status /= Humanize.Status.Ok then
         return Left;
      elsif Right.Status /= Humanize.Status.Ok then
         return Right;
      else
         return
           (Status => Humanize.Status.Ok,
            Text   => To_Unbounded_String
              (Prefix & To_String (Left.Text) & Joiner & To_String (Right.Text)),
            Key    => Humanize.Messages.No_Message);
      end if;
   end Interval;

   function Next_Window
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options;
      Phrase  : Duration_Phrase_Options := Default_Duration_Phrase_Options)
      return Humanize.Status.Text_Result is
   begin
      return With_Base
        (Format (Context, Seconds, Options),
         (case Phrase.Style is
             when Natural_Wording => "next ",
             when Compact_Label => ""));
   end Next_Window;

   function Age
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result is
   begin
      return With_Base (Format (Context, Seconds, Options), Suffix => " old");
   end Age;

   function Stale_For
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result is
   begin
      return With_Base (Format (Context, Seconds, Options), "stale for ");
   end Stale_For;

   function Expires_In
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result is
   begin
      return With_Base (Format (Context, Seconds, Options), "expires in ");
   end Expires_In;

   function Modified_Ago
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result is
   begin
      return With_Base (Duration_Text (Context, Seconds, Options), "modified ",
                        (if Seconds = 0 then "" else " ago"));
   end Modified_Ago;

   function Synced_Ago
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result is
   begin
      return With_Base (Duration_Text (Context, Seconds, Options), "synced ",
                        (if Seconds = 0 then "" else " ago"));
   end Synced_Ago;

   function Backup_Age
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result is
   begin
      return With_Base (Format (Context, Seconds, Options), "backup is ", " old");
   end Backup_Age;

   function Complete_Count
     (Context  : Humanize.Contexts.Context;
      Done     : Standard.Natural;
      Total    : Standard.Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String
           (No_Space (Standard.Natural'Image (Done)) & " of "
            & No_Space (Standard.Natural'Image (Total)) & " complete"),
         Key    => Humanize.Messages.No_Message);
   end Complete_Count;

   function Percent_Complete
     (Context : Humanize.Contexts.Context;
      Percent : Long_Float)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String
           (Humanize.Decimal_Images.Decimal_Image (Percent, 1, True)
            & "% complete"),
         Key    => Humanize.Messages.No_Message);
   end Percent_Complete;

   function Retry_In
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result is
   begin
      return With_Base (Format (Context, Seconds, Options), "retrying in ");
   end Retry_In;

   function Step_Count
     (Context : Humanize.Contexts.Context;
      Step    : Standard.Natural;
      Total   : Standard.Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           ("step " & No_Space (Standard.Natural'Image (Step)) & " of "
            & No_Space (Standard.Natural'Image (Total))),
         Key => Humanize.Messages.No_Message);
   end Step_Count;

   function Attempt_Count
     (Context : Humanize.Contexts.Context;
      Attempt : Standard.Natural;
      Total   : Standard.Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           ("attempt " & No_Space (Standard.Natural'Image (Attempt)) & " of "
            & No_Space (Standard.Natural'Image (Total))),
         Key => Humanize.Messages.No_Message);
   end Attempt_Count;

   function ETA
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result is
   begin
      return With_Base (Format (Context, Seconds, Options), "ETA ");
   end ETA;

   function Throughput_Remaining
     (Context   : Humanize.Contexts.Context;
      Remaining : Standard.Natural;
      Rate      : Standard.Natural;
      Unit_Name : String)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Noun : constant String :=
        (if Remaining = 1 then Unit_Name else Unit_Name & "s");
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (No_Space (Standard.Natural'Image (Remaining)) & " " & Noun
            & " remaining at " & No_Space (Standard.Natural'Image (Rate)) & " "
            & Unit_Name & "/s"),
         Key => Humanize.Messages.No_Message);
   end Throughput_Remaining;

   function Progress_Bar
     (Context : Humanize.Contexts.Context;
      Done    : Standard.Natural;
      Total   : Positive;
      Width   : Positive := 10)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Filled : constant Standard.Natural := Standard.Natural'Min (Width, Done * Width / Total);
      Percent : constant Standard.Natural := Standard.Natural'Min (100, Done * 100 / Total);
      Text : Unbounded_String;
   begin
      Append (Text, "[");
      for Index in 1 .. Width loop
         Append (Text, (if Index <= Filled then "#" else "-"));
      end loop;
      Append
        (Text, "] " & No_Space (Standard.Natural'Image (Percent)) & "%");
      return
        (Status => Humanize.Status.Ok,
         Text => Text,
         Key => Humanize.Messages.No_Message);
   end Progress_Bar;

   function Accessible_Progress
     (Context : Humanize.Contexts.Context;
      Done    : Standard.Natural;
      Total   : Positive)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Percent : constant Standard.Natural := Standard.Natural'Min (100, Done * 100 / Total);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (No_Space (Standard.Natural'Image (Done)) & " of "
            & No_Space (Positive'Image (Total)) & " complete, "
            & No_Space (Standard.Natural'Image (Percent)) & " percent"),
         Key => Humanize.Messages.No_Message);
   end Accessible_Progress;

   function Business_Days
     (Context : Humanize.Contexts.Context;
      Days    : Standard.Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (No_Space (Standard.Natural'Image (Days)) & " business "
            & (if Days = 1 then "day" else "days")),
         Key => Humanize.Messages.No_Message);
   end Business_Days;

   function Working_Hours
     (Context : Humanize.Contexts.Context;
      Hours   : Standard.Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           (No_Space (Standard.Natural'Image (Hours)) & " working "
            & (if Hours = 1 then "hour" else "hours")),
         Key => Humanize.Messages.No_Message);
   end Working_Hours;

   function End_Of_Week
     (Context : Humanize.Contexts.Context)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String ("end of week"),
         Key => Humanize.Messages.No_Message);
   end End_Of_Week;

   function End_Of_Month
     (Context : Humanize.Contexts.Context)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String ("end of month"),
         Key => Humanize.Messages.No_Message);
   end End_Of_Month;

   function End_Of_Quarter
     (Context : Humanize.Contexts.Context)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String ("end of quarter"),
         Key => Humanize.Messages.No_Message);
   end End_Of_Quarter;

   procedure Format_Range_Into
     (Context : Humanize.Contexts.Context;
      Low     : Duration_Seconds;
      High    : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result
        (Format_Range (Context, Low, High, Options), Target, Written, Status);
   end Format_Range_Into;

   procedure Countdown_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result (Countdown (Context, Seconds, Options), Target, Written, Status);
   end Countdown_Into;

   procedure SLA_Window_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result (SLA_Window (Context, Seconds, Options), Target, Written, Status);
   end SLA_Window_Into;

   procedure Interval_Into
     (Context : Humanize.Contexts.Context;
      Low     : Duration_Seconds;
      High    : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options;
      Phrase  : Duration_Phrase_Options := Default_Duration_Phrase_Options)
   is
   begin
      Copy_Result
        (Interval (Context, Low, High, Options, Phrase), Target, Written, Status);
   end Interval_Into;

   procedure Age_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result (Age (Context, Seconds, Options), Target, Written, Status);
   end Age_Into;

   procedure Complete_Count_Into
     (Context  : Humanize.Contexts.Context;
      Done     : Standard.Natural;
      Total    : Standard.Natural;
      Target   : in out String;
      Written  : out Standard.Natural;
      Status   : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Complete_Count (Context, Done, Total), Target, Written, Status);
   end Complete_Count_Into;

   procedure Next_Window_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options;
      Phrase  : Duration_Phrase_Options := Default_Duration_Phrase_Options)
   is
   begin
      Copy_Result
        (Next_Window (Context, Seconds, Options, Phrase), Target, Written, Status);
   end Next_Window_Into;

   procedure Stale_For_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result (Stale_For (Context, Seconds, Options), Target, Written, Status);
   end Stale_For_Into;

   procedure Expires_In_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result (Expires_In (Context, Seconds, Options), Target, Written, Status);
   end Expires_In_Into;

   procedure Modified_Ago_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result (Modified_Ago (Context, Seconds, Options), Target, Written, Status);
   end Modified_Ago_Into;

   procedure Synced_Ago_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result (Synced_Ago (Context, Seconds, Options), Target, Written, Status);
   end Synced_Ago_Into;

   procedure Backup_Age_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result (Backup_Age (Context, Seconds, Options), Target, Written, Status);
   end Backup_Age_Into;

   procedure Percent_Complete_Into
     (Context : Humanize.Contexts.Context;
      Percent : Long_Float;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Percent_Complete (Context, Percent), Target, Written, Status);
   end Percent_Complete_Into;

   procedure Retry_In_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result (Retry_In (Context, Seconds, Options), Target, Written, Status);
   end Retry_In_Into;

   procedure Step_Count_Into
     (Context : Humanize.Contexts.Context;
      Step    : Standard.Natural;
      Total   : Standard.Natural;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Step_Count (Context, Step, Total), Target, Written, Status);
   end Step_Count_Into;

   procedure Attempt_Count_Into
     (Context : Humanize.Contexts.Context;
      Attempt : Standard.Natural;
      Total   : Standard.Natural;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Attempt_Count (Context, Attempt, Total), Target, Written, Status);
   end Attempt_Count_Into;

   procedure ETA_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
   begin
      Copy_Result (ETA (Context, Seconds, Options), Target, Written, Status);
   end ETA_Into;

   procedure Throughput_Remaining_Into
     (Context   : Humanize.Contexts.Context;
      Remaining : Standard.Natural;
      Rate      : Standard.Natural;
      Unit_Name : String;
      Target    : in out String;
      Written   : out Standard.Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Throughput_Remaining (Context, Remaining, Rate, Unit_Name),
         Target, Written, Status);
   end Throughput_Remaining_Into;

   procedure Progress_Bar_Into
     (Context : Humanize.Contexts.Context;
      Done    : Standard.Natural;
      Total   : Positive;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code;
      Width   : Positive := 10)
   is
   begin
      Copy_Result
        (Progress_Bar (Context, Done, Total, Width), Target, Written, Status);
   end Progress_Bar_Into;

   procedure Accessible_Progress_Into
     (Context : Humanize.Contexts.Context;
      Done    : Standard.Natural;
      Total   : Positive;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Accessible_Progress (Context, Done, Total), Target, Written, Status);
   end Accessible_Progress_Into;

   procedure Business_Days_Into
     (Context : Humanize.Contexts.Context;
      Days    : Standard.Natural;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Business_Days (Context, Days), Target, Written, Status);
   end Business_Days_Into;

   procedure Working_Hours_Into
     (Context : Humanize.Contexts.Context;
      Hours   : Standard.Natural;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Working_Hours (Context, Hours), Target, Written, Status);
   end Working_Hours_Into;

   procedure End_Of_Week_Into
     (Context : Humanize.Contexts.Context;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (End_Of_Week (Context), Target, Written, Status);
   end End_Of_Week_Into;

   procedure End_Of_Month_Into
     (Context : Humanize.Contexts.Context;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (End_Of_Month (Context), Target, Written, Status);
   end End_Of_Month_Into;

   procedure End_Of_Quarter_Into
     (Context : Humanize.Contexts.Context;
      Target  : in out String;
      Written : out Standard.Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (End_Of_Quarter (Context), Target, Written, Status);
   end End_Of_Quarter_Into;

end Humanize.Durations.Formatting;
