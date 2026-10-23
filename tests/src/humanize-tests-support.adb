with Messages.Runtime;
with Humanize.Bounded_Text;
with Humanize.Catalogs;

package body Humanize.Tests.Support is

   --  Library-level so 'Access satisfies the accessibility of Runtime_Access.
   Full_Runtime  : aliased Messages.Runtime.Instance;
   Empty_Runtime : aliased Messages.Runtime.Instance;
   Loaded        : Boolean := False;

   procedure Ensure_Loaded is
      Result : Messages.Runtime.Load_Result;
   begin
      if not Loaded then
         Humanize.Catalogs.Load_Defaults (Full_Runtime, Result);
         Loaded := True;
      end if;
   end Ensure_Loaded;

   function En return Humanize.Contexts.Context is
   begin
      Ensure_Loaded;
      return Humanize.Contexts.Create (Full_Runtime'Access, "en");
   end En;

   function Da return Humanize.Contexts.Context is
   begin
      Ensure_Loaded;
      return Humanize.Contexts.Create (Full_Runtime'Access, "da-DK");
   end Da;

   function De return Humanize.Contexts.Context is
   begin
      Ensure_Loaded;
      return Humanize.Contexts.Create (Full_Runtime'Access, "de");
   end De;

   function Fr return Humanize.Contexts.Context is
   begin
      Ensure_Loaded;
      return Humanize.Contexts.Create (Full_Runtime'Access, "fr");
   end Fr;

   function Es return Humanize.Contexts.Context is
   begin
      Ensure_Loaded;
      return Humanize.Contexts.Create (Full_Runtime'Access, "es");
   end Es;

   function It return Humanize.Contexts.Context is
   begin
      Ensure_Loaded;
      return Humanize.Contexts.Create (Full_Runtime'Access, "it");
   end It;

   function Pt return Humanize.Contexts.Context is
   begin
      Ensure_Loaded;
      return Humanize.Contexts.Create (Full_Runtime'Access, "pt");
   end Pt;

   function Nl return Humanize.Contexts.Context is
   begin
      Ensure_Loaded;
      return Humanize.Contexts.Create (Full_Runtime'Access, "nl");
   end Nl;

   function Locale (Name : String) return Humanize.Contexts.Context is
   begin
      Ensure_Loaded;
      return Humanize.Contexts.Create (Full_Runtime'Access, Name);
   end Locale;

   function Empty return Humanize.Contexts.Context is
   begin
      return Humanize.Contexts.Create (Empty_Runtime'Access, "en");
   end Empty;

   function Text (Item : Humanize.Status.Text_Result) return String is
   begin
      return Humanize.Bounded_Text.Result_Text (Item);
   end Text;

   function U (Code : Natural) return String is
   begin
      if Code <= 16#7F# then
         return String'(1 => Character'Val (Code));
      elsif Code <= 16#7FF# then
         return Character'Val (16#C0# + Code / 64)
           & Character'Val (16#80# + Code mod 64);
      elsif Code <= 16#FFFF# then
         return Character'Val (16#E0# + Code / 4_096)
           & Character'Val (16#80# + (Code / 64) mod 64)
           & Character'Val (16#80# + Code mod 64);
      else
         return Character'Val (16#F0# + Code / 262_144)
           & Character'Val (16#80# + (Code / 4_096) mod 64)
           & Character'Val (16#80# + (Code / 64) mod 64)
           & Character'Val (16#80# + Code mod 64);
      end if;
   end U;

end Humanize.Tests.Support;
