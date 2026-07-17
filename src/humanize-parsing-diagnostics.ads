private package Humanize.Parsing.Diagnostics is
   function Diagnostic
     (Status         : Humanize.Status.Status_Code;
      Error_Position : Natural)
      return Parse_Error_Kind;

   function Diagnostic
     (Status         : Humanize.Status.Status_Code;
      Error_Position : Natural;
      Error          : Parse_Error_Kind)
      return Parse_Error_Kind;

   function Diagnostic_Label
     (Kind : Parse_Error_Kind)
      return Humanize.Status.Text_Result;

   procedure Diagnostic_Label_Into
     (Kind    : Parse_Error_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   function Diagnostic_Message
     (Kind           : Parse_Error_Kind;
      Error_Position : Natural := 0)
      return Humanize.Status.Text_Result;

   procedure Diagnostic_Message_Into
     (Kind           : Parse_Error_Kind;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Error_Position : Natural := 0);

   function Parse_Error_Label
     (Error : Parse_Error_Kind)
      return Humanize.Status.Text_Result;

   function Parse_Error_Context_Label
     (Error          : Parse_Error_Kind;
      Error_Position : Natural := 0)
      return Humanize.Status.Text_Result;

   procedure Parse_Error_Label_Into
     (Error   : Parse_Error_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);

   procedure Parse_Error_Context_Label_Into
     (Error          : Parse_Error_Kind;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Error_Position : Natural := 0);
end Humanize.Parsing.Diagnostics;
