separate (Humanize.Parsing.Implementation.String_Text_Helpers)
function Parse_Cleanup_Label
     (Text      : String;
      Separator : Character := ASCII.NUL)
      return Cleanup_Label_Parse_Result
   is
      Item : constant String := Text;
      Buffer : String (1 .. 160);
      Length : Natural;
      Entity_Count : Natural := 0;
      Break_Count : Natural := 0;
      Line_Feed_Count : Natural := 0;
      Whitespace_Run_Count : Natural := 0;
      Tag_Like_Count : Natural := 0;
      Separator_Count : Natural := 0;
      Repeated_Separator : Boolean := False;
      Previous_Separator : Boolean := False;
      In_Whitespace_Run : Boolean := False;
      Index : Natural := Item'First;
begin
      Store (Item, Buffer, Length);

      while Index <= Item'Last loop
         if Starts_At (Item, Index, "&amp;")
           or else Starts_At (Item, Index, "&lt;")
           or else Starts_At (Item, Index, "&gt;")
           or else Starts_At (Item, Index, "&quot;")
           or else Starts_At (Item, Index, "&#39;")
         then
            Entity_Count := Entity_Count + 1;
         end if;

         if Starts_At (Item, Index, "<br>")
           or else Starts_At (Item, Index, "<br/>")
           or else Starts_At (Item, Index, "<br />")
         then
            Break_Count := Break_Count + 1;
         end if;

         if Item (Index) = '<' then
            Tag_Like_Count := Tag_Like_Count + 1;
         end if;

         if Item (Index) = ASCII.LF then
            Line_Feed_Count := Line_Feed_Count + 1;
         end if;

         if Is_Space (Item (Index)) then
            if not In_Whitespace_Run then
               Whitespace_Run_Count := Whitespace_Run_Count + 1;
            end if;
            In_Whitespace_Run := True;
         else
            In_Whitespace_Run := False;
         end if;

         if Separator /= ASCII.NUL and then Item (Index) = Separator then
            Separator_Count := Separator_Count + 1;
            if Previous_Separator then
               Repeated_Separator := True;
            end if;
            Previous_Separator := True;
         elsif Separator /= ASCII.NUL then
            Previous_Separator := False;
         end if;

         Index := Index + 1;
      end loop;

      return
        (Status => Humanize.Status.Ok,
         Value => Buffer,
         Value_Length => Length,
         Empty => Item'Length = 0,
         Entity_Count => Entity_Count,
         Break_Count => Break_Count,
         Line_Feed_Count => Line_Feed_Count,
         Whitespace_Run_Count => Whitespace_Run_Count,
         Tag_Like_Count => Tag_Like_Count,
         Separator => Separator,
         Separator_Count => Separator_Count,
         Repeated_Separator => Repeated_Separator,
         Leading_Separator =>
           Separator /= ASCII.NUL
           and then Item'Length > 0
           and then Item (Item'First) = Separator,
         Trailing_Separator =>
           Separator /= ASCII.NUL
           and then Item'Length > 0
           and then Item (Item'Last) = Separator,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
end Parse_Cleanup_Label;
