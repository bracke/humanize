with Humanize.Domain_Details;
with Humanize.Status;

--  Human-readable labels for payments, invoices, receipts, and refunds.
package Humanize.Payments is

   type Payment_Output_Mode is (Payment_Detailed, Payment_Compact,
                                Payment_Accessible, Payment_Log);
   --  Output style for payment labels with domain metadata.

   type Payment_Label_Options is record
      Mode             : Payment_Output_Mode := Payment_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;
   --  Caller-selected metadata included around payment labels.

   Default_Payment_Label_Options : constant Payment_Label_Options :=
     (Mode             => Payment_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Payment_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;

   type Payment_State is
     (Pending_Payment,
      Authorized_Payment,
      Paid_Payment,
      Failed_Payment,
      Refunded_Payment,
      Canceled_Payment);
   --  Caller-supplied payment state.

   type Invoice_State is
     (Draft_Invoice,
      Open_Invoice,
      Paid_Invoice,
      Overdue_Invoice,
      Void_Invoice);
   --  Caller-supplied invoice state.

   type Payment_Method is
     (Card_Method,
      Bank_Transfer_Method,
      Cash_Method,
      Wallet_Method,
      Check_Method,
      Other_Method);
   --  Caller-supplied payment method.

   function Payment_State_Label
     (State : Payment_State)
      return Humanize.Status.Text_Result;
   --  @param State Payment state.
   --  @return Human-readable payment-state label.

   function Invoice_State_Label
     (State : Invoice_State)
      return Humanize.Status.Text_Result;
   --  @param State Invoice state.
   --  @return Human-readable invoice-state label.

   function Payment_Method_Label
     (Method : Payment_Method)
      return Humanize.Status.Text_Result;
   --  @param Method Payment method.
   --  @return Human-readable payment-method label.

   function Payment_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Payment count.
   --  @return Human-readable payment count label.

   function Invoice_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Invoice count.
   --  @return Human-readable invoice count label.

   function Amount_Label
     (Amount_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Amount_Text Caller-supplied formatted money amount.
   --  @return Human-readable amount label.

   function Payment_Label
     (Amount_Text : String;
      State       : Payment_State := Paid_Payment)
      return Humanize.Status.Text_Result;
   --  @param Amount_Text Caller-supplied formatted money amount.
   --  @param State Payment state.
   --  @return Human-readable payment label.

   function Payment_Label
     (Amount_Text : String;
      State       : Payment_State;
      Options     : Payment_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Amount_Text Caller-supplied formatted money amount.
   --  @param State Payment state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable payment label with optional metadata.

   function Invoice_Label
     (Number : String;
      State  : Invoice_State := Open_Invoice)
      return Humanize.Status.Text_Result;
   --  @param Number Invoice number or display id.
   --  @param State Invoice state.
   --  @return Human-readable invoice label.

   function Invoice_Label
     (Number  : String;
      State   : Invoice_State;
      Options : Payment_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Number Invoice number or display id.
   --  @param State Invoice state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable invoice label with optional metadata.

   function Payment_State_Metadata
     (State : Payment_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Payment state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Invoice_State_Metadata
     (State : Invoice_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Invoice state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Parse_Payment_Label
     (Text  : String;
      State : Payment_State)
      return Payment_Label_Parse_Result;
   --  @param Text Label in "amount state payment" form.
   --  @param State Expected payment state.
   --  @return Parsed amount span, state span, metadata, and consumed length.

   function Scan_Payment_Label
     (Text  : String;
      State : Payment_State)
      return Payment_Label_Parse_Result;
   --  @param Text Text beginning with a payment label.
   --  @param State Expected payment state.
   --  @return Parsed label span and consumed prefix length.

   function Parse_Invoice_Label
     (Text  : String;
      State : Invoice_State)
      return Payment_Label_Parse_Result;
   --  @param Text Label in "invoice number state" form.
   --  @param State Expected invoice state.
   --  @return Parsed invoice number span, state span, metadata, and consumed length.

   function Scan_Invoice_Label
     (Text  : String;
      State : Invoice_State)
      return Payment_Label_Parse_Result;
   --  @param Text Text beginning with an invoice label.
   --  @param State Expected invoice state.
   --  @return Parsed label span and consumed prefix length.

   function Due_Label
     (Amount_Text : String;
      Due_Text    : String)
      return Humanize.Status.Text_Result;
   --  @param Amount_Text Caller-supplied formatted money amount.
   --  @param Due_Text Caller-supplied due date/time/distance label.
   --  @return Human-readable payment due label.

   function Paid_Label
     (Amount_Text : String;
      Paid_Text   : String := "")
      return Humanize.Status.Text_Result;
   --  @param Amount_Text Caller-supplied formatted money amount.
   --  @param Paid_Text Optional caller-supplied paid time/date label.
   --  @return Human-readable paid label.

   function Refund_Label
     (Amount_Text : String;
      State       : Payment_State := Refunded_Payment)
      return Humanize.Status.Text_Result;
   --  @param Amount_Text Caller-supplied formatted money amount.
   --  @param State Refund/payment state.
   --  @return Human-readable refund label.

   function Method_Label
     (Method : Payment_Method;
      Detail : String := "")
      return Humanize.Status.Text_Result;
   --  @param Method Payment method.
   --  @param Detail Optional caller-supplied method detail.
   --  @return Human-readable payment method label.

   function Receipt_Label
     (Number : String := "")
      return Humanize.Status.Text_Result;
   --  @param Number Optional receipt number or display id.
   --  @return Human-readable receipt label.

   function Balance_Label
     (Amount_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Amount_Text Caller-supplied formatted money amount.
   --  @return Human-readable balance label.

   function Tax_Label
     (Amount_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Amount_Text Caller-supplied formatted money amount.
   --  @return Human-readable tax label.

   function Subtotal_Label
     (Amount_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Amount_Text Caller-supplied formatted money amount.
   --  @return Human-readable subtotal label.

   function Total_Label
     (Amount_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Amount_Text Caller-supplied formatted money amount.
   --  @return Human-readable total label.

   function Discount_Label
     (Amount_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Amount_Text Caller-supplied formatted money amount or discount.
   --  @return Human-readable discount label.

   function Chargeback_Label
     (Amount_Text : String := "")
      return Humanize.Status.Text_Result;
   --  @param Amount_Text Optional caller-supplied formatted money amount.
   --  @return Human-readable chargeback label.

   function Payment_Link_Label
     (Name : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Optional payment or invoice display name.
   --  @return Human-readable payment-link label.

   procedure Payment_State_Label_Into
     (State   : Payment_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Payment state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Invoice_State_Label_Into
     (State   : Invoice_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Invoice state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Payment_Method_Label_Into
     (Method  : Payment_Method;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Method Payment method.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Payment_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Payment count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Invoice_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Invoice count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Amount_Label_Into
     (Amount_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code);
   --  @param Amount_Text Caller-supplied formatted money amount.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Payment_Label_Into
     (Amount_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      State       : Payment_State := Paid_Payment);
   --  @param Amount_Text Caller-supplied formatted money amount.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param State Payment state.

   procedure Payment_Label_Into
     (Amount_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      State       : Payment_State;
      Options     : Payment_Label_Options);
   --  @param Amount_Text Caller-supplied formatted money amount.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param State Payment state.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Invoice_Label_Into
     (Number  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Invoice_State := Open_Invoice);
   --  @param Number Invoice number or display id.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param State Invoice state.

   procedure Invoice_Label_Into
     (Number  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Invoice_State;
      Options : Payment_Label_Options);
   --  @param Number Invoice number or display id.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param State Invoice state.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Due_Label_Into
     (Amount_Text : String;
      Due_Text    : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code);
   --  @param Amount_Text Caller-supplied formatted money amount.
   --  @param Due_Text Caller-supplied due date/time/distance label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Paid_Label_Into
     (Amount_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Paid_Text   : String := "");
   --  @param Amount_Text Caller-supplied formatted money amount.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Paid_Text Optional caller-supplied paid time/date label.

   procedure Refund_Label_Into
     (Amount_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      State       : Payment_State := Refunded_Payment);
   --  @param Amount_Text Caller-supplied formatted money amount.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param State Refund/payment state.

   procedure Method_Label_Into
     (Method  : Payment_Method;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Detail  : String := "");
   --  @param Method Payment method.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Detail Optional caller-supplied method detail.

   procedure Receipt_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Number  : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Number Optional receipt number or display id.

   procedure Balance_Label_Into
     (Amount_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code);
   --  @param Amount_Text Caller-supplied formatted money amount.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Tax_Label_Into
     (Amount_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code);
   --  @param Amount_Text Caller-supplied formatted money amount.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Subtotal_Label_Into
     (Amount_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code);
   --  @param Amount_Text Caller-supplied formatted money amount.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Total_Label_Into
     (Amount_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code);
   --  @param Amount_Text Caller-supplied formatted money amount.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Discount_Label_Into
     (Amount_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code);
   --  @param Amount_Text Caller-supplied formatted money amount or discount.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Chargeback_Label_Into
     (Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Amount_Text : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Amount_Text Optional caller-supplied formatted money amount.

   procedure Payment_Link_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Name Optional payment or invoice display name.

end Humanize.Payments;
