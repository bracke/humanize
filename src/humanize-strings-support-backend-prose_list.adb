separate (Humanize.Strings.Support.Backend)
function Prose_List
     (Items   : Name_List;
      Options : Prose_List_Options := Default_Prose_List_Options)
      return Humanize.Status.Text_Result
   is
      Clean_Items : array (Items'Range) of Unbounded_String;
      Count       : Natural := 0;
      Result      : Unbounded_String;
      Conj        : constant String := Prose_Conjunction (Options.Conjunction);
begin
      for Index in Items'Range loop
         declare
            Item : constant String :=
              Result_Text (Squish (To_String (Items (Index))));
         begin
            if Item'Length > 0 then
               Count := Count + 1;
               Clean_Items (Items'First + Count - 1) := To_Unbounded_String (Item);
            end if;
         end;
      end loop;

      if Count = 0 then
         return Ok_Text (String'(1 => Options.Empty_Text));
      elsif Count = 1 then
         return Ok_Text (To_String (Clean_Items (Items'First)));
      elsif Count = 2 then
         return Ok_Text (To_String (Clean_Items (Items'First)) & " " & Conj & " "
            & To_String (Clean_Items (Items'First + 1)));
      end if;

      for Offset in 0 .. Count - 1 loop
         if Offset > 0 then
            if Offset = Count - 1 then
               Append (Result, (if Options.Oxford_Comma then ", " else " "));
               Append (Result, Conj & " ");
            else
               Append (Result, ", ");
            end if;
         end if;
         Append (Result, To_String (Clean_Items (Items'First + Offset)));
      end loop;
      return Ok_Text (To_String (Result));
end Prose_List;
