
with Humanize.Bounded_Text;

package body Humanize.Payments is
   use type Humanize.Status.Status_Code;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text
     (Result : Humanize.Status.Text_Result)
      return String
      renames Humanize.Bounded_Text.Result_Text;

   function Invalid_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Invalid_Text;

   function Clean (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function Image (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Count_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
      renames Humanize.Bounded_Text.Count_Text;
   function Count_Or_No_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
      renames Humanize.Bounded_Text.Count_Or_No_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Payment_Text (State : Payment_State) return String is
   begin
      case State is
         when Pending_Payment    => return "pending";
         when Authorized_Payment => return "authorized";
         when Paid_Payment       => return "paid";
         when Failed_Payment     => return "failed";
         when Refunded_Payment   => return "refunded";
         when Canceled_Payment   => return "canceled";
      end case;
   end Payment_Text;

   function Invoice_Text (State : Invoice_State) return String is
   begin
      case State is
         when Draft_Invoice   => return "draft";
         when Open_Invoice    => return "open";
         when Paid_Invoice    => return "paid";
         when Overdue_Invoice => return "overdue";
         when Void_Invoice    => return "void";
      end case;
   end Invoice_Text;

   function Method_Text (Method : Payment_Method) return String is
   begin
      case Method is
         when Card_Method          => return "card";
         when Bank_Transfer_Method => return "bank transfer";
         when Cash_Method          => return "cash";
         when Wallet_Method        => return "wallet";
         when Check_Method         => return "check";
         when Other_Method         => return "other";
      end case;
   end Method_Text;

   function Nonempty
     (Text, Message : String)
      return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Nonempty_Text;

   function Domain_Options
     (Options : Payment_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Payment_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Payment_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Payment_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Payment_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Payment_State_Suffix (State : Payment_State) return String is
   begin
      return Payment_Text (State);
   end Payment_State_Suffix;

   function Payment_Label_Suffix (State : Payment_State) return String is
   begin
      return Payment_State_Suffix (State) & " payment";
   end Payment_Label_Suffix;

   function Invoice_State_Suffix (State : Invoice_State) return String is
   begin
      return Invoice_Text (State);
   end Invoice_State_Suffix;

   function Invoice_Label_Suffix (State : Invoice_State) return String is
   begin
      return Invoice_State_Suffix (State);
   end Invoice_Label_Suffix;

   function Method_Suffix (Method : Payment_Method) return String is
   begin
      return Method_Text (Method);
   end Method_Suffix;

   function Payment_State_Metadata
     (State : Payment_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Payments_Surface, Payment_State_Suffix (State));
   end Payment_State_Metadata;

   function Invoice_State_Metadata
     (State : Invoice_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Payments_Surface, Invoice_State_Suffix (State));
   end Invoice_State_Metadata;

   function Payment_State_Label
     (State : Payment_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Payment_Label_Suffix (State));
   end Payment_State_Label;

   function Invoice_State_Label
     (State : Invoice_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Invoice_State_Suffix (State) & " invoice");
   end Invoice_State_Label;

   function Payment_Method_Label
     (Method : Payment_Method)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Method_Suffix (Method));
   end Payment_Method_Label;

   function Payment_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "payment", "payments"));
   end Payment_Count_Label;

   function Invoice_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "invoice", "invoices"));
   end Invoice_Count_Label;

   function Amount_Label
     (Amount_Text : String)
      return Humanize.Status.Text_Result
   is
      Amount : constant Humanize.Status.Text_Result :=
        Nonempty (Amount_Text, "invalid amount");
   begin
      if Amount.Status /= Humanize.Status.Ok then
         return Amount;
      else
         return Ok_Text ("amount " & Result_Text (Amount));
      end if;
   end Amount_Label;

   function Payment_Label
     (Amount_Text : String;
      State       : Payment_State := Paid_Payment)
      return Humanize.Status.Text_Result
   is
      Amount : constant Humanize.Status.Text_Result :=
        Nonempty (Amount_Text, "invalid amount");
   begin
      if Amount.Status /= Humanize.Status.Ok then
         return Amount;
      else
         return Ok_Text
           (Result_Text (Amount) & " "
            & Payment_Label_Suffix (State));
      end if;
   end Payment_Label;

   function Payment_Label
     (Amount_Text : String;
      State       : Payment_State;
      Options     : Payment_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Payment_Label (Amount_Text, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Payment_State_Metadata (State), Domain_Options (Options));
   end Payment_Label;

   function Invoice_Label
     (Number : String;
      State  : Invoice_State := Open_Invoice)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Number);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid invoice number");
      else
         return Ok_Text ("invoice " & Label & " " & Invoice_Label_Suffix (State));
      end if;
   end Invoice_Label;

   function Invoice_Label
     (Number  : String;
      State   : Invoice_State;
      Options : Payment_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Invoice_Label (Number, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Invoice_State_Metadata (State), Domain_Options (Options));
   end Invoice_Label;

   function Parse_Payment_Label
     (Text  : String;
      State : Payment_State)
      return Payment_Label_Parse_Result
   is
      Result : Payment_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Payments_Surface,
         Payment_Label_Suffix (State));
      Result.Metadata := Payment_State_Metadata (State);
      return Result;
   end Parse_Payment_Label;

   function Scan_Payment_Label
     (Text  : String;
      State : Payment_State)
      return Payment_Label_Parse_Result
   is
      Result : Payment_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Payments_Surface,
         Payment_Label_Suffix (State));
      Result.Metadata := Payment_State_Metadata (State);
      return Result;
   end Scan_Payment_Label;

   function Parse_Invoice_Label
     (Text  : String;
      State : Invoice_State)
      return Payment_Label_Parse_Result
   is
      Result : Payment_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Payments_Surface,
         Invoice_Label_Suffix (State));
      Result.Metadata := Invoice_State_Metadata (State);
      return Result;
   end Parse_Invoice_Label;

   function Scan_Invoice_Label
     (Text  : String;
      State : Invoice_State)
      return Payment_Label_Parse_Result
   is
      Result : Payment_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Payments_Surface,
         Invoice_Label_Suffix (State));
      Result.Metadata := Invoice_State_Metadata (State);
      return Result;
   end Scan_Invoice_Label;

   function Due_Label
     (Amount_Text : String;
      Due_Text    : String)
      return Humanize.Status.Text_Result
   is
      Amount : constant String := Clean (Amount_Text);
      Due    : constant String := Clean (Due_Text);
   begin
      if Amount'Length = 0 then
         return Invalid_Text ("invalid amount");
      elsif Due'Length = 0 then
         return Invalid_Text ("invalid due label");
      else
         return Ok_Text (Amount & " due " & Due);
      end if;
   end Due_Label;

   function Paid_Label
     (Amount_Text : String;
      Paid_Text   : String := "")
      return Humanize.Status.Text_Result
   is
      Amount : constant String := Clean (Amount_Text);
      Paid   : constant String := Clean (Paid_Text);
   begin
      if Amount'Length = 0 then
         return Invalid_Text ("invalid amount");
      elsif Paid'Length = 0 then
         return Ok_Text (Amount & " paid");
      else
         return Ok_Text (Amount & " paid " & Paid);
      end if;
   end Paid_Label;

   function Refund_Label
     (Amount_Text : String;
      State       : Payment_State := Refunded_Payment)
      return Humanize.Status.Text_Result
   is
      Amount : constant String := Clean (Amount_Text);
   begin
      if Amount'Length = 0 then
         return Invalid_Text ("invalid amount");
      else
         return Ok_Text (Amount & " " & Payment_State_Suffix (State) & " refund");
      end if;
   end Refund_Label;

   function Method_Label
     (Method : Payment_Method;
      Detail : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Detail);
   begin
      if Label'Length = 0 then
         return Ok_Text ("paid by " & Method_Suffix (Method));
      else
         return Ok_Text ("paid by " & Method_Suffix (Method) & ": " & Label);
      end if;
   end Method_Label;

   function Receipt_Label
     (Number : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Number);
   begin
      if Label'Length = 0 then
         return Ok_Text ("receipt");
      else
         return Ok_Text ("receipt " & Label);
      end if;
   end Receipt_Label;

   function Balance_Label
     (Amount_Text : String)
      return Humanize.Status.Text_Result
   is
      Amount : constant String := Clean (Amount_Text);
   begin
      if Amount'Length = 0 then
         return Invalid_Text ("invalid amount");
      else
         return Ok_Text ("balance " & Amount);
      end if;
   end Balance_Label;

   function Tax_Label
     (Amount_Text : String)
      return Humanize.Status.Text_Result
   is
      Amount : constant String := Clean (Amount_Text);
   begin
      if Amount'Length = 0 then
         return Invalid_Text ("invalid amount");
      else
         return Ok_Text ("tax " & Amount);
      end if;
   end Tax_Label;

   function Subtotal_Label
     (Amount_Text : String)
      return Humanize.Status.Text_Result
   is
      Amount : constant String := Clean (Amount_Text);
   begin
      if Amount'Length = 0 then
         return Invalid_Text ("invalid amount");
      else
         return Ok_Text ("subtotal " & Amount);
      end if;
   end Subtotal_Label;

   function Total_Label
     (Amount_Text : String)
      return Humanize.Status.Text_Result
   is
      Amount : constant String := Clean (Amount_Text);
   begin
      if Amount'Length = 0 then
         return Invalid_Text ("invalid amount");
      else
         return Ok_Text ("total " & Amount);
      end if;
   end Total_Label;

   function Discount_Label
     (Amount_Text : String)
      return Humanize.Status.Text_Result
   is
      Amount : constant String := Clean (Amount_Text);
   begin
      if Amount'Length = 0 then
         return Invalid_Text ("invalid discount");
      else
         return Ok_Text ("discount " & Amount);
      end if;
   end Discount_Label;

   function Chargeback_Label
     (Amount_Text : String := "")
      return Humanize.Status.Text_Result
   is
      Amount : constant String := Clean (Amount_Text);
   begin
      if Amount'Length = 0 then
         return Ok_Text ("chargeback");
      else
         return Ok_Text ("chargeback " & Amount);
      end if;
   end Chargeback_Label;

   function Payment_Link_Label
     (Name : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Ok_Text ("payment link");
      else
         return Ok_Text (Label & " payment link");
      end if;
   end Payment_Link_Label;

   procedure Payment_State_Label_Into
     (State   : Payment_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Payment_State_Label (State), Target, Written, Status);
   end Payment_State_Label_Into;

   procedure Invoice_State_Label_Into
     (State   : Invoice_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Invoice_State_Label (State), Target, Written, Status);
   end Invoice_State_Label_Into;

   procedure Payment_Method_Label_Into
     (Method  : Payment_Method;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Payment_Method_Label (Method), Target, Written, Status);
   end Payment_Method_Label_Into;

   procedure Payment_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Payment_Count_Label (Count), Target, Written, Status);
   end Payment_Count_Label_Into;

   procedure Invoice_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Invoice_Count_Label (Count), Target, Written, Status);
   end Invoice_Count_Label_Into;

   procedure Amount_Label_Into
     (Amount_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Amount_Label (Amount_Text), Target, Written, Status);
   end Amount_Label_Into;

   procedure Payment_Label_Into
     (Amount_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      State       : Payment_State := Paid_Payment)
   is
   begin
      Copy_Result (Payment_Label (Amount_Text, State), Target, Written, Status);
   end Payment_Label_Into;

   procedure Payment_Label_Into
     (Amount_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      State       : Payment_State;
      Options     : Payment_Label_Options)
   is
   begin
      Copy_Result
        (Payment_Label (Amount_Text, State, Options), Target, Written, Status);
   end Payment_Label_Into;

   procedure Invoice_Label_Into
     (Number  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Invoice_State := Open_Invoice)
   is
   begin
      Copy_Result (Invoice_Label (Number, State), Target, Written, Status);
   end Invoice_Label_Into;

   procedure Invoice_Label_Into
     (Number  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Invoice_State;
      Options : Payment_Label_Options)
   is
   begin
      Copy_Result (Invoice_Label (Number, State, Options), Target, Written, Status);
   end Invoice_Label_Into;

   procedure Due_Label_Into
     (Amount_Text : String;
      Due_Text    : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Due_Label (Amount_Text, Due_Text), Target, Written, Status);
   end Due_Label_Into;

   procedure Paid_Label_Into
     (Amount_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Paid_Text   : String := "")
   is
   begin
      Copy_Result (Paid_Label (Amount_Text, Paid_Text), Target, Written, Status);
   end Paid_Label_Into;

   procedure Refund_Label_Into
     (Amount_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      State       : Payment_State := Refunded_Payment)
   is
   begin
      Copy_Result (Refund_Label (Amount_Text, State), Target, Written, Status);
   end Refund_Label_Into;

   procedure Method_Label_Into
     (Method  : Payment_Method;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Detail  : String := "")
   is
   begin
      Copy_Result (Method_Label (Method, Detail), Target, Written, Status);
   end Method_Label_Into;

   procedure Receipt_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Number  : String := "")
   is
   begin
      Copy_Result (Receipt_Label (Number), Target, Written, Status);
   end Receipt_Label_Into;

   procedure Balance_Label_Into
     (Amount_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Balance_Label (Amount_Text), Target, Written, Status);
   end Balance_Label_Into;

   procedure Tax_Label_Into
     (Amount_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Tax_Label (Amount_Text), Target, Written, Status);
   end Tax_Label_Into;

   procedure Subtotal_Label_Into
     (Amount_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Subtotal_Label (Amount_Text), Target, Written, Status);
   end Subtotal_Label_Into;

   procedure Total_Label_Into
     (Amount_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Total_Label (Amount_Text), Target, Written, Status);
   end Total_Label_Into;

   procedure Discount_Label_Into
     (Amount_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Discount_Label (Amount_Text), Target, Written, Status);
   end Discount_Label_Into;

   procedure Chargeback_Label_Into
     (Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Amount_Text : String := "")
   is
   begin
      Copy_Result (Chargeback_Label (Amount_Text), Target, Written, Status);
   end Chargeback_Label_Into;

   procedure Payment_Link_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
   begin
      Copy_Result (Payment_Link_Label (Name), Target, Written, Status);
   end Payment_Link_Label_Into;

end Humanize.Payments;
