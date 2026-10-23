with Humanize.I18N_Rendering;
with Humanize.Message_Keys;
with Humanize.Selections;

separate (Humanize.Parsing.Localized)
function Plain_Number (Context : Humanize.Contexts.Context; Text : String) return String is
   function Base (Item : String) return String is
     (Humanize.Parsing.Locale_Digits.Normalize (Context, Item, Quantities => False));
   Million : constant Humanize.Status.Text_Result :=
     Humanize.I18N_Rendering.Render
       (Context, Humanize.Selections.Text_Value (Humanize.Message_Keys.Number_Plain, "1234567"));
   Shown   : constant String :=
     (if Million.Status = Humanize.Status.Ok then Base (To_String (Million.Text)) else "");
   Item    : constant String := Base (Text);
   Group_First, Group_Last : Natural := 0;
   Result  : Unbounded_String;
   I       : Positive := Item'First;
begin
   --  The group separator: what follows the first run of digits up to the
   --  next one.
   for J in Shown'Range loop
      if Shown (J) in '0' .. '9' then
         Group_First := J;
         while Group_First <= Shown'Last and then Shown (Group_First) in '0' .. '9' loop
            Group_First := Group_First + 1;
         end loop;
         Group_Last := Group_First - 1;
         while Group_Last < Shown'Last and then Shown (Group_Last + 1) not in '0' .. '9' loop
            Group_Last := Group_Last + 1;
         end loop;
         exit;
      end if;
   end loop;
   if Group_First = 0 or else Group_Last < Group_First then
      return Plain (Context, Text);
   end if;
   declare
      Group : constant String := Shown (Group_First .. Group_Last);
   begin
      while I <= Item'Last loop
         if I > Item'First and then Item (I - 1) in '0' .. '9'
           and then I + Group'Length <= Item'Last
           and then Item (I .. I + Group'Length - 1) = Group
           and then Item (I + Group'Length) in '0' .. '9'
         then
            I := I + Group'Length;
         else
            Append (Result, Item (I));
            I := I + 1;
         end if;
      end loop;
   end;
   return Plain (Context, To_String (Result));
end Plain_Number;
