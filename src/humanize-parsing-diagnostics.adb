with Humanize.Bounded_Text;
with Humanize.Status;

package body Humanize.Parsing.Diagnostics is
   use type Humanize.Status.Status_Code;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Image (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   procedure Copy_Text
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Diagnostic
     (Status         : Humanize.Status.Status_Code;
      Error_Position : Natural)
      return Parse_Error_Kind
   is
   begin
      return Diagnostic (Status, Error_Position, No_Parse_Error);
   end Diagnostic;

   function Diagnostic
     (Status         : Humanize.Status.Status_Code;
      Error_Position : Natural;
      Error          : Parse_Error_Kind)
      return Parse_Error_Kind
   is
   begin
      if Status = Humanize.Status.Ok then
         return No_Parse_Error;
      elsif Error /= No_Parse_Error then
         return Error;
      elsif Status = Humanize.Status.Invalid_Value then
         return Out_Of_Range;
      elsif Status = Humanize.Status.Invalid_Argument
        and then Error_Position = 0
      then
         return Empty_Input;
      elsif Error_Position > 0 then
         return Expected_Number;
      else
         return Unsupported_Form;
      end if;
   end Diagnostic;

   function Diagnostic_Label
     (Kind : Parse_Error_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Kind is
            when No_Parse_Error     => "ok",
            when Empty_Input        => "empty-input",
            when Expected_Number    => "expected-number",
            when Expected_Separator => "expected-separator",
            when Expected_Unit      => "expected-unit",
            when Out_Of_Range       => "out-of-range",
            when Unsupported_Form   => "unsupported-form");
   end Diagnostic_Label;

   procedure Diagnostic_Label_Into
     (Kind    : Parse_Error_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Text (Diagnostic_Label (Kind), Target, Written, Status);
   end Diagnostic_Label_Into;

   function Diagnostic_Message
     (Kind           : Parse_Error_Kind;
      Error_Position : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Position : constant String :=
        (if Error_Position = 0 then ""
         else " at position " & Image (Error_Position));
   begin
      return Ok_Text
        ((case Kind is
             when No_Parse_Error     => "parsed successfully",
             when Empty_Input        => "expected input",
             when Expected_Number    => "expected a number",
             when Expected_Separator => "expected a separator",
             when Expected_Unit      => "expected a unit",
             when Out_Of_Range       => "value is out of range",
             when Unsupported_Form   => "unsupported input form")
         & Position);
   end Diagnostic_Message;

   procedure Diagnostic_Message_Into
     (Kind           : Parse_Error_Kind;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Error_Position : Natural := 0)
   is
   begin
      Copy_Text
        (Diagnostic_Message (Kind, Error_Position), Target, Written, Status);
   end Diagnostic_Message_Into;

   function Parse_Error_Label
     (Error : Parse_Error_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      return Diagnostic_Label (Error);
   end Parse_Error_Label;

   function Parse_Error_Context_Label
     (Error          : Parse_Error_Kind;
      Error_Position : Natural := 0)
      return Humanize.Status.Text_Result
   is
   begin
      return Diagnostic_Message (Error, Error_Position);
   end Parse_Error_Context_Label;

   procedure Parse_Error_Label_Into
     (Error   : Parse_Error_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Text (Parse_Error_Label (Error), Target, Written, Status);
   end Parse_Error_Label_Into;

   procedure Parse_Error_Context_Label_Into
     (Error          : Parse_Error_Kind;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Error_Position : Natural := 0)
   is
   begin
      Copy_Text
        (Parse_Error_Context_Label (Error, Error_Position), Target, Written,
         Status);
   end Parse_Error_Context_Label_Into;
end Humanize.Parsing.Diagnostics;
