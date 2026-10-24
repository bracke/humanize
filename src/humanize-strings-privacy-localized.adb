with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
with Humanize.Selections;

package body Humanize.Strings.Privacy.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Address_Metadata_Label
      (Context : Humanize.Contexts.Context;
       Address : Address_Fields)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Privacy.Address_Metadata_Label (Address => Address);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.privacy.address_metadata_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_Present : constant Long_Long_Integer := Humanize.Label_Values.Leading_Count
           (Humanize.Label_Values.Value_After (E, ": "));
         D_Missing : constant Long_Long_Integer := Humanize.Label_Values.Leading_Count
           (Humanize.Label_Values.Value_After (E, "present, "));
      begin
         Selection := Sel.With_Arg (Selection, "present", D_Present);
         Selection := Sel.With_Arg (Selection, "missing", D_Missing);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end Address_Metadata_Label;

   function Code_Symbol_Label
      (Context : Humanize.Contexts.Context;
       Symbol  : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Privacy.Code_Symbol_Label (Symbol => Symbol);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.privacy.code_symbol_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_State : constant String := (if E = "code symbol" then "none" else "some");
         D_Symbol : constant String := Humanize.Label_Values.Value_After (E, "code symbol ");
      begin
         Selection := Sel.With_Arg (Selection, "state", D_State);
         Selection := Sel.With_Arg (Selection, "symbol", D_Symbol);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end Code_Symbol_Label;

   function Safe_Email_Label
      (Context : Humanize.Contexts.Context;
       Email   : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Privacy.Safe_Email_Label (Email => Email);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.privacy.safe_email_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_State : constant String := (if E = "empty email" then "empty" elsif E = "email address" then "address" else
           "at");
         D_Domain : constant String := Humanize.Label_Values.Value_After (E, "email at ");
      begin
         Selection := Sel.With_Arg (Selection, "state", D_State);
         Selection := Sel.With_Arg (Selection, "domain", D_Domain);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end Safe_Email_Label;

   function Safe_Handle_Label
      (Context : Humanize.Contexts.Context;
       Handle  : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Privacy.Safe_Handle_Label (Handle => Handle);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.privacy.safe_handle_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_State : constant String := (if E = "handle" then "none" else "some");
         D_Shown : constant String := Humanize.Label_Values.Value_After (E, "handle ");
      begin
         Selection := Sel.With_Arg (Selection, "state", D_State);
         Selection := Sel.With_Arg (Selection, "shown", D_Shown);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end Safe_Handle_Label;

   function Safe_Phone_Label
      (Context        : Humanize.Contexts.Context;
       Phone          : String;
       Visible_Digits : Natural := 4)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Privacy.Safe_Phone_Label (Phone => Phone, Visible_Digits => Visible_Digits);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.privacy.safe_phone_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_State : constant String := (if E = "phone number" then "none" elsif E = "phone number redacted" then
           "redacted" else "ending");
         D_Digits : constant String := Humanize.Label_Values.Value_After (E, "phone ending in ");
      begin
         Selection := Sel.With_Arg (Selection, "state", D_State);
         Selection := Sel.With_Arg (Selection, "digits", D_Digits);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end Safe_Phone_Label;

   procedure Address_Metadata_Label_Into
      (Context : Humanize.Contexts.Context;
       Address : Address_Fields;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Address_Metadata_Label (Context, Address => Address), Target, Written, Status);
   end Address_Metadata_Label_Into;

   procedure Code_Symbol_Label_Into
      (Context : Humanize.Contexts.Context;
       Symbol  : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Code_Symbol_Label (Context, Symbol => Symbol), Target, Written, Status);
   end Code_Symbol_Label_Into;

   procedure Safe_Email_Label_Into
      (Context : Humanize.Contexts.Context;
       Email   : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Safe_Email_Label (Context, Email => Email), Target, Written, Status);
   end Safe_Email_Label_Into;

   procedure Safe_Handle_Label_Into
      (Context : Humanize.Contexts.Context;
       Handle  : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Safe_Handle_Label (Context, Handle => Handle), Target, Written, Status);
   end Safe_Handle_Label_Into;

   procedure Safe_Phone_Label_Into
      (Context        : Humanize.Contexts.Context;
       Phone          : String;
       Visible_Digits : Natural := 4;
       Target         : in out String;
       Written        : out Natural;
       Status         : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Safe_Phone_Label (Context, Phone => Phone, Visible_Digits => Visible_Digits),
         Target, Written, Status);
   end Safe_Phone_Label_Into;

end Humanize.Strings.Privacy.Localized;
