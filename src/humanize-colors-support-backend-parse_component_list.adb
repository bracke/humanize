separate (Humanize.Colors.Support.Backend)
function Parse_Component_List
     (Text   : String;
      Tokens : out Token_List;
      Count  : out Natural)
      return Boolean
   is
      Start : Natural := Text'First;
      Depth : Natural := 0;
begin
      Tokens := [others => Null_Unbounded_String];
      Count := 0;

      for Index in Text'Range loop
         if Text (Index) = '(' then
            Depth := Depth + 1;
         elsif Text (Index) = ')' then
            if Depth = 0 then
               return False;
            end if;
            Depth := Depth - 1;
         elsif Text (Index) = ',' and then Depth = 0 then
            if Count = Tokens'Last then
               return False;
            end if;
            Count := Count + 1;
            Tokens (Count) := To_Unbounded_String (Trim (Text (Start .. Index - 1)));
            Start := Index + 1;
         end if;
      end loop;

      if Depth /= 0 then
         return False;
      end if;

      if Count = Tokens'Last then
         return False;
      end if;
      Count := Count + 1;
      Tokens (Count) := To_Unbounded_String (Trim (Text (Start .. Text'Last)));

      for Index in 1 .. Count loop
         if Length (Tokens (Index)) = 0 then
            return False;
         end if;
      end loop;
      return True;
end Parse_Component_List;
