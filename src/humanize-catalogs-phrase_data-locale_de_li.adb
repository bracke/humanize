separate (Humanize.Catalogs.Phrase_Data)
function Locale_De_Li return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("de-LI", Name, Template));
begin
   return
     P ("file_size_comparison.same", "{current} ist genauso gross wie {baseline}")
     & P ("file_size_comparison.larger", "{current} ist {quantity} grösser als {baseline}")
     & P ("validation.out_of_range", "ausserhalb des zulässigen Bereichs")
     & P ("validation.problem.range", "{field}: liegt ausserhalb des zulässigen Bereichs")
     & P ("validation.constraint.greater_than", "{field}: muss grösser als {value} sein")
     & P ("collection.summary",
          "{name}: {total} {total, plural, one {Element} other {Elemente}}, "
          & "{unique} {unique, plural, one {eindeutiger Wert} other {eindeutige "
          & "Werte}}, {duplicates} {duplicates, plural, one {Duplikat} other "
          & "{Duplikate}}, {outliers} {outliers, plural, one {Ausreisser} other "
          & "{Ausreisser}}");
end Locale_De_Li;
