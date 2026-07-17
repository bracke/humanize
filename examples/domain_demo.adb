with Ada.Text_IO;

with Humanize.Bounded_Text;
with Humanize.Cross_Domain;

procedure Domain_Demo is
   use Ada.Text_IO;
begin
   Put_Line
      ("progress: "
      & Humanize.Bounded_Text.Result_Text
          (Humanize.Cross_Domain.Progress_Label
             ("import", 3, 5, Humanize.Cross_Domain.Progress_Running)));
   Put_Line
     ("product: "
      & Humanize.Bounded_Text.Result_Text
          (Humanize.Cross_Domain.Product_Code_Label
             ("9783161484100", Humanize.Cross_Domain.ISBN_13_Code)));
end Domain_Demo;
