separate (Humanize.Colors.Support.Backend)
function Parse_Calc
     (Text         : String;
      Percent_Base : Long_Float;
      Value        : out Long_Float)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Pos  : Natural := Item'First;

      procedure Skip_Spaces is
      begin
         while Pos <= Item'Last and then Is_Space (Item (Pos)) loop
            Pos := Pos + 1;
         end loop;
      end Skip_Spaces;

      function Parse_Expression (Result : out Long_Float) return Boolean;

      function Parse_Number (Result : out Long_Float) return Boolean is
         Start : Natural;
         Raw   : Long_Float;
      begin
         Skip_Spaces;
         Start := Pos;
         if Pos <= Item'Last and then (Item (Pos) = '+' or else Item (Pos) = '-') then
            Pos := Pos + 1;
         end if;
         while Pos <= Item'Last
           and then (Is_Digit (Item (Pos)) or else Item (Pos) = '.')
         loop
            Pos := Pos + 1;
         end loop;
         if Pos <= Item'Last and then (Item (Pos) = 'e' or else Item (Pos) = 'E') then
            Pos := Pos + 1;
            if Pos <= Item'Last
              and then (Item (Pos) = '+' or else Item (Pos) = '-')
            then
               Pos := Pos + 1;
            end if;
            while Pos <= Item'Last and then Is_Digit (Item (Pos)) loop
               Pos := Pos + 1;
            end loop;
         end if;
         if Start > Item'Last or else Start = Pos then
            Result := 0.0;
            return False;
         end if;
         if not Parse_Float (Item (Start .. Pos - 1), Raw) then
            Result := 0.0;
            return False;
         end if;
         if Pos <= Item'Last and then Item (Pos) = '%' then
            Result := Raw * Percent_Base / 100.0;
            Pos := Pos + 1;
         else
            Result := Raw;
         end if;
         return True;
      end Parse_Number;

      function Parse_Factor (Result : out Long_Float) return Boolean is
      begin
         Skip_Spaces;
         if Pos <= Item'Last and then Item (Pos) = '(' then
            Pos := Pos + 1;
            if not Parse_Expression (Result) then
               return False;
            end if;
            Skip_Spaces;
            if Pos > Item'Last or else Item (Pos) /= ')' then
               Result := 0.0;
               return False;
            end if;
            Pos := Pos + 1;
            return True;
         else
            return Parse_Number (Result);
         end if;
      end Parse_Factor;

      function Parse_Term (Result : out Long_Float) return Boolean is
         Right : Long_Float;
      begin
         if not Parse_Factor (Result) then
            return False;
         end if;
         loop
            Skip_Spaces;
            exit when Pos > Item'Last or else Item (Pos) not in '*' | '/';
            declare
               Op : constant Character := Item (Pos);
            begin
               Pos := Pos + 1;
               if not Parse_Factor (Right) then
                  return False;
               end if;
               if Op = '*' then
                  Result := Result * Right;
               elsif Right = 0.0 then
                  Result := 0.0;
                  return False;
               else
                  Result := Result / Right;
               end if;
            end;
         end loop;
         return True;
      end Parse_Term;

      function Parse_Expression (Result : out Long_Float) return Boolean is
         Right : Long_Float;
      begin
         if not Parse_Term (Result) then
            return False;
         end if;
         loop
            Skip_Spaces;
            exit when Pos > Item'Last or else Item (Pos) not in '+' | '-';
            declare
               Op : constant Character := Item (Pos);
            begin
               Pos := Pos + 1;
               if not Parse_Term (Right) then
                  return False;
               end if;
               if Op = '+' then
                  Result := Result + Right;
               else
                  Result := Result - Right;
               end if;
            end;
         end loop;
         return True;
      end Parse_Expression;
begin
      Value := 0.0;
      if not Starts_With (Item, "calc(") or else not Ends_With (Item, ")") then
         return False;
      end if;
      Pos := Item'First + 5;
      if not Parse_Expression (Value) then
         return False;
      end if;
      Skip_Spaces;
      return Pos = Item'Last;
end Parse_Calc;
