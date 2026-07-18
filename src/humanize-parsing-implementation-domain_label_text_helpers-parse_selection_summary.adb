separate (Humanize.Parsing.Implementation.Domain_Label_Text_Helpers)
function Parse_Selection_Summary
     (Text : String)
      return Selection_Summary_Parse_Result
   is
      Item : constant String := Trim (Text);
      Low : constant String := Lower (Item);
      Selected_Mark : constant String := " selected";
      Unit_Buffer : String (1 .. 32);
      Unit_Length : Natural;
      Selected : Natural := 0;
      Total : Natural := 0;
begin
      if not Ends_With (Low, Selected_Mark) then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Unit,
                 others => <>);
      end if;

      declare
         Core : constant String :=
           Trim (Item (Item'First .. Item'Last - Selected_Mark'Length));
         Core_Low : constant String := Lower (Core);
      begin
         if Starts_With (Core_Low, "no ") then
            Store (Trim (Core (Core'First + 3 .. Core'Last)),
                   Unit_Buffer, Unit_Length);
            return
              (Status => Humanize.Status.Ok,
               Kind => Selection_None,
               Selected => 0,
               Total => 0,
               Unit => Unit_Buffer,
               Unit_Length => Unit_Length,
               Exact => True,
               Consumed => Item'Length,
               Error_Position => 0,
               Error => No_Parse_Error);
         elsif Starts_With (Core_Low, "all ") then
            declare
               Amount : Long_Float;
               Tail : Unbounded_String;
            begin
               if not Parse_Number_And_Tail
                 (Core (Core'First + 4 .. Core'Last), Amount, Tail)
                 or else Amount < 0.0
               then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error => Expected_Number,
                          others => <>);
               end if;
               Total := Natural (Long_Float'Rounding (Amount));
               if Long_Float (Total) /= Amount then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error => Expected_Number,
                          others => <>);
               end if;
               Store (To_String (Tail), Unit_Buffer, Unit_Length);
               return
                 (Status => Humanize.Status.Ok,
                  Kind => Selection_All,
                  Selected => Total,
                  Total => Total,
                  Unit => Unit_Buffer,
                  Unit_Length => Unit_Length,
                  Exact => True,
                  Consumed => Item'Length,
                  Error_Position => 0,
                  Error => No_Parse_Error);
            end;
         else
            declare
               Of_At : constant Natural := Find_Substring (Core, " of ");
               Amount : Long_Float;
               Tail : Unbounded_String;
            begin
               if Of_At = 0
                 or else not Parse_Natural_Field
                   (Core (Core'First .. Of_At - 1), Selected)
                 or else not Parse_Number_And_Tail
                   (Core (Of_At + 4 .. Core'Last), Amount, Tail)
                 or else Amount < 0.0
               then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error => Expected_Number,
                          others => <>);
               end if;

               Total := Natural (Long_Float'Rounding (Amount));
               if Long_Float (Total) /= Amount then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error => Expected_Number,
                          others => <>);
               end if;

               Store (To_String (Tail), Unit_Buffer, Unit_Length);
            end;
         end if;
      end;

      return
        (Status => Humanize.Status.Ok,
         Kind => Selection_Partial,
         Selected => Selected,
         Total => Total,
         Unit => Unit_Buffer,
         Unit_Length => Unit_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
exception
      when others => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Selection_Summary;
