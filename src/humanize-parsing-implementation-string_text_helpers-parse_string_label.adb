separate (Humanize.Parsing.Implementation.String_Text_Helpers)
function Parse_String_Label
     (Text : String)
      return String_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Buffer : String (1 .. 160);
      Length : Natural;
      Has_Path_Separator : Boolean := False;
      Path_Separator : Character := ASCII.NUL;
      Path_Separator_Count : Natural := 0;
      Looks_Handle : Boolean := False;
begin
      for Ch of Item loop
         if Ch = '/' or else Ch = '\' then
            Has_Path_Separator := True;
            Path_Separator_Count := Path_Separator_Count + 1;
            if Path_Separator = ASCII.NUL then
               Path_Separator := Ch;
            end if;
         end if;
      end loop;
      Looks_Handle :=
        Item'Length > 1
        and then Item (Item'First) = '@'
        and then Find_Substring (Item, " ") = 0;

      Store (Item, Buffer, Length);
      return
        (Status => Humanize.Status.Ok,
         Value => Buffer,
         Value_Length => Length,
         Word_Count => Word_Count (Item),
         Empty => Item'Length = 0,
         Has_Space => Find_Substring (Item, " ") /= 0,
         Has_Dot => Find_Substring (Item, ".") /= 0,
         Has_Path_Separator => Has_Path_Separator,
         Path_Separator => Path_Separator,
         Path_Separator_Count => Path_Separator_Count,
         Has_At_Prefix => Item'Length > 0 and then Item (Item'First) = '@',
         Looks_Handle => Looks_Handle,
         ASCII_Only => ASCII_Only_Label (Item),
         Lowercase => Lowercase_Label (Item),
         Uppercase => Uppercase_Label (Item),
         Title_Case => Title_Case_Label (Item),
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
end Parse_String_Label;
