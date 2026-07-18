separate (Humanize.Strings.Support.Backend)
   function Is_Wide_Code_Point (Code : Natural) return Boolean is
   begin
      return
        (Code in 16#1100# .. 16#115F#)
        or else (Code in 16#2329# .. 16#232A#)
        or else (Code in 16#2E80# .. 16#A4CF#)
        or else (Code in 16#AC00# .. 16#D7A3#)
        or else (Code in 16#F900# .. 16#FAFF#)
        or else (Code in 16#FE10# .. 16#FE19#)
        or else (Code in 16#FE30# .. 16#FE6F#)
        or else (Code in 16#FF00# .. 16#FF60#)
        or else (Code in 16#FFE0# .. 16#FFE6#)
        or else (Code in 16#16FE0# .. 16#16FE4#)
        or else (Code in 16#17000# .. 16#187F7#)
        or else (Code in 16#18800# .. 16#18CD5#)
        or else (Code in 16#18D00# .. 16#18D08#)
        or else (Code in 16#1AFF0# .. 16#1AFFF#)
        or else (Code in 16#1B000# .. 16#1B122#)
        or else (Code in 16#1B132# .. 16#1B132#)
        or else (Code in 16#1B150# .. 16#1B152#)
        or else (Code in 16#1B155# .. 16#1B155#)
        or else (Code in 16#1B164# .. 16#1B167#)
        or else (Code in 16#1F200# .. 16#1F2FF#)
        or else (Code in 16#1F300# .. 16#1FAFF#)
        or else (Code in 16#20000# .. 16#3FFFD#);
   end Is_Wide_Code_Point;
