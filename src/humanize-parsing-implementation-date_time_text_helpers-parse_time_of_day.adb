separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Parse_Time_Of_Day
     (Text   : String;
      Hour   : out Natural;
      Minute : out Natural;
      Consumed : out Natural)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
      Pos  : Natural := Item'First;
      H    : Natural := 0;
      M    : Natural := 0;
      Has_Hour : Boolean := False;
      PM : Boolean := False;
      AM : Boolean := False;
begin
      Hour := 0;
      Minute := 0;
      Consumed := 0;

      if Item = "morning" then
         Hour := 9;
         Consumed := Text'Length;
         return True;
      elsif Item = "noon" then
         Hour := 12;
         Consumed := Text'Length;
         return True;
      elsif Item = "afternoon" then
         Hour := 15;
         Consumed := Text'Length;
         return True;
      elsif Item = "evening" then
         Hour := 18;
         Consumed := Text'Length;
         return True;
      elsif Item = "night" then
         Hour := 21;
         Consumed := Text'Length;
         return True;
      end if;

      while Pos <= Item'Last and then Is_Digit (Item (Pos)) loop
         H := H * 10 + Digit_Value (Item (Pos));
         Pos := Pos + 1;
         Has_Hour := True;
      end loop;

      if not Has_Hour then
         return False;
      end if;

      if Pos <= Item'Last and then Item (Pos) = ':' then
         Pos := Pos + 1;
         if Pos > Item'Last or else not Is_Digit (Item (Pos)) then
            return False;
         end if;
         while Pos <= Item'Last and then Is_Digit (Item (Pos)) loop
            M := M * 10 + Digit_Value (Item (Pos));
            Pos := Pos + 1;
         end loop;
      end if;

      while Pos <= Item'Last and then Item (Pos) = ' ' loop
         Pos := Pos + 1;
      end loop;

      if Pos + 1 <= Item'Last and then Item (Pos .. Pos + 1) = "pm" then
         PM := True;
         Pos := Pos + 2;
      elsif Pos + 1 <= Item'Last and then Item (Pos .. Pos + 1) = "am" then
         AM := True;
         Pos := Pos + 2;
      end if;

      while Pos <= Item'Last and then Item (Pos) = ' ' loop
         Pos := Pos + 1;
      end loop;

      if Pos <= Item'Last or else M > 59 then
         return False;
      elsif PM and then H < 12 then
         H := H + 12;
      elsif AM and then H = 12 then
         H := 0;
      end if;

      if H > 23 then
         return False;
      end if;

      Hour := H;
      Minute := M;
      Consumed := Text'Length;
      return True;
end Parse_Time_Of_Day;
