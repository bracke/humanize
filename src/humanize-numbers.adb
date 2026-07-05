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
      if Value <= 20 then
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
                 or else Locale = "fi" or else Locale = "tr")
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
           (if Locale = "tr" and then Denominator > 2
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
         else
            return "";
         end if;
      end Direct;

      Direct_Text : constant String := Direct;
      Base        : constant String := Locale_Long_Word
        (Locale, Long_Long_Integer (Value));
   begin
      if Locale = "en" then
         return Ordinal_Words_Text (Value);
      elsif Direct_Text'Length > 0 then
         return Direct_Text;
      elsif Base'Length = 0 then
         return Ordinal_Words_Text (Value);
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
         return Base & "inci";
      else
         return Ordinal_Words_Text (Value);
      end if;
   end Locale_Ordinal_Words_Text;

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

   function Noun_Count
     (Count : Natural;
      Noun  : String)
      return String
   is
   begin
      return Cardinal_Text (Count) & " " & Noun
        & (if Count = 1 or else Noun'Length = 0 then "" else "s");
   end Noun_Count;

   function Currency_Words
     (Context       : Humanize.Contexts.Context;
      Amount        : Long_Float;
      Major_Unit    : String;
      Minor_Unit    : String := "cent";
      Fraction_Digits : Natural := 2)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
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
           (if Minor = 0 then Noun_Count (Whole, Major_Unit)
            else Noun_Count (Whole, Major_Unit) & " and "
              & Noun_Count (Minor, Minor_Unit));
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
            & "sv-no-nb-fi-tr signed-cardinal currency percent editorial"),
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
        or else Locale = "tr"
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
      return Ok_Text ("about " & To_String (Base.Text));
   end Approximate_Range;

   function Under_Number
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text ("under " & Plain (Value));
   end Under_Number;

   function Up_To
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text ("up to " & Plain (Value));
   end Up_To;

   function Between
     (Context : Humanize.Contexts.Context;
      Low     : Long_Long_Integer;
      High    : Long_Long_Integer)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;
      return Ok_Text ("between " & Plain (Low) & " and " & Plain (High));
   end Between;

   function Range_Text
     (Low  : Long_Long_Integer;
      High : Long_Long_Integer)
      return String
   is
   begin
      return Plain (Low) & "-" & Plain (High);
   end Range_Text;

   function Qualified_Range
     (Context  : Humanize.Contexts.Context;
      Low      : Long_Long_Integer;
      High     : Long_Long_Integer;
      Boundary : Range_Boundary_Style := Inclusive_Range)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      if High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      case Boundary is
         when Inclusive_Range =>
            return Ok_Text (Plain (Low) & " to " & Plain (High) & " inclusive");
         when Exclusive_Range =>
            return Ok_Text
              ("greater than " & Plain (Low) & " and less than "
               & Plain (High));
         when Include_Low_Only =>
            return Ok_Text
              (Plain (Low) & " or more and less than " & Plain (High));
         when Include_High_Only =>
            return Ok_Text
              ("greater than " & Plain (Low) & " and up to " & Plain (High));
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
      pragma Unreferenced (Context);
   begin
      case Direction is
         when At_Least_Threshold =>
            return Ok_Text ("at least " & Plain (Value));
         when More_Than_Threshold =>
            return Ok_Text ("more than " & Plain (Value));
         when At_Most_Threshold =>
            return Ok_Text ("at most " & Plain (Value));
         when Less_Than_Threshold =>
            return Ok_Text ("less than " & Plain (Value));
         when Exactly_Threshold =>
            return Ok_Text ("exactly " & Plain (Value));
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
      pragma Unreferenced (Context);
      Bounds : constant String := Range_Text (Low, High);
   begin
      if High < Low then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      elsif Contains_Value (Value, Low, High, Boundary) then
         return Ok_Text (Plain (Value) & " is within " & Bounds);
      elsif Value < Low or else (Value = Low and then Boundary in
        Exclusive_Range | Include_High_Only)
      then
         return Ok_Text (Plain (Value) & " is below " & Bounds);
      else
         return Ok_Text (Plain (Value) & " is above " & Bounds);
      end if;
   end Range_Position;

   function Ratio
     (Context : Humanize.Contexts.Context;
      Left    : Natural;
      Right   : Natural)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
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
      pragma Unreferenced (Context);
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
      return Ok_Text (Numerator_Text & " per " & Denominator_Text);
   end Ratio_Per;

   function One_In
     (Context : Humanize.Contexts.Context;
      Denominator : Positive)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text ("1 in " & No_Space (Positive'Image (Denominator)));
   end One_In;

   function Out_Of
     (Context : Humanize.Contexts.Context;
      Count   : Natural;
      Total   : Positive)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
   begin
      return Ok_Text
        (No_Space (Natural'Image (Count)) & " out of "
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
     (Value    : Long_Float;
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
         return Ok_Text ("unchanged");
      end if;

      case Options.Style is
         when Directional_Change =>
            case Direction is
               when Change_Up =>
                  return Ok_Text ("up " & Full_Quantity);
               when Change_Down =>
                  return Ok_Text ("down " & Full_Quantity);
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
                    (Quantity & " more"
                     & (if Tail'Length = 0 then "" else " " & Tail));
               when Change_Down =>
                  return Ok_Text
                    (Quantity & " fewer"
                     & (if Tail'Length = 0 then "" else " " & Tail));
               when Change_None =>
                  return Ok_Text (Full_Quantity);
            end case;
      end case;
   end Compose_Change;

   function Append_Since
     (Base  : Humanize.Status.Text_Result;
      Since : String)
      return Humanize.Status.Text_Result
   is
   begin
      if Base.Status /= Humanize.Status.Ok or else Since'Length = 0 then
         return Base;
      else
         return Ok_Text (To_String (Base.Text) & " since " & Since);
      end if;
   end Append_Since;

   function Change
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Options : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Quantity : constant String := Change_Number_Text (abs Value, Options);
   begin
      return Compose_Change (Value, Quantity, Options);
   end Change;

   function Change_Since
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Since   : String;
      Options : Change_Options := Default_Change_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Append_Since (Change (Context, Value, Options), Since);
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
      return Compose_Change (Value, To_String (Quantity.Text), Options);
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
      pragma Unreferenced (Context);
      Abs_Value : constant Long_Float := abs Value;
      Quantity  : constant String :=
        Change_Number_Text (Abs_Value, Options);
   begin
      return Compose_Change
        (Value, Quantity, Options,
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
      pragma Unreferenced (Context);
      Abs_Value : constant Long_Float := abs Value;
      Quantity  : constant String :=
        Change_Number_Text (Abs_Value, Options);
   begin
      if Singular'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      else
         return Compose_Change
           (Value, Quantity, Options, Unit_Noun (Abs_Value, Singular, Plural));
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
