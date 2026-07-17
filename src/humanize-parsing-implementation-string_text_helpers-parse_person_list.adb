separate (Humanize.Parsing.Implementation.String_Text_Helpers)
function Parse_Person_List
     (Text : String)
      return Person_List_Parse_Result
   is
      Item : constant String := Trim (Text);
      And_At : constant Natural := Find_Substring (Item, " and ");
      Other_Count : Natural := 0;
      Visible : Natural := 0;
      Amount : Long_Float;
      Tail : Unbounded_String;
begin
      if Item'Length = 0 or else Item = "no one" then
         return
           (Status => Humanize.Status.Ok,
            Empty => True,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      end if;

      if And_At /= 0
        and then Parse_Number_And_Tail
          (Item (And_At + 5 .. Item'Last), Amount, Tail)
        and then (To_String (Tail) = "other"
                  or else To_String (Tail) = "others")
      then
         Other_Count := Natural (Long_Float'Rounding (Amount));
         declare
            Prefix : constant String := Item (Item'First .. And_At - 1);
         begin
            Visible := 1;
            for Ch of Prefix loop
               if Ch = ',' then
                  Visible := Visible + 1;
               end if;
            end loop;
         end;
      else
         Visible := 1;
         for Ch of Item loop
            if Ch = ',' then
               Visible := Visible + 1;
            end if;
         end loop;
         if And_At /= 0 then
            Visible := Visible + 1;
         end if;
      end if;

      return
        (Status => Humanize.Status.Ok,
         Visible_Count => Visible,
         Other_Count => Other_Count,
         Empty => False,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Person_List;
