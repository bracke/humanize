separate (Humanize.Parsing.Implementation.Domain_Label_Text_Helpers)
function Parse_Phrase_Key
     (Text : String)
      return Phrase_Key_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Dot : constant Natural := Find_Substring (Item, ".");
      Prefix_Buffer : String (1 .. 16);
      Prefix_Length : Natural;
      Name_Buffer : String (1 .. 64);
      Name_Length : Natural;

      function Valid_Key_Part (Part : String) return Boolean is
      begin
         if Part'Length = 0 then
            return False;
         end if;
         for Ch of Part loop
            if not (Is_Lower (Ch) or else Is_Digit (Ch)
                    or else Ch = '_')
            then
               return False;
            end if;
         end loop;
         return True;
      end Valid_Key_Part;
begin
      if Dot = 0
        or else not Valid_Key_Part (Item (Item'First .. Dot - 1))
        or else not Valid_Key_Part (Item (Dot + 1 .. Item'Last))
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      Store (Item (Item'First .. Dot - 1), Prefix_Buffer, Prefix_Length);
      Store (Item (Dot + 1 .. Item'Last), Name_Buffer, Name_Length);
      return
        (Status => Humanize.Status.Ok,
         Prefix => Prefix_Buffer,
         Prefix_Length => Prefix_Length,
         Name => Name_Buffer,
         Name_Length => Name_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
exception
      when Constraint_Error => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Phrase_Key;
