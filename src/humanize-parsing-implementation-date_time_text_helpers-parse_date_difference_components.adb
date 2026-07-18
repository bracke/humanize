separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Parse_Date_Difference_Components
     (Text   : String;
      Years  : out Natural;
      Months : out Natural;
      Days   : out Natural)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
      Position : Natural := Item'First;
      Saw_Component : Boolean := False;

      function Parse_Component (Part : String) return Boolean is
         Amount : Long_Float;
         Tail : Unbounded_String;
         Unit : String (1 .. 32);
         Unit_Length : Natural;
         Count : Natural;
      begin
         if not Parse_Number_And_Tail (Trim (Part), Amount, Tail)
           or else Amount < 0.0
         then
            return False;
         end if;

         Count := Natural (Long_Float'Rounding (Amount));
         if Long_Float (Count) /= Amount then
            return False;
         end if;

         Store (To_String (Tail), Unit, Unit_Length);
         if Unit_Length = 0 then
            return False;
         end if;

         declare
            Unit_Text : constant String := Unit (1 .. Unit_Length);
         begin
            if Unit_Text = "year" or else Unit_Text = "years" then
               Years := Count;
            elsif Unit_Text = "month" or else Unit_Text = "months" then
               Months := Count;
            elsif Unit_Text = "day" or else Unit_Text = "days" then
               Days := Count;
            else
               return False;
            end if;
         end;
         Saw_Component := True;
         return True;
      exception
         when Constraint_Error =>
            return False;
      end Parse_Component;
begin
      Years := 0;
      Months := 0;
      Days := 0;

      if Item = "same day" then
         Saw_Component := True;
         return True;
      end if;

      while Position <= Item'Last loop
         declare
            Comma : constant Natural :=
              Find_Substring (Item (Position .. Item'Last), ", ");
            And_Marker : constant Natural :=
              Find_Substring (Item (Position .. Item'Last), " and ");
            Stop : Natural := Item'Last;
            Advance : Natural := Item'Last + 1;
         begin
            if Comma /= 0
              and then (And_Marker = 0 or else Comma < And_Marker)
            then
               Stop := Comma - 1;
               Advance := Comma + 2;
            elsif And_Marker /= 0 then
               Stop := And_Marker - 1;
               Advance := And_Marker + 5;
            end if;

            if Stop < Position
              or else not Parse_Component (Item (Position .. Stop))
            then
               return False;
            end if;
            Position := Advance;
         end;
      end loop;

      return Saw_Component;
end Parse_Date_Difference_Components;
