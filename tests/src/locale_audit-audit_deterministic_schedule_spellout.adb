separate (Locale_Audit)
   procedure Audit_Deterministic_Schedule_Spellout
     (Locale : String;
      Texts  : Sample_Texts)
   is
      Weekday : constant String := To_String (Texts (Schedule_Weekday));
      Monthly : constant String := To_String (Texts (Schedule_Monthly));
      Ordinal : constant String := To_String (Texts (Spellout_Ordinal));
   begin
      if Locale /= "en" then
         if Contains (Weekday, "every weekday") then
            Error
              (Locale, Schedule_Weekday, Weekday,
               "expected localized schedule weekday wording");
         end if;
         if Contains (Monthly, "day 15 of each month") then
            Error
              (Locale, Schedule_Monthly, Monthly,
               "expected localized cron monthly wording");
         end if;
         if Ordinal = "thirtieth" then
            Error
              (Locale, Spellout_Ordinal, Ordinal,
               "expected localized ordinal spellout wording");
         end if;
      end if;
   end Audit_Deterministic_Schedule_Spellout;
