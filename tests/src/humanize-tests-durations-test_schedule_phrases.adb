separate (Humanize.Tests.Durations)
   procedure Test_Schedule_Phrases
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Weekday_Schedule : constant Text_Result :=
        Schedule
          (Support.En,
           (Kind        => Schedule_Weekday_Set,
            Every       => 1,
            Unit        => Every_Week,
            Weekday     => 0,
            Weekdays    => Weekdays,
            Ordinal     => 0,
            Has_Time    => True,
            Hour        => 9,
            Minute      => 0,
            Use_12_Hour => False));
      Danish_Weekday_Schedule : constant Text_Result :=
        Schedule
          (Support.Da,
           (Kind        => Schedule_Weekday_Set,
            Every       => 1,
            Unit        => Every_Week,
            Weekday     => 0,
            Weekdays    => Weekdays,
            Ordinal     => 0,
            Has_Time    => True,
            Hour        => 9,
            Minute      => 0,
            Use_12_Hour => False));
      German_Ordinal_Schedule : constant Text_Result :=
        Schedule
          (Support.De,
           (Kind        => Schedule_Ordinal_Weekday,
            Every       => 1,
            Unit        => Every_Month,
            Weekday     => 1,
            Weekdays    => Every_Day_Set,
            Ordinal     => 1,
            Has_Time    => True,
            Hour        => 9,
            Minute      => 30,
            Use_12_Hour => False));
      German_Regional_Ordinal_Schedule : constant Text_Result :=
        Schedule
          (Support.Locale ("DE_at"),
           (Kind        => Schedule_Ordinal_Weekday,
            Every       => 1,
            Unit        => Every_Month,
            Weekday     => 1,
            Weekdays    => Every_Day_Set,
            Ordinal     => 1,
            Has_Time    => True,
            Hour        => 9,
            Minute      => 30,
            Use_12_Hour => False));
      Italian_Ordinal_Schedule : constant Text_Result :=
        Schedule
          (Support.It,
           (Kind        => Schedule_Ordinal_Weekday,
            Every       => 1,
            Unit        => Every_Month,
            Weekday     => 1,
            Weekdays    => Every_Day_Set,
            Ordinal     => 1,
            Has_Time    => True,
            Hour        => 9,
            Minute      => 30,
            Use_12_Hour => False));
      Swedish_Custom_Weekdays : constant Text_Result :=
        Schedule
          (Support.Locale ("sv"),
           (Kind        => Schedule_Weekday_Set,
            Every       => 1,
            Unit        => Every_Week,
            Weekday     => 0,
            Weekdays    =>
              [1 => True, 2 => False, 3 => True, 4 => False,
               5 => False, 6 => False, 7 => False],
            Ordinal     => 0,
            Has_Time    => False,
            Hour        => 0,
            Minute      => 0,
            Use_12_Hour => False));
      French_Weekday_Schedule : constant Text_Result :=
        Cron_Schedule (Support.Fr, "0", "9", "*", "*", "1-5");
      French_Regional_Weekday_Schedule : constant Text_Result :=
        Cron_Schedule (Support.Locale ("FR_ca"), "0", "9", "*", "*", "1-5");
      Spanish_Weekday_Schedule : constant Text_Result :=
        Cron_Schedule (Support.Es, "0", "9", "*", "*", "1-5");
      Ordinal_Schedule : constant Text_Result :=
        Schedule
          (Support.En,
           (Kind        => Schedule_Ordinal_Weekday,
            Every       => 1,
            Unit        => Every_Month,
            Weekday     => 1,
            Weekdays    => Every_Day_Set,
            Ordinal     => 1,
            Has_Time    => True,
            Hour        => 9,
            Minute      => 30,
            Use_12_Hour => False));
      Cron_Minutely : constant Text_Result :=
        Cron_Schedule (Support.En, "*", "*", "*", "*", "*");
      Cron_Daily : constant Text_Result :=
        Cron_Schedule (Support.En, "0", "9", "*", "*", "*");
      Cron_Hourly : constant Text_Result :=
        Cron_Schedule (Support.En, "15", "*", "*", "*", "*");
      Cron_Weekday : constant Text_Result :=
        Cron_Schedule (Support.En, "0", "9", "*", "*", "1-5");
      Biweekly_Monday : constant Text_Result :=
        Schedule
          (Support.En,
           (Kind        => Schedule_Weekday,
            Every       => 2,
            Unit        => Every_Week,
            Weekday     => 1,
            Weekdays    => Every_Day_Set,
            Ordinal     => 0,
            Has_Time    => True,
            Hour        => 9,
            Minute      => 0,
            Use_12_Hour => False));
      Weekly_Helper : constant Text_Result :=
        Weekly_Schedule
          (Support.En,
           [1 => True, 2 => False, 3 => True, 4 => False,
            5 => False, 6 => False, 7 => False],
           Every => 2);
      Every_Other_Helper : constant Text_Result :=
        Every_Other_Weekday_Schedule
          (Support.En, 1, Has_Time => True, Hour => 9, Minute => 0);
      Monthly_Day_Helper : constant Text_Result :=
        Monthly_Day_Schedule
          (Support.En, 15, Has_Time => True, Hour => 8, Minute => 30);
      Finnish_Regional_Monthly_Day : constant Text_Result :=
        Monthly_Day_Schedule
          (Support.Locale ("FI_fi"), 15, Has_Time => True, Hour => 8, Minute => 30);
      Last_Business_Helper : constant Text_Result :=
        Last_Business_Day_Schedule
          (Support.En, Has_Time => True, Hour => 17, Minute => 0);
      Second_Business_Helper : constant Text_Result :=
        Business_Day_Schedule
          (Support.En, 2, Has_Time => True, Hour => 10, Minute => 15);
      Invalid_Business_Helper : constant Text_Result :=
        Business_Day_Schedule (Support.En, 0);
      Cron_Monthly : constant Text_Result :=
        Cron_Schedule (Support.En, "30", "8", "15", "*", "*");
      Finnish_Cron_Monthly : constant Text_Result :=
        Cron_Schedule (Support.Locale ("fi"), "30", "8", "15", "*", "*");
      Polish_Cron_Monthly : constant Text_Result :=
        Cron_Schedule (Support.Locale ("pl"), "30", "8", "15", "*", "*");
      Japanese_Cron_Monthly : constant Text_Result :=
        Cron_Schedule (Support.Locale ("ja"), "30", "8", "15", "*", "*");
      Japanese_Regional_Cron_Monthly : constant Text_Result :=
        Cron_Schedule (Support.Locale ("JA_jp"), "30", "8", "15", "*", "*");
      Korean_Cron_Monthly : constant Text_Result :=
        Cron_Schedule (Support.Locale ("ko"), "30", "8", "15", "*", "*");
      Korean_Regional_Cron_Monthly : constant Text_Result :=
        Cron_Schedule (Support.Locale ("KO_kr"), "30", "8", "15", "*", "*");
      Chinese_Cron_Monthly : constant Text_Result :=
        Cron_Schedule (Support.Locale ("zh"), "30", "8", "15", "*", "*");
      Chinese_Regional_Cron_Monthly : constant Text_Result :=
        Cron_Schedule (Support.Locale ("ZH_cn"), "30", "8", "15", "*", "*");
   begin
      AUnit.Assertions.Assert
        (Weekday_Schedule.Status = Ok
         and then Support.Text (Weekday_Schedule) = "every weekday at 09:00",
         "weekday schedule phrase");
      AUnit.Assertions.Assert
        (Danish_Weekday_Schedule.Status = Ok
         and then Support.Text (Danish_Weekday_Schedule)
           = "hver hverdag kl. 09:00",
         "localized Danish weekday schedule phrase");
      AUnit.Assertions.Assert
        (German_Ordinal_Schedule.Status = Ok
         and then Support.Text (German_Ordinal_Schedule)
           = "erster Montag jedes Monats um 09:30",
         "localized German ordinal weekday schedule phrase");
      AUnit.Assertions.Assert
        (German_Regional_Ordinal_Schedule.Status = Ok
         and then Support.Text (German_Regional_Ordinal_Schedule)
           = "erster Montag jedes Monats um 09:30",
         "regional German schedule uses language-code fallback");
      AUnit.Assertions.Assert
        (Italian_Ordinal_Schedule.Status = Ok
         and then Support.Text (Italian_Ordinal_Schedule)
           = "primo luned" & Character'Val (16#C3#) & Character'Val (16#AC#)
             & " di ogni mese alle 09:30",
         "localized Italian ordinal weekday schedule phrase");
      AUnit.Assertions.Assert
        (Swedish_Custom_Weekdays.Status = Ok
         and then Support.Text (Swedish_Custom_Weekdays)
           = "varje m" & Character'Val (16#C3#) & Character'Val (16#A5#)
             & "ndag och onsdag",
         "localized Swedish custom weekday conjunction");
      AUnit.Assertions.Assert
        (French_Weekday_Schedule.Status = Ok
         and then Support.Text (French_Weekday_Schedule)
           = "chaque jour ouvrable " & U_A_Grave & " 09:00",
         "localized French cron weekday schedule phrase");
      AUnit.Assertions.Assert
        (French_Regional_Weekday_Schedule.Status = Ok
         and then Support.Text (French_Regional_Weekday_Schedule)
           = "chaque jour ouvrable " & U_A_Grave & " 09:00",
         "regional French cron schedule uses language-code fallback");
      AUnit.Assertions.Assert
        (Spanish_Weekday_Schedule.Status = Ok
         and then Support.Text (Spanish_Weekday_Schedule)
           = "cada d" & Character'Val (16#C3#) & Character'Val (16#AD#)
             & "a laborable a las 09:00",
         "localized Spanish cron weekday schedule phrase");
      AUnit.Assertions.Assert
        (Ordinal_Schedule.Status = Ok
         and then Support.Text (Ordinal_Schedule)
           = "first Monday of each month at 09:30",
         "ordinal weekday schedule phrase");
      AUnit.Assertions.Assert
        (Cron_Minutely.Status = Ok
         and then Support.Text (Cron_Minutely) = "every minute",
         "cron minutely schedule phrase");
      AUnit.Assertions.Assert
        (Cron_Daily.Status = Ok
         and then Support.Text (Cron_Daily) = "every day at 09:00",
         "cron daily schedule phrase");
      AUnit.Assertions.Assert
        (Cron_Hourly.Status = Ok
         and then Support.Text (Cron_Hourly) = "every hour at minute 15",
         "cron hourly schedule phrase");
      AUnit.Assertions.Assert
        (Cron_Weekday.Status = Ok
         and then Support.Text (Cron_Weekday) = "every weekday at 09:00",
         "cron weekday schedule phrase");
      AUnit.Assertions.Assert
        (Biweekly_Monday.Status = Ok
         and then Support.Text (Biweekly_Monday)
           = "every 2 weeks on Monday at 09:00",
         "biweekly weekday schedule phrase");
      AUnit.Assertions.Assert
        (Weekly_Helper.Status = Ok
         and then Support.Text (Weekly_Helper)
           = "every 2 weeks on Monday and Wednesday",
         "weekly helper schedule phrase");
      AUnit.Assertions.Assert
        (Every_Other_Helper.Status = Ok
         and then Support.Text (Every_Other_Helper)
           = "every 2 weeks on Monday at 09:00",
         "every-other weekday helper schedule phrase");
      AUnit.Assertions.Assert
        (Monthly_Day_Helper.Status = Ok
         and then Support.Text (Monthly_Day_Helper)
           = "day 15 of each month at 08:30",
         "monthly day helper schedule phrase");
      AUnit.Assertions.Assert
        (Finnish_Regional_Monthly_Day.Status = Ok
         and then Support.Text (Finnish_Regional_Monthly_Day)
           = "p" & Character'Val (16#C3#) & Character'Val (16#A4#)
             & "iv" & Character'Val (16#C3#) & Character'Val (16#A4#)
             & " 15 joka kuukausi klo 08:30",
         "regional Finnish monthly schedule uses language-code fallback");
      AUnit.Assertions.Assert
        (Last_Business_Helper.Status = Ok
         and then Support.Text (Last_Business_Helper)
           = "last business day of each month at 17:00",
         "last business day helper schedule phrase");
      AUnit.Assertions.Assert
        (Second_Business_Helper.Status = Ok
         and then Support.Text (Second_Business_Helper)
           = "second business day of each month at 10:15",
         "ordinal business day helper schedule phrase");
      AUnit.Assertions.Assert
        (Invalid_Business_Helper.Status = Invalid_Argument,
         "invalid ordinal business day helper");
      AUnit.Assertions.Assert
        (Cron_Monthly.Status = Ok
         and then Support.Text (Cron_Monthly)
           = "day 15 of each month at 08:30",
         "cron monthly schedule phrase");
      AUnit.Assertions.Assert
        (Finnish_Cron_Monthly.Status = Ok
         and then Support.Text (Finnish_Cron_Monthly)
           = "p" & Character'Val (16#C3#) & Character'Val (16#A4#)
             & "iv" & Character'Val (16#C3#) & Character'Val (16#A4#)
             & " 15 joka kuukausi klo 08:30",
         "localized Finnish cron monthly schedule phrase");
      AUnit.Assertions.Assert
        (Polish_Cron_Monthly.Status = Ok
         and then Support.Text (Polish_Cron_Monthly)
           = "15. dzie" & U (16#144#) & " ka" & U (16#17C#)
             & "dego miesi" & U (16#105#) & "ca o 08:30",
         "localized Polish cron monthly schedule phrase");
      AUnit.Assertions.Assert
        (Japanese_Cron_Monthly.Status = Ok
         and then Japanese_Regional_Cron_Monthly.Status = Ok
         and then Support.Text (Japanese_Regional_Cron_Monthly) =
           Support.Text (Japanese_Cron_Monthly),
         "regional Japanese cron schedule uses normalized CJK time branch");
      AUnit.Assertions.Assert
        (Korean_Cron_Monthly.Status = Ok
         and then Korean_Regional_Cron_Monthly.Status = Ok
         and then Support.Text (Korean_Regional_Cron_Monthly) =
           Support.Text (Korean_Cron_Monthly),
         "regional Korean cron schedule uses normalized CJK time branch");
      AUnit.Assertions.Assert
        (Chinese_Cron_Monthly.Status = Ok
         and then Chinese_Regional_Cron_Monthly.Status = Ok
         and then Support.Text (Chinese_Regional_Cron_Monthly) =
           Support.Text (Chinese_Cron_Monthly),
         "regional Chinese cron schedule uses normalized CJK time branch");
   end Test_Schedule_Phrases;
