separate (Humanize.Tests.Numbers)
   procedure Test_Cardinal_Fractional (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      procedure Check_Cardinal_And_Scientific_Words is separate;
      procedure Check_Decimal_And_Fraction_Words is separate;
      procedure Check_Ordinal_Currency_And_Tier_Metadata is separate;
   begin
      Check_Cardinal_And_Scientific_Words;
      Check_Decimal_And_Fraction_Words;
      Check_Ordinal_Currency_And_Tier_Metadata;
   end Test_Cardinal_Fractional;
