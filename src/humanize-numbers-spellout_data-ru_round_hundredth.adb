--  Russian ordinals of 200 .. 900: CLDR 48's ordinal rules give the cardinal
--  ("триста" for the 300th), as ICU does.
separate (Humanize.Numbers.Spellout_Data)
function Ru_Round_Hundredth (Hundreds : Positive) return String is
begin
   case Hundreds is
      when 2 =>
         return U (16#434#) & U (16#432#) & U (16#443#) & U (16#445#) & U (16#441#) & U (16#43E#)
           & U (16#442#) & U (16#44B#) & U (16#439#);
      when 3 =>
         return U (16#442#) & U (16#440#) & U (16#435#) & U (16#445#) & U (16#441#) & U (16#43E#)
           & U (16#442#) & U (16#44B#) & U (16#439#);
      when 4 =>
         return U (16#447#) & U (16#435#) & U (16#442#) & U (16#44B#) & U (16#440#) & U (16#435#)
           & U (16#445#) & U (16#441#) & U (16#43E#) & U (16#442#) & U (16#44B#) & U (16#439#);
      when 5 =>
         return U (16#43F#) & U (16#44F#) & U (16#442#) & U (16#438#) & U (16#441#) & U (16#43E#)
           & U (16#442#) & U (16#44B#) & U (16#439#);
      when 6 =>
         return U (16#448#) & U (16#435#) & U (16#441#) & U (16#442#) & U (16#438#) & U (16#441#)
           & U (16#43E#) & U (16#442#) & U (16#44B#) & U (16#439#);
      when 7 =>
         return U (16#441#) & U (16#435#) & U (16#43C#) & U (16#438#) & U (16#441#) & U (16#43E#)
           & U (16#442#) & U (16#44B#) & U (16#439#);
      when 8 =>
         return U (16#432#) & U (16#43E#) & U (16#441#) & U (16#44C#) & U (16#43C#) & U (16#438#)
           & U (16#441#) & U (16#43E#) & U (16#442#) & U (16#44B#) & U (16#439#);
      when 9 =>
         return U (16#434#) & U (16#435#) & U (16#432#) & U (16#44F#) & U (16#442#) & U (16#438#)
           & U (16#441#) & U (16#43E#) & U (16#442#) & U (16#44B#) & U (16#439#);
      when others => return "";
   end case;
end Ru_Round_Hundredth;
