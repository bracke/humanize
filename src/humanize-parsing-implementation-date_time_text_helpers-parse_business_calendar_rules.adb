separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Parse_Business_Calendar_Rules
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Rules_Parse_Result
   is
      Rules : Humanize.Durations.Business_Calendar_Rules;
      Start : Natural := Text'First;
      Stop  : Natural;
      First_Nonblank : Natural;
      Last_Nonblank  : Natural;
      Rule  : Business_Calendar_Parse_Result;
      Status : Humanize.Status.Status_Code;

      function Is_Separator (Item : Character) return Boolean is
        (Item = ';'
         or else Item = Character'Val (10)
         or else Item = Character'Val (13));

      function Is_Blank (Item : Character) return Boolean is
        (Item = ' ' or else Item = Character'Val (9));
begin
      if Text'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            others => <>);
      end if;

      while Start <= Text'Last loop
         Stop := Start;
         while Stop <= Text'Last and then not Is_Separator (Text (Stop)) loop
            Stop := Stop + 1;
         end loop;

         First_Nonblank := Start;
         Last_Nonblank := Stop - 1;
         while First_Nonblank <= Last_Nonblank
           and then Is_Blank (Text (First_Nonblank))
         loop
            First_Nonblank := First_Nonblank + 1;
         end loop;
         while Last_Nonblank >= First_Nonblank
           and then Is_Blank (Text (Last_Nonblank))
         loop
            Last_Nonblank := Last_Nonblank - 1;
         end loop;

         if First_Nonblank <= Last_Nonblank then
            Rule := Parse_Business_Calendar
              (Reference, Text (First_Nonblank .. Last_Nonblank));
            if Rule.Status /= Humanize.Status.Ok then
               return
                 (Status => Rule.Status,
                  Rules => Rules,
                  Exact => False,
                  Consumed => Natural'Max (0, First_Nonblank - Text'First),
                  Error_Position => First_Nonblank,
                  Error => Rule.Error);
            end if;

            Status := Apply_Business_Calendar_Rule (Rules, Rule);
            if Status /= Humanize.Status.Ok then
               return
                 (Status => Status,
                  Rules => Rules,
                  Exact => False,
                  Consumed => Natural'Max (0, First_Nonblank - Text'First),
                  Error_Position => First_Nonblank,
                  Error => Unsupported_Form);
            end if;
         end if;

         Start := Stop + 1;
      end loop;

      return
        (Status => Humanize.Status.Ok,
         Rules => Rules,
         Exact => True,
         Consumed => Text'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
end Parse_Business_Calendar_Rules;
