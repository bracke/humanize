private package Humanize.Parsing.Bytes is
   function Parse_Bytes
     (Text : String)
      return Byte_Parse_Result;

   function Scan_Bytes
     (Text : String)
      return Byte_Parse_Result;
end Humanize.Parsing.Bytes;
