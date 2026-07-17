separate (Humanize.Colors.Support.Backend)
function Parse_Modern_Component_List
     (Text      : String;
      Tokens    : out Token_List;
      Count     : out Natural;
      Has_Slash : out Boolean)
      return Boolean
   is
      Start      : Natural := Text'First;
      In_Token   : Boolean := False;
      After_Slash : Boolean := False;
      Depth      : Natural := 0;

      procedure Push (Last : Natural; Valid : in out Boolean) is
      begin
         if not Valid then
            return;
         elsif not In_Token then
            return;
         elsif Count = Tokens'Last then
            Valid := False;
            return;
         end if;

         Count := Count + 1;
         Tokens (Count) := To_Unbounded_String (Trim (Text (Start .. Last)));
         In_Token := False;
      end Push;

      Valid : Boolean := True;
begin
      Tokens := [others => Null_Unbounded_String];
      Count := 0;
      Has_Slash := False;

      if Text'Length = 0 then
         return False;
      end if;

      for Index in Text'Range loop
         if Text (Index) = ',' and then Depth = 0 then
            return False;
         elsif Text (Index) = '(' then
            Depth := Depth + 1;
            if not In_Token then
               Start := Index;
               In_Token := True;
            end if;
         elsif Text (Index) = ')' then
            if Depth = 0 then
               return False;
            end if;
            Depth := Depth - 1;
         elsif Text (Index) = '/' and then Depth = 0 then
            Push (Index - 1, Valid);
            if not Valid or else Has_Slash or else Count not in 3 .. 4 then
               return False;
            end if;
            Has_Slash := True;
            After_Slash := True;
         elsif Is_Space (Text (Index)) and then Depth = 0 then
            Push (Index - 1, Valid);
            if not Valid then
               return False;
            end if;
         else
            if not In_Token then
               if After_Slash and then Count not in 3 .. 4 then
                  return False;
               end if;
               Start := Index;
               In_Token := True;
            end if;
         end if;
      end loop;

      if Depth /= 0 then
         return False;
      end if;

      Push (Text'Last, Valid);
      if not Valid then
         return False;
      end if;

      return Count in 3 .. 5
        and then (not Has_Slash or else Count in 4 .. 5);
end Parse_Modern_Component_List;
