separate (Humanize.Parsing.Implementation.Duration_Text_Helpers)
function Parse_Duration
     (Text : String)
      return Duration_Parse_Result
   is
      Source : constant String := Trim (Normalize_Native_Digits (Text));
      Index  : Natural := Source'First;
      Total  : Long_Long_Integer := 0;
      Seen   : Boolean := False;
begin
      if Source'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, Value => 0, others => <>);
      end if;

      if Source'Length > 0 and then Source (Source'First) = 'P' then
         declare
            ISO_Total : Long_Long_Integer;
         begin
            if Parse_ISO_Duration (Source, ISO_Total) then
               return
                 (Status => Humanize.Status.Ok,
                  Value  => Humanize.Durations.Duration_Seconds (ISO_Total),
                  Exact  => True,
                  Consumed => Trim (Text)'Length,
                  Error_Position => 0,
                  Error => No_Parse_Error);
            else
               return
                 (Status => Humanize.Status.Invalid_Argument,
                  Value => 0,
                  Error_Position => Source'First,
                  Error => Unsupported_Form,
                  others => <>);
            end if;
         end;
      end if;

      while Index <= Source'Last loop
         while Index <= Source'Last
           and then (Source (Index) = ' ' or else Source (Index) = ',')
         loop
            Index := Index + 1;
         end loop;

         declare
            Conjunction_Length : constant Natural :=
              Duration_Conjunction_Length (Source, Index);
         begin
            if Conjunction_Length /= 0 then
               Index := Index + Conjunction_Length;
            end if;
         end;

         if Index <= Source'Last then
            while Index <= Source'Last and then Source (Index) = ' ' loop
               Index := Index + 1;
            end loop;
         end if;

         exit when Index > Source'Last;

         declare
            Number_First : constant Natural := Index;
            Amount       : Long_Float;
            Unit_First   : Natural;
            Unit_Last    : Natural;
            Seconds      : Long_Long_Integer;
            Rounded      : Long_Long_Integer;
         begin
            while Index <= Source'Last
              and then (Is_Digit (Source (Index))
                        or else Source (Index) = '.'
                        or else Source (Index) = ',')
            loop
               Index := Index + 1;
            end loop;

            if Index = Number_First
              or else not Numeric_Value (Source (Number_First .. Index - 1), Amount)
            then
               return (Status => Humanize.Status.Invalid_Argument, Value => 0, others => <>);
            end if;

            while Index <= Source'Last and then Source (Index) = ' ' loop
               Index := Index + 1;
            end loop;
            Unit_First := Index;
            while Index <= Source'Last
              and then Source (Index) /= ','
              and then Source (Index) /= ' '
            loop
               Index := Index + 1;
            end loop;
            Unit_Last := Index - 1;

            if Unit_Last < Unit_First then
               return (Status => Humanize.Status.Invalid_Argument, Value => 0, others => <>);
            end if;

            Seconds := Unit_Seconds (Source (Unit_First .. Unit_Last));
            Rounded := Rounded_Nonnegative (Amount * Long_Float (Seconds));
            if Seconds = 0 or else Rounded < 0 then
               return (Status => Humanize.Status.Invalid_Argument, Value => 0, others => <>);
            end if;

            Total := Total + Rounded;
            Seen := True;
         exception
            when others =>
               return (Status => Humanize.Status.Invalid_Value, Value => 0, others => <>);
         end;
      end loop;

      if not Seen then
         return (Status => Humanize.Status.Invalid_Argument, Value => 0, others => <>);
      end if;
      return
        (Status => Humanize.Status.Ok,
         Value  => Humanize.Durations.Duration_Seconds (Total),
         Exact  => True,
         Consumed => Trim (Text)'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
end Parse_Duration;
