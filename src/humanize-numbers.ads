with Humanize.Contexts;
with Humanize.Status;

--  Ordinal and compact number humanization.
--
--  Ordinal renders "1st"/"2nd"/"3rd"/"4th" (English) or "1."/"2." (German,
--  Danish) using i18n selectordinal mechanics; Romance locales offer a feminine
--  form (French "1re", Spanish "1.a", Italian "1a"). Compact renders large
--  values as "1.2K"/"3.4M" with locale-specific suffixes and locale decimal
--  grouping. This package selects keys only and must not call I18N.Runtime
--  directly (HUM-INV-002).
package Humanize.Numbers is

   type Number_Options is record
      Maximum_Fraction_Digits : Natural range 0 .. 3 := 1;
      Suppress_Trailing_Zero  : Boolean := True;
   end record;

   Default_Number_Options : constant Number_Options :=
     (Maximum_Fraction_Digits => 1,
      Suppress_Trailing_Zero  => True);

   --  Grammatical gender for ordinals. Locales without an ordinal gender
   --  distinction (en/da/de) render both alike.
   type Ordinal_Gender is (Masculine, Feminine);

   --  Ordinal of a non-negative value (1 -> "1st" in English).
   function Ordinal
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Gender  : Ordinal_Gender := Masculine)
      return Humanize.Status.Text_Result;

   procedure Ordinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Gender  : Ordinal_Gender := Masculine);

   --  Compact magnitude rendering (1200 -> "1.2K"). Values below 1000 render
   --  as a plain decimal.
   function Compact
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Options : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result;

   procedure Compact_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Number_Options := Default_Number_Options);

end Humanize.Numbers;
