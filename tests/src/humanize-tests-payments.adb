with AUnit.Assertions;

with Humanize.Payments;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Payments is
   use Humanize.Payments;
   use Humanize.Status;

   procedure Check
     (Result   : Text_Result;
      Expected : String;
      Message  : String)
   is
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Test_State_Method_And_Count_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Check
        (Payment_State_Label (Pending_Payment),
         "pending payment",
         "pending payment state");
      Check
        (Payment_State_Label (Refunded_Payment),
         "refunded payment",
         "refunded payment state");
      Check
        (Invoice_State_Label (Overdue_Invoice),
         "overdue invoice",
         "overdue invoice state");
      Check
        (Payment_Method_Label (Bank_Transfer_Method),
         "bank transfer",
         "bank transfer method");
      Check (Payment_Count_Label (0), "no payments", "no payments");
      Check (Payment_Count_Label (2), "2 payments", "payment count");
      Check (Invoice_Count_Label (0), "no invoices", "no invoices");
      Check (Invoice_Count_Label (3), "3 invoices", "invoice count");
   end Test_State_Method_And_Count_Labels;

   procedure Test_Amount_Payment_And_Invoice_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check (Amount_Label ("$10.00"), "amount $10.00", "amount");
      Check
        (Payment_Label ("$10.00", Paid_Payment),
         "$10.00 paid payment",
         "payment label");
      Check
        (Payment_Label ("$10.00", Failed_Payment),
         "$10.00 failed payment",
         "failed payment label");
      Check
        (Invoice_Label ("INV-1", Open_Invoice),
         "invoice INV-1 open",
         "invoice label");
      Check (Due_Label ("$10.00", "tomorrow"), "$10.00 due tomorrow", "due");
      Check (Paid_Label ("$10.00"), "$10.00 paid", "paid");
      Check (Paid_Label ("$10.00", "today"), "$10.00 paid today", "paid time");

      Invalid := Amount_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid amount",
         "empty amount rejected");
      Invalid := Invoice_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid invoice number",
         "empty invoice rejected");
      Invalid := Due_Label ("$10.00", " ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid due label",
         "empty due rejected");
   end Test_Amount_Payment_And_Invoice_Labels;

   procedure Test_Refund_Method_Receipt_And_Balance_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check
        (Refund_Label ("$10.00"),
         "$10.00 refunded refund",
         "refund");
      Check
        (Refund_Label ("$10.00", Pending_Payment),
         "$10.00 pending refund",
         "pending refund");
      Check (Method_Label (Card_Method), "paid by card", "method");
      Check
        (Method_Label (Card_Method, "ending in 4242"),
         "paid by card: ending in 4242",
         "method detail");
      Check (Receipt_Label, "receipt", "receipt");
      Check (Receipt_Label ("R-1"), "receipt R-1", "receipt number");
      Check (Balance_Label ("$0.00"), "balance $0.00", "balance");
      Check (Tax_Label ("$1.50"), "tax $1.50", "tax");
      Check (Subtotal_Label ("$8.50"), "subtotal $8.50", "subtotal");
      Check (Total_Label ("$10.00"), "total $10.00", "total");
      Check (Discount_Label ("-$2.00"), "discount -$2.00", "discount");
      Check (Chargeback_Label, "chargeback", "chargeback");
      Check
        (Chargeback_Label ("$10.00"),
         "chargeback $10.00",
         "chargeback amount");
      Check (Payment_Link_Label, "payment link", "payment link");
      Check
        (Payment_Link_Label ("invoice INV-1"),
         "invoice INV-1 payment link",
         "named payment link");

      Invalid := Refund_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid amount",
         "empty refund rejected");
      Invalid := Balance_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid amount",
         "empty balance rejected");
      Invalid := Discount_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid discount",
         "empty discount rejected");
   end Test_Refund_Method_Receipt_And_Balance_Labels;

   procedure Test_Bounded_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Exact  : String (1 .. 20);
      Tiny   : String (1 .. 10);
      Offset : String (2 .. 12);
      Written : Natural;
      Code : Status_Code;
   begin
      Payment_Label_Into ("$10.00", Exact, Written, Code, Paid_Payment);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 19
         and then Exact (1 .. Written) = "$10.00 paid payment",
         "payment bounded exact text");

      Method_Label_Into (Card_Method, Tiny, Written, Code, "ending in 4242");
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 10
         and then Tiny = "paid by ca",
         "method bounded overflow prefix");

      Payment_State_Label_Into (Paid_Payment, Offset, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "payment bounded rejects non-1-based buffers");

      Amount_Label_Into (" ", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "amount bounded returns validation status");

      Receipt_Label_Into (Exact, Written, Code, "R-1");
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 11
         and then Exact (1 .. Written) = "receipt R-1",
         "receipt bounded exact text");

      Total_Label_Into ("$10.00", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 12
         and then Exact (1 .. Written) = "total $10.00",
         "total bounded exact text");
   end Test_Bounded_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize payment/invoice tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_State_Method_And_Count_Labels'Access,
        "state method and count labels");
      Register_Routine (T, Test_Amount_Payment_And_Invoice_Labels'Access,
        "amount payment and invoice labels");
      Register_Routine (T, Test_Refund_Method_Receipt_And_Balance_Labels'Access,
        "refund method receipt and balance labels");
      Register_Routine (T, Test_Bounded_Labels'Access,
        "bounded labels");
   end Register_Tests;

end Humanize.Tests.Payments;
