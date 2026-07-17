separate (Humanize.Parsing.Implementation.Number_Text_Helpers)
function Parse_Currency_Core
     (Text        : String;
      Approximate : Boolean)
      return Currency_Parse_Result
   is
      Item : constant String := Trim (Text);
      Amount : Long_Float;
      Tail : Unbounded_String;
      Code_Text : String (1 .. 16);
      Code_Length : Natural;

      function Parse_Currency_Code
        (Token : String;
         Code  : out String;
         Length : out Natural)
         return Boolean
      is
         Clean : constant String := Trim (Token);

         function Is_Valid_Code (Value : String) return Boolean is
         begin
            if Value'Length < 3 or else Value'Length > 4 then
               return False;
            end if;
            for Index in Value'Range loop
               if not Is_ASCII_Letter (Value (Index)) then
                  return False;
               end if;
            end loop;
            return True;
         end Is_Valid_Code;
      begin
         if Clean'Length = 0 then
            return False;
         elsif Clean = "$" then
            Store ("USD", Code, Length);
            return True;
         elsif Clean = B ("E282AC") then
            Store ("EUR", Code, Length);
            return True;
         elsif Clean = B ("C2A3") then
            Store ("GBP", Code, Length);
            return True;
         elsif Clean = B ("C2A5") then
            Store ("JPY", Code, Length);
            return True;
         elsif Clean = B ("E282B9") then
            Store ("INR", Code, Length);
            return True;
         elsif Clean = B ("E282BD") then
            Store ("RUB", Code, Length);
            return True;
         elsif Clean = B ("E282B4") then
            Store ("UAH", Code, Length);
            return True;
         elsif Clean = B ("E282BA") then
            Store ("TRY", Code, Length);
            return True;
         elsif Clean = B ("E282A9") then
            Store ("KRW", Code, Length);
            return True;
         elsif Is_Valid_Code (Clean) then
            Store (Upper (Clean), Code, Length);
            return True;
         else
            return False;
         end if;
      end Parse_Currency_Code;

      function Parse_Number_First (Code : out String; Code_Len : out Natural)
         return Boolean
      is
         Tail_Text : constant String := Trim (To_String (Tail));
         Separator : Natural := 0;
      begin
         if Tail_Text'Length = 0 then
            return False;
         end if;

         for Index in Tail_Text'Range loop
            if Tail_Text (Index) = ' ' then
               Separator := Index;
               exit;
            end if;
         end loop;

         if Separator = 0 then
            return Parse_Currency_Code (Tail_Text, Code, Code_Len);
         end if;

         if not Parse_Currency_Code
           (Tail_Text (Tail_Text'First .. Separator - 1), Code, Code_Len)
         then
            return False;
         end if;

         return Trim (Tail_Text (Separator + 1 .. Tail_Text'Last)) = "";
      end Parse_Number_First;

      function Parse_Prefix_First (Code : out String; Code_Len : out Natural)
         return Boolean
      is
         Source : constant String := Trim (Item);
         Amount_Start : Natural;
         Prefix_Code : String (1 .. 16);
         Prefix_Length : Natural := 0;

         function Parse_Prefix_Amount
           (From : Natural;
            Code : out String;
            Code_Len : out Natural)
            return Boolean
         is
         begin
            if From = 0 or else From > Source'Last then
               return False;
            end if;

            if not Parse_Currency_Code
              (Source (Source'First .. From - 1), Code, Code_Len)
            then
               return False;
            end if;

            return Numeric_Value (Trim (Source (From .. Source'Last)), Amount);
         end Parse_Prefix_Amount;

      begin
         if Source'Length = 0 then
            return False;
         end if;

         for Prefix_Last in Source'First .. Source'Last loop
            if Prefix_Last - Source'First > 4 then
               exit;
            end if;
            Amount_Start := Prefix_Last + 1;
            if Amount_Start <= Source'Last
              and then Parse_Prefix_Amount (Amount_Start, Prefix_Code, Prefix_Length)
            then
               Code := Prefix_Code;
               Code_Len := Prefix_Length;
               return True;
            end if;
         end loop;

         return False;
      end Parse_Prefix_First;
begin
      if Parse_Number_And_Tail (Item, Amount, Tail)
        and then Parse_Number_First (Code_Text, Code_Length)
      then
         return
           (Status => Humanize.Status.Ok,
            Amount => Amount,
            Code => Code_Text,
            Code_Length => Code_Length,
            Approximate => Approximate,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Parse_Prefix_First (Code_Text, Code_Length) then
         return
           (Status => Humanize.Status.Ok,
            Amount => Amount,
            Code => Code_Text,
            Code_Length => Code_Length,
            Approximate => Approximate,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      else
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Expected_Number,
            others => <>);
      end if;
end Parse_Currency_Core;
