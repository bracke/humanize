separate (Humanize.Tests.Parsing)
   procedure Test_Localized_Render_Parse_Roundtrips
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);

      type Integer_Value_List is array (Positive range <>)
        of Long_Long_Integer;
      type Natural_Value_List is array (Positive range <>) of Natural;

      Cardinal_Values : constant Integer_Value_List :=
        [-42, 0, 1, 5, 21, 42, 342, 2_345, 1_200_000];
      Ordinal_Values : constant Natural_Value_List :=
        [0, 1, 2, 12, 21, 42, 121, 2_345];

      procedure Check_Cardinal
        (Locale : String;
         Value  : Long_Long_Integer)
      is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Numbers.Locale_Cardinal
             (Humanize.Tests.Support.Locale (Locale), Value);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Number_Parse_Result :=
           Humanize.Parsing.Parse_Cardinal (Text);
      begin
         AUnit.Assertions.Assert
           (Rendered.Status = Humanize.Status.Ok,
            Locale & " cardinal render status");
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Parsed.Value = Value
            and then Parsed.Consumed = Text'Length,
            Locale & " localized cardinal round trip: " & Text);
      end Check_Cardinal;

      procedure Check_Ordinal
        (Locale : String;
         Value  : Natural)
      is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Numbers.Ordinal_Words
             (Humanize.Tests.Support.Locale (Locale), Value);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Number_Parse_Result :=
           Humanize.Parsing.Parse_Ordinal (Text);
      begin
         AUnit.Assertions.Assert
           (Rendered.Status = Humanize.Status.Ok,
            Locale & " ordinal render status");
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Parsed.Value = Long_Long_Integer (Value)
            and then Parsed.Consumed = Text'Length,
            Locale & " localized ordinal round trip: " & Text);
      end Check_Ordinal;

      procedure Check_Unit
        (Locale : String;
         Unit   : Humanize.Units.Unit_Kind)
      is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Units.Format
             (Humanize.Tests.Support.Locale (Locale), 5, Unit);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Unit_Parse_Result :=
           Humanize.Parsing.Parse_Unit (Text);

         function Equivalent_Unit return Boolean is
         begin
            return Parsed.Unit = Unit
              or else
                ((Unit = Humanize.Units.Ton
                  or else Unit = Humanize.Units.Tonne)
                 and then
                   (Parsed.Unit = Humanize.Units.Ton
                    or else Parsed.Unit = Humanize.Units.Tonne));
         end Equivalent_Unit;
      begin
         AUnit.Assertions.Assert
           (Rendered.Status = Humanize.Status.Ok,
            Locale & " unit render status");
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Equivalent_Unit
            and then Parsed.Consumed = Text'Length,
            Locale & " localized unit round trip: " & Text);
      end Check_Unit;

      procedure Check_Duration
        (Locale  : String;
         Seconds : Humanize.Durations.Duration_Seconds)
      is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Durations.Format
             (Humanize.Tests.Support.Locale (Locale), Seconds);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Duration_Parse_Result :=
           Humanize.Parsing.Parse_Duration (Text);
      begin
         AUnit.Assertions.Assert
           (Rendered.Status = Humanize.Status.Ok,
            Locale & " duration render status");
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Parsed.Value = Seconds
            and then Parsed.Consumed = Text'Length,
            Locale & " localized duration round trip: " & Text);
      end Check_Duration;

      procedure Check_Bytes
        (Locale : String;
         Bytes  : Humanize.Bytes.Byte_Count)
      is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Bytes.Format
             (Humanize.Tests.Support.Locale (Locale), Bytes);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Byte_Parse_Result :=
           Humanize.Parsing.Parse_Bytes (Text);
      begin
         AUnit.Assertions.Assert
           (Rendered.Status = Humanize.Status.Ok,
            Locale & " bytes render status");
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Parsed.Value = Bytes
            and then Parsed.Consumed = Text'Length,
            Locale & " localized byte round trip: " & Text);
      end Check_Bytes;
   begin
      for Locale_Access of Humanize.Locales.Shipped_Locales loop
         declare
            Name : constant String := Locale_Access.all;
         begin
            for Value of Cardinal_Values loop
               Check_Cardinal (Name, Value);
            end loop;

            for Value of Ordinal_Values loop
               Check_Ordinal (Name, Value);
            end loop;

            Check_Bytes (Name, 1);
            Check_Bytes (Name, 1_536);

            Check_Duration (Name, 2);
            Check_Duration (Name, 120);
            Check_Duration (Name, 7_200);
            Check_Duration (Name, 172_800);
            Check_Duration (Name, 1_209_600);
            Check_Duration (Name, 5_184_000);
            Check_Duration (Name, 63_072_000);

            for Unit in Humanize.Units.Unit_Kind loop
               Check_Unit (Name, Unit);
            end loop;
         end;
      end loop;
   end Test_Localized_Render_Parse_Roundtrips;
