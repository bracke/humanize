separate (Humanize.Numbers.Spellout)
function CLDR_Percent
  (Context : Humanize.Contexts.Context;
   Words   : Humanize.Status.Text_Result;
   Decimal : String)
   return Humanize.Status.Text_Result
is
   Unit   : constant Humanize.Status.Text_Result :=
     CLDR_Text (Context, Humanize.Message_Keys.Number_Percent_Unit, Decimal);
   Number : constant Humanize.Status.Text_Result :=
     CLDR_Text (Context, Humanize.Message_Keys.Number_Plain, Decimal);
   At_Number : constant Natural :=
     (if Unit.Status = Humanize.Status.Ok and then Number.Status = Humanize.Status.Ok
      then Index (Unit.Text, To_String (Number.Text)) else 0);
begin
   if At_Number = 0 then
      return (Status => Humanize.Status.Missing_Message, others => <>);
   end if;
   return Ok_Text
     (Slice (Unit.Text, 1, At_Number - 1) & Result_Text (Words)
      & Slice (Unit.Text, At_Number + Length (Number.Text), Length (Unit.Text)));
end CLDR_Percent;
