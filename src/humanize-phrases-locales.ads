with Humanize.Bytes;
with Humanize.Contexts;
with Humanize.Datetimes;
with Humanize.Locales;
with Humanize.Numbers;
with Humanize.Status;

package Humanize.Phrases.Locales is

   function Phrase_Pack_Summary
     return Humanize.Status.Text_Result;

   function Phrase_Locales return Phrase_Locale_List;

   function Generated_Phrase_Locales return Generated_Phrase_Locale_List;

   function Is_Supported_Phrase_Locale (Locale : String) return Boolean;

   function Is_Generated_Phrase_Locale (Locale : String) return Boolean;

   function Supported_Phrase_Locales
     return Humanize.Status.Text_Result;

   procedure Supported_Phrase_Locales_Into
     (Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);

   procedure Phrase_Pack_Summary_Into
     (Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code);
end Humanize.Phrases.Locales;
