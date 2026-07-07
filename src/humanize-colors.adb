with Ada.Numerics;
with Ada.Numerics.Long_Elementary_Functions;
with Ada.Characters.Handling;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Decimal_Images;
with Humanize.Messages;

package body Humanize.Colors is
   use type Humanize.Status.Status_Code;

   type Color_Phrase_Key is
     (Phrase_Very_Dark,
      Phrase_Dark,
      Phrase_Medium_Brightness,
      Phrase_Light,
      Phrase_Very_Light,
      Phrase_Neutral,
      Phrase_Red,
      Phrase_Orange,
      Phrase_Yellow,
      Phrase_Green,
      Phrase_Cyan,
      Phrase_Blue,
      Phrase_Purple,
      Phrase_Magenta,
      Phrase_Desaturated,
      Phrase_Muted,
      Phrase_Saturated,
      Phrase_Vivid,
      Phrase_Neutral_Temperature,
      Phrase_Warm,
      Phrase_Cool,
      Phrase_Balanced_Temperature,
      Phrase_Grayish,
      Phrase_Pastel,
      Phrase_Soft,
      Phrase_Moderate_Chroma,
      Phrase_High_Chroma,
      Phrase_Low_Contrast,
      Phrase_Large_Text_Contrast,
      Phrase_Normal_Text_Contrast,
      Phrase_Enhanced_Contrast,
      Phrase_Readable_Enhanced,
      Phrase_Readable_Normal,
      Phrase_Readable_Large_Only,
      Phrase_Low_Readability);

   function Lower (Text : String) return String;
   function Starts_With (Text, Prefix : String) return Boolean;

   function Locale_Stem
     (Context : Humanize.Contexts.Context)
      return String
   is
      Locale : constant String := Lower (Humanize.Contexts.Locale (Context));
   begin
      if Starts_With (Locale, "da") then
         return "da";
      elsif Starts_With (Locale, "de") then
         return "de";
      elsif Starts_With (Locale, "fr") then
         return "fr";
      elsif Starts_With (Locale, "es") then
         return "es";
      elsif Starts_With (Locale, "it") then
         return "it";
      elsif Starts_With (Locale, "pt") then
         return "pt";
      elsif Starts_With (Locale, "nl") then
         return "nl";
      else
         return "en";
      end if;
   end Locale_Stem;

   function Color_Phrase
     (Locale : String;
      Key    : Color_Phrase_Key)
      return String
   is
   begin
      if Locale = "da" then
         case Key is
            when Phrase_Very_Dark => return "meget mork";
            when Phrase_Dark => return "mork";
            when Phrase_Medium_Brightness => return "middel lysstyrke";
            when Phrase_Light => return "lys";
            when Phrase_Very_Light => return "meget lys";
            when Phrase_Neutral => return "neutral";
            when Phrase_Red => return "rod";
            when Phrase_Orange => return "orange";
            when Phrase_Yellow => return "gul";
            when Phrase_Green => return "gron";
            when Phrase_Cyan => return "cyan";
            when Phrase_Blue => return "bla";
            when Phrase_Purple => return "lilla";
            when Phrase_Magenta => return "magenta";
            when Phrase_Desaturated => return "desatureret";
            when Phrase_Muted => return "dampet";
            when Phrase_Saturated => return "mattet";
            when Phrase_Vivid => return "kraftig";
            when Phrase_Neutral_Temperature => return "neutral temperatur";
            when Phrase_Warm => return "varm";
            when Phrase_Cool => return "kolig";
            when Phrase_Balanced_Temperature => return "balanceret temperatur";
            when Phrase_Grayish => return "gralig";
            when Phrase_Pastel => return "pastel";
            when Phrase_Soft => return "blod";
            when Phrase_Moderate_Chroma => return "moderat chroma";
            when Phrase_High_Chroma => return "hoj chroma";
            when Phrase_Low_Contrast => return "lav kontrast";
            when Phrase_Large_Text_Contrast => return "kontrast for stor tekst";
            when Phrase_Normal_Text_Contrast => return "kontrast for normal tekst";
            when Phrase_Enhanced_Contrast => return "forbedret kontrast";
            when Phrase_Readable_Enhanced => return "laesbar for forbedret tekst";
            when Phrase_Readable_Normal => return "laesbar for normal tekst";
            when Phrase_Readable_Large_Only => return "kun laesbar for stor tekst";
            when Phrase_Low_Readability => return "lav laesbarhed";
         end case;
      elsif Locale = "de" then
         case Key is
            when Phrase_Very_Dark => return "sehr dunkel";
            when Phrase_Dark => return "dunkel";
            when Phrase_Medium_Brightness => return "mittlere Helligkeit";
            when Phrase_Light => return "hell";
            when Phrase_Very_Light => return "sehr hell";
            when Phrase_Neutral => return "neutral";
            when Phrase_Red => return "rot";
            when Phrase_Orange => return "orange";
            when Phrase_Yellow => return "gelb";
            when Phrase_Green => return "gruen";
            when Phrase_Cyan => return "cyan";
            when Phrase_Blue => return "blau";
            when Phrase_Purple => return "violett";
            when Phrase_Magenta => return "magenta";
            when Phrase_Desaturated => return "entsaettigt";
            when Phrase_Muted => return "gedaempft";
            when Phrase_Saturated => return "gesaettigt";
            when Phrase_Vivid => return "kraeftig";
            when Phrase_Neutral_Temperature => return "neutrale Temperatur";
            when Phrase_Warm => return "warm";
            when Phrase_Cool => return "kuehl";
            when Phrase_Balanced_Temperature => return "ausgeglichene Temperatur";
            when Phrase_Grayish => return "graeulich";
            when Phrase_Pastel => return "pastell";
            when Phrase_Soft => return "weich";
            when Phrase_Moderate_Chroma => return "mittleres Chroma";
            when Phrase_High_Chroma => return "hohes Chroma";
            when Phrase_Low_Contrast => return "niedriger Kontrast";
            when Phrase_Large_Text_Contrast => return "Kontrast fuer grossen Text";
            when Phrase_Normal_Text_Contrast => return "Kontrast fuer normalen Text";
            when Phrase_Enhanced_Contrast => return "erhoehter Kontrast";
            when Phrase_Readable_Enhanced => return "lesbar fuer erhoehten Text";
            when Phrase_Readable_Normal => return "lesbar fuer normalen Text";
            when Phrase_Readable_Large_Only => return "nur fuer grossen Text lesbar";
            when Phrase_Low_Readability => return "geringe Lesbarkeit";
         end case;
      elsif Locale = "fr" then
         case Key is
            when Phrase_Very_Dark => return "tres sombre";
            when Phrase_Dark => return "sombre";
            when Phrase_Medium_Brightness => return "luminosite moyenne";
            when Phrase_Light => return "clair";
            when Phrase_Very_Light => return "tres clair";
            when Phrase_Neutral => return "neutre";
            when Phrase_Red => return "rouge";
            when Phrase_Orange => return "orange";
            when Phrase_Yellow => return "jaune";
            when Phrase_Green => return "vert";
            when Phrase_Cyan => return "cyan";
            when Phrase_Blue => return "bleu";
            when Phrase_Purple => return "violet";
            when Phrase_Magenta => return "magenta";
            when Phrase_Desaturated => return "desature";
            when Phrase_Muted => return "attenue";
            when Phrase_Saturated => return "sature";
            when Phrase_Vivid => return "vif";
            when Phrase_Neutral_Temperature => return "temperature neutre";
            when Phrase_Warm => return "chaud";
            when Phrase_Cool => return "froid";
            when Phrase_Balanced_Temperature => return "temperature equilibree";
            when Phrase_Grayish => return "grisatre";
            when Phrase_Pastel => return "pastel";
            when Phrase_Soft => return "doux";
            when Phrase_Moderate_Chroma => return "chroma modere";
            when Phrase_High_Chroma => return "chroma eleve";
            when Phrase_Low_Contrast => return "faible contraste";
            when Phrase_Large_Text_Contrast => return "contraste grand texte";
            when Phrase_Normal_Text_Contrast => return "contraste texte normal";
            when Phrase_Enhanced_Contrast => return "contraste renforce";
            when Phrase_Readable_Enhanced => return "lisible pour texte renforce";
            when Phrase_Readable_Normal => return "lisible pour texte normal";
            when Phrase_Readable_Large_Only => return "lisible seulement en grand texte";
            when Phrase_Low_Readability => return "faible lisibilite";
         end case;
      elsif Locale = "es" then
         case Key is
            when Phrase_Very_Dark => return "muy oscuro";
            when Phrase_Dark => return "oscuro";
            when Phrase_Medium_Brightness => return "brillo medio";
            when Phrase_Light => return "claro";
            when Phrase_Very_Light => return "muy claro";
            when Phrase_Neutral => return "neutral";
            when Phrase_Red => return "rojo";
            when Phrase_Orange => return "naranja";
            when Phrase_Yellow => return "amarillo";
            when Phrase_Green => return "verde";
            when Phrase_Cyan => return "cian";
            when Phrase_Blue => return "azul";
            when Phrase_Purple => return "purpura";
            when Phrase_Magenta => return "magenta";
            when Phrase_Desaturated => return "desaturado";
            when Phrase_Muted => return "apagado";
            when Phrase_Saturated => return "saturado";
            when Phrase_Vivid => return "vivo";
            when Phrase_Neutral_Temperature => return "temperatura neutral";
            when Phrase_Warm => return "calido";
            when Phrase_Cool => return "frio";
            when Phrase_Balanced_Temperature => return "temperatura equilibrada";
            when Phrase_Grayish => return "grisaceo";
            when Phrase_Pastel => return "pastel";
            when Phrase_Soft => return "suave";
            when Phrase_Moderate_Chroma => return "croma moderado";
            when Phrase_High_Chroma => return "croma alto";
            when Phrase_Low_Contrast => return "bajo contraste";
            when Phrase_Large_Text_Contrast => return "contraste para texto grande";
            when Phrase_Normal_Text_Contrast => return "contraste para texto normal";
            when Phrase_Enhanced_Contrast => return "contraste mejorado";
            when Phrase_Readable_Enhanced => return "legible para texto mejorado";
            when Phrase_Readable_Normal => return "legible para texto normal";
            when Phrase_Readable_Large_Only => return "legible solo para texto grande";
            when Phrase_Low_Readability => return "baja legibilidad";
         end case;
      elsif Locale = "it" then
         case Key is
            when Phrase_Very_Dark => return "molto scuro";
            when Phrase_Dark => return "scuro";
            when Phrase_Medium_Brightness => return "luminosita media";
            when Phrase_Light => return "chiaro";
            when Phrase_Very_Light => return "molto chiaro";
            when Phrase_Neutral => return "neutro";
            when Phrase_Red => return "rosso";
            when Phrase_Orange => return "arancione";
            when Phrase_Yellow => return "giallo";
            when Phrase_Green => return "verde";
            when Phrase_Cyan => return "ciano";
            when Phrase_Blue => return "blu";
            when Phrase_Purple => return "viola";
            when Phrase_Magenta => return "magenta";
            when Phrase_Desaturated => return "desaturato";
            when Phrase_Muted => return "smorzato";
            when Phrase_Saturated => return "saturo";
            when Phrase_Vivid => return "vivido";
            when Phrase_Neutral_Temperature => return "temperatura neutra";
            when Phrase_Warm => return "caldo";
            when Phrase_Cool => return "freddo";
            when Phrase_Balanced_Temperature => return "temperatura bilanciata";
            when Phrase_Grayish => return "grigiastro";
            when Phrase_Pastel => return "pastello";
            when Phrase_Soft => return "morbido";
            when Phrase_Moderate_Chroma => return "croma moderato";
            when Phrase_High_Chroma => return "croma alto";
            when Phrase_Low_Contrast => return "basso contrasto";
            when Phrase_Large_Text_Contrast => return "contrasto per testo grande";
            when Phrase_Normal_Text_Contrast => return "contrasto per testo normale";
            when Phrase_Enhanced_Contrast => return "contrasto avanzato";
            when Phrase_Readable_Enhanced => return "leggibile per testo avanzato";
            when Phrase_Readable_Normal => return "leggibile per testo normale";
            when Phrase_Readable_Large_Only => return "leggibile solo per testo grande";
            when Phrase_Low_Readability => return "bassa leggibilita";
         end case;
      elsif Locale = "pt" then
         case Key is
            when Phrase_Very_Dark => return "muito escuro";
            when Phrase_Dark => return "escuro";
            when Phrase_Medium_Brightness => return "brilho medio";
            when Phrase_Light => return "claro";
            when Phrase_Very_Light => return "muito claro";
            when Phrase_Neutral => return "neutro";
            when Phrase_Red => return "vermelho";
            when Phrase_Orange => return "laranja";
            when Phrase_Yellow => return "amarelo";
            when Phrase_Green => return "verde";
            when Phrase_Cyan => return "ciano";
            when Phrase_Blue => return "azul";
            when Phrase_Purple => return "roxo";
            when Phrase_Magenta => return "magenta";
            when Phrase_Desaturated => return "dessaturado";
            when Phrase_Muted => return "suave";
            when Phrase_Saturated => return "saturado";
            when Phrase_Vivid => return "vivo";
            when Phrase_Neutral_Temperature => return "temperatura neutra";
            when Phrase_Warm => return "quente";
            when Phrase_Cool => return "frio";
            when Phrase_Balanced_Temperature => return "temperatura equilibrada";
            when Phrase_Grayish => return "acinzentado";
            when Phrase_Pastel => return "pastel";
            when Phrase_Soft => return "macio";
            when Phrase_Moderate_Chroma => return "croma moderado";
            when Phrase_High_Chroma => return "croma alto";
            when Phrase_Low_Contrast => return "baixo contraste";
            when Phrase_Large_Text_Contrast => return "contraste para texto grande";
            when Phrase_Normal_Text_Contrast => return "contraste para texto normal";
            when Phrase_Enhanced_Contrast => return "contraste aprimorado";
            when Phrase_Readable_Enhanced => return "legivel para texto aprimorado";
            when Phrase_Readable_Normal => return "legivel para texto normal";
            when Phrase_Readable_Large_Only => return "legivel apenas para texto grande";
            when Phrase_Low_Readability => return "baixa legibilidade";
         end case;
      elsif Locale = "nl" then
         case Key is
            when Phrase_Very_Dark => return "zeer donker";
            when Phrase_Dark => return "donker";
            when Phrase_Medium_Brightness => return "gemiddelde helderheid";
            when Phrase_Light => return "licht";
            when Phrase_Very_Light => return "zeer licht";
            when Phrase_Neutral => return "neutraal";
            when Phrase_Red => return "rood";
            when Phrase_Orange => return "oranje";
            when Phrase_Yellow => return "geel";
            when Phrase_Green => return "groen";
            when Phrase_Cyan => return "cyaan";
            when Phrase_Blue => return "blauw";
            when Phrase_Purple => return "paars";
            when Phrase_Magenta => return "magenta";
            when Phrase_Desaturated => return "onverzadigd";
            when Phrase_Muted => return "gedempt";
            when Phrase_Saturated => return "verzadigd";
            when Phrase_Vivid => return "levendig";
            when Phrase_Neutral_Temperature => return "neutrale temperatuur";
            when Phrase_Warm => return "warm";
            when Phrase_Cool => return "koel";
            when Phrase_Balanced_Temperature => return "gebalanceerde temperatuur";
            when Phrase_Grayish => return "grijzig";
            when Phrase_Pastel => return "pastel";
            when Phrase_Soft => return "zacht";
            when Phrase_Moderate_Chroma => return "matige chroma";
            when Phrase_High_Chroma => return "hoge chroma";
            when Phrase_Low_Contrast => return "laag contrast";
            when Phrase_Large_Text_Contrast => return "contrast voor grote tekst";
            when Phrase_Normal_Text_Contrast => return "contrast voor normale tekst";
            when Phrase_Enhanced_Contrast => return "verhoogd contrast";
            when Phrase_Readable_Enhanced => return "leesbaar voor verhoogde tekst";
            when Phrase_Readable_Normal => return "leesbaar voor normale tekst";
            when Phrase_Readable_Large_Only => return "alleen leesbaar voor grote tekst";
            when Phrase_Low_Readability => return "lage leesbaarheid";
         end case;
      else
         case Key is
            when Phrase_Very_Dark => return "very dark";
            when Phrase_Dark => return "dark";
            when Phrase_Medium_Brightness => return "medium brightness";
            when Phrase_Light => return "light";
            when Phrase_Very_Light => return "very light";
            when Phrase_Neutral => return "neutral";
            when Phrase_Red => return "red";
            when Phrase_Orange => return "orange";
            when Phrase_Yellow => return "yellow";
            when Phrase_Green => return "green";
            when Phrase_Cyan => return "cyan";
            when Phrase_Blue => return "blue";
            when Phrase_Purple => return "purple";
            when Phrase_Magenta => return "magenta";
            when Phrase_Desaturated => return "desaturated";
            when Phrase_Muted => return "muted";
            when Phrase_Saturated => return "saturated";
            when Phrase_Vivid => return "vivid";
            when Phrase_Neutral_Temperature => return "neutral temperature";
            when Phrase_Warm => return "warm";
            when Phrase_Cool => return "cool";
            when Phrase_Balanced_Temperature => return "balanced temperature";
            when Phrase_Grayish => return "grayish";
            when Phrase_Pastel => return "pastel";
            when Phrase_Soft => return "soft";
            when Phrase_Moderate_Chroma => return "moderate chroma";
            when Phrase_High_Chroma => return "high chroma";
            when Phrase_Low_Contrast => return "low contrast";
            when Phrase_Large_Text_Contrast => return "large-text contrast";
            when Phrase_Normal_Text_Contrast => return "normal-text contrast";
            when Phrase_Enhanced_Contrast => return "enhanced contrast";
            when Phrase_Readable_Enhanced => return "readable for enhanced text";
            when Phrase_Readable_Normal => return "readable for normal text";
            when Phrase_Readable_Large_Only => return "readable for large text only";
            when Phrase_Low_Readability => return "low readability";
         end case;
      end if;
   end Color_Phrase;

   function Color_Phrase
     (Context : Humanize.Contexts.Context;
      Key     : Color_Phrase_Key)
      return String is
     (Color_Phrase (Locale_Stem (Context), Key));

   function Ok_Text (Text : String) return Humanize.Status.Text_Result is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String (Text),
         Key    => Humanize.Messages.No_Message);
   end Ok_Text;

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

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Copy_Result;

   function Natural_Text (Value : Natural) return String is
      Image : constant String := Natural'Image (Value);
   begin
      return Image (Image'First + 1 .. Image'Last);
   end Natural_Text;

   function Lower (Text : String) return String is
   begin
      return Ada.Characters.Handling.To_Lower (Text);
   end Lower;

   function Trim (Text : String) return String is
      First : Natural := Text'First;
      Last  : Natural := Text'Last;
   begin
      if Text'Length = 0 then
         return "";
      end if;
      while First <= Text'Last and then Text (First) = ' ' loop
         First := First + 1;
      end loop;
      while Last >= First and then Text (Last) = ' ' loop
         Last := Last - 1;
      end loop;
      if First > Last then
         return "";
      else
         return Text (First .. Last);
      end if;
   end Trim;

   function Starts_With (Text, Prefix : String) return Boolean is
     (Text'Length >= Prefix'Length
      and then Text (Text'First .. Text'First + Prefix'Length - 1) = Prefix);

   function Ends_With (Text, Suffix : String) return Boolean is
     (Text'Length >= Suffix'Length
      and then Text (Text'Last - Suffix'Length + 1 .. Text'Last) = Suffix);

   function Is_Space (Ch : Character) return Boolean is
     (Ch = ' ' or else Ch = Character'Val (9)
      or else Ch = Character'Val (10) or else Ch = Character'Val (13));

   function Clamp01 (Value : Long_Float) return Long_Float is
   begin
      if Value < 0.0 then
         return 0.0;
      elsif Value > 1.0 then
         return 1.0;
      else
         return Value;
      end if;
   end Clamp01;

   function Channel_From_Float (Value : Long_Float) return Color_Channel is
      Rounded : constant Integer := Integer (Long_Float'Floor (Value + 0.5));
   begin
      if Rounded < 0 then
         return 0;
      elsif Rounded > 255 then
         return 255;
      else
         return Color_Channel (Rounded);
      end if;
   end Channel_From_Float;

   function Channel_From_Linear (Value : Long_Float) return Color_Channel is
      use Ada.Numerics.Long_Elementary_Functions;
      V : constant Long_Float := Clamp01 (Value);
      S : Long_Float;
   begin
      if V <= 0.0031308 then
         S := 12.92 * V;
      else
         S := 1.055 * ("**" (V, 1.0 / 2.4)) - 0.055;
      end if;
      return Channel_From_Float (S * 255.0);
   end Channel_From_Linear;

   function Linear_From_SRGB_Component (Value : Long_Float) return Long_Float is
      use Ada.Numerics.Long_Elementary_Functions;
      V : constant Long_Float := Clamp01 (Value);
   begin
      if V <= 0.04045 then
         return V / 12.92;
      else
         return "**" ((V + 0.055) / 1.055, 2.4);
      end if;
   end Linear_From_SRGB_Component;

   function Linear_From_Rec2020_Component (Value : Long_Float) return Long_Float is
      use Ada.Numerics.Long_Elementary_Functions;
      V : constant Long_Float := Clamp01 (Value);
      Alpha : constant Long_Float := 1.09929682680944;
      Beta  : constant Long_Float := 0.018053968510807;
   begin
      if V < 4.5 * Beta then
         return V / 4.5;
      else
         return "**" ((V + Alpha - 1.0) / Alpha, 1.0 / 0.45);
      end if;
   end Linear_From_Rec2020_Component;

   function Float_Text
     (Value  : Long_Float;
      Places : Natural)
      return String
   is
   begin
      return Humanize.Decimal_Images.Decimal_Image (Value, Places, True);
   end Float_Text;

   function Hex_Digit
     (Value     : Natural;
      Lowercase : Boolean)
      return Character
   is
      Hex_Chars : constant String :=
        (if Lowercase then "0123456789abcdef" else "0123456789ABCDEF");
   begin
      return Hex_Chars (Hex_Chars'First + Value);
   end Hex_Digit;

   function Hex_Value (Ch : Character; Valid : out Boolean) return Natural is
   begin
      if Ch in '0' .. '9' then
         Valid := True;
         return Character'Pos (Ch) - Character'Pos ('0');
      elsif Ch in 'A' .. 'F' then
         Valid := True;
         return 10 + Character'Pos (Ch) - Character'Pos ('A');
      elsif Ch in 'a' .. 'f' then
         Valid := True;
         return 10 + Character'Pos (Ch) - Character'Pos ('a');
      else
         Valid := False;
         return 0;
      end if;
   end Hex_Value;

   function Parse_Hex_Color
     (Text  : String;
      Color : out RGB_Color)
      return Humanize.Status.Status_Code
   is
      First : Natural := Text'First;
      Last  : constant Natural := Text'Last;
      V1    : Natural;
      Valid : Boolean;

      function Pair (Index : Natural) return Natural is
         High : Natural;
         Low  : Natural;
      begin
         High := Hex_Value (Text (Index), Valid);
         if not Valid then
            return 256;
         end if;
         Low := Hex_Value (Text (Index + 1), Valid);
         if not Valid then
            return 256;
         end if;
         return High * 16 + Low;
      end Pair;
   begin
      Color := (others => 0);
      if Text'Length = 0 then
         return Humanize.Status.Invalid_Value;
      elsif Text (First) = '#' then
         First := First + 1;
      end if;

      if First > Last then
         return Humanize.Status.Invalid_Value;
      elsif Last - First + 1 = 3 then
         V1 := Hex_Value (Text (First), Valid);
         if not Valid then
            return Humanize.Status.Invalid_Value;
         end if;
         Color.Red := V1 * 17;
         V1 := Hex_Value (Text (First + 1), Valid);
         if not Valid then
            return Humanize.Status.Invalid_Value;
         end if;
         Color.Green := V1 * 17;
         V1 := Hex_Value (Text (First + 2), Valid);
         if not Valid then
            return Humanize.Status.Invalid_Value;
         end if;
         Color.Blue := V1 * 17;
         return Humanize.Status.Ok;
      elsif Last - First + 1 = 6 then
         V1 := Pair (First);
         declare
            V2 : constant Natural := Pair (First + 2);
            V3 : constant Natural := Pair (First + 4);
         begin
            if V1 > 255 or else V2 > 255 or else V3 > 255 then
               return Humanize.Status.Invalid_Value;
            end if;
            Color.Red := V1;
            Color.Green := V2;
            Color.Blue := V3;
            return Humanize.Status.Ok;
         end;
      else
         return Humanize.Status.Invalid_Value;
      end if;
   end Parse_Hex_Color;

   function Parse_CSS_Hex_Color
     (Text  : String;
      Color : out CSS_Color)
      return Boolean
   is
      Item  : constant String := Trim (Text);
      First : Natural := Item'First;
      Last  : constant Natural := Item'Last;
      Valid : Boolean;

      function Digit (Index : Natural) return Natural is
      begin
         return Hex_Value (Item (Index), Valid);
      end Digit;

      function Pair (Index : Natural) return Natural is
         High : Natural;
         Low  : Natural;
      begin
         High := Hex_Value (Item (Index), Valid);
         if not Valid then
            return 256;
         end if;
         Low := Hex_Value (Item (Index + 1), Valid);
         if not Valid then
            return 256;
         end if;
         return High * 16 + Low;
      end Pair;

      R : Natural := 0;
      G : Natural := 0;
      B : Natural := 0;
      A : Natural := 255;
   begin
      Color := (others => <>);
      if Item'Length = 0 then
         return False;
      elsif Item (First) = '#' then
         First := First + 1;
      end if;

      if First > Last then
         return False;
      end if;

      case Last - First + 1 is
         when 3 | 4 =>
            R := Digit (First);
            if not Valid then
               return False;
            end if;
            G := Digit (First + 1);
            if not Valid then
               return False;
            end if;
            B := Digit (First + 2);
            if not Valid then
               return False;
            end if;
            if Last - First + 1 = 4 then
               A := Digit (First + 3);
               if not Valid then
                  return False;
               end if;
            end if;
            R := R * 17;
            G := G * 17;
            B := B * 17;
            A := A * 17;
         when 6 | 8 =>
            R := Pair (First);
            G := Pair (First + 2);
            B := Pair (First + 4);
            if Last - First + 1 = 8 then
               A := Pair (First + 6);
            end if;
            if R > 255 or else G > 255 or else B > 255 or else A > 255 then
               return False;
            end if;
         when others =>
            return False;
      end case;

      Color :=
        (Color       =>
         (Red => R, Green => G, Blue => B),
         Opacity     => Long_Float (A) / 255.0,
         Has_Opacity => A /= 255,
         Is_Current  => False);
      return True;
   end Parse_CSS_Hex_Color;

   type Named_Color is record
      Name  : access constant String;
      Color : RGB_Color;
   end record;

   Black_Name   : aliased constant String := "black";
   Silver_Name  : aliased constant String := "silver";
   Gray_Name    : aliased constant String := "gray";
   White_Name   : aliased constant String := "white";
   Maroon_Name  : aliased constant String := "maroon";
   Red_Name     : aliased constant String := "red";
   Purple_Name  : aliased constant String := "purple";
   Fuchsia_Name : aliased constant String := "fuchsia";
   Green_Name   : aliased constant String := "green";
   Lime_Name    : aliased constant String := "lime";
   Olive_Name   : aliased constant String := "olive";
   Yellow_Name  : aliased constant String := "yellow";
   Navy_Name    : aliased constant String := "navy";
   Blue_Name    : aliased constant String := "blue";
   Teal_Name    : aliased constant String := "teal";
   Aqua_Name    : aliased constant String := "aqua";
   Orange_Name  : aliased constant String := "orange";
   Rebecca_Name : aliased constant String := "rebeccapurple";

   Basic_Named_Colors : constant array (Positive range <>) of Named_Color :=
     [(Black_Name'Access,   (0, 0, 0)),
      (Silver_Name'Access,  (192, 192, 192)),
      (Gray_Name'Access,    (128, 128, 128)),
      (White_Name'Access,   (255, 255, 255)),
      (Maroon_Name'Access,  (128, 0, 0)),
      (Red_Name'Access,     (255, 0, 0)),
      (Purple_Name'Access,  (128, 0, 128)),
      (Fuchsia_Name'Access, (255, 0, 255)),
      (Green_Name'Access,   (0, 128, 0)),
      (Lime_Name'Access,    (0, 255, 0)),
      (Olive_Name'Access,   (128, 128, 0)),
      (Yellow_Name'Access,  (255, 255, 0)),
      (Navy_Name'Access,    (0, 0, 128)),
      (Blue_Name'Access,    (0, 0, 255)),
      (Teal_Name'Access,    (0, 128, 128)),
      (Aqua_Name'Access,    (0, 255, 255)),
      (Orange_Name'Access,  (255, 165, 0)),
      (Rebecca_Name'Access, (102, 51, 153))];

   type Extended_Named_Color is record
      Name  : Unbounded_String;
      Color : RGB_Color;
   end record;

   CSS_Named_Colors : constant array (Positive range <>) of Extended_Named_Color :=
     [(To_Unbounded_String ("aliceblue"), (240, 248, 255)),
      (To_Unbounded_String ("antiquewhite"), (250, 235, 215)),
      (To_Unbounded_String ("aqua"), (0, 255, 255)),
      (To_Unbounded_String ("aquamarine"), (127, 255, 212)),
      (To_Unbounded_String ("azure"), (240, 255, 255)),
      (To_Unbounded_String ("beige"), (245, 245, 220)),
      (To_Unbounded_String ("bisque"), (255, 228, 196)),
      (To_Unbounded_String ("black"), (0, 0, 0)),
      (To_Unbounded_String ("blanchedalmond"), (255, 235, 205)),
      (To_Unbounded_String ("blue"), (0, 0, 255)),
      (To_Unbounded_String ("blueviolet"), (138, 43, 226)),
      (To_Unbounded_String ("brown"), (165, 42, 42)),
      (To_Unbounded_String ("burlywood"), (222, 184, 135)),
      (To_Unbounded_String ("cadetblue"), (95, 158, 160)),
      (To_Unbounded_String ("chartreuse"), (127, 255, 0)),
      (To_Unbounded_String ("chocolate"), (210, 105, 30)),
      (To_Unbounded_String ("coral"), (255, 127, 80)),
      (To_Unbounded_String ("cornflowerblue"), (100, 149, 237)),
      (To_Unbounded_String ("cornsilk"), (255, 248, 220)),
      (To_Unbounded_String ("crimson"), (220, 20, 60)),
      (To_Unbounded_String ("cyan"), (0, 255, 255)),
      (To_Unbounded_String ("darkblue"), (0, 0, 139)),
      (To_Unbounded_String ("darkcyan"), (0, 139, 139)),
      (To_Unbounded_String ("darkgoldenrod"), (184, 134, 11)),
      (To_Unbounded_String ("darkgray"), (169, 169, 169)),
      (To_Unbounded_String ("darkgreen"), (0, 100, 0)),
      (To_Unbounded_String ("darkgrey"), (169, 169, 169)),
      (To_Unbounded_String ("darkkhaki"), (189, 183, 107)),
      (To_Unbounded_String ("darkmagenta"), (139, 0, 139)),
      (To_Unbounded_String ("darkolivegreen"), (85, 107, 47)),
      (To_Unbounded_String ("darkorange"), (255, 140, 0)),
      (To_Unbounded_String ("darkorchid"), (153, 50, 204)),
      (To_Unbounded_String ("darkred"), (139, 0, 0)),
      (To_Unbounded_String ("darksalmon"), (233, 150, 122)),
      (To_Unbounded_String ("darkseagreen"), (143, 188, 143)),
      (To_Unbounded_String ("darkslateblue"), (72, 61, 139)),
      (To_Unbounded_String ("darkslategray"), (47, 79, 79)),
      (To_Unbounded_String ("darkslategrey"), (47, 79, 79)),
      (To_Unbounded_String ("darkturquoise"), (0, 206, 209)),
      (To_Unbounded_String ("darkviolet"), (148, 0, 211)),
      (To_Unbounded_String ("deeppink"), (255, 20, 147)),
      (To_Unbounded_String ("deepskyblue"), (0, 191, 255)),
      (To_Unbounded_String ("dimgray"), (105, 105, 105)),
      (To_Unbounded_String ("dimgrey"), (105, 105, 105)),
      (To_Unbounded_String ("dodgerblue"), (30, 144, 255)),
      (To_Unbounded_String ("firebrick"), (178, 34, 34)),
      (To_Unbounded_String ("floralwhite"), (255, 250, 240)),
      (To_Unbounded_String ("forestgreen"), (34, 139, 34)),
      (To_Unbounded_String ("fuchsia"), (255, 0, 255)),
      (To_Unbounded_String ("gainsboro"), (220, 220, 220)),
      (To_Unbounded_String ("ghostwhite"), (248, 248, 255)),
      (To_Unbounded_String ("gold"), (255, 215, 0)),
      (To_Unbounded_String ("goldenrod"), (218, 165, 32)),
      (To_Unbounded_String ("gray"), (128, 128, 128)),
      (To_Unbounded_String ("green"), (0, 128, 0)),
      (To_Unbounded_String ("greenyellow"), (173, 255, 47)),
      (To_Unbounded_String ("grey"), (128, 128, 128)),
      (To_Unbounded_String ("honeydew"), (240, 255, 240)),
      (To_Unbounded_String ("hotpink"), (255, 105, 180)),
      (To_Unbounded_String ("indianred"), (205, 92, 92)),
      (To_Unbounded_String ("indigo"), (75, 0, 130)),
      (To_Unbounded_String ("ivory"), (255, 255, 240)),
      (To_Unbounded_String ("khaki"), (240, 230, 140)),
      (To_Unbounded_String ("lavender"), (230, 230, 250)),
      (To_Unbounded_String ("lavenderblush"), (255, 240, 245)),
      (To_Unbounded_String ("lawngreen"), (124, 252, 0)),
      (To_Unbounded_String ("lemonchiffon"), (255, 250, 205)),
      (To_Unbounded_String ("lightblue"), (173, 216, 230)),
      (To_Unbounded_String ("lightcoral"), (240, 128, 128)),
      (To_Unbounded_String ("lightcyan"), (224, 255, 255)),
      (To_Unbounded_String ("lightgoldenrodyellow"), (250, 250, 210)),
      (To_Unbounded_String ("lightgray"), (211, 211, 211)),
      (To_Unbounded_String ("lightgreen"), (144, 238, 144)),
      (To_Unbounded_String ("lightgrey"), (211, 211, 211)),
      (To_Unbounded_String ("lightpink"), (255, 182, 193)),
      (To_Unbounded_String ("lightsalmon"), (255, 160, 122)),
      (To_Unbounded_String ("lightseagreen"), (32, 178, 170)),
      (To_Unbounded_String ("lightskyblue"), (135, 206, 250)),
      (To_Unbounded_String ("lightslategray"), (119, 136, 153)),
      (To_Unbounded_String ("lightslategrey"), (119, 136, 153)),
      (To_Unbounded_String ("lightsteelblue"), (176, 196, 222)),
      (To_Unbounded_String ("lightyellow"), (255, 255, 224)),
      (To_Unbounded_String ("lime"), (0, 255, 0)),
      (To_Unbounded_String ("limegreen"), (50, 205, 50)),
      (To_Unbounded_String ("linen"), (250, 240, 230)),
      (To_Unbounded_String ("magenta"), (255, 0, 255)),
      (To_Unbounded_String ("maroon"), (128, 0, 0)),
      (To_Unbounded_String ("mediumaquamarine"), (102, 205, 170)),
      (To_Unbounded_String ("mediumblue"), (0, 0, 205)),
      (To_Unbounded_String ("mediumorchid"), (186, 85, 211)),
      (To_Unbounded_String ("mediumpurple"), (147, 112, 219)),
      (To_Unbounded_String ("mediumseagreen"), (60, 179, 113)),
      (To_Unbounded_String ("mediumslateblue"), (123, 104, 238)),
      (To_Unbounded_String ("mediumspringgreen"), (0, 250, 154)),
      (To_Unbounded_String ("mediumturquoise"), (72, 209, 204)),
      (To_Unbounded_String ("mediumvioletred"), (199, 21, 133)),
      (To_Unbounded_String ("midnightblue"), (25, 25, 112)),
      (To_Unbounded_String ("mintcream"), (245, 255, 250)),
      (To_Unbounded_String ("mistyrose"), (255, 228, 225)),
      (To_Unbounded_String ("moccasin"), (255, 228, 181)),
      (To_Unbounded_String ("navajowhite"), (255, 222, 173)),
      (To_Unbounded_String ("navy"), (0, 0, 128)),
      (To_Unbounded_String ("oldlace"), (253, 245, 230)),
      (To_Unbounded_String ("olive"), (128, 128, 0)),
      (To_Unbounded_String ("olivedrab"), (107, 142, 35)),
      (To_Unbounded_String ("orange"), (255, 165, 0)),
      (To_Unbounded_String ("orangered"), (255, 69, 0)),
      (To_Unbounded_String ("orchid"), (218, 112, 214)),
      (To_Unbounded_String ("palegoldenrod"), (238, 232, 170)),
      (To_Unbounded_String ("palegreen"), (152, 251, 152)),
      (To_Unbounded_String ("paleturquoise"), (175, 238, 238)),
      (To_Unbounded_String ("palevioletred"), (219, 112, 147)),
      (To_Unbounded_String ("papayawhip"), (255, 239, 213)),
      (To_Unbounded_String ("peachpuff"), (255, 218, 185)),
      (To_Unbounded_String ("peru"), (205, 133, 63)),
      (To_Unbounded_String ("pink"), (255, 192, 203)),
      (To_Unbounded_String ("plum"), (221, 160, 221)),
      (To_Unbounded_String ("powderblue"), (176, 224, 230)),
      (To_Unbounded_String ("purple"), (128, 0, 128)),
      (To_Unbounded_String ("rebeccapurple"), (102, 51, 153)),
      (To_Unbounded_String ("red"), (255, 0, 0)),
      (To_Unbounded_String ("rosybrown"), (188, 143, 143)),
      (To_Unbounded_String ("royalblue"), (65, 105, 225)),
      (To_Unbounded_String ("saddlebrown"), (139, 69, 19)),
      (To_Unbounded_String ("salmon"), (250, 128, 114)),
      (To_Unbounded_String ("sandybrown"), (244, 164, 96)),
      (To_Unbounded_String ("seagreen"), (46, 139, 87)),
      (To_Unbounded_String ("seashell"), (255, 245, 238)),
      (To_Unbounded_String ("sienna"), (160, 82, 45)),
      (To_Unbounded_String ("silver"), (192, 192, 192)),
      (To_Unbounded_String ("skyblue"), (135, 206, 235)),
      (To_Unbounded_String ("slateblue"), (106, 90, 205)),
      (To_Unbounded_String ("slategray"), (112, 128, 144)),
      (To_Unbounded_String ("slategrey"), (112, 128, 144)),
      (To_Unbounded_String ("snow"), (255, 250, 250)),
      (To_Unbounded_String ("springgreen"), (0, 255, 127)),
      (To_Unbounded_String ("steelblue"), (70, 130, 180)),
      (To_Unbounded_String ("tan"), (210, 180, 140)),
      (To_Unbounded_String ("teal"), (0, 128, 128)),
      (To_Unbounded_String ("thistle"), (216, 191, 216)),
      (To_Unbounded_String ("tomato"), (255, 99, 71)),
      (To_Unbounded_String ("turquoise"), (64, 224, 208)),
      (To_Unbounded_String ("violet"), (238, 130, 238)),
      (To_Unbounded_String ("wheat"), (245, 222, 179)),
      (To_Unbounded_String ("white"), (255, 255, 255)),
      (To_Unbounded_String ("whitesmoke"), (245, 245, 245)),
      (To_Unbounded_String ("yellow"), (255, 255, 0)),
      (To_Unbounded_String ("yellowgreen"), (154, 205, 50))];

   function Parse_Named_Color
     (Text  : String;
      Color : out RGB_Color)
      return Humanize.Status.Status_Code
   is
      Name : constant String := Lower (Trim (Text));
   begin
      Color := (others => 0);
      if Name = "transparent" then
         return Humanize.Status.Ok;
      end if;

      for Item of CSS_Named_Colors loop
         if Name = To_String (Item.Name) then
            Color := Item.Color;
            return Humanize.Status.Ok;
         end if;
      end loop;

      return Humanize.Status.Invalid_Value;
   end Parse_Named_Color;

   type Token_List is array (Positive range 1 .. 5) of Unbounded_String;

   function Parse_Component_List
     (Text   : String;
      Tokens : out Token_List;
      Count  : out Natural)
      return Boolean
   is
      Start : Natural := Text'First;
      Depth : Natural := 0;
   begin
      Tokens := [others => Null_Unbounded_String];
      Count := 0;

      for Index in Text'Range loop
         if Text (Index) = '(' then
            Depth := Depth + 1;
         elsif Text (Index) = ')' then
            if Depth = 0 then
               return False;
            end if;
            Depth := Depth - 1;
         elsif Text (Index) = ',' and then Depth = 0 then
            if Count = Tokens'Last then
               return False;
            end if;
            Count := Count + 1;
            Tokens (Count) := To_Unbounded_String (Trim (Text (Start .. Index - 1)));
            Start := Index + 1;
         end if;
      end loop;

      if Depth /= 0 then
         return False;
      end if;

      if Count = Tokens'Last then
         return False;
      end if;
      Count := Count + 1;
      Tokens (Count) := To_Unbounded_String (Trim (Text (Start .. Text'Last)));

      for Index in 1 .. Count loop
         if Length (Tokens (Index)) = 0 then
            return False;
         end if;
      end loop;
      return True;
   end Parse_Component_List;

   function Parse_Modern_Component_List
     (Text      : String;
      Tokens    : out Token_List;
      Count     : out Natural;
      Has_Slash : out Boolean)
      return Boolean
   is
      Start      : Natural := Text'First;
      In_Token   : Boolean := False;
      After_Slash : Boolean := False;
      Depth      : Natural := 0;

      procedure Push (Last : Natural; Valid : in out Boolean) is
      begin
         if not Valid then
            return;
         elsif not In_Token then
            return;
         elsif Count = Tokens'Last then
            Valid := False;
            return;
         end if;

         Count := Count + 1;
         Tokens (Count) := To_Unbounded_String (Trim (Text (Start .. Last)));
         In_Token := False;
      end Push;

      Valid : Boolean := True;
   begin
      Tokens := [others => Null_Unbounded_String];
      Count := 0;
      Has_Slash := False;

      if Text'Length = 0 then
         return False;
      end if;

      for Index in Text'Range loop
         if Text (Index) = ',' and then Depth = 0 then
            return False;
         elsif Text (Index) = '(' then
            Depth := Depth + 1;
            if not In_Token then
               Start := Index;
               In_Token := True;
            end if;
         elsif Text (Index) = ')' then
            if Depth = 0 then
               return False;
            end if;
            Depth := Depth - 1;
         elsif Text (Index) = '/' and then Depth = 0 then
            Push (Index - 1, Valid);
            if not Valid or else Has_Slash or else Count not in 3 .. 4 then
               return False;
            end if;
            Has_Slash := True;
            After_Slash := True;
         elsif Is_Space (Text (Index)) and then Depth = 0 then
            Push (Index - 1, Valid);
            if not Valid then
               return False;
            end if;
         else
            if not In_Token then
               if After_Slash and then Count not in 3 .. 4 then
                  return False;
               end if;
               Start := Index;
               In_Token := True;
            end if;
         end if;
      end loop;

      if Depth /= 0 then
         return False;
      end if;

      Push (Text'Last, Valid);
      if not Valid then
         return False;
      end if;

      return Count in 3 .. 5
        and then (not Has_Slash or else Count in 4 .. 5);
   end Parse_Modern_Component_List;

   function Parse_Float (Text : String; Value : out Long_Float) return Boolean is
   begin
      Value := Long_Float'Value (Trim (Text));
      return True;
   exception
      when others =>
         Value := 0.0;
         return False;
   end Parse_Float;

   function Parse_Calc
     (Text         : String;
      Percent_Base : Long_Float;
      Value        : out Long_Float)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Pos  : Natural := Item'First;

      procedure Skip_Spaces is
      begin
         while Pos <= Item'Last and then Is_Space (Item (Pos)) loop
            Pos := Pos + 1;
         end loop;
      end Skip_Spaces;

      function Parse_Expression (Result : out Long_Float) return Boolean;

      function Parse_Number (Result : out Long_Float) return Boolean is
         Start : Natural;
         Raw   : Long_Float;
      begin
         Skip_Spaces;
         Start := Pos;
         if Pos <= Item'Last and then (Item (Pos) = '+' or else Item (Pos) = '-') then
            Pos := Pos + 1;
         end if;
         while Pos <= Item'Last
           and then (Item (Pos) in '0' .. '9' or else Item (Pos) = '.')
         loop
            Pos := Pos + 1;
         end loop;
         if Pos <= Item'Last and then (Item (Pos) = 'e' or else Item (Pos) = 'E') then
            Pos := Pos + 1;
            if Pos <= Item'Last
              and then (Item (Pos) = '+' or else Item (Pos) = '-')
            then
               Pos := Pos + 1;
            end if;
            while Pos <= Item'Last and then Item (Pos) in '0' .. '9' loop
               Pos := Pos + 1;
            end loop;
         end if;
         if Start > Item'Last or else Start = Pos then
            Result := 0.0;
            return False;
         end if;
         if not Parse_Float (Item (Start .. Pos - 1), Raw) then
            Result := 0.0;
            return False;
         end if;
         if Pos <= Item'Last and then Item (Pos) = '%' then
            Result := Raw * Percent_Base / 100.0;
            Pos := Pos + 1;
         else
            Result := Raw;
         end if;
         return True;
      end Parse_Number;

      function Parse_Factor (Result : out Long_Float) return Boolean is
      begin
         Skip_Spaces;
         if Pos <= Item'Last and then Item (Pos) = '(' then
            Pos := Pos + 1;
            if not Parse_Expression (Result) then
               return False;
            end if;
            Skip_Spaces;
            if Pos > Item'Last or else Item (Pos) /= ')' then
               Result := 0.0;
               return False;
            end if;
            Pos := Pos + 1;
            return True;
         else
            return Parse_Number (Result);
         end if;
      end Parse_Factor;

      function Parse_Term (Result : out Long_Float) return Boolean is
         Right : Long_Float;
      begin
         if not Parse_Factor (Result) then
            return False;
         end if;
         loop
            Skip_Spaces;
            exit when Pos > Item'Last or else Item (Pos) not in '*' | '/';
            declare
               Op : constant Character := Item (Pos);
            begin
               Pos := Pos + 1;
               if not Parse_Factor (Right) then
                  return False;
               end if;
               if Op = '*' then
                  Result := Result * Right;
               elsif Right = 0.0 then
                  Result := 0.0;
                  return False;
               else
                  Result := Result / Right;
               end if;
            end;
         end loop;
         return True;
      end Parse_Term;

      function Parse_Expression (Result : out Long_Float) return Boolean is
         Right : Long_Float;
      begin
         if not Parse_Term (Result) then
            return False;
         end if;
         loop
            Skip_Spaces;
            exit when Pos > Item'Last or else Item (Pos) not in '+' | '-';
            declare
               Op : constant Character := Item (Pos);
            begin
               Pos := Pos + 1;
               if not Parse_Term (Right) then
                  return False;
               end if;
               if Op = '+' then
                  Result := Result + Right;
               else
                  Result := Result - Right;
               end if;
            end;
         end loop;
         return True;
      end Parse_Expression;
   begin
      Value := 0.0;
      if not Starts_With (Item, "calc(") or else not Ends_With (Item, ")") then
         return False;
      end if;
      Pos := Item'First + 5;
      if not Parse_Expression (Value) then
         return False;
      end if;
      Skip_Spaces;
      return Pos = Item'Last;
   end Parse_Calc;

   function Parse_RGB_Channel
     (Text  : String;
      Value : out Color_Channel)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Raw  : Long_Float;
   begin
      if Item'Length = 0 then
         Value := 0;
         return False;
      elsif Item = "none" then
         Value := 0;
         return True;
      elsif Starts_With (Item, "calc(") then
         if not Parse_Calc (Item, 255.0, Raw) then
            Value := 0;
            return False;
         end if;
         if Raw < 0.0 or else Raw > 255.0 then
            Value := 0;
            return False;
         end if;
         Value := Channel_From_Float (Raw);
         return True;
      elsif Ends_With (Item, "%") then
         if not Parse_Float (Item (Item'First .. Item'Last - 1), Raw) then
            Value := 0;
            return False;
         end if;
         if Raw < 0.0 or else Raw > 100.0 then
            Value := 0;
            return False;
         end if;
         Value := Channel_From_Float (Raw * 2.55);
         return True;
      else
         if not Parse_Float (Item, Raw) then
            Value := 0;
            return False;
         end if;
         if Raw < 0.0 or else Raw > 255.0 then
            Value := 0;
            return False;
         end if;
         Value := Channel_From_Float (Raw);
         return True;
      end if;
   end Parse_RGB_Channel;

   function Parse_Alpha
     (Text  : String;
      Value : out Long_Float)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Raw  : Long_Float;
   begin
      if Item'Length = 0 then
         Value := 1.0;
         return False;
      elsif Item = "none" then
         Value := 1.0;
         return True;
      elsif Starts_With (Item, "calc(") then
         if not Parse_Calc (Item, 1.0, Raw) or else Raw < 0.0 or else Raw > 1.0 then
            Value := 1.0;
            return False;
         end if;
         Value := Raw;
         return True;
      elsif Ends_With (Item, "%") then
         if not Parse_Float (Item (Item'First .. Item'Last - 1), Raw) then
            Value := 1.0;
            return False;
         end if;
         if Raw < 0.0 or else Raw > 100.0 then
            Value := 1.0;
            return False;
         end if;
         Value := Raw / 100.0;
         return True;
      else
         if not Parse_Float (Item, Raw) or else Raw < 0.0 or else Raw > 1.0 then
            Value := 1.0;
            return False;
         end if;
         Value := Raw;
         return True;
      end if;
   end Parse_Alpha;

   function Parse_Hue
     (Text  : String;
      Value : out Long_Float)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Raw  : Long_Float;
   begin
      if Item = "none" then
         Raw := 0.0;
      elsif Starts_With (Item, "calc(") then
         if not Parse_Calc (Item, 360.0, Raw) then
            Value := 0.0;
            return False;
         end if;
      elsif Ends_With (Item, "deg") then
         if not Parse_Float (Item (Item'First .. Item'Last - 3), Raw) then
            Value := 0.0;
            return False;
         end if;
      elsif Ends_With (Item, "grad") then
         if not Parse_Float (Item (Item'First .. Item'Last - 4), Raw) then
            Value := 0.0;
            return False;
         end if;
         Raw := Raw * 0.9;
      elsif Ends_With (Item, "rad") then
         if not Parse_Float (Item (Item'First .. Item'Last - 3), Raw) then
            Value := 0.0;
            return False;
         end if;
         Raw := Raw * 180.0 / Ada.Numerics.Pi;
      elsif Ends_With (Item, "turn") then
         if not Parse_Float (Item (Item'First .. Item'Last - 4), Raw) then
            Value := 0.0;
            return False;
         end if;
         Raw := Raw * 360.0;
      elsif Parse_Float (Item, Raw) then
         null;
      else
         Value := 0.0;
         return False;
      end if;

      while Raw < 0.0 loop
         Raw := Raw + 360.0;
      end loop;
      while Raw >= 360.0 loop
         Raw := Raw - 360.0;
      end loop;
      Value := Raw;
      return True;
   end Parse_Hue;

   function Parse_Percent_Or_Number
     (Text         : String;
      Percent_Base : Long_Float;
      Value        : out Long_Float)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Raw  : Long_Float;
   begin
      if Item = "none" then
         Value := 0.0;
         return True;
      elsif Starts_With (Item, "calc(") then
         return Parse_Calc (Item, Percent_Base, Value);
      end if;
      if Ends_With (Item, "%") then
         if not Parse_Float (Item (Item'First .. Item'Last - 1), Raw) then
            Value := 0.0;
            return False;
         end if;
         Value := Raw * Percent_Base / 100.0;
         return True;
      elsif Parse_Float (Item, Raw) then
         Value := Raw;
         return True;
      else
         Value := 0.0;
         return False;
      end if;
   end Parse_Percent_Or_Number;

   function Hue_To_RGB
     (P : Long_Float;
      Q : Long_Float;
      T : Long_Float)
      return Long_Float
   is
      Hue : Long_Float := T;
   begin
      if Hue < 0.0 then
         Hue := Hue + 1.0;
      elsif Hue > 1.0 then
         Hue := Hue - 1.0;
      end if;

      if Hue < 1.0 / 6.0 then
         return P + (Q - P) * 6.0 * Hue;
      elsif Hue < 1.0 / 2.0 then
         return Q;
      elsif Hue < 2.0 / 3.0 then
         return P + (Q - P) * (2.0 / 3.0 - Hue) * 6.0;
      else
         return P;
      end if;
   end Hue_To_RGB;

   function HSL_To_RGB
     (Hue        : Long_Float;
      Saturation : Long_Float;
      Lightness  : Long_Float)
      return RGB_Color
   is
      H : Long_Float := Hue;
      S : constant Long_Float := Clamp01 (Saturation);
      L : constant Long_Float := Clamp01 (Lightness);
      Q : Long_Float;
      P : Long_Float;
      R : Long_Float;
      G : Long_Float;
      B : Long_Float;
   begin
      while H < 0.0 loop
         H := H + 360.0;
      end loop;
      while H >= 360.0 loop
         H := H - 360.0;
      end loop;
      H := H / 360.0;

      if S = 0.0 then
         R := L;
         G := L;
         B := L;
      else
         Q := (if L < 0.5 then L * (1.0 + S) else L + S - L * S);
         P := 2.0 * L - Q;
         R := Hue_To_RGB (P, Q, H + 1.0 / 3.0);
         G := Hue_To_RGB (P, Q, H);
         B := Hue_To_RGB (P, Q, H - 1.0 / 3.0);
      end if;

      return
        (Red   => Channel_From_Float (R * 255.0),
         Green => Channel_From_Float (G * 255.0),
         Blue  => Channel_From_Float (B * 255.0));
   end HSL_To_RGB;

   function HWB_To_RGB
     (Hue       : Long_Float;
      Whiteness : Long_Float;
      Blackness : Long_Float)
      return RGB_Color
   is
      W : constant Long_Float := Clamp01 (Whiteness);
      B : constant Long_Float := Clamp01 (Blackness);
      Base : constant RGB_Color := HSL_To_RGB (Hue, 1.0, 0.5);
      Sum : constant Long_Float := W + B;
   begin
      if Sum >= 1.0 then
         declare
            Gray : constant Color_Channel := Channel_From_Float (W / Sum * 255.0);
         begin
            return (Red => Gray, Green => Gray, Blue => Gray);
         end;
      end if;

      return
        (Red   => Channel_From_Float
           ((Long_Float (Base.Red) / 255.0 * (1.0 - W - B) + W) * 255.0),
         Green => Channel_From_Float
           ((Long_Float (Base.Green) / 255.0 * (1.0 - W - B) + W) * 255.0),
         Blue  => Channel_From_Float
           ((Long_Float (Base.Blue) / 255.0 * (1.0 - W - B) + W) * 255.0));
   end HWB_To_RGB;

   function Lab_To_RGB
     (Lightness : Long_Float;
      A         : Long_Float;
      B         : Long_Float)
      return RGB_Color
   is
      use Ada.Numerics.Long_Elementary_Functions;
      Epsilon : constant Long_Float := 216.0 / 24_389.0;
      Kappa   : constant Long_Float := 24_389.0 / 27.0;

      function Pivot (Value : Long_Float) return Long_Float is
      begin
         if Value * Value * Value > Epsilon then
            return Value * Value * Value;
         else
            return (116.0 * Value - 16.0) / Kappa;
         end if;
      end Pivot;

      FY : constant Long_Float := (Lightness + 16.0) / 116.0;
      FX : constant Long_Float := FY + A / 500.0;
      FZ : constant Long_Float := FY - B / 200.0;

      --  CSS Lab/LCH are D50. Convert D50 XYZ to D65 XYZ before sRGB.
      X50 : constant Long_Float := 0.96422 * Pivot (FX);
      Y50 : constant Long_Float := 1.00000 * Pivot (FY);
      Z50 : constant Long_Float := 0.82521 * Pivot (FZ);
      X65 : constant Long_Float :=
        0.9555766 * X50 - 0.0230393 * Y50 + 0.0631636 * Z50;
      Y65 : constant Long_Float :=
       -0.0282895 * X50 + 1.0099416 * Y50 + 0.0210077 * Z50;
      Z65 : constant Long_Float :=
        0.0122982 * X50 - 0.0204830 * Y50 + 1.3299098 * Z50;
      R : constant Long_Float :=
        3.2404542 * X65 - 1.5371385 * Y65 - 0.4985314 * Z65;
      G : constant Long_Float :=
       -0.9692660 * X65 + 1.8760108 * Y65 + 0.0415560 * Z65;
      BL : constant Long_Float :=
        0.0556434 * X65 - 0.2040259 * Y65 + 1.0572252 * Z65;
   begin
      return
        (Red   => Channel_From_Linear (R),
         Green => Channel_From_Linear (G),
         Blue  => Channel_From_Linear (BL));
   end Lab_To_RGB;

   function LCH_To_RGB
     (Lightness : Long_Float;
      Chroma    : Long_Float;
      Hue       : Long_Float)
      return RGB_Color
   is
      use Ada.Numerics.Long_Elementary_Functions;
      Radians : constant Long_Float := Hue * Ada.Numerics.Pi / 180.0;
   begin
      return Lab_To_RGB
        (Lightness,
         Chroma * Cos (Radians),
         Chroma * Sin (Radians));
   end LCH_To_RGB;

   function OKLab_To_RGB
     (Lightness : Long_Float;
      A         : Long_Float;
      B         : Long_Float)
      return RGB_Color
   is
      L1 : constant Long_Float := Lightness + 0.3963377774 * A + 0.2158037573 * B;
      M1 : constant Long_Float := Lightness - 0.1055613458 * A - 0.0638541728 * B;
      S1 : constant Long_Float := Lightness - 0.0894841775 * A - 1.2914855480 * B;
      L  : constant Long_Float := L1 * L1 * L1;
      M  : constant Long_Float := M1 * M1 * M1;
      S  : constant Long_Float := S1 * S1 * S1;
      R  : constant Long_Float := 4.0767416621 * L - 3.3077115913 * M
        + 0.2309699292 * S;
      G  : constant Long_Float := -1.2684380046 * L + 2.6097574011 * M
        - 0.3413193965 * S;
      BL : constant Long_Float := -0.0041960863 * L - 0.7034186147 * M
        + 1.7076147010 * S;
   begin
      return
        (Red   => Channel_From_Linear (R),
         Green => Channel_From_Linear (G),
         Blue  => Channel_From_Linear (BL));
   end OKLab_To_RGB;

   function OKLCH_To_RGB
     (Lightness : Long_Float;
      Chroma    : Long_Float;
      Hue       : Long_Float)
      return RGB_Color
   is
      use Ada.Numerics.Long_Elementary_Functions;
      Radians : constant Long_Float := Hue * Ada.Numerics.Pi / 180.0;
   begin
      return OKLab_To_RGB
        (Lightness,
         Chroma * Cos (Radians),
         Chroma * Sin (Radians));
   end OKLCH_To_RGB;

   function XYZ_D65_To_RGB
     (X : Long_Float;
      Y : Long_Float;
      Z : Long_Float)
      return RGB_Color
   is
      R : constant Long_Float := 3.2404542 * X - 1.5371385 * Y
        - 0.4985314 * Z;
      G : constant Long_Float := -0.9692660 * X + 1.8760108 * Y
        + 0.0415560 * Z;
      B : constant Long_Float := 0.0556434 * X - 0.2040259 * Y
        + 1.0572252 * Z;
   begin
      return
        (Red   => Channel_From_Linear (R),
         Green => Channel_From_Linear (G),
         Blue  => Channel_From_Linear (B));
   end XYZ_D65_To_RGB;

   function XYZ_D50_To_RGB
     (X : Long_Float;
      Y : Long_Float;
      Z : Long_Float)
      return RGB_Color
   is
      X65 : constant Long_Float :=
        0.9555766 * X - 0.0230393 * Y + 0.0631636 * Z;
      Y65 : constant Long_Float :=
       -0.0282895 * X + 1.0099416 * Y + 0.0210077 * Z;
      Z65 : constant Long_Float :=
        0.0122982 * X - 0.0204830 * Y + 1.3299098 * Z;
   begin
      return XYZ_D65_To_RGB (X65, Y65, Z65);
   end XYZ_D50_To_RGB;

   function Display_P3_To_RGB
     (Red   : Long_Float;
      Green : Long_Float;
      Blue  : Long_Float)
      return RGB_Color
   is
      R : constant Long_Float := Linear_From_SRGB_Component (Red);
      G : constant Long_Float := Linear_From_SRGB_Component (Green);
      B : constant Long_Float := Linear_From_SRGB_Component (Blue);
      X : constant Long_Float := 0.4865709486 * R + 0.2656676932 * G
        + 0.1982172852 * B;
      Y : constant Long_Float := 0.2289745641 * R + 0.6917385218 * G
        + 0.0792869141 * B;
      Z : constant Long_Float := 0.0000000000 * R + 0.0451133819 * G
        + 1.0439443689 * B;
   begin
      return XYZ_D65_To_RGB (X, Y, Z);
   end Display_P3_To_RGB;

   function Rec2020_To_RGB
     (Red   : Long_Float;
      Green : Long_Float;
      Blue  : Long_Float)
      return RGB_Color
   is
      R : constant Long_Float := Linear_From_Rec2020_Component (Red);
      G : constant Long_Float := Linear_From_Rec2020_Component (Green);
      B : constant Long_Float := Linear_From_Rec2020_Component (Blue);
      X : constant Long_Float := 0.6369580483 * R + 0.1446169036 * G
        + 0.1688809752 * B;
      Y : constant Long_Float := 0.2627002120 * R + 0.6779980715 * G
        + 0.0593017165 * B;
      Z : constant Long_Float := 0.0000000000 * R + 0.0280726930 * G
        + 1.0609850577 * B;
   begin
      return XYZ_D65_To_RGB (X, Y, Z);
   end Rec2020_To_RGB;

   function Parse_Percent_Unit
     (Text  : String;
      Value : out Long_Float)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Raw  : Long_Float;
   begin
      if Item = "none" then
         Value := 0.0;
         return True;
      elsif Starts_With (Item, "calc(") then
         if not Parse_Calc (Item, 1.0, Raw)
           or else Raw < 0.0
           or else Raw > 1.0
         then
            Value := 0.0;
            return False;
         end if;
         Value := Raw;
         return True;
      elsif not Ends_With (Item, "%")
        or else not Parse_Float (Item (Item'First .. Item'Last - 1), Raw)
        or else Raw < 0.0
        or else Raw > 100.0
      then
         Value := 0.0;
         return False;
      end if;
      Value := Raw / 100.0;
      return True;
   end Parse_Percent_Unit;

   function Parse_Function_Color
     (Text  : String;
      Color : out CSS_Color)
      return Boolean
   is
      Item        : constant String := Lower (Trim (Text));
      Open_Index  : Natural := 0;
      Tokens      : Token_List;
      Count       : Natural;
      Red         : Color_Channel;
      Green       : Color_Channel;
      Blue        : Color_Channel;
      Hue         : Long_Float;
      Saturation  : Long_Float;
      Lightness   : Long_Float;
      Whiteness   : Long_Float;
      Blackness   : Long_Float;
      Chroma      : Long_Float;
      A_Component : Long_Float;
      B_Component : Long_Float;
      C1          : Long_Float;
      C2          : Long_Float;
      C3          : Long_Float;
      Alpha       : Long_Float := 1.0;
      Modern      : Boolean := False;
      Has_Slash   : Boolean := False;
      Has_Comma   : Boolean := False;
   begin
      Color := (others => <>);
      for Index in Item'Range loop
         if Item (Index) = '(' then
            Open_Index := Index;
            exit;
         end if;
      end loop;

      if Open_Index = 0 or else not Ends_With (Item, ")") then
         return False;
      end if;

      declare
         Name : constant String := Item (Item'First .. Open_Index - 1);
         Args : constant String := Item (Open_Index + 1 .. Item'Last - 1);
      begin
         for Ch of Args loop
            if Ch = ',' then
               Has_Comma := True;
               exit;
            end if;
         end loop;
         Modern := not Has_Comma;

         if Modern then
            if not Parse_Modern_Component_List
              (Args, Tokens, Count, Has_Slash)
            then
               return False;
            end if;
         elsif not Parse_Component_List (Args, Tokens, Count) then
            return False;
         end if;

         if Name = "color" then
            if Count /= 4
              and then not (Modern and then Has_Slash and then Count = 5)
            then
               return False;
            elsif not Parse_Percent_Or_Number (To_String (Tokens (2)), 1.0, C1)
              or else not Parse_Percent_Or_Number
                (To_String (Tokens (3)), 1.0, C2)
              or else not Parse_Percent_Or_Number
                (To_String (Tokens (4)), 1.0, C3)
            then
               return False;
            end if;
            if Count = 5
              and then not Parse_Alpha (To_String (Tokens (5)), Alpha)
            then
               return False;
            end if;
            declare
               Profile : constant String := To_String (Tokens (1));
            begin
               if Profile = "srgb" then
                  Color :=
                    (Color       =>
                       (Red   => Channel_From_Float (Clamp01 (C1) * 255.0),
                        Green => Channel_From_Float (Clamp01 (C2) * 255.0),
                        Blue  => Channel_From_Float (Clamp01 (C3) * 255.0)),
                     Opacity     => Alpha,
                     Has_Opacity => Count = 5,
                     Is_Current  => False);
               elsif Profile = "srgb-linear" then
                  Color :=
                    (Color       =>
                       (Red   => Channel_From_Linear (C1),
                        Green => Channel_From_Linear (C2),
                        Blue  => Channel_From_Linear (C3)),
                     Opacity     => Alpha,
                     Has_Opacity => Count = 5,
                     Is_Current  => False);
               elsif Profile = "display-p3" then
                  Color :=
                    (Color       => Display_P3_To_RGB (C1, C2, C3),
                     Opacity     => Alpha,
                     Has_Opacity => Count = 5,
                     Is_Current  => False);
               elsif Profile = "rec2020" then
                  Color :=
                    (Color       => Rec2020_To_RGB (C1, C2, C3),
                     Opacity     => Alpha,
                     Has_Opacity => Count = 5,
                     Is_Current  => False);
               elsif Profile = "xyz" or else Profile = "xyz-d65" then
                  Color :=
                    (Color       => XYZ_D65_To_RGB (C1, C2, C3),
                     Opacity     => Alpha,
                     Has_Opacity => Count = 5,
                     Is_Current  => False);
               elsif Profile = "xyz-d50" then
                  Color :=
                    (Color       => XYZ_D50_To_RGB (C1, C2, C3),
                     Opacity     => Alpha,
                     Has_Opacity => Count = 5,
                     Is_Current  => False);
               else
                  return False;
               end if;
            end;
            return True;
         elsif Name = "rgb" or else Name = "rgba" then
            if Count /= (if Name = "rgb" then 3 else 4)
              and then not (Name = "rgb" and then Modern and then Has_Slash
                            and then Count = 4)
            then
               return False;
            elsif Modern and then Count = 4 and then not Has_Slash then
               return False;
            elsif not Parse_RGB_Channel (To_String (Tokens (1)), Red)
              or else not Parse_RGB_Channel (To_String (Tokens (2)), Green)
              or else not Parse_RGB_Channel (To_String (Tokens (3)), Blue)
            then
               return False;
            end if;
            if (Name = "rgba" or else Count = 4)
              and then not Parse_Alpha (To_String (Tokens (4)), Alpha)
            then
               return False;
            end if;
            Color :=
              (Color       => (Red => Red, Green => Green, Blue => Blue),
               Opacity     => Alpha,
               Has_Opacity => Name = "rgba" or else Count = 4,
               Is_Current  => False);
            return True;
         elsif Name = "hsl" or else Name = "hsla" then
            if Count /= (if Name = "hsl" then 3 else 4)
              and then not (Name = "hsl" and then Modern and then Has_Slash
                            and then Count = 4)
            then
               return False;
            elsif Modern and then Count = 4 and then not Has_Slash then
               return False;
            elsif not Parse_Hue (To_String (Tokens (1)), Hue)
              or else not Parse_Percent_Unit
                (To_String (Tokens (2)), Saturation)
              or else not Parse_Percent_Unit
                (To_String (Tokens (3)), Lightness)
            then
               return False;
            end if;
            if (Name = "hsla" or else Count = 4)
              and then not Parse_Alpha (To_String (Tokens (4)), Alpha)
            then
               return False;
            end if;
            Color :=
              (Color       => HSL_To_RGB (Hue, Saturation, Lightness),
               Opacity     => Alpha,
               Has_Opacity => Name = "hsla" or else Count = 4,
               Is_Current  => False);
            return True;
         elsif Name = "hwb" then
            if Count /= 3
              and then not (Modern and then Has_Slash and then Count = 4)
            then
               return False;
            elsif not Parse_Hue (To_String (Tokens (1)), Hue)
              or else not Parse_Percent_Unit
                (To_String (Tokens (2)), Whiteness)
              or else not Parse_Percent_Unit
                (To_String (Tokens (3)), Blackness)
            then
               return False;
            end if;
            if Count = 4
              and then not Parse_Alpha (To_String (Tokens (4)), Alpha)
            then
               return False;
            end if;
            Color :=
              (Color       => HWB_To_RGB (Hue, Whiteness, Blackness),
               Opacity     => Alpha,
               Has_Opacity => Count = 4,
               Is_Current  => False);
            return True;
         elsif Name = "lab" or else Name = "oklab" then
            if Count /= 3
              and then not (Modern and then Has_Slash and then Count = 4)
            then
               return False;
            elsif not Parse_Percent_Or_Number
                (To_String (Tokens (1)), (if Name = "lab" then 100.0 else 1.0),
                 Lightness)
              or else not Parse_Percent_Or_Number
                (To_String (Tokens (2)), (if Name = "lab" then 125.0 else 0.4),
                 A_Component)
              or else not Parse_Percent_Or_Number
                (To_String (Tokens (3)), (if Name = "lab" then 125.0 else 0.4),
                 B_Component)
            then
               return False;
            end if;
            if Count = 4
              and then not Parse_Alpha (To_String (Tokens (4)), Alpha)
            then
               return False;
            end if;
            Color :=
              (Color       =>
                 (if Name = "lab"
                  then Lab_To_RGB (Lightness, A_Component, B_Component)
                  else OKLab_To_RGB (Lightness, A_Component, B_Component)),
               Opacity     => Alpha,
               Has_Opacity => Count = 4,
               Is_Current  => False);
            return True;
         elsif Name = "lch" or else Name = "oklch" then
            if Count /= 3
              and then not (Modern and then Has_Slash and then Count = 4)
            then
               return False;
            elsif not Parse_Percent_Or_Number
                (To_String (Tokens (1)), (if Name = "lch" then 100.0 else 1.0),
                 Lightness)
              or else not Parse_Percent_Or_Number
                (To_String (Tokens (2)), (if Name = "lch" then 150.0 else 0.4),
                 Chroma)
              or else not Parse_Hue (To_String (Tokens (3)), Hue)
            then
               return False;
            end if;
            if Count = 4
              and then not Parse_Alpha (To_String (Tokens (4)), Alpha)
            then
               return False;
            end if;
            Color :=
              (Color       =>
                 (if Name = "lch"
                  then LCH_To_RGB (Lightness, Chroma, Hue)
                  else OKLCH_To_RGB (Lightness, Chroma, Hue)),
               Opacity     => Alpha,
               Has_Opacity => Count = 4,
               Is_Current  => False);
            return True;
         end if;
      end;

      return False;
   end Parse_Function_Color;

   function Parse_CSS_Color
     (Text  : String;
      Color : out CSS_Color)
      return Humanize.Status.Status_Code
   is
      RGB : RGB_Color;
   begin
      Color := (others => <>);
      if Lower (Trim (Text)) = "currentcolor" then
         Color :=
           (Color       => (others => 0),
            Opacity     => 1.0,
            Has_Opacity => False,
            Is_Current  => True);
         return Humanize.Status.Ok;
      elsif Parse_CSS_Hex_Color (Text, Color) then
         return Humanize.Status.Ok;
      elsif Parse_Named_Color (Text, RGB) = Humanize.Status.Ok then
         Color :=
           (Color       => RGB,
            Opacity     => (if Lower (Trim (Text)) = "transparent" then 0.0 else 1.0),
            Has_Opacity => Lower (Trim (Text)) = "transparent",
            Is_Current  => False);
         return Humanize.Status.Ok;
      elsif Parse_Function_Color (Text, Color) then
         return Humanize.Status.Ok;
      else
         return Humanize.Status.Invalid_Value;
      end if;
   end Parse_CSS_Color;

   function Hex_Channel
     (Channel   : Color_Channel;
      Lowercase : Boolean)
      return String
   is
      Hi : constant Natural := Channel / 16;
      Lo : constant Natural := Channel mod 16;
   begin
      return [1 => Hex_Digit (Hi, Lowercase), 2 => Hex_Digit (Lo, Lowercase)];
   end Hex_Channel;

   function Hex_Color
     (Color     : RGB_Color;
      Prefix    : Boolean := True;
      Lowercase : Boolean := False)
      return Humanize.Status.Text_Result
   is
      P : constant String := (if Prefix then "#" else "");
   begin
      return Ok_Text
        (P & Hex_Channel (Color.Red, Lowercase)
         & Hex_Channel (Color.Green, Lowercase)
         & Hex_Channel (Color.Blue, Lowercase));
   end Hex_Color;

   function Hex_Color
     (Red       : Color_Channel;
      Green     : Color_Channel;
      Blue      : Color_Channel;
      Prefix    : Boolean := True;
      Lowercase : Boolean := False)
      return Humanize.Status.Text_Result
   is
   begin
      return Hex_Color ((Red => Red, Green => Green, Blue => Blue),
                        Prefix, Lowercase);
   end Hex_Color;

   function RGB_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        ("rgb(" & Natural_Text (Color.Red) & ", "
         & Natural_Text (Color.Green) & ", "
         & Natural_Text (Color.Blue) & ")");
   end RGB_Label;

   function RGBA_Label
     (Color   : RGB_Color;
      Opacity : Long_Float)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        ("rgba(" & Natural_Text (Color.Red) & ", "
         & Natural_Text (Color.Green) & ", "
         & Natural_Text (Color.Blue) & ", "
         & Float_Text (Clamp01 (Opacity), 2) & ")");
   end RGBA_Label;

   function CSS_Color_Label
     (Color : CSS_Color)
      return Humanize.Status.Text_Result
   is
   begin
      if Color.Is_Current then
         return Ok_Text ("currentColor");
      elsif Color.Has_Opacity then
         return RGBA_Label (Color.Color, Color.Opacity);
      else
         return RGB_Label (Color.Color);
      end if;
   end CSS_Color_Label;

   function HSL
     (Color : RGB_Color)
      return HSL_Color
   is
      R : constant Long_Float := Long_Float (Color.Red) / 255.0;
      G : constant Long_Float := Long_Float (Color.Green) / 255.0;
      B : constant Long_Float := Long_Float (Color.Blue) / 255.0;
      Max_C : constant Long_Float := Long_Float'Max (R, Long_Float'Max (G, B));
      Min_C : constant Long_Float := Long_Float'Min (R, Long_Float'Min (G, B));
      Diff  : constant Long_Float := Max_C - Min_C;
      Hue   : Long_Float := 0.0;
      Sat   : Long_Float := 0.0;
      Light : constant Long_Float := (Max_C + Min_C) / 2.0;
   begin
      if Diff /= 0.0 then
         Sat := Diff / (1.0 - abs (2.0 * Light - 1.0));
         if Max_C = R then
            Hue := 60.0 * ((G - B) / Diff);
         elsif Max_C = G then
            Hue := 60.0 * (((B - R) / Diff) + 2.0);
         else
            Hue := 60.0 * (((R - G) / Diff) + 4.0);
         end if;
         if Hue < 0.0 then
            Hue := Hue + 360.0;
         end if;
      end if;
      return (Hue => Hue, Saturation => Sat, Lightness => Light);
   end HSL;

   function HSV
     (Color : RGB_Color)
      return HSV_Color
   is
      R : constant Long_Float := Long_Float (Color.Red) / 255.0;
      G : constant Long_Float := Long_Float (Color.Green) / 255.0;
      B : constant Long_Float := Long_Float (Color.Blue) / 255.0;
      Max_C : constant Long_Float := Long_Float'Max (R, Long_Float'Max (G, B));
      Min_C : constant Long_Float := Long_Float'Min (R, Long_Float'Min (G, B));
      Diff  : constant Long_Float := Max_C - Min_C;
      Hue   : Long_Float := 0.0;
      Sat   : constant Long_Float := (if Max_C = 0.0 then 0.0 else Diff / Max_C);
   begin
      if Diff /= 0.0 then
         if Max_C = R then
            Hue := 60.0 * ((G - B) / Diff);
         elsif Max_C = G then
            Hue := 60.0 * (((B - R) / Diff) + 2.0);
         else
            Hue := 60.0 * (((R - G) / Diff) + 4.0);
         end if;
         if Hue < 0.0 then
            Hue := Hue + 360.0;
         end if;
      end if;
      return (Hue => Hue, Saturation => Sat, Value => Max_C);
   end HSV;

   function Round_Percent (Value : Long_Float) return String is
   begin
      return Float_Text (Value * 100.0, 0) & "%";
   end Round_Percent;

   function HSL_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant HSL_Color := HSL (Color);
   begin
      return Ok_Text
        ("hsl(" & Float_Text (Value.Hue, 0) & ", "
         & Round_Percent (Value.Saturation) & ", "
         & Round_Percent (Value.Lightness) & ")");
   end HSL_Label;

   function HSV_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant HSV_Color := HSV (Color);
   begin
      return Ok_Text
        ("hsv(" & Float_Text (Value.Hue, 0) & ", "
         & Round_Percent (Value.Saturation) & ", "
         & Round_Percent (Value.Value) & ")");
   end HSV_Label;

   function Distance_Squared (Left, Right : RGB_Color) return Natural is
      DR : constant Integer := Integer (Left.Red) - Integer (Right.Red);
      DG : constant Integer := Integer (Left.Green) - Integer (Right.Green);
      DB : constant Integer := Integer (Left.Blue) - Integer (Right.Blue);
   begin
      return Natural (DR * DR + DG * DG + DB * DB);
   end Distance_Squared;

   function Nearest_Color_Name
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Best_Index : Positive := Basic_Named_Colors'First;
      Best_Dist  : Natural := Natural'Last;
      Dist       : Natural;
   begin
      for Index in Basic_Named_Colors'Range loop
         Dist := Distance_Squared (Color, Basic_Named_Colors (Index).Color);
         if Dist < Best_Dist then
            Best_Dist := Dist;
            Best_Index := Index;
         end if;
      end loop;
      return Ok_Text (Basic_Named_Colors (Best_Index).Name.all);
   end Nearest_Color_Name;

   function Palette_Summary
     (Colors : Color_List)
      return Humanize.Status.Text_Result
   is
      Avg_R : Natural := 0;
      Avg_G : Natural := 0;
      Avg_B : Natural := 0;
      Min_B : Long_Float := 1.0;
      Max_B : Long_Float := 0.0;
   begin
      if Colors'Length = 0 then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      end if;

      for Color of Colors loop
         Avg_R := Avg_R + Color.Red;
         Avg_G := Avg_G + Color.Green;
         Avg_B := Avg_B + Color.Blue;
         Min_B := Long_Float'Min (Min_B, Brightness (Color));
         Max_B := Long_Float'Max (Max_B, Brightness (Color));
      end loop;

      declare
         Average : constant RGB_Color :=
           (Red   => Avg_R / Colors'Length,
            Green => Avg_G / Colors'Length,
            Blue  => Avg_B / Colors'Length);
         Name : constant String := To_String (Nearest_Color_Name (Average).Text);
         Spread : constant Long_Float := Max_B - Min_B;
         Spread_Label : constant String :=
           (if Spread < 0.20 then "low contrast spread"
            elsif Spread < 0.50 then "moderate contrast spread"
            else "high contrast spread");
      begin
         return Ok_Text
           (Natural_Text (Colors'Length) & " colors, mostly " & Name
            & ", " & Spread_Label);
      end;
   end Palette_Summary;

   function Invalid_Text return Humanize.Status.Text_Result is
   begin
      return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Invalid_Text;

   function Hex_Text (Color : RGB_Color) return String is
   begin
      return To_String (Hex_Color (Color).Text);
   end Hex_Text;

   function Hue_Distance (Left, Right : Long_Float) return Long_Float is
      Diff : Long_Float := abs (Left - Right);
   begin
      if Diff > 180.0 then
         Diff := 360.0 - Diff;
      end if;
      return Diff;
   end Hue_Distance;

   function Palette_Roles
     (Colors : Color_List)
      return Humanize.Status.Text_Result
   is
      Background_Index : Positive := Colors'First;
      Text_Index       : Positive := Colors'First;
      Accent_Index     : Positive := Colors'First;
      Best_Light       : Long_Float := -1.0;
      Best_Dark        : Long_Float := 2.0;
      Best_Accent      : Long_Float := -1.0;
      Bright           : Long_Float;
      Sat              : Long_Float;
      Accent_Score     : Long_Float;
   begin
      if Colors'Length = 0 then
         return Invalid_Text;
      end if;

      for Index in Colors'Range loop
         Bright := Brightness (Colors (Index));
         Sat := HSL (Colors (Index)).Saturation;
         Accent_Score := Sat * 0.70 + abs (Bright - 0.50) * 0.30;
         if Bright > Best_Light then
            Best_Light := Bright;
            Background_Index := Index;
         end if;
         if Bright < Best_Dark then
            Best_Dark := Bright;
            Text_Index := Index;
         end if;
         if Accent_Score > Best_Accent then
            Best_Accent := Accent_Score;
            Accent_Index := Index;
         end if;
      end loop;

      return Ok_Text
        ("background " & Hex_Text (Colors (Background_Index))
         & ", text " & Hex_Text (Colors (Text_Index))
         & ", accent " & Hex_Text (Colors (Accent_Index)));
   end Palette_Roles;

   function Palette_Harmony_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result
   is
      Saturated_Count : Natural := 0;
      Min_Hue         : Long_Float := 360.0;
      Max_Hue         : Long_Float := 0.0;
      Max_Distance    : Long_Float := 0.0;
      Complementary   : Boolean := False;
      Triadic_Pairs   : Natural := 0;
      H1              : HSL_Color;
      H2              : HSL_Color;
      Diff            : Long_Float;
   begin
      if Colors'Length = 0 then
         return Invalid_Text;
      end if;

      for Color of Colors loop
         H1 := HSL (Color);
         if H1.Saturation >= 0.08 then
            Saturated_Count := Saturated_Count + 1;
            Min_Hue := Long_Float'Min (Min_Hue, H1.Hue);
            Max_Hue := Long_Float'Max (Max_Hue, H1.Hue);
         end if;
      end loop;

      if Saturated_Count = 0 then
         return Ok_Text ("neutral palette");
      elsif Saturated_Count = 1 then
         return Ok_Text ("single-accent palette");
      end if;

      for I in Colors'Range loop
         H1 := HSL (Colors (I));
         if H1.Saturation >= 0.08 then
            for J in I + 1 .. Colors'Last loop
               H2 := HSL (Colors (J));
               if H2.Saturation >= 0.08 then
                  Diff := Hue_Distance (H1.Hue, H2.Hue);
                  Max_Distance := Long_Float'Max (Max_Distance, Diff);
                  if Diff >= 150.0 and then Diff <= 210.0 then
                     Complementary := True;
                  elsif Diff >= 95.0 and then Diff <= 145.0 then
                     Triadic_Pairs := Triadic_Pairs + 1;
                  end if;
               end if;
            end loop;
         end if;
      end loop;

      if Max_Distance < 20.0 then
         return Ok_Text ("monochrome palette");
      elsif Triadic_Pairs >= 2 then
         return Ok_Text ("triadic palette");
      elsif Complementary then
         return Ok_Text ("complementary palette");
      elsif Max_Hue - Min_Hue <= 70.0 then
         return Ok_Text ("analogous palette");
      else
         return Ok_Text ("varied palette");
      end if;
   end Palette_Harmony_Label;

   function Palette_Contrast_Suggestion
     (Colors : Color_List)
      return Humanize.Status.Text_Result
   is
      Best_Left  : Positive := Colors'First;
      Best_Right : Positive := Colors'First;
      Best_Ratio : Long_Float := -1.0;
      Ratio      : Long_Float;
   begin
      if Colors'Length < 2 then
         return Invalid_Text;
      end if;

      for I in Colors'Range loop
         for J in I + 1 .. Colors'Last loop
            Ratio := Contrast_Ratio (Colors (I), Colors (J));
            if Ratio > Best_Ratio then
               Best_Ratio := Ratio;
               Best_Left := I;
               Best_Right := J;
            end if;
         end loop;
      end loop;

      return Ok_Text
        ("best contrast " & Hex_Text (Colors (Best_Left)) & " on "
         & Hex_Text (Colors (Best_Right)) & " at "
         & Humanize.Decimal_Images.Decimal_Image (Best_Ratio, 1, True)
         & ":1");
   end Palette_Contrast_Suggestion;

   function Palette_Accessibility_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result
   is
      Normal_Pairs   : Natural := 0;
      Large_Pairs    : Natural := 0;
      Total_Pairs    : Natural := 0;
      Ratio          : Long_Float;
   begin
      if Colors'Length < 2 then
         return Invalid_Text;
      end if;

      for I in Colors'Range loop
         for J in I + 1 .. Colors'Last loop
            Total_Pairs := Total_Pairs + 1;
            Ratio := Contrast_Ratio (Colors (I), Colors (J));
            if Ratio >= 4.5 then
               Normal_Pairs := Normal_Pairs + 1;
            end if;
            if Ratio >= 3.0 then
               Large_Pairs := Large_Pairs + 1;
            end if;
         end loop;
      end loop;

      if Normal_Pairs > 0 then
         return Ok_Text
           (Natural_Text (Normal_Pairs) & " of " & Natural_Text (Total_Pairs)
            & " pairs pass normal text contrast");
      elsif Large_Pairs > 0 then
         return Ok_Text
           (Natural_Text (Large_Pairs) & " of " & Natural_Text (Total_Pairs)
            & " pairs pass large text only");
      else
         return Ok_Text ("no accessible text pairs");
      end if;
   end Palette_Accessibility_Label;

   function Palette_Contrast_Matrix_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result
   is
      Total    : Natural := 0;
      Fail     : Natural := 0;
      Large    : Natural := 0;
      Normal   : Natural := 0;
      Enhanced : Natural := 0;
   begin
      if Colors'Length < 2 then
         return Invalid_Text;
      end if;

      for I in Colors'Range loop
         for J in I + 1 .. Colors'Last loop
            declare
               Level : constant Contrast_Level :=
                 Contrast_Level_For (Contrast_Ratio (Colors (I), Colors (J)));
            begin
               Total := Total + 1;
               case Level is
                  when Contrast_Fail =>
                     Fail := Fail + 1;
                  when Contrast_Large_Text =>
                     Large := Large + 1;
                  when Contrast_Normal_Text =>
                     Normal := Normal + 1;
                  when Contrast_Enhanced_Text =>
                     Enhanced := Enhanced + 1;
               end case;
            end;
         end loop;
      end loop;

      return Ok_Text
        (Natural_Text (Enhanced) & " enhanced, "
         & Natural_Text (Normal) & " normal, "
         & Natural_Text (Large) & " large-only, "
         & Natural_Text (Fail) & " fail out of "
         & Natural_Text (Total) & " pairs");
   end Palette_Contrast_Matrix_Label;

   function Palette_Mood_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result
   is
      Avg_Brightness : Long_Float := 0.0;
      Avg_Saturation : Long_Float := 0.0;
      Warm_Count     : Natural := 0;
      Cool_Count     : Natural := 0;
      H              : HSL_Color;
      Tone           : Unbounded_String;
      Energy         : Unbounded_String;
      Temperature    : Unbounded_String;
   begin
      if Colors'Length = 0 then
         return Invalid_Text;
      end if;

      for Color of Colors loop
         H := HSL (Color);
         Avg_Brightness := Avg_Brightness + Brightness (Color);
         Avg_Saturation := Avg_Saturation + H.Saturation;
         if H.Saturation >= 0.08 then
            if H.Hue < 80.0 or else H.Hue >= 300.0 then
               Warm_Count := Warm_Count + 1;
            elsif H.Hue >= 150.0 and then H.Hue < 285.0 then
               Cool_Count := Cool_Count + 1;
            end if;
         end if;
      end loop;

      Avg_Brightness := Avg_Brightness / Long_Float (Colors'Length);
      Avg_Saturation := Avg_Saturation / Long_Float (Colors'Length);
      Tone := To_Unbounded_String
        (if Avg_Brightness < 0.35 then "dark"
         elsif Avg_Brightness > 0.70 then "light"
         else "balanced");
      Energy := To_Unbounded_String
        (if Avg_Saturation < 0.20 then "subtle"
         elsif Avg_Saturation > 0.65 then "vibrant"
         else "moderate");
      Temperature := To_Unbounded_String
        (if Warm_Count > Cool_Count then "warm"
         elsif Cool_Count > Warm_Count then "cool"
         else "neutral");

      return Ok_Text
        (To_String (Tone) & ", " & To_String (Energy) & ", "
         & To_String (Temperature) & " mood");
   end Palette_Mood_Label;

   function Advanced_Palette_Summary
     (Colors : Color_List)
      return Humanize.Status.Text_Result
   is
      Harmony : constant Humanize.Status.Text_Result :=
        Palette_Harmony_Label (Colors);
      Mood : constant Humanize.Status.Text_Result := Palette_Mood_Label (Colors);
      Accessibility : constant Humanize.Status.Text_Result :=
        Palette_Accessibility_Label (Colors);
      Roles : constant Humanize.Status.Text_Result := Palette_Roles (Colors);
   begin
      if Harmony.Status /= Humanize.Status.Ok then
         return Harmony;
      elsif Mood.Status /= Humanize.Status.Ok then
         return Mood;
      elsif Accessibility.Status /= Humanize.Status.Ok then
         return Accessibility;
      elsif Roles.Status /= Humanize.Status.Ok then
         return Roles;
      end if;

      return Ok_Text
        (To_String (Harmony.Text) & ", " & To_String (Mood.Text) & ", "
         & To_String (Accessibility.Text) & "; " & To_String (Roles.Text));
   end Advanced_Palette_Summary;

   function Color_Summary
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (To_String (Hex_Color (Color).Text) & " "
         & To_String (RGB_Label (Color).Text));
   end Color_Summary;

   function Brightness
     (Color : RGB_Color)
      return Long_Float
   is
   begin
      return
        (0.299 * Long_Float (Color.Red)
         + 0.587 * Long_Float (Color.Green)
         + 0.114 * Long_Float (Color.Blue)) / 255.0;
   end Brightness;

   function Brightness_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant Long_Float := Brightness (Color);
   begin
      if Value < 0.20 then
         return Ok_Text ("very dark");
      elsif Value < 0.40 then
         return Ok_Text ("dark");
      elsif Value < 0.60 then
         return Ok_Text ("medium brightness");
      elsif Value < 0.80 then
         return Ok_Text ("light");
      else
         return Ok_Text ("very light");
      end if;
   end Brightness_Label;

   function Brightness_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant Long_Float := Brightness (Color);
   begin
      if Value < 0.20 then
         return Ok_Text (Color_Phrase (Context, Phrase_Very_Dark));
      elsif Value < 0.40 then
         return Ok_Text (Color_Phrase (Context, Phrase_Dark));
      elsif Value < 0.60 then
         return Ok_Text (Color_Phrase (Context, Phrase_Medium_Brightness));
      elsif Value < 0.80 then
         return Ok_Text (Color_Phrase (Context, Phrase_Light));
      else
         return Ok_Text (Color_Phrase (Context, Phrase_Very_Light));
      end if;
   end Brightness_Label;

   function Linear_RGB_To_XYZ_D65 (Color : RGB_Color) return Lab_Color is
      R : constant Long_Float := Linear_From_SRGB_Component
        (Long_Float (Color.Red) / 255.0);
      G : constant Long_Float := Linear_From_SRGB_Component
        (Long_Float (Color.Green) / 255.0);
      B : constant Long_Float := Linear_From_SRGB_Component
        (Long_Float (Color.Blue) / 255.0);
   begin
      return
        (Lightness => 0.4124564 * R + 0.3575761 * G + 0.1804375 * B,
         A         => 0.2126729 * R + 0.7151522 * G + 0.0721750 * B,
         B         => 0.0193339 * R + 0.1191920 * G + 0.9503041 * B);
   end Linear_RGB_To_XYZ_D65;

   function Lab
     (Color : RGB_Color)
      return Lab_Color
   is
      use Ada.Numerics.Long_Elementary_Functions;
      XYZ65 : constant Lab_Color := Linear_RGB_To_XYZ_D65 (Color);
      X50 : constant Long_Float :=
        1.0478112 * XYZ65.Lightness + 0.0228866 * XYZ65.A
        - 0.0501270 * XYZ65.B;
      Y50 : constant Long_Float :=
        0.0295424 * XYZ65.Lightness + 0.9904844 * XYZ65.A
        - 0.0170491 * XYZ65.B;
      Z50 : constant Long_Float :=
       -0.0092345 * XYZ65.Lightness + 0.0150436 * XYZ65.A
        + 0.7521316 * XYZ65.B;
      XN : constant Long_Float := 0.96422;
      YN : constant Long_Float := 1.0;
      ZN : constant Long_Float := 0.82521;
      Epsilon : constant Long_Float := 216.0 / 24_389.0;
      Kappa   : constant Long_Float := 24_389.0 / 27.0;

      function Pivot (Value : Long_Float) return Long_Float is
      begin
         if Value > Epsilon then
            return "**" (Value, 1.0 / 3.0);
         else
            return (Kappa * Value + 16.0) / 116.0;
         end if;
      end Pivot;

      FX : constant Long_Float := Pivot (X50 / XN);
      FY : constant Long_Float := Pivot (Y50 / YN);
      FZ : constant Long_Float := Pivot (Z50 / ZN);
   begin
      return
        (Lightness => 116.0 * FY - 16.0,
         A         => 500.0 * (FX - FY),
         B         => 200.0 * (FY - FZ));
   end Lab;

   function OKLab
     (Color : RGB_Color)
      return OKLab_Color
   is
      use Ada.Numerics.Long_Elementary_Functions;
      R : constant Long_Float := Linear_From_SRGB_Component
        (Long_Float (Color.Red) / 255.0);
      G : constant Long_Float := Linear_From_SRGB_Component
        (Long_Float (Color.Green) / 255.0);
      B : constant Long_Float := Linear_From_SRGB_Component
        (Long_Float (Color.Blue) / 255.0);
      L : constant Long_Float := 0.4122214708 * R + 0.5363325363 * G
        + 0.0514459929 * B;
      M : constant Long_Float := 0.2119034982 * R + 0.6806995451 * G
        + 0.1073969566 * B;
      S : constant Long_Float := 0.0883024619 * R + 0.2817188376 * G
        + 0.6299787005 * B;
      L1 : constant Long_Float := "**" (L, 1.0 / 3.0);
      M1 : constant Long_Float := "**" (M, 1.0 / 3.0);
      S1 : constant Long_Float := "**" (S, 1.0 / 3.0);
   begin
      return
        (Lightness => 0.2104542553 * L1 + 0.7936177850 * M1
          - 0.0040720468 * S1,
         A         => 1.9779984951 * L1 - 2.4285922050 * M1
          + 0.4505937099 * S1,
         B         => 0.0259040371 * L1 + 0.7827717662 * M1
          - 0.8086757660 * S1);
   end OKLab;

   function Hue_Family_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant HSL_Color := HSL (Color);
      Hue   : constant Long_Float := Value.Hue;
   begin
      if Value.Saturation < 0.08 then
         return Ok_Text ("neutral");
      elsif Hue < 15.0 or else Hue >= 345.0 then
         return Ok_Text ("red");
      elsif Hue < 45.0 then
         return Ok_Text ("orange");
      elsif Hue < 70.0 then
         return Ok_Text ("yellow");
      elsif Hue < 165.0 then
         return Ok_Text ("green");
      elsif Hue < 195.0 then
         return Ok_Text ("cyan");
      elsif Hue < 255.0 then
         return Ok_Text ("blue");
      elsif Hue < 285.0 then
         return Ok_Text ("purple");
      elsif Hue < 345.0 then
         return Ok_Text ("magenta");
      else
         return Ok_Text ("neutral");
      end if;
   end Hue_Family_Label;

   function Hue_Family_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant HSL_Color := HSL (Color);
      Hue   : constant Long_Float := Value.Hue;
      Key   : Color_Phrase_Key;
   begin
      if Value.Saturation < 0.08 then
         Key := Phrase_Neutral;
      elsif Hue < 15.0 or else Hue >= 345.0 then
         Key := Phrase_Red;
      elsif Hue < 45.0 then
         Key := Phrase_Orange;
      elsif Hue < 70.0 then
         Key := Phrase_Yellow;
      elsif Hue < 165.0 then
         Key := Phrase_Green;
      elsif Hue < 195.0 then
         Key := Phrase_Cyan;
      elsif Hue < 255.0 then
         Key := Phrase_Blue;
      elsif Hue < 285.0 then
         Key := Phrase_Purple;
      elsif Hue < 345.0 then
         Key := Phrase_Magenta;
      else
         Key := Phrase_Neutral;
      end if;
      return Ok_Text (Color_Phrase (Context, Key));
   end Hue_Family_Label;

   function Saturation_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant Long_Float := HSL (Color).Saturation;
   begin
      if Value < 0.08 then
         return Ok_Text ("neutral");
      elsif Value < 0.25 then
         return Ok_Text ("desaturated");
      elsif Value < 0.50 then
         return Ok_Text ("muted");
      elsif Value < 0.75 then
         return Ok_Text ("saturated");
      else
         return Ok_Text ("vivid");
      end if;
   end Saturation_Label;

   function Saturation_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant Long_Float := HSL (Color).Saturation;
   begin
      if Value < 0.08 then
         return Ok_Text (Color_Phrase (Context, Phrase_Neutral));
      elsif Value < 0.25 then
         return Ok_Text (Color_Phrase (Context, Phrase_Desaturated));
      elsif Value < 0.50 then
         return Ok_Text (Color_Phrase (Context, Phrase_Muted));
      elsif Value < 0.75 then
         return Ok_Text (Color_Phrase (Context, Phrase_Saturated));
      else
         return Ok_Text (Color_Phrase (Context, Phrase_Vivid));
      end if;
   end Saturation_Label;

   function Temperature_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant HSL_Color := HSL (Color);
      Hue   : constant Long_Float := Value.Hue;
   begin
      if Value.Saturation < 0.08 then
         return Ok_Text ("neutral temperature");
      elsif Hue < 80.0 or else Hue >= 300.0 then
         return Ok_Text ("warm");
      elsif Hue >= 150.0 and then Hue < 285.0 then
         return Ok_Text ("cool");
      else
         return Ok_Text ("balanced temperature");
      end if;
   end Temperature_Label;

   function Temperature_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant HSL_Color := HSL (Color);
      Hue   : constant Long_Float := Value.Hue;
   begin
      if Value.Saturation < 0.08 then
         return Ok_Text (Color_Phrase (Context, Phrase_Neutral_Temperature));
      elsif Hue < 80.0 or else Hue >= 300.0 then
         return Ok_Text (Color_Phrase (Context, Phrase_Warm));
      elsif Hue >= 150.0 and then Hue < 285.0 then
         return Ok_Text (Color_Phrase (Context, Phrase_Cool));
      else
         return Ok_Text (Color_Phrase (Context, Phrase_Balanced_Temperature));
      end if;
   end Temperature_Label;

   function Chroma_Label
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant OKLab_Color := OKLab (Color);
      Chroma : constant Long_Float :=
        Ada.Numerics.Long_Elementary_Functions.Sqrt
          (Value.A * Value.A + Value.B * Value.B);
      Light : constant Long_Float := HSL (Color).Lightness;
   begin
      if Chroma < 0.03 then
         return Ok_Text ("grayish");
      elsif Chroma < 0.14 and then Light > 0.68 then
         return Ok_Text ("pastel");
      elsif Chroma < 0.08 then
         return Ok_Text ("soft");
      elsif Chroma < 0.16 then
         return Ok_Text ("moderate chroma");
      else
         return Ok_Text ("high chroma");
      end if;
   end Chroma_Label;

   function Chroma_Label
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant OKLab_Color := OKLab (Color);
      Chroma : constant Long_Float :=
        Ada.Numerics.Long_Elementary_Functions.Sqrt
          (Value.A * Value.A + Value.B * Value.B);
      Light : constant Long_Float := HSL (Color).Lightness;
   begin
      if Chroma < 0.03 then
         return Ok_Text (Color_Phrase (Context, Phrase_Grayish));
      elsif Chroma < 0.14 and then Light > 0.68 then
         return Ok_Text (Color_Phrase (Context, Phrase_Pastel));
      elsif Chroma < 0.08 then
         return Ok_Text (Color_Phrase (Context, Phrase_Soft));
      elsif Chroma < 0.16 then
         return Ok_Text (Color_Phrase (Context, Phrase_Moderate_Chroma));
      else
         return Ok_Text (Color_Phrase (Context, Phrase_High_Chroma));
      end if;
   end Chroma_Label;

   function Color_Description
     (Color : RGB_Color)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (To_String (Brightness_Label (Color).Text) & ", "
         & To_String (Saturation_Label (Color).Text) & " "
         & To_String (Hue_Family_Label (Color).Text) & ", "
         & To_String (Temperature_Label (Color).Text) & ", "
         & To_String (Chroma_Label (Color).Text));
   end Color_Description;

   function Color_Description
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (To_String (Brightness_Label (Context, Color).Text) & ", "
         & To_String (Saturation_Label (Context, Color).Text) & " "
         & To_String (Hue_Family_Label (Context, Color).Text) & ", "
         & To_String (Temperature_Label (Context, Color).Text) & ", "
         & To_String (Chroma_Label (Context, Color).Text));
   end Color_Description;

   function Clamped_Opacity (Opacity : Long_Float) return Long_Float is
   begin
      if Opacity < 0.0 then
         return 0.0;
      elsif Opacity > 1.0 then
         return 1.0;
      else
         return Opacity;
      end if;
   end Clamped_Opacity;

   function Opacity_Label
     (Opacity : Long_Float)
      return Humanize.Status.Text_Result
   is
      O       : constant Long_Float := Clamped_Opacity (Opacity);
      Percent : constant String :=
        Humanize.Decimal_Images.Decimal_Image (O * 100.0, 0, True);
      Label   : constant String :=
        (if O = 0.0 then "transparent"
         elsif O < 0.25 then "mostly transparent"
         elsif O < 0.75 then "translucent"
         elsif O < 1.0 then "mostly opaque"
         else "opaque");
   begin
      return Ok_Text (Percent & "% " & Label);
   end Opacity_Label;

   function Linear_Channel (Channel : Color_Channel) return Long_Float is
      C : constant Long_Float := Long_Float (Channel) / 255.0;
   begin
      if C <= 0.03928 then
         return C / 12.92;
      else
         return Ada.Numerics.Long_Elementary_Functions."**"
           ((C + 0.055) / 1.055, 2.4);
      end if;
   end Linear_Channel;

   function Relative_Luminance
     (Color : RGB_Color)
      return Long_Float
   is
   begin
      return 0.2126 * Linear_Channel (Color.Red)
        + 0.7152 * Linear_Channel (Color.Green)
        + 0.0722 * Linear_Channel (Color.Blue);
   end Relative_Luminance;

   function Contrast_Ratio
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Long_Float
   is
      F : constant Long_Float := Relative_Luminance (Foreground);
      B : constant Long_Float := Relative_Luminance (Background);
      Lighter : constant Long_Float := Long_Float'Max (F, B);
      Darker  : constant Long_Float := Long_Float'Min (F, B);
   begin
      return (Lighter + 0.05) / (Darker + 0.05);
   end Contrast_Ratio;

   function Clamp_Unit (Value : Long_Float) return Long_Float is
   begin
      return Long_Float'Max (0.0, Long_Float'Min (1.0, Value));
   end Clamp_Unit;

   function Blend_Channel
     (Foreground : Color_Channel;
      Background : Color_Channel;
      Alpha      : Long_Float)
      return Color_Channel
   is
      Value : constant Long_Float :=
        Long_Float (Foreground) * Alpha
        + Long_Float (Background) * (1.0 - Alpha);
   begin
      return Color_Channel
        (Natural (Long_Float'Min (255.0, Long_Float'Max (0.0, Value + 0.5))));
   end Blend_Channel;

   function Composite
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Alpha      : Long_Float)
      return RGB_Color
   is
      A : constant Long_Float := Clamp_Unit (Alpha);
   begin
      return
        (Red   => Blend_Channel (Foreground.Red, Background.Red, A),
         Green => Blend_Channel (Foreground.Green, Background.Green, A),
         Blue  => Blend_Channel (Foreground.Blue, Background.Blue, A));
   end Composite;

   function Alpha_Contrast_Ratio
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Alpha      : Long_Float)
      return Long_Float
   is
   begin
      return Contrast_Ratio
        (Composite (Foreground, Background, Alpha), Background);
   end Alpha_Contrast_Ratio;

   function Contrast_Level_For
     (Ratio : Long_Float)
      return Contrast_Level
   is
   begin
      if Ratio >= 7.0 then
         return Contrast_Enhanced_Text;
      elsif Ratio >= 4.5 then
         return Contrast_Normal_Text;
      elsif Ratio >= 3.0 then
         return Contrast_Large_Text;
      else
         return Contrast_Fail;
      end if;
   end Contrast_Level_For;

   function Ratio_Text (Ratio : Long_Float) return String is
   begin
      return Humanize.Decimal_Images.Decimal_Image (Ratio, 1, True) & ":1";
   end Ratio_Text;

   function Target_Ratio (Target : Contrast_Target) return Long_Float is
   begin
      case Target is
         when Target_Large_Text =>
            return 3.0;
         when Target_Normal_Text =>
            return 4.5;
         when Target_Enhanced_Text =>
            return 7.0;
      end case;
   end Target_Ratio;

   function Target_Label (Target : Contrast_Target) return String is
   begin
      case Target is
         when Target_Large_Text =>
            return "large text";
         when Target_Normal_Text =>
            return "normal text";
         when Target_Enhanced_Text =>
            return "enhanced text";
      end case;
   end Target_Label;

   function Contrast_Level_Label (Level : Contrast_Level) return String is
   begin
      case Level is
         when Contrast_Fail =>
            return "low contrast";
         when Contrast_Large_Text =>
            return "large-text contrast";
         when Contrast_Normal_Text =>
            return "normal-text contrast";
         when Contrast_Enhanced_Text =>
            return "enhanced contrast";
      end case;
   end Contrast_Level_Label;

   function Contrast_Level_Label
     (Context : Humanize.Contexts.Context;
      Level   : Contrast_Level)
      return String is
   begin
      case Level is
         when Contrast_Fail =>
            return Color_Phrase (Context, Phrase_Low_Contrast);
         when Contrast_Large_Text =>
            return Color_Phrase (Context, Phrase_Large_Text_Contrast);
         when Contrast_Normal_Text =>
            return Color_Phrase (Context, Phrase_Normal_Text_Contrast);
         when Contrast_Enhanced_Text =>
            return Color_Phrase (Context, Phrase_Enhanced_Contrast);
      end case;
   end Contrast_Level_Label;

   function Contrast_Label
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Ratio : constant Long_Float := Contrast_Ratio (Foreground, Background);
   begin
      return Ok_Text
        (Ratio_Text (Ratio) & " "
         & Contrast_Level_Label (Contrast_Level_For (Ratio)));
   end Contrast_Label;

   function Contrast_Metadata_For
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Contrast_Metadata
   is
      Ratio : constant Long_Float := Contrast_Ratio (Foreground, Background);
      Level : constant Contrast_Level := Contrast_Level_For (Ratio);
   begin
      return
        (Status => Humanize.Status.Ok,
         Ratio => Ratio,
         Level => Level,
         Passes_Large_Text => Ratio >= 3.0,
         Passes_Normal_Text => Ratio >= 4.5,
         Passes_Enhanced_Text => Ratio >= 7.0);
   end Contrast_Metadata_For;

   function Palette_Metadata_For
     (Colors : Color_List)
      return Palette_Metadata
   is
      Result : Palette_Metadata :=
        (Status => Humanize.Status.Ok,
         Color_Count => Colors'Length,
         Pair_Count => 0,
         Failing_Pairs => 0,
         Large_Text_Pairs => 0,
         Normal_Text_Pairs => 0,
         Enhanced_Text_Pairs => 0,
         Best_Contrast_Ratio => 1.0,
         Worst_Contrast_Ratio => 1.0);
      Ratio : Long_Float;
      First_Pair : Boolean := True;
   begin
      if Colors'Length < 2 then
         return Result;
      end if;

      for I in Colors'First .. Colors'Last - 1 loop
         for J in I + 1 .. Colors'Last loop
            Ratio := Contrast_Ratio (Colors (I), Colors (J));
            Result.Pair_Count := Result.Pair_Count + 1;

            if First_Pair then
               Result.Best_Contrast_Ratio := Ratio;
               Result.Worst_Contrast_Ratio := Ratio;
               First_Pair := False;
            elsif Ratio > Result.Best_Contrast_Ratio then
               Result.Best_Contrast_Ratio := Ratio;
            elsif Ratio < Result.Worst_Contrast_Ratio then
               Result.Worst_Contrast_Ratio := Ratio;
            end if;

            case Contrast_Level_For (Ratio) is
               when Contrast_Enhanced_Text =>
                  Result.Enhanced_Text_Pairs :=
                    Result.Enhanced_Text_Pairs + 1;
               when Contrast_Normal_Text =>
                  Result.Normal_Text_Pairs := Result.Normal_Text_Pairs + 1;
               when Contrast_Large_Text =>
                  Result.Large_Text_Pairs := Result.Large_Text_Pairs + 1;
               when Contrast_Fail =>
                  Result.Failing_Pairs := Result.Failing_Pairs + 1;
            end case;
         end loop;
      end loop;

      return Result;
   end Palette_Metadata_For;

   function Palette_Metadata_Label
     (Colors : Color_List)
      return Humanize.Status.Text_Result
   is
      Info : constant Palette_Metadata := Palette_Metadata_For (Colors);
   begin
      return Ok_Text
        (Natural_Text (Info.Color_Count) & " colors, "
         & Natural_Text (Info.Pair_Count) & " pairs: "
         & Natural_Text (Info.Enhanced_Text_Pairs) & " enhanced, "
         & Natural_Text (Info.Normal_Text_Pairs) & " normal, "
         & Natural_Text (Info.Large_Text_Pairs) & " large-only, "
         & Natural_Text (Info.Failing_Pairs) & " fail");
   end Palette_Metadata_Label;

   function Alpha_Contrast_Label
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Alpha      : Long_Float)
      return Humanize.Status.Text_Result
   is
      Ratio : constant Long_Float :=
        Alpha_Contrast_Ratio (Foreground, Background, Alpha);
   begin
      return Ok_Text
        (Ratio_Text (Ratio) & " "
         & Contrast_Level_Label (Contrast_Level_For (Ratio))
         & " after alpha compositing");
   end Alpha_Contrast_Label;

   function Contrast_Label
     (Context    : Humanize.Contexts.Context;
      Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Ratio : constant Long_Float := Contrast_Ratio (Foreground, Background);
   begin
      return Ok_Text
        (Ratio_Text (Ratio) & " "
         & Contrast_Level_Label (Context, Contrast_Level_For (Ratio)));
   end Contrast_Label;

   function Mix_Toward
     (Color  : RGB_Color;
      Target : RGB_Color;
      Amount : Long_Float)
      return RGB_Color
   is
   begin
      return Composite (Target, Color, Amount);
   end Mix_Toward;

   function Accessible_Foreground
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : Contrast_Target := Target_Normal_Text)
      return Color_Remediation_Result
   is
      Goal : constant Long_Float := Target_Ratio (Target);
      Current_Ratio : constant Long_Float :=
        Contrast_Ratio (Foreground, Background);
      Black : constant RGB_Color := (Red => 0, Green => 0, Blue => 0);
      White : constant RGB_Color := (Red => 255, Green => 255, Blue => 255);
      Toward : RGB_Color;
      Candidate : RGB_Color := Foreground;
      Ratio : Long_Float := Current_Ratio;
   begin
      if Current_Ratio >= Goal then
         return
           (Status => Humanize.Status.Ok,
            Color  => Foreground,
            Ratio  => Current_Ratio);
      end if;

      if Contrast_Ratio (Black, Background)
        >= Contrast_Ratio (White, Background)
      then
         Toward := Black;
      else
         Toward := White;
      end if;

      for Step in 1 .. 100 loop
         Candidate := Mix_Toward (Foreground, Toward, Long_Float (Step) / 100.0);
         Ratio := Contrast_Ratio (Candidate, Background);
         if Ratio >= Goal then
            return
              (Status => Humanize.Status.Ok,
               Color  => Candidate,
               Ratio  => Ratio);
         end if;
      end loop;

      Candidate := Toward;
      Ratio := Contrast_Ratio (Candidate, Background);
      return
        (Status =>
           (if Ratio >= Goal then Humanize.Status.Ok
            else Humanize.Status.Invalid_Options),
         Color  => Candidate,
         Ratio  => Ratio);
   end Accessible_Foreground;

   function Contrast_Remediation_Label
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : Contrast_Target := Target_Normal_Text)
      return Humanize.Status.Text_Result
   is
      Current : constant Long_Float := Contrast_Ratio (Foreground, Background);
      Result  : constant Color_Remediation_Result :=
        Accessible_Foreground (Foreground, Background, Target);
      Hex     : constant Humanize.Status.Text_Result := Hex_Color (Result.Color);
   begin
      if Result.Status /= Humanize.Status.Ok then
         return (Status => Result.Status, others => <>);
      elsif Current >= Target_Ratio (Target) then
         return Ok_Text
           ("current foreground meets " & Target_Label (Target)
            & " contrast at " & Ratio_Text (Current));
      else
         return Ok_Text
           ("use " & To_String (Hex.Text) & " for "
            & Ratio_Text (Result.Ratio) & " " & Target_Label (Target)
            & " contrast");
      end if;
   end Contrast_Remediation_Label;

   function Readability_Label
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result
   is
   begin
      case Contrast_Level_For (Contrast_Ratio (Foreground, Background)) is
         when Contrast_Enhanced_Text =>
            return Ok_Text ("readable for enhanced text");
         when Contrast_Normal_Text =>
            return Ok_Text ("readable for normal text");
         when Contrast_Large_Text =>
            return Ok_Text ("readable for large text only");
         when Contrast_Fail =>
            return Ok_Text ("low readability");
      end case;
   end Readability_Label;

   function Readability_Label
     (Context    : Humanize.Contexts.Context;
      Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result
   is
   begin
      case Contrast_Level_For (Contrast_Ratio (Foreground, Background)) is
         when Contrast_Enhanced_Text =>
            return Ok_Text (Color_Phrase (Context, Phrase_Readable_Enhanced));
         when Contrast_Normal_Text =>
            return Ok_Text (Color_Phrase (Context, Phrase_Readable_Normal));
         when Contrast_Large_Text =>
            return Ok_Text (Color_Phrase (Context, Phrase_Readable_Large_Only));
         when Contrast_Fail =>
            return Ok_Text (Color_Phrase (Context, Phrase_Low_Readability));
      end case;
   end Readability_Label;

   function APCA_Contrast
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Long_Float
   is
      use Ada.Numerics.Long_Elementary_Functions;
      F : constant Long_Float := Relative_Luminance (Foreground);
      B : constant Long_Float := Relative_Luminance (Background);
      Fp : constant Long_Float := "**" (F, 0.56);
      Bp : constant Long_Float := "**" (B, 0.57);
   begin
      return (Bp - Fp) * 100.0;
   end APCA_Contrast;

   function APCA_Strength_Label (Magnitude : Long_Float) return String is
   begin
      if Magnitude >= 75.0 then
         return "excellent";
      elsif Magnitude >= 60.0 then
         return "body text";
      elsif Magnitude >= 45.0 then
         return "large text";
      elsif Magnitude >= 30.0 then
         return "non-text only";
      else
         return "insufficient";
      end if;
   end APCA_Strength_Label;

   function APCA_Contrast_Label
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Score     : constant Long_Float := APCA_Contrast (Foreground, Background);
      Magnitude : constant Long_Float := abs Score;
      Polarity  : constant String :=
        (if Score >= 0.0 then "dark text on light background"
         else "light text on dark background");
   begin
      return Ok_Text
        ("Lc " & Humanize.Decimal_Images.Decimal_Image (Magnitude, 0, True)
         & ", " & APCA_Strength_Label (Magnitude) & ", " & Polarity);
   end APCA_Contrast_Label;

   function Simulated_CVD
     (Color      : RGB_Color;
      Deficiency : Color_Vision_Deficiency)
      return RGB_Color
   is
      R : constant Long_Float := Long_Float (Color.Red);
      G : constant Long_Float := Long_Float (Color.Green);
      B : constant Long_Float := Long_Float (Color.Blue);
   begin
      case Deficiency is
         when Protanopia =>
            return
              (Red   => Channel_From_Float (0.567 * R + 0.433 * G),
               Green => Channel_From_Float (0.558 * R + 0.442 * G),
               Blue  => Channel_From_Float (0.242 * G + 0.758 * B));
         when Deuteranopia =>
            return
              (Red   => Channel_From_Float (0.625 * R + 0.375 * G),
               Green => Channel_From_Float (0.700 * R + 0.300 * G),
               Blue  => Channel_From_Float (0.300 * G + 0.700 * B));
         when Tritanopia =>
            return
              (Red   => Channel_From_Float (0.950 * R + 0.050 * G),
               Green => Channel_From_Float (0.433 * G + 0.567 * B),
               Blue  => Channel_From_Float (0.475 * G + 0.525 * B));
         when Achromatopsia =>
            declare
               Y : constant Color_Channel :=
                 Channel_From_Float (0.299 * R + 0.587 * G + 0.114 * B);
            begin
               return (Y, Y, Y);
            end;
      end case;
   end Simulated_CVD;

   function Deficiency_Name
     (Deficiency : Color_Vision_Deficiency)
      return String
   is
   begin
      case Deficiency is
         when Protanopia =>
            return "protanopia";
         when Deuteranopia =>
            return "deuteranopia";
         when Tritanopia =>
            return "tritanopia";
         when Achromatopsia =>
            return "achromatopsia";
      end case;
   end Deficiency_Name;

   function CVD_Risk_Label (Difference : Long_Float) return String is
   begin
      if Difference < 10.0 then
         return "high confusion risk";
      elsif Difference < 25.0 then
         return "moderate confusion risk";
      elsif Difference < 45.0 then
         return "low confusion risk";
      else
         return "distinct";
      end if;
   end CVD_Risk_Label;

   function Color_Vision_Deficiency_Label
     (Left       : RGB_Color;
      Right      : RGB_Color;
      Deficiency : Color_Vision_Deficiency)
      return Humanize.Status.Text_Result
   is
      Sim_Left  : constant RGB_Color := Simulated_CVD (Left, Deficiency);
      Sim_Right : constant RGB_Color := Simulated_CVD (Right, Deficiency);
      Difference : constant Long_Float :=
        OK_Perceptual_Difference (Sim_Left, Sim_Right);
   begin
      return Ok_Text
        (Deficiency_Name (Deficiency) & " "
         & CVD_Risk_Label (Difference) & ", delta "
         & Humanize.Decimal_Images.Decimal_Image (Difference, 0, True));
   end Color_Vision_Deficiency_Label;

   function Worst_CVD_Risk
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return String
   is
      Worst_Delta : Long_Float := Long_Float'Last;
      Worst       : Color_Vision_Deficiency := Protanopia;
   begin
      for Deficiency in Color_Vision_Deficiency loop
         declare
            Difference : constant Long_Float :=
              OK_Perceptual_Difference
                (Simulated_CVD (Foreground, Deficiency),
                 Simulated_CVD (Background, Deficiency));
         begin
            if Difference < Worst_Delta then
               Worst_Delta := Difference;
               Worst := Deficiency;
            end if;
         end;
      end loop;

      return Deficiency_Name (Worst) & " " & CVD_Risk_Label (Worst_Delta);
   end Worst_CVD_Risk;

   function Color_Accessibility_Summary
     (Foreground : RGB_Color;
      Background : RGB_Color)
      return Humanize.Status.Text_Result
   is
      WCAG : constant Humanize.Status.Text_Result :=
        Contrast_Label (Foreground, Background);
      APCA : constant Humanize.Status.Text_Result :=
        APCA_Contrast_Label (Foreground, Background);
   begin
      return Ok_Text
        (To_String (WCAG.Text) & "; " & To_String (APCA.Text)
         & "; " & Worst_CVD_Risk (Foreground, Background));
   end Color_Accessibility_Summary;

   function Color_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float
   is
      use Ada.Numerics.Long_Elementary_Functions;
      DR : constant Long_Float := Long_Float (Integer (Left.Red)
        - Integer (Right.Red));
      DG : constant Long_Float := Long_Float (Integer (Left.Green)
        - Integer (Right.Green));
      DB : constant Long_Float := Long_Float (Integer (Left.Blue)
        - Integer (Right.Blue));
   begin
      return Sqrt (DR * DR + DG * DG + DB * DB) / Sqrt (3.0 * 255.0 * 255.0)
        * 100.0;
   end Color_Difference;

   function Color_Difference_Label
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant Long_Float := Color_Difference (Left, Right);
      Label : constant String :=
        (if Value < 2.0 then "nearly identical"
         elsif Value < 10.0 then "subtle difference"
         elsif Value < 25.0 then "noticeable difference"
         elsif Value < 50.0 then "strong difference"
         else "very different");
   begin
      return Ok_Text (Float_Text (Value, 0) & "% " & Label);
   end Color_Difference_Label;

   function Perceptual_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float
   is
      use Ada.Numerics.Long_Elementary_Functions;
      L : constant Lab_Color := Lab (Left);
      R : constant Lab_Color := Lab (Right);
      DL : constant Long_Float := L.Lightness - R.Lightness;
      DA : constant Long_Float := L.A - R.A;
      DB : constant Long_Float := L.B - R.B;
   begin
      return Sqrt (DL * DL + DA * DA + DB * DB);
   end Perceptual_Difference;

   function CIE94_Difference
     (Left     : RGB_Color;
      Right    : RGB_Color;
      Textiles : Boolean := False)
      return Long_Float
   is
      use Ada.Numerics.Long_Elementary_Functions;
      L : constant Lab_Color := Lab (Left);
      R : constant Lab_Color := Lab (Right);
      Delta_L : constant Long_Float := L.Lightness - R.Lightness;
      C1 : constant Long_Float := Sqrt (L.A * L.A + L.B * L.B);
      C2 : constant Long_Float := Sqrt (R.A * R.A + R.B * R.B);
      Delta_C : constant Long_Float := C1 - C2;
      Delta_A : constant Long_Float := L.A - R.A;
      Delta_B : constant Long_Float := L.B - R.B;
      Delta_H_Squared : constant Long_Float :=
        Long_Float'Max
          (0.0, Delta_A * Delta_A + Delta_B * Delta_B
           - Delta_C * Delta_C);
      K_L : constant Long_Float := (if Textiles then 2.0 else 1.0);
      K_C : constant Long_Float := 1.0;
      K_H : constant Long_Float := 1.0;
      K_1 : constant Long_Float := (if Textiles then 0.048 else 0.045);
      K_2 : constant Long_Float := (if Textiles then 0.014 else 0.015);
      S_L : constant Long_Float := 1.0;
      S_C : constant Long_Float := 1.0 + K_1 * C1;
      S_H : constant Long_Float := 1.0 + K_2 * C1;
      L_Term : constant Long_Float := Delta_L / (K_L * S_L);
      C_Term : constant Long_Float := Delta_C / (K_C * S_C);
      H_Term : constant Long_Float := Sqrt (Delta_H_Squared) / (K_H * S_H);
   begin
      return Sqrt
        (L_Term * L_Term + C_Term * C_Term + H_Term * H_Term);
   end CIE94_Difference;

   function CIEDE2000_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float
   is
      use Ada.Numerics.Long_Elementary_Functions;

      function Pow_7 (Value : Long_Float) return Long_Float is
      begin
         return Value ** 7;
      end Pow_7;

      function To_Radians (Degrees : Long_Float) return Long_Float is
      begin
         return Degrees * Ada.Numerics.Pi / 180.0;
      end To_Radians;

      function Hue_Degrees
        (B : Long_Float;
         A : Long_Float)
         return Long_Float
      is
         Angle : Long_Float;
      begin
         if A = 0.0 and then B = 0.0 then
            return 0.0;
         end if;

         Angle := Arctan (B, A) * 180.0 / Ada.Numerics.Pi;
         if Angle < 0.0 then
            Angle := Angle + 360.0;
         end if;
         return Angle;
      end Hue_Degrees;

      L1 : constant Lab_Color := Lab (Left);
      L2 : constant Lab_Color := Lab (Right);
      C1 : constant Long_Float := Sqrt (L1.A * L1.A + L1.B * L1.B);
      C2 : constant Long_Float := Sqrt (L2.A * L2.A + L2.B * L2.B);
      Mean_C : constant Long_Float := (C1 + C2) / 2.0;
      Mean_C7 : constant Long_Float := Pow_7 (Mean_C);
      G : constant Long_Float :=
        0.5 * (1.0 - Sqrt (Mean_C7 / (Mean_C7 + Pow_7 (25.0))));
      A1_Prime : constant Long_Float := (1.0 + G) * L1.A;
      A2_Prime : constant Long_Float := (1.0 + G) * L2.A;
      C1_Prime : constant Long_Float :=
        Sqrt (A1_Prime * A1_Prime + L1.B * L1.B);
      C2_Prime : constant Long_Float :=
        Sqrt (A2_Prime * A2_Prime + L2.B * L2.B);
      H1_Prime : constant Long_Float := Hue_Degrees (L1.B, A1_Prime);
      H2_Prime : constant Long_Float := Hue_Degrees (L2.B, A2_Prime);
      Delta_L_Prime : constant Long_Float := L2.Lightness - L1.Lightness;
      Delta_C_Prime : constant Long_Float := C2_Prime - C1_Prime;
      Delta_H_Prime_Degrees : Long_Float;
      Delta_H_Prime : Long_Float;
      Mean_L_Prime : constant Long_Float := (L1.Lightness + L2.Lightness) / 2.0;
      Mean_C_Prime : constant Long_Float := (C1_Prime + C2_Prime) / 2.0;
      Mean_H_Prime : Long_Float;
      T : Long_Float;
      Delta_Theta : Long_Float;
      Mean_C_Prime7 : Long_Float;
      R_C : Long_Float;
      S_L : Long_Float;
      S_C : Long_Float;
      S_H : Long_Float;
      R_T : Long_Float;
      L_Term : Long_Float;
      C_Term : Long_Float;
      H_Term : Long_Float;
   begin
      if C1_Prime * C2_Prime = 0.0 then
         Delta_H_Prime_Degrees := 0.0;
      elsif abs (H2_Prime - H1_Prime) <= 180.0 then
         Delta_H_Prime_Degrees := H2_Prime - H1_Prime;
      elsif H2_Prime <= H1_Prime then
         Delta_H_Prime_Degrees := H2_Prime - H1_Prime + 360.0;
      else
         Delta_H_Prime_Degrees := H2_Prime - H1_Prime - 360.0;
      end if;

      Delta_H_Prime :=
        2.0 * Sqrt (C1_Prime * C2_Prime)
        * Sin (To_Radians (Delta_H_Prime_Degrees / 2.0));

      if C1_Prime * C2_Prime = 0.0 then
         Mean_H_Prime := H1_Prime + H2_Prime;
      elsif abs (H1_Prime - H2_Prime) <= 180.0 then
         Mean_H_Prime := (H1_Prime + H2_Prime) / 2.0;
      elsif H1_Prime + H2_Prime < 360.0 then
         Mean_H_Prime := (H1_Prime + H2_Prime + 360.0) / 2.0;
      else
         Mean_H_Prime := (H1_Prime + H2_Prime - 360.0) / 2.0;
      end if;

      T := 1.0
        - 0.17 * Cos (To_Radians (Mean_H_Prime - 30.0))
        + 0.24 * Cos (To_Radians (2.0 * Mean_H_Prime))
        + 0.32 * Cos (To_Radians (3.0 * Mean_H_Prime + 6.0))
        - 0.20 * Cos (To_Radians (4.0 * Mean_H_Prime - 63.0));
      Delta_Theta :=
        30.0 * Exp (-((Mean_H_Prime - 275.0) / 25.0) ** 2);
      Mean_C_Prime7 := Pow_7 (Mean_C_Prime);
      R_C := 2.0
        * Sqrt (Mean_C_Prime7 / (Mean_C_Prime7 + Pow_7 (25.0)));
      S_L := 1.0 + (0.015 * (Mean_L_Prime - 50.0) ** 2)
        / Sqrt (20.0 + (Mean_L_Prime - 50.0) ** 2);
      S_C := 1.0 + 0.045 * Mean_C_Prime;
      S_H := 1.0 + 0.015 * Mean_C_Prime * T;
      R_T := -Sin (To_Radians (2.0 * Delta_Theta)) * R_C;
      L_Term := Delta_L_Prime / S_L;
      C_Term := Delta_C_Prime / S_C;
      H_Term := Delta_H_Prime / S_H;

      return Sqrt
        (L_Term * L_Term + C_Term * C_Term + H_Term * H_Term
         + R_T * C_Term * H_Term);
   end CIEDE2000_Difference;

   function OK_Perceptual_Difference
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Long_Float
   is
      use Ada.Numerics.Long_Elementary_Functions;
      L : constant OKLab_Color := OKLab (Left);
      R : constant OKLab_Color := OKLab (Right);
      DL : constant Long_Float := L.Lightness - R.Lightness;
      DA : constant Long_Float := L.A - R.A;
      DB : constant Long_Float := L.B - R.B;
   begin
      return Sqrt (DL * DL + DA * DA + DB * DB) * 100.0;
   end OK_Perceptual_Difference;

   function Perceptual_Difference
     (Left   : RGB_Color;
      Right  : RGB_Color;
      Method : Perceptual_Difference_Method)
      return Long_Float
   is
   begin
      case Method is
         when Perceptual_CIE76 =>
            return Perceptual_Difference (Left, Right);
         when Perceptual_CIE94_Graphic_Arts =>
            return CIE94_Difference (Left, Right);
         when Perceptual_CIE94_Textiles =>
            return CIE94_Difference (Left, Right, Textiles => True);
         when Perceptual_CIEDE2000 =>
            return CIEDE2000_Difference (Left, Right);
         when Perceptual_OKLab =>
            return OK_Perceptual_Difference (Left, Right);
      end case;
   end Perceptual_Difference;

   function Perceptual_Method_Label
     (Method : Perceptual_Difference_Method)
      return String
   is
   begin
      case Method is
         when Perceptual_CIE76 =>
            return "CIE76 delta ";
         when Perceptual_CIE94_Graphic_Arts =>
            return "CIE94 delta ";
         when Perceptual_CIE94_Textiles =>
            return "CIE94 textile delta ";
         when Perceptual_CIEDE2000 =>
            return "CIEDE2000 delta ";
         when Perceptual_OKLab =>
            return "OKLab delta ";
      end case;
   end Perceptual_Method_Label;

   function Perceptual_Difference_Descriptor
     (Value : Long_Float)
      return String
   is
   begin
      return
        (if Value < 1.0 then "imperceptible"
         elsif Value < 3.0 then "barely perceptible"
         elsif Value < 8.0 then "subtle perceptual difference"
         elsif Value < 18.0 then "noticeable perceptual difference"
         elsif Value < 35.0 then "large perceptual difference"
         else "dramatic perceptual difference");
   end Perceptual_Difference_Descriptor;

   function Perceptual_Difference_Label
     (Left  : RGB_Color;
      Right : RGB_Color)
      return Humanize.Status.Text_Result
   is
      Value : constant Long_Float := OK_Perceptual_Difference (Left, Right);
   begin
      return Ok_Text
        ("OKLab delta " & Float_Text (Value, 1) & ", "
         & Perceptual_Difference_Descriptor (Value));
   end Perceptual_Difference_Label;

   function Perceptual_Difference_Label
     (Left   : RGB_Color;
      Right  : RGB_Color;
      Method : Perceptual_Difference_Method)
      return Humanize.Status.Text_Result
   is
      Value : constant Long_Float :=
        Perceptual_Difference (Left, Right, Method);
   begin
      return Ok_Text
        (Perceptual_Method_Label (Method) & Float_Text (Value, 1) & ", "
         & Perceptual_Difference_Descriptor (Value));
   end Perceptual_Difference_Label;

   procedure Hex_Color_Into
     (Color     : RGB_Color;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Prefix    : Boolean := True;
      Lowercase : Boolean := False)
   is
   begin
      Copy_Result
        (Hex_Color (Color, Prefix, Lowercase), Target, Written, Status);
   end Hex_Color_Into;

   procedure RGB_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (RGB_Label (Color), Target, Written, Status);
   end RGB_Label_Into;

   procedure RGBA_Label_Into
     (Color   : RGB_Color;
      Opacity : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (RGBA_Label (Color, Opacity), Target, Written, Status);
   end RGBA_Label_Into;

   procedure CSS_Color_Label_Into
     (Color   : CSS_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (CSS_Color_Label (Color), Target, Written, Status);
   end CSS_Color_Label_Into;

   procedure HSL_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (HSL_Label (Color), Target, Written, Status);
   end HSL_Label_Into;

   procedure HSV_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (HSV_Label (Color), Target, Written, Status);
   end HSV_Label_Into;

   procedure Hue_Family_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Hue_Family_Label (Color), Target, Written, Status);
   end Hue_Family_Label_Into;

   procedure Hue_Family_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Hue_Family_Label (Context, Color), Target, Written, Status);
   end Hue_Family_Label_Into;

   procedure Saturation_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Saturation_Label (Color), Target, Written, Status);
   end Saturation_Label_Into;

   procedure Saturation_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Saturation_Label (Context, Color), Target, Written, Status);
   end Saturation_Label_Into;

   procedure Temperature_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Temperature_Label (Color), Target, Written, Status);
   end Temperature_Label_Into;

   procedure Temperature_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Temperature_Label (Context, Color), Target, Written, Status);
   end Temperature_Label_Into;

   procedure Chroma_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Chroma_Label (Color), Target, Written, Status);
   end Chroma_Label_Into;

   procedure Chroma_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Chroma_Label (Context, Color), Target, Written, Status);
   end Chroma_Label_Into;

   procedure Color_Description_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Color_Description (Color), Target, Written, Status);
   end Color_Description_Into;

   procedure Color_Description_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Color_Description (Context, Color), Target, Written, Status);
   end Color_Description_Into;

   procedure Nearest_Color_Name_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Nearest_Color_Name (Color), Target, Written, Status);
   end Nearest_Color_Name_Into;

   procedure Palette_Summary_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Palette_Summary (Colors), Target, Written, Status);
   end Palette_Summary_Into;

   procedure Palette_Roles_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Palette_Roles (Colors), Target, Written, Status);
   end Palette_Roles_Into;

   procedure Palette_Harmony_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Palette_Harmony_Label (Colors), Target, Written, Status);
   end Palette_Harmony_Label_Into;

   procedure Palette_Contrast_Suggestion_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Palette_Contrast_Suggestion (Colors), Target, Written, Status);
   end Palette_Contrast_Suggestion_Into;

   procedure Palette_Accessibility_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Palette_Accessibility_Label (Colors), Target, Written, Status);
   end Palette_Accessibility_Label_Into;

   procedure Palette_Contrast_Matrix_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Palette_Contrast_Matrix_Label (Colors), Target, Written, Status);
   end Palette_Contrast_Matrix_Label_Into;

   procedure Palette_Metadata_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Palette_Metadata_Label (Colors), Target, Written, Status);
   end Palette_Metadata_Label_Into;

   procedure Palette_Mood_Label_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Palette_Mood_Label (Colors), Target, Written, Status);
   end Palette_Mood_Label_Into;

   procedure Advanced_Palette_Summary_Into
     (Colors  : Color_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Advanced_Palette_Summary (Colors), Target, Written, Status);
   end Advanced_Palette_Summary_Into;

   procedure Color_Summary_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Color_Summary (Color), Target, Written, Status);
   end Color_Summary_Into;

   procedure Brightness_Label_Into
     (Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Brightness_Label (Color), Target, Written, Status);
   end Brightness_Label_Into;

   procedure Brightness_Label_Into
     (Context : Humanize.Contexts.Context;
      Color   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Brightness_Label (Context, Color), Target, Written, Status);
   end Brightness_Label_Into;

   procedure Opacity_Label_Into
     (Opacity : Long_Float;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Opacity_Label (Opacity), Target, Written, Status);
   end Opacity_Label_Into;

   procedure Contrast_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Contrast_Label (Foreground, Background), Target, Written, Status);
   end Contrast_Label_Into;

   procedure Contrast_Label_Into
     (Context    : Humanize.Contexts.Context;
      Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Contrast_Label (Context, Foreground, Background),
         Target, Written, Status);
   end Contrast_Label_Into;

   procedure Alpha_Contrast_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Alpha      : Long_Float;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Alpha_Contrast_Label (Foreground, Background, Alpha),
         Target, Written, Status);
   end Alpha_Contrast_Label_Into;

   procedure Readability_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Readability_Label (Foreground, Background), Target, Written, Status);
   end Readability_Label_Into;

   procedure Readability_Label_Into
     (Context    : Humanize.Contexts.Context;
      Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Readability_Label (Context, Foreground, Background),
         Target, Written, Status);
   end Readability_Label_Into;

   procedure APCA_Contrast_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (APCA_Contrast_Label (Foreground, Background), Target, Written, Status);
   end APCA_Contrast_Label_Into;

   procedure Color_Vision_Deficiency_Label_Into
     (Left       : RGB_Color;
      Right      : RGB_Color;
      Deficiency : Color_Vision_Deficiency;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Color_Vision_Deficiency_Label (Left, Right, Deficiency),
         Target, Written, Status);
   end Color_Vision_Deficiency_Label_Into;

   procedure Color_Accessibility_Summary_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Color_Accessibility_Summary (Foreground, Background),
         Target, Written, Status);
   end Color_Accessibility_Summary_Into;

   procedure Contrast_Remediation_Label_Into
     (Foreground : RGB_Color;
      Background : RGB_Color;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Goal       : Contrast_Target := Target_Normal_Text)
   is
   begin
      Copy_Result
        (Contrast_Remediation_Label (Foreground, Background, Goal),
         Target, Written, Status);
   end Contrast_Remediation_Label_Into;

   procedure Color_Difference_Label_Into
     (Left    : RGB_Color;
      Right   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Color_Difference_Label (Left, Right), Target, Written, Status);
   end Color_Difference_Label_Into;

   procedure Perceptual_Difference_Label_Into
     (Left    : RGB_Color;
      Right   : RGB_Color;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Perceptual_Difference_Label (Left, Right), Target, Written, Status);
   end Perceptual_Difference_Label_Into;

   procedure Perceptual_Difference_Label_Into
     (Left    : RGB_Color;
      Right   : RGB_Color;
      Method  : Perceptual_Difference_Method;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Perceptual_Difference_Label (Left, Right, Method),
         Target, Written, Status);
   end Perceptual_Difference_Label_Into;

end Humanize.Colors;
