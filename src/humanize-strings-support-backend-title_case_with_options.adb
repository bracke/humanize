separate (Humanize.Strings.Support.Backend)
function Title_Case_With_Options
     (Text    : String;
      Options : Title_Case_Options := Default_Title_Case_Options)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      Word   : Unbounded_String;
      Count  : Natural := 0;

      procedure Flush is
         Raw : constant String := To_String (Word);
         Low : Unbounded_String;
      begin
         if Raw'Length = 0 then
            return;
         end if;

         for Ch of Raw loop
            Append (Low, Lower (Ch));
         end loop;

         declare
            L : constant String := To_String (Low);
         begin
            if Count > 0 then
               Append (Result, " ");
            end if;
            if Options.Preserve_Acronyms and then Is_Acronym (L) then
               for Ch of L loop
                  Append (Result, Upper (Ch));
               end loop;
            elsif Options.Lowercase_Small_Words
              and then Count > 0
              and then Is_Small_Title_Word (L)
            then
               Append (Result, L);
            else
               Append (Result, Upper (L (L'First)));
               if L'Length > 1 then
                  Append (Result, L (L'First + 1 .. L'Last));
               end if;
            end if;
            Count := Count + 1;
         end;
         Word := Null_Unbounded_String;
      end Flush;
begin
      for Ch of Text loop
         if Is_Alnum (Ch) then
            Append (Word, Ch);
         else
            Flush;
         end if;
      end loop;
      Flush;
      return Ok_Text (To_String (Result));
end Title_Case_With_Options;
