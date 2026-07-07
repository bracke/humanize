with Ada.Characters.Handling;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Decimal_Images;
with Humanize.I18N_Rendering;
with Humanize.Messages;
with Humanize.Number_Classification;
with Humanize.Selections;

package body Humanize.Numbers is

   use type Humanize.Status.Status_Code;

   U_A_Acute : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A1#);
   U_A_Ring : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A5#);
   U_A_Umlaut : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A4#);
   U_A_Tilde : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A3#);
   U_C_Cedilla : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A7#);
   U_E_Acute : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A9#);
   U_E_Circumflex : constant String :=
     Character'Val (16#C3#) & Character'Val (16#AA#);
   U_E_Grave : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A8#);
   U_E_Umlaut : constant String :=
     Character'Val (16#C3#) & Character'Val (16#AB#);
   U_I_Acute : constant String :=
     Character'Val (16#C3#) & Character'Val (16#AD#);
   U_I_Dotless : constant String :=
     Character'Val (16#C4#) & Character'Val (16#B1#);
   U_O_Acute : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B3#);
   U_O_Tilde : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B5#);
   U_O_Slash : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B8#);
   U_O_Umlaut : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B6#);
   U_Sharp_S : constant String :=
     Character'Val (16#C3#) & Character'Val (16#9F#);
   U_S_Cedilla : constant String :=
     Character'Val (16#C5#) & Character'Val (16#9F#);
   U_U_Acute : constant String :=
     Character'Val (16#C3#) & Character'Val (16#BA#);
   U_U_Umlaut : constant String :=
     Character'Val (16#C3#) & Character'Val (16#BC#);

   function Trim (Text : String) return String is
     (Ada.Strings.Fixed.Trim (Text, Ada.Strings.Both));

   function Lower (Text : String) return String is
      Result : String (Text'Range);
   begin
      for Index in Text'Range loop
         if Text (Index) in 'A' .. 'Z' then
            Result (Index) := Ada.Characters.Handling.To_Lower (Text (Index));
         else
            Result (Index) := Text (Index);
         end if;
      end loop;
      return Result;
   end Lower;

   function Starts_With (Text, Prefix : String) return Boolean is
     (Text'Length >= Prefix'Length
      and then Text (Text'First .. Text'First + Prefix'Length - 1) = Prefix);

   function Contains (Text, Pattern : String) return Boolean is
   begin
      if Pattern'Length = 0 or else Text'Length < Pattern'Length then
         return False;
      end if;

      for Index in Text'First .. Text'Last - Pattern'Length + 1 loop
         if Text (Index .. Index + Pattern'Length - 1) = Pattern then
            return True;
         end if;
      end loop;

      return False;
   end Contains;

   function Has_Byte_In
     (Text : String;
      Low  : Natural;
      High : Natural)
      return Boolean
   is
   begin
      for Ch of Text loop
         if Character'Pos (Ch) in Low .. High then
            return True;
         end if;
      end loop;
      return False;
   end Has_Byte_In;

   function U (Code : Natural) return String is
   begin
      if Code <= 16#7F# then
         return String'(1 => Character'Val (Code));
      elsif Code <= 16#7FF# then
         return Character'Val (16#C0# + Code / 64)
           & Character'Val (16#80# + Code mod 64);
      elsif Code <= 16#FFFF# then
         return Character'Val (16#E0# + Code / 4_096)
           & Character'Val (16#80# + (Code / 64) mod 64)
           & Character'Val (16#80# + Code mod 64);
      else
         return Character'Val (16#F0# + Code / 262_144)
           & Character'Val (16#80# + (Code / 4_096) mod 64)
           & Character'Val (16#80# + (Code / 64) mod 64)
           & Character'Val (16#80# + Code mod 64);
      end if;
   end U;

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

   function No_Space (Image : String) return String is
     (if Image'Length > 0 and then Image (Image'First) = ' '
      then Image (Image'First + 1 .. Image'Last)
      else Image);

   function Ok_Text (Text : String) return Humanize.Status.Text_Result is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String (Text),
         Key    => Humanize.Messages.No_Message);
   end Ok_Text;

   function Group_Integer_Image
     (Text    : String;
      Enabled : Boolean)
      return String
   is
      Sign  : constant String :=
        (if Text'Length > 0 and then Text (Text'First) = '-' then "-" else "");
      First : constant Natural :=
        (if Sign'Length = 0 then Text'First else Text'First + 1);
      Count : Natural := 0;
      Result : Unbounded_String;
   begin
      if not Enabled or else Text'Length <= Sign'Length + 3 then
         return Text;
      end if;

      Append (Result, Sign);
      for Index in First .. Text'Last loop
         if Count > 0 and then (Text'Last - Index + 1) mod 3 = 0 then
            Append (Result, ",");
         end if;
         Append (Result, Text (Index));
         Count := Count + 1;
      end loop;
      return To_String (Result);
   end Group_Integer_Image;

   function Group_Decimal_Image
     (Text    : String;
      Enabled : Boolean)
      return String
   is
      Dot : Natural := 0;
   begin
      if not Enabled then
         return Text;
      end if;

      for Index in Text'Range loop
         if Text (Index) = '.' then
            Dot := Index;
            exit;
         end if;
      end loop;

      if Dot = 0 then
         return Group_Integer_Image (Text, Enabled);
      elsif Dot = Text'First then
         return Text;
      else
         return Group_Integer_Image (Text (Text'First .. Dot - 1), Enabled)
           & Text (Dot .. Text'Last);
      end if;
   end Group_Decimal_Image;

   function Grouped_Integer
     (Value   : Long_Long_Integer;
      Options : Editorial_Number_Options)
      return String
   is
   begin
      return Group_Integer_Image
        (No_Space (Long_Long_Integer'Image (Value)), Options.Group_Digits);
   end Grouped_Integer;

   function Editorial_Decimal
     (Value   : Long_Float;
      Options : Number_Options)
      return String
   is
   begin
      return Group_Decimal_Image
        (Humanize.Decimal_Images.Decimal_Image
           (Value, Options.Maximum_Fraction_Digits,
            Options.Suppress_Trailing_Zero),
         Enabled => True);
   end Editorial_Decimal;

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
         return No_Space (Natural'Image (Value));
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
         return No_Space (Long_Long_Integer'Image (Value));
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

   function GCD (Left, Right : Natural) return Natural is
      A : Natural := Left;
      B : Natural := Right;
   begin
      while B /= 0 loop
         declare
            T : constant Natural := A mod B;
         begin
            A := B;
            B := T;
         end;
      end loop;
      return A;
   end GCD;

   function Cardinal
     (Context : Humanize.Contexts.Context;
      Value   : Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String (Cardinal_Text (Value)),
         Key    => Humanize.Messages.No_Message);
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
      Copy_Text (To_String (Result.Text), Target, Written, Status);
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

      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String (Cardinal_Long_Text (Value)),
         Key    => Humanize.Messages.No_Message);
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
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Signed_Cardinal_Into;

   function Locale_Prefix (Context : Humanize.Contexts.Context) return String is
      Locale : constant String := Humanize.Contexts.Locale (Context);
   begin
      if Locale'Length >= 2 then
         return Locale (Locale'First .. Locale'First + 1);
      else
         return Locale;
      end if;
   end Locale_Prefix;

   function Is_Norwegian (Locale : String) return Boolean is
     (Locale = "no" or else Locale = "nb");

   function Is_CJK_Spellout (Locale : String) return Boolean is
     (Locale = "ja" or else Locale = "ko" or else Locale = "zh");

   function Has_Generated_Spellout (Locale : String) return Boolean is
     (Locale = "sv" or else Is_Norwegian (Locale) or else Locale = "fi"
      or else Locale = "tr" or else Locale = "pl" or else Locale = "cs"
      or else Locale = "ru" or else Locale = "uk" or else Locale = "ja"
      or else Locale = "ko" or else Locale = "zh" or else Locale = "ar"
      or else Locale = "hi" or else Locale = "ro" or else Locale = "lt"
      or else Locale = "sl" or else Locale = "id" or else Locale = "ms"
      or else Locale = "eo" or else Locale = "vi" or else Locale = "sw"
      or else Locale = "af" or else Locale = "hu" or else Locale = "sk");

   --  Generated multilingual spellout tables are intentionally encoded as
   --  codepoint fragments to keep the source ASCII and deterministic.
   pragma Style_Checks (Off);

   function Small_Locale_Word
     (Locale : String;
      Value  : Natural)
      return String
   is
      function English return String is
      begin
         if Value <= 20 then
            return Under_Thousand (Value);
         else
            return "";
         end if;
      end English;
   begin
      if Locale = "de" then
         case Value is
            when 0 => return "null";
            when 1 => return "eins";
            when 2 => return "zwei";
            when 3 => return "drei";
            when 4 => return "vier";
            when 5 => return "f" & U_U_Umlaut & "nf";
            when 6 => return "sechs";
            when 7 => return "sieben";
            when 8 => return "acht";
            when 9 => return "neun";
            when 10 => return "zehn";
            when 11 => return "elf";
            when 12 => return "zw" & U_O_Umlaut & "lf";
            when 13 => return "dreizehn";
            when 14 => return "vierzehn";
            when 15 => return "f" & U_U_Umlaut & "nfzehn";
            when 16 => return "sechzehn";
            when 17 => return "siebzehn";
            when 18 => return "achtzehn";
            when 19 => return "neunzehn";
            when 20 => return "zwanzig";
            when others => return "";
         end case;
      elsif Locale = "fr" then
         case Value is
            when 0 => return "z" & U_E_Acute & "ro";
            when 1 => return "un";
            when 2 => return "deux";
            when 3 => return "trois";
            when 4 => return "quatre";
            when 5 => return "cinq";
            when 6 => return "six";
            when 7 => return "sept";
            when 8 => return "huit";
            when 9 => return "neuf";
            when 10 => return "dix";
            when 11 => return "onze";
            when 12 => return "douze";
            when 13 => return "treize";
            when 14 => return "quatorze";
            when 15 => return "quinze";
            when 16 => return "seize";
            when 17 => return "dix-sept";
            when 18 => return "dix-huit";
            when 19 => return "dix-neuf";
            when 20 => return "vingt";
            when others => return "";
         end case;
      elsif Locale = "da" then
         case Value is
            when 0 => return "nul";
            when 1 => return "en";
            when 2 => return "to";
            when 3 => return "tre";
            when 4 => return "fire";
            when 5 => return "fem";
            when 6 => return "seks";
            when 7 => return "syv";
            when 8 => return "otte";
            when 9 => return "ni";
            when 10 => return "ti";
            when 11 => return "elleve";
            when 12 => return "tolv";
            when 13 => return "tretten";
            when 14 => return "fjorten";
            when 15 => return "femten";
            when 16 => return "seksten";
            when 17 => return "sytten";
            when 18 => return "atten";
            when 19 => return "nitten";
            when 20 => return "tyve";
            when others => return "";
         end case;
      elsif Locale = "es" then
         case Value is
            when 0 => return "cero";
            when 1 => return "uno";
            when 2 => return "dos";
            when 3 => return "tres";
            when 4 => return "cuatro";
            when 5 => return "cinco";
            when 6 => return "seis";
            when 7 => return "siete";
            when 8 => return "ocho";
            when 9 => return "nueve";
            when 10 => return "diez";
            when 11 => return "once";
            when 12 => return "doce";
            when 13 => return "trece";
            when 14 => return "catorce";
            when 15 => return "quince";
            when 16 => return "diecis" & U_E_Acute & "is";
            when 17 => return "diecisiete";
            when 18 => return "dieciocho";
            when 19 => return "diecinueve";
            when 20 => return "veinte";
            when others => return "";
         end case;
      elsif Locale = "it" then
         case Value is
            when 0 => return "zero";
            when 1 => return "uno";
            when 2 => return "due";
            when 3 => return "tre";
            when 4 => return "quattro";
            when 5 => return "cinque";
            when 6 => return "sei";
            when 7 => return "sette";
            when 8 => return "otto";
            when 9 => return "nove";
            when 10 => return "dieci";
            when 11 => return "undici";
            when 12 => return "dodici";
            when 13 => return "tredici";
            when 14 => return "quattordici";
            when 15 => return "quindici";
            when 16 => return "sedici";
            when 17 => return "diciassette";
            when 18 => return "diciotto";
            when 19 => return "diciannove";
            when 20 => return "venti";
            when others => return "";
         end case;
      elsif Locale = "pt" then
         case Value is
            when 0 => return "zero";
            when 1 => return "um";
            when 2 => return "dois";
            when 3 => return "tr" & U_E_Circumflex & "s";
            when 4 => return "quatro";
            when 5 => return "cinco";
            when 6 => return "seis";
            when 7 => return "sete";
            when 8 => return "oito";
            when 9 => return "nove";
            when 10 => return "dez";
            when 11 => return "onze";
            when 12 => return "doze";
            when 13 => return "treze";
            when 14 => return "catorze";
            when 15 => return "quinze";
            when 16 => return "dezesseis";
            when 17 => return "dezessete";
            when 18 => return "dezoito";
            when 19 => return "dezenove";
            when 20 => return "vinte";
            when others => return "";
         end case;
      elsif Locale = "nl" then
         case Value is
            when 0 => return "nul";
            when 1 => return "een";
            when 2 => return "twee";
            when 3 => return "drie";
            when 4 => return "vier";
            when 5 => return "vijf";
            when 6 => return "zes";
            when 7 => return "zeven";
            when 8 => return "acht";
            when 9 => return "negen";
            when 10 => return "tien";
            when 11 => return "elf";
            when 12 => return "twaalf";
            when 13 => return "dertien";
            when 14 => return "veertien";
            when 15 => return "vijftien";
            when 16 => return "zestien";
            when 17 => return "zeventien";
            when 18 => return "achttien";
            when 19 => return "negentien";
            when 20 => return "twintig";
            when others => return "";
         end case;
      elsif Locale = "sv" then
         case Value is
            when 0 => return "noll";
            when 1 => return "ett";
            when 2 => return "tv" & U_A_Ring;
            when 3 => return "tre";
            when 4 => return "fyra";
            when 5 => return "fem";
            when 6 => return "sex";
            when 7 => return "sju";
            when 8 => return U_A_Ring & "tta";
            when 9 => return "nio";
            when 10 => return "tio";
            when 11 => return "elva";
            when 12 => return "tolv";
            when 13 => return "tretton";
            when 14 => return "fjorton";
            when 15 => return "femton";
            when 16 => return "sexton";
            when 17 => return "sjutton";
            when 18 => return "arton";
            when 19 => return "nitton";
            when 20 => return "tjugo";
            when others => return "";
         end case;
      elsif Is_Norwegian (Locale) then
         case Value is
            when 0 => return "null";
            when 1 => return "en";
            when 2 => return "to";
            when 3 => return "tre";
            when 4 => return "fire";
            when 5 => return "fem";
            when 6 => return "seks";
            when 7 => return "sju";
            when 8 => return U_A_Ring & "tte";
            when 9 => return "ni";
            when 10 => return "ti";
            when 11 => return "elleve";
            when 12 => return "tolv";
            when 13 => return "tretten";
            when 14 => return "fjorten";
            when 15 => return "femten";
            when 16 => return "seksten";
            when 17 => return "sytten";
            when 18 => return "atten";
            when 19 => return "nitten";
            when 20 => return "tjue";
            when others => return "";
         end case;
      elsif Locale = "fi" then
         case Value is
            when 0 => return "nolla";
            when 1 => return "yksi";
            when 2 => return "kaksi";
            when 3 => return "kolme";
            when 4 => return "nelj" & U_A_Umlaut;
            when 5 => return "viisi";
            when 6 => return "kuusi";
            when 7 => return "seitsem" & U_A_Umlaut & "n";
            when 8 => return "kahdeksan";
            when 9 => return "yhdeks" & U_A_Umlaut & "n";
            when 10 => return "kymmenen";
            when 11 => return "yksitoista";
            when 12 => return "kaksitoista";
            when 13 => return "kolmetoista";
            when 14 => return "nelj" & U_A_Umlaut & "toista";
            when 15 => return "viisitoista";
            when 16 => return "kuusitoista";
            when 17 => return "seitsem" & U_A_Umlaut & "ntoista";
            when 18 => return "kahdeksantoista";
            when 19 => return "yhdeks" & U_A_Umlaut & "ntoista";
            when 20 => return "kaksikymment" & U_A_Umlaut;
            when others => return "";
         end case;
      elsif Locale = "tr" then
         case Value is
            when 0 => return "s" & U_I_Dotless & "f" & U_I_Dotless & "r";
            when 1 => return "bir";
            when 2 => return "iki";
            when 3 => return U_U_Umlaut & U_C_Cedilla;
            when 4 => return "d" & U_O_Umlaut & "rt";
            when 5 => return "be" & U_S_Cedilla;
            when 6 => return "alt" & U_I_Dotless;
            when 7 => return "yedi";
            when 8 => return "sekiz";
            when 9 => return "dokuz";
            when 10 => return "on";
            when 11 => return "on bir";
            when 12 => return "on iki";
            when 13 => return "on " & U_U_Umlaut & U_C_Cedilla;
            when 14 => return "on d" & U_O_Umlaut & "rt";
            when 15 => return "on be" & U_S_Cedilla;
            when 16 => return "on alt" & U_I_Dotless;
            when 17 => return "on yedi";
            when 18 => return "on sekiz";
            when 19 => return "on dokuz";
            when 20 => return "yirmi";
            when others => return "";
         end case;
      elsif Locale = "pl" then
         case Value is
            when 0 => return "zero";
            when 1 => return "jeden";
            when 2 => return "dwa";
            when 3 => return "trzy";
            when 4 => return "cztery";
            when 5 => return "pi" & U (16#119#) & U (16#107#);
            when 6 => return "sze" & U (16#15B#) & U (16#107#);
            when 7 => return "siedem";
            when 8 => return "osiem";
            when 9 => return "dziewi" & U (16#119#) & U (16#107#);
            when 10 => return "dziesi" & U (16#119#) & U (16#107#);
            when 11 => return "jedena" & U (16#15B#) & "cie";
            when 12 => return "dwana" & U (16#15B#) & "cie";
            when 13 => return "trzyna" & U (16#15B#) & "cie";
            when 14 => return "czterna" & U (16#15B#) & "cie";
            when 15 => return "pi" & U (16#119#) & "tna" & U (16#15B#) & "cie";
            when 16 => return "szesna" & U (16#15B#) & "cie";
            when 17 => return "siedemna" & U (16#15B#) & "cie";
            when 18 => return "osiemna" & U (16#15B#) & "cie";
            when 19 => return "dziewi" & U (16#119#) & "tna" & U (16#15B#) & "cie";
            when 20 => return "dwadzie" & U (16#15B#) & "cia";
            when others => return "";
         end case;
      elsif Locale = "cs" then
         case Value is
            when 0 => return "nula";
            when 1 => return "jedna";
            when 2 => return "dva";
            when 3 => return "t" & U (16#159#) & "i";
            when 4 => return U (16#10D#) & "ty" & U (16#159#) & "i";
            when 5 => return "p" & U (16#11B#) & "t";
            when 6 => return U (16#161#) & "est";
            when 7 => return "sedm";
            when 8 => return "osm";
            when 9 => return "dev" & U (16#11B#) & "t";
            when 10 => return "deset";
            when 11 => return "jeden" & U (16#E1#) & "ct";
            when 12 => return "dvan" & U (16#E1#) & "ct";
            when 13 => return "t" & U (16#159#) & "in" & U (16#E1#) & "ct";
            when 14 => return U (16#10D#) & "trn" & U (16#E1#) & "ct";
            when 15 => return "patn" & U (16#E1#) & "ct";
            when 16 => return U (16#161#) & "estn" & U (16#E1#) & "ct";
            when 17 => return "sedmn" & U (16#E1#) & "ct";
            when 18 => return "osmn" & U (16#E1#) & "ct";
            when 19 => return "devaten" & U (16#E1#) & "ct";
            when 20 => return "dvacet";
            when others => return "";
         end case;
      elsif Locale = "ru" then
         case Value is
            when 0 => return U (16#43D#) & U (16#43E#) & U (16#43B#) & U (16#44C#);
            when 1 => return U (16#43E#) & U (16#434#) & U (16#438#) & U (16#43D#);
            when 2 => return U (16#434#) & U (16#432#) & U (16#430#);
            when 3 => return U (16#442#) & U (16#440#) & U (16#438#);
            when 4 => return U (16#447#) & U (16#435#) & U (16#442#) & U (16#44B#) & U (16#440#) & U (16#435#);
            when 5 => return U (16#43F#) & U (16#44F#) & U (16#442#) & U (16#44C#);
            when 6 => return U (16#448#) & U (16#435#) & U (16#441#) & U (16#442#) & U (16#44C#);
            when 7 => return U (16#441#) & U (16#435#) & U (16#43C#) & U (16#44C#);
            when 8 => return U (16#432#) & U (16#43E#) & U (16#441#) & U (16#435#) & U (16#43C#) & U (16#44C#);
            when 9 => return U (16#434#) & U (16#435#) & U (16#432#) & U (16#44F#) & U (16#442#) & U (16#44C#);
            when 10 => return U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#) & U (16#44C#);
            when 11 => return U (16#43E#) & U (16#434#) & U (16#438#) & U (16#43D#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#430#) & U (16#442#) & U (16#44C#);
            when 12 => return U (16#434#) & U (16#432#) & U (16#435#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#430#) & U (16#442#) & U (16#44C#);
            when 13 => return U (16#442#) & U (16#440#) & U (16#438#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#430#) & U (16#442#) & U (16#44C#);
            when 14 => return U (16#447#) & U (16#435#) & U (16#442#) & U (16#44B#) & U (16#440#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#430#) & U (16#442#) & U (16#44C#);
            when 15 => return U (16#43F#) & U (16#44F#) & U (16#442#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#430#) & U (16#442#) & U (16#44C#);
            when 16 => return U (16#448#) & U (16#435#) & U (16#441#) & U (16#442#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#430#) & U (16#442#) & U (16#44C#);
            when 17 => return U (16#441#) & U (16#435#) & U (16#43C#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#430#) & U (16#442#) & U (16#44C#);
            when 18 => return U (16#432#) & U (16#43E#) & U (16#441#) & U (16#435#) & U (16#43C#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#430#) & U (16#442#) & U (16#44C#);
            when 19 => return U (16#434#) & U (16#435#) & U (16#432#) & U (16#44F#) & U (16#442#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#430#) & U (16#442#) & U (16#44C#);
            when 20 => return U (16#434#) & U (16#432#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#430#) & U (16#442#) & U (16#44C#);
            when others => return "";
         end case;
      elsif Locale = "uk" then
         case Value is
            when 0 => return U (16#43D#) & U (16#443#) & U (16#43B#) & U (16#44C#);
            when 1 => return U (16#43E#) & U (16#434#) & U (16#438#) & U (16#43D#);
            when 2 => return U (16#434#) & U (16#432#) & U (16#430#);
            when 3 => return U (16#442#) & U (16#440#) & U (16#438#);
            when 4 => return U (16#447#) & U (16#43E#) & U (16#442#) & U (16#438#) & U (16#440#) & U (16#438#);
            when 5 => return U (16#43F#) & U (16#44F#) & U (16#442#) & U (16#44C#);
            when 6 => return U (16#448#) & U (16#456#) & U (16#441#) & U (16#442#) & U (16#44C#);
            when 7 => return U (16#441#) & U (16#456#) & U (16#43C#);
            when 8 => return U (16#432#) & U (16#456#) & U (16#441#) & U (16#456#) & U (16#43C#);
            when 9 => return U (16#434#) & U (16#435#) & U (16#432#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#44C#);
            when 10 => return U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#) & U (16#44C#);
            when 11 => return U (16#43E#) & U (16#434#) & U (16#438#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#44F#) & U (16#442#) & U (16#44C#);
            when 12 => return U (16#434#) & U (16#432#) & U (16#430#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#44F#) & U (16#442#) & U (16#44C#);
            when 13 => return U (16#442#) & U (16#440#) & U (16#438#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#44F#) & U (16#442#) & U (16#44C#);
            when 14 => return U (16#447#) & U (16#43E#) & U (16#442#) & U (16#438#) & U (16#440#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#44F#) & U (16#442#) & U (16#44C#);
            when 15 => return U (16#43F#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#44F#) & U (16#442#) & U (16#44C#);
            when 16 => return U (16#448#) & U (16#456#) & U (16#441#) & U (16#442#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#44F#) & U (16#442#) & U (16#44C#);
            when 17 => return U (16#441#) & U (16#456#) & U (16#43C#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#44F#) & U (16#442#) & U (16#44C#);
            when 18 => return U (16#432#) & U (16#456#) & U (16#441#) & U (16#456#) & U (16#43C#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#44F#) & U (16#442#) & U (16#44C#);
            when 19 => return U (16#434#) & U (16#435#) & U (16#432#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#44F#) & U (16#442#) & U (16#44C#);
            when 20 => return U (16#434#) & U (16#432#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#44F#) & U (16#442#) & U (16#44C#);
            when others => return "";
         end case;
      elsif Locale = "ja" then
         case Value is
            when 0 => return U (16#96F6#);
            when 1 => return U (16#4E00#);
            when 2 => return U (16#4E8C#);
            when 3 => return U (16#4E09#);
            when 4 => return U (16#56DB#);
            when 5 => return U (16#4E94#);
            when 6 => return U (16#516D#);
            when 7 => return U (16#4E03#);
            when 8 => return U (16#516B#);
            when 9 => return U (16#4E5D#);
            when 10 => return U (16#5341#);
            when others => return "";
         end case;
      elsif Locale = "ko" then
         case Value is
            when 0 => return U (16#C601#);
            when 1 => return U (16#C77C#);
            when 2 => return U (16#C774#);
            when 3 => return U (16#C0BC#);
            when 4 => return U (16#C0AC#);
            when 5 => return U (16#C624#);
            when 6 => return U (16#C721#);
            when 7 => return U (16#CE60#);
            when 8 => return U (16#D314#);
            when 9 => return U (16#AD6C#);
            when 10 => return U (16#C2ED#);
            when others => return "";
         end case;
      elsif Locale = "zh" then
         case Value is
            when 0 => return U (16#96F6#);
            when 1 => return U (16#4E00#);
            when 2 => return U (16#4E8C#);
            when 3 => return U (16#4E09#);
            when 4 => return U (16#56DB#);
            when 5 => return U (16#4E94#);
            when 6 => return U (16#516D#);
            when 7 => return U (16#4E03#);
            when 8 => return U (16#516B#);
            when 9 => return U (16#4E5D#);
            when 10 => return U (16#5341#);
            when others => return "";
         end case;
      elsif Locale = "ar" then
         case Value is
            when 0 => return U (16#635#) & U (16#641#) & U (16#631#);
            when 1 => return U (16#648#) & U (16#627#) & U (16#62D#) & U (16#62F#);
            when 2 => return U (16#627#) & U (16#62B#) & U (16#646#) & U (16#627#) & U (16#646#);
            when 3 => return U (16#62B#) & U (16#644#) & U (16#627#) & U (16#62B#) & U (16#629#);
            when 4 => return U (16#623#) & U (16#631#) & U (16#628#) & U (16#639#) & U (16#629#);
            when 5 => return U (16#62E#) & U (16#645#) & U (16#633#) & U (16#629#);
            when 6 => return U (16#633#) & U (16#62A#) & U (16#629#);
            when 7 => return U (16#633#) & U (16#628#) & U (16#639#) & U (16#629#);
            when 8 => return U (16#62B#) & U (16#645#) & U (16#627#) & U (16#646#) & U (16#64A#) & U (16#629#);
            when 9 => return U (16#62A#) & U (16#633#) & U (16#639#) & U (16#629#);
            when 10 => return U (16#639#) & U (16#634#) & U (16#631#) & U (16#629#);
            when 11 => return U (16#623#) & U (16#62D#) & U (16#62F#) & U (16#20#) & U (16#639#) & U (16#634#) & U (16#631#);
            when 12 => return U (16#627#) & U (16#62B#) & U (16#646#) & U (16#627#) & U (16#20#) & U (16#639#) & U (16#634#) & U (16#631#);
            when 13 => return U (16#62B#) & U (16#644#) & U (16#627#) & U (16#62B#) & U (16#629#) & U (16#20#) & U (16#639#) & U (16#634#) & U (16#631#);
            when 14 => return U (16#623#) & U (16#631#) & U (16#628#) & U (16#639#) & U (16#629#) & U (16#20#) & U (16#639#) & U (16#634#) & U (16#631#);
            when 15 => return U (16#62E#) & U (16#645#) & U (16#633#) & U (16#629#) & U (16#20#) & U (16#639#) & U (16#634#) & U (16#631#);
            when 16 => return U (16#633#) & U (16#62A#) & U (16#629#) & U (16#20#) & U (16#639#) & U (16#634#) & U (16#631#);
            when 17 => return U (16#633#) & U (16#628#) & U (16#639#) & U (16#629#) & U (16#20#) & U (16#639#) & U (16#634#) & U (16#631#);
            when 18 => return U (16#62B#) & U (16#645#) & U (16#627#) & U (16#646#) & U (16#64A#) & U (16#629#) & U (16#20#) & U (16#639#) & U (16#634#) & U (16#631#);
            when 19 => return U (16#62A#) & U (16#633#) & U (16#639#) & U (16#629#) & U (16#20#) & U (16#639#) & U (16#634#) & U (16#631#);
            when 20 => return U (16#639#) & U (16#634#) & U (16#631#) & U (16#648#) & U (16#646#);
            when others => return "";
         end case;
      elsif Locale = "hi" then
         case Value is
            when 0 => return U (16#936#) & U (16#942#) & U (16#928#) & U (16#94D#) & U (16#92F#);
            when 1 => return U (16#90F#) & U (16#915#);
            when 2 => return U (16#926#) & U (16#94B#);
            when 3 => return U (16#924#) & U (16#940#) & U (16#928#);
            when 4 => return U (16#91A#) & U (16#93E#) & U (16#930#);
            when 5 => return U (16#92A#) & U (16#93E#) & U (16#901#) & U (16#91A#);
            when 6 => return U (16#91B#) & U (16#939#);
            when 7 => return U (16#938#) & U (16#93E#) & U (16#924#);
            when 8 => return U (16#906#) & U (16#920#);
            when 9 => return U (16#928#) & U (16#94C#);
            when 10 => return U (16#926#) & U (16#938#);
            when 11 => return U (16#917#) & U (16#94D#) & U (16#92F#) & U (16#93E#) & U (16#930#) & U (16#939#);
            when 12 => return U (16#92C#) & U (16#93E#) & U (16#930#) & U (16#939#);
            when 13 => return U (16#924#) & U (16#947#) & U (16#930#) & U (16#939#);
            when 14 => return U (16#91A#) & U (16#94C#) & U (16#926#) & U (16#939#);
            when 15 => return U (16#92A#) & U (16#902#) & U (16#926#) & U (16#94D#) & U (16#930#) & U (16#939#);
            when 16 => return U (16#938#) & U (16#94B#) & U (16#932#) & U (16#939#);
            when 17 => return U (16#938#) & U (16#924#) & U (16#94D#) & U (16#930#) & U (16#939#);
            when 18 => return U (16#905#) & U (16#920#) & U (16#93E#) & U (16#930#) & U (16#939#);
            when 19 => return U (16#909#) & U (16#928#) & U (16#94D#) & U (16#928#) & U (16#940#) & U (16#938#);
            when 20 => return U (16#92C#) & U (16#940#) & U (16#938#);
            when others => return "";
         end case;
      elsif Locale = "ro" then
         case Value is
            when 0 => return "zero";
            when 1 => return "unu";
            when 2 => return "doi";
            when 3 => return "trei";
            when 4 => return "patru";
            when 5 => return "cinci";
            when 6 => return "sase";
            when 7 => return "sapte";
            when 8 => return "opt";
            when 9 => return "noua";
            when 10 => return "zece";
            when 11 => return "unsprezece";
            when 12 => return "doisprezece";
            when 13 => return "treisprezece";
            when 14 => return "paisprezece";
            when 15 => return "cincisprezece";
            when 16 => return "saisprezece";
            when 17 => return "saptesprezece";
            when 18 => return "optsprezece";
            when 19 => return "nouasprezece";
            when 20 => return "douazeci";
            when others => return "";
         end case;
      elsif Locale = "lt" then
         case Value is
            when 0 => return "nulis";
            when 1 => return "vienas";
            when 2 => return "du";
            when 3 => return "trys";
            when 4 => return "keturi";
            when 5 => return "penki";
            when 6 => return "sesi";
            when 7 => return "septyni";
            when 8 => return "astuoni";
            when 9 => return "devyni";
            when 10 => return "desimt";
            when 11 => return "vienuolika";
            when 12 => return "dvylika";
            when 13 => return "trylika";
            when 14 => return "keturiolika";
            when 15 => return "penkiolika";
            when 16 => return "sesiolika";
            when 17 => return "septyniolika";
            when 18 => return "astuoniolika";
            when 19 => return "devyniolika";
            when 20 => return "dvidesimt";
            when others => return "";
         end case;
      elsif Locale = "sl" then
         case Value is
            when 0 => return "nic";
            when 1 => return "ena";
            when 2 => return "dve";
            when 3 => return "tri";
            when 4 => return "stiri";
            when 5 => return "pet";
            when 6 => return "sest";
            when 7 => return "sedem";
            when 8 => return "osem";
            when 9 => return "devet";
            when 10 => return "deset";
            when 11 => return "enajst";
            when 12 => return "dvanajst";
            when 13 => return "trinajst";
            when 14 => return "stirinajst";
            when 15 => return "petnajst";
            when 16 => return "sestnajst";
            when 17 => return "sedemnajst";
            when 18 => return "osemnajst";
            when 19 => return "devetnajst";
            when 20 => return "dvajset";
            when others => return "";
         end case;
      elsif Locale = "id" or else Locale = "ms" then
         case Value is
            when 0 => return (if Locale = "ms" then "sifar" else "nol");
            when 1 => return "satu";
            when 2 => return "dua";
            when 3 => return "tiga";
            when 4 => return "empat";
            when 5 => return "lima";
            when 6 => return "enam";
            when 7 => return "tujuh";
            when 8 => return (if Locale = "ms" then "lapan" else "delapan");
            when 9 => return "sembilan";
            when 10 => return "sepuluh";
            when 11 => return "sebelas";
            when 12 => return "dua belas";
            when 13 => return "tiga belas";
            when 14 => return "empat belas";
            when 15 => return "lima belas";
            when 16 => return "enam belas";
            when 17 => return "tujuh belas";
            when 18 => return (if Locale = "ms" then "lapan belas" else "delapan belas");
            when 19 => return "sembilan belas";
            when 20 => return "dua puluh";
            when others => return "";
         end case;
      elsif Locale = "eo" then
         case Value is
            when 0 => return "nulo";
            when 1 => return "unu";
            when 2 => return "du";
            when 3 => return "tri";
            when 4 => return "kvar";
            when 5 => return "kvin";
            when 6 => return "ses";
            when 7 => return "sep";
            when 8 => return "ok";
            when 9 => return "nau";
            when 10 => return "dek";
            when 11 => return "dek unu";
            when 12 => return "dek du";
            when 13 => return "dek tri";
            when 14 => return "dek kvar";
            when 15 => return "dek kvin";
            when 16 => return "dek ses";
            when 17 => return "dek sep";
            when 18 => return "dek ok";
            when 19 => return "dek nau";
            when 20 => return "dudek";
            when others => return "";
         end case;
      elsif Locale = "vi" then
         case Value is
            when 0 => return "khong";
            when 1 => return "mot";
            when 2 => return "hai";
            when 3 => return "ba";
            when 4 => return "bon";
            when 5 => return "nam";
            when 6 => return "sau";
            when 7 => return "bay";
            when 8 => return "tam";
            when 9 => return "chin";
            when 10 => return "muoi";
            when 11 => return "muoi mot";
            when 12 => return "muoi hai";
            when 13 => return "muoi ba";
            when 14 => return "muoi bon";
            when 15 => return "muoi lam";
            when 16 => return "muoi sau";
            when 17 => return "muoi bay";
            when 18 => return "muoi tam";
            when 19 => return "muoi chin";
            when 20 => return "hai muoi";
            when others => return "";
         end case;
      elsif Locale = "sw" then
         case Value is
            when 0 => return "sifuri";
            when 1 => return "moja";
            when 2 => return "mbili";
            when 3 => return "tatu";
            when 4 => return "nne";
            when 5 => return "tano";
            when 6 => return "sita";
            when 7 => return "saba";
            when 8 => return "nane";
            when 9 => return "tisa";
            when 10 => return "kumi";
            when 11 => return "kumi na moja";
            when 12 => return "kumi na mbili";
            when 13 => return "kumi na tatu";
            when 14 => return "kumi na nne";
            when 15 => return "kumi na tano";
            when 16 => return "kumi na sita";
            when 17 => return "kumi na saba";
            when 18 => return "kumi na nane";
            when 19 => return "kumi na tisa";
            when 20 => return "ishirini";
            when others => return "";
         end case;
      elsif Locale = "af" then
         case Value is
            when 0 => return "nul";
            when 1 => return "een";
            when 2 => return "twee";
            when 3 => return "drie";
            when 4 => return "vier";
            when 5 => return "vyf";
            when 6 => return "ses";
            when 7 => return "sewe";
            when 8 => return "agt";
            when 9 => return "nege";
            when 10 => return "tien";
            when 11 => return "elf";
            when 12 => return "twaalf";
            when 13 => return "dertien";
            when 14 => return "veertien";
            when 15 => return "vyftien";
            when 16 => return "sestien";
            when 17 => return "sewentien";
            when 18 => return "agtien";
            when 19 => return "negentien";
            when 20 => return "twintig";
            when others => return "";
         end case;
      elsif Locale = "hu" then
         case Value is
            when 0 => return "nulla";
            when 1 => return "egy";
            when 2 => return "ketto";
            when 3 => return "harom";
            when 4 => return "negy";
            when 5 => return "ot";
            when 6 => return "hat";
            when 7 => return "het";
            when 8 => return "nyolc";
            when 9 => return "kilenc";
            when 10 => return "tiz";
            when 11 => return "tizenegy";
            when 12 => return "tizenketto";
            when 13 => return "tizenharom";
            when 14 => return "tizennegy";
            when 15 => return "tizenot";
            when 16 => return "tizenhat";
            when 17 => return "tizenhet";
            when 18 => return "tizennyolc";
            when 19 => return "tizenkilenc";
            when 20 => return "husz";
            when others => return "";
         end case;
      elsif Locale = "sk" then
         case Value is
            when 0 => return "nula";
            when 1 => return "jeden";
            when 2 => return "dva";
            when 3 => return "tri";
            when 4 => return "styri";
            when 5 => return "pat";
            when 6 => return "sest";
            when 7 => return "sedem";
            when 8 => return "osem";
            when 9 => return "devat";
            when 10 => return "desat";
            when 11 => return "jedenast";
            when 12 => return "dvanast";
            when 13 => return "trinast";
            when 14 => return "strnast";
            when 15 => return "patnast";
            when 16 => return "sestnast";
            when 17 => return "sedemnast";
            when 18 => return "osemnast";
            when 19 => return "devatnast";
            when 20 => return "dvadsat";
            when others => return "";
         end case;
      else
         return English;
      end if;
   end Small_Locale_Word;

   function Locale_Tens_Word
     (Locale : String;
      Tens   : Natural)
      return String
   is
   begin
      if Locale = "de" then
         case Tens is
            when 2 => return "zwanzig";
            when 3 => return "drei" & U_Sharp_S & "ig";
            when 4 => return "vierzig";
            when 5 => return "f" & U_U_Umlaut & "nfzig";
            when 6 => return "sechzig";
            when 7 => return "siebzig";
            when 8 => return "achtzig";
            when 9 => return "neunzig";
            when others => return "";
         end case;
      elsif Locale = "fr" then
         case Tens is
            when 2 => return "vingt";
            when 3 => return "trente";
            when 4 => return "quarante";
            when 5 => return "cinquante";
            when 6 => return "soixante";
            when 7 => return "soixante-dix";
            when 8 => return "quatre-vingt";
            when 9 => return "quatre-vingt-dix";
            when others => return "";
         end case;
      elsif Locale = "da" then
         case Tens is
            when 2 => return "tyve";
            when 3 => return "tredive";
            when 4 => return "fyrre";
            when 5 => return "halvtreds";
            when 6 => return "tres";
            when 7 => return "halvfjerds";
            when 8 => return "firs";
            when 9 => return "halvfems";
            when others => return "";
         end case;
      elsif Locale = "es" then
         case Tens is
            when 2 => return "veinte";
            when 3 => return "treinta";
            when 4 => return "cuarenta";
            when 5 => return "cincuenta";
            when 6 => return "sesenta";
            when 7 => return "setenta";
            when 8 => return "ochenta";
            when 9 => return "noventa";
            when others => return "";
         end case;
      elsif Locale = "it" then
         case Tens is
            when 2 => return "venti";
            when 3 => return "trenta";
            when 4 => return "quaranta";
            when 5 => return "cinquanta";
            when 6 => return "sessanta";
            when 7 => return "settanta";
            when 8 => return "ottanta";
            when 9 => return "novanta";
            when others => return "";
         end case;
      elsif Locale = "pt" then
         case Tens is
            when 2 => return "vinte";
            when 3 => return "trinta";
            when 4 => return "quarenta";
            when 5 => return "cinquenta";
            when 6 => return "sessenta";
            when 7 => return "setenta";
            when 8 => return "oitenta";
            when 9 => return "noventa";
            when others => return "";
         end case;
      elsif Locale = "nl" then
         case Tens is
            when 2 => return "twintig";
            when 3 => return "dertig";
            when 4 => return "veertig";
            when 5 => return "vijftig";
            when 6 => return "zestig";
            when 7 => return "zeventig";
            when 8 => return "tachtig";
            when 9 => return "negentig";
            when others => return "";
         end case;
      elsif Locale = "sv" then
         case Tens is
            when 2 => return "tjugo";
            when 3 => return "trettio";
            when 4 => return "fyrtio";
            when 5 => return "femtio";
            when 6 => return "sextio";
            when 7 => return "sjuttio";
            when 8 => return U_A_Ring & "ttio";
            when 9 => return "nittio";
            when others => return "";
         end case;
      elsif Is_Norwegian (Locale) then
         case Tens is
            when 2 => return "tjue";
            when 3 => return "tretti";
            when 4 => return "f" & U_O_Slash & "rti";
            when 5 => return "femti";
            when 6 => return "seksti";
            when 7 => return "sytti";
            when 8 => return U_A_Ring & "tti";
            when 9 => return "nitti";
            when others => return "";
         end case;
      elsif Locale = "fi" then
         case Tens is
            when 2 => return "kaksikymment" & U_A_Umlaut;
            when 3 => return "kolmekymment" & U_A_Umlaut;
            when 4 => return "nelj" & U_A_Umlaut & "kymment" & U_A_Umlaut;
            when 5 => return "viisikymment" & U_A_Umlaut;
            when 6 => return "kuusikymment" & U_A_Umlaut;
            when 7 => return "seitsem" & U_A_Umlaut & "nkymment" & U_A_Umlaut;
            when 8 => return "kahdeksankymment" & U_A_Umlaut;
            when 9 => return "yhdeks" & U_A_Umlaut & "nkymment" & U_A_Umlaut;
            when others => return "";
         end case;
      elsif Locale = "tr" then
         case Tens is
            when 2 => return "yirmi";
            when 3 => return "otuz";
            when 4 => return "k" & U_I_Dotless & "rk";
            when 5 => return "elli";
            when 6 => return "altm" & U_I_Dotless & U_S_Cedilla;
            when 7 => return "yetmi" & U_S_Cedilla;
            when 8 => return "seksen";
            when 9 => return "doksan";
            when others => return "";
         end case;
      elsif Locale = "pl" then
         case Tens is
            when 2 => return "dwadzie" & U (16#15B#) & "cia";
            when 3 => return "trzydzie" & U (16#15B#) & "ci";
            when 4 => return "czterdzie" & U (16#15B#) & "ci";
            when 5 => return "pi" & U (16#119#) & U (16#107#) & "dziesi" & U (16#105#) & "t";
            when 6 => return "sze" & U (16#15B#) & U (16#107#) & "dziesi" & U (16#105#) & "t";
            when 7 => return "siedemdziesi" & U (16#105#) & "t";
            when 8 => return "osiemdziesi" & U (16#105#) & "t";
            when 9 => return "dziewi" & U (16#119#) & U (16#107#) & "dziesi" & U (16#105#) & "t";
            when others => return "";
         end case;
      elsif Locale = "cs" then
         case Tens is
            when 2 => return "dvacet";
            when 3 => return "t" & U (16#159#) & "icet";
            when 4 => return U (16#10D#) & "ty" & U (16#159#) & "icet";
            when 5 => return "pades" & U (16#E1#) & "t";
            when 6 => return U (16#161#) & "edes" & U (16#E1#) & "t";
            when 7 => return "sedmdes" & U (16#E1#) & "t";
            when 8 => return "osmdes" & U (16#E1#) & "t";
            when 9 => return "devades" & U (16#E1#) & "t";
            when others => return "";
         end case;
      elsif Locale = "ru" then
         case Tens is
            when 2 => return Small_Locale_Word (Locale, 20);
            when 3 => return U (16#442#) & U (16#440#) & U (16#438#) & U (16#434#) & U (16#446#) & U (16#430#) & U (16#442#) & U (16#44C#);
            when 4 => return U (16#441#) & U (16#43E#) & U (16#440#) & U (16#43E#) & U (16#43A#);
            when 5 => return U (16#43F#) & U (16#44F#) & U (16#442#) & U (16#44C#) & U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#);
            when 6 => return U (16#448#) & U (16#435#) & U (16#441#) & U (16#442#) & U (16#44C#) & U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#);
            when 7 => return U (16#441#) & U (16#435#) & U (16#43C#) & U (16#44C#) & U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#);
            when 8 => return U (16#432#) & U (16#43E#) & U (16#441#) & U (16#435#) & U (16#43C#) & U (16#44C#) & U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#);
            when 9 => return U (16#434#) & U (16#435#) & U (16#432#) & U (16#44F#) & U (16#43D#) & U (16#43E#) & U (16#441#) & U (16#442#) & U (16#43E#);
            when others => return "";
         end case;
      elsif Locale = "uk" then
         case Tens is
            when 2 => return Small_Locale_Word (Locale, 20);
            when 3 => return U (16#442#) & U (16#440#) & U (16#438#) & U (16#434#) & U (16#446#) & U (16#44F#) & U (16#442#) & U (16#44C#);
            when 4 => return U (16#441#) & U (16#43E#) & U (16#440#) & U (16#43E#) & U (16#43A#);
            when 5 => return U (16#43F#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#);
            when 6 => return U (16#448#) & U (16#456#) & U (16#441#) & U (16#442#) & U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#);
            when 7 => return U (16#441#) & U (16#456#) & U (16#43C#) & U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#);
            when 8 => return U (16#432#) & U (16#456#) & U (16#441#) & U (16#456#) & U (16#43C#) & U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#);
            when 9 => return U (16#434#) & U (16#435#) & U (16#432#) & U (16#2019#) & U (16#44F#) & U (16#43D#) & U (16#43E#) & U (16#441#) & U (16#442#) & U (16#43E#);
            when others => return "";
         end case;
      elsif Locale = "ar" then
         case Tens is
            when 2 => return Small_Locale_Word (Locale, 20);
            when 3 => return U (16#62B#) & U (16#644#) & U (16#627#) & U (16#62B#) & U (16#648#) & U (16#646#);
            when 4 => return U (16#623#) & U (16#631#) & U (16#628#) & U (16#639#) & U (16#648#) & U (16#646#);
            when 5 => return U (16#62E#) & U (16#645#) & U (16#633#) & U (16#648#) & U (16#646#);
            when 6 => return U (16#633#) & U (16#62A#) & U (16#648#) & U (16#646#);
            when 7 => return U (16#633#) & U (16#628#) & U (16#639#) & U (16#648#) & U (16#646#);
            when 8 => return U (16#62B#) & U (16#645#) & U (16#627#) & U (16#646#) & U (16#648#) & U (16#646#);
            when 9 => return U (16#62A#) & U (16#633#) & U (16#639#) & U (16#648#) & U (16#646#);
            when others => return "";
         end case;
      elsif Locale = "hi" then
         case Tens is
            when 2 => return Small_Locale_Word (Locale, 20);
            when 3 => return U (16#924#) & U (16#940#) & U (16#938#);
            when 4 => return U (16#91A#) & U (16#93E#) & U (16#932#) & U (16#940#) & U (16#938#);
            when 5 => return U (16#92A#) & U (16#91A#) & U (16#93E#) & U (16#938#);
            when 6 => return U (16#938#) & U (16#93E#) & U (16#920#);
            when 7 => return U (16#938#) & U (16#924#) & U (16#94D#) & U (16#924#) & U (16#930#);
            when 8 => return U (16#905#) & U (16#938#) & U (16#94D#) & U (16#938#) & U (16#940#);
            when 9 => return U (16#928#) & U (16#92C#) & U (16#94D#) & U (16#92C#) & U (16#947#);
            when others => return "";
         end case;
      elsif Locale = "ro" then
         case Tens is
            when 2 => return "douazeci";
            when 3 => return "treizeci";
            when 4 => return "patruzeci";
            when 5 => return "cincizeci";
            when 6 => return "saizeci";
            when 7 => return "saptezeci";
            when 8 => return "optzeci";
            when 9 => return "nouazeci";
            when others => return "";
         end case;
      elsif Locale = "lt" then
         case Tens is
            when 2 => return "dvidesimt";
            when 3 => return "trisdesimt";
            when 4 => return "keturiasdesimt";
            when 5 => return "penkiasdesimt";
            when 6 => return "sesiasdesimt";
            when 7 => return "septyniasdesimt";
            when 8 => return "astuoniasdesimt";
            when 9 => return "devyniasdesimt";
            when others => return "";
         end case;
      elsif Locale = "sl" then
         case Tens is
            when 2 => return "dvajset";
            when 3 => return "trideset";
            when 4 => return "stirideset";
            when 5 => return "petdeset";
            when 6 => return "sestdeset";
            when 7 => return "sedemdeset";
            when 8 => return "osemdeset";
            when 9 => return "devetdeset";
            when others => return "";
         end case;
      elsif Locale = "id" or else Locale = "ms" then
         case Tens is
            when 2 => return "dua puluh";
            when 3 => return "tiga puluh";
            when 4 => return "empat puluh";
            when 5 => return "lima puluh";
            when 6 => return "enam puluh";
            when 7 => return "tujuh puluh";
            when 8 => return (if Locale = "ms" then "lapan puluh" else "delapan puluh");
            when 9 => return "sembilan puluh";
            when others => return "";
         end case;
      elsif Locale = "eo" then
         case Tens is
            when 2 => return "dudek";
            when 3 => return "tridek";
            when 4 => return "kvardek";
            when 5 => return "kvindek";
            when 6 => return "sesdek";
            when 7 => return "sepdek";
            when 8 => return "okdek";
            when 9 => return "naudek";
            when others => return "";
         end case;
      elsif Locale = "vi" then
         case Tens is
            when 2 => return "hai muoi";
            when 3 => return "ba muoi";
            when 4 => return "bon muoi";
            when 5 => return "nam muoi";
            when 6 => return "sau muoi";
            when 7 => return "bay muoi";
            when 8 => return "tam muoi";
            when 9 => return "chin muoi";
            when others => return "";
         end case;
      elsif Locale = "sw" then
         case Tens is
            when 2 => return "ishirini";
            when 3 => return "thelathini";
            when 4 => return "arobaini";
            when 5 => return "hamsini";
            when 6 => return "sitini";
            when 7 => return "sabini";
            when 8 => return "themanini";
            when 9 => return "tisini";
            when others => return "";
         end case;
      elsif Locale = "af" then
         case Tens is
            when 2 => return "twintig";
            when 3 => return "dertig";
            when 4 => return "veertig";
            when 5 => return "vyftig";
            when 6 => return "sestig";
            when 7 => return "sewentig";
            when 8 => return "tagtig";
            when 9 => return "negentig";
            when others => return "";
         end case;
      elsif Locale = "hu" then
         case Tens is
            when 2 => return "husz";
            when 3 => return "harminc";
            when 4 => return "negyven";
            when 5 => return "otven";
            when 6 => return "hatvan";
            when 7 => return "hetven";
            when 8 => return "nyolcvan";
            when 9 => return "kilencven";
            when others => return "";
         end case;
      elsif Locale = "sk" then
         case Tens is
            when 2 => return "dvadsat";
            when 3 => return "tridsat";
            when 4 => return "styridsat";
            when 5 => return "patdesiat";
            when 6 => return "sestdesiat";
            when 7 => return "sedemdesiat";
            when 8 => return "osemdesiat";
            when 9 => return "devatdesiat";
            when others => return "";
         end case;
      else
         return Under_Thousand (Tens * 10);
      end if;
   end Locale_Tens_Word;

   function Locale_Word_99
     (Locale : String;
      Value  : Natural)
      return String
   is
      Tens : constant Natural := Value / 10;
      Ones : constant Natural := Value mod 10;
      Ten  : constant String := Locale_Tens_Word (Locale, Tens);
      One  : constant String := Small_Locale_Word (Locale, Ones);
   begin
      if Is_CJK_Spellout (Locale) and then Value > 10 and then Value < 100 then
         declare
            Ten_Unit : constant String :=
              (if Locale = "ko" then U (16#C2ED#) else U (16#5341#));
         begin
            if Value < 20 then
               return Ten_Unit
                 & (if Ones = 0 then "" else Small_Locale_Word (Locale, Ones));
            elsif Ones = 0 then
               return Small_Locale_Word (Locale, Tens) & Ten_Unit;
            else
               return Small_Locale_Word (Locale, Tens) & Ten_Unit
                 & Small_Locale_Word (Locale, Ones);
            end if;
         end;
      elsif Value <= 20 then
         return Small_Locale_Word (Locale, Value);
      elsif Value < 100 then
         if Locale = "fr" then
            if Value < 70 then
               if Ones = 0 then
                  return Ten;
               elsif Ones = 1 then
                  return Ten & "-et-un";
               else
                  return Ten & "-" & One;
               end if;
            elsif Value < 80 then
               if Value = 71 then
                  return "soixante-et-onze";
               else
                  return "soixante-" & Small_Locale_Word (Locale, Value - 60);
               end if;
            elsif Value = 80 then
               return "quatre-vingts";
            else
               return "quatre-vingt-" & Small_Locale_Word (Locale, Value - 80);
            end if;
         elsif Locale = "es" and then Value in 21 .. 29 then
            case Value is
               when 21 => return "veintiuno";
               when 22 => return "veintid" & U_O_Acute & "s";
               when 23 => return "veintitr" & U_E_Acute & "s";
               when 24 => return "veinticuatro";
               when 25 => return "veinticinco";
               when 26 => return "veintis" & U_E_Acute & "is";
               when 27 => return "veintisiete";
               when 28 => return "veintiocho";
               when others => return "veintinueve";
            end case;
         end if;

         if Ones = 0 then
            return Ten;
         elsif Locale = "de" then
            return (if Ones = 1 then "ein" else One) & "und" & Ten;
         elsif Locale = "da" then
            return One & "og" & Ten;
         elsif Locale = "nl" then
            return
              (if Ones = 2 then "twee" & U_E_Umlaut
               elsif Ones = 3 then "drie" & U_E_Umlaut
               else One)
              & (if Ones = 2 or else Ones = 3 then "n" else "en") & Ten;
         elsif Locale = "es" then
            return Ten & " y " & One;
         elsif Locale = "pt" then
            return Ten & " e " & One;
         elsif Locale = "it" then
            if Ones = 1 or else Ones = 8 then
               return Ten (Ten'First .. Ten'Last - 1) & One;
            else
               return Ten & One;
            end if;
         elsif Locale = "fr" then
            return Ten & "-" & One;
         elsif Locale = "sv" or else Is_Norwegian (Locale) or else Locale = "fi" then
            return Ten & One;
         elsif Locale = "tr" then
            return Ten & " " & One;
         elsif Locale = "ro" then
            return Ten & " si " & One;
         elsif Locale = "af" then
            return One & " en " & Ten;
         elsif Locale = "hu" then
            return Ten & One;
         elsif Locale = "sw" then
            return Ten & " na " & One;
         elsif Locale in "pl" | "cs" | "ru" | "uk" | "ar" | "hi"
           | "lt" | "sl" | "id" | "ms" | "eo" | "vi" | "sk"
         then
            return Ten & " " & One;
         else
            return Under_Thousand (Value);
         end if;
      else
         return "";
      end if;
   end Locale_Word_99;

   function Locale_Hundred_Word
     (Locale : String;
      Value  : Natural)
      return String
   is
      Hundreds : constant Natural := Value / 100;
      Rest     : constant Natural := Value mod 100;
      Prefix   : constant String :=
        (if Locale = "de" and then Hundreds = 1 then "ein"
         else Locale_Word_99 (Locale, Hundreds));

      function Spanish_Hundred return String is
      begin
         case Hundreds is
            when 1 => return (if Rest = 0 then "cien" else "ciento");
            when 2 => return "doscientos";
            when 3 => return "trescientos";
            when 4 => return "cuatrocientos";
            when 5 => return "quinientos";
            when 6 => return "seiscientos";
            when 7 => return "setecientos";
            when 8 => return "ochocientos";
            when others => return "novecientos";
         end case;
      end Spanish_Hundred;

      function Portuguese_Hundred return String is
      begin
         case Hundreds is
            when 1 => return (if Rest = 0 then "cem" else "cento");
            when 2 => return "duzentos";
            when 3 => return "trezentos";
            when 4 => return "quatrocentos";
            when 5 => return "quinhentos";
            when 6 => return "seiscentos";
            when 7 => return "setecentos";
            when 8 => return "oitocentos";
            when others => return "novecentos";
         end case;
      end Portuguese_Hundred;

      function Slavic_Hundred return String is
      begin
         if Locale = "pl" then
            case Hundreds is
               when 1 => return "sto";
               when 2 => return "dwie" & U (16#15B#) & "cie";
               when 3 => return "trzysta";
               when 4 => return "czterysta";
               when 5 => return "pi" & U (16#119#) & U (16#107#) & "set";
               when 6 => return "sze" & U (16#15B#) & U (16#107#) & "set";
               when 7 => return "siedemset";
               when 8 => return "osiemset";
               when others => return "dziewi" & U (16#119#) & U (16#107#) & "set";
            end case;
         elsif Locale = "cs" then
            case Hundreds is
               when 1 => return "sto";
               when 2 => return "dv" & U (16#11B#) & " st" & U (16#11B#);
               when 3 => return "t" & U (16#159#) & "i sta";
               when 4 => return U (16#10D#) & "ty" & U (16#159#) & "i sta";
               when 5 => return "p" & U (16#11B#) & "t set";
               when 6 => return U (16#161#) & "est set";
               when 7 => return "sedm set";
               when 8 => return "osm set";
               when others => return "dev" & U (16#11B#) & "t set";
            end case;
         elsif Locale = "ru" then
            case Hundreds is
               when 1 => return U (16#441#) & U (16#442#) & U (16#43E#);
               when 2 => return U (16#434#) & U (16#432#) & U (16#435#) & U (16#441#) & U (16#442#) & U (16#438#);
               when 3 => return U (16#442#) & U (16#440#) & U (16#438#) & U (16#441#) & U (16#442#) & U (16#430#);
               when 4 => return U (16#447#) & U (16#435#) & U (16#442#) & U (16#44B#) & U (16#440#) & U (16#435#) & U (16#441#) & U (16#442#) & U (16#430#);
               when 5 => return U (16#43F#) & U (16#44F#) & U (16#442#) & U (16#44C#) & U (16#441#) & U (16#43E#) & U (16#442#);
               when 6 => return U (16#448#) & U (16#435#) & U (16#441#) & U (16#442#) & U (16#44C#) & U (16#441#) & U (16#43E#) & U (16#442#);
               when 7 => return U (16#441#) & U (16#435#) & U (16#43C#) & U (16#44C#) & U (16#441#) & U (16#43E#) & U (16#442#);
               when 8 => return U (16#432#) & U (16#43E#) & U (16#441#) & U (16#435#) & U (16#43C#) & U (16#44C#) & U (16#441#) & U (16#43E#) & U (16#442#);
               when others => return U (16#434#) & U (16#435#) & U (16#432#) & U (16#44F#) & U (16#442#) & U (16#44C#) & U (16#441#) & U (16#43E#) & U (16#442#);
            end case;
         elsif Locale = "uk" then
            case Hundreds is
               when 1 => return U (16#441#) & U (16#442#) & U (16#43E#);
               when 2 => return U (16#434#) & U (16#432#) & U (16#456#) & U (16#441#) & U (16#442#) & U (16#456#);
               when 3 => return U (16#442#) & U (16#440#) & U (16#438#) & U (16#441#) & U (16#442#) & U (16#430#);
               when 4 => return U (16#447#) & U (16#43E#) & U (16#442#) & U (16#438#) & U (16#440#) & U (16#438#) & U (16#441#) & U (16#442#) & U (16#430#);
               when 5 => return U (16#43F#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#441#) & U (16#43E#) & U (16#442#);
               when 6 => return U (16#448#) & U (16#456#) & U (16#441#) & U (16#442#) & U (16#441#) & U (16#43E#) & U (16#442#);
               when 7 => return U (16#441#) & U (16#456#) & U (16#43C#) & U (16#441#) & U (16#43E#) & U (16#442#);
               when 8 => return U (16#432#) & U (16#456#) & U (16#441#) & U (16#456#) & U (16#43C#) & U (16#441#) & U (16#43E#) & U (16#442#);
               when others => return U (16#434#) & U (16#435#) & U (16#432#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#441#) & U (16#43E#) & U (16#442#);
            end case;
         else
            return "";
         end if;
      end Slavic_Hundred;
   begin
      if Value < 100 then
         return Locale_Word_99 (Locale, Value);
      elsif Locale = "de" then
         return Prefix & "hundert"
           & (if Rest = 0 then "" else Locale_Word_99 (Locale, Rest));
      elsif Locale = "da" then
         return (if Hundreds = 1 then "et" else Prefix) & " hundrede"
           & (if Rest = 0 then "" else " og " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "es" then
         return Spanish_Hundred
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "it" then
         if Rest = 0 then
            return (if Hundreds = 1 then "" else Prefix) & "cento";
         elsif Rest in 80 .. 89 then
            return (if Hundreds = 1 then "" else Prefix) & "cent"
              & Locale_Word_99 (Locale, Rest);
         else
            return (if Hundreds = 1 then "" else Prefix) & "cento"
              & Locale_Word_99 (Locale, Rest);
         end if;
      elsif Locale = "pt" then
         return Portuguese_Hundred
           & (if Rest = 0 then "" else " e " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "nl" then
         return (if Hundreds = 1 then "" else Prefix) & "honderd"
           & (if Rest = 0 then "" else Locale_Word_99 (Locale, Rest));
      elsif Locale = "sv" then
         return (if Hundreds = 1 then "ett" else Prefix) & " hundra"
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Is_Norwegian (Locale) then
         return (if Hundreds = 1 then "ett" else Prefix) & " hundre"
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "fi" then
         return (if Hundreds = 1 then "" else Prefix) & "sata"
           & (if Rest = 0 then "" else Locale_Word_99 (Locale, Rest));
      elsif Locale = "tr" then
         return (if Hundreds = 1 then "" else Prefix & " ") & "y" & U_U_Umlaut & "z"
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale in "pl" | "cs" | "ru" | "uk" then
         return Slavic_Hundred
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Is_CJK_Spellout (Locale) then
         declare
            Hundred_Unit : constant String :=
              (if Locale = "ko" then U (16#BC31#) else U (16#767E#));
         begin
            return
              (if Hundreds = 1 then "" else Small_Locale_Word (Locale, Hundreds))
              & Hundred_Unit
              & (if Rest = 0 then "" else Locale_Word_99 (Locale, Rest));
         end;
      elsif Locale = "ar" then
         declare
            Hundred : constant String :=
              (case Hundreds is
                  when 1 => U (16#645#) & U (16#626#) & U (16#629#),
                  when 2 => U (16#645#) & U (16#626#) & U (16#62A#) & U (16#627#) & U (16#646#),
                  when others => Small_Locale_Word (Locale, Hundreds) & " "
                    & U (16#645#) & U (16#626#) & U (16#629#));
         begin
            return Hundred
              & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
         end;
      elsif Locale = "hi" then
         return (if Hundreds = 1 then "" else Prefix & " ")
           & U (16#938#) & U (16#94C#)
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "ro" then
         return (if Hundreds = 1 then "o suta" else Prefix & " sute")
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "lt" then
         return (if Hundreds = 1 then "simtas" else Prefix & " simtai")
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "sl" then
         return (if Hundreds = 1 then "sto" else Prefix & "sto")
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "id" or else Locale = "ms" then
         return (if Hundreds = 1 then "seratus" else Prefix & " ratus")
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "eo" then
         return (if Hundreds = 1 then "cent" else Prefix & "cent")
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "vi" then
         return Prefix & " tram"
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "sw" then
         return (if Hundreds = 1 then "mia moja" else "mia " & Prefix)
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "af" then
         return (if Hundreds = 1 then "een" else Prefix) & "honderd"
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "hu" then
         return (if Hundreds = 1 then "szaz" else Prefix & "szaz")
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Locale = "sk" then
         return (if Hundreds = 1 then "sto" else Prefix & "sto")
           & (if Rest = 0 then "" else " " & Locale_Word_99 (Locale, Rest));
      elsif Rest = 0 then
         if Locale = "fr" and then Hundreds > 1 then
            return Prefix & " cents";
         else
            return Prefix & " hundred";
         end if;
      else
         if Locale = "fr" and then Hundreds = 1 then
            return "cent " & Locale_Word_99 (Locale, Rest);
         elsif Locale = "fr" then
            return Prefix & " cent " & Locale_Word_99 (Locale, Rest);
         else
            return Prefix & " hundred " & Locale_Word_99 (Locale, Rest);
         end if;
      end if;
   end Locale_Hundred_Word;

   function Locale_Scale_Word
     (Locale : String;
      Scale  : Positive;
      Count  : Natural := 2)
      return String is
   begin
      case Scale is
         when 1 =>
            if Locale = "de" then
               return "tausend";
            elsif Locale = "fr" then
               return "mille";
            elsif Locale = "da" then
               return "tusind";
            elsif Locale = "es" then
               return "mil";
            elsif Locale = "it" then
               return (if Count = 1 then "mille" else "mila");
            elsif Locale = "pt" then
               return "mil";
            elsif Locale = "nl" then
               return "duizend";
            elsif Locale = "sv" then
               return (if Count = 1 then "tusen" else "tusen");
            elsif Is_Norwegian (Locale) then
               return (if Count = 1 then "tusen" else "tusen");
            elsif Locale = "fi" then
               return (if Count = 1 then "tuhat" else "tuhatta");
            elsif Locale = "tr" then
               return "bin";
            elsif Locale = "pl" then
               return
                 (if Count = 1
                  then "tysi" & U (16#105#) & "c"
                  elsif Count in 2 .. 4
                  then "tysi" & U (16#105#) & "ce"
                  else "tysi" & U (16#119#) & "cy");
            elsif Locale = "cs" then
               return
                 (if Count = 1
                  then "tis" & U (16#ED#) & "c"
                  elsif Count in 2 .. 4
                  then "tis" & U (16#ED#) & "ce"
                  else "tis" & U (16#ED#) & "c");
            elsif Locale = "ru" then
               return
                 (if Count = 1
                  then U (16#442#) & U (16#44B#) & U (16#441#)
                    & U (16#44F#) & U (16#447#) & U (16#430#)
                  elsif Count in 2 .. 4
                  then U (16#442#) & U (16#44B#) & U (16#441#)
                    & U (16#44F#) & U (16#447#) & U (16#438#)
                  else U (16#442#) & U (16#44B#) & U (16#441#)
                    & U (16#44F#) & U (16#447#));
            elsif Locale = "uk" then
               return
                 (if Count = 1
                  then U (16#442#) & U (16#438#) & U (16#441#)
                    & U (16#44F#) & U (16#447#) & U (16#430#)
                  elsif Count in 2 .. 4
                  then U (16#442#) & U (16#438#) & U (16#441#)
                    & U (16#44F#) & U (16#447#) & U (16#456#)
                  else U (16#442#) & U (16#438#) & U (16#441#)
                    & U (16#44F#) & U (16#447#));
            elsif Locale = "ja" or else Locale = "zh" then
               return U (16#5343#);
            elsif Locale = "ko" then
               return U (16#CC9C#);
            elsif Locale = "ar" then
               return U (16#623#) & U (16#644#) & U (16#641#);
            elsif Locale = "hi" then
               return U (16#939#) & U (16#91C#) & U (16#93E#) & U (16#930#);
            elsif Locale in "ro" | "lt" | "sl" | "id" | "ms" | "eo"
              | "vi" | "sw" | "af" | "hu" | "sk"
            then
               return
                 (if Locale = "ro" then "mie"
                  elsif Locale = "lt" then "tukstantis"
                  elsif Locale = "sl" then "tisoc"
                  elsif Locale = "id" or else Locale = "ms" then "ribu"
                  elsif Locale = "eo" then "mil"
                  elsif Locale = "vi" then "nghin"
                  elsif Locale = "sw" then "elfu"
                  elsif Locale = "af" then "duisend"
                  elsif Locale = "hu" then "ezer"
                  else "tisic");
            else
               return "thousand";
            end if;
         when 2 =>
            if Locale = "de" then
               return (if Count = 1 then "Million" else "Millionen");
            elsif Locale = "fr" then
               return (if Count = 1 then "million" else "millions");
            elsif Locale = "da" then
               return (if Count = 1 then "million" else "millioner");
            elsif Locale = "es" then
               return (if Count = 1 then "mill" & U_O_Acute & "n" else "millones");
            elsif Locale = "it" then
               return (if Count = 1 then "milione" else "milioni");
            elsif Locale = "pt" then
               return
                 (if Count = 1
                  then "milh" & U_A_Tilde & "o"
                  else "milh" & U_O_Tilde & "es");
            elsif Locale = "nl" then
               return "miljoen";
            elsif Locale = "sv" then
               return (if Count = 1 then "miljon" else "miljoner");
            elsif Is_Norwegian (Locale) then
               return (if Count = 1 then "million" else "millioner");
            elsif Locale = "fi" then
               return (if Count = 1 then "miljoona" else "miljoonaa");
            elsif Locale = "tr" then
               return "milyon";
            elsif Locale = "pl" then
               return (if Count = 1 then "milion" else "miliony");
            elsif Locale = "cs" then
               return (if Count = 1 then "milion" else "miliony");
            elsif Locale = "ru" then
               return U (16#43C#) & U (16#438#) & U (16#43B#) & U (16#43B#) & U (16#438#) & U (16#43E#) & U (16#43D#);
            elsif Locale = "uk" then
               return U (16#43C#) & U (16#456#) & U (16#43B#) & U (16#44C#) & U (16#439#) & U (16#43E#) & U (16#43D#);
            elsif Locale = "ja" or else Locale = "zh" then
               return U (16#767E#) & U (16#4E07#);
            elsif Locale = "ko" then
               return U (16#BC31#) & U (16#B9CC#);
            elsif Locale = "ar" then
               return U (16#645#) & U (16#644#) & U (16#64A#) & U (16#648#) & U (16#646#);
            elsif Locale = "hi" then
               return U (16#932#) & U (16#93E#) & U (16#916#);
            elsif Locale in "ro" | "lt" | "sl" | "id" | "ms" | "eo"
              | "vi" | "sw" | "af" | "hu" | "sk"
            then
               return
                 (if Locale = "ro" then (if Count = 1 then "milion" else "milioane")
                  elsif Locale = "lt" then (if Count = 1 then "milijonas" else "milijonai")
                  elsif Locale = "sl" then (if Count = 1 then "milijon" else "milijoni")
                  elsif Locale = "id" or else Locale = "ms" then "juta"
                  elsif Locale = "eo" then (if Count = 1 then "miliono" else "milionoj")
                  elsif Locale = "vi" then "trieu"
                  elsif Locale = "sw" then "milioni"
                  elsif Locale = "af" then "miljoen"
                  elsif Locale = "hu" then "millio"
                  else (if Count = 1 then "milion" else "miliony"));
            else
               return "million";
            end if;
         when 3 =>
            if Locale = "de" then
               return (if Count = 1 then "Milliarde" else "Milliarden");
            elsif Locale = "fr" then
               return (if Count = 1 then "milliard" else "milliards");
            elsif Locale = "da" then
               return (if Count = 1 then "milliard" else "milliarder");
            elsif Locale = "es" then
               return "mil millones";
            elsif Locale = "it" then
               return (if Count = 1 then "miliardo" else "miliardi");
            elsif Locale = "pt" then
               return
                 (if Count = 1
                  then "bilh" & U_A_Tilde & "o"
                  else "bilh" & U_O_Tilde & "es");
            elsif Locale = "nl" then
               return "miljard";
            elsif Locale = "sv" then
               return (if Count = 1 then "miljard" else "miljarder");
            elsif Is_Norwegian (Locale) then
               return (if Count = 1 then "milliard" else "milliarder");
            elsif Locale = "fi" then
               return (if Count = 1 then "miljardi" else "miljardia");
            elsif Locale = "tr" then
               return "milyar";
            elsif Locale = "pl" then
               return (if Count = 1 then "miliard" else "miliardy");
            elsif Locale = "cs" then
               return (if Count = 1 then "miliarda" else "miliardy");
            elsif Locale = "ru" then
               return U (16#43C#) & U (16#438#) & U (16#43B#) & U (16#43B#) & U (16#438#) & U (16#430#) & U (16#440#) & U (16#434#);
            elsif Locale = "uk" then
               return U (16#43C#) & U (16#456#) & U (16#43B#) & U (16#44C#) & U (16#44F#) & U (16#440#) & U (16#434#);
            elsif Locale = "ja" or else Locale = "zh" then
               return U (16#5341#) & U (16#5104#);
            elsif Locale = "ko" then
               return U (16#C2ED#) & U (16#C5B5#);
            elsif Locale = "ar" then
               return U (16#645#) & U (16#644#) & U (16#64A#) & U (16#627#) & U (16#631#);
            elsif Locale = "hi" then
               return U (16#915#) & U (16#930#) & U (16#94B#) & U (16#921#);
            elsif Locale in "ro" | "lt" | "sl" | "id" | "ms" | "eo"
              | "vi" | "sw" | "af" | "hu" | "sk"
            then
               return
                 (if Locale = "ro" then (if Count = 1 then "miliard" else "miliarde")
                  elsif Locale = "lt" then (if Count = 1 then "milijardas" else "milijardai")
                  elsif Locale = "sl" then (if Count = 1 then "milijarda" else "milijarde")
                  elsif Locale = "id" or else Locale = "ms" then "miliar"
                  elsif Locale = "eo" then (if Count = 1 then "miliardo" else "miliardoj")
                  elsif Locale = "vi" then "ty"
                  elsif Locale = "sw" then "bilioni"
                  elsif Locale = "af" then "miljard"
                  elsif Locale = "hu" then "milliard"
                  else (if Count = 1 then "miliarda" else "miliardy"));
            else
               return "billion";
            end if;
         when 4 =>
            if Locale = "de" then
               return (if Count = 1 then "Billion" else "Billionen");
            elsif Locale = "fr" then
               return (if Count = 1 then "billion" else "billions");
            elsif Locale = "da" then
               return (if Count = 1 then "billion" else "billioner");
            elsif Locale = "es" then
               return (if Count = 1 then "bill" & U_O_Acute & "n" else "billones");
            elsif Locale = "it" then
               return (if Count = 1 then "bilione" else "bilioni");
            elsif Locale = "pt" then
               return
                 (if Count = 1
                  then "trilh" & U_A_Tilde & "o"
                  else "trilh" & U_O_Tilde & "es");
            elsif Locale = "nl" then
               return "biljoen";
            elsif Locale = "sv" then
               return (if Count = 1 then "biljon" else "biljoner");
            elsif Is_Norwegian (Locale) then
               return (if Count = 1 then "billion" else "billioner");
            elsif Locale = "fi" then
               return (if Count = 1 then "biljoona" else "biljoonaa");
            elsif Locale = "tr" then
               return "trilyon";
            elsif Locale = "pl" then
               return (if Count = 1 then "bilion" else "biliony");
            elsif Locale = "cs" then
               return (if Count = 1 then "bilion" else "biliony");
            elsif Locale = "ru" then
               return U (16#442#) & U (16#440#) & U (16#438#) & U (16#43B#) & U (16#43B#) & U (16#438#) & U (16#43E#) & U (16#43D#);
            elsif Locale = "uk" then
               return U (16#442#) & U (16#440#) & U (16#438#) & U (16#43B#) & U (16#44C#) & U (16#439#) & U (16#43E#) & U (16#43D#);
            elsif Locale = "ja" or else Locale = "zh" then
               return U (16#5146#);
            elsif Locale = "ko" then
               return U (16#C870#);
            elsif Locale = "ar" then
               return U (16#62A#) & U (16#631#) & U (16#64A#) & U (16#644#) & U (16#64A#) & U (16#648#) & U (16#646#);
            elsif Locale = "hi" then
               return U (16#916#) & U (16#930#) & U (16#92C#);
            elsif Locale in "ro" | "lt" | "sl" | "id" | "ms" | "eo"
              | "vi" | "sw" | "af" | "hu" | "sk"
            then
               return
                 (if Locale = "ro" then (if Count = 1 then "bilion" else "bilioane")
                  elsif Locale = "lt" then (if Count = 1 then "bilijonas" else "bilijonai")
                  elsif Locale = "sl" then (if Count = 1 then "bilijon" else "bilijoni")
                  elsif Locale = "id" or else Locale = "ms" then "triliun"
                  elsif Locale = "eo" then (if Count = 1 then "duiliono" else "duilionoj")
                  elsif Locale = "vi" then "nghin ty"
                  elsif Locale = "sw" then "trilioni"
                  elsif Locale = "af" then "biljoen"
                  elsif Locale = "hu" then "billio"
                  else (if Count = 1 then "bilion" else "biliony"));
            else
               return "trillion";
            end if;
         when 5 =>
            if Locale = "de" then
               return (if Count = 1 then "Billiarde" else "Billiarden");
            elsif Locale = "fr" then
               return (if Count = 1 then "billiard" else "billiards");
            elsif Locale = "da" then
               return (if Count = 1 then "billiard" else "billiarder");
            elsif Locale = "es" then
               return "mil billones";
            elsif Locale = "it" then
               return (if Count = 1 then "biliardo" else "biliardi");
            elsif Locale = "pt" then
               return
                 (if Count = 1
                  then "quatrilh" & U_A_Tilde & "o"
                  else "quatrilh" & U_O_Tilde & "es");
            elsif Locale = "nl" then
               return "biljard";
            elsif Locale = "sv" then
               return (if Count = 1 then "biljard" else "biljarder");
            elsif Is_Norwegian (Locale) then
               return (if Count = 1 then "billiard" else "billiarder");
            elsif Locale = "fi" then
               return (if Count = 1 then "biljardi" else "biljardia");
            elsif Locale = "tr" then
               return "katrilyon";
            else
               return "quadrillion";
            end if;
         when others =>
            return Scale_Name (Scale);
      end case;
   end Locale_Scale_Word;

   function Locale_CJK_Group_Word
     (Locale : String;
      Value  : Natural)
      return String
   is
      Thousands : constant Natural := Value / 1_000;
      Remainder : constant Natural := Value mod 1_000;
      Result    : Unbounded_String;
   begin
      if Value <= 999 then
         return Locale_Hundred_Word (Locale, Value);
      elsif Value > 9_999 then
         return "";
      end if;

      if Thousands = 1 then
         Append (Result, Locale_Scale_Word (Locale, 1, 1));
      else
         Append (Result, Small_Locale_Word (Locale, Thousands));
         Append (Result, Locale_Scale_Word (Locale, 1, Thousands));
      end if;

      if Remainder > 0 then
         Append (Result, Locale_Hundred_Word (Locale, Remainder));
      end if;

      return To_String (Result);
   end Locale_CJK_Group_Word;

   function Locale_CJK_Myriad_Scale_Word
     (Locale : String;
      Scale  : Positive)
      return String is
   begin
      case Scale is
         when 1 =>
            return (if Locale = "ko" then U (16#B9CC#) else U (16#4E07#));
         when 2 =>
            return
              (if Locale = "ko" then U (16#C5B5#)
               elsif Locale = "zh" then U (16#4EBF#)
               else U (16#5104#));
         when 3 =>
            return (if Locale = "ko" then U (16#C870#) else U (16#5146#));
         when others =>
            return "";
      end case;
   end Locale_CJK_Myriad_Scale_Word;

   function Locale_Long_Word
     (Locale : String;
      Value  : Long_Long_Integer)
      return String
   is
      type Segment_Array is array (Positive range <>) of Natural;
      Segments : Segment_Array (1 .. 6) := [others => 0];
      Length   : Natural := 0;
      Rest     : Long_Long_Integer := Value;
      Result   : Unbounded_String;
   begin
      if Is_CJK_Spellout (Locale) then
         declare
            type Segment_Array is array (Positive range <>) of Natural;
            Segments : Segment_Array (1 .. 3) := [others => 0];
            Length   : Natural := 0;
            Rest     : Long_Long_Integer := Value;
            Text     : Unbounded_String;
         begin
            if Value <= 9_999 then
               return Locale_CJK_Group_Word (Locale, Natural (Value));
            elsif Value > 999_999_999_999 then
               return "";
            end if;

            while Rest > 0 and then Length < Segments'Length loop
               Length := Length + 1;
               Segments (Length) := Natural (Rest mod 10_000);
               Rest := Rest / 10_000;
            end loop;

            for Index in reverse 1 .. Length loop
               if Segments (Index) /= 0 then
                  if Index > 1 and then Segments (Index) = 1 then
                     Append
                       (Text, Locale_CJK_Myriad_Scale_Word (Locale, Index - 1));
                  else
                     Append (Text, Locale_CJK_Group_Word (Locale, Segments (Index)));
                     if Index > 1 then
                        Append
                          (Text,
                           Locale_CJK_Myriad_Scale_Word (Locale, Index - 1));
                     end if;
                  end if;
               end if;
            end loop;

            return To_String (Text);
         end;
      end if;

      if Value <= 999 then
         return Locale_Hundred_Word (Locale, Natural (Value));
      elsif Value > 999_999_999_999_999_999 then
         return "";
      end if;

      while Rest > 0 and then Length < Segments'Length loop
         Length := Length + 1;
         Segments (Length) := Natural (Rest mod 1_000);
         Rest := Rest / 1_000;
      end loop;

      for Index in reverse 1 .. Length loop
         if Segments (Index) /= 0 then
            if Ada.Strings.Unbounded.Length (Result) > 0 then
               if Locale = "de" and then Index = 1
                 and then Length >= 2 and then Segments (2) /= 0
               then
                  null;
               else
                  Append (Result, " ");
               end if;
            end if;
            if Index = 2 and then Segments (Index) = 1
              and then
                (Locale in "de" | "fr" | "da" | "es" | "it" | "pt" | "nl"
                 or else Locale = "sv" or else Is_Norwegian (Locale)
                 or else Locale = "fi" or else Locale = "tr"
                 or else Has_Generated_Spellout (Locale))
            then
               if Locale = "de" then
                  Append (Result, "eintausend");
               elsif Locale = "da" then
                  Append (Result, "et " & Locale_Scale_Word (Locale, 1, 1));
               elsif Locale = "sv" then
                  Append (Result, "ett " & Locale_Scale_Word (Locale, 1, 1));
               elsif Is_Norwegian (Locale) then
                  Append (Result, "ett " & Locale_Scale_Word (Locale, 1, 1));
               elsif Locale = "fi" then
                  Append (Result, Locale_Scale_Word (Locale, 1, 1));
               elsif Locale = "tr" then
                  Append (Result, Locale_Scale_Word (Locale, 1, 1));
               elsif Has_Generated_Spellout (Locale) then
                  Append (Result, Locale_Scale_Word (Locale, 1, 1));
               elsif Locale = "fr" or else Locale = "es"
                 or else Locale = "it" or else Locale = "pt"
                 or else Locale = "nl"
               then
                  Append (Result, Locale_Scale_Word (Locale, 1, 1));
               end if;
            elsif Index > 2 and then Segments (Index) = 1
              and then Locale = "de"
            then
               Append (Result, "eine " & Locale_Scale_Word (Locale, Index - 1, 1));
            elsif Index > 2 and then Segments (Index) = 1
              and then Locale in "es" | "it"
            then
               Append
                 (Result,
                  (if Locale = "es" and then (Index - 1 = 3 or else Index - 1 = 5)
                   then ""
                   else "un ")
                  & Locale_Scale_Word (Locale, Index - 1, 1));
            elsif Index = 2 and then Locale in "de" | "it" | "nl" then
               Append
                 (Result,
                  Locale_Hundred_Word (Locale, Segments (Index))
                  & Locale_Scale_Word (Locale, 1, Segments (Index)));
            elsif Locale = "de" and then Index = 2 and then Segments (Index) = 1 then
               Append (Result, "eintausend");
            else
               Append (Result, Locale_Hundred_Word (Locale, Segments (Index)));
               if Index > 1 then
                  Append
                    (Result,
                     " " & Locale_Scale_Word
                       (Locale, Index - 1, Segments (Index)));
               end if;
            end if;
         end if;
      end loop;

      return To_String (Result);
   end Locale_Long_Word;

   function Locale_Cardinal
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result
   is
      Locale : constant String := Locale_Prefix (Context);
      Abs_Value : constant Long_Long_Integer := abs Value;
      Word : constant String := Locale_Long_Word (Locale, Abs_Value);
   begin
      if Word'Length = 0 then
         return Signed_Cardinal (Context, Value);
      elsif Value < 0 then
         return
           (Status => Humanize.Status.Ok,
            Text   => To_Unbounded_String
              ((if Locale = "de" then "minus "
                elsif Locale = "fr" then "moins "
                elsif Locale = "da" then "minus "
                else "minus ") & Word),
            Key    => Humanize.Messages.No_Message);
      else
         return
           (Status => Humanize.Status.Ok,
            Text   => To_Unbounded_String (Word),
            Key    => Humanize.Messages.No_Message);
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
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Locale_Cardinal_Into;

   function Digit_Word (Digit : Character) return String is
   begin
      case Digit is
         when '0' => return "zero";
         when '1' => return "one";
         when '2' => return "two";
         when '3' => return "three";
         when '4' => return "four";
         when '5' => return "five";
         when '6' => return "six";
         when '7' => return "seven";
         when '8' => return "eight";
         when others => return "nine";
      end case;
   end Digit_Word;

   function Locale_Digit_Word
     (Locale : String;
      Digit  : Character)
      return String
   is
   begin
      if Digit not in '0' .. '9' then
         return "";
      end if;

      return
        Small_Locale_Word
          (Locale, Character'Pos (Digit) - Character'Pos ('0'));
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
      elsif Locale = "sv" or else Is_Norwegian (Locale) then
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
      Locale : constant String := Locale_Prefix (Context);
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
            To_String
              (Locale_Cardinal
                 (Context, Long_Long_Integer'Value (Image)).Text));
      else
         Append
           (Result,
            To_String
              (Locale_Cardinal
                 (Context,
                  Long_Long_Integer'Value (Image (Image'First .. Dot - 1))).Text));
         Append (Result, " " & Locale_Decimal_Marker_Word (Locale));
         for Index in Dot + 1 .. Image'Last loop
            Append (Result, " " & Locale_Digit_Word (Locale, Image (Index)));
         end loop;
      end if;

      return
        (Status => Humanize.Status.Ok,
         Text => Result,
         Key => Humanize.Messages.No_Message);
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
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
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
      elsif Is_Norwegian (Locale) then
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
      elsif Is_CJK_Spellout (Locale) then
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
      Locale : constant String := Locale_Prefix (Context);
      Den : constant String :=
        Locale_Fraction_Denominator_Word
          (Locale, Denominator, Numerator /= 1);
      Text : constant String :=
        (if Den'Length > 0
         then
           (if Is_CJK_Spellout (Locale)
            then Den &
              To_String
                (Locale_Cardinal (Context, Long_Long_Integer (Numerator)).Text)
            elsif Locale = "tr" and then Denominator > 2
            then Den & " " &
              To_String
                (Locale_Cardinal (Context, Long_Long_Integer (Numerator)).Text)
            else To_String
              (Locale_Cardinal (Context, Long_Long_Integer (Numerator)).Text)
              & " " & Den)
         elsif Locale = "en"
         then Cardinal_Text (Numerator) & " over " & Cardinal_Text (Denominator)
         else To_String (Locale_Cardinal (Context, Long_Long_Integer (Numerator)).Text)
           & " over "
           & To_String
             (Locale_Cardinal (Context, Long_Long_Integer (Denominator)).Text));
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String (Text),
         Key => Humanize.Messages.No_Message);
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
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Fraction_Words_Into;

   function Ordinal_Under_Thousand (Value : Natural) return String is
      function Direct (Item : Natural) return String is
      begin
         case Item is
            when 0 => return "zeroth";
            when 1 => return "first";
            when 2 => return "second";
            when 3 => return "third";
            when 4 => return "fourth";
            when 5 => return "fifth";
            when 6 => return "sixth";
            when 7 => return "seventh";
            when 8 => return "eighth";
            when 9 => return "ninth";
            when 10 => return "tenth";
            when 11 => return "eleventh";
            when 12 => return "twelfth";
            when 13 => return "thirteenth";
            when 14 => return "fourteenth";
            when 15 => return "fifteenth";
            when 16 => return "sixteenth";
            when 17 => return "seventeenth";
            when 18 => return "eighteenth";
            when others => return "nineteenth";
         end case;
      end Direct;

      Tens_Value : constant Natural := Value / 10;
      Ones_Value : constant Natural := Value mod 10;
      Hundreds : constant Natural := Value / 100;
      Rest : constant Natural := Value mod 100;
   begin
      if Value < 20 then
         return Direct (Value);
      elsif Value < 100 then
         if Ones_Value = 0 then
            case Tens_Value is
               when 2 => return "twentieth";
               when 3 => return "thirtieth";
               when 4 => return "fortieth";
               when 5 => return "fiftieth";
               when 6 => return "sixtieth";
               when 7 => return "seventieth";
               when 8 => return "eightieth";
               when others => return "ninetieth";
            end case;
         else
            return Under_Thousand (Tens_Value * 10) & "-"
              & Ordinal_Under_Thousand (Ones_Value);
         end if;
      elsif Rest = 0 then
         return Under_Thousand (Hundreds) & " hundredth";
      else
         return Under_Thousand (Hundreds) & " hundred "
           & Ordinal_Under_Thousand (Rest);
      end if;
   end Ordinal_Under_Thousand;

   function Ordinal_Words_Text (Value : Natural) return String is
      Thousands : constant Natural := Value / 1_000;
      Rest      : constant Natural := Value mod 1_000;
   begin
      if Value < 1_000 then
         return Ordinal_Under_Thousand (Value);
      elsif Value < 1_000_000 then
         if Rest = 0 then
            return Under_Thousand (Thousands) & " thousandth";
         else
            return Under_Thousand (Thousands) & " thousand "
              & Ordinal_Under_Thousand (Rest);
         end if;
      else
         return Cardinal_Text (Value);
      end if;
   end Ordinal_Words_Text;

   function Locale_Ordinal_Words_Text
     (Locale : String;
      Value  : Natural)
      return String
   is
      function Direct return String is
      begin
         if Locale = "de" then
            case Value is
               when 0 => return "nullte";
               when 1 => return "erste";
               when 2 => return "zweite";
               when 3 => return "dritte";
               when 4 => return "vierte";
               when 5 => return "f" & U_U_Umlaut & "nfte";
               when 6 => return "sechste";
               when 7 => return "siebte";
               when 8 => return "achte";
               when 9 => return "neunte";
               when 10 => return "zehnte";
               when 11 => return "elfte";
               when 12 => return "zw" & U_O_Umlaut & "lfte";
               when 13 => return "dreizehnte";
               when 14 => return "vierzehnte";
               when 15 => return "f" & U_U_Umlaut & "nfzehnte";
               when 16 => return "sechzehnte";
               when 17 => return "siebzehnte";
               when 18 => return "achtzehnte";
               when 19 => return "neunzehnte";
               when others => return "";
            end case;
         elsif Locale = "fr" then
            case Value is
               when 0 => return "z" & U_E_Acute & "roi" & U_E_Grave & "me";
               when 1 => return "premier";
               when 2 => return "deuxi" & U_E_Grave & "me";
               when 3 => return "troisi" & U_E_Grave & "me";
               when 4 => return "quatri" & U_E_Grave & "me";
               when 5 => return "cinqui" & U_E_Grave & "me";
               when 6 => return "sixi" & U_E_Grave & "me";
               when 7 => return "septi" & U_E_Grave & "me";
               when 8 => return "huiti" & U_E_Grave & "me";
               when 9 => return "neuvi" & U_E_Grave & "me";
               when 10 => return "dixi" & U_E_Grave & "me";
               when 11 => return "onzi" & U_E_Grave & "me";
               when 12 => return "douzi" & U_E_Grave & "me";
               when 13 => return "treizi" & U_E_Grave & "me";
               when 14 => return "quatorzi" & U_E_Grave & "me";
               when 15 => return "quinzi" & U_E_Grave & "me";
               when 16 => return "seizi" & U_E_Grave & "me";
               when 17 => return "dix-septi" & U_E_Grave & "me";
               when 18 => return "dix-huiti" & U_E_Grave & "me";
               when 19 => return "dix-neuvi" & U_E_Grave & "me";
               when 20 => return "vingti" & U_E_Grave & "me";
               when others => return "";
            end case;
         elsif Locale = "da" then
            case Value is
               when 0 => return "nulte";
               when 1 => return "f" & U_O_Slash & "rste";
               when 2 => return "anden";
               when 3 => return "tredje";
               when 4 => return "fjerde";
               when 5 => return "femte";
               when 6 => return "sjette";
               when 7 => return "syvende";
               when 8 => return "ottende";
               when 9 => return "niende";
               when 10 => return "tiende";
               when 11 => return "ellevte";
               when 12 => return "tolvte";
               when 13 => return "trettende";
               when 14 => return "fjortende";
               when 15 => return "femtende";
               when 16 => return "sekstende";
               when 17 => return "syttende";
               when 18 => return "attende";
               when 19 => return "nittende";
               when 20 => return "tyvende";
               when others => return "";
            end case;
         elsif Locale = "es" then
            case Value is
               when 0 => return "cero";
               when 1 => return "primero";
               when 2 => return "segundo";
               when 3 => return "tercero";
               when 4 => return "cuarto";
               when 5 => return "quinto";
               when 6 => return "sexto";
               when 7 => return "s" & U_E_Acute & "ptimo";
               when 8 => return "octavo";
               when 9 => return "noveno";
               when 10 => return "d" & U_E_Acute & "cimo";
               when 11 => return "und" & U_E_Acute & "cimo";
               when 12 => return "duod" & U_E_Acute & "cimo";
               when 13 => return "decimotercero";
               when 14 => return "decimocuarto";
               when 15 => return "decimoquinto";
               when 16 => return "decimosexto";
               when 17 => return "decimos" & U_E_Acute & "ptimo";
               when 18 => return "decimoctavo";
               when 19 => return "decimonoveno";
               when 20 => return "vig" & U_E_Acute & "simo";
               when others => return "";
            end case;
         elsif Locale = "it" then
            case Value is
               when 0 => return "zeresimo";
               when 1 => return "primo";
               when 2 => return "secondo";
               when 3 => return "terzo";
               when 4 => return "quarto";
               when 5 => return "quinto";
               when 6 => return "sesto";
               when 7 => return "settimo";
               when 8 => return "ottavo";
               when 9 => return "nono";
               when 10 => return "decimo";
               when 11 => return "undicesimo";
               when 12 => return "dodicesimo";
               when 13 => return "tredicesimo";
               when 14 => return "quattordicesimo";
               when 15 => return "quindicesimo";
               when 16 => return "sedicesimo";
               when 17 => return "diciassettesimo";
               when 18 => return "diciottesimo";
               when 19 => return "diciannovesimo";
               when 20 => return "ventesimo";
               when others => return "";
            end case;
         elsif Locale = "pt" then
            case Value is
               when 0 => return "zero";
               when 1 => return "primeiro";
               when 2 => return "segundo";
               when 3 => return "terceiro";
               when 4 => return "quarto";
               when 5 => return "quinto";
               when 6 => return "sexto";
               when 7 => return "s" & U_E_Acute & "timo";
               when 8 => return "oitavo";
               when 9 => return "nono";
               when 10 => return "d" & U_E_Acute & "cimo";
               when 11 => return "d" & U_E_Acute & "cimo primeiro";
               when 12 => return "d" & U_E_Acute & "cimo segundo";
               when 13 => return "d" & U_E_Acute & "cimo terceiro";
               when 14 => return "d" & U_E_Acute & "cimo quarto";
               when 15 => return "d" & U_E_Acute & "cimo quinto";
               when 16 => return "d" & U_E_Acute & "cimo sexto";
               when 17 => return "d" & U_E_Acute & "cimo s" & U_E_Acute & "timo";
               when 18 => return "d" & U_E_Acute & "cimo oitavo";
               when 19 => return "d" & U_E_Acute & "cimo nono";
               when 20 => return "vig" & U_E_Acute & "simo";
               when others => return "";
            end case;
         elsif Locale = "nl" then
            case Value is
               when 0 => return "nulde";
               when 1 => return "eerste";
               when 2 => return "tweede";
               when 3 => return "derde";
               when 4 => return "vierde";
               when 5 => return "vijfde";
               when 6 => return "zesde";
               when 7 => return "zevende";
               when 8 => return "achtste";
               when 9 => return "negende";
               when 10 => return "tiende";
               when 11 => return "elfde";
               when 12 => return "twaalfde";
               when 13 => return "dertiende";
               when 14 => return "veertiende";
               when 15 => return "vijftiende";
               when 16 => return "zestiende";
               when 17 => return "zeventiende";
               when 18 => return "achttiende";
               when 19 => return "negentiende";
               when 20 => return "twintigste";
               when others => return "";
            end case;
         elsif Locale = "sv" then
            case Value is
               when 0 => return "nollte";
               when 1 => return "f" & U_O_Umlaut & "rsta";
               when 2 => return "andra";
               when 3 => return "tredje";
               when 4 => return "fj" & U_A_Umlaut & "rde";
               when 5 => return "femte";
               when 6 => return "sj" & U_A_Umlaut & "tte";
               when 7 => return "sjunde";
               when 8 => return U_A_Ring & "ttonde";
               when 9 => return "nionde";
               when 10 => return "tionde";
               when 11 => return "elfte";
               when 12 => return "tolfte";
               when 13 => return "trettonde";
               when 14 => return "fjortonde";
               when 15 => return "femtonde";
               when 16 => return "sextonde";
               when 17 => return "sjuttonde";
               when 18 => return "artonde";
               when 19 => return "nittonde";
               when 20 => return "tjugonde";
               when others => return "";
            end case;
         elsif Is_Norwegian (Locale) then
            case Value is
               when 0 => return "nullte";
               when 1 => return "f" & U_O_Slash & "rste";
               when 2 => return "andre";
               when 3 => return "tredje";
               when 4 => return "fjerde";
               when 5 => return "femte";
               when 6 => return "sjette";
               when 7 => return "sjuende";
               when 8 => return U_A_Ring & "ttende";
               when 9 => return "niende";
               when 10 => return "tiende";
               when 11 => return "ellevte";
               when 12 => return "tolvte";
               when 13 => return "trettende";
               when 14 => return "fjortende";
               when 15 => return "femtende";
               when 16 => return "sekstende";
               when 17 => return "syttende";
               when 18 => return "attende";
               when 19 => return "nittende";
               when 20 => return "tjuende";
               when others => return "";
            end case;
         elsif Locale = "fi" then
            case Value is
               when 0 => return "nollas";
               when 1 => return "ensimm" & U_A_Umlaut & "inen";
               when 2 => return "toinen";
               when 3 => return "kolmas";
               when 4 => return "nelj" & U_A_Umlaut & "s";
               when 5 => return "viides";
               when 6 => return "kuudes";
               when 7 => return "seitsem" & U_A_Umlaut & "s";
               when 8 => return "kahdeksas";
               when 9 => return "yhdeks" & U_A_Umlaut & "s";
               when 10 => return "kymmenes";
               when 11 => return "yhdestoista";
               when 12 => return "kahdestoista";
               when 13 => return "kolmastoista";
               when 14 => return "nelj" & U_A_Umlaut & "stoista";
               when 15 => return "viidestoista";
               when 16 => return "kuudestoista";
               when 17 => return "seitsem" & U_A_Umlaut & "stoista";
               when 18 => return "kahdeksastoista";
               when 19 => return "yhdeks" & U_A_Umlaut & "stoista";
               when 20 => return "kahdeskymmenes";
               when others => return "";
            end case;
         elsif Locale = "tr" then
            case Value is
               when 0 => return "s" & U_I_Dotless & "f" & U_I_Dotless & "r" & U_I_Dotless & "nc" & U_I_Dotless;
               when 1 => return "birinci";
               when 2 => return "ikinci";
               when 3 => return U_U_Umlaut & U_C_Cedilla & U_U_Umlaut & "nc" & U_U_Umlaut;
               when 4 => return "d" & U_O_Umlaut & "rd" & U_U_Umlaut & "nc" & U_U_Umlaut;
               when 5 => return "be" & U_S_Cedilla & "inci";
               when 6 => return "alt" & U_I_Dotless & "nc" & U_I_Dotless;
               when 7 => return "yedinci";
               when 8 => return "sekizinci";
               when 9 => return "dokuzuncu";
               when 10 => return "onuncu";
               when 11 => return "on birinci";
               when 12 => return "on ikinci";
               when 13 => return "on " & U_U_Umlaut & U_C_Cedilla & U_U_Umlaut & "nc" & U_U_Umlaut;
               when 14 => return "on d" & U_O_Umlaut & "rd" & U_U_Umlaut & "nc" & U_U_Umlaut;
               when 15 => return "on be" & U_S_Cedilla & "inci";
               when 16 => return "on alt" & U_I_Dotless & "nc" & U_I_Dotless;
               when 17 => return "on yedinci";
               when 18 => return "on sekizinci";
               when 19 => return "on dokuzuncu";
               when 20 => return "yirminci";
               when others => return "";
            end case;
         elsif Locale = "pl" then
            case Value is
               when 0 => return "zerowy";
               when 1 => return "pierwszy";
               when 2 => return "drugi";
               when 3 => return "trzeci";
               when 4 => return "czwarty";
               when 5 => return "pi" & U (16#105#) & "ty";
               when 6 => return "sz" & U (16#F3#) & "sty";
               when 7 => return "si" & U (16#F3#) & "dmy";
               when 8 => return U (16#F3#) & "smy";
               when 9 => return "dziewi" & U (16#105#) & "ty";
               when 10 => return "dziesi" & U (16#105#) & "ty";
               when 11 => return "jedenasty";
               when 12 => return "dwunasty";
               when 13 => return "trzynasty";
               when 14 => return "czternasty";
               when 15 => return "pi" & U (16#119#) & "tnasty";
               when 16 => return "szesnasty";
               when 17 => return "siedemnasty";
               when 18 => return "osiemnasty";
               when 19 => return "dziewi" & U (16#119#) & "tnasty";
               when 20 => return "dwudziesty";
               when others => return "";
            end case;
         elsif Locale = "cs" then
            case Value is
               when 0 => return "nult" & U (16#FD#);
               when 1 => return "prvn" & U (16#ED#);
               when 2 => return "druh" & U (16#FD#);
               when 3 => return "t" & U (16#159#) & "et" & U (16#ED#);
               when 4 => return U (16#10D#) & "tvrt" & U (16#FD#);
               when 5 => return "p" & U (16#E1#) & "t" & U (16#FD#);
               when 6 => return U (16#161#) & "est" & U (16#FD#);
               when 7 => return "sedm" & U (16#FD#);
               when 8 => return "osm" & U (16#FD#);
               when 9 => return "dev" & U (16#E1#) & "t" & U (16#FD#);
               when 10 => return "des" & U (16#E1#) & "t" & U (16#FD#);
               when 11 => return "jeden" & U (16#E1#) & "ct" & U (16#FD#);
               when 12 => return "dvan" & U (16#E1#) & "ct" & U (16#FD#);
               when 13 => return "t" & U (16#159#) & "in" & U (16#E1#) & "ct" & U (16#FD#);
               when 14 => return U (16#10D#) & "trn" & U (16#E1#) & "ct" & U (16#FD#);
               when 15 => return "patn" & U (16#E1#) & "ct" & U (16#FD#);
               when 16 => return U (16#161#) & "estn" & U (16#E1#) & "ct" & U (16#FD#);
               when 17 => return "sedmn" & U (16#E1#) & "ct" & U (16#FD#);
               when 18 => return "osmn" & U (16#E1#) & "ct" & U (16#FD#);
               when 19 => return "devaten" & U (16#E1#) & "ct" & U (16#FD#);
               when 20 => return "dvac" & U (16#E1#) & "t" & U (16#FD#);
               when others => return "";
            end case;
         elsif Locale = "ru" then
            case Value is
               when 0 => return Small_Locale_Word (Locale, 0);
               when 1 => return U (16#43F#) & U (16#435#) & U (16#440#) & U (16#432#) & U (16#44B#) & U (16#439#);
               when 2 => return U (16#432#) & U (16#442#) & U (16#43E#) & U (16#440#) & U (16#43E#) & U (16#439#);
               when 3 => return U (16#442#) & U (16#440#) & U (16#435#) & U (16#442#) & U (16#438#) & U (16#439#);
               when 4 => return U (16#447#) & U (16#435#) & U (16#442#) & U (16#432#) & U (16#451#) & U (16#440#) & U (16#442#) & U (16#44B#) & U (16#439#);
               when 5 => return U (16#43F#) & U (16#44F#) & U (16#442#) & U (16#44B#) & U (16#439#);
               when 6 => return U (16#448#) & U (16#435#) & U (16#441#) & U (16#442#) & U (16#43E#) & U (16#439#);
               when 7 => return U (16#441#) & U (16#435#) & U (16#434#) & U (16#44C#) & U (16#43C#) & U (16#43E#) & U (16#439#);
               when 8 => return U (16#432#) & U (16#43E#) & U (16#441#) & U (16#44C#) & U (16#43C#) & U (16#43E#) & U (16#439#);
               when 9 => return U (16#434#) & U (16#435#) & U (16#432#) & U (16#44F#) & U (16#442#) & U (16#44B#) & U (16#439#);
               when 10 => return U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#) & U (16#44B#) & U (16#439#);
               when others => return "";
            end case;
         elsif Locale = "uk" then
            case Value is
               when 0 => return Small_Locale_Word (Locale, 0);
               when 1 => return U (16#43F#) & U (16#435#) & U (16#440#) & U (16#448#) & U (16#438#) & U (16#439#);
               when 2 => return U (16#434#) & U (16#440#) & U (16#443#) & U (16#433#) & U (16#438#) & U (16#439#);
               when 3 => return U (16#442#) & U (16#440#) & U (16#435#) & U (16#442#) & U (16#456#) & U (16#439#);
               when 4 => return U (16#447#) & U (16#435#) & U (16#442#) & U (16#432#) & U (16#435#) & U (16#440#) & U (16#442#) & U (16#438#) & U (16#439#);
               when 5 => return U (16#43F#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#438#) & U (16#439#);
               when 6 => return U (16#448#) & U (16#43E#) & U (16#441#) & U (16#442#) & U (16#438#) & U (16#439#);
               when 7 => return U (16#441#) & U (16#44C#) & U (16#43E#) & U (16#43C#) & U (16#438#) & U (16#439#);
               when 8 => return U (16#432#) & U (16#43E#) & U (16#441#) & U (16#44C#) & U (16#43C#) & U (16#438#) & U (16#439#);
               when 9 => return U (16#434#) & U (16#435#) & U (16#432#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#438#) & U (16#439#);
               when 10 => return U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#) & U (16#438#) & U (16#439#);
               when others => return "";
            end case;
         elsif Locale = "ar" then
            case Value is
               when 0 => return Small_Locale_Word (Locale, 0);
               when 1 => return U (16#627#) & U (16#644#) & U (16#623#) & U (16#648#) & U (16#644#);
               when 2 => return U (16#627#) & U (16#644#) & U (16#62B#) & U (16#627#) & U (16#646#) & U (16#64A#);
               when 3 => return U (16#627#) & U (16#644#) & U (16#62B#) & U (16#627#) & U (16#644#) & U (16#62B#);
               when 4 => return U (16#627#) & U (16#644#) & U (16#631#) & U (16#627#) & U (16#628#) & U (16#639#);
               when 5 => return U (16#627#) & U (16#644#) & U (16#62E#) & U (16#627#) & U (16#645#) & U (16#633#);
               when 6 => return U (16#627#) & U (16#644#) & U (16#633#) & U (16#627#) & U (16#62F#) & U (16#633#);
               when 7 => return U (16#627#) & U (16#644#) & U (16#633#) & U (16#627#) & U (16#628#) & U (16#639#);
               when 8 => return U (16#627#) & U (16#644#) & U (16#62B#) & U (16#627#) & U (16#645#) & U (16#646#);
               when 9 => return U (16#627#) & U (16#644#) & U (16#62A#) & U (16#627#) & U (16#633#) & U (16#639#);
               when 10 => return U (16#627#) & U (16#644#) & U (16#639#) & U (16#627#) & U (16#634#) & U (16#631#);
               when others => return "";
            end case;
         elsif Locale = "hi" then
            case Value is
               when 0 => return Small_Locale_Word (Locale, 0);
               when 1 => return U (16#92A#) & U (16#939#) & U (16#932#) & U (16#93E#);
               when 2 => return U (16#926#) & U (16#942#) & U (16#938#) & U (16#930#) & U (16#93E#);
               when 3 => return U (16#924#) & U (16#940#) & U (16#938#) & U (16#930#) & U (16#93E#);
               when 4 => return U (16#91A#) & U (16#94C#) & U (16#925#) & U (16#93E#);
               when 5 => return U (16#92A#) & U (16#93E#) & U (16#901#) & U (16#91A#) & U (16#935#) & U (16#93E#) & U (16#901#);
               when 6 => return U (16#91B#) & U (16#920#) & U (16#93E#);
               when 7 => return U (16#938#) & U (16#93E#) & U (16#924#) & U (16#935#) & U (16#93E#) & U (16#901#);
               when 8 => return U (16#906#) & U (16#920#) & U (16#935#) & U (16#93E#) & U (16#901#);
               when 9 => return U (16#928#) & U (16#94C#) & U (16#935#) & U (16#93E#) & U (16#901#);
               when 10 => return U (16#926#) & U (16#938#) & U (16#935#) & U (16#93E#) & U (16#901#);
               when others => return "";
            end case;
         elsif Locale = "ro" then
            case Value is
               when 0 => return "zero";
               when 1 => return "primul";
               when 2 => return "al doilea";
               when 3 => return "al treilea";
               when 4 => return "al patrulea";
               when 5 => return "al cincilea";
               when 6 => return "al saselea";
               when 7 => return "al saptelea";
               when 8 => return "al optulea";
               when 9 => return "al noualea";
               when 10 => return "al zecelea";
               when others => return "";
            end case;
         elsif Locale = "lt" then
            case Value is
               when 0 => return "nulinis";
               when 1 => return "pirmas";
               when 2 => return "antras";
               when 3 => return "trecias";
               when 4 => return "ketvirtas";
               when 5 => return "penktas";
               when 6 => return "sestas";
               when 7 => return "septintas";
               when 8 => return "astuntas";
               when 9 => return "devintas";
               when 10 => return "desimtas";
               when others => return "";
            end case;
         elsif Locale = "sl" then
            case Value is
               when 0 => return "nicelni";
               when 1 => return "prvi";
               when 2 => return "drugi";
               when 3 => return "tretji";
               when 4 => return "cetrti";
               when 5 => return "peti";
               when 6 => return "sesti";
               when 7 => return "sedmi";
               when 8 => return "osmi";
               when 9 => return "deveti";
               when 10 => return "deseti";
               when others => return "";
            end case;
         elsif Locale = "id" or else Locale = "ms" then
            case Value is
               when 0 => return Small_Locale_Word (Locale, 0);
               when 1 => return "pertama";
               when 2 => return "kedua";
               when 3 => return "ketiga";
               when 4 => return "keempat";
               when 5 => return "kelima";
               when 6 => return "keenam";
               when 7 => return "ketujuh";
               when 8 => return "kedelapan";
               when 9 => return "kesembilan";
               when 10 => return "kesepuluh";
               when others => return "";
            end case;
         elsif Locale = "eo" then
            case Value is
               when 0 => return "nula";
               when 1 => return "unua";
               when 2 => return "dua";
               when 3 => return "tria";
               when 4 => return "kvara";
               when 5 => return "kvina";
               when 6 => return "sesa";
               when 7 => return "sepa";
               when 8 => return "oka";
               when 9 => return "naua";
               when 10 => return "deka";
               when others => return "";
            end case;
         elsif Locale = "vi" then
            case Value is
               when 0 => return "thu khong";
               when 1 => return "thu nhat";
               when 2 => return "thu hai";
               when 3 => return "thu ba";
               when 4 => return "thu tu";
               when 5 => return "thu nam";
               when 6 => return "thu sau";
               when 7 => return "thu bay";
               when 8 => return "thu tam";
               when 9 => return "thu chin";
               when 10 => return "thu muoi";
               when others => return "";
            end case;
         elsif Locale = "sw" then
            case Value is
               when 0 => return "sifuri";
               when 1 => return "kwanza";
               when 2 => return "pili";
               when 3 => return "tatu";
               when 4 => return "nne";
               when 5 => return "tano";
               when 6 => return "sita";
               when 7 => return "saba";
               when 8 => return "nane";
               when 9 => return "tisa";
               when 10 => return "kumi";
               when others => return "";
            end case;
         elsif Locale = "af" then
            case Value is
               when 0 => return "nulde";
               when 1 => return "eerste";
               when 2 => return "tweede";
               when 3 => return "derde";
               when 4 => return "vierde";
               when 5 => return "vyfde";
               when 6 => return "sesde";
               when 7 => return "sewende";
               when 8 => return "agtste";
               when 9 => return "negende";
               when 10 => return "tiende";
               when others => return "";
            end case;
         elsif Locale = "hu" then
            case Value is
               when 0 => return "nulladik";
               when 1 => return "elso";
               when 2 => return "masodik";
               when 3 => return "harmadik";
               when 4 => return "negyedik";
               when 5 => return "otodik";
               when 6 => return "hatodik";
               when 7 => return "hetedik";
               when 8 => return "nyolcadik";
               when 9 => return "kilencedik";
               when 10 => return "tizedik";
               when others => return "";
            end case;
         elsif Locale = "sk" then
            case Value is
               when 0 => return "nulty";
               when 1 => return "prvy";
               when 2 => return "druhy";
               when 3 => return "treti";
               when 4 => return "stvrty";
               when 5 => return "piaty";
               when 6 => return "siesty";
               when 7 => return "siedmy";
               when 8 => return "osmy";
               when 9 => return "deviaty";
               when 10 => return "desiaty";
               when others => return "";
            end case;
         else
            return "";
         end if;
      end Direct;

      Direct_Text : constant String := Direct;
      Base        : constant String := Locale_Long_Word
        (Locale, Long_Long_Integer (Value));
      Ones        : constant Natural := Value mod 10;
      Tens        : constant Natural := Value - Ones;
      Rest_1000   : constant Natural := Value mod 1_000;

      function Turkish_Ordinal_Ending return String is
      begin
         case Value mod 100 is
            when 20 => return "nci";
            when 30 => return "uncu";
            when 40 => return U_I_Dotless & "nc" & U_I_Dotless;
            when 50 => return "nci";
            when 60 => return U_I_Dotless & "nc" & U_I_Dotless;
            when 70 => return "inci";
            when 80 => return "inci";
            when 90 => return U_I_Dotless & "nc" & U_I_Dotless;
            when others => return "inci";
         end case;
      end Turkish_Ordinal_Ending;

      function Generated_Exact_Tens_Ordinal return String is
      begin
         if Locale = "sv" then
            case Value mod 100 is
               when 30 => return "trettionde";
               when 40 => return "fyrtionde";
               when 50 => return "femtionde";
               when 60 => return "sextionde";
               when 70 => return "sjuttionde";
               when 80 => return U_A_Ring & "ttionde";
               when 90 => return "nittionde";
               when others => return "";
            end case;
         elsif Is_Norwegian (Locale) then
            case Value mod 100 is
               when 30 => return "trettiende";
               when 40 => return "f" & U_O_Slash & "rtiende";
               when 50 => return "femtiende";
               when 60 => return "sekstiende";
               when 70 => return "syttiende";
               when 80 => return U_A_Ring & "ttiende";
               when 90 => return "nittiende";
               when others => return "";
            end case;
         elsif Locale = "pl" then
            case Value mod 100 is
               when 30 => return "trzydziesty";
               when 40 => return "czterdziesty";
               when 50 => return "pi" & U (16#119#) & U (16#107#) & "dziesi" & U (16#105#) & "ty";
               when 60 => return "sze" & U (16#15B#) & U (16#107#) & "dziesi" & U (16#105#) & "ty";
               when 70 => return "siedemdziesi" & U (16#105#) & "ty";
               when 80 => return "osiemdziesi" & U (16#105#) & "ty";
               when 90 => return "dziewi" & U (16#119#) & U (16#107#) & "dziesi" & U (16#105#) & "ty";
               when others => return "";
            end case;
         elsif Locale = "cs" then
            case Value mod 100 is
               when 30 => return "t" & U (16#159#) & "ic" & U (16#E1#) & "t" & U (16#FD#);
               when 40 => return U (16#10D#) & "ty" & U (16#159#) & "ic" & U (16#E1#) & "t" & U (16#FD#);
               when 50 => return "pades" & U (16#E1#) & "t" & U (16#FD#);
               when 60 => return U (16#161#) & "edes" & U (16#E1#) & "t" & U (16#FD#);
               when 70 => return "sedmdes" & U (16#E1#) & "t" & U (16#FD#);
               when 80 => return "osmdes" & U (16#E1#) & "t" & U (16#FD#);
               when 90 => return "devades" & U (16#E1#) & "t" & U (16#FD#);
               when others => return "";
            end case;
         elsif Locale = "ro" then
            case Value mod 100 is
               when 30 => return "al treizecilea";
               when 40 => return "al patruzecilea";
               when 50 => return "al cincizecilea";
               when 60 => return "al saizecilea";
               when 70 => return "al saptezecilea";
               when 80 => return "al optzecilea";
               when 90 => return "al nouazecilea";
               when others => return "";
            end case;
         elsif Locale = "lt" then
            case Value mod 100 is
               when 20 => return "dvidesimtas";
               when 30 => return "trisdesimtas";
               when 40 => return "keturiasdesimtas";
               when 50 => return "penkiasdesimtas";
               when 60 => return "sesiasdesimtas";
               when 70 => return "septyniasdesimtas";
               when 80 => return "astuoniasdesimtas";
               when 90 => return "devyniasdesimtas";
               when others => return "";
            end case;
         elsif Locale = "sl" then
            case Value mod 100 is
               when 20 => return "dvajseti";
               when 30 => return "trideseti";
               when 40 => return "stirideseti";
               when 50 => return "petdeseti";
               when 60 => return "sestdeseti";
               when 70 => return "sedemdeseti";
               when 80 => return "osemdeseti";
               when 90 => return "devetdeseti";
               when others => return "";
            end case;
         elsif Locale = "id" or else Locale = "ms" then
            case Value mod 100 is
               when 20 => return "kedua puluh";
               when 30 => return "ketiga puluh";
               when 40 => return "keempat puluh";
               when 50 => return "kelima puluh";
               when 60 => return "keenam puluh";
               when 70 => return "ketujuh puluh";
               when 80 => return "kedelapan puluh";
               when 90 => return "kesembilan puluh";
               when others => return "";
            end case;
         elsif Locale = "eo" then
            case Value mod 100 is
               when 20 => return "dudeka";
               when 30 => return "trideka";
               when 40 => return "kvardeka";
               when 50 => return "kvindeka";
               when 60 => return "sesdeka";
               when 70 => return "sepdeka";
               when 80 => return "okdeka";
               when 90 => return "naudeka";
               when others => return "";
            end case;
         elsif Locale = "vi" then
            case Value mod 100 is
               when 20 => return "thu hai muoi";
               when 30 => return "thu ba muoi";
               when 40 => return "thu bon muoi";
               when 50 => return "thu nam muoi";
               when 60 => return "thu sau muoi";
               when 70 => return "thu bay muoi";
               when 80 => return "thu tam muoi";
               when 90 => return "thu chin muoi";
               when others => return "";
            end case;
         elsif Locale = "sw" then
            case Value mod 100 is
               when 20 => return "ishirini";
               when 30 => return "thelathini";
               when 40 => return "arobaini";
               when 50 => return "hamsini";
               when 60 => return "sitini";
               when 70 => return "sabini";
               when 80 => return "themanini";
               when 90 => return "tisini";
               when others => return "";
            end case;
         elsif Locale = "af" then
            case Value mod 100 is
               when 20 => return "twintigste";
               when 30 => return "dertigste";
               when 40 => return "veertigste";
               when 50 => return "vyftigste";
               when 60 => return "sestigste";
               when 70 => return "sewentigste";
               when 80 => return "tagtigste";
               when 90 => return "negentigste";
               when others => return "";
            end case;
         elsif Locale = "hu" then
            case Value mod 100 is
               when 20 => return "huszadik";
               when 30 => return "harmincadik";
               when 40 => return "negyvenedik";
               when 50 => return "otvenedik";
               when 60 => return "hatvanadik";
               when 70 => return "hetvenedik";
               when 80 => return "nyolcvanadik";
               when 90 => return "kilencvenedik";
               when others => return "";
            end case;
         elsif Locale = "sk" then
            case Value mod 100 is
               when 20 => return "dvadsaty";
               when 30 => return "tridsiaty";
               when 40 => return "styridsiaty";
               when 50 => return "patdesiaty";
               when 60 => return "sestdesiaty";
               when 70 => return "sedemdesiaty";
               when 80 => return "osemdesiaty";
               when 90 => return "devatdesiaty";
               when others => return "";
            end case;
         else
            return "";
         end if;
      end Generated_Exact_Tens_Ordinal;

      Exact_Tens_Text : constant String := Generated_Exact_Tens_Ordinal;
   begin
      if Locale = "en" then
         return Ordinal_Words_Text (Value);
      elsif Direct_Text'Length > 0 then
         return Direct_Text;
      elsif Base'Length = 0 then
         return Ordinal_Words_Text (Value);
      elsif Locale /= "en"
        and then not Is_CJK_Spellout (Locale)
        and then Value < 1_000_000
        and then Rest_1000 /= 0
        and then Value >= 1_000
      then
         return Locale_Long_Word
             (Locale, Long_Long_Integer (Value - Rest_1000))
           & " " & Locale_Ordinal_Words_Text (Locale, Rest_1000);
      elsif Has_Generated_Spellout (Locale)
        and then not Is_CJK_Spellout (Locale)
        and then Value < 1_000
        and then Value mod 100 /= 0
        and then Value >= 100
      then
         return Locale_Long_Word
             (Locale, Long_Long_Integer (Value - (Value mod 100)))
           & " " & Locale_Ordinal_Words_Text (Locale, Value mod 100);
      elsif Has_Generated_Spellout (Locale)
        and then not Is_CJK_Spellout (Locale)
        and then Value < 100
        and then Ones /= 0
      then
         return Locale_Long_Word (Locale, Long_Long_Integer (Tens)) & " "
           & Locale_Ordinal_Words_Text (Locale, Ones);
      elsif Exact_Tens_Text'Length > 0 then
         return Exact_Tens_Text;
      elsif Locale = "de" then
         return Base & (if Value mod 100 in 1 .. 19 then "te" else "ste");
      elsif Locale = "fr" then
         return Base & "i" & U_E_Grave & "me";
      elsif Locale = "da" then
         return Base & "ende";
      elsif Locale = "es" then
         return Base & "avo";
      elsif Locale = "it" then
         return Base & U_E_Acute & "simo";
      elsif Locale = "pt" then
         return Base & U_E_Acute & "simo";
      elsif Locale = "nl" then
         return Base & "ste";
      elsif Locale = "sv" then
         if Value mod 10 = 1 or else Value mod 10 = 2 then
            return Base & "a";
         else
            return Base & "de";
         end if;
      elsif Is_Norwegian (Locale) then
         return Base & "ende";
      elsif Locale = "fi" then
         return Base & "s";
      elsif Locale = "tr" then
         return Base & Turkish_Ordinal_Ending;
      elsif Is_CJK_Spellout (Locale) then
         if Locale = "ko" then
            return Base & U (16#BC88#) & U (16#C9F8#);
         else
            return U (16#7B2C#) & Base;
         end if;
      elsif Locale = "pl" then
         return Base & "y";
      elsif Locale = "cs" then
         return Base & U (16#FD#);
      elsif Locale = "ru" then
         return Base & "-" & U (16#439#);
      elsif Locale = "uk" then
         return Base & "-" & U (16#439#);
      elsif Locale = "ar" then
         return U (16#627#) & U (16#644#) & Base;
      elsif Locale = "hi" then
         return Base & U (16#935#) & U (16#93E#) & U (16#901#);
      elsif Has_Generated_Spellout (Locale) then
         return Base;
      else
         return Ordinal_Words_Text (Value);
      end if;
   end Locale_Ordinal_Words_Text;

   pragma Style_Checks (On);

   function Ordinal_Words
     (Context : Humanize.Contexts.Context;
      Value   : Natural)
      return Humanize.Status.Text_Result
   is
      Locale : constant String := Locale_Prefix (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String (Locale_Ordinal_Words_Text (Locale, Value)),
         Key => Humanize.Messages.No_Message);
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
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Ordinal_Words_Into;

   function Scale_Value (Scale : Positive) return Long_Long_Integer is
      Result : Long_Long_Integer := 1;
   begin
      for Index in 1 .. Scale loop
         Result := Result * 1_000;
      end loop;
      return Result;
   end Scale_Value;

   function CJK_Scale_Value (Scale : Positive) return Long_Long_Integer is
      Result : Long_Long_Integer := 1;
   begin
      for Index in 1 .. Scale loop
         Result := Result * 10_000;
      end loop;
      return Result;
   end CJK_Scale_Value;

   function Parse_Rendered_Under_Thousand
     (Locale : String;
      Item   : String;
      Value  : out Natural)
      return Boolean
   is
   begin
      for Candidate in 0 .. 999 loop
         declare
            Rendered : constant String :=
              Lower (Locale_Hundred_Word (Locale, Candidate));
         begin
            if Rendered'Length > 0 and then Rendered = Item then
               Value := Candidate;
               return True;
            end if;
         end;
      end loop;

      Value := 0;
      return False;
   end Parse_Rendered_Under_Thousand;

   function Parse_Rendered_CJK_Group
     (Locale : String;
      Item   : String;
      Value  : out Natural)
      return Boolean
   is
   begin
      for Candidate in 0 .. 9_999 loop
         declare
            Rendered : constant String :=
              Lower (Locale_CJK_Group_Word (Locale, Candidate));
         begin
            if Rendered'Length > 0 and then Rendered = Item then
               Value := Candidate;
               return True;
            end if;
         end;
      end loop;

      Value := 0;
      return False;
   end Parse_Rendered_CJK_Group;

   function Parse_Rendered_Cardinal
     (Locale    : String;
      Item      : String;
      Max_Scale : Natural;
      Value     : out Long_Long_Integer)
      return Boolean;

   function Parse_Rendered_Cardinal
     (Locale    : String;
      Item      : String;
      Max_Scale : Natural;
      Value     : out Long_Long_Integer)
      return Boolean
   is
      Segment : Natural := 0;
      Rest_Value : Long_Long_Integer := 0;
   begin
      if Is_CJK_Spellout (Locale) then
         if Parse_Rendered_CJK_Group (Locale, Item, Segment) then
            Value := Long_Long_Integer (Segment);
            return True;
         end if;

         for Scale in reverse 1 .. Max_Scale loop
            declare
               Unit  : constant Long_Long_Integer := CJK_Scale_Value (Scale);
               Token : constant String :=
                 Locale_CJK_Myriad_Scale_Word (Locale, Scale);
               Pos   : constant Natural := Ada.Strings.Fixed.Index (Item, Token);
            begin
               if Token'Length > 0 and then Pos > 0 then
                  declare
                     Prefix_Value : Natural := 1;
                     Tail_Value   : Long_Long_Integer := 0;
                  begin
                     if Pos > Item'First
                       and then not Parse_Rendered_CJK_Group
                         (Locale, Item (Item'First .. Pos - 1), Prefix_Value)
                     then
                        Value := 0;
                        return False;
                     end if;

                     if Pos + Token'Length <= Item'Last then
                        if not Parse_Rendered_Cardinal
                          (Locale, Item (Pos + Token'Length .. Item'Last),
                           Scale - 1, Tail_Value)
                          or else Tail_Value >= Unit
                        then
                           Value := 0;
                           return False;
                        end if;
                     end if;

                     Value :=
                       Long_Long_Integer (Prefix_Value) * Unit + Tail_Value;
                     return True;
                  end;
               end if;
            end;
         end loop;

         Value := 0;
         return False;
      end if;

      if Parse_Rendered_Under_Thousand (Locale, Item, Segment) then
         Value := Long_Long_Integer (Segment);
         return True;
      end if;

      for Scale in reverse 1 .. Max_Scale loop
         declare
            Unit : constant Long_Long_Integer := Scale_Value (Scale);
         begin
            for Prefix_Segment in 1 .. 999 loop
               declare
                  Prefix_Value : constant Long_Long_Integer :=
                    Long_Long_Integer (Prefix_Segment) * Unit;
                  Prefix : constant String :=
                    Lower (Locale_Long_Word (Locale, Prefix_Value));
               begin
                  if Prefix'Length > 0 and then Item = Prefix then
                     Value := Prefix_Value;
                     return True;
                  elsif Prefix'Length > 0
                    and then Starts_With (Item, Prefix)
                  then
                     declare
                        Next : constant Natural :=
                          Item'First + Prefix'Length;
                     begin
                        if Next <= Item'Last and then Item (Next) = ' ' then
                           declare
                              Tail : constant String :=
                                Trim (Item (Next + 1 .. Item'Last));
                           begin
                              if Tail'Length > 0
                                and then Parse_Rendered_Cardinal
                                  (Locale, Tail, Scale - 1, Rest_Value)
                                and then Rest_Value < Unit
                              then
                                 Value := Prefix_Value + Rest_Value;
                                 return True;
                              end if;
                           end;
                        elsif Locale = "de" and then Scale = 1 then
                           declare
                              Tail : constant String :=
                                Item (Next .. Item'Last);
                           begin
                              if Tail'Length > 0
                                and then Parse_Rendered_Cardinal
                                  (Locale, Tail, 0, Rest_Value)
                                and then Rest_Value < Unit
                              then
                                 Value := Prefix_Value + Rest_Value;
                                 return True;
                              end if;
                           end;
                        elsif Is_CJK_Spellout (Locale) and then Scale = 1 then
                           declare
                              Tail : constant String :=
                                Item (Next .. Item'Last);
                           begin
                              if Tail'Length > 0
                                and then Parse_Rendered_Cardinal
                                  (Locale, Tail, 0, Rest_Value)
                                and then Rest_Value < Unit
                              then
                                 Value := Prefix_Value + Rest_Value;
                                 return True;
                              end if;
                           end;
                        end if;
                     end;
                  end if;
               end;
            end loop;
         end;
      end loop;

      Value := 0;
      return False;
   end Parse_Rendered_Cardinal;

   function Parse_Rendered_Ordinal_Under_Thousand
     (Locale : String;
      Item   : String;
      Value  : out Natural)
      return Boolean
   is
   begin
      for Candidate in 0 .. 999 loop
         declare
            Rendered : constant String :=
              Lower (Locale_Ordinal_Words_Text (Locale, Candidate));
         begin
            if Rendered'Length > 0 and then Rendered = Item then
               Value := Candidate;
               return True;
            end if;
         end;
      end loop;

      Value := 0;
      return False;
   end Parse_Rendered_Ordinal_Under_Thousand;

   function Parse_Rendered_Ordinal
     (Locale    : String;
      Item      : String;
      Max_Scale : Natural;
      Value     : out Natural)
      return Boolean
   is
      Rest_Value : Natural := 0;
      Cardinal_Value : Long_Long_Integer := 0;
   begin
      if Parse_Rendered_Ordinal_Under_Thousand (Locale, Item, Value) then
         return True;
      elsif (Locale = "ja" or else Locale = "zh")
        and then Starts_With (Item, U (16#7B2C#))
        and then Parse_Rendered_Cardinal
          (Locale, Item (Item'First + U (16#7B2C#)'Length .. Item'Last),
           Max_Scale, Cardinal_Value)
        and then Cardinal_Value in 0 .. Long_Long_Integer (Natural'Last)
      then
         Value := Natural (Cardinal_Value);
         return True;
      elsif Locale = "ko"
        and then Item'Length >
          U (16#BC88#)'Length + U (16#C9F8#)'Length
        and then Item
          (Item'Last - (U (16#BC88#)'Length + U (16#C9F8#)'Length) + 1
           .. Item'Last) = U (16#BC88#) & U (16#C9F8#)
        and then Parse_Rendered_Cardinal
          (Locale,
           Item
             (Item'First
              .. Item'Last
                 - (U (16#BC88#)'Length + U (16#C9F8#)'Length)),
           Max_Scale, Cardinal_Value)
        and then Cardinal_Value in 0 .. Long_Long_Integer (Natural'Last)
      then
         Value := Natural (Cardinal_Value);
         return True;
      end if;

      for Scale in reverse 1 .. Max_Scale loop
         declare
            Unit : constant Long_Long_Integer := Scale_Value (Scale);
         begin
            for Prefix_Segment in 1 .. 999 loop
               declare
                  Prefix_Value : constant Long_Long_Integer :=
                    Long_Long_Integer (Prefix_Segment) * Unit;
                  Prefix : constant String :=
                    Lower (Locale_Long_Word (Locale, Prefix_Value));
               begin
                  if Prefix'Length > 0 and then Starts_With (Item, Prefix) then
                     declare
                        Next : constant Natural :=
                          Item'First + Prefix'Length;
                     begin
                        if Next <= Item'Last and then Item (Next) = ' ' then
                           declare
                              Tail : constant String :=
                                Trim (Item (Next + 1 .. Item'Last));
                           begin
                              if Tail'Length > 0
                                and then Parse_Rendered_Ordinal
                                  (Locale, Tail, Scale - 1, Rest_Value)
                                and then Long_Long_Integer (Rest_Value) < Unit
                                and then Prefix_Value
                                  + Long_Long_Integer (Rest_Value)
                                    <= Long_Long_Integer (Natural'Last)
                              then
                                 Value :=
                                   Natural
                                     (Prefix_Value
                                      + Long_Long_Integer (Rest_Value));
                                 return True;
                              end if;
                           end;
                        end if;
                     end;
                  end if;
               end;
            end loop;
         end;
      end loop;

      Value := 0;
      return False;
   end Parse_Rendered_Ordinal;

   function Parse_Deterministic_Cardinal
     (Text  : String;
      Value : out Long_Long_Integer)
      return Boolean
   is
      Locale_Count : constant Positive := 33;
      type Locale_Array is array (Positive range <>) of access constant String;

      En : aliased constant String := "en";
      Da : aliased constant String := "da";
      De : aliased constant String := "de";
      Fr : aliased constant String := "fr";
      Es : aliased constant String := "es";
      It : aliased constant String := "it";
      Pt : aliased constant String := "pt";
      Nl : aliased constant String := "nl";
      Sv : aliased constant String := "sv";
      No : aliased constant String := "no";
      Nb : aliased constant String := "nb";
      Fi : aliased constant String := "fi";
      Pl : aliased constant String := "pl";
      Cs : aliased constant String := "cs";
      Tr : aliased constant String := "tr";
      Ru : aliased constant String := "ru";
      Uk : aliased constant String := "uk";
      Ja : aliased constant String := "ja";
      Ko : aliased constant String := "ko";
      Zh : aliased constant String := "zh";
      Ar : aliased constant String := "ar";
      Hi : aliased constant String := "hi";
      Ro : aliased constant String := "ro";
      Lt : aliased constant String := "lt";
      Sl : aliased constant String := "sl";
      Id : aliased constant String := "id";
      Ms : aliased constant String := "ms";
      Eo : aliased constant String := "eo";
      Vi : aliased constant String := "vi";
      Sw : aliased constant String := "sw";
      Af : aliased constant String := "af";
      Hu : aliased constant String := "hu";
      Sk : aliased constant String := "sk";

      Locales : constant Locale_Array (1 .. Locale_Count) :=
        [En'Access, Da'Access, De'Access, Fr'Access, Es'Access, It'Access,
         Pt'Access, Nl'Access, Sv'Access, No'Access, Nb'Access, Fi'Access,
         Pl'Access, Cs'Access, Tr'Access, Ru'Access, Uk'Access, Ja'Access,
         Ko'Access, Zh'Access, Ar'Access, Hi'Access, Ro'Access, Lt'Access,
         Sl'Access, Id'Access, Ms'Access, Eo'Access, Vi'Access, Sw'Access,
         Af'Access, Hu'Access, Sk'Access];

      Item : constant String := Lower (Trim (Text));
      Has_Cyrillic : constant Boolean := Has_Byte_In (Item, 16#D0#, 16#D1#);
      Has_Arabic   : constant Boolean := Has_Byte_In (Item, 16#D8#, 16#DB#);
      Has_Devanagari : constant Boolean := Has_Byte_In (Item, 16#E0#, 16#E0#)
        or else Contains (Item, U (16#915#))
        or else Contains (Item, U (16#936#));
      Has_CJK : constant Boolean := Has_Byte_In (Item, 16#E3#, 16#EF#)
        and then not Has_Devanagari;
      Has_Latin_Ext : constant Boolean := Has_Byte_In (Item, 16#C2#, 16#C5#);
      Looks_Polish : constant Boolean := Contains (Item, U (16#105#))
        or else Contains (Item, U (16#119#))
        or else Contains (Item, U (16#15B#))
        or else Contains (Item, U (16#107#))
        or else Contains (Item, U (16#17C#));
      Looks_Czech : constant Boolean := Contains (Item, U (16#10D#))
        or else Contains (Item, U (16#159#))
        or else Contains (Item, U (16#11B#))
        or else Contains (Item, U (16#FD#));
      Looks_Turkish : constant Boolean := Contains (Item, U_I_Dotless)
        or else Contains (Item, U_S_Cedilla)
        or else Contains (Item, U_C_Cedilla);

      function Should_Try (Locale : String) return Boolean is
      begin
         if Has_Cyrillic then
            return Locale = "ru" or else Locale = "uk";
         elsif Has_Arabic then
            return Locale = "ar";
         elsif Has_Devanagari then
            return Locale = "hi";
         elsif Has_CJK then
            return Locale = "ja" or else Locale = "ko" or else Locale = "zh";
         elsif Looks_Polish then
            return Locale = "pl";
         elsif Looks_Czech then
            return Locale = "cs";
         elsif Looks_Turkish then
            return Locale = "tr";
         elsif Has_Latin_Ext then
            return Locale not in "ru" | "uk" | "ja" | "ko" | "zh" | "ar" | "hi";
         else
            return Locale not in "ru" | "uk" | "ja" | "ko" | "zh" | "ar" | "hi";
         end if;
      end Should_Try;

      Parsed : Long_Long_Integer := 0;
   begin
      Value := 0;
      if Item'Length = 0 then
         return False;
      end if;

      for Locale of Locales loop
         declare
            Code : constant String := Locale.all;
            Prefix : constant String :=
              (if Code = "fr" then "moins " else "minus ");
            Negative : constant Boolean := Starts_With (Item, Prefix);
            Spellout_Body : constant String :=
              (if Negative then Item (Item'First + Prefix'Length .. Item'Last)
               else Item);
         begin
            if not Should_Try (Code) then
               goto Continue_Locale;
            end if;

            if Parse_Rendered_Cardinal
                 (Code, Spellout_Body,
                  (if Is_CJK_Spellout (Code) then 3 else 5), Parsed)
            then
               Value := (if Negative then -Parsed else Parsed);
               return True;
            end if;
            <<Continue_Locale>>
            null;
         end;
      end loop;

      return False;
   end Parse_Deterministic_Cardinal;

   function Parse_Deterministic_Ordinal
     (Text  : String;
      Value : out Natural)
      return Boolean
   is
      Locale_Count : constant Positive := 33;
      type Locale_Array is array (Positive range <>) of access constant String;

      En : aliased constant String := "en";
      Da : aliased constant String := "da";
      De : aliased constant String := "de";
      Fr : aliased constant String := "fr";
      Es : aliased constant String := "es";
      It : aliased constant String := "it";
      Pt : aliased constant String := "pt";
      Nl : aliased constant String := "nl";
      Sv : aliased constant String := "sv";
      No : aliased constant String := "no";
      Nb : aliased constant String := "nb";
      Fi : aliased constant String := "fi";
      Pl : aliased constant String := "pl";
      Cs : aliased constant String := "cs";
      Tr : aliased constant String := "tr";
      Ru : aliased constant String := "ru";
      Uk : aliased constant String := "uk";
      Ja : aliased constant String := "ja";
      Ko : aliased constant String := "ko";
      Zh : aliased constant String := "zh";
      Ar : aliased constant String := "ar";
      Hi : aliased constant String := "hi";
      Ro : aliased constant String := "ro";
      Lt : aliased constant String := "lt";
      Sl : aliased constant String := "sl";
      Id : aliased constant String := "id";
      Ms : aliased constant String := "ms";
      Eo : aliased constant String := "eo";
      Vi : aliased constant String := "vi";
      Sw : aliased constant String := "sw";
      Af : aliased constant String := "af";
      Hu : aliased constant String := "hu";
      Sk : aliased constant String := "sk";

      Locales : constant Locale_Array (1 .. Locale_Count) :=
        [En'Access, Da'Access, De'Access, Fr'Access, Es'Access, It'Access,
         Pt'Access, Nl'Access, Sv'Access, No'Access, Nb'Access, Fi'Access,
         Pl'Access, Cs'Access, Tr'Access, Ru'Access, Uk'Access, Ja'Access,
         Ko'Access, Zh'Access, Ar'Access, Hi'Access, Ro'Access, Lt'Access,
         Sl'Access, Id'Access, Ms'Access, Eo'Access, Vi'Access, Sw'Access,
         Af'Access, Hu'Access, Sk'Access];

      Item : constant String := Lower (Trim (Text));
      Has_Cyrillic : constant Boolean := Has_Byte_In (Item, 16#D0#, 16#D1#);
      Has_Arabic   : constant Boolean := Has_Byte_In (Item, 16#D8#, 16#DB#);
      Has_Devanagari : constant Boolean := Has_Byte_In (Item, 16#E0#, 16#E0#)
        or else Contains (Item, U (16#915#))
        or else Contains (Item, U (16#936#));
      Has_CJK : constant Boolean := Has_Byte_In (Item, 16#E3#, 16#EF#)
        and then not Has_Devanagari;
      Has_Latin_Ext : constant Boolean := Has_Byte_In (Item, 16#C2#, 16#C5#);
      Looks_Polish : constant Boolean := Contains (Item, U (16#105#))
        or else Contains (Item, U (16#119#))
        or else Contains (Item, U (16#15B#))
        or else Contains (Item, U (16#107#))
        or else Contains (Item, U (16#17C#));
      Looks_Czech : constant Boolean := Contains (Item, U (16#10D#))
        or else Contains (Item, U (16#159#))
        or else Contains (Item, U (16#11B#))
        or else Contains (Item, U (16#FD#));
      Looks_Turkish : constant Boolean := Contains (Item, U_I_Dotless)
        or else Contains (Item, U_S_Cedilla)
        or else Contains (Item, U_C_Cedilla);

      function Should_Try (Locale : String) return Boolean is
      begin
         if Has_Cyrillic then
            return Locale = "ru" or else Locale = "uk";
         elsif Has_Arabic then
            return Locale = "ar";
         elsif Has_Devanagari then
            return Locale = "hi";
         elsif Has_CJK then
            return Locale = "ja" or else Locale = "ko" or else Locale = "zh";
         elsif Looks_Polish then
            return Locale = "pl";
         elsif Looks_Czech then
            return Locale = "cs";
         elsif Looks_Turkish then
            return Locale = "tr";
         elsif Has_Latin_Ext then
            return Locale not in "ru" | "uk" | "ja" | "ko" | "zh" | "ar" | "hi";
         else
            return Locale not in "ru" | "uk" | "ja" | "ko" | "zh" | "ar" | "hi";
         end if;
      end Should_Try;
      Parsed : Natural := 0;
   begin
      Value := 0;
      if Item'Length = 0 then
         return False;
      end if;

      for Locale of Locales loop
         if not Should_Try (Locale.all) then
            goto Continue_Locale;
         end if;

         if Parse_Rendered_Ordinal
              (Locale.all, Item,
               (if Is_CJK_Spellout (Locale.all) then 3 else 5), Parsed)
         then
            Value := Parsed;
            return True;
         end if;
         <<Continue_Locale>>
         null;
      end loop;

      return False;
   end Parse_Deterministic_Ordinal;

   function Locale_Conjunction (Locale : String) return String is
   begin
      if Locale = "da" or else Locale = "no" or else Locale = "nb" then
         return "og";
      elsif Locale = "de" or else Locale = "nl" then
         return "und";
      elsif Locale = "fr" then
         return "et";
      elsif Locale = "es" then
         return "y";
      elsif Locale = "it" then
         return "e";
      elsif Locale = "pt" then
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
      Locale : constant String := Locale_Prefix (Context);
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
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String (Text),
            Key => Humanize.Messages.No_Message);
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
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
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
         return
           (Status => Humanize.Status.Ok,
            Text => To_Unbounded_String (To_String (Base.Text) & " percent"),
            Key => Humanize.Messages.No_Message);
      end if;
   end Percent_Words;

   function Should_Spell_Editorial
     (Value   : Long_Long_Integer;
      Usage   : Editorial_Number_Use;
      Options : Editorial_Number_Options)
      return Boolean
   is
      Limit : constant Natural :=
        (if Usage = Headline_Number
         then Natural (Options.Headline_Spell_Out_Below)
         else Natural (Options.Spell_Out_Below));
   begin
      if Value = 0 then
         return Options.Spell_Zero and then Limit > 0;
      elsif Value < 0 then
         return Value > -Long_Long_Integer (Limit);
      else
         return Value < Long_Long_Integer (Limit);
      end if;
   end Should_Spell_Editorial;

   function Editorial_Number
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Usage   : Editorial_Number_Use := General_Number;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options)
      return Humanize.Status.Text_Result
   is
   begin
      if Value = Long_Long_Integer'First then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      case Usage is
         when General_Number | Headline_Number =>
            if Should_Spell_Editorial (Value, Usage, Options) then
               return Ok_Text (Cardinal_Long_Text (Value));
            else
               return Ok_Text (Grouped_Integer (Value, Options));
            end if;
         when Age_Number | Measurement_Number =>
            return Ok_Text (Grouped_Integer (Value, Options));
         when Percent_Number =>
            return Ok_Text (Grouped_Integer (Value, Options) & "%");
         when Ordinal_Number =>
            if Value < 0 or else Value > Long_Long_Integer (Natural'Last) then
               return (Status => Humanize.Status.Invalid_Value, others => <>);
            end if;
            return Editorial_Ordinal (Context, Natural (Value), Options);
      end case;
   end Editorial_Number;

   procedure Editorial_Number_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Usage   : Editorial_Number_Use := General_Number;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Editorial_Number (Context, Value, Usage, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Editorial_Number_Into;

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

   function Editorial_Ordinal
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options)
      return Humanize.Status.Text_Result
   is
   begin
      if Long_Long_Integer (Value) < Long_Long_Integer (Options.Spell_Out_Below)
      then
         return Ordinal_Words (Context, Value);
      else
         return Ok_Text
           (Group_Integer_Image
              (No_Space (Natural'Image (Value)), Options.Group_Digits)
            & Ordinal_Suffix (Value));
      end if;
   end Editorial_Ordinal;

   procedure Editorial_Ordinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Editorial_Ordinal (Context, Value, Options);
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Editorial_Ordinal_Into;

   function Editorial_Percent
     (Context        : Humanize.Contexts.Context;
      Value          : Long_Float;
      Number_Style   : Number_Options := Default_Number_Options;
      Include_Symbol : Boolean := True)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Number : constant String := Editorial_Decimal (Value, Number_Style);
   begin
      return Ok_Text
        (Number & (if Include_Symbol then "%" else " percent"));
   end Editorial_Percent;

   procedure Editorial_Percent_Into
     (Context        : Humanize.Contexts.Context;
      Value          : Long_Float;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Number_Style   : Number_Options := Default_Number_Options;
      Include_Symbol : Boolean := True)
   is
      Result : constant Humanize.Status.Text_Result :=
        Editorial_Percent (Context, Value, Number_Style, Include_Symbol);
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Editorial_Percent_Into;

   function Editorial_Measurement
     (Context      : Humanize.Contexts.Context;
      Value        : Long_Float;
      Unit         : String;
      Number_Style : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if Unit'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      return Ok_Text (Editorial_Decimal (Value, Number_Style) & " " & Unit);
   end Editorial_Measurement;

   procedure Editorial_Measurement_Into
     (Context      : Humanize.Contexts.Context;
      Value        : Long_Float;
      Unit         : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Number_Style : Number_Options := Default_Number_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Editorial_Measurement (Context, Value, Unit, Number_Style);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Editorial_Measurement_Into;

   function Editorial_Age
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Unit    : String := "years old")
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if Unit'Length = 0 then
         return Ok_Text (No_Space (Natural'Image (Value)));
      else
         return Ok_Text (No_Space (Natural'Image (Value)) & " " & Unit);
      end if;
   end Editorial_Age;

   procedure Editorial_Age_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Unit    : String := "years old")
   is
      Result : constant Humanize.Status.Text_Result :=
        Editorial_Age (Context, Value, Unit);
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Editorial_Age_Into;

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
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Percent_Words_Into;

   function Spellout_Coverage
     return Humanize.Status.Text_Result
   is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text => To_Unbounded_String
           ("deterministic-en locale-cardinal locale-decimal "
            & "locale-fraction locale-ordinal generated-locale-spellout "
            & "sv-no-nb-fi-tr-pl-cs-ru-uk-ja-ko-zh-ar-hi "
            & "ro-lt-sl-id-ms-eo-vi-sw-af-hu-sk "
            & "signed-cardinal currency percent editorial"),
         Key => Humanize.Messages.No_Message);
   end Spellout_Coverage;

   function Spellout_Locale_Tier_For
     (Context : Humanize.Contexts.Context)
      return Spellout_Locale_Tier
   is
      Locale : constant String := Locale_Prefix (Context);
   begin
      if Locale = "en" then
         return English_Spellout;
      elsif Locale in "da" | "de" | "fr" | "es" | "it" | "pt" | "nl" then
         return Native_Locale_Spellout;
      elsif Locale = "sv" or else Is_Norwegian (Locale) or else Locale = "fi"
        or else Locale = "tr" or else Locale = "pl" or else Locale = "cs"
        or else Locale = "ru" or else Locale = "uk" or else Locale = "ja"
        or else Locale = "ko" or else Locale = "zh" or else Locale = "ar"
        or else Locale = "hi" or else Locale = "ro" or else Locale = "lt"
        or else Locale = "sl" or else Locale = "id" or else Locale = "ms"
        or else Locale = "eo" or else Locale = "vi" or else Locale = "sw"
        or else Locale = "af" or else Locale = "hu" or else Locale = "sk"
      then
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
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String
           (case Tier is
               when English_Spellout =>
                  "english-spellout",
               when Native_Locale_Spellout =>
                  "native-locale-spellout",
               when Generated_Locale_Spellout =>
                  "generated-locale-spellout",
               when English_Fallback_Spellout =>
                  "english-fallback-spellout"),
         Key    => Humanize.Messages.No_Message);
   end Spellout_Locale_Tier_Label;

   procedure Spellout_Coverage_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Spellout_Coverage;
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
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
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Spellout_Locale_Tier_Label_Into;

   function Scientific_Text
     (Value   : Long_Float;
      Options : Number_Options;
      Style   : Scientific_Style)
      return String
   is
      Mantissa : Long_Float := Value;
      Exponent : Integer := 0;
   begin
      if Value = 0.0 then
         return "0e0";
      end if;

      while abs Mantissa >= 10.0 loop
         Mantissa := Mantissa / 10.0;
         Exponent := Exponent + 1;
      end loop;
      while abs Mantissa < 1.0 loop
         Mantissa := Mantissa * 10.0;
         Exponent := Exponent - 1;
      end loop;

      if Style = Engineering then
         while Exponent mod 3 /= 0 loop
            Mantissa := Mantissa * 10.0;
            Exponent := Exponent - 1;
         end loop;
      end if;

      return Humanize.Decimal_Images.Decimal_Image
          (Mantissa, Options.Maximum_Fraction_Digits,
           Options.Suppress_Trailing_Zero)
        & (if Style = Engineering then "E" else "e")
        & No_Space (Integer'Image (Exponent));
   end Scientific_Text;

   function Scientific_Notation
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Number_Options := Default_Number_Options;
      Style   : Scientific_Style := Scientific)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String (Scientific_Text (Value, Options, Style)),
         Key    => Humanize.Messages.No_Message);
   end Scientific_Notation;

   procedure Scientific_Notation_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options;
      Style   : Scientific_Style := Scientific)
   is
      Result : constant Humanize.Status.Text_Result :=
        Scientific_Notation (Context, Value, Options, Style);
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Scientific_Notation_Into;

   function SI_Prefix_Symbol (Exponent : Integer) return String is
   begin
      case Exponent is
         when -24 => return "y";
         when -21 => return "z";
         when -18 => return "a";
         when -15 => return "f";
         when -12 => return "p";
         when -9  => return "n";
         when -6  => return "u";
         when -3  => return "m";
         when 0   => return "";
         when 3   => return "k";
         when 6   => return "M";
         when 9   => return "G";
         when 12  => return "T";
         when 15  => return "P";
         when 18  => return "E";
         when 21  => return "Z";
         when 24  => return "Y";
         when others => return "";
      end case;
   end SI_Prefix_Symbol;

   function SI_Prefix_Name (Exponent : Integer) return String is
   begin
      case Exponent is
         when -24 => return "yocto";
         when -21 => return "zepto";
         when -18 => return "atto";
         when -15 => return "femto";
         when -12 => return "pico";
         when -9  => return "nano";
         when -6  => return "micro";
         when -3  => return "milli";
         when 0   => return "";
         when 3   => return "kilo";
         when 6   => return "mega";
         when 9   => return "giga";
         when 12  => return "tera";
         when 15  => return "peta";
         when 18  => return "exa";
         when 21  => return "zetta";
         when 24  => return "yotta";
         when others => return "";
      end case;
   end SI_Prefix_Name;

   function SI_Prefix
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : String := "";
      Options : SI_Prefix_Options := Default_SI_Prefix_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Scaled   : Long_Float := Value;
      Exponent : Integer := 0;
   begin
      if Value /= 0.0 then
         while abs Scaled >= 1000.0 and then Exponent < 24 loop
            Scaled := Scaled / 1000.0;
            Exponent := Exponent + 3;
         end loop;

         while abs Scaled < 1.0 and then Exponent > -24 loop
            Scaled := Scaled * 1000.0;
            Exponent := Exponent - 3;
         end loop;
      end if;

      declare
         Number : constant String :=
           Humanize.Decimal_Images.Decimal_Image
             (Scaled,
              Options.Number_Style.Maximum_Fraction_Digits,
              Options.Number_Style.Suppress_Trailing_Zero);
         Prefix : constant String :=
           (if Options.Prefix_Style = SI_Symbol
            then SI_Prefix_Symbol (Exponent)
            else SI_Prefix_Name (Exponent));
         Suffix : constant String := Prefix & Unit;
         Space  : constant String :=
           (if Options.Space_Before_Unit
            and then Suffix'Length > 0 then " " else "");
      begin
         return
           (Status => Humanize.Status.Ok,
            Text   => To_Unbounded_String (Number & Space & Suffix),
            Key    => Humanize.Messages.No_Message);
      end;
   end SI_Prefix;

   procedure SI_Prefix_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Unit    : String := "";
      Options : SI_Prefix_Options := Default_SI_Prefix_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        SI_Prefix (Context, Value, Unit, Options);
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end SI_Prefix_Into;

   function Currency
     (Context : Humanize.Contexts.Context;
      Amount  : Long_Float;
      Code    : String;
      Options : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if Code'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String
           (Humanize.Decimal_Images.Decimal_Image
              (Amount, Options.Maximum_Fraction_Digits,
               Options.Suppress_Trailing_Zero)
            & " " & Code),
         Key    => Humanize.Messages.No_Message);
   end Currency;

   procedure Currency_Into
     (Context : Humanize.Contexts.Context;
      Amount  : Long_Float;
      Code    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Currency (Context, Amount, Code, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Currency_Into;

   function Approximate_Currency
     (Context : Humanize.Contexts.Context;
      Amount  : Long_Float;
      Code    : String;
      Kind    : Approximation_Kind := About;
      Options : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Currency (Context, Amount, Code, Options);
      Prefix : constant String :=
        (case Kind is
            when About  => "about ",
            when Almost => "almost ",
            when Over   => "over ",
            when Under  => "under ");
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String (Prefix & To_String (Base.Text)),
         Key    => Humanize.Messages.No_Message);
   end Approximate_Currency;

   procedure Approximate_Currency_Into
     (Context : Humanize.Contexts.Context;
      Amount  : Long_Float;
      Code    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : Approximation_Kind := About;
      Options : Number_Options := Default_Number_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Approximate_Currency (Context, Amount, Code, Kind, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Approximate_Currency_Into;

   function Fractional
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Fraction_Options := Default_Fraction_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Sign       : constant String := (if Value < 0.0 then "-" else "");
      Abs_Value  : constant Long_Float := abs Value;
      Whole      : constant Natural := Natural (Long_Float'Floor (Abs_Value));
      Fraction   : constant Long_Float := Abs_Value - Long_Float (Whole);
      Denominator : constant Natural := Options.Max_Denominator;
      Numerator   : constant Natural :=
        Natural (Long_Float'Rounding (Fraction * Long_Float (Denominator)));
   begin
      if Numerator = 0 then
         return
           (Status => Humanize.Status.Ok,
            Text   => To_Unbounded_String (Sign & No_Space (Natural'Image (Whole))),
            Key    => Humanize.Messages.No_Message);
      elsif Numerator = Denominator then
         return
           (Status => Humanize.Status.Ok,
            Text   => To_Unbounded_String
              (Sign & No_Space (Natural'Image (Whole + 1))),
            Key    => Humanize.Messages.No_Message);
      else
         declare
            Divisor : constant Natural := GCD (Numerator, Denominator);
            Num     : constant Natural := Numerator / Divisor;
            Den     : constant Natural := Denominator / Divisor;
            Frac    : constant String :=
              No_Space (Natural'Image (Num)) & "/"
              & No_Space (Natural'Image (Den));
            Text    : constant String :=
              (if Whole = 0 then Sign & Frac
               else Sign & No_Space (Natural'Image (Whole)) & " " & Frac);
         begin
            return
              (Status => Humanize.Status.Ok,
               Text   => To_Unbounded_String (Text),
               Key    => Humanize.Messages.No_Message);
         end;
      end if;
   end Fractional;

   procedure Fractional_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Fraction_Options := Default_Fraction_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Fractional (Context, Value, Options);
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Fractional_Into;

   function Bounded_Number
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Maximum : Long_Long_Integer;
      Suffix  : String := "+")
      return Humanize.Status.Text_Result
   is
      Display : constant Long_Long_Integer :=
        (if Value > Maximum then Maximum else Value);
      Image   : constant String :=
        No_Space (Long_Long_Integer'Image (Display));
   begin
      return Humanize.I18N_Rendering.Render
        (Context,
         Humanize.Selections.Value_Suffix
           (Humanize.Messages.Number_Bounded,
           Image,
            (if Value > Maximum then Suffix else "")));
   end Bounded_Number;

   function Plain (Value : Long_Long_Integer) return String is
     (No_Space (Long_Long_Integer'Image (Value)));

   type Number_Phrase_Key is
     (Phrase_About,
      Phrase_Under,
      Phrase_Up_To,
      Phrase_Between,
      Phrase_And,
      Phrase_To,
      Phrase_Inclusive,
      Phrase_Greater_Than,
      Phrase_Or_More,
      Phrase_At_Least,
      Phrase_More_Than,
      Phrase_At_Most,
      Phrase_Less_Than,
      Phrase_Exactly,
      Phrase_Is_Within,
      Phrase_Is_Below,
      Phrase_Is_Above,
      Phrase_Per,
      Phrase_In,
      Phrase_Out_Of,
      Phrase_Unchanged,
      Phrase_Up,
      Phrase_Down,
      Phrase_More,
      Phrase_Fewer,
      Phrase_Since);

   function Number_Phrase
     (Context : Humanize.Contexts.Context;
      Key     : Number_Phrase_Key)
      return String;

   function Number_Range
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Options : Number_Range_Options := Default_Number_Range_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Sep : constant String :=
        (if Options.Spaces_Around
         then " " & Options.Separator & " "
         else [1 => Options.Separator]);
   begin
      if High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;
      return Ok_Text (Plain (Low) & Sep & Plain (High));
   end Number_Range;

   function Approximate_Range
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Options : Number_Range_Options := Default_Number_Range_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Number_Range (Context, Low, High, Options);
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;
      return Ok_Text
        (Number_Phrase (Context, Phrase_About) & " " & To_String (Base.Text));
   end Approximate_Range;

   function Decimal_Text
     (Value   : Long_Float;
      Options : Number_Options)
      return String
   is
   begin
      return Humanize.Decimal_Images.Decimal_Image
        (Value,
         Options.Maximum_Fraction_Digits,
         Options.Suppress_Trailing_Zero);
   end Decimal_Text;

   function Decimal_Range
     (Context : Humanize.Contexts.Context;
      Low     : Long_Float;
      High    : Long_Float;
      Options : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result
   is
   begin
      if High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      return Ok_Text
        (Decimal_Text (Low, Options) & " "
         & Number_Phrase (Context, Phrase_To) & " "
         & Decimal_Text (High, Options));
   end Decimal_Range;

   function Decimal_Range_Metadata
     (Low     : Long_Float;
      High    : Long_Float;
      Options : Number_Options := Default_Number_Options)
      return Number_Render_Metadata
   is
   begin
      if High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Kind => Rendered_Decimal_Range,
         Low => Low,
         High => High,
         Value => 0.0,
         Uncertainty => 0.0,
         Fraction_Digits => Options.Maximum_Fraction_Digits,
         Style => Plus_Minus_Uncertainty);
   end Decimal_Range_Metadata;

   function Uncertainty_Metadata
     (Value       : Long_Float;
      Uncertainty : Long_Float;
      Options     : Number_Options := Default_Number_Options;
      Style       : Uncertainty_Style := Plus_Minus_Uncertainty)
      return Number_Render_Metadata
   is
   begin
      if Uncertainty < 0.0 then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Kind => Rendered_Uncertainty,
         Low => Value - Uncertainty,
         High => Value + Uncertainty,
         Value => Value,
         Uncertainty => Uncertainty,
         Fraction_Digits => Options.Maximum_Fraction_Digits,
         Style => Style);
   end Uncertainty_Metadata;

   function Uncertainty_Label
     (Context     : Humanize.Contexts.Context;
      Value       : Long_Float;
      Uncertainty : Long_Float;
      Options     : Number_Options := Default_Number_Options;
      Style       : Uncertainty_Style := Plus_Minus_Uncertainty)
      return Humanize.Status.Text_Result
   is
      Center : constant String := Decimal_Text (Value, Options);
      Delta_Text  : constant String := Decimal_Text (Uncertainty, Options);
   begin
      if Uncertainty < 0.0 then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      case Style is
         when Plus_Minus_Uncertainty =>
            return Ok_Text (Center & " +/- " & Delta_Text);
         when Parenthesized_Uncertainty =>
            return Ok_Text (Center & " (+/- " & Delta_Text & ")");
         when Interval_Uncertainty =>
            return Decimal_Range
              (Context, Value - Uncertainty, Value + Uncertainty, Options);
      end case;
   end Uncertainty_Label;

   function Decimal_Range_Words
     (Context         : Humanize.Contexts.Context;
      Low             : Long_Float;
      High            : Long_Float;
      Fraction_Digits : Natural := 2)
      return Humanize.Status.Text_Result
   is
      Left  : constant Humanize.Status.Text_Result :=
        Decimal_Words (Context, Low, Fraction_Digits);
      Right : constant Humanize.Status.Text_Result :=
        Decimal_Words (Context, High, Fraction_Digits);
   begin
      if High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      elsif Left.Status /= Humanize.Status.Ok then
         return Left;
      elsif Right.Status /= Humanize.Status.Ok then
         return Right;
      end if;

      return Ok_Text
        (To_String (Left.Text) & " "
         & Number_Phrase (Context, Phrase_To) & " "
         & To_String (Right.Text));
   end Decimal_Range_Words;

   function Uncertainty_Words
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Uncertainty     : Long_Float;
      Fraction_Digits : Natural := 1)
      return Humanize.Status.Text_Result
   is
      Center : constant Humanize.Status.Text_Result :=
        Decimal_Words (Context, Value, Fraction_Digits);
      Delta_Text  : constant Humanize.Status.Text_Result :=
        Decimal_Words (Context, Uncertainty, Fraction_Digits);
   begin
      if Uncertainty < 0.0 then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      elsif Center.Status /= Humanize.Status.Ok then
         return Center;
      elsif Delta_Text.Status /= Humanize.Status.Ok then
         return Delta_Text;
      end if;

      return Ok_Text
        (To_String (Center.Text) & " plus or minus "
         & To_String (Delta_Text.Text));
   end Uncertainty_Words;

   function Under_Number
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Number_Phrase (Context, Phrase_Under) & " " & Plain (Value));
   end Under_Number;

   function Up_To
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Number_Phrase (Context, Phrase_Up_To) & " " & Plain (Value));
   end Up_To;

   function Between
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer)
      return Humanize.Status.Text_Result
   is
   begin
      if High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;
      return Ok_Text
        (Number_Phrase (Context, Phrase_Between) & " " & Plain (Low) & " "
         & Number_Phrase (Context, Phrase_And) & " " & Plain (High));
   end Between;

   function Range_Text
     (Low  : Long_Long_Integer;
      High : Long_Long_Integer)
      return String
   is
   begin
      return Plain (Low) & "-" & Plain (High);
   end Range_Text;

   function Number_Phrase
     (Context : Humanize.Contexts.Context;
      Key     : Number_Phrase_Key)
      return String
   is
      Locale : constant String := Locale_Prefix (Context);
   begin
      if Locale = "da" then
         case Key is
            when Phrase_About        => return "cirka";
            when Phrase_Under        => return "under";
            when Phrase_Up_To        => return "op til";
            when Phrase_Between      => return "mellem";
            when Phrase_And          => return "og";
            when Phrase_To           => return "til";
            when Phrase_Inclusive    => return "inklusive";
            when Phrase_Greater_Than => return "storre end";
            when Phrase_Or_More      => return "eller mere";
            when Phrase_At_Least     => return "mindst";
            when Phrase_More_Than    => return "mere end";
            when Phrase_At_Most      => return "hojst";
            when Phrase_Less_Than    => return "mindre end";
            when Phrase_Exactly      => return "praecis";
            when Phrase_Is_Within    => return "er inden for";
            when Phrase_Is_Below     => return "er under";
            when Phrase_Is_Above     => return "er over";
            when Phrase_Per          => return "per";
            when Phrase_In           => return "ud af";
            when Phrase_Out_Of       => return "ud af";
            when Phrase_Unchanged    => return "uaendret";
            when Phrase_Up           => return "op";
            when Phrase_Down         => return "ned";
            when Phrase_More         => return "mere";
            when Phrase_Fewer        => return "faerre";
            when Phrase_Since        => return "siden";
         end case;
      elsif Locale = "de" then
         case Key is
            when Phrase_About        => return "ungefaehr";
            when Phrase_Under        => return "unter";
            when Phrase_Up_To        => return "bis zu";
            when Phrase_Between      => return "zwischen";
            when Phrase_And          => return "und";
            when Phrase_To           => return "bis";
            when Phrase_Inclusive    => return "einschliesslich";
            when Phrase_Greater_Than => return "groesser als";
            when Phrase_Or_More      => return "oder mehr";
            when Phrase_At_Least     => return "mindestens";
            when Phrase_More_Than    => return "mehr als";
            when Phrase_At_Most      => return "hoechstens";
            when Phrase_Less_Than    => return "weniger als";
            when Phrase_Exactly      => return "genau";
            when Phrase_Is_Within    => return "liegt innerhalb von";
            when Phrase_Is_Below     => return "liegt unter";
            when Phrase_Is_Above     => return "liegt ueber";
            when Phrase_Per          => return "pro";
            when Phrase_In           => return "von";
            when Phrase_Out_Of       => return "von";
            when Phrase_Unchanged    => return "unveraendert";
            when Phrase_Up           => return "plus";
            when Phrase_Down         => return "minus";
            when Phrase_More         => return "mehr";
            when Phrase_Fewer        => return "weniger";
            when Phrase_Since        => return "seit";
         end case;
      elsif Locale = "fr" then
         case Key is
            when Phrase_About        => return "environ";
            when Phrase_Under        => return "moins de";
            when Phrase_Up_To        => return "jusqu'a";
            when Phrase_Between      => return "entre";
            when Phrase_And          => return "et";
            when Phrase_To           => return "a";
            when Phrase_Inclusive    => return "inclus";
            when Phrase_Greater_Than => return "superieur a";
            when Phrase_Or_More      => return "ou plus";
            when Phrase_At_Least     => return "au moins";
            when Phrase_More_Than    => return "plus de";
            when Phrase_At_Most      => return "au plus";
            when Phrase_Less_Than    => return "moins de";
            when Phrase_Exactly      => return "exactement";
            when Phrase_Is_Within    => return "est dans";
            when Phrase_Is_Below     => return "est sous";
            when Phrase_Is_Above     => return "est au-dessus de";
            when Phrase_Per          => return "par";
            when Phrase_In           => return "sur";
            when Phrase_Out_Of       => return "sur";
            when Phrase_Unchanged    => return "inchange";
            when Phrase_Up           => return "en hausse de";
            when Phrase_Down         => return "en baisse de";
            when Phrase_More         => return "de plus";
            when Phrase_Fewer        => return "de moins";
            when Phrase_Since        => return "depuis";
         end case;
      elsif Locale = "es" then
         case Key is
            when Phrase_About        => return "aproximadamente";
            when Phrase_Under        => return "menos de";
            when Phrase_Up_To        => return "hasta";
            when Phrase_Between      => return "entre";
            when Phrase_And          => return "y";
            when Phrase_To           => return "a";
            when Phrase_Inclusive    => return "inclusive";
            when Phrase_Greater_Than => return "mayor que";
            when Phrase_Or_More      => return "o mas";
            when Phrase_At_Least     => return "al menos";
            when Phrase_More_Than    => return "mas de";
            when Phrase_At_Most      => return "como maximo";
            when Phrase_Less_Than    => return "menos de";
            when Phrase_Exactly      => return "exactamente";
            when Phrase_Is_Within    => return "esta dentro de";
            when Phrase_Is_Below     => return "esta por debajo de";
            when Phrase_Is_Above     => return "esta por encima de";
            when Phrase_Per          => return "por";
            when Phrase_In           => return "en";
            when Phrase_Out_Of       => return "de";
            when Phrase_Unchanged    => return "sin cambios";
            when Phrase_Up           => return "sube";
            when Phrase_Down         => return "baja";
            when Phrase_More         => return "mas";
            when Phrase_Fewer        => return "menos";
            when Phrase_Since        => return "desde";
         end case;
      elsif Locale = "it" then
         case Key is
            when Phrase_About        => return "circa";
            when Phrase_Under        => return "meno di";
            when Phrase_Up_To        => return "fino a";
            when Phrase_Between      => return "tra";
            when Phrase_And          => return "e";
            when Phrase_To           => return "a";
            when Phrase_Inclusive    => return "incluso";
            when Phrase_Greater_Than => return "maggiore di";
            when Phrase_Or_More      => return "o piu";
            when Phrase_At_Least     => return "almeno";
            when Phrase_More_Than    => return "piu di";
            when Phrase_At_Most      => return "al massimo";
            when Phrase_Less_Than    => return "meno di";
            when Phrase_Exactly      => return "esattamente";
            when Phrase_Is_Within    => return "e entro";
            when Phrase_Is_Below     => return "e sotto";
            when Phrase_Is_Above     => return "e sopra";
            when Phrase_Per          => return "per";
            when Phrase_In           => return "su";
            when Phrase_Out_Of       => return "su";
            when Phrase_Unchanged    => return "invariato";
            when Phrase_Up           => return "su";
            when Phrase_Down         => return "giu";
            when Phrase_More         => return "in piu";
            when Phrase_Fewer        => return "in meno";
            when Phrase_Since        => return "da";
         end case;
      elsif Locale = "pt" then
         case Key is
            when Phrase_About        => return "aproximadamente";
            when Phrase_Under        => return "menos de";
            when Phrase_Up_To        => return "ate";
            when Phrase_Between      => return "entre";
            when Phrase_And          => return "e";
            when Phrase_To           => return "a";
            when Phrase_Inclusive    => return "inclusive";
            when Phrase_Greater_Than => return "maior que";
            when Phrase_Or_More      => return "ou mais";
            when Phrase_At_Least     => return "pelo menos";
            when Phrase_More_Than    => return "mais de";
            when Phrase_At_Most      => return "no maximo";
            when Phrase_Less_Than    => return "menos de";
            when Phrase_Exactly      => return "exatamente";
            when Phrase_Is_Within    => return "esta dentro de";
            when Phrase_Is_Below     => return "esta abaixo de";
            when Phrase_Is_Above     => return "esta acima de";
            when Phrase_Per          => return "por";
            when Phrase_In           => return "em";
            when Phrase_Out_Of       => return "de";
            when Phrase_Unchanged    => return "inalterado";
            when Phrase_Up           => return "sobe";
            when Phrase_Down         => return "desce";
            when Phrase_More         => return "mais";
            when Phrase_Fewer        => return "menos";
            when Phrase_Since        => return "desde";
         end case;
      elsif Locale = "nl" then
         case Key is
            when Phrase_About        => return "ongeveer";
            when Phrase_Under        => return "onder";
            when Phrase_Up_To        => return "tot";
            when Phrase_Between      => return "tussen";
            when Phrase_And          => return "en";
            when Phrase_To           => return "tot";
            when Phrase_Inclusive    => return "inclusief";
            when Phrase_Greater_Than => return "groter dan";
            when Phrase_Or_More      => return "of meer";
            when Phrase_At_Least     => return "minstens";
            when Phrase_More_Than    => return "meer dan";
            when Phrase_At_Most      => return "hoogstens";
            when Phrase_Less_Than    => return "minder dan";
            when Phrase_Exactly      => return "precies";
            when Phrase_Is_Within    => return "ligt binnen";
            when Phrase_Is_Below     => return "ligt onder";
            when Phrase_Is_Above     => return "ligt boven";
            when Phrase_Per          => return "per";
            when Phrase_In           => return "op";
            when Phrase_Out_Of       => return "van";
            when Phrase_Unchanged    => return "ongewijzigd";
            when Phrase_Up           => return "omhoog";
            when Phrase_Down         => return "omlaag";
            when Phrase_More         => return "meer";
            when Phrase_Fewer        => return "minder";
            when Phrase_Since        => return "sinds";
         end case;
      else
         case Key is
            when Phrase_About        => return "about";
            when Phrase_Under        => return "under";
            when Phrase_Up_To        => return "up to";
            when Phrase_Between      => return "between";
            when Phrase_And          => return "and";
            when Phrase_To           => return "to";
            when Phrase_Inclusive    => return "inclusive";
            when Phrase_Greater_Than => return "greater than";
            when Phrase_Or_More      => return "or more";
            when Phrase_At_Least     => return "at least";
            when Phrase_More_Than    => return "more than";
            when Phrase_At_Most      => return "at most";
            when Phrase_Less_Than    => return "less than";
            when Phrase_Exactly      => return "exactly";
            when Phrase_Is_Within    => return "is within";
            when Phrase_Is_Below     => return "is below";
            when Phrase_Is_Above     => return "is above";
            when Phrase_Per          => return "per";
            when Phrase_In           => return "in";
            when Phrase_Out_Of       => return "out of";
            when Phrase_Unchanged    => return "unchanged";
            when Phrase_Up           => return "up";
            when Phrase_Down         => return "down";
            when Phrase_More         => return "more";
            when Phrase_Fewer        => return "fewer";
            when Phrase_Since        => return "since";
         end case;
      end if;
   end Number_Phrase;

   function Qualified_Range
     (Context  : Humanize.Contexts.Context;
      Low      : Long_Long_Integer;
      High     : Long_Long_Integer;
      Boundary : Range_Boundary_Style := Inclusive_Range)
      return Humanize.Status.Text_Result
   is
   begin
      if High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      case Boundary is
         when Inclusive_Range =>
            return Ok_Text
              (Plain (Low) & " " & Number_Phrase (Context, Phrase_To) & " "
               & Plain (High) & " "
               & Number_Phrase (Context, Phrase_Inclusive));
         when Exclusive_Range =>
            return Ok_Text
              (Number_Phrase (Context, Phrase_Greater_Than) & " "
               & Plain (Low) & " " & Number_Phrase (Context, Phrase_And)
               & " " & Number_Phrase (Context, Phrase_Less_Than) & " "
               & Plain (High));
         when Include_Low_Only =>
            return Ok_Text
              (Plain (Low) & " " & Number_Phrase (Context, Phrase_Or_More)
               & " " & Number_Phrase (Context, Phrase_And) & " "
               & Number_Phrase (Context, Phrase_Less_Than) & " "
               & Plain (High));
         when Include_High_Only =>
            return Ok_Text
              (Number_Phrase (Context, Phrase_Greater_Than) & " "
               & Plain (Low) & " " & Number_Phrase (Context, Phrase_And)
               & " " & Number_Phrase (Context, Phrase_Up_To) & " "
               & Plain (High));
      end case;
   end Qualified_Range;

   function Tolerance_Range
     (Context   : Humanize.Contexts.Context;
      Center    : Long_Long_Integer;
      Tolerance : Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text (Plain (Center) & " +/- " & No_Space (Natural'Image (Tolerance)));
   end Tolerance_Range;

   function Threshold
     (Context   : Humanize.Contexts.Context;
      Value     : Long_Long_Integer;
      Direction : Threshold_Direction)
      return Humanize.Status.Text_Result
   is
   begin
      case Direction is
         when At_Least_Threshold =>
            return Ok_Text
              (Number_Phrase (Context, Phrase_At_Least) & " " & Plain (Value));
         when More_Than_Threshold =>
            return Ok_Text
              (Number_Phrase (Context, Phrase_More_Than) & " " & Plain (Value));
         when At_Most_Threshold =>
            return Ok_Text
              (Number_Phrase (Context, Phrase_At_Most) & " " & Plain (Value));
         when Less_Than_Threshold =>
            return Ok_Text
              (Number_Phrase (Context, Phrase_Less_Than) & " " & Plain (Value));
         when Exactly_Threshold =>
            return Ok_Text
              (Number_Phrase (Context, Phrase_Exactly) & " " & Plain (Value));
      end case;
   end Threshold;

   function Contains_Value
     (Value    : Long_Long_Integer;
      Low      : Long_Long_Integer;
      High     : Long_Long_Integer;
      Boundary : Range_Boundary_Style)
      return Boolean
   is
   begin
      case Boundary is
         when Inclusive_Range =>
            return Value >= Low and then Value <= High;
         when Exclusive_Range =>
            return Value > Low and then Value < High;
         when Include_Low_Only =>
            return Value >= Low and then Value < High;
         when Include_High_Only =>
            return Value > Low and then Value <= High;
      end case;
   end Contains_Value;

   function Range_Position
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Long_Integer;
      Low      : Long_Long_Integer;
      High     : Long_Long_Integer;
      Boundary : Range_Boundary_Style := Inclusive_Range)
      return Humanize.Status.Text_Result
   is
      Bounds : constant String := Range_Text (Low, High);
   begin
      if High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      elsif Contains_Value (Value, Low, High, Boundary) then
         return Ok_Text
           (Plain (Value) & " " & Number_Phrase (Context, Phrase_Is_Within)
            & " " & Bounds);
      elsif Value < Low or else (Value = Low and then Boundary in
        Exclusive_Range | Include_High_Only)
      then
         return Ok_Text
           (Plain (Value) & " " & Number_Phrase (Context, Phrase_Is_Below)
            & " " & Bounds);
      else
         return Ok_Text
           (Plain (Value) & " " & Number_Phrase (Context, Phrase_Is_Above)
            & " " & Bounds);
      end if;
   end Range_Position;

   function Ratio
     (Context : Humanize.Contexts.Context;
      Left    : Natural;
      Right   : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (No_Space (Natural'Image (Left)) & ":"
         & No_Space (Natural'Image (Right)));
   end Ratio;

   function Counted_Noun
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
   is
   begin
      if Count = 1 then
         return Singular;
      elsif Plural'Length > 0 then
         return Plural;
      else
         return Singular & "s";
      end if;
   end Counted_Noun;

   function Ratio_Per
     (Context              : Humanize.Contexts.Context;
      Numerator            : Natural;
      Denominator          : Positive;
      Numerator_Singular   : String;
      Denominator_Singular : String;
      Numerator_Plural     : String := "";
      Denominator_Plural   : String := "")
      return Humanize.Status.Text_Result
   is
      Numerator_Text : constant String :=
        No_Space (Natural'Image (Numerator)) & " "
        & Counted_Noun (Numerator, Numerator_Singular, Numerator_Plural);
      Denominator_Text : constant String :=
        (if Denominator = 1 then
            Counted_Noun
              (1, Denominator_Singular, Denominator_Plural)
         else
            No_Space (Positive'Image (Denominator)) & " "
            & Counted_Noun
              (Denominator, Denominator_Singular, Denominator_Plural));
   begin
      return Ok_Text
        (Numerator_Text & " " & Number_Phrase (Context, Phrase_Per)
         & " " & Denominator_Text);
   end Ratio_Per;

   function One_In
     (Context : Humanize.Contexts.Context;
      Denominator : Positive)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        ("1 " & Number_Phrase (Context, Phrase_In) & " "
         & No_Space (Positive'Image (Denominator)));
   end One_In;

   function Out_Of
     (Context : Humanize.Contexts.Context;
      Count   : Natural;
      Total   : Positive)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (No_Space (Natural'Image (Count)) & " "
         & Number_Phrase (Context, Phrase_Out_Of) & " "
         & No_Space (Positive'Image (Total)));
   end Out_Of;

   function Direction_Of_Change
     (Value : Long_Float)
      return Change_Direction
   is
   begin
      if Value > 0.0 then
         return Change_Up;
      elsif Value < 0.0 then
         return Change_Down;
      else
         return Change_None;
      end if;
   end Direction_Of_Change;

   function Change_Number_Text
     (Value   : Long_Float;
      Options : Change_Options)
      return String
   is
   begin
      return Humanize.Decimal_Images.Decimal_Image
        (Value,
         Options.Number_Style.Maximum_Fraction_Digits,
         Options.Number_Style.Suppress_Trailing_Zero);
   end Change_Number_Text;

   function Unit_Noun
     (Value    : Long_Float;
      Singular : String;
      Plural   : String)
      return String
   is
   begin
      if abs Value = 1.0 then
         return Singular;
      elsif Plural'Length > 0 then
         return Plural;
      else
         return Singular & "s";
      end if;
   end Unit_Noun;

   function Compose_Change
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Float;
      Quantity : String;
      Options  : Change_Options;
      Tail     : String := "")
      return Humanize.Status.Text_Result
   is
      Direction : constant Change_Direction := Direction_Of_Change (Value);
      Full_Quantity : constant String :=
        (if Tail'Length = 0 then Quantity else Quantity & " " & Tail);
   begin
      if Direction = Change_None and then Options.Zero_Style = Unchanged_Zero then
         return Ok_Text (Number_Phrase (Context, Phrase_Unchanged));
      end if;

      case Options.Style is
         when Directional_Change =>
            case Direction is
               when Change_Up =>
                  return Ok_Text
                    (Number_Phrase (Context, Phrase_Up) & " " & Full_Quantity);
               when Change_Down =>
                  return Ok_Text
                    (Number_Phrase (Context, Phrase_Down) & " " & Full_Quantity);
               when Change_None =>
                  return Ok_Text (Full_Quantity);
            end case;
         when Signed_Change =>
            case Direction is
               when Change_Up =>
                  return Ok_Text ("+" & Full_Quantity);
               when Change_Down =>
                  return Ok_Text ("-" & Full_Quantity);
               when Change_None =>
                  return Ok_Text (Full_Quantity);
            end case;
         when Comparative_Change =>
            case Direction is
               when Change_Up =>
                  return Ok_Text
                    (Quantity & " " & Number_Phrase (Context, Phrase_More)
                     & (if Tail'Length = 0 then "" else " " & Tail));
               when Change_Down =>
                  return Ok_Text
                    (Quantity & " " & Number_Phrase (Context, Phrase_Fewer)
                     & (if Tail'Length = 0 then "" else " " & Tail));
               when Change_None =>
                  return Ok_Text (Full_Quantity);
            end case;
      end case;
   end Compose_Change;

   function Append_Since
     (Context : Humanize.Contexts.Context;
      Base    : Humanize.Status.Text_Result;
      Since : String)
      return Humanize.Status.Text_Result
   is
   begin
      if Base.Status /= Humanize.Status.Ok or else Since'Length = 0 then
         return Base;
      else
         return Ok_Text
           (To_String (Base.Text) & " "
            & Number_Phrase (Context, Phrase_Since) & " " & Since);
      end if;
   end Append_Since;

   function Change
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
   is
      Quantity : constant String := Change_Number_Text (abs Value, Options);
   begin
      return Compose_Change (Context, Value, Quantity, Options);
   end Change;

   function Change_Since
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Since   : String;
      Options : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Append_Since (Context, Change (Context, Value, Options), Since);
   end Change_Since;

   function Change_From
     (Context  : Humanize.Contexts.Context;
      Current  : Long_Float;
      Previous : Long_Float;
      Options  : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Change (Context, Current - Previous, Options);
   end Change_From;

   function Percent_Change
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
   is
      Quantity : constant Humanize.Status.Text_Result :=
        Percent (Context, abs Value, Options.Number_Style);
   begin
      if Quantity.Status /= Humanize.Status.Ok then
         return Quantity;
      end if;
      return Compose_Change (Context, Value, To_String (Quantity.Text), Options);
   end Percent_Change;

   function Percent_Delta
     (Context  : Humanize.Contexts.Context;
      Current  : Long_Float;
      Previous : Long_Float;
      Options  : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
   is
   begin
      if Previous = 0.0 then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      else
         return Percent_Change
           (Context, ((Current - Previous) / abs Previous) * 100.0, Options);
      end if;
   end Percent_Delta;

   function Point_Change
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
   is
      Abs_Value : constant Long_Float := abs Value;
      Quantity  : constant String :=
        Change_Number_Text (Abs_Value, Options);
   begin
      return Compose_Change
        (Context, Value, Quantity, Options,
         (if Abs_Value = 1.0 then "point" else "points"));
   end Point_Change;

   function Unit_Change
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Float;
      Singular : String;
      Plural   : String := "";
      Options  : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
   is
      Abs_Value : constant Long_Float := abs Value;
      Quantity  : constant String :=
        Change_Number_Text (Abs_Value, Options);
   begin
      if Singular'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      else
         return Compose_Change
           (Context, Value, Quantity, Options,
            Unit_Noun (Abs_Value, Singular, Plural));
      end if;
   end Unit_Change;

   procedure Bounded_Number_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Maximum : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Suffix  : String := "+")
   is
      Display : constant Long_Long_Integer :=
        (if Value > Maximum then Maximum else Value);
      Image   : constant String :=
        No_Space (Long_Long_Integer'Image (Display));
   begin
      Humanize.I18N_Rendering.Render_Into
        (Context,
         Humanize.Selections.Value_Suffix
           (Humanize.Messages.Number_Bounded,
            Image,
            (if Value > Maximum then Suffix else "")),
         Target,
         Written,
         Status);
   end Bounded_Number_Into;

   procedure Number_Range_Into
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Range_Options := Default_Number_Range_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Number_Range (Context, Low, High, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Number_Range_Into;

   procedure Approximate_Range_Into
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Range_Options := Default_Number_Range_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Approximate_Range (Context, Low, High, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Approximate_Range_Into;

   procedure Decimal_Range_Into
     (Context : Humanize.Contexts.Context;
      Low     : Long_Float;
      High    : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Decimal_Range (Context, Low, High, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Decimal_Range_Into;

   procedure Uncertainty_Label_Into
     (Context     : Humanize.Contexts.Context;
      Value       : Long_Float;
      Uncertainty : Long_Float;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Options     : Number_Options := Default_Number_Options;
      Style       : Uncertainty_Style := Plus_Minus_Uncertainty)
   is
      Result : constant Humanize.Status.Text_Result :=
        Uncertainty_Label (Context, Value, Uncertainty, Options, Style);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Uncertainty_Label_Into;

   procedure Decimal_Range_Words_Into
     (Context         : Humanize.Contexts.Context;
      Low             : Long_Float;
      High            : Long_Float;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code;
      Fraction_Digits : Natural := 2)
   is
      Result : constant Humanize.Status.Text_Result :=
        Decimal_Range_Words (Context, Low, High, Fraction_Digits);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Decimal_Range_Words_Into;

   procedure Uncertainty_Words_Into
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Uncertainty     : Long_Float;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code;
      Fraction_Digits : Natural := 1)
   is
      Result : constant Humanize.Status.Text_Result :=
        Uncertainty_Words (Context, Value, Uncertainty, Fraction_Digits);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Uncertainty_Words_Into;

   procedure Under_Number_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Under_Number (Context, Value);
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Under_Number_Into;

   procedure Up_To_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Up_To (Context, Value);
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Up_To_Into;

   procedure Between_Into
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Between (Context, Low, High);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Between_Into;

   procedure Qualified_Range_Into
     (Context  : Humanize.Contexts.Context;
      Low      : Long_Long_Integer;
      High     : Long_Long_Integer;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Boundary : Range_Boundary_Style := Inclusive_Range)
   is
      Result : constant Humanize.Status.Text_Result :=
        Qualified_Range (Context, Low, High, Boundary);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Qualified_Range_Into;

   procedure Tolerance_Range_Into
     (Context   : Humanize.Contexts.Context;
      Center    : Long_Long_Integer;
      Tolerance : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Tolerance_Range (Context, Center, Tolerance);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Tolerance_Range_Into;

   procedure Threshold_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Long_Long_Integer;
      Direction : Threshold_Direction;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Threshold (Context, Value, Direction);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Threshold_Into;

   procedure Range_Position_Into
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Long_Integer;
      Low      : Long_Long_Integer;
      High     : Long_Long_Integer;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Boundary : Range_Boundary_Style := Inclusive_Range)
   is
      Result : constant Humanize.Status.Text_Result :=
        Range_Position (Context, Value, Low, High, Boundary);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Range_Position_Into;

   procedure Ratio_Into
     (Context : Humanize.Contexts.Context;
      Left    : Natural;
      Right   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Ratio (Context, Left, Right);
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Ratio_Into;

   procedure Ratio_Per_Into
     (Context              : Humanize.Contexts.Context;
      Numerator            : Natural;
      Denominator          : Positive;
      Numerator_Singular   : String;
      Denominator_Singular : String;
      Target               : in out String;
      Written              : out Natural;
      Status               : out Humanize.Status.Status_Code;
      Numerator_Plural     : String := "";
      Denominator_Plural   : String := "")
   is
      Result : constant Humanize.Status.Text_Result :=
        Ratio_Per
          (Context, Numerator, Denominator, Numerator_Singular,
           Denominator_Singular, Numerator_Plural, Denominator_Plural);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Ratio_Per_Into;

   procedure One_In_Into
     (Context : Humanize.Contexts.Context;
      Denominator : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        One_In (Context, Denominator);
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end One_In_Into;

   procedure Out_Of_Into
     (Context : Humanize.Contexts.Context;
      Count   : Natural;
      Total   : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Out_Of (Context, Count, Total);
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Out_Of_Into;

   procedure Change_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Change_Options := Default_Change_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Change (Context, Value, Options);
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Change_Into;

   procedure Change_Since_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Since   : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Change_Options := Default_Change_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Change_Since (Context, Value, Since, Options);
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Change_Since_Into;

   procedure Change_From_Into
     (Context  : Humanize.Contexts.Context;
      Current  : Long_Float;
      Previous : Long_Float;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Change_Options := Default_Change_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Change_From (Context, Current, Previous, Options);
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Change_From_Into;

   procedure Percent_Change_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Change_Options := Default_Change_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Percent_Change (Context, Value, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Percent_Change_Into;

   procedure Percent_Delta_Into
     (Context  : Humanize.Contexts.Context;
      Current  : Long_Float;
      Previous : Long_Float;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Options  : Change_Options := Default_Change_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Percent_Delta (Context, Current, Previous, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Percent_Delta_Into;

   procedure Point_Change_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Change_Options := Default_Change_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Point_Change (Context, Value, Options);
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Point_Change_Into;

   procedure Unit_Change_Into
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Float;
      Singular : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Plural   : String := "";
      Options  : Change_Options := Default_Change_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Unit_Change (Context, Value, Singular, Plural, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Unit_Change_Into;

   function Roman
     (Value : Natural)
      return Humanize.Status.Text_Result
   is
      type Roman_Pair is record
         Value : Natural;
         Text  : String (1 .. 2);
         Len   : Natural;
      end record;

      Pairs : constant array (Positive range <>) of Roman_Pair :=
        [Roman_Pair'(Value => 1000, Text => "M ", Len => 1),
         Roman_Pair'(Value => 900,  Text => "CM", Len => 2),
         Roman_Pair'(Value => 500,  Text => "D ", Len => 1),
         Roman_Pair'(Value => 400,  Text => "CD", Len => 2),
         Roman_Pair'(Value => 100,  Text => "C ", Len => 1),
         Roman_Pair'(Value => 90,   Text => "XC", Len => 2),
         Roman_Pair'(Value => 50,   Text => "L ", Len => 1),
         Roman_Pair'(Value => 40,   Text => "XL", Len => 2),
         Roman_Pair'(Value => 10,   Text => "X ", Len => 1),
         Roman_Pair'(Value => 9,    Text => "IX", Len => 2),
         Roman_Pair'(Value => 5,    Text => "V ", Len => 1),
         Roman_Pair'(Value => 4,    Text => "IV", Len => 2),
         Roman_Pair'(Value => 1,    Text => "I ", Len => 1)];
      Remaining : Natural := Value;
      Result    : Unbounded_String;
   begin
      if Value = 0 or else Value > 3_999 then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      for Pair of Pairs loop
         while Remaining >= Pair.Value loop
            Append (Result, Pair.Text (1 .. Pair.Len));
            Remaining := Remaining - Pair.Value;
         end loop;
      end loop;

      return Ok_Text (To_String (Result));
   end Roman;

   procedure Roman_Into
     (Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Roman (Value);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Roman_Into;

   function Ordinal
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Gender  : Ordinal_Gender := Masculine)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.I18N_Rendering.Render
               (Context,
                Humanize.Number_Classification.Ordinal (Value, Gender));
   end Ordinal;

   procedure Ordinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Gender  : Ordinal_Gender := Masculine)
   is
   begin
      Written := 0;
      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
         return;
      end if;
      Humanize.I18N_Rendering.Render_Into
        (Context, Humanize.Number_Classification.Ordinal (Value, Gender),
         Target, Written, Status);
   end Ordinal_Into;

   function Compact
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Options : Number_Options := Default_Number_Options;
      Style   : Compact_Style := Short)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.I18N_Rendering.Render
               (Context,
         Humanize.Number_Classification.Compact
                  (Context, Value, Options, Style));
   end Compact;

   procedure Compact_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options;
      Style   : Compact_Style := Short)
   is
   begin
      Written := 0;
      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
         return;
      end if;
      Humanize.I18N_Rendering.Render_Into
        (Context,
         Humanize.Number_Classification.Compact
           (Context, Value, Options, Style),
         Target, Written, Status);
   end Compact_Into;

   function Percent
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.I18N_Rendering.Render
               (Context,
         Humanize.Number_Classification.Percent
                  (Value, Options));
   end Percent;

   function Accessible_Number
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result
   is
   begin
      return Signed_Cardinal (Context, Value);
   end Accessible_Number;

   procedure Accessible_Number_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Accessible_Number (Context, Value);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Accessible_Number_Into;

   procedure Percent_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options)
   is
   begin
      Written := 0;
      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
         return;
      end if;
      Humanize.I18N_Rendering.Render_Into
        (Context,
         Humanize.Number_Classification.Percent
           (Value, Options),
         Target, Written, Status);
   end Percent_Into;

   function Prefix (Kind : Approximation_Kind) return String is
   begin
      case Kind is
         when About =>
            return "about";
         when Almost =>
            return "almost";
         when Over =>
            return "over";
         when Under =>
            return "under";
      end case;
   end Prefix;

   function Approximate
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Kind    : Approximation_Kind := About)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String
           (Prefix (Kind) & " " & No_Space (Long_Long_Integer'Image (Value))),
         Key    => Humanize.Messages.No_Message);
   end Approximate;

   procedure Approximate_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : Approximation_Kind := About)
   is
      Result : constant Humanize.Status.Text_Result :=
        Approximate (Context, Value, Kind);
   begin
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Approximate_Into;

   function Abs_Diff
     (Left  : Long_Long_Integer;
      Right : Long_Long_Integer)
      return Long_Long_Integer
   is
   begin
      if Left >= Right then
         return Left - Right;
      else
         return Right - Left;
      end if;
   end Abs_Diff;

   function Approximate_To
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : Long_Long_Integer;
      Options : Approximation_Options := Default_Approximation_Options)
      return Humanize.Status.Text_Result
   is
      Threshold : constant Long_Long_Integer :=
        (if Options.Threshold < 0 then 0 else Options.Threshold);
   begin
      if Value < Target and then Target - Value <= Threshold then
         return Approximate (Context, Target, Almost);
      elsif Abs_Diff (Value, Target) <= Threshold then
         return Approximate (Context, Target, About);
      elsif Value > Target then
         return Approximate (Context, Target, Over);
      else
         return Approximate (Context, Target, Under);
      end if;
   end Approximate_To;

   procedure Approximate_To_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : Long_Long_Integer;
      Target_Buffer : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Approximation_Options := Default_Approximation_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Approximate_To (Context, Value, Target, Options);
   begin
      Copy_Text (To_String (Result.Text), Target_Buffer, Written, Status);
   end Approximate_To_Into;

end Humanize.Numbers;
