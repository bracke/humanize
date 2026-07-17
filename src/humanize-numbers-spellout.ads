private package Humanize.Numbers.Spellout is
   function Cardinal
     (Context : Humanize.Contexts.Context;
      Value   : Natural)
      return Humanize.Status.Text_Result;

   procedure Cardinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   function Signed_Cardinal
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result;

   procedure Signed_Cardinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   function Locale_Cardinal
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer)
      return Humanize.Status.Text_Result;

   procedure Locale_Cardinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   function Decimal_Words
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Fraction_Digits : Natural := 2)
      return Humanize.Status.Text_Result;

   procedure Decimal_Words_Into
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Fraction_Digits : Natural;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code);

   function Fraction_Words
     (Context     : Humanize.Contexts.Context;
      Numerator   : Positive;
      Denominator : Positive)
      return Humanize.Status.Text_Result;

   procedure Fraction_Words_Into
     (Context     : Humanize.Contexts.Context;
      Numerator   : Positive;
      Denominator : Positive;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code);

   function Ordinal_Words
     (Context : Humanize.Contexts.Context;
      Value   : Natural)
      return Humanize.Status.Text_Result;

   procedure Ordinal_Words_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   function Currency_Words
     (Context       : Humanize.Contexts.Context;
      Amount        : Long_Float;
      Major_Unit    : String;
      Minor_Unit    : String := "cent";
      Fraction_Digits : Natural := 2)
      return Humanize.Status.Text_Result;

   procedure Currency_Words_Into
     (Context       : Humanize.Contexts.Context;
      Amount        : Long_Float;
      Major_Unit    : String;
      Minor_Unit    : String;
      Fraction_Digits : Natural;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code);

   function Percent_Words
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Fraction_Digits : Natural := 1)
      return Humanize.Status.Text_Result;

   procedure Percent_Words_Into
     (Context         : Humanize.Contexts.Context;
      Value           : Long_Float;
      Fraction_Digits : Natural;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code);

   function Spellout_Coverage
      return Humanize.Status.Text_Result;

   function Spellout_Locale_Tier_For
     (Context : Humanize.Contexts.Context)
      return Spellout_Locale_Tier;

   function Spellout_Locale_Tier_Label
     (Tier : Spellout_Locale_Tier)
      return Humanize.Status.Text_Result;

   procedure Spellout_Coverage_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Spellout_Locale_Tier_Label_Into
     (Tier    : Spellout_Locale_Tier;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
end Humanize.Numbers.Spellout;
