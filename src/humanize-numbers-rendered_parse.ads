private package Humanize.Numbers.Rendered_Parse is
   function Parse_Deterministic_Cardinal
     (Text  : String;
      Value : out Long_Long_Integer)
      return Boolean;

   function Parse_Deterministic_Ordinal
     (Text  : String;
      Value : out Natural)
      return Boolean;
end Humanize.Numbers.Rendered_Parse;
