separate (Humanize.Strings.Support.Backend)
   function Is_Unicode_Combining_Mark (Code : Natural) return Boolean is
   begin
      return
        (Code in 16#0300# .. 16#036F#)
        or else (Code in 16#1AB0# .. 16#1AFF#)
        or else (Code in 16#1DC0# .. 16#1DFF#)
        or else (Code in 16#20D0# .. 16#20FF#)
        or else (Code in 16#FE20# .. 16#FE2F#);
   end Is_Unicode_Combining_Mark;
