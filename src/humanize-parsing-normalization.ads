private package Humanize.Parsing.Normalization is
   function Normalize_Number_Text
     (Text : String)
      return Humanize.Status.Text_Result;

   procedure Normalize_Number_Text_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   function Normalize_Unit_Text
     (Text : String)
      return Humanize.Status.Text_Result;

   procedure Normalize_Unit_Text_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   function Normalize_List_Text
     (Text : String)
      return Humanize.Status.Text_Result;

   procedure Normalize_List_Text_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
end Humanize.Parsing.Normalization;
