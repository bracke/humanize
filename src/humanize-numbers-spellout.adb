with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Contexts;
with Humanize.Decimal_Images;
with Humanize.Locales;
with Humanize.Numbers.Spellout_Data;

package body Humanize.Numbers.Spellout is
   use type Humanize.Status.Status_Code;

   function Natural_Text (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text
     (Result : Humanize.Status.Text_Result)
      return String
      renames Humanize.Bounded_Text.Result_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Locale_Long_Word
     (Locale : String;
      Value  : Long_Long_Integer)
      return String
      renames Humanize.Numbers.Spellout_Data.Locale_Long_Word;

   function Has_Generated_Spellout (Locale : String) return Boolean
      renames Humanize.Numbers.Spellout_Data.Has_Generated_Spellout;

   function Small_Locale_Word
     (Locale : String;
      Value  : Natural)
      return String
      renames Humanize.Numbers.Spellout_Data.Small_Locale_Word;

   function Digit_Value (Digit : Character) return Natural
      renames Humanize.Bounded_Text.Digit_Value;

   function Is_Digit (Digit : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;

   function U (Code : Natural) return String
      renames Humanize.Bounded_Text.UTF8_Code_Point;

   U_A_Ring : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A5#);
   U_A_Umlaut : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A4#);
   U_C_Cedilla : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A7#);
   U_E_Acute : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A9#);
   U_E_Grave : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A8#);
   U_I_Dotless : constant String :=
     Character'Val (16#C4#) & Character'Val (16#B1#);
   U_O_Slash : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B8#);
   U_O_Umlaut : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B6#);
   U_S_Cedilla : constant String :=
     Character'Val (16#C5#) & Character'Val (16#9F#);
   U_U_Umlaut : constant String :=
     Character'Val (16#C3#) & Character'Val (16#BC#);

   function Under_Thousand (Value : Natural) return String is
      function Ones (Item : Natural) return String is
      begin
         case Item is
            when 0 => return "zero";
            when 1 => return "one";
            when 2 => return "two";
            when 3 => return "three";
            when 4 => return "four";
            when 5 => return "five";
            when 6 => return "six";
            when 7 => return "seven";
            when 8 => return "eight";
            when 9 => return "nine";
            when 10 => return "ten";
            when 11 => return "eleven";
            when 12 => return "twelve";
            when 13 => return "thirteen";
            when 14 => return "fourteen";
            when 15 => return "fifteen";
            when 16 => return "sixteen";
            when 17 => return "seventeen";
            when 18 => return "eighteen";
            when others => return "nineteen";
         end case;
      end Ones;

      function Tens (Item : Natural) return String is
      begin
         case Item is
            when 2 => return "twenty";
            when 3 => return "thirty";
            when 4 => return "forty";
            when 5 => return "fifty";
            when 6 => return "sixty";
            when 7 => return "seventy";
            when 8 => return "eighty";
            when others => return "ninety";
         end case;
      end Tens;

      Hundreds : constant Natural := Value / 100;
      Rest     : constant Natural := Value mod 100;
   begin
      if Value < 20 then
         return Ones (Value);
      elsif Value < 100 then
         if Value mod 10 = 0 then
            return Tens (Value / 10);
         else
            return Tens (Value / 10) & "-" & Ones (Value mod 10);
         end if;
      elsif Rest = 0 then
         return Ones (Hundreds) & " hundred";
      else
         return Ones (Hundreds) & " hundred " & Under_Thousand (Rest);
      end if;
   end Under_Thousand;

   function Cardinal_Text (Value : Natural) return String is
      Thousands : constant Natural := Value / 1_000;
      Rest      : constant Natural := Value mod 1_000;
   begin
      if Value < 1_000 then
         return Under_Thousand (Value);
      elsif Value < 1_000_000 then
         if Rest = 0 then
            return Under_Thousand (Thousands) & " thousand";
         else
            return Under_Thousand (Thousands) & " thousand "
              & Under_Thousand (Rest);
         end if;
      else
         return Natural_Text (Value);
      end if;
   end Cardinal_Text;

   function Scale_Name (Index : Positive) return String is
   begin
      case Index is
         when 1 => return "thousand";
         when 2 => return "million";
         when 3 => return "billion";
         when 4 => return "trillion";
         when 5 => return "quadrillion";
         when others => return "quintillion";
      end case;
   end Scale_Name;

   function Cardinal_Long_Text (Value : Long_Long_Integer) return String is
      type Segment_Array is array (Positive range <>) of Natural;
      Segments : Segment_Array (1 .. 7) := [others => 0];
      Length   : Natural := 0;
      Rest     : Long_Long_Integer := Value;
      Result   : Unbounded_String;
   begin
      if Value < 0 then
         return "minus " & Cardinal_Long_Text (-Value);
      elsif Value < 1_000_000 then
         return Cardinal_Text (Natural (Value));
      end if;

      while Rest > 0 and then Length < Segments'Length loop
         Length := Length + 1;
         Segments (Length) := Natural (Rest mod 1_000);
         Rest := Rest / 1_000;
      end loop;

      if Rest > 0 then
         return Humanize.Bounded_Text.Image (Value);
      end if;

      for Index in reverse 1 .. Length loop
         if Segments (Index) /= 0 then
            if Ada.Strings.Unbounded.Length (Result) > 0 then
               Append (Result, " ");
            end if;
            Append (Result, Under_Thousand (Segments (Index)));
            if Index > 1 then
               Append (Result, " " & Scale_Name (Index - 1));
            end if;
         end if;
      end loop;

      return To_String (Result);
   end Cardinal_Long_Text;

   function Cardinal
     (Context : Humanize.Contexts.Context;
      Value   : Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text (Cardinal_Text (Value));
   end Cardinal;

   procedure Cardinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Cardinal (Context, Value);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Cardinal_Into;

   function Signed_Cardinal
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if Value = Long_Long_Integer'First then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      return Ok_Text (Cardinal_Long_Text (Value));
   end Signed_Cardinal;

   procedure Signed_Cardinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Signed_Cardinal (Context, Value);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Signed_Cardinal_Into;

   function Locale_Cardinal
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result
   is
      Locale    : constant String :=
        Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context));
      Abs_Value : constant Long_Long_Integer := abs Value;
      Word      : constant String := Locale_Long_Word (Locale, Abs_Value);
   begin
      if Word'Length = 0 then
         return Signed_Cardinal (Context, Value);
      elsif Value < 0 then
         return Ok_Text
           ((if Locale = "fr" then "moins " else "minus ") & Word);
      else
         return Ok_Text (Word);
      end if;
   end Locale_Cardinal;

   procedure Locale_Cardinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Locale_Cardinal (Context, Value);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Locale_Cardinal_Into;

   pragma Style_Checks (Off);

   function Locale_Digit_Word
     (Locale : String;
      Digit  : Character)
      return String
   is
   begin
      if not Is_Digit (Digit) then
         return "";
      end if;

      return
        Small_Locale_Word
          (Locale, Digit_Value (Digit));
   end Locale_Digit_Word;

   function Locale_Decimal_Marker_Word (Locale : String) return String is
   begin
      if Locale = "de" or else Locale = "da" or else Locale = "nl" then
         return "komma";
      elsif Locale = "fr" then
         return "virgule";
      elsif Locale = "es" then
         return "coma";
      elsif Locale = "it" then
         return "virgola";
      elsif Locale = "pt" then
         return "virgula";
      elsif Locale = "sv" or else Humanize.Locales.Is_Norwegian (Locale) then
         return "komma";
      elsif Locale = "fi" then
         return "pilkku";
      elsif Locale = "tr" then
         return "virg" & U_U_Umlaut & "l";
      elsif Locale = "pl" then
         return "przecinek";
      elsif Locale = "cs" then
         return U (16#10D#) & U (16#E1#) & "rka";
      elsif Locale = "ru" or else Locale = "uk" then
         return U (16#437#) & U (16#430#) & U (16#43F#) & U (16#44F#) & U (16#442#) & U (16#430#) & U (16#44F#);
      elsif Locale = "ja" then
         return U (16#70B9#);
      elsif Locale = "ko" then
         return U (16#C810#);
      elsif Locale = "zh" then
         return U (16#70B9#);
      elsif Locale = "ar" then
         return U (16#641#) & U (16#627#) & U (16#635#) & U (16#644#) & U (16#629#);
      elsif Locale = "hi" then
         return U (16#926#) & U (16#936#) & U (16#92E#) & U (16#932#) & U (16#935#);
      else
         return "point";
      end if;
   end Locale_Decimal_Marker_Word;

   function Decimal_Words
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Fraction_Digits : Natural := 2)
      return Humanize.Status.Text_Result
   is
      Locale : constant String := Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context));
      Image : constant String :=
        Humanize.Decimal_Images.Decimal_Image
          (abs Value, Fraction_Digits, False);
      Dot : Natural := 0;
      Result : Unbounded_String;
   begin
      if Fraction_Digits > 9 then
         return (Status => Humanize.Status.Invalid_Options, others => <>);
      end if;

      for Index in Image'Range loop
         if Image (Index) = '.' then
            Dot := Index;
            exit;
         end if;
      end loop;

      if Value < 0.0 then
         Append
           (Result,
            (if Locale = "fr" then "moins " else "minus "));
      end if;

      if Dot = 0 then
         Append
           (Result,
            Result_Text
              (Locale_Cardinal
                 (Context, Long_Long_Integer'Value (Image))));
      else
         Append
           (Result,
            Result_Text
              (Locale_Cardinal
                 (Context,
                  Long_Long_Integer'Value (Image (Image'First .. Dot - 1)))));
         Append (Result, " " & Locale_Decimal_Marker_Word (Locale));
         for Index in Dot + 1 .. Image'Last loop
            Append (Result, " " & Locale_Digit_Word (Locale, Image (Index)));
         end loop;
      end if;

      return Ok_Text (To_String (Result));
   end Decimal_Words;

   procedure Decimal_Words_Into
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Fraction_Digits : Natural;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Decimal_Words (Context, Value, Fraction_Digits);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Decimal_Words_Into;

   function Fraction_Denominator_Word
     (Denominator : Positive;
      Plural      : Boolean)
      return String
   is
   begin
      case Denominator is
         when 2 => return (if Plural then "halves" else "half");
         when 3 => return (if Plural then "thirds" else "third");
         when 4 => return (if Plural then "quarters" else "quarter");
         when 5 => return (if Plural then "fifths" else "fifth");
         when 6 => return (if Plural then "sixths" else "sixth");
         when 7 => return (if Plural then "sevenths" else "seventh");
         when 8 => return (if Plural then "eighths" else "eighth");
         when 9 => return (if Plural then "ninths" else "ninth");
         when 10 => return (if Plural then "tenths" else "tenth");
         when others => return "";
      end case;
   end Fraction_Denominator_Word;

   function Locale_Fraction_Denominator_Word
     (Locale      : String;
      Denominator : Positive;
      Plural      : Boolean)
      return String
   is
   begin
      if Locale = "de" then
         case Denominator is
            when 2 => return (if Plural then "Halbe" else "Halbes");
            when 3 => return "Drittel";
            when 4 => return "Viertel";
            when 5 => return "F" & U_U_Umlaut & "nftel";
            when 6 => return "Sechstel";
            when 7 => return "Siebtel";
            when 8 => return "Achtel";
            when 9 => return "Neuntel";
            when 10 => return "Zehntel";
            when others => return "";
         end case;
      elsif Locale = "fr" then
         case Denominator is
            when 2 => return (if Plural then "demis" else "demi");
            when 3 => return (if Plural then "tiers" else "tiers");
            when 4 => return (if Plural then "quarts" else "quart");
            when 5 => return "cinqui" & U_E_Grave & "me" & (if Plural then "s" else "");
            when 6 => return "sixi" & U_E_Grave & "me" & (if Plural then "s" else "");
            when 7 => return "septi" & U_E_Grave & "me" & (if Plural then "s" else "");
            when 8 => return "huiti" & U_E_Grave & "me" & (if Plural then "s" else "");
            when 9 => return "neuvi" & U_E_Grave & "me" & (if Plural then "s" else "");
            when 10 => return "dixi" & U_E_Grave & "me" & (if Plural then "s" else "");
            when others => return "";
         end case;
      elsif Locale = "da" then
         case Denominator is
            when 2 => return (if Plural then "halve" else "halv");
            when 3 => return "tredjedele";
            when 4 => return "fjerdedele";
            when 5 => return "femtedele";
            when 6 => return "sjettedele";
            when 7 => return "syvendedele";
            when 8 => return "ottendedele";
            when 9 => return "niendedele";
            when 10 => return "tiendedele";
            when others => return "";
         end case;
      elsif Locale = "es" then
         case Denominator is
            when 2 => return (if Plural then "medios" else "medio");
            when 3 => return (if Plural then "tercios" else "tercio");
            when 4 => return (if Plural then "cuartos" else "cuarto");
            when 5 => return (if Plural then "quintos" else "quinto");
            when 6 => return (if Plural then "sextos" else "sexto");
            when 7 => return "s" & U_E_Acute & "ptimo" & (if Plural then "s" else "");
            when 8 => return (if Plural then "octavos" else "octavo");
            when 9 => return (if Plural then "novenos" else "noveno");
            when 10 => return "d" & U_E_Acute & "cimo" & (if Plural then "s" else "");
            when others => return "";
         end case;
      elsif Locale = "it" then
         case Denominator is
            when 2 => return (if Plural then "mezzi" else "mezzo");
            when 3 => return (if Plural then "terzi" else "terzo");
            when 4 => return (if Plural then "quarti" else "quarto");
            when 5 => return (if Plural then "quinti" else "quinto");
            when 6 => return (if Plural then "sesti" else "sesto");
            when 7 => return (if Plural then "settimi" else "settimo");
            when 8 => return (if Plural then "ottavi" else "ottavo");
            when 9 => return (if Plural then "noni" else "nono");
            when 10 => return (if Plural then "decimi" else "decimo");
            when others => return "";
         end case;
      elsif Locale = "pt" then
         case Denominator is
            when 2 => return (if Plural then "meios" else "meio");
            when 3 => return "ter" & U_C_Cedilla & "o" & (if Plural then "s" else "");
            when 4 => return (if Plural then "quartos" else "quarto");
            when 5 => return (if Plural then "quintos" else "quinto");
            when 6 => return (if Plural then "sextos" else "sexto");
            when 7 => return "s" & U_E_Acute & "timo" & (if Plural then "s" else "");
            when 8 => return (if Plural then "oitavos" else "oitavo");
            when 9 => return (if Plural then "nonos" else "nono");
            when 10 => return "d" & U_E_Acute & "cimo" & (if Plural then "s" else "");
            when others => return "";
         end case;
      elsif Locale = "nl" then
         case Denominator is
            when 2 => return (if Plural then "helften" else "helft");
            when 3 => return "derden";
            when 4 => return "kwarten";
            when 5 => return "vijfden";
            when 6 => return "zesden";
            when 7 => return "zevenden";
            when 8 => return "achtsten";
            when 9 => return "negenden";
            when 10 => return "tienden";
            when others => return "";
         end case;
      elsif Locale = "sv" then
         case Denominator is
            when 2 => return (if Plural then "halvor" else "halv");
            when 3 => return (if Plural then "tredjedelar" else "tredjedel");
            when 4 => return (if Plural then "fj" & U_A_Umlaut & "rdedelar" else "fj" & U_A_Umlaut & "rdedel");
            when 5 => return (if Plural then "femtedelar" else "femtedel");
            when 6 => return (if Plural then "sj" & U_A_Umlaut & "ttedelar" else "sj" & U_A_Umlaut & "ttedel");
            when 7 => return (if Plural then "sjundedelar" else "sjundedel");
            when 8 => return (if Plural then U_A_Ring & "ttondelar" else U_A_Ring & "ttondel");
            when 9 => return (if Plural then "niondelar" else "niondel");
            when 10 => return (if Plural then "tiondelar" else "tiondel");
            when others => return "";
         end case;
      elsif Humanize.Locales.Is_Norwegian (Locale) then
         case Denominator is
            when 2 => return (if Plural then "halvdeler" else "halv");
            when 3 => return (if Plural then "tredjedeler" else "tredjedel");
            when 4 => return (if Plural then "fjerdedeler" else "fjerdedel");
            when 5 => return (if Plural then "femtedeler" else "femtedel");
            when 6 => return (if Plural then "sjettedeler" else "sjettedel");
            when 7 => return (if Plural then "sjuendedeler" else "sjuendedel");
            when 8 => return (if Plural then U_A_Ring & "ttendedeler" else U_A_Ring & "ttendedel");
            when 9 => return (if Plural then "niendedeler" else "niendedel");
            when 10 => return (if Plural then "tideler" else "tidel");
            when others => return "";
         end case;
      elsif Locale = "fi" then
         case Denominator is
            when 2 => return "puoli" & (if Plural then "kasta" else "");
            when 3 => return "kolmasosa" & (if Plural then "a" else "");
            when 4 => return "nelj" & U_A_Umlaut & "sosa" & (if Plural then "a" else "");
            when 5 => return "viidesosa" & (if Plural then "a" else "");
            when 6 => return "kuudesosa" & (if Plural then "a" else "");
            when 7 => return "seitsem" & U_A_Umlaut & "sosa" & (if Plural then "a" else "");
            when 8 => return "kahdeksasosa" & (if Plural then "a" else "");
            when 9 => return "yhdeks" & U_A_Umlaut & "sosa" & (if Plural then "a" else "");
            when 10 => return "kymmenesosa" & (if Plural then "a" else "");
            when others => return "";
         end case;
      elsif Locale = "tr" then
         case Denominator is
            when 2 => return (if Plural then "yar" & U_I_Dotless & "mlar" else "yar" & U_I_Dotless & "m");
            when 3 => return U_U_Umlaut & U_C_Cedilla & "te";
            when 4 => return "d" & U_O_Umlaut & "rtte";
            when 5 => return "be" & U_S_Cedilla & "te";
            when 6 => return "alt" & U_I_Dotless & "da";
            when 7 => return "yedide";
            when 8 => return "sekizde";
            when 9 => return "dokuzda";
            when 10 => return "onda";
            when others => return "";
         end case;
      elsif Locale = "pl" then
         case Denominator is
            when 2 => return (if Plural then "po" & U (16#142#) & U (16#F3#) & "wki" else "po" & U (16#142#) & U (16#F3#) & "wka");
            when 3 => return "trzecie";
            when 4 => return "czwarte";
            when 5 => return "pi" & U (16#105#) & "te";
            when 6 => return "sz" & U (16#F3#) & "ste";
            when 7 => return "si" & U (16#F3#) & "dme";
            when 8 => return U (16#F3#) & "sme";
            when 9 => return "dziewi" & U (16#105#) & "te";
            when 10 => return "dziesi" & U (16#105#) & "te";
            when others => return "";
         end case;
      elsif Locale = "cs" then
         case Denominator is
            when 2 => return (if Plural then "poloviny" else "polovina");
            when 3 => return "t" & U (16#159#) & "etiny";
            when 4 => return U (16#10D#) & "tvrtiny";
            when 5 => return "p" & U (16#11B#) & "tiny";
            when 6 => return U (16#161#) & "estiny";
            when 7 => return "sedminy";
            when 8 => return "osminy";
            when 9 => return "dev" & U (16#11B#) & "tiny";
            when 10 => return "desetiny";
            when others => return "";
         end case;
      elsif Locale = "ru" then
         case Denominator is
            when 2 => return U (16#43F#) & U (16#43E#) & U (16#43B#) & U (16#43E#) & U (16#432#) & U (16#438#) & U (16#43D#) & U (16#44B#);
            when 3 => return U (16#442#) & U (16#440#) & U (16#435#) & U (16#442#) & U (16#438#);
            when 4 => return U (16#447#) & U (16#435#) & U (16#442#) & U (16#432#) & U (16#435#) & U (16#440#) & U (16#442#) & U (16#438#);
            when 5 => return U (16#43F#) & U (16#44F#) & U (16#442#) & U (16#44B#) & U (16#435#);
            when 6 => return U (16#448#) & U (16#435#) & U (16#441#) & U (16#442#) & U (16#44B#) & U (16#435#);
            when 7 => return U (16#441#) & U (16#435#) & U (16#434#) & U (16#44C#) & U (16#43C#) & U (16#44B#) & U (16#435#);
            when 8 => return U (16#432#) & U (16#43E#) & U (16#441#) & U (16#44C#) & U (16#43C#) & U (16#44B#) & U (16#435#);
            when 9 => return U (16#434#) & U (16#435#) & U (16#432#) & U (16#44F#) & U (16#442#) & U (16#44B#) & U (16#435#);
            when 10 => return U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#) & U (16#44B#) & U (16#435#);
            when others => return "";
         end case;
      elsif Locale = "uk" then
         case Denominator is
            when 2 => return U (16#43F#) & U (16#43E#) & U (16#43B#) & U (16#43E#) & U (16#432#) & U (16#438#) & U (16#43D#) & U (16#438#);
            when 3 => return U (16#442#) & U (16#440#) & U (16#435#) & U (16#442#) & U (16#456#);
            when 4 => return U (16#447#) & U (16#435#) & U (16#442#) & U (16#432#) & U (16#435#) & U (16#440#) & U (16#442#) & U (16#456#);
            when 5 => return U (16#43F#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#456#);
            when 6 => return U (16#448#) & U (16#43E#) & U (16#441#) & U (16#442#) & U (16#456#);
            when 7 => return U (16#441#) & U (16#44C#) & U (16#43E#) & U (16#43C#) & U (16#456#);
            when 8 => return U (16#432#) & U (16#43E#) & U (16#441#) & U (16#44C#) & U (16#43C#) & U (16#456#);
            when 9 => return U (16#434#) & U (16#435#) & U (16#432#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#456#);
            when 10 => return U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#) & U (16#456#);
            when others => return "";
         end case;
      elsif Humanize.Locales.Is_CJK (Locale) then
         return Small_Locale_Word (Locale, Denominator)
           & (if Locale = "ko" then U (16#BD84#) & U (16#C758#)
              else U (16#5206#) & U (16#4E4B#) & U (16#4E00#));
      elsif Locale = "ar" then
         case Denominator is
            when 2 => return U (16#646#) & U (16#635#) & U (16#641#);
            when 3 => return U (16#623#) & U (16#62B#) & U (16#644#) & U (16#627#) & U (16#62B#);
            when 4 => return U (16#623#) & U (16#631#) & U (16#628#) & U (16#627#) & U (16#639#);
            when 5 => return U (16#623#) & U (16#62E#) & U (16#645#) & U (16#627#) & U (16#633#);
            when 6 => return U (16#623#) & U (16#633#) & U (16#62F#) & U (16#627#) & U (16#633#);
            when 7 => return U (16#623#) & U (16#633#) & U (16#628#) & U (16#627#) & U (16#639#);
            when 8 => return U (16#623#) & U (16#62B#) & U (16#645#) & U (16#627#) & U (16#646#);
            when 9 => return U (16#623#) & U (16#62A#) & U (16#633#) & U (16#627#) & U (16#639#);
            when 10 => return U (16#623#) & U (16#639#) & U (16#634#) & U (16#627#) & U (16#631#);
            when others => return "";
         end case;
      elsif Locale = "hi" then
         case Denominator is
            when 2 => return U (16#906#) & U (16#927#) & U (16#93E#);
            when 3 => return U (16#924#) & U (16#93F#) & U (16#939#) & U (16#93E#) & U (16#908#);
            when 4 => return U (16#91A#) & U (16#94C#) & U (16#925#) & U (16#93E#) & U (16#908#);
            when 5 => return U (16#92A#) & U (16#93E#) & U (16#901#) & U (16#91A#) & U (16#935#) & U (16#93E#) & U (16#901#);
            when 6 => return U (16#91B#) & U (16#920#) & U (16#93E#);
            when 7 => return U (16#938#) & U (16#93E#) & U (16#924#) & U (16#935#) & U (16#93E#) & U (16#901#);
            when 8 => return U (16#906#) & U (16#920#) & U (16#935#) & U (16#93E#) & U (16#901#);
            when 9 => return U (16#928#) & U (16#94C#) & U (16#935#) & U (16#93E#) & U (16#901#);
            when 10 => return U (16#926#) & U (16#938#) & U (16#935#) & U (16#93E#) & U (16#901#);
            when others => return "";
         end case;
      else
         return Fraction_Denominator_Word (Denominator, Plural);
      end if;
   end Locale_Fraction_Denominator_Word;

   function Fraction_Words
     (Context     : Humanize.Contexts.Context;
      Numerator   : Positive;
      Denominator : Positive)
      return Humanize.Status.Text_Result
   is
      Locale : constant String := Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context));
      Den : constant String :=
        Locale_Fraction_Denominator_Word
          (Locale, Denominator, Numerator /= 1);
      Text : constant String :=
        (if Den'Length > 0
         then
           (if Humanize.Locales.Is_CJK (Locale)
            then Den &
              Result_Text
                (Locale_Cardinal (Context, Long_Long_Integer (Numerator)))
            elsif Locale = "tr" and then Denominator > 2
            then Den & " " &
              Result_Text
                (Locale_Cardinal (Context, Long_Long_Integer (Numerator)))
            else Result_Text
              (Locale_Cardinal (Context, Long_Long_Integer (Numerator)))
              & " " & Den)
         elsif Locale = "en"
         then Cardinal_Text (Numerator) & " over " & Cardinal_Text (Denominator)
         else Result_Text
           (Locale_Cardinal (Context, Long_Long_Integer (Numerator)))
           & " over "
           & Result_Text
             (Locale_Cardinal (Context, Long_Long_Integer (Denominator))));
   begin
      return Ok_Text (Text);
   end Fraction_Words;

   procedure Fraction_Words_Into
     (Context     : Humanize.Contexts.Context;
      Numerator   : Positive;
      Denominator : Positive;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Fraction_Words (Context, Numerator, Denominator);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Fraction_Words_Into;

   pragma Style_Checks (On);

   function Ordinal_Words
     (Context : Humanize.Contexts.Context;
      Value   : Natural)
      return Humanize.Status.Text_Result
   is
      Locale : constant String :=
        Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context));
   begin
      return Ok_Text
        (Humanize.Numbers.Spellout_Data.Locale_Ordinal_Words_Text
           (Locale, Value));
   end Ordinal_Words;

   procedure Ordinal_Words_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Ordinal_Words (Context, Value);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Ordinal_Words_Into;

   function Locale_Conjunction (Locale : String) return String is
   begin
      if Locale = "da" or else Humanize.Locales.Is_Norwegian (Locale) then
         return "og";
      elsif Locale = "de" or else Locale = "nl" then
         return "und";
      elsif Locale = "fr" then
         return "et";
      elsif Locale = "es" then
         return "y";
      elsif Locale = "it" or else Locale = "pt" then
         return "e";
      elsif Locale = "sv" then
         return "och";
      elsif Locale = "fi" then
         return "ja";
      elsif Locale = "tr" then
         return "ve";
      else
         return "and";
      end if;
   end Locale_Conjunction;

   function Locale_Noun_Count
     (Locale : String;
      Count  : Natural;
      Noun   : String)
      return String
   is
      Word : constant String :=
        (if Locale = "en"
         then Cardinal_Text (Count)
         else Locale_Long_Word (Locale, Long_Long_Integer (Count)));
      Count_Text : constant String :=
        (if Word'Length = 0 then Cardinal_Text (Count) else Word);
   begin
      if Locale = "en" then
         return Count_Text & " " & Noun
           & (if Count = 1 or else Noun'Length = 0 then "" else "s");
      else
         return Count_Text & (if Noun'Length = 0 then "" else " " & Noun);
      end if;
   end Locale_Noun_Count;

   function Currency_Words
     (Context       : Humanize.Contexts.Context;
      Amount        : Long_Float;
      Major_Unit    : String;
      Minor_Unit    : String := "cent";
      Fraction_Digits : Natural := 2)
      return Humanize.Status.Text_Result
   is
      Locale : constant String :=
        Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context));
      Scale : Long_Float := 1.0;
   begin
      if Amount < 0.0 or else Fraction_Digits > 6 then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      for Index in 1 .. Fraction_Digits loop
         Scale := Scale * 10.0;
      end loop;

      declare
         Whole : constant Natural := Natural (Long_Float'Floor (Amount));
         Minor : constant Natural :=
           Natural (Long_Float'Rounding
             ((Amount - Long_Float (Whole)) * Scale));
         Text : constant String :=
           (if Minor = 0 then Locale_Noun_Count (Locale, Whole, Major_Unit)
            else Locale_Noun_Count (Locale, Whole, Major_Unit) & " "
              & Locale_Conjunction (Locale) & " "
              & Locale_Noun_Count (Locale, Minor, Minor_Unit));
      begin
         return Ok_Text (Text);
      end;
   end Currency_Words;

   procedure Currency_Words_Into
     (Context       : Humanize.Contexts.Context;
      Amount        : Long_Float;
      Major_Unit    : String;
      Minor_Unit    : String;
      Fraction_Digits : Natural;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Currency_Words
          (Context, Amount, Major_Unit, Minor_Unit, Fraction_Digits);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Currency_Words_Into;

   function Percent_Words
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Fraction_Digits : Natural := 1)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Decimal_Words (Context, Value, Fraction_Digits);
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      else
         return Ok_Text (Result_Text (Base) & " percent");
      end if;
   end Percent_Words;

   procedure Percent_Words_Into
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Fraction_Digits : Natural;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Percent_Words (Context, Value, Fraction_Digits);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Percent_Words_Into;

   function Spellout_Coverage
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        ("deterministic-en locale-cardinal locale-decimal "
         & "locale-fraction locale-ordinal generated-locale-spellout "
         & "sv-no-nb-fi-tr-pl-cs-ru-uk-ja-ko-zh-ar-hi "
         & "ro-lt-sl-id-ms-eo-vi-sw-af-hu-sk "
         & "signed-cardinal currency percent editorial");
   end Spellout_Coverage;

   function Spellout_Locale_Tier_For
     (Context : Humanize.Contexts.Context)
      return Spellout_Locale_Tier
   is
      Locale : constant String :=
        Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context));
   begin
      if Locale = "en" then
         return English_Spellout;
      elsif Locale in "da" | "de" | "fr" | "es" | "it" | "pt" | "nl" then
         return Native_Locale_Spellout;
      elsif Has_Generated_Spellout (Locale) then
         return Generated_Locale_Spellout;
      else
         return English_Fallback_Spellout;
      end if;
   end Spellout_Locale_Tier_For;

   function Spellout_Locale_Tier_Label
     (Tier : Spellout_Locale_Tier)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Tier is
            when English_Spellout =>
               "english-spellout",
            when Native_Locale_Spellout =>
               "native-locale-spellout",
            when Generated_Locale_Spellout =>
               "generated-locale-spellout",
            when English_Fallback_Spellout =>
               "english-fallback-spellout");
   end Spellout_Locale_Tier_Label;

   procedure Spellout_Coverage_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Spellout_Coverage;
   begin
      Copy_Result (Result, Target, Written, Status);
   end Spellout_Coverage_Into;

   procedure Spellout_Locale_Tier_Label_Into
     (Tier    : Spellout_Locale_Tier;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Spellout_Locale_Tier_Label (Tier);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Spellout_Locale_Tier_Label_Into;
end Humanize.Numbers.Spellout;
