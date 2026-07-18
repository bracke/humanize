with Ada.Command_Line;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with I18N.Runtime;

with Humanize.Bounded_Text;
with Humanize.Bytes;
with Humanize.Catalogs;
with Humanize.Contexts;
with Humanize.Durations;
with Humanize.Lists;
with Humanize.Numbers;
with Humanize.Numbers.Editorial;
with Humanize.Numbers.Ranges;
with Humanize.Numbers.Scales;
with Humanize.Numbers.Spellout;
with Humanize.Numbers.Statistics;
with Humanize.Status;
with Humanize.Units;

with Public_API_Consumer_Runtime;

procedure Public_API_Formatting_Consumer is
   use type Humanize.Status.Status_Code;

   Loaded : I18N.Runtime.Load_Result;
   Errors : Natural := 0;

   procedure Check (Result : Humanize.Status.Text_Result) is
   begin
      if Result.Status /= Humanize.Status.Ok
        or else Humanize.Bounded_Text.Result_Text (Result)'Length = 0
      then
         Errors := Errors + 1;
      end if;
   end Check;
begin
   Humanize.Catalogs.Load_Defaults
     (Public_API_Consumer_Runtime.Runtime, Loaded);

   declare
      Context : constant Humanize.Contexts.Context :=
        Humanize.Contexts.Create
          (Public_API_Consumer_Runtime.Runtime'Access, "en");
   begin
      Check (Humanize.Bytes.Format (Context, 1_536));
      Check (Humanize.Durations.Format (Context, 90));
      Check (Humanize.Numbers.Compact (Context, 1_200_000));
      Check (Humanize.Numbers.Editorial.Editorial_Age (Context, 7));
      Check (Humanize.Numbers.Ranges.Between (Context, 3, 7));
      Check (Humanize.Numbers.Scales.SI_Prefix (Context, 1_500.0, "m"));
      Check (Humanize.Numbers.Spellout.Ordinal_Words (Context, 21));
      Check
        (Humanize.Numbers.Statistics.Percentile_Summary_Label
           (P50 => 120.0,
            P95 => 250.0,
            P99 => 400.0,
            Unit => "ms"));
      Check (Humanize.Units.Format (Context, 5, Humanize.Units.Kilometer));
      Check
        (Humanize.Lists.Format
           (Context, [To_Unbounded_String ("alpha"),
                      To_Unbounded_String ("beta")]));
   end;

   Ada.Command_Line.Set_Exit_Status
     (if Errors = 0 then Ada.Command_Line.Success else Ada.Command_Line.Failure);
end Public_API_Formatting_Consumer;
