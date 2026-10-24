private package Humanize.Numbers.Spellout_Data is
   function Has_Generated_Spellout (Locale : String) return Boolean;

   function Small_Locale_Word
     (Locale : String;
      Value  : Natural)
      return String;

   function Locale_Tens_Word
     (Locale : String;
      Tens   : Natural)
      return String;

   function Locale_Word_99
     (Locale : String;
      Value  : Natural)
      return String;

   function Locale_Hundred_Word
     (Locale : String;
      Value  : Natural)
      return String;

   function Locale_Scale_Word
     (Locale : String;
      Scale  : Positive;
      Count  : Natural := 2)
      return String;

   function Locale_CJK_Group_Word
     (Locale : String;
      Value  : Natural)
      return String;

   function Locale_CJK_Myriad_Scale_Word
     (Locale : String;
      Scale  : Positive)
      return String;

   function Locale_Long_Word
     (Locale : String;
      Value  : Long_Long_Integer)
      return String;

   --  Whether humanize's own table writes Value's ordinal word right for
   --  Locale, one of the locales CLDR spells no ordinals for: not a round
   --  hundred or thousand, and in Romanian and Slovenian only the words to
   --  ten and the round tens. The rest are written as numbers.
   function Locale_Ordinal_Word_Known
     (Locale : String;
      Value  : Natural)
      return Boolean;

   --  Where CLDR 48's ordinal rules write wrong words: Lithuanian leaves a
   --  round hundred's stem bare ("šimt", "tūkstant" for "šimtasis",
   --  "tūkstantasis"), Polish splits a compound multiplier ("dwudziesto dwoma
   --  tysięczny" for "dwudziestodwutysięczny"). The numeric ordinal is right.
   function CLDR_Ordinal_Wrong (Locale : String; Value : Natural) return Boolean is
     ((Locale = "lt" and then Value >= 100 and then Value mod 100 = 0)
      or else (Locale = "pl" and then Value >= 21_000 and then Value mod 1_000 = 0
               and then not (Value / 1_000 mod 10 = 0 and then Value / 1_000 < 100)
               and then Value / 1_000 mod 100 /= 0));

   --  The Lithuanian ordinal of a round 100, 200, 300, 1000, 2000 or 3000
   --  ("dvitūkstantasis"), which CLDR's rules leave bare; "" otherwise.
   function Lt_Round_Ordinal (Value : Natural) return String;

   --  The Russian ordinal of a round 200 .. 900 ("трехсотый"), which CLDR's
   --  rules miss; "" otherwise.
   function Ru_Round_Hundredth (Hundreds : Positive) return String;

   function Locale_Ordinal_Words_Text
     (Locale : String;
      Value  : Natural)
      return String;

   function Scale_Value (Scale : Positive) return Long_Long_Integer;

   function CJK_Scale_Value (Scale : Positive) return Long_Long_Integer;
end Humanize.Numbers.Spellout_Data;
