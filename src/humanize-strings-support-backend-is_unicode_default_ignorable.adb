separate (Humanize.Strings.Support.Backend)
   function Is_Unicode_Default_Ignorable (Code : Natural) return Boolean is
   begin
      return
        Code = 16#00AD#
        or else Code = 16#034F#
        or else (Code in 16#061C# .. 16#061C#)
        or else (Code in 16#115F# .. 16#1160#)
        or else (Code in 16#17B4# .. 16#17B5#)
        or else (Code in 16#180B# .. 16#180F#)
        or else (Code in 16#200B# .. 16#200F#)
        or else (Code in 16#202A# .. 16#202E#)
        or else (Code in 16#2060# .. 16#206F#)
        or else (Code in 16#3164# .. 16#3164#)
        or else (Code in 16#FE00# .. 16#FE0F#)
        or else (Code in 16#FEFF# .. 16#FEFF#)
        or else (Code in 16#FFA0# .. 16#FFA0#)
        or else (Code in 16#FFF0# .. 16#FFF8#)
        or else (Code in 16#1BCA0# .. 16#1BCA3#)
        or else (Code in 16#1D173# .. 16#1D17A#)
        or else (Code in 16#E0000# .. 16#E0FFF#);
   end Is_Unicode_Default_Ignorable;
