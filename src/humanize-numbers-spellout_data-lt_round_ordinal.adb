--  Lithuanian ordinals of a few round hundreds and thousands ("šimtasis",
--  "dvitūkstantasis"), where CLDR 48 leaves the stem bare ("šimt"); "" for
--  the others, which keep the numeric ordinal.
separate (Humanize.Numbers.Spellout_Data)
function Lt_Round_Ordinal (Value : Natural) return String is
begin
   case Value is
      when 100 =>
         return U (16#161#) & "imtasis";
      when 200 =>
         return "dvi" & U (16#161#) & "imtasis";
      when 300 =>
         return "tri" & U (16#161#) & "imtasis";
      when 1_000 =>
         return "t" & U (16#16B#) & "kstantasis";
      when 2_000 =>
         return "dvit" & U (16#16B#) & "kstantasis";
      when 3_000 =>
         return "trit" & U (16#16B#) & "kstantasis";
      when others => return "";
   end case;
end Lt_Round_Ordinal;
