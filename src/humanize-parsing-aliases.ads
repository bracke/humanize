private package Humanize.Parsing.Aliases is
   Alias_Separator : constant String := [1 => ASCII.LF];

   function Has_Alias
     (Item    : String;
      Aliases : String)
      return Boolean;
   function Alias_Prefix_Length
     (Item    : String;
      Aliases : String)
      return Natural;

   --  Decode a "#"-prefixed hex alias segment to its raw byte string, the same
   --  way Has_Alias matches it. Returns "" for a segment that is not a valid
   --  even-length "#"-hex payload. Used to build lookup indexes from the same
   --  alias data the linear matcher consumes.
   function Decode_Hex_Alias (Segment : String) return String;
end Humanize.Parsing.Aliases;
