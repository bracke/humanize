--  Locale lists and lookup helpers for the locale data shipped with
--  Humanize.
package Humanize.Locales is

   type Locale_Code_Access is access constant String;
   --  Access value for a static locale code string.

   type Locale_Code_Array is array (Positive range <>) of Locale_Code_Access;
   --  Ordered list of locale code access values.

   Shipped_Locale_Count : constant Positive := 33;

   Regional_Shipped_Locale_Count : constant Positive := 4;

   All_Shipped_Locale_Count : constant Positive :=
     Shipped_Locale_Count + Regional_Shipped_Locale_Count;

   subtype Shipped_Locale_List is Locale_Code_Array (1 .. Shipped_Locale_Count);

   subtype Regional_Locale_List is
     Locale_Code_Array (1 .. Regional_Shipped_Locale_Count);

   subtype All_Shipped_Locale_List is
     Locale_Code_Array (1 .. All_Shipped_Locale_Count);

   function Shipped_Locales return Shipped_Locale_List;
   --  @return Array of access values for shipped base locale tags.

   function Regional_Shipped_Locales return Regional_Locale_List;
   --  @return Array of access values for shipped regional locale tags.

   function All_Shipped_Locales return All_Shipped_Locale_List;
   --  @return Array of access values for every shipped locale tag.

   function Is_Base_Shipped_Locale (Locale : String) return Boolean;
   --  @param Locale Locale tag or locale-like string.
   --  @return True when Locale names a shipped base locale.

   function Is_Regional_Shipped_Locale (Locale : String) return Boolean;
   --  @param Locale Locale tag or locale-like string.
   --  @return True when Locale names a shipped regional fallback alias.

   function Is_Shipped_Locale (Locale : String) return Boolean;
   --  @param Locale Locale tag or locale-like string.
   --  @return True when Locale names any shipped base or regional locale tag.

   function Canonical_Shipped_Locale (Locale : String) return String;
   --  @param Locale Locale tag or locale-like string.
   --  @return Canonical shipped tag, or "" when Locale is not shipped.

   function Base_Locale (Locale : String) return String;
   --  @param Locale Base or regional locale tag.
   --  @return Lowercase locale prefix before the first '-' or '_' separator.

   function Locale_Prefix (Locale : String) return String;
   --  @param Locale Locale tag or locale-like string.
   --  @return Lowercase first two characters when present, otherwise Locale lowercased.

   function Language_Code (Locale : String) return String;
   --  @param Locale Locale tag or locale-like string.
   --  @return Lowercase language subtag before '-' or '_'.

   function Region_Code (Locale : String) return String;
   --  @param Locale Locale tag or locale-like string.
   --  @return Lowercase region subtag after the first '-' or '_', or "".

   function Is_Norwegian (Locale : String) return Boolean;
   --  @param Locale Locale tag or locale-like string.
   --  @return True for Norwegian language tags treated alike by humanizers.

   function Is_CJK (Locale : String) return Boolean;
   --  @param Locale Locale tag or locale-like string.
   --  @return True for Chinese, Japanese, and Korean language tags.

end Humanize.Locales;
