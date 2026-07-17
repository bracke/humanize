with Humanize.Bounded_Text;

package body Humanize.Catalogs.Encoding is
   function B (Hex : String) return String
      renames Humanize.Bounded_Text.Hex_Bytes;
end Humanize.Catalogs.Encoding;
