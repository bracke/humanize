separate (Humanize.Parsing.Implementation.Domain_Label_Text_Helpers)
function Parse_Field_Change_Summary
     (Text : String)
      return Field_Change_Summary_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Colon : constant Natural := Find_Substring (Item, ": ");
      Changed_Mark : constant String := " changed, ";
      Added_Mark : constant String := " added, ";
      Removed_Mark : constant String := " removed";
      Changed_At : Natural := 0;
      Added_At : Natural := 0;
      Removed_At : Natural := 0;
      Total : Natural := 0;
      Changed : Natural := 0;
      Added : Natural := 0;
      Removed : Natural := 0;
      Unit : String (1 .. 32) := [others => ' '];
      Unit_Length : Natural := 0;
      First_Space : Natural := 0;
begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Empty_Input,
                 others => <>);
      elsif Colon = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 Error_Position => Text'First,
                 others => <>);
      end if;

      for Index in Item'First .. Colon - 1 loop
         if Item (Index) = ' ' then
            First_Space := Index;
            exit;
         end if;
      end loop;

      if First_Space = 0
        or else not Parse_Two_Naturals
          (Item (Item'First .. First_Space - 1), "0", Total, Removed)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 Error_Position => Text'First,
                 others => <>);
      end if;
      Removed := 0;

      declare
         Unit_Text : constant String := Trim (Item (First_Space + 1 .. Colon - 1));
      begin
         Unit_Length := Natural'Min (Unit_Text'Length, Unit'Length);
         if Unit_Length > 0 then
            Unit (1 .. Unit_Length) :=
              Unit_Text (Unit_Text'First .. Unit_Text'First + Unit_Length - 1);
         end if;
      end;

      Changed_At := Find_Substring (Item, Changed_Mark);
      Added_At := Find_Substring (Item, Added_Mark);
      Removed_At := Find_Substring (Item, Removed_Mark);
      if Changed_At = 0 or else Added_At = 0 or else Removed_At = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 Error_Position => Colon + 2,
                 others => <>);
      end if;

      if not Parse_Two_Naturals
        (Trim (Item (Colon + 2 .. Changed_At - 1)),
         Trim (Item (Changed_At + Changed_Mark'Length .. Added_At - 1)),
         Changed, Added)
        or else not Parse_Two_Naturals
          (Trim (Item (Added_At + Added_Mark'Length .. Removed_At - 1)),
           "0", Removed, Total)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 Error_Position => Colon + 2,
                 others => <>);
      end if;
      Total := Changed + Added + Removed;

      return
        (Status => Humanize.Status.Ok,
         Total => Total,
         Changed => Changed,
         Added => Added,
         Removed => Removed,
         Unit => Unit,
         Unit_Length => Unit_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
end Parse_Field_Change_Summary;
