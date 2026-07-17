separate (Humanize.Parsing.Implementation.String_Text_Helpers)
function Parse_Text_Time_Label
     (Text : String)
      return Text_Time_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Prefix : constant String := "less than 1 minute ";
      Mark : constant String := " minutes ";
      Compact_Mark : constant String := " min ";
      Mark_At : constant Natural := Find_Substring (Item, Mark);
      Compact_At : constant Natural := Find_Substring (Item, Compact_Mark);
      Minutes : Natural := 0;
      Less_Than : Boolean := False;
      Suffix_Buffer : String (1 .. 16);
      Suffix_Length : Natural;
begin
      if Starts_With (Item, Prefix) then
         Minutes := 1;
         Less_Than := True;
         Store (Item (Item'First + Prefix'Length .. Item'Last),
                Suffix_Buffer, Suffix_Length);
      elsif Mark_At /= 0
        and then Parse_Natural_Field (Item (Item'First .. Mark_At - 1), Minutes)
      then
         Store (Item (Mark_At + Mark'Length .. Item'Last),
                Suffix_Buffer, Suffix_Length);
      elsif Compact_At /= 0
        and then Parse_Natural_Field
          (Item (Item'First .. Compact_At - 1), Minutes)
      then
         Store (Item (Compact_At + Compact_Mark'Length .. Item'Last),
                Suffix_Buffer, Suffix_Length);
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Minutes => Minutes,
         Less_Than => Less_Than,
         Suffix => Suffix_Buffer,
         Suffix_Length => Suffix_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Text_Time_Label;
