with Ada.Strings.Unbounded;
with Ada.Strings.UTF_Encoding.Wide_Wide_Strings;

package body Humanize.Catalogs.Phrase_Data is

   subtype Catalog_Text is Ada.Strings.Unbounded.Unbounded_String;

   --  Append one catalog line to Target: Locale's translation of the phrase
   --  Name, UTF-8 encoded.
   procedure Add (Target : in out Catalog_Text; Locale : String; Name, Template : Wide_Wide_String) is
   begin
      Ada.Strings.Unbounded.Append
        (Target,
         Locale & ".humanize.phrase." & Ada.Strings.UTF_Encoding.Wide_Wide_Strings.Encode (Name) & " = "
         & Ada.Strings.UTF_Encoding.Wide_Wide_Strings.Encode (Template) & ASCII.LF);
   end Add;

   --  English, as the formatters write it: for reading phrases back
   --  (Humanize.Parsing.Phrases); the formatters keep their own English.
   procedure Locale_En (Target : in out Catalog_Text) is separate;
   procedure Locale_Da (Target : in out Catalog_Text) is separate;
   procedure Locale_De (Target : in out Catalog_Text) is separate;
   procedure Locale_Fr (Target : in out Catalog_Text) is separate;
   procedure Locale_Es (Target : in out Catalog_Text) is separate;
   procedure Locale_It (Target : in out Catalog_Text) is separate;
   procedure Locale_Pt (Target : in out Catalog_Text) is separate;
   procedure Locale_Nl (Target : in out Catalog_Text) is separate;
   procedure Locale_Sv (Target : in out Catalog_Text) is separate;
   procedure Locale_No (Target : in out Catalog_Text) is separate;
   procedure Locale_Nb (Target : in out Catalog_Text) is separate;
   procedure Locale_Fi (Target : in out Catalog_Text) is separate;
   procedure Locale_Pl (Target : in out Catalog_Text) is separate;
   procedure Locale_Cs (Target : in out Catalog_Text) is separate;
   procedure Locale_Tr (Target : in out Catalog_Text) is separate;
   procedure Locale_Ru (Target : in out Catalog_Text) is separate;
   procedure Locale_Uk (Target : in out Catalog_Text) is separate;
   procedure Locale_Ja (Target : in out Catalog_Text) is separate;
   procedure Locale_Ko (Target : in out Catalog_Text) is separate;
   procedure Locale_Zh (Target : in out Catalog_Text) is separate;
   procedure Locale_Ar (Target : in out Catalog_Text) is separate;
   procedure Locale_Hi (Target : in out Catalog_Text) is separate;
   procedure Locale_Ro (Target : in out Catalog_Text) is separate;
   procedure Locale_Lt (Target : in out Catalog_Text) is separate;
   procedure Locale_Sl (Target : in out Catalog_Text) is separate;
   procedure Locale_Id (Target : in out Catalog_Text) is separate;
   procedure Locale_Ms (Target : in out Catalog_Text) is separate;
   procedure Locale_Eo (Target : in out Catalog_Text) is separate;
   procedure Locale_Vi (Target : in out Catalog_Text) is separate;
   procedure Locale_Sw (Target : in out Catalog_Text) is separate;
   procedure Locale_Af (Target : in out Catalog_Text) is separate;
   procedure Locale_Hu (Target : in out Catalog_Text) is separate;
   procedure Locale_Sk (Target : in out Catalog_Text) is separate;
   --  Regional variants: Traditional Chinese whole, European Portuguese and
   --  Latin-American Spanish where they differ from pt and es.
   procedure Locale_Zh_Hant (Target : in out Catalog_Text) is separate;
   procedure Locale_Pt_Pt (Target : in out Catalog_Text) is separate;
   procedure Locale_Es_419 (Target : in out Catalog_Text) is separate;
   --  Canadian French and Swiss and Liechtenstein German (ss for ß), where
   --  they differ.
   procedure Locale_Fr_Ca (Target : in out Catalog_Text) is separate;
   procedure Locale_De_Ch (Target : in out Catalog_Text) is separate;
   procedure Locale_De_Li (Target : in out Catalog_Text) is separate;
   --  International English (en-001), which en-GB, en-AU, en-IN and the
   --  other Commonwealth variants fall back to.
   procedure Locale_En_001 (Target : in out Catalog_Text) is separate;
   --  Canadian English (cancelled, like en-001, though CLDR's parent is en),
   --  Swiss and Belgian French, Hong Kong Traditional Chinese.
   procedure Locale_En_Ca (Target : in out Catalog_Text) is separate;
   procedure Locale_Fr_Ch (Target : in out Catalog_Text) is separate;
   procedure Locale_Fr_Be (Target : in out Catalog_Text) is separate;
   procedure Locale_Zh_Hant_Hk (Target : in out Catalog_Text) is separate;

   function Default_Catalog return String is
      Target : Catalog_Text;
   begin
      Locale_En (Target);
      Locale_Da (Target);
      Locale_De (Target);
      Locale_Fr (Target);
      Locale_Es (Target);
      Locale_It (Target);
      Locale_Pt (Target);
      Locale_Nl (Target);
      Locale_Sv (Target);
      Locale_No (Target);
      Locale_Nb (Target);
      Locale_Fi (Target);
      Locale_Pl (Target);
      Locale_Cs (Target);
      Locale_Tr (Target);
      Locale_Ru (Target);
      Locale_Uk (Target);
      Locale_Ja (Target);
      Locale_Ko (Target);
      Locale_Zh (Target);
      Locale_Ar (Target);
      Locale_Hi (Target);
      Locale_Ro (Target);
      Locale_Lt (Target);
      Locale_Sl (Target);
      Locale_Id (Target);
      Locale_Ms (Target);
      Locale_Eo (Target);
      Locale_Vi (Target);
      Locale_Sw (Target);
      Locale_Af (Target);
      Locale_Hu (Target);
      Locale_Sk (Target);
      Locale_Zh_Hant (Target);
      Locale_Pt_Pt (Target);
      Locale_Es_419 (Target);
      Locale_Fr_Ca (Target);
      Locale_De_Ch (Target);
      Locale_De_Li (Target);
      Locale_En_001 (Target);
      Locale_En_Ca (Target);
      Locale_Fr_Ch (Target);
      Locale_Fr_Be (Target);
      Locale_Zh_Hant_Hk (Target);
      return Ada.Strings.Unbounded.To_String (Target);
   end Default_Catalog;

   function Catalog_For (Language : String) return String is
      Target : Catalog_Text;
   begin
      if Language in "en" | "" then
         Locale_En (Target);
         Locale_En_001 (Target);
         Locale_En_Ca (Target);
      elsif Language = "da" then
         Locale_Da (Target);
      elsif Language = "de" then
         Locale_De (Target);
         Locale_De_Ch (Target);
         Locale_De_Li (Target);
      elsif Language = "fr" then
         Locale_Fr (Target);
         Locale_Fr_Ca (Target);
         Locale_Fr_Ch (Target);
         Locale_Fr_Be (Target);
      elsif Language = "es" then
         Locale_Es (Target);
         Locale_Es_419 (Target);
      elsif Language = "it" then
         Locale_It (Target);
      elsif Language = "pt" then
         Locale_Pt (Target);
         Locale_Pt_Pt (Target);
      elsif Language = "nl" then
         Locale_Nl (Target);
      elsif Language = "sv" then
         Locale_Sv (Target);
      elsif Language in "no" | "nb" then
         Locale_No (Target);
         Locale_Nb (Target);
      elsif Language = "fi" then
         Locale_Fi (Target);
      elsif Language = "pl" then
         Locale_Pl (Target);
      elsif Language = "cs" then
         Locale_Cs (Target);
      elsif Language = "tr" then
         Locale_Tr (Target);
      elsif Language = "ru" then
         Locale_Ru (Target);
      elsif Language = "uk" then
         Locale_Uk (Target);
      elsif Language = "ja" then
         Locale_Ja (Target);
      elsif Language = "ko" then
         Locale_Ko (Target);
      elsif Language = "zh" then
         Locale_Zh (Target);
         Locale_Zh_Hant (Target);
         Locale_Zh_Hant_Hk (Target);
      elsif Language = "ar" then
         Locale_Ar (Target);
      elsif Language = "hi" then
         Locale_Hi (Target);
      elsif Language = "ro" then
         Locale_Ro (Target);
      elsif Language = "lt" then
         Locale_Lt (Target);
      elsif Language = "sl" then
         Locale_Sl (Target);
      elsif Language = "id" then
         Locale_Id (Target);
      elsif Language = "ms" then
         Locale_Ms (Target);
      elsif Language = "eo" then
         Locale_Eo (Target);
      elsif Language = "vi" then
         Locale_Vi (Target);
      elsif Language = "sw" then
         Locale_Sw (Target);
      elsif Language = "af" then
         Locale_Af (Target);
      elsif Language = "hu" then
         Locale_Hu (Target);
      elsif Language = "sk" then
         Locale_Sk (Target);
      end if;
      return Ada.Strings.Unbounded.To_String (Target);
   end Catalog_For;

end Humanize.Catalogs.Phrase_Data;
