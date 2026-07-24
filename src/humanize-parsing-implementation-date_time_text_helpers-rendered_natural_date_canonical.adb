separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Rendered_Natural_Date_Canonical (Text : String) return String is
      Item  : constant String := Clean_Lower (Text);
      Found : Boolean;
begin
      if Item'Length = 0 then
         return Item;
      end if;

      return Humanize.Parsing.Implementation.Canonical_Day_Index.Canonical
        (Item, Found);
exception
      when Constraint_Error => --  parse failure normalization
         return Clean_Lower (Text);
end Rendered_Natural_Date_Canonical;
