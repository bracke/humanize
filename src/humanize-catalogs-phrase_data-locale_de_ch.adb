separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_De_Ch (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "de-CH", Name, Template);
   end P;
   --  The domain labels (label.*), in nested subunits.
   procedure Labels_1 is separate;
begin
   P ("file_size_comparison.same", "{current} ist genauso gross wie {baseline}");
   P ("file_size_comparison.larger", "{current} ist {quantity} grösser als {baseline}");
   P ("validation.out_of_range", "ausserhalb des zulässigen Bereichs");
   P ("validation.problem.range", "{field}: liegt ausserhalb des zulässigen Bereichs");
   P ("validation.constraint.greater_than", "{field}: muss grösser als {value} sein");
   P ("collection.summary",
      "{name}: {total} {total, plural, one {Element} other {Elemente}}, "
      & "{unique} {unique, plural, one {eindeutiger Wert} other {eindeutige "
      & "Werte}}, {duplicates} {duplicates, plural, one {Duplikat} other "
      & "{Duplikate}}, {outliers} {outliers, plural, one {Ausreisser} other "
      & "{Ausreisser}}");
   P ("http.reason.203", "nicht massgebliche Information");
   P ("http.reason.413", "Inhalt zu gross");
   P ("http.reason.431", "Header-Felder der Anfrage zu gross");
   P ("signal.reason.28", "Fenstergrösse geändert");
   P ("number.range_inclusive", "{low} bis einschliesslich {high}");
   P ("number.range_exclusive", "grösser als {low} und kleiner als {high}");
   P ("number.range_high_inclusive", "grösser als {low} und höchstens {high}");
   P ("geo.outside_box", "ausserhalb des Begrenzungsrahmens");
   Labels_1;
end Locale_De_Ch;
