with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Selections;

package body Humanize.Payments.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Amount_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Payments.Amount_Label (Amount_Text => Amount_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.payments.amount_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "amount_text", Humanize.Bounded_Text.Clean (Amount_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Amount_Label;

   function Balance_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Payments.Balance_Label (Amount_Text => Amount_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.payments.balance_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "amount_text", Humanize.Bounded_Text.Clean (Amount_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Balance_Label;

   function Chargeback_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Payments.Chargeback_Label (Amount_Text => Amount_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.payments.chargeback_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "amount_text", Humanize.Bounded_Text.Clean (Amount_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Chargeback_Label;

   function Discount_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Payments.Discount_Label (Amount_Text => Amount_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.payments.discount_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "amount_text", Humanize.Bounded_Text.Clean (Amount_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Discount_Label;

   function Due_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       Due_Text    : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Payments.Due_Label (Amount_Text => Amount_Text, Due_Text => Due_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.payments.due_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "amount_text", Humanize.Bounded_Text.Clean (Amount_Text));
      Selection := Sel.With_Arg (Selection, "due_text", Humanize.Bounded_Text.Clean (Due_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Due_Label;

   function Invoice_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Payments.Invoice_Count_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.payments.invoice_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Invoice_Count_Label;

   function Invoice_Label
      (Context : Humanize.Contexts.Context;
       Number  : String;
       State   : Invoice_State := Open_Invoice)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Payments.Invoice_Label (Number => Number, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.payments.invoice_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "number", Humanize.Bounded_Text.Clean (Number));
      Selection := Sel.With_Arg (Selection, "state", Lower (Invoice_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Invoice_Label;

   function Invoice_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Invoice_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Payments.Invoice_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.payments.invoice_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Invoice_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Invoice_State_Label;

   function Method_Label
      (Context : Humanize.Contexts.Context;
       Method  : Payment_Method;
       Detail  : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Payments.Method_Label (Method => Method, Detail => Detail);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.payments.method_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "method", Lower (Payment_Method'Image (Method)));
      Selection := Sel.With_Arg (Selection, "detail", Humanize.Bounded_Text.Clean (Detail));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Method_Label;

   function Paid_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       Paid_Text   : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Payments.Paid_Label (Amount_Text => Amount_Text, Paid_Text => Paid_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.payments.paid_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "amount_text", Humanize.Bounded_Text.Clean (Amount_Text));
      Selection := Sel.With_Arg (Selection, "paid_text", Humanize.Bounded_Text.Clean (Paid_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Paid_Label;

   function Payment_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Payments.Payment_Count_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.payments.payment_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Payment_Count_Label;

   function Payment_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       State       : Payment_State := Paid_Payment)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Payments.Payment_Label (Amount_Text => Amount_Text, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.payments.payment_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "amount_text", Humanize.Bounded_Text.Clean (Amount_Text));
      Selection := Sel.With_Arg (Selection, "state", Lower (Payment_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Payment_Label;

   function Payment_Link_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Payments.Payment_Link_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.payments.payment_link_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Payment_Link_Label;

   function Payment_Method_Label
      (Context : Humanize.Contexts.Context;
       Method  : Payment_Method)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Payments.Payment_Method_Label (Method => Method);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.payments.payment_method_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "method", Lower (Payment_Method'Image (Method)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Payment_Method_Label;

   function Payment_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Payment_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Payments.Payment_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.payments.payment_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Payment_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Payment_State_Label;

   function Receipt_Label
      (Context : Humanize.Contexts.Context;
       Number  : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Payments.Receipt_Label (Number => Number);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.payments.receipt_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "number", Humanize.Bounded_Text.Clean (Number));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Receipt_Label;

   function Refund_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       State       : Payment_State := Refunded_Payment)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Payments.Refund_Label (Amount_Text => Amount_Text, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.payments.refund_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "amount_text", Humanize.Bounded_Text.Clean (Amount_Text));
      Selection := Sel.With_Arg (Selection, "state", Lower (Payment_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Refund_Label;

   function Subtotal_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Payments.Subtotal_Label (Amount_Text => Amount_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.payments.subtotal_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "amount_text", Humanize.Bounded_Text.Clean (Amount_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Subtotal_Label;

   function Tax_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Payments.Tax_Label (Amount_Text => Amount_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.payments.tax_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "amount_text", Humanize.Bounded_Text.Clean (Amount_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Tax_Label;

   function Total_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Payments.Total_Label (Amount_Text => Amount_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.payments.total_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "amount_text", Humanize.Bounded_Text.Clean (Amount_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Total_Label;

   procedure Amount_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Amount_Label (Context, Amount_Text), Target, Written, Status);
   end Amount_Label_Into;

   procedure Balance_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Balance_Label (Context, Amount_Text), Target, Written, Status);
   end Balance_Label_Into;

   procedure Chargeback_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String := "";
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Chargeback_Label (Context, Amount_Text), Target, Written, Status);
   end Chargeback_Label_Into;

   procedure Discount_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Discount_Label (Context, Amount_Text), Target, Written, Status);
   end Discount_Label_Into;

   procedure Due_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       Due_Text    : String;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Due_Label (Context, Amount_Text, Due_Text), Target, Written, Status);
   end Due_Label_Into;

   procedure Invoice_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Invoice_Count_Label (Context, Count), Target, Written, Status);
   end Invoice_Count_Label_Into;

   procedure Invoice_Label_Into
      (Context : Humanize.Contexts.Context;
       Number  : String;
       State   : Invoice_State := Open_Invoice;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Invoice_Label (Context, Number, State), Target, Written, Status);
   end Invoice_Label_Into;

   procedure Invoice_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Invoice_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Invoice_State_Label (Context, State), Target, Written, Status);
   end Invoice_State_Label_Into;

   procedure Method_Label_Into
      (Context : Humanize.Contexts.Context;
       Method  : Payment_Method;
       Detail  : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Method_Label (Context, Method, Detail), Target, Written, Status);
   end Method_Label_Into;

   procedure Paid_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       Paid_Text   : String := "";
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Paid_Label (Context, Amount_Text, Paid_Text), Target, Written, Status);
   end Paid_Label_Into;

   procedure Payment_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Payment_Count_Label (Context, Count), Target, Written, Status);
   end Payment_Count_Label_Into;

   procedure Payment_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       State       : Payment_State := Paid_Payment;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Payment_Label (Context, Amount_Text, State), Target, Written, Status);
   end Payment_Label_Into;

   procedure Payment_Link_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Payment_Link_Label (Context, Name), Target, Written, Status);
   end Payment_Link_Label_Into;

   procedure Payment_Method_Label_Into
      (Context : Humanize.Contexts.Context;
       Method  : Payment_Method;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Payment_Method_Label (Context, Method), Target, Written, Status);
   end Payment_Method_Label_Into;

   procedure Payment_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Payment_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Payment_State_Label (Context, State), Target, Written, Status);
   end Payment_State_Label_Into;

   procedure Receipt_Label_Into
      (Context : Humanize.Contexts.Context;
       Number  : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Receipt_Label (Context, Number), Target, Written, Status);
   end Receipt_Label_Into;

   procedure Refund_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       State       : Payment_State := Refunded_Payment;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Refund_Label (Context, Amount_Text, State), Target, Written, Status);
   end Refund_Label_Into;

   procedure Subtotal_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Subtotal_Label (Context, Amount_Text), Target, Written, Status);
   end Subtotal_Label_Into;

   procedure Tax_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Tax_Label (Context, Amount_Text), Target, Written, Status);
   end Tax_Label_Into;

   procedure Total_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Total_Label (Context, Amount_Text), Target, Written, Status);
   end Total_Label_Into;

end Humanize.Payments.Localized;
