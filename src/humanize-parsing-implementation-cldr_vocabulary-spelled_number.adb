separate (Humanize.Parsing.Implementation.CLDR_Vocabulary)
procedure Spelled_Number
  (Text     : String;
   Ordinal  : Boolean;
   Value    : out Long_Long_Integer;
   Consumed : out Natural)
is
begin
   Value := 0;
   Consumed := 0;
   --  The longest reading in any shipped locale; the first on a tie.
   for Locale of Humanize.Locales.Shipped_Locales loop
      declare
         Set : constant String :=
           (if Ordinal then I18N.Spellout.Ordinal_Ruleset (Locale.all) else "");
         V   : Long_Long_Integer;
         C   : Natural;
      begin
         if not Ordinal or else Set /= "" then
            I18N.Spellout.Parse (Locale.all, Text, V, C, Set);
            if C > Consumed then
               Value := V;
               Consumed := C;
            end if;
         end if;
      end;
   end loop;
end Spelled_Number;
