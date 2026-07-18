separate (Humanize.Parsing.Implementation.Duration_Text_Helpers)
function Parse_ISO_Duration_Microseconds
     (Text  : String;
      Value : out Long_Long_Integer)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Index : Natural;
      Total : Long_Float := 0.0;
      Seen  : Boolean := False;
      In_Time : Boolean := False;

      function Designator_Microseconds (Ch : Character) return Long_Float is
      begin
         case Ch is
            when 'Y' =>
               return Long_Float (365 * 86_400) * 1_000_000.0;
            when 'M' =>
               return (if In_Time then 60_000_000.0
                       else Long_Float (30 * 86_400) * 1_000_000.0);
            when 'W' =>
               return Long_Float (7 * 86_400) * 1_000_000.0;
            when 'D' =>
               return 86_400_000_000.0;
            when 'H' =>
               return 3_600_000_000.0;
            when 'S' =>
               return 1_000_000.0;
            when others =>
               return 0.0;
         end case;
      end Designator_Microseconds;
begin
      Value := 0;
      if Item'Length < 3 or else Item (Item'First) /= 'P' then
         return False;
      end if;

      Index := Item'First + 1;
      while Index <= Item'Last loop
         if Item (Index) = 'T' then
            if In_Time then
               return False;
            end if;
            In_Time := True;
            Index := Index + 1;
         else
            declare
               Number_First : constant Natural := Index;
               Amount : Long_Float;
               Unit_Micros : Long_Float;
            begin
               while Index <= Item'Last
                 and then (Is_Digit (Item (Index))
                           or else Item (Index) = '.'
                           or else Item (Index) = ',')
               loop
                  Index := Index + 1;
               end loop;

               if Index = Number_First
                 or else Index > Item'Last
                 or else not Numeric_Value
                   (Item (Number_First .. Index - 1), Amount)
               then
                  return False;
               end if;

               Unit_Micros := Designator_Microseconds (Item (Index));
               if Unit_Micros = 0.0
                 or else Amount < 0.0
                 or else (In_Time and then Item (Index) in 'Y' | 'W' | 'D')
                 or else ((not In_Time) and then Item (Index) in 'H' | 'S')
               then
                  return False;
               end if;

               Total := Total + Amount * Unit_Micros;
               Seen := True;
               Index := Index + 1;
            end;
         end if;
      end loop;

      if not Seen then
         return False;
      end if;

      Value := Rounded_Nonnegative (Total);
      return Value >= 0;
exception
      when Constraint_Error =>
         return False;
end Parse_ISO_Duration_Microseconds;
