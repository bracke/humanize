with Humanize.Bounded_Text;

package body Humanize.Locales is

   --  Provenance: Humanize-owned shipped locale inventory. This is the source
   --  of truth for locale coverage audits and catalog fallback metadata.

   En_Locale : aliased constant String := "en";
   Da_Locale : aliased constant String := "da";
   De_Locale : aliased constant String := "de";
   Fr_Locale : aliased constant String := "fr";
   Es_Locale : aliased constant String := "es";
   It_Locale : aliased constant String := "it";
   Pt_Locale : aliased constant String := "pt";
   Nl_Locale : aliased constant String := "nl";
   Sv_Locale : aliased constant String := "sv";
   No_Locale : aliased constant String := "no";
   Nb_Locale : aliased constant String := "nb";
   Fi_Locale : aliased constant String := "fi";
   Pl_Locale : aliased constant String := "pl";
   Cs_Locale : aliased constant String := "cs";
   Tr_Locale : aliased constant String := "tr";
   Ru_Locale : aliased constant String := "ru";
   Uk_Locale : aliased constant String := "uk";
   Ja_Locale : aliased constant String := "ja";
   Ko_Locale : aliased constant String := "ko";
   Zh_Locale : aliased constant String := "zh";
   Ar_Locale : aliased constant String := "ar";
   Hi_Locale : aliased constant String := "hi";
   Ro_Locale : aliased constant String := "ro";
   Lt_Locale : aliased constant String := "lt";
   Sl_Locale : aliased constant String := "sl";
   Id_Locale : aliased constant String := "id";
   Ms_Locale : aliased constant String := "ms";
   Eo_Locale : aliased constant String := "eo";
   Vi_Locale : aliased constant String := "vi";
   Sw_Locale : aliased constant String := "sw";
   Af_Locale : aliased constant String := "af";
   Hu_Locale : aliased constant String := "hu";
   Sk_Locale : aliased constant String := "sk";

   Sv_SE_Locale : aliased constant String := "sv-SE";
   Nb_NO_Locale : aliased constant String := "nb-NO";
   Ja_JP_Locale : aliased constant String := "ja-JP";
   Ar_EG_Locale : aliased constant String := "ar-EG";

   Shipped_Locale_Codes : constant Shipped_Locale_List :=
     [En_Locale'Access,
      Da_Locale'Access,
      De_Locale'Access,
      Fr_Locale'Access,
      Es_Locale'Access,
      It_Locale'Access,
      Pt_Locale'Access,
      Nl_Locale'Access,
      Sv_Locale'Access,
      No_Locale'Access,
      Nb_Locale'Access,
      Fi_Locale'Access,
      Pl_Locale'Access,
      Cs_Locale'Access,
      Tr_Locale'Access,
      Ru_Locale'Access,
      Uk_Locale'Access,
      Ja_Locale'Access,
      Ko_Locale'Access,
      Zh_Locale'Access,
      Ar_Locale'Access,
      Hi_Locale'Access,
      Ro_Locale'Access,
      Lt_Locale'Access,
      Sl_Locale'Access,
      Id_Locale'Access,
      Ms_Locale'Access,
      Eo_Locale'Access,
      Vi_Locale'Access,
      Sw_Locale'Access,
      Af_Locale'Access,
      Hu_Locale'Access,
      Sk_Locale'Access];

   Regional_Locale_Codes : constant Regional_Locale_List :=
     [Sv_SE_Locale'Access,
      Nb_NO_Locale'Access,
      Ja_JP_Locale'Access,
      Ar_EG_Locale'Access];

   All_Shipped_Locale_Codes : constant All_Shipped_Locale_List :=
     Shipped_Locale_Codes & Regional_Locale_Codes;

   function Lower (Text : String) return String
      renames Humanize.Bounded_Text.Lower_Text;

   function Shipped_Locales return Shipped_Locale_List is
   begin
      return Shipped_Locale_Codes;
   end Shipped_Locales;

   function Regional_Shipped_Locales return Regional_Locale_List is
   begin
      return Regional_Locale_Codes;
   end Regional_Shipped_Locales;

   function All_Shipped_Locales return All_Shipped_Locale_List is
   begin
      return All_Shipped_Locale_Codes;
   end All_Shipped_Locales;

   function Canonical_Base_Shipped_Locale (Locale : String) return String is
      Language : constant String := Language_Code (Locale);
   begin
      if Locale'Length /= Language'Length then
         return "";
      end if;

      for Candidate of Shipped_Locale_Codes loop
         if Language = Candidate.all then
            return Candidate.all;
         end if;
      end loop;

      return "";
   end Canonical_Base_Shipped_Locale;

   function Canonical_Regional_Shipped_Locale (Locale : String) return String is
      Language : constant String := Language_Code (Locale);
      Region   : constant String := Region_Code (Locale);
   begin
      if Region = "" then
         return "";
      end if;

      for Candidate of Regional_Locale_Codes loop
         if Language_Code (Candidate.all) = Language
           and then Region_Code (Candidate.all) = Region
         then
            return Candidate.all;
         end if;
      end loop;

      return "";
   end Canonical_Regional_Shipped_Locale;

   function Is_Base_Shipped_Locale (Locale : String) return Boolean is
     (Canonical_Base_Shipped_Locale (Locale) /= "");

   function Is_Regional_Shipped_Locale (Locale : String) return Boolean is
     (Canonical_Regional_Shipped_Locale (Locale) /= "");

   function Is_Shipped_Locale (Locale : String) return Boolean is
     (Canonical_Shipped_Locale (Locale) /= "");

   function Canonical_Shipped_Locale (Locale : String) return String is
      Base : constant String := Canonical_Base_Shipped_Locale (Locale);
   begin
      if Base /= "" then
         return Base;
      end if;

      return Canonical_Regional_Shipped_Locale (Locale);
   end Canonical_Shipped_Locale;

   function Base_Locale (Locale : String) return String is
   begin
      return Language_Code (Locale);
   end Base_Locale;

   function Locale_Prefix (Locale : String) return String is
   begin
      if Locale'Length >= 2 then
         return Lower (Locale (Locale'First .. Locale'First + 1));
      else
         return Lower (Locale);
      end if;
   end Locale_Prefix;

   function Language_Code (Locale : String) return String is
      Last : Natural := Locale'Last;
   begin
      for Index in Locale'Range loop
         if Locale (Index) = '-' or else Locale (Index) = '_' then
            Last := Index - 1;
            exit;
         end if;
      end loop;

      return Lower (Locale (Locale'First .. Last));
   end Language_Code;

   function Region_Code (Locale : String) return String is
      First : Natural := Locale'Last + 1;
      Last  : Natural := Locale'Last;
   begin
      for Index in Locale'Range loop
         if Locale (Index) = '-' or else Locale (Index) = '_' then
            First := Index + 1;
            exit;
         end if;
      end loop;

      if First > Locale'Last then
         return "";
      end if;

      for Index in First .. Locale'Last loop
         if Locale (Index) = '-' or else Locale (Index) = '_' then
            Last := Index - 1;
            exit;
         end if;
      end loop;

      return Lower (Locale (First .. Last));
   end Region_Code;

   function Is_Norwegian (Locale : String) return Boolean is
      Language : constant String := Language_Code (Locale);
   begin
      return Language = "no" or else Language = "nb";
   end Is_Norwegian;

   function Is_CJK (Locale : String) return Boolean is
      Language : constant String := Language_Code (Locale);
   begin
      return Language = "ja" or else Language = "ko" or else Language = "zh";
   end Is_CJK;

end Humanize.Locales;
