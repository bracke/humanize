with Humanize.Contexts;

--  Payments labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Payments.Localized is

   function Amount_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Amount_Label.
   --  @return The label in Context's locale.

   function Balance_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Balance_Label.
   --  @return The label in Context's locale.

   function Chargeback_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Chargeback_Label.
   --  @return The label in Context's locale.

   function Discount_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Discount_Label.
   --  @return The label in Context's locale.

   function Due_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       Due_Text    : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Due_Label.
   --  @param Due_Text As for the parent's Due_Label.
   --  @return The label in Context's locale.

   function Invoice_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Invoice_Count_Label.
   --  @return The label in Context's locale.

   function Invoice_Label
      (Context : Humanize.Contexts.Context;
       Number  : String;
       State   : Invoice_State := Open_Invoice)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Number As for the parent's Invoice_Label.
   --  @param State As for the parent's Invoice_Label.
   --  @return The label in Context's locale.

   function Invoice_Label
      (Context : Humanize.Contexts.Context;
       Number  : String;
       State   : Invoice_State;
       Options : Payment_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Number As for the parent's Invoice_Label.
   --  @param State As for the parent's Invoice_Label.
   --  @param Options As for the parent's Invoice_Label.
   --  @return The label in Context's locale.

   function Invoice_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Invoice_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Invoice_State_Label.
   --  @return The label in Context's locale.

   function Method_Label
      (Context : Humanize.Contexts.Context;
       Method  : Payment_Method;
       Detail  : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Method As for the parent's Method_Label.
   --  @param Detail As for the parent's Method_Label.
   --  @return The label in Context's locale.

   function Paid_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       Paid_Text   : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Paid_Label.
   --  @param Paid_Text As for the parent's Paid_Label.
   --  @return The label in Context's locale.

   function Payment_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Payment_Count_Label.
   --  @return The label in Context's locale.

   function Payment_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       State       : Payment_State := Paid_Payment)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Payment_Label.
   --  @param State As for the parent's Payment_Label.
   --  @return The label in Context's locale.

   function Payment_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       State       : Payment_State;
       Options     : Payment_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Payment_Label.
   --  @param State As for the parent's Payment_Label.
   --  @param Options As for the parent's Payment_Label.
   --  @return The label in Context's locale.

   function Payment_Link_Label
      (Context : Humanize.Contexts.Context;
       Name    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Payment_Link_Label.
   --  @return The label in Context's locale.

   function Payment_Method_Label
      (Context : Humanize.Contexts.Context;
       Method  : Payment_Method)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Method As for the parent's Payment_Method_Label.
   --  @return The label in Context's locale.

   function Payment_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Payment_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Payment_State_Label.
   --  @return The label in Context's locale.

   function Receipt_Label
      (Context : Humanize.Contexts.Context;
       Number  : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Number As for the parent's Receipt_Label.
   --  @return The label in Context's locale.

   function Refund_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       State       : Payment_State := Refunded_Payment)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Refund_Label.
   --  @param State As for the parent's Refund_Label.
   --  @return The label in Context's locale.

   function Subtotal_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Subtotal_Label.
   --  @return The label in Context's locale.

   function Tax_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Tax_Label.
   --  @return The label in Context's locale.

   function Total_Label
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Total_Label.
   --  @return The label in Context's locale.

   procedure Amount_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Amount_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Balance_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Balance_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Chargeback_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String := "";
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Chargeback_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Discount_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Discount_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Due_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       Due_Text    : String;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Due_Label.
   --  @param Due_Text As for the parent's Due_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Invoice_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Invoice_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Invoice_Label_Into
      (Context : Humanize.Contexts.Context;
       Number  : String;
       State   : Invoice_State := Open_Invoice;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Number As for the parent's Invoice_Label.
   --  @param State As for the parent's Invoice_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Invoice_Label_Into
      (Context : Humanize.Contexts.Context;
       Number  : String;
       State   : Invoice_State;
       Options : Payment_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Number As for the parent's Invoice_Label.
   --  @param State As for the parent's Invoice_Label.
   --  @param Options As for the parent's Invoice_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Invoice_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Invoice_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Invoice_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Method_Label_Into
      (Context : Humanize.Contexts.Context;
       Method  : Payment_Method;
       Detail  : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Method As for the parent's Method_Label.
   --  @param Detail As for the parent's Method_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Paid_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       Paid_Text   : String := "";
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Paid_Label.
   --  @param Paid_Text As for the parent's Paid_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Payment_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Payment_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Payment_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       State       : Payment_State := Paid_Payment;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Payment_Label.
   --  @param State As for the parent's Payment_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Payment_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       State       : Payment_State;
       Options     : Payment_Label_Options;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Payment_Label.
   --  @param State As for the parent's Payment_Label.
   --  @param Options As for the parent's Payment_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Payment_Link_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Payment_Link_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Payment_Method_Label_Into
      (Context : Humanize.Contexts.Context;
       Method  : Payment_Method;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Method As for the parent's Payment_Method_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Payment_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Payment_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Payment_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Receipt_Label_Into
      (Context : Humanize.Contexts.Context;
       Number  : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Number As for the parent's Receipt_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Refund_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       State       : Payment_State := Refunded_Payment;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Refund_Label.
   --  @param State As for the parent's Refund_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Subtotal_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Subtotal_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Tax_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Tax_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Total_Label_Into
      (Context     : Humanize.Contexts.Context;
       Amount_Text : String;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Amount_Text As for the parent's Total_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Payments.Localized;
