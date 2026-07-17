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
end Humanize.Parsing.Aliases;
