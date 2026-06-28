with Ada.Strings.Unbounded;
with I18N.Runtime;
with Humanize.Catalogs;

package body Humanize.Tests.Support is

   --  Library-level so 'Access satisfies the accessibility of Runtime_Access.
   Full_Runtime  : aliased I18N.Runtime.Instance;
   Empty_Runtime : aliased I18N.Runtime.Instance;
   Loaded        : Boolean := False;

   procedure Ensure_Loaded is
      Result : I18N.Runtime.Load_Result;
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

   function Empty return Humanize.Contexts.Context is
   begin
      return Humanize.Contexts.Create (Empty_Runtime'Access, "en");
   end Empty;

   function Text (Item : Humanize.Status.Text_Result) return String is
   begin
      return Ada.Strings.Unbounded.To_String (Item.Text);
   end Text;

end Humanize.Tests.Support;
