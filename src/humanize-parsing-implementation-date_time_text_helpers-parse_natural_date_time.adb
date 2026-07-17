separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Parse_Natural_Date_Time
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Natural_Date_Time_Parse_Result
   is
      Item : constant String := Trim (Text);
      Lower_Item : constant String := Lower (Item);
      Separator : Natural := 0;
      Hour : Natural;
      Minute : Natural;
      Time_Consumed : Natural;
begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Empty_Input,
            others => <>);
      end if;

      declare
         Duration_Result : constant Duration_Parse_Result :=
           Parse_Lenient_Duration (Item);
      begin
         if Duration_Result.Status = Humanize.Status.Ok
           and then Duration_Result.Consumed = Item'Length
         then
            return Natural_Date_Time_Result
              (Reference + Duration (Duration_Result.Value),
               Text'Length, False, True);
         end if;
      end;

      if Lower_Item'Length > 3
        and then Lower_Item (Lower_Item'First .. Lower_Item'First + 2) = "in "
      then
         declare
            Tail : constant String :=
              Item (Item'First + 3 .. Item'Last);
            Duration_Result : constant Duration_Parse_Result :=
              Parse_Lenient_Duration (Tail);
         begin
            if Duration_Result.Status = Humanize.Status.Ok
              and then Duration_Result.Consumed = Tail'Length
            then
               return Natural_Date_Time_Result
                 (Reference + Duration (Duration_Result.Value),
                  Text'Length, False, True);
            end if;
         end;
      end if;

      Separator := Find_Substring (Lower_Item, " at ");
      if Separator = 0 then
         for Index in reverse Lower_Item'Range loop
            if Lower_Item (Index) = ' ' then
               declare
                  Tail : constant String := Lower_Item (Index + 1 .. Lower_Item'Last);
               begin
                  if Parse_Time_Of_Day (Tail, Hour, Minute, Time_Consumed) then
                     Separator := Index;
                     exit;
                  end if;
               end;
            end if;
         end loop;
      end if;

      if Separator /= 0 then
         declare
            Date_Text : constant String :=
              (if Separator + 3 <= Lower_Item'Last
                 and then Lower_Item (Separator .. Separator + 3) = " at "
               then Item (Item'First .. Item'First + Separator - 2)
               else Item (Item'First .. Item'First + Separator - 2));
            Time_First : constant Natural :=
              (if Separator + 3 <= Lower_Item'Last
                 and then Lower_Item (Separator .. Separator + 3) = " at "
               then Item'First + Separator + 3
               else Item'First + Separator);
            Date_Result : constant Date_Parse_Result :=
              Parse_Natural_Date (Reference, Date_Text);
         begin
            if Date_Result.Status = Humanize.Status.Ok
              and then Parse_Time_Of_Day
                (Item (Time_First .. Item'Last), Hour, Minute, Time_Consumed)
            then
               return Natural_Date_Time_Result
                 (With_Clock_Time (Date_Result.Value, Hour, Minute),
                  Text'Length, True, False);
            end if;
         end;
      end if;

      declare
         Date_Result : constant Date_Parse_Result :=
           Parse_Natural_Date (Reference, Item);
      begin
         if Date_Result.Status = Humanize.Status.Ok then
            return Natural_Date_Time_Result
              (Date_Result.Value, Text'Length, False, False);
         else
            return
              (Status => Date_Result.Status,
               Value => Date_Result.Value,
               Has_Time => False,
               Has_Relative_Offset => False,
               Exact => False,
               Consumed => 0,
               Error_Position => Date_Result.Error_Position,
               Error => Diagnostic
                 (Date_Result.Status, Date_Result.Error_Position,
                  Date_Result.Error));
         end if;
      end;
end Parse_Natural_Date_Time;
