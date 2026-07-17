private package Humanize.Parsing.Success_Labels is
   function Scheduling_Phrase_Label
     (Result : Scheduling_Phrase_Result)
      return Humanize.Status.Text_Result;

   function Scheduling_Ambiguity_Label
     (Result : Scheduling_Phrase_Result)
      return Humanize.Status.Text_Result;

   function Scheduling_Resolution_Label
     (Kind : Scheduling_Phrase_Kind)
      return Humanize.Status.Text_Result;

   function Parse_Value_Family_Label
     (Family : Parse_Value_Family)
      return Humanize.Status.Text_Result;

   function Parse_Success_Explanation_Label
     (Family     : Parse_Value_Family;
      Input      : String;
      Normalized : String;
      Consumed   : Natural := 0;
      Exact      : Boolean := True)
      return Humanize.Status.Text_Result;

   function Parse_Success_Explanation_Label
     (Text : String)
      return Parse_Success_Explanation;

   function Scan_Success_Explanation_Label
     (Text : String)
      return Parse_Success_Explanation;

   function Byte_Parse_Success_Label
     (Input  : String;
      Result : Byte_Parse_Result)
      return Humanize.Status.Text_Result;

   function Duration_Parse_Success_Label
     (Input  : String;
      Result : Duration_Parse_Result)
      return Humanize.Status.Text_Result;

   function Number_Parse_Success_Label
     (Input  : String;
      Result : Number_Parse_Result)
      return Humanize.Status.Text_Result;

   function Unit_Parse_Success_Label
     (Input  : String;
      Result : Unit_Parse_Result)
      return Humanize.Status.Text_Result;

   function Scheduling_Parse_Success_Label
     (Input  : String;
      Result : Scheduling_Phrase_Result)
      return Humanize.Status.Text_Result;

   procedure Scheduling_Phrase_Label_Into
     (Result  : Scheduling_Phrase_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Parse_Success_Explanation_Label_Into
     (Family     : Parse_Value_Family;
      Input      : String;
      Normalized : String;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Consumed   : Natural := 0;
      Exact      : Boolean := True);
end Humanize.Parsing.Success_Labels;
