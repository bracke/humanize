with Humanize.Bounded_Text;

package body Humanize.Parsing.Duration_Aliases is
   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;

   function B (Hex : String) return String
      renames Humanize.Bounded_Text.Hex_Bytes;

   function Generated_Duration_Seconds
     (Unit : String)
      return Long_Long_Integer
   is
      U : constant String := Clean_Lower (Unit);
   begin
      if U = B ("D0BCD0B8D0BDD183D182D18B")
        or else U = B ("D185D0B2D0B8D0BBD0B8D0BDD0B8")
        or else U = B ("E58886E9929F")
      then
         return 60;
      elsif U = B ("D187D0B0D181D0B0")
        or else U = B ("D0B3D0BED0B4D0B8D0BDD0B8")
        or else U = B ("E69982E99693")
        or else U = B ("E5B08FE697B6")
        or else U = B ("EC8B9CEAB084")
        or else U = B ("D8B3D8A7D8B9D8A7D8AA")
        or else U = B ("E0A498E0A482E0A49FE0A587")
      then
         return 3_600;
      elsif U = B ("D0B4D0BDD18F")
        or else U = B ("D0B4D0BDD196")
        or else U = B ("E5A4A9")
        or else U = B ("EC9DBC")
        or else U = B ("D8A3D98AD8A7D985")
        or else U = B ("E0A4A6E0A4BFE0A4A8")
      then
         return 86_400;
      elsif U = B ("D0BDD0B5D0B4D0B5D0BBD0B8")
        or else U = B ("D182D0B8D0B6D0BDD196")
        or else U = B ("E980B1")
        or else U = B ("E591A8")
        or else U = B ("ECA3BC")
        or else U = B ("D8A3D8B3D8A7D8A8D98AD8B9")
        or else U = B ("E0A4B8E0A4AAE0A58DE0A4A4E0A4BEE0A4B9")
      then
         return 7 * 86_400;
      elsif U = B ("D0BCD0B5D181D18FD186D0B0")
        or else U = B ("D0BCD196D181D18FD186D196")
        or else U = B ("E3818BE69C88")
        or else U = B ("E4B8AAE69C88")
        or else U = B ("EAB09CEC9B94")
        or else U = B ("D8A3D8B4D987D8B1")
        or else U = B ("E0A4AEE0A4B9E0A580E0A4A8E0A587")
      then
         return 30 * 86_400;
      elsif U = B ("D0B3D0BED0B4D0B0")
        or else U = B ("D180D0BED0BAD0B8")
        or else U = B ("E5B9B4")
        or else U = B ("EB8584")
        or else U = B ("D8B3D986D988D8A7D8AA")
        or else U = B ("E0A4B8E0A4BEE0A4B2")
      then
         return 365 * 86_400;
      else
         return 0;
      end if;
   end Generated_Duration_Seconds;
end Humanize.Parsing.Duration_Aliases;
