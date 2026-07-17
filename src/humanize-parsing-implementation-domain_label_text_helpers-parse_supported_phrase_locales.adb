separate (Humanize.Parsing.Implementation.Domain_Label_Text_Helpers)
function Parse_Supported_Phrase_Locales
     (Text : String)
      return Phrase_Locales_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Count : constant Natural := Count_Words (Item);
      Has_Generated : Boolean := False;
      Word_Start : Natural := 0;
begin
      if Count = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Empty_Input,
                 others => <>);
      end if;

      for Index in Item'Range loop
         if Item (Index) = ' ' then
            if Word_Start /= 0 then
               declare
                  Word : constant String := Item (Word_Start .. Index - 1);
               begin
                  if not Humanize.Phrases.Is_Supported_Phrase_Locale (Word) then
                     return
                       (Status => Humanize.Status.Invalid_Argument,
                        Exact => False,
                        Consumed => Word_Start - 1,
                        Error_Position => Word_Start,
                        Error => Unsupported_Form,
                        others => <>);
                  end if;
                  Has_Generated :=
                    Has_Generated
                    or else Humanize.Phrases.Is_Generated_Phrase_Locale (Word);
               end;
               Word_Start := 0;
            end if;
         elsif Word_Start = 0 then
            Word_Start := Index;
         end if;
      end loop;

      if Word_Start /= 0 then
         declare
            Word : constant String := Item (Word_Start .. Item'Last);
         begin
            if not Humanize.Phrases.Is_Supported_Phrase_Locale (Word) then
               return
                 (Status => Humanize.Status.Invalid_Argument,
                  Exact => False,
                  Consumed => Word_Start - 1,
                  Error_Position => Word_Start,
                  Error => Unsupported_Form,
                  others => <>);
            end if;
            Has_Generated :=
              Has_Generated
              or else Humanize.Phrases.Is_Generated_Phrase_Locale (Word);
         end;
      end if;

      return
        (Status => Humanize.Status.Ok,
         Locale_Count => Count,
         Has_Generated_Locales => Has_Generated,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
end Parse_Supported_Phrase_Locales;
