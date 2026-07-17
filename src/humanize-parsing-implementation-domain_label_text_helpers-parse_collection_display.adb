separate (Humanize.Parsing.Implementation.Domain_Label_Text_Helpers)
function Parse_Collection_Display
     (Text : String)
      return Collection_Display_Parse_Result
   is
      Item : constant String := Trim (Text);
      More : constant More_Count_Parse_Result := Parse_More_Count (Item);
      Visible : Natural := 0;
      Remaining : Natural := 0;
      Visible_Unit : String (1 .. 32);
      Visible_Unit_Length : Natural := 0;
      Remaining_Unit : String (1 .. 32);
      Remaining_Unit_Length : Natural := 0;
begin
      if More.Status = Humanize.Status.Ok then
         Store ("", Visible_Unit, Visible_Unit_Length);
         Store ("", Remaining_Unit, Remaining_Unit_Length);
         return
           (Status => Humanize.Status.Ok,
            Kind => Collection_Summary,
            Visible => More.Visible,
            Remaining => More.Remaining,
            Visible_Unit => Visible_Unit,
            Visible_Unit_Length => Visible_Unit_Length,
            Remaining_Unit => Remaining_Unit,
            Remaining_Unit_Length => Remaining_Unit_Length,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error);
      elsif Starts_With (Item, "+") then
         if not Parse_Natural_Field (Item (Item'First + 1 .. Item'Last),
                                     Remaining)
         then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Expected_Number,
                    others => <>);
         end if;
         Store ("", Visible_Unit, Visible_Unit_Length);
         Store ("", Remaining_Unit, Remaining_Unit_Length);
         return
           (Status => Humanize.Status.Ok,
            Kind => Collection_Compact,
            Visible => 0,
            Remaining => Remaining,
            Visible_Unit => Visible_Unit,
            Visible_Unit_Length => Visible_Unit_Length,
            Remaining_Unit => Remaining_Unit,
            Remaining_Unit_Length => Remaining_Unit_Length,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error);
      elsif Parse_Natural_Field (Item, Visible) then
         Store ("", Visible_Unit, Visible_Unit_Length);
         Store ("", Remaining_Unit, Remaining_Unit_Length);
         return
           (Status => Humanize.Status.Ok,
            Kind => Collection_Compact,
            Visible => Visible,
            Remaining => 0,
            Visible_Unit => Visible_Unit,
            Visible_Unit_Length => Visible_Unit_Length,
            Remaining_Unit => Remaining_Unit,
            Remaining_Unit_Length => Remaining_Unit_Length,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error);
      else
         declare
            Shown_Mark : constant String := " shown, ";
            Available_Mark : constant String := " available";
            Shown_At : constant Natural := Find_Substring (Item, Shown_Mark);
            Available_At : constant Natural :=
              Find_Substring (Item, Available_Mark);
            Amount : Long_Float;
            Tail : Unbounded_String;
         begin
            if Shown_At = 0 or else Available_At = 0
              or else not Parse_Number_And_Tail
                (Item (Item'First .. Shown_At - 1), Amount, Tail)
              or else Amount < 0.0
            then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Number,
                       others => <>);
            end if;
            Visible := Natural (Long_Float'Rounding (Amount));
            if Long_Float (Visible) /= Amount then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Number,
                       others => <>);
            end if;
            Store (To_String (Tail), Visible_Unit, Visible_Unit_Length);
            if not Parse_Number_And_Tail
              (Item (Shown_At + Shown_Mark'Length .. Available_At - 1),
               Amount, Tail)
              or else Amount < 0.0
            then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Number,
                       others => <>);
            end if;
            Remaining := Natural (Long_Float'Rounding (Amount));
            if Long_Float (Remaining) /= Amount then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Number,
                       others => <>);
            end if;
            Store (To_String (Tail), Remaining_Unit, Remaining_Unit_Length);
         end;

         return
           (Status => Humanize.Status.Ok,
            Kind => Collection_Screen_Reader,
            Visible => Visible,
            Remaining => Remaining,
            Visible_Unit => Visible_Unit,
            Visible_Unit_Length => Visible_Unit_Length,
            Remaining_Unit => Remaining_Unit,
            Remaining_Unit_Length => Remaining_Unit_Length,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error);
      end if;
exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Collection_Display;
