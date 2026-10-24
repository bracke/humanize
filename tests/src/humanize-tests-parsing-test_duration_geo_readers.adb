with Humanize.Contexts;
with Humanize.Geo;
with Humanize.Geo.Localized;
with Humanize.Numbers.Ranges;
with Humanize.Numbers.Scales;

--  Duration labels, natural durations, coordinates, bearings, approximations
--  and tolerances: in each locale's words, and read back in every shipped
--  locale.
separate (Humanize.Tests.Parsing)
   procedure Test_Duration_Geo_Readers
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      package L renames Humanize.Parsing.Localized;
      package D renames Humanize.Durations;
      package G renames Humanize.Geo;
      package S renames Humanize.Tests.Support;
      use type L.Duration_Label_Kind;
      use type D.Duration_Distance_Direction;
      use type D.Natural_Duration_Style;
      use type G.Direction_Point;

      Degree : constant String := S.U (16#B0#);
      type Second_List is array (Positive range <>) of D.Duration_Seconds;

      procedure Expect (Got, Wanted, Message : String) is
      begin
         AUnit.Assertions.Assert (Got = Wanted, Message & ": got """ & Got & """");
      end Expect;

      procedure Check_Label
        (Locale : String; Text : String; Kind : L.Duration_Label_Kind; Seconds : D.Duration_Seconds)
      is
         Read : constant L.Duration_Label_Parse_Result := L.Parse_Duration_Label (S.Locale (Locale), Text);
      begin
         AUnit.Assertions.Assert
           (Read.Status = Humanize.Status.Ok and then Read.Kind = Kind and then Read.Seconds = Seconds,
            Locale & " reads """ & Text & """ back as " & L.Duration_Label_Kind'Image (Kind));
      end Check_Label;

      procedure Check_Natural
        (Locale : String; Text : String; Direction : D.Duration_Distance_Direction; Seconds : D.Duration_Seconds)
      is
         Read : constant L.Natural_Duration_Parse_Result := L.Parse_Natural_Duration (S.Locale (Locale), Text);
      begin
         AUnit.Assertions.Assert
           (Read.Status = Humanize.Status.Ok and then Read.Direction = Direction and then Read.Seconds = Seconds,
            Locale & " reads """ & Text & """ back");
      end Check_Natural;
   begin
      --  Each locale's own words; English unchanged.
      Expect (S.Text (D.Expires_In (S.Locale ("en"), 7_200)), "expires in 2 hours", "English expiry");
      Expect (S.Text (D.Duration_Distance (S.Locale ("en"), 7_500, D.Duration_Distance_Past, D.Threshold_Rails)),
              "about 2 hours ago", "English approximate distance");
      Expect (S.Text (G.Localized.Latitude_Label (S.Locale ("en"), 52.52)), "52.5200" & Degree & " N",
              "English latitude");
      Expect (S.Text (Humanize.Numbers.Ranges.Uncertainty_Label
                        (S.Locale ("en"), 12.5, 0.25, (Maximum_Fraction_Digits => 2, others => <>))),
              "12.5 +/- 0.25", "English tolerance");
      Expect (S.Text (D.Stale_For (S.Locale ("de"), 172_800)), "seit 2 Tagen veraltet",
              "German governs the dative after seit");
      Expect (S.Text (D.Modified_Ago (S.Locale ("de"), 7_200)), "ge" & S.U (16#E4#) & "ndert vor 2 Stunden",
              "German wraps CLDR's relative time");
      Expect (S.Text (D.Duration_Distance (S.Locale ("de"), 7_500, D.Duration_Distance_Past, D.Threshold_Rails)),
              "vor etwa 2 Stunden", "German approximate distance");
      Expect (S.Text (D.Duration_Distance (S.Locale ("de"), 20, D.Duration_Distance_Past)),
              "vor weniger als einer Minute", "German fixed phrase in the dative");
      Expect (S.Text (D.Natural_Duration (S.Locale ("de"), 3_900, (Style => D.Brief_Duration))),
              "1 Std., 5 Min.", "German brief duration in CLDR's short units");
      Expect (S.Text (G.Localized.Latitude_Label (S.Locale ("de"), 52.52)), "52,5200" & Degree & " N",
              "German latitude");
      Expect (S.Text (G.Localized.Longitude_Label (S.Locale ("de"), 13.405)), "13,4050" & Degree & " O",
              "German writes east as O");
      Expect (S.Text (G.Localized.Latitude_Label (S.Locale ("pl"), 52.52)), "52,5200" & Degree & "N",
              "Polish carries the degree sign in its pattern");
      Expect (S.Text (G.Localized.Latitude_Label (S.Locale ("ja"), 52.52)),
              S.U (16#5317#) & S.U (16#7DEF#) & "52.5200" & Degree, "Japanese writes north latitude first");
      Expect (S.Text (Humanize.Numbers.Ranges.Uncertainty_Label
                        (S.Locale ("de"), 12.5, 0.25, (Maximum_Fraction_Digits => 2, others => <>))),
              "12,5 " & S.U (16#B1#) & " 0,25", "German tolerance");
      Expect (S.Text (Humanize.Numbers.Scales.Approximate (S.Locale ("de"), 1_200, Humanize.Numbers.Almost)),
              "fast 1.200", "German approximation");
      for Locale_Access of Humanize.Locales.Shipped_Locales loop
         declare
            Name : constant String := Locale_Access.all;
            C    : constant Humanize.Contexts.Context := S.Locale (Name);
         begin
            for Seconds of Second_List'[180, 7_200, 259_200] loop
               Check_Label (Name, S.Text (D.Countdown (C, Seconds)), L.Countdown_Label, Seconds);
               Check_Label (Name, S.Text (D.SLA_Window (C, Seconds)), L.Within_Label, Seconds);
               Check_Label (Name, S.Text (D.Next_Window (C, Seconds)), L.Next_Label, Seconds);
               Check_Label (Name, S.Text (D.Age (C, Seconds)), L.Age_Label, Seconds);
               Check_Label (Name, S.Text (D.Stale_For (C, Seconds)), L.Stale_Label, Seconds);
               Check_Label (Name, S.Text (D.Backup_Age (C, Seconds)), L.Backup_Age_Label, Seconds);
               Check_Label (Name, S.Text (D.ETA (C, Seconds)), L.ETA_Label, Seconds);
               Check_Label (Name, S.Text (D.Expires_In (C, Seconds)), L.Expires_Label, Seconds);
               Check_Label (Name, S.Text (D.Retry_In (C, Seconds)), L.Retry_Label, Seconds);
               Check_Label (Name, S.Text (D.Modified_Ago (C, Seconds)), L.Modified_Label, Seconds);
               Check_Label (Name, S.Text (D.Synced_Ago (C, Seconds)), L.Synced_Label, Seconds);
               Check_Natural (Name, S.Text (D.Duration_Distance (C, Seconds, D.Duration_Distance_Past)),
                              D.Duration_Distance_Past, Seconds);
               Check_Natural (Name, S.Text (D.Duration_Distance (C, Seconds, D.Duration_Distance_Future)),
                              D.Duration_Distance_Future, Seconds);
            end loop;
            Check_Label (Name, S.Text (D.Modified_Ago (C, 0)), L.Modified_Label, 0);
            declare
               Read : constant L.Duration_Label_Parse_Result :=
                 L.Parse_Duration_Label (C, S.Text (D.Interval (C, 300, 7_200)));
            begin
               AUnit.Assertions.Assert
                 (Read.Status = Humanize.Status.Ok and then Read.Kind = L.Between_Label
                  and then Read.Seconds = 300 and then Read.High = 7_200,
                  Name & " reads a duration interval back");
            end;
            Check_Natural (Name, S.Text (D.Natural_Duration (C, 7_200, (Style => D.Approximate_Duration))),
                           D.Duration_Distance_Plain, 7_200);
            Check_Natural (Name, S.Text (D.Natural_Duration (C, 1_800)), D.Duration_Distance_Plain, 1_800);
            declare
               Coordinate : constant L.Coordinate_Parse_Result :=
                 L.Parse_Coordinate (C, S.Text (G.Localized.Coordinate_Label (C, 52.52, -13.405)));
               Box        : constant G.Bounding_Box := (South => -33.9, West => 151.2, North => -33.8, East => 151.3);
               Read_Box   : constant L.Bounding_Box_Parse_Result :=
                 L.Parse_Bounding_Box (C, S.Text (G.Localized.Bounding_Box_Label (C, Box, 1)));
               Bearing    : constant L.Direction_Parse_Result :=
                 L.Parse_Bearing (C, S.Text (G.Localized.Bearing_Label (C, 45.0)));
               Short      : constant L.Direction_Parse_Result :=
                 L.Parse_Direction
                   (C, S.Text (G.Localized.Direction_Label (C, G.North_North_East, G.Direction_Short)));
               Long       : constant L.Direction_Parse_Result :=
                 L.Parse_Direction (C, S.Text (G.Localized.Direction_Label (C, G.West_South_West)));
               Approximation : constant L.Approximation_Parse_Result :=
                 L.Parse_Approximation
                   (C, S.Text (Humanize.Numbers.Scales.Approximate (C, 1_200, Humanize.Numbers.Over)));
               Tolerance : constant L.Uncertainty_Parse_Result :=
                 L.Parse_Uncertainty
                   (C, S.Text (Humanize.Numbers.Ranges.Uncertainty_Label
                                 (C, 12.5, 0.25, (Maximum_Fraction_Digits => 2, others => <>))));
            begin
               AUnit.Assertions.Assert
                 (Coordinate.Status = Humanize.Status.Ok and then abs (Coordinate.Latitude - 52.52) < 1.0E-9
                  and then abs (Coordinate.Longitude + 13.405) < 1.0E-9,
                  Name & " reads a coordinate back");
               AUnit.Assertions.Assert
                 (Read_Box.Status = Humanize.Status.Ok and then abs (Read_Box.Box.South + 33.9) < 1.0E-9
                  and then abs (Read_Box.Box.East - 151.3) < 1.0E-9,
                  Name & " reads a bounding box back");
               AUnit.Assertions.Assert
                 (Bearing.Status = Humanize.Status.Ok and then Bearing.Bearing = 45.0
                  and then Bearing.Point = G.North_East,
                  Name & " reads a bearing back");
               AUnit.Assertions.Assert
                 (Short.Status = Humanize.Status.Ok and then Short.Point = G.North_North_East,
                  Name & " reads an abbreviated compass point back");
               AUnit.Assertions.Assert
                 (Long.Status = Humanize.Status.Ok and then Long.Point = G.West_South_West,
                  Name & " reads a compass point back");
               AUnit.Assertions.Assert
                 (Approximation.Status = Humanize.Status.Ok and then Approximation.Value = 1_200
                  and then Approximation.Kind = Humanize.Numbers.Over,
                  Name & " reads an approximation back");
               AUnit.Assertions.Assert
                 (Tolerance.Status = Humanize.Status.Ok and then Tolerance.Value = 12.5
                  and then Tolerance.Uncertainty = 0.25,
                  Name & " reads a tolerance back");
            end;
         end;
      end loop;
   end Test_Duration_Geo_Readers;
