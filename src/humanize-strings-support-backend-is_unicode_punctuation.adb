separate (Humanize.Strings.Support.Backend)
   function Is_Unicode_Punctuation (Code : Natural) return Boolean is
   begin
      return
        (Code in 16#0021# .. 16#002F#)
        or else (Code in 16#003A# .. 16#0040#)
        or else (Code in 16#005B# .. 16#0060#)
        or else (Code in 16#007B# .. 16#007E#)
        or else Code = 16#00A1# or else Code = 16#00A7#
        or else Code = 16#00AB# or else Code = 16#00B6#
        or else Code = 16#00B7# or else Code = 16#00BB#
        or else Code = 16#00BF# or else Code = 16#037E#
        or else Code = 16#0387# or else Code = 16#05BE#
        or else Code = 16#05C0# or else Code = 16#05C3#
        or else Code = 16#05C6# or else Code = 16#060C#
        or else Code = 16#061B# or else Code = 16#061F#
        or else Code = 16#06D4#
        or else (Code in 16#2000# .. 16#206F#)
        or else (Code in 16#3000# .. 16#303F#)
        or else (Code in 16#FE10# .. 16#FE1F#)
        or else (Code in 16#FE30# .. 16#FE6F#)
        or else (Code in 16#FF01# .. 16#FF0F#)
        or else (Code in 16#FF1A# .. 16#FF20#)
        or else (Code in 16#FF3B# .. 16#FF40#)
        or else (Code in 16#FF5B# .. 16#FF65#);
   end Is_Unicode_Punctuation;
