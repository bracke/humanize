separate (Humanize.Phrases.Support.Backend)
function Number_Comparison
     (Context        : Humanize.Contexts.Context;
      Current        : Long_Float;
      Baseline       : Long_Float;
      Current_Label  : String := "value";
      Baseline_Label : String := "baseline";
      Unit_Singular  : String := "";
      Unit_Plural    : String := "";
      Options        : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      Difference : constant Long_Float := Current - Baseline;
      Quantity   : constant String :=
        With_Optional_Unit
          (Humanize.Decimal_Images.Decimal_Image
             (abs Difference,
              Options.Maximum_Fraction_Digits,
              Options.Suppress_Trailing_Zero),
           Difference, Unit_Singular, Unit_Plural);
      --  Outside English: the noun by the locale's plural rules, in the case
      --  its comparison governs (number_comparison.case: Polish "o 5 plików",
      --  Russian "на 5 файлов"), the registered forms where there are some.
      function Local_Quantity return String is
         Number : constant String :=
           Humanize.Decimal_Images.Decimal_Image
             (abs Difference, Options.Maximum_Fraction_Digits, Options.Suppress_Trailing_Zero);
         Named  : constant Humanize.Status.Text_Result :=
           Humanize.I18N_Rendering.Render (Context, Sel.Phrase ("number_comparison.case"));
         Case_Name : constant String :=
           (if Named.Status = Humanize.Status.Ok then To_String (Named.Text) else "");
         Noun : constant Humanize.Status.Text_Result :=
           Humanize.I18N_Rendering.Render
             (Context,
              Humanize.I18N_Rendering.With_Nouns
                (Context,
                 Sel.With_Arg (Sel.Phrase (if Case_Name = "" then "noun" else "noun." & Case_Name), "count", Number),
                 Unit_Singular, Unit_Plural));
      begin
         if Unit_Singular'Length = 0 or else Noun.Status /= Humanize.Status.Ok then
            return Quantity;
         end if;
         return Number & " " & To_String (Noun.Text);
      end Local_Quantity;
      Localized : constant String := Local_Quantity;
begin
      if Difference = 0.0 then
         return Compared
           (Context, "number_comparison.equal", Current_Label, Baseline_Label, "",
            Current_Label & " is equal to " & Baseline_Label);
      elsif Difference > 0.0 then
         return Compared
           (Context, "number_comparison.higher", Current_Label, Baseline_Label, Localized,
            Current_Label & " is " & Quantity & " higher than " & Baseline_Label);
      else
         return Compared
           (Context, "number_comparison.lower", Current_Label, Baseline_Label, Localized,
            Current_Label & " is " & Quantity & " lower than " & Baseline_Label);
      end if;
end Number_Comparison;
