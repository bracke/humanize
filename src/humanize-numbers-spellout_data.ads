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

   function Locale_Ordinal_Words_Text
     (Locale : String;
      Value  : Natural)
      return String;

   function Scale_Value (Scale : Positive) return Long_Long_Integer;

   function CJK_Scale_Value (Scale : Positive) return Long_Long_Integer;
end Humanize.Numbers.Spellout_Data;
