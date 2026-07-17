private package Humanize.Parsing.Support is
   function Normalize_Native_Digits (Text : String) return String;

   function Has_Decimal_Comma (Text : String) return Boolean;

   function Numeric_Value
     (Text  : String;
      Value : out Long_Float)
      return Boolean;

   function Rounded_Nonnegative (Value : Long_Float) return Long_Long_Integer;

   function Split_Number_Unit
     (Text        : String;
      Number_Text : out Natural;
      Unit_Start  : out Natural)
      return Boolean;

   function Scan_End (Text : String) return Natural;

   function Scan_Number_End (Text : String) return Natural;
end Humanize.Parsing.Support;
