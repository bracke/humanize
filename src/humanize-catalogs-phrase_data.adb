with Ada.Characters.Wide_Wide_Latin_1;
with Ada.Strings.UTF_Encoding.Wide_Wide_Strings;

package body Humanize.Catalogs.Phrase_Data is

   --  One catalog line: Locale's translation of the phrase Name.
   function Entry_Line (Locale, Name, Template : Wide_Wide_String) return Wide_Wide_String is
     (Locale & ".humanize.phrase." & Name & " = " & Template & Ada.Characters.Wide_Wide_Latin_1.LF);

   --  English, as the formatters write it: for reading phrases back
   --  (Humanize.Parsing.Phrases); the formatters keep their own English.
   function Locale_En return Wide_Wide_String is separate;
   function Locale_Da return Wide_Wide_String is separate;
   function Locale_De return Wide_Wide_String is separate;
   function Locale_Fr return Wide_Wide_String is separate;
   function Locale_Es return Wide_Wide_String is separate;
   function Locale_It return Wide_Wide_String is separate;
   function Locale_Pt return Wide_Wide_String is separate;
   function Locale_Nl return Wide_Wide_String is separate;
   function Locale_Sv return Wide_Wide_String is separate;
   function Locale_No return Wide_Wide_String is separate;
   function Locale_Nb return Wide_Wide_String is separate;
   function Locale_Fi return Wide_Wide_String is separate;
   function Locale_Pl return Wide_Wide_String is separate;
   function Locale_Cs return Wide_Wide_String is separate;
   function Locale_Tr return Wide_Wide_String is separate;
   function Locale_Ru return Wide_Wide_String is separate;
   function Locale_Uk return Wide_Wide_String is separate;
   function Locale_Ja return Wide_Wide_String is separate;
   function Locale_Ko return Wide_Wide_String is separate;
   function Locale_Zh return Wide_Wide_String is separate;
   function Locale_Ar return Wide_Wide_String is separate;
   function Locale_Hi return Wide_Wide_String is separate;
   function Locale_Ro return Wide_Wide_String is separate;
   function Locale_Lt return Wide_Wide_String is separate;
   function Locale_Sl return Wide_Wide_String is separate;
   function Locale_Id return Wide_Wide_String is separate;
   function Locale_Ms return Wide_Wide_String is separate;
   function Locale_Eo return Wide_Wide_String is separate;
   function Locale_Vi return Wide_Wide_String is separate;
   function Locale_Sw return Wide_Wide_String is separate;
   function Locale_Af return Wide_Wide_String is separate;
   function Locale_Hu return Wide_Wide_String is separate;
   function Locale_Sk return Wide_Wide_String is separate;
   --  Regional variants: Traditional Chinese whole, European Portuguese and
   --  Latin-American Spanish where they differ from pt and es.
   function Locale_Zh_Hant return Wide_Wide_String is separate;
   function Locale_Pt_Pt return Wide_Wide_String is separate;
   function Locale_Es_419 return Wide_Wide_String is separate;

   function Default_Catalog return String is
     (Ada.Strings.UTF_Encoding.Wide_Wide_Strings.Encode
        (Locale_En
           & Locale_Da
           & Locale_De
           & Locale_Fr
           & Locale_Es
           & Locale_It
           & Locale_Pt
           & Locale_Nl
           & Locale_Sv
           & Locale_No
           & Locale_Nb
           & Locale_Fi
           & Locale_Pl
           & Locale_Cs
           & Locale_Tr
           & Locale_Ru
           & Locale_Uk
           & Locale_Ja
           & Locale_Ko
           & Locale_Zh
           & Locale_Ar
           & Locale_Hi
           & Locale_Ro
           & Locale_Lt
           & Locale_Sl
           & Locale_Id
           & Locale_Ms
           & Locale_Eo
           & Locale_Vi
           & Locale_Sw
           & Locale_Af
           & Locale_Hu
           & Locale_Sk
           & Locale_Zh_Hant
           & Locale_Pt_Pt
           & Locale_Es_419));

   function Catalog_For (Language : String) return String is
      function Encode (Text : Wide_Wide_String) return String is
        (Ada.Strings.UTF_Encoding.Wide_Wide_Strings.Encode (Text));
   begin
      if Language in "en" | "" then
         return Encode (Locale_En);
      elsif Language = "da" then
         return Encode (Locale_Da);
      elsif Language = "de" then
         return Encode (Locale_De);
      elsif Language = "fr" then
         return Encode (Locale_Fr);
      elsif Language = "es" then
         return Encode (Locale_Es & Locale_Es_419);
      elsif Language = "it" then
         return Encode (Locale_It);
      elsif Language = "pt" then
         return Encode (Locale_Pt & Locale_Pt_Pt);
      elsif Language = "nl" then
         return Encode (Locale_Nl);
      elsif Language = "sv" then
         return Encode (Locale_Sv);
      elsif Language in "no" | "nb" then
         return Encode (Locale_No & Locale_Nb);
      elsif Language = "fi" then
         return Encode (Locale_Fi);
      elsif Language = "pl" then
         return Encode (Locale_Pl);
      elsif Language = "cs" then
         return Encode (Locale_Cs);
      elsif Language = "tr" then
         return Encode (Locale_Tr);
      elsif Language = "ru" then
         return Encode (Locale_Ru);
      elsif Language = "uk" then
         return Encode (Locale_Uk);
      elsif Language = "ja" then
         return Encode (Locale_Ja);
      elsif Language = "ko" then
         return Encode (Locale_Ko);
      elsif Language = "zh" then
         return Encode (Locale_Zh & Locale_Zh_Hant);
      elsif Language = "ar" then
         return Encode (Locale_Ar);
      elsif Language = "hi" then
         return Encode (Locale_Hi);
      elsif Language = "ro" then
         return Encode (Locale_Ro);
      elsif Language = "lt" then
         return Encode (Locale_Lt);
      elsif Language = "sl" then
         return Encode (Locale_Sl);
      elsif Language = "id" then
         return Encode (Locale_Id);
      elsif Language = "ms" then
         return Encode (Locale_Ms);
      elsif Language = "eo" then
         return Encode (Locale_Eo);
      elsif Language = "vi" then
         return Encode (Locale_Vi);
      elsif Language = "sw" then
         return Encode (Locale_Sw);
      elsif Language = "af" then
         return Encode (Locale_Af);
      elsif Language = "hu" then
         return Encode (Locale_Hu);
      elsif Language = "sk" then
         return Encode (Locale_Sk);
      else
         return "";
      end if;
   end Catalog_For;

end Humanize.Catalogs.Phrase_Data;
