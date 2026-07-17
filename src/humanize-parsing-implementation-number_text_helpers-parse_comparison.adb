separate (Humanize.Parsing.Implementation.Number_Text_Helpers)
function Parse_Comparison
     (Text        : String;
      Larger_Word : String;
      Smaller_Word : String;
      Percent     : Boolean;
      Byte_Size   : Boolean)
      return Comparison_Parse_Result
   is
      Item : constant String := Trim (Text);
      Low  : constant String := Lower (Item);
      Is_At : constant Natural := Find_Substring (Low, " is ");
      Equal_At : constant Natural := Find_Substring (Low, " is equal to ");
      Same_Size_At : constant Natural := Find_Substring (Low, " is the same size as ");
      Same_Date_At : constant Natural := Find_Substring (Low, " is the same date as ");
      Than_Text : constant String := " " & Larger_Word & " than ";
      Than_Text_2 : constant String := " " & Smaller_Word & " than ";
      Larger_At : constant Natural := Find_Substring (Low, Than_Text);
      Smaller_At : constant Natural := Find_Substring (Low, Than_Text_2);
      Current_Buffer : String (1 .. 64);
      Baseline_Buffer : String (1 .. 64);
      Unit_Buffer : String (1 .. 32);
      Current_Length : Natural;
      Baseline_Length : Natural;
      Unit_Length : Natural := 0;
      Difference : Long_Float := 0.0;
      Direction : Comparison_Direction := Comparison_Equal;
      Tail : Unbounded_String;
begin
      if Equal_At /= 0 then
         Store (Trim (Item (Item'First .. Equal_At - 1)),
                Current_Buffer, Current_Length);
         Store (Trim (Item (Equal_At + 13 .. Item'Last)),
                Baseline_Buffer, Baseline_Length);
      elsif Same_Size_At /= 0 then
         Store (Trim (Item (Item'First .. Same_Size_At - 1)),
                Current_Buffer, Current_Length);
         Store (Trim (Item (Same_Size_At + 21 .. Item'Last)),
                Baseline_Buffer, Baseline_Length);
      elsif Same_Date_At /= 0 then
         Store (Trim (Item (Item'First .. Same_Date_At - 1)),
                Current_Buffer, Current_Length);
         Store (Trim (Item (Same_Date_At + 21 .. Item'Last)),
                Baseline_Buffer, Baseline_Length);
      elsif Is_At /= 0 and then (Larger_At /= 0 or else Smaller_At /= 0) then
         declare
            Dir_At : constant Natural :=
              (if Larger_At /= 0 then Larger_At else Smaller_At);
            Mid : constant String := Trim (Item (Is_At + 4 .. Dir_At - 1));
            Parsed_Bytes : Byte_Parse_Result;
         begin
            Store (Trim (Item (Item'First .. Is_At - 1)),
                   Current_Buffer, Current_Length);
            Store
              (Trim
                 (Item
                    (Dir_At
                     + (if Larger_At /= 0 then Than_Text'Length
                        else Than_Text_2'Length) .. Item'Last)),
               Baseline_Buffer, Baseline_Length);

            if Larger_At /= 0 then
               if Larger_Word = "higher" then
                  Direction := Comparison_Higher;
               elsif Larger_Word = "larger" then
                  Direction := Comparison_Larger;
               else
                  Direction := Comparison_After;
               end if;
            else
               if Smaller_Word = "lower" then
                  Direction := Comparison_Lower;
               elsif Smaller_Word = "smaller" then
                  Direction := Comparison_Smaller;
               else
                  Direction := Comparison_Before;
               end if;
            end if;

            if Byte_Size then
               Parsed_Bytes := Parse_Bytes (Mid);
               if Parsed_Bytes.Status /= Humanize.Status.Ok then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error => Expected_Number,
                          others => <>);
               end if;
               Difference := Long_Float (Parsed_Bytes.Value);
            elsif Percent then
               if not Ends_With (Mid, "%")
                 or else not Numeric_Value (Mid (Mid'First .. Mid'Last - 1), Difference)
               then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error => Expected_Number,
                          others => <>);
               end if;
            elsif not Parse_Number_And_Tail (Mid, Difference, Tail) then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Number,
                       others => <>);
            else
               Store (To_String (Tail), Unit_Buffer, Unit_Length);
            end if;
         end;
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      if Unit_Length = 0 then
         Store ("", Unit_Buffer, Unit_Length);
      end if;
      return
        (Status => Humanize.Status.Ok,
         Difference => Difference,
         Direction => Direction,
         Current_Label => Current_Buffer,
         Current_Label_Length => Current_Length,
         Baseline_Label => Baseline_Buffer,
         Baseline_Label_Length => Baseline_Length,
         Unit => Unit_Buffer,
         Unit_Length => Unit_Length,
         Percent => Percent,
         Byte_Size => Byte_Size,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Comparison;
