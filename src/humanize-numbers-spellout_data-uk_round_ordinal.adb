--  Ukrainian ordinals of round hundreds, thousands and millions: the
--  multiplier's genitive stem glued onto the ordinal ("двохсотий",
--  "п’ятитисячний", "двадцятидвохтисячний", "двохмільйонний"); "" for every
--  other value.
separate (Humanize.Numbers.Spellout_Data)
function Uk_Round_Ordinal (Value : Natural) return String is
   --  The genitive stem of a round multiplier; "" for 1, "-" where there is none.
   function Stem (Count : Natural) return String is
   begin
      case Count is
         when 1 => return "";
         when 2 => return U (16#434#) & U (16#432#) & U (16#43E#) & U (16#445#);
         when 3 => return U (16#442#) & U (16#440#) & U (16#44C#) & U (16#43E#) & U (16#445#);
         when 4 =>
            return U (16#447#) & U (16#43E#) & U (16#442#) & U (16#438#) & U (16#440#) & U (16#44C#) & U (16#43E#)
              & U (16#445#);
         when 5 => return U (16#43F#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#438#);
         when 6 => return U (16#448#) & U (16#435#) & U (16#441#) & U (16#442#) & U (16#438#);
         when 7 => return U (16#441#) & U (16#435#) & U (16#43C#) & U (16#438#);
         when 8 => return U (16#432#) & U (16#43E#) & U (16#441#) & U (16#44C#) & U (16#43C#) & U (16#438#);
         when 9 =>
            return U (16#434#) & U (16#435#) & U (16#432#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#438#);
         when 10 => return U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#) & U (16#442#) & U (16#438#);
         when 11 =>
            return U (16#43E#) & U (16#434#) & U (16#438#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#)
              & U (16#44F#) & U (16#442#) & U (16#438#);
         when 12 =>
            return U (16#434#) & U (16#432#) & U (16#430#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#)
              & U (16#44F#) & U (16#442#) & U (16#438#);
         when 13 =>
            return U (16#442#) & U (16#440#) & U (16#438#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#)
              & U (16#44F#) & U (16#442#) & U (16#438#);
         when 14 =>
            return U (16#447#) & U (16#43E#) & U (16#442#) & U (16#438#) & U (16#440#) & U (16#43D#) & U (16#430#)
              & U (16#434#) & U (16#446#) & U (16#44F#) & U (16#442#) & U (16#438#);
         when 15 =>
            return U (16#43F#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#43D#) & U (16#430#) & U (16#434#)
              & U (16#446#) & U (16#44F#) & U (16#442#) & U (16#438#);
         when 16 =>
            return U (16#448#) & U (16#456#) & U (16#441#) & U (16#442#) & U (16#43D#) & U (16#430#) & U (16#434#)
              & U (16#446#) & U (16#44F#) & U (16#442#) & U (16#438#);
         when 17 =>
            return U (16#441#) & U (16#456#) & U (16#43C#) & U (16#43D#) & U (16#430#) & U (16#434#) & U (16#446#)
              & U (16#44F#) & U (16#442#) & U (16#438#);
         when 18 =>
            return U (16#432#) & U (16#456#) & U (16#441#) & U (16#456#) & U (16#43C#) & U (16#43D#) & U (16#430#)
              & U (16#434#) & U (16#446#) & U (16#44F#) & U (16#442#) & U (16#438#);
         when 19 =>
            return U (16#434#) & U (16#435#) & U (16#432#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#43D#)
              & U (16#430#) & U (16#434#) & U (16#446#) & U (16#44F#) & U (16#442#) & U (16#438#);
         when 20 =>
            return U (16#434#) & U (16#432#) & U (16#430#) & U (16#434#) & U (16#446#) & U (16#44F#) & U (16#442#)
              & U (16#438#);
         when 30 =>
            return U (16#442#) & U (16#440#) & U (16#438#) & U (16#434#) & U (16#446#) & U (16#44F#) & U (16#442#)
              & U (16#438#);
         when 40 => return U (16#441#) & U (16#43E#) & U (16#440#) & U (16#43E#) & U (16#43A#) & U (16#430#);
         when 50 =>
            return U (16#43F#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#434#) & U (16#435#) & U (16#441#)
              & U (16#44F#) & U (16#442#) & U (16#438#);
         when 60 =>
            return U (16#448#) & U (16#456#) & U (16#441#) & U (16#442#) & U (16#434#) & U (16#435#) & U (16#441#)
              & U (16#44F#) & U (16#442#) & U (16#438#);
         when 70 =>
            return U (16#441#) & U (16#456#) & U (16#43C#) & U (16#434#) & U (16#435#) & U (16#441#) & U (16#44F#)
              & U (16#442#) & U (16#438#);
         when 80 =>
            return U (16#432#) & U (16#456#) & U (16#441#) & U (16#456#) & U (16#43C#) & U (16#434#) & U (16#435#)
              & U (16#441#) & U (16#44F#) & U (16#442#) & U (16#438#);
         when 90 =>
            return U (16#434#) & U (16#435#) & U (16#432#) & U (16#2019#) & U (16#44F#) & U (16#43D#) & U (16#43E#)
              & U (16#441#) & U (16#442#) & U (16#430#);
         when 100 => return U (16#441#) & U (16#442#) & U (16#43E#);
         when 200 =>
            return U (16#434#) & U (16#432#) & U (16#43E#) & U (16#445#) & U (16#441#) & U (16#43E#) & U (16#442#);
         when 300 =>
            return U (16#442#) & U (16#440#) & U (16#44C#) & U (16#43E#) & U (16#445#) & U (16#441#) & U (16#43E#)
              & U (16#442#);
         when 400 =>
            return U (16#447#) & U (16#43E#) & U (16#442#) & U (16#438#) & U (16#440#) & U (16#44C#) & U (16#43E#)
              & U (16#445#) & U (16#441#) & U (16#43E#) & U (16#442#);
         when 500 =>
            return U (16#43F#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#438#) & U (16#441#) & U (16#43E#)
              & U (16#442#);
         when 600 =>
            return U (16#448#) & U (16#435#) & U (16#441#) & U (16#442#) & U (16#438#) & U (16#441#) & U (16#43E#)
              & U (16#442#);
         when 700 =>
            return U (16#441#) & U (16#435#) & U (16#43C#) & U (16#438#) & U (16#441#) & U (16#43E#) & U (16#442#);
         when 800 =>
            return U (16#432#) & U (16#43E#) & U (16#441#) & U (16#44C#) & U (16#43C#) & U (16#438#) & U (16#441#)
              & U (16#43E#) & U (16#442#);
         when 900 =>
            return U (16#434#) & U (16#435#) & U (16#432#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#438#)
              & U (16#441#) & U (16#43E#) & U (16#442#);
         when others => return "-";
      end case;
   end Stem;

   --  The ordinal of 100 .. 900.
   function Hundredth (Count : Positive) return String is
   begin
      case Count is
         when 1 => return U (16#441#) & U (16#43E#) & U (16#442#) & U (16#438#) & U (16#439#);
         when 2 =>
            return U (16#434#) & U (16#432#) & U (16#43E#) & U (16#445#) & U (16#441#) & U (16#43E#) & U (16#442#)
              & U (16#438#) & U (16#439#);
         when 3 =>
            return U (16#442#) & U (16#440#) & U (16#44C#) & U (16#43E#) & U (16#445#) & U (16#441#) & U (16#43E#)
              & U (16#442#) & U (16#438#) & U (16#439#);
         when 4 =>
            return U (16#447#) & U (16#43E#) & U (16#442#) & U (16#438#) & U (16#440#) & U (16#44C#) & U (16#43E#)
              & U (16#445#) & U (16#441#) & U (16#43E#) & U (16#442#) & U (16#438#) & U (16#439#);
         when 5 =>
            return U (16#43F#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#438#) & U (16#441#) & U (16#43E#)
              & U (16#442#) & U (16#438#) & U (16#439#);
         when 6 =>
            return U (16#448#) & U (16#435#) & U (16#441#) & U (16#442#) & U (16#438#) & U (16#441#) & U (16#43E#)
              & U (16#442#) & U (16#438#) & U (16#439#);
         when 7 =>
            return U (16#441#) & U (16#435#) & U (16#43C#) & U (16#438#) & U (16#441#) & U (16#43E#) & U (16#442#)
              & U (16#438#) & U (16#439#);
         when 8 =>
            return U (16#432#) & U (16#43E#) & U (16#441#) & U (16#44C#) & U (16#43C#) & U (16#438#) & U (16#441#)
              & U (16#43E#) & U (16#442#) & U (16#438#) & U (16#439#);
         when 9 =>
            return U (16#434#) & U (16#435#) & U (16#432#) & U (16#2019#) & U (16#44F#) & U (16#442#) & U (16#438#)
              & U (16#441#) & U (16#43E#) & U (16#442#) & U (16#438#) & U (16#439#);
         when others => return "";
      end case;
   end Hundredth;

   Thousandth : constant String :=
     U (16#442#) & U (16#438#) & U (16#441#) & U (16#44F#) & U (16#447#) & U (16#43D#) & U (16#438#) & U (16#439#);

   Millionth : constant String :=
     U (16#43C#) & U (16#456#) & U (16#43B#) & U (16#44C#) & U (16#439#) & U (16#43E#) & U (16#43D#) & U (16#43D#) & U (16#438#) & U (16#439#);

   --  The stem of any multiplier below 1000, the stems of its parts glued
   --  ("двадцяти" "двох" for 22), a trailing one as "одно"; "-" where a part
   --  has none.
   function Compound (Count : Natural) return String is
      Hundreds : constant Natural := Count / 100 * 100;
      Rest     : constant Natural := Count mod 100;
      Tens     : constant Natural := (if Rest >= 20 then Rest / 10 * 10 else 0);
      Units    : constant Natural := (if Rest >= 20 then Rest mod 10 else Rest);
      Parts    : constant String :=
        (if Hundreds > 0 then Stem (Hundreds) else "") & (if Tens > 0 then Stem (Tens) else "")
        & (if Units = 1 and then Count > 1 then U (16#43E#) & U (16#434#) & U (16#43D#) & U (16#43E#) elsif Units > 0 then Stem (Units) else "");
   begin
      if Stem (Count) /= "-" then
         return Stem (Count);
      elsif Count >= 1_000 or else (for some C of Parts => C = '-') then
         return "-";
      else
         return Parts;
      end if;
   end Compound;

   function Joined (Prefix, Word : String) return String is
     (if Prefix = "-" then "" else Prefix & Word);
begin
   if Value = 0 or else Value mod 100 /= 0 then
      return "";
   elsif Value < 1_000 then
      return Hundredth (Value / 100);
   elsif Value mod 1_000 /= 0 then
      return "";
   elsif Value < 1_000_000 then
      return Joined (Compound (Value / 1_000), Thousandth);
   elsif Value mod 1_000_000 = 0 and then Value / 1_000_000 <= 999 then
      return Joined (Compound (Value / 1_000_000), Millionth);
   else
      return "";
   end if;
end Uk_Round_Ordinal;
