separate (Humanize.Parsing.Implementation.Number_Text_Helpers)
function Compact_Multiplier (Unit : String) return Long_Float is
      Raw : constant String := Trim (Unit);
      U : constant String := Clean_Lower (Unit);
begin
      if U = "" then
         return 1.0;
      elsif Raw = "T" then
         return 1_000_000_000_000.0;
      elsif U = "k" or else U = "t" or else U = "tn" or else U = "thousand"
        or else U = "tusind"
        or else U = "tausend" or else U = "tsd" or else U = "tsd."
        or else U = "mil" or else U = "mille" or else U = "mila"
        or else U = "tusen" or else U = "tuhat"
        or else U = "tysiac" or else U = "tys."
        or else U = "tisic" or else U = "tis." or else U = "bin"
        or else U = "mii" or else U = B ("C5AB6B7374")
        or else U = B ("74C5AB6B7374616E746973")
        or else U = "ribu" or else U = "rb"
        or else U = "nghin" or else U = "elfu"
        or else U = "duisend" or else U = "ezer"
        or else U = "e"
        or else U = B ("D182D18BD181D18FD187D0B0")
        or else U = B ("D182D18BD181D18FD187D0B8")
        or else U = B ("D182D18BD1812E")
        or else U = B ("D182D18BD181D18FD187D0B0")
        or else U = B ("D182D18BD181D18FD187D196")
        or else U = B ("D182D0B8D1812E")
        or else U = B ("E58D83")
        or else U = B ("ECB29C")
        or else U = B ("D8A3D984D981")
        or else U = B ("E0A4B9E0A49CE0A4BEE0A4B0")
        or else U = B ("E0A4B9E0A49CE0A4BCE0A4BEE0A4B0")
      then
         return 1_000.0;
      elsif U = "m" or else U = "million" or else U = "millions"
        or else U = "mio." or else U = "mio"
        or else U = "mill."
        or else U = "milj."
        or else U = "mil."
        or else U = "mln" or else U = "mln."
        or else U = "mi"
        or else U = "mn"
        or else U = "millionen" or else U = "millones"
        or else U = "milione" or else U = "milioni"
        or else U = "milhao" or else U = "milhoes"
        or else U = B ("6D696C68C3A36F")
        or else U = B ("6D696C68C3B56573")
        or else U = "miljoen" or else U = "miljoner"
        or else U = "miljoona" or else U = "miliony"
        or else U = "milion" or else U = "milyon"
        or else U = "milioane" or else U = "milijonas"
        or else U = "milijon" or else U = "juta"
        or else U = "jt" or else U = "trieu" or else U = "tr"
        or else U = "milioni" or else U = "miljoen"
        or else U = "millio"
        or else U = B ("D0BCD0B8D0BBD0BBD0B8D0BED0BD")
        or else U = B ("D0BCD0B8D0BBD0BBD0B8D0BED0BDD0B0")
        or else U = B ("D0BCD0BBD0BD")
        or else U = B ("D0BCD196D0BBD18CD0B9D0BED0BD")
        or else U = B ("E4B887")
        or else U = B ("E799BEE4B887")
        or else U = B ("E799BE4B887")
        or else U = B ("EBB0B1EBA78C")
        or else U = B ("D985D984D98AD988D986")
      then
         return 1_000_000.0;
      elsif U = "b" or else U = "billion" or else U = "milliard"
        or else U = "milliarde" or else U = "milliarden"
        or else U = "mil millones" or else U = "miliardo"
        or else U = "miliardi" or else U = "bilhao"
        or else U = "bilhoes"
        or else U = B ("62696C68C3A36F")
        or else U = B ("62696C68C3B56573")
        or else U = "miljard" or else U = "miljardi"
        or else U = "miliard" or else U = "milyar"
        or else U = "mld" or else U = "mld."
        or else U = "mlrd." or else U = "miliarde"
        or else U = "milijardas" or else U = "milijarda"
        or else U = "miliar"
        or else U = "bilioni" or else U = "milliard"
        or else U = B ("D0BCD0B8D0BBD0BBD0B8D0B0D180D0B4")
        or else U = B ("D0BCD196D0BBD18CD18FD180D0B4")
        or else U = B ("E58D81E58484")
        or else U = B ("EC8BACEC96B5")
        or else U = B ("D985D984D98AD8A7D8B1")
      then
         return 1_000_000_000.0;
      elsif U = "trillion" or else U = "billionen"
        or else U = "biljoner" or else U = "biljoona"
        or else U = "bilion" or else U = "trilyon"
        or else U = "bln." or else U = "bln"
        or else U = "trln." or else U = "trilijonas"
        or else U = "bilijon" or else U = "triliun"
        or else U = "trilion" or else U = "nghin ty"
        or else U = "tril" or else U = "billio"
        or else U = B ("D182D180D0B8D0BBD0BBD0B8D0BED0BD")
        or else U = B ("D182D180D0B8D0BBD18CD0B9D0BED0BD")
        or else U = B ("E58586")
        or else U = B ("ECA1B0")
        or else U = B ("D8AAD8B1D98AD984D98AD988D986")
      then
         return 1_000_000_000_000.0;
      elsif U = "lakh" or else U = B ("E0A4B2E0A4BEE0A496") then
         return 100_000.0;
      elsif U = "crore" or else U = B ("E0A495E0A4B0E0A58BE0A4A1E0A4BC") then
         return 10_000_000.0;
      else
         return 0.0;
      end if;
end Compact_Multiplier;
