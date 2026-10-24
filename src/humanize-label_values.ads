with Humanize.Contexts;
with Humanize.Status;

--  Argument values for the localized domain labels (Humanize.<Family>.Localized):
--  numbers as the parent labels write them, in the context's digits and separators.
private package Humanize.Label_Values is

   --  Value rounded to Places fraction digits (at most nine), trailing zeros kept
   --  ("7.30"), as the threshold labels write it.
   function Fixed
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Places  : Natural)
      return String;

   --  Value with up to six fraction digits, trailing zeros dropped ("7.5").
   function Plain
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float)
      return String;

   --  Fixed, then the cleaned Unit after a space, if there is one.
   function Fixed_With_Unit
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : String;
      Places  : Natural)
      return String;

   --  Plain, then the cleaned Unit after a space, if there is one.
   function Plain_With_Unit
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : String)
      return String;

   --  A percentage (50.0 is "50%") in the locale's percent format, rounded to
   --  Places fraction digits with trailing zeros kept.
   function Percent
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Places  : Natural := 0)
      return String;

   --  The cleaned Unit, or Default when it is blank.
   function Unit_Or (Unit, Default : String) return String;

   --  Opacity clamped to 0.0 .. 1.0.
   function Clamp (Opacity : Long_Float) return Long_Float is (Long_Float'Max (0.0, Long_Float'Min (1.0, Opacity)));

   --  The phrase Key with its count argument, in Context's locale.
   function Count_Part
     (Context : Humanize.Contexts.Context;
      Key     : String;
      Count   : Long_Long_Integer)
      return Humanize.Status.Text_Result;

   --  Part after Sofar, through the locale's label.parts ("3 added, 2 removed");
   --  Part alone when Sofar is empty, and the first failure of either.
   function Join
     (Context : Humanize.Contexts.Context;
      Sofar   : Humanize.Status.Text_Result;
      Part    : Humanize.Status.Text_Result)
      return Humanize.Status.Text_Result;

   --  Result, composed in Context's locale, or English in English and where
   --  the composition failed.
   function Localized_Or
     (Context : Humanize.Contexts.Context;
      Result  : Humanize.Status.Text_Result;
      English : Humanize.Status.Text_Result)
      return Humanize.Status.Text_Result;

   --  Plain, the localized plain label, after English's "[surface severity
   --  tone] " prefix (Humanize.Domain_Details, which stays English); English
   --  itself where Plain is no translation (Plain_English's text) or failed.
   function Decorated
     (English       : Humanize.Status.Text_Result;
      Plain_English : Humanize.Status.Text_Result;
      Plain         : Humanize.Status.Text_Result)
      return Humanize.Status.Text_Result;

   --  English in Context's locale by its shape: each segment (split at Separator,
   --  when there is one) becomes the phrase Prefix & "." & its slug -- its words
   --  lowercased and joined by '_', a whole number standing as "n", a decimal
   --  as "d", a #RRGGBB colour as "c" ("4.5:1 normal-text contrast" is
   --  Prefix.d_n_normal_text_contrast) -- with those values as its arguments v1,
   --  v2, ... (a whole number as a number, the others as locale text); the
   --  segments are joined through label.parts (", ") or label.groups ("; "). English itself in English and
   --  where a segment has no phrase.
   function Shaped
     (Context   : Humanize.Contexts.Context;
      Prefix    : String;
      English   : Humanize.Status.Text_Result;
      Separator : String := "")
      return Humanize.Status.Text_Result;

   --  The slug of Text's shape, as Shaped forms it.
   function Shape_Slug (Text : String) return String;

   --  An empty Ok text, to Join parts onto.
   function Nothing return Humanize.Status.Text_Result;

   --  The text of a rendered label.
   function Text_Of (Result : Humanize.Status.Text_Result) return String;

end Humanize.Label_Values;
