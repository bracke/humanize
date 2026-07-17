with Humanize.Strings.Support;

package body Humanize.Strings.Privacy is
   package Shared renames Humanize.Strings.Support;

   function Safe_Email_Label
     (Email : String)
      return Humanize.Status.Text_Result renames Shared.Safe_Email_Label;

   function Safe_Phone_Label
     (Phone : String;
      Visible_Digits : Natural := 4)
      return Humanize.Status.Text_Result renames Shared.Safe_Phone_Label;

   function Safe_Handle_Label
     (Handle : String)
      return Humanize.Status.Text_Result renames Shared.Safe_Handle_Label;

   function Code_Symbol_Label
     (Symbol : String)
      return Humanize.Status.Text_Result renames Shared.Code_Symbol_Label;

   function Source_Location_Label
     (Path   : String;
      Line   : Natural := 0;
      Column : Natural := 0)
      return Humanize.Status.Text_Result renames Shared.Source_Location_Label;

   function Address_Label
     (Address   : Address_Fields;
      Multiline : Boolean := False)
      return Humanize.Status.Text_Result renames Shared.Address_Label;

   function Address_Metadata_Label
     (Address : Address_Fields)
      return Humanize.Status.Text_Result renames Shared.Address_Metadata_Label;

   function Privacy_Address_Label
     (Address : Address_Fields)
      return Humanize.Status.Text_Result renames Shared.Privacy_Address_Label;
end Humanize.Strings.Privacy;
