private package Humanize.Catalogs.Encoding is

   AA     : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A5#);
   AACUTE : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A1#);
   ATILDE : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A3#);
   ECIRC  : constant String :=
     Character'Val (16#C3#) & Character'Val (16#AA#);
   EGRAVE : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A8#);
   FEMORD : constant String :=
     Character'Val (16#C2#) & Character'Val (16#AA#);
   IACUTE : constant String :=
     Character'Val (16#C3#) & Character'Val (16#AD#);
   NTILDE : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B1#);
   OACUTE : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B3#);
   ORDM   : constant String :=
     Character'Val (16#C2#) & Character'Val (16#BA#);
   OTILDE : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B5#);

   function B (Hex : String) return String;
end Humanize.Catalogs.Encoding;
