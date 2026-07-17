separate (Humanize.Parsing.Implementation.String_Text_Helpers)
function Parse_Natural_Sort_Key
     (Text : String)
      return Identifier_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Buffer : String (1 .. 160);
      Length : Natural;
      Tokens : Natural := (if Item'Length = 0 then 0 else 1);
      Numeric_Runs : Natural := 0;
      Index : Natural := Item'First;
begin
      while Index <= Item'Last loop
         if Item (Index) = ' ' then
            Tokens := Tokens + 1;
            Index := Index + 1;
         elsif Item (Index) = '{' then
            declare
               Close : constant Natural :=
                 Find_Substring (Item (Index .. Item'Last), "}");
               Colon : constant Natural :=
                 Find_Substring (Item (Index .. Item'Last), ":");
            begin
               if Close = 0 or else Colon = 0 or else Colon > Close then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error => Unsupported_Form,
                          others => <>);
               end if;
               Numeric_Runs := Numeric_Runs + 1;
               Index := Close + 1;
            end;
         elsif Is_Lower (Item (Index)) or else Is_Digit (Item (Index)) then
            Index := Index + 1;
         else
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Unsupported_Form,
                    others => <>);
         end if;
      end loop;

      Store (Item, Buffer, Length);
      return
        (Status => Humanize.Status.Ok,
         Value => Buffer,
         Value_Length => Length,
         Token_Count => Tokens,
         Separator => ' ',
         Has_Separator => Find_Substring (Item, " ") /= 0,
         Lowercase => True,
         Camel_Case => False,
         Natural_Sort_Key => True,
         Numeric_Run_Count => Numeric_Runs,
         Leading_Separator => Item'Length > 0 and then Item (Item'First) = ' ',
         Trailing_Separator => Item'Length > 0 and then Item (Item'Last) = ' ',
         Repeated_Separator => Find_Substring (Item, "  ") /= 0,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
end Parse_Natural_Sort_Key;
