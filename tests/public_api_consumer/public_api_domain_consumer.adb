with Ada.Command_Line;

with Humanize.Bounded_Text;
with Humanize.Cross_Domain;

procedure Public_API_Domain_Consumer is
   Progress : constant String :=
     Humanize.Bounded_Text.Result_Text
       (Humanize.Cross_Domain.Progress_Label
          ("import", 3, 5, Humanize.Cross_Domain.Progress_Running));
   Product : constant String :=
     Humanize.Bounded_Text.Result_Text
       (Humanize.Cross_Domain.Product_Code_Label
          ("9783161484100", Humanize.Cross_Domain.ISBN_13_Code));
begin
   Ada.Command_Line.Set_Exit_Status
     (if Progress'Length > 0 and then Product'Length > 0
      then Ada.Command_Line.Success
      else Ada.Command_Line.Failure);
end Public_API_Domain_Consumer;
