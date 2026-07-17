with Humanize.Phrases.Support;

package body Humanize.Phrases.Locales is
   --  Provenance: delegates to Humanize.Phrases.Support locale metadata so
   --  phrase support follows the Humanize-owned locale inventory boundary.

   package Shared renames Humanize.Phrases.Support;

   function Phrase_Pack_Summary
     return Humanize.Status.Text_Result renames Shared.Phrase_Pack_Summary;

   function Phrase_Locales return Phrase_Locale_List renames Shared.Phrase_Locales;

   function Generated_Phrase_Locales return Generated_Phrase_Locale_List renames Shared.Generated_Phrase_Locales;

   function Is_Supported_Phrase_Locale (Locale : String) return Boolean renames Shared.Is_Supported_Phrase_Locale;

   function Is_Generated_Phrase_Locale (Locale : String) return Boolean renames Shared.Is_Generated_Phrase_Locale;

   function Supported_Phrase_Locales
     return Humanize.Status.Text_Result renames Shared.Supported_Phrase_Locales;

   procedure Supported_Phrase_Locales_Into
     (Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Supported_Phrase_Locales_Into;

   procedure Phrase_Pack_Summary_Into
     (Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code) renames Shared.Phrase_Pack_Summary_Into;
end Humanize.Phrases.Locales;
