separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Parse_Date_Comparison
     (Text : String)
      return Date_Comparison_Parse_Result
   is
      Item : constant String := Trim (Text);
      Low  : constant String := Lower (Item);
      Same_At : constant Natural :=
        Find_Substring (Low, " is the same date as ");
      Is_At : constant Natural := Find_Substring (Low, " is ");
      Before_Mark : constant String := " before ";
      After_Mark : constant String := " after ";
      Before_At : constant Natural := Find_Substring (Low, Before_Mark);
      After_At : constant Natural := Find_Substring (Low, After_Mark);
      Current_Buffer : String (1 .. 64);
      Baseline_Buffer : String (1 .. 64);
      Current_Length : Natural;
      Baseline_Length : Natural;
      Years : Natural := 0;
      Months : Natural := 0;
      Days : Natural := 0;
      Direction : Comparison_Direction := Comparison_Equal;
begin
      if Same_At /= 0 then
         Store (Trim (Item (Item'First .. Same_At - 1)),
                Current_Buffer, Current_Length);
         Store (Trim (Item (Same_At + 21 .. Item'Last)),
                Baseline_Buffer, Baseline_Length);
      elsif Is_At /= 0 and then (Before_At /= 0 or else After_At /= 0) then
         declare
            Direction_At : constant Natural :=
              (if Before_At /= 0 then Before_At else After_At);
            Mark_Length : constant Natural :=
              (if Before_At /= 0 then Before_Mark'Length else After_Mark'Length);
            Diff_Text : constant String :=
              Trim (Item (Is_At + 4 .. Direction_At - 1));
         begin
            Store (Trim (Item (Item'First .. Is_At - 1)),
                   Current_Buffer, Current_Length);
            Store (Trim (Item (Direction_At + Mark_Length .. Item'Last)),
                   Baseline_Buffer, Baseline_Length);
            if not Parse_Date_Difference_Components
              (Diff_Text, Years, Months, Days)
            then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Number,
                       others => <>);
            end if;
            Direction :=
              (if Before_At /= 0 then Comparison_Before
               else Comparison_After);
         end;
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Years => Years,
         Months => Months,
         Days => Days,
         Direction => Direction,
         Current_Label => Current_Buffer,
         Current_Label_Length => Current_Length,
         Baseline_Label => Baseline_Buffer,
         Baseline_Label_Length => Baseline_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
exception
      when others => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Date_Comparison;
