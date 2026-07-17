separate (Humanize.Strings.Support.Backend)
function Contains_List_Word
     (List : String;
      Word : String)
      return Boolean
   is
      Item : Unbounded_String;

      procedure Flush (Found : in out Boolean) is
         Raw : constant String := To_String (Item);
         Low : Unbounded_String;
      begin
         for Ch of Raw loop
            Append (Low, Lower (Ch));
         end loop;
         if To_String (Low) = Word then
            Found := True;
         end if;
         Item := Null_Unbounded_String;
      end Flush;

      Found : Boolean := False;
begin
      for Ch of List loop
         if Ch = ',' or else Ch = ' ' or else Ch = ASCII.HT or else Ch = ASCII.LF then
            if Length (Item) > 0 then
               Flush (Found);
            end if;
         else
            Append (Item, Ch);
         end if;
      end loop;
      if Length (Item) > 0 then
         Flush (Found);
      end if;
      return Found;
end Contains_List_Word;
