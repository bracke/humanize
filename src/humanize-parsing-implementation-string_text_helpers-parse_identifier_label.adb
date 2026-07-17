separate (Humanize.Parsing.Implementation.String_Text_Helpers)
function Parse_Identifier_Label
     (Text : String;
      Separator : Character := '_')
      return Identifier_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Buffer : String (1 .. 160);
      Length : Natural;
      Tokens : Natural := (if Item'Length = 0 then 0 else 1);
      Has_Separator : Boolean := False;
      Lowercase : Boolean := True;
      Leading : constant Boolean :=
        Item'Length > 0 and then Item (Item'First) = Separator;
      Trailing : constant Boolean :=
        Item'Length > 0 and then Item (Item'Last) = Separator;
      Repeated : Boolean := False;
      Previous_Was_Separator : Boolean := False;
begin
      for Ch of Item loop
         if Ch = Separator then
            Has_Separator := True;
            Tokens := Tokens + 1;
            if Previous_Was_Separator then
               Repeated := True;
            end if;
            Previous_Was_Separator := True;
         elsif not Is_Lower_Alnum_Or (Ch, Separator) then
            Lowercase := False;
            Previous_Was_Separator := False;
         else
            Previous_Was_Separator := False;
         end if;
      end loop;

      Store (Item, Buffer, Length);
      return
        (Status => Humanize.Status.Ok,
         Value => Buffer,
         Value_Length => Length,
         Token_Count => Tokens,
         Separator => Separator,
         Has_Separator => Has_Separator,
         Lowercase => Lowercase,
         Camel_Case => False,
         Natural_Sort_Key => False,
         Numeric_Run_Count => 0,
         Leading_Separator => Leading,
         Trailing_Separator => Trailing,
         Repeated_Separator => Repeated,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
end Parse_Identifier_Label;
