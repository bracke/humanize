with Humanize.Status;

--  Privacy-preserving string helpers for masking, redaction, and summaries.
package Humanize.Strings.Privacy is

   function Safe_Email_Label
     (Email : String)
      return Humanize.Status.Text_Result;

   function Safe_Phone_Label
     (Phone : String;
      Visible_Digits : Natural := 4)
      return Humanize.Status.Text_Result;

   function Safe_Handle_Label
     (Handle : String)
      return Humanize.Status.Text_Result;

   function Code_Symbol_Label
     (Symbol : String)
      return Humanize.Status.Text_Result;

   function Source_Location_Label
     (Path   : String;
      Line   : Natural := 0;
      Column : Natural := 0)
      return Humanize.Status.Text_Result;

   function Address_Label
     (Address   : Address_Fields;
      Multiline : Boolean := False)
      return Humanize.Status.Text_Result;

   function Address_Metadata_Label
     (Address : Address_Fields)
      return Humanize.Status.Text_Result;

   function Privacy_Address_Label
     (Address : Address_Fields)
      return Humanize.Status.Text_Result;
end Humanize.Strings.Privacy;
