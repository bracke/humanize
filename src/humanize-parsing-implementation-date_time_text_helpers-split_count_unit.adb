separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Split_Count_Unit
     (Text  : String;
      Count : out Integer;
      Unit  : out Unbounded_String)
      return Boolean
   is
      Item  : constant String := Trim (Text);
      Space : Natural := 0;

      function Try_Split
        (Split_At : Natural;
         Value : out Integer;
         Target_Unit : out Unbounded_String)
         return Boolean
      is
         Count_Text : constant String :=
           Trim (Item (Item'First .. Split_At - 1));
         Unit_Text  : constant String :=
           Trim (Item (Split_At + 1 .. Item'Last));
      begin
         if Unit_Text'Length = 0 then
            return False;
         elsif Ends_With (Count_Text, " of")
           and then Parse_Natural_Count
             (Count_Text (Count_Text'First .. Count_Text'Last - 3), Value)
         then
            Target_Unit := To_Unbounded_String (Unit_Text);
            return True;
         elsif Parse_Natural_Count (Count_Text, Value) then
            Target_Unit := To_Unbounded_String (Unit_Text);
            return True;
         else
            return False;
         end if;
      end Try_Split;
begin
      for Index in Item'Range loop
         if Item (Index) = ' ' then
            Space := Index;
            exit;
         end if;
      end loop;

      if Space = 0 or else Space = Item'First or else Space = Item'Last then
         return False;
      end if;

      for Index in reverse Item'Range loop
         if Item (Index) = ' '
           and then Index /= Item'First
           and then Index /= Item'Last
           and then Try_Split (Index, Count, Unit)
         then
            return True;
         end if;
      end loop;

      return False;
end Split_Count_Unit;
