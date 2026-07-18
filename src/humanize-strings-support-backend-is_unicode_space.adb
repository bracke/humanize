separate (Humanize.Strings.Support.Backend)
   function Is_Unicode_Space (Code : Natural) return Boolean is
   begin
      return
        Code = 16#0009# or else Code = 16#000A# or else Code = 16#000B#
        or else Code = 16#000C# or else Code = 16#000D#
        or else Code = 16#0020# or else Code = 16#0085#
        or else Code = 16#00A0# or else Code = 16#1680#
        or else (Code in 16#2000# .. 16#200A#)
        or else Code = 16#2028# or else Code = 16#2029#
        or else Code = 16#202F# or else Code = 16#205F#
        or else Code = 16#3000#;
   end Is_Unicode_Space;
