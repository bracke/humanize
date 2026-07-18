separate (Humanize.Parsing.Implementation.Scheduling_Text_Helpers)
function Classify_Scheduling_Phrase
     (Text : String)
      return Scheduling_Phrase_Result
   is
      Item : constant String := Clean_Lower (Text);
      Hits : Natural := 0;
      Kind : Scheduling_Phrase_Kind := No_Scheduling_Phrase;
      Has_Relative : Boolean := False;
      Has_Date_Time : Boolean := False;
      Has_Business : Boolean := False;
      Has_Period : Boolean := False;
      Has_Recur : Boolean := False;

      procedure Hit (Candidate : Scheduling_Phrase_Kind) is
      begin
         Hits := Hits + 1;
         case Candidate is
            when Relative_Offset_Phrase => Has_Relative := True;
            when Date_Time_Phrase => Has_Date_Time := True;
            when Business_Day_Phrase => Has_Business := True;
            when Period_Boundary_Phrase => Has_Period := True;
            when Recurrence_Phrase => Has_Recur := True;
            when others => null; --  intentional silent recovery
         end case;
         if Kind = No_Scheduling_Phrase then
            Kind := Candidate;
         elsif Kind /= Candidate then
            Kind := Ambiguous_Scheduling_Phrase;
         end if;
      end Hit;
begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Kind => No_Scheduling_Phrase,
            Consumed => 0,
            Ambiguous => False,
            Has_Relative_Offset => False,
            Has_Date_Time => False,
            Has_Business_Day => False,
            Has_Period_Boundary => False,
            Has_Recurrence => False,
            Error_Position => Text'First,
            Error => Empty_Input);
      end if;

      if Starts_With (Item, "in ")
        or else Contains_Scheduling_Word (Item, "ago")
        or else Contains_Scheduling_Word (Item, "from now")
      then
         Hit (Relative_Offset_Phrase);
      end if;

      if Contains_Scheduling_Word (Item, "today")
        or else Contains_Scheduling_Word (Item, "tomorrow")
        or else Contains_Scheduling_Word (Item, "yesterday")
        or else Contains_Scheduling_Word (Item, " at ")
        or else Contains_Scheduling_Word (Item, "noon")
        or else Contains_Scheduling_Word (Item, "evening")
      then
         Hit (Date_Time_Phrase);
      end if;

      if Contains_Scheduling_Word (Item, "business")
        or else Contains_Scheduling_Word (Item, "workday")
        or else Contains_Scheduling_Word (Item, "weekday")
      then
         Hit (Business_Day_Phrase);
      end if;

      if Contains_Scheduling_Word (Item, "start of")
        or else Contains_Scheduling_Word (Item, "end of")
        or else Contains_Scheduling_Word (Item, "quarter")
        or else Contains_Scheduling_Word (Item, "month")
        or else Contains_Scheduling_Word (Item, "year")
      then
         Hit (Period_Boundary_Phrase);
      end if;

      if Contains_Scheduling_Word (Item, "every")
        or else Contains_Scheduling_Word (Item, "cron")
        or else Contains_Scheduling_Word (Item, "weekday list")
      then
         Hit (Recurrence_Phrase);
      end if;

      if Hits = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Kind => No_Scheduling_Phrase,
            Consumed => 0,
            Ambiguous => False,
            Has_Relative_Offset => False,
            Has_Date_Time => False,
            Has_Business_Day => False,
            Has_Period_Boundary => False,
            Has_Recurrence => False,
            Error_Position => Text'First,
            Error => Unsupported_Form);
      else
         return
           (Status => Humanize.Status.Ok,
            Kind => Kind,
            Consumed => Text'Length,
            Ambiguous => Kind = Ambiguous_Scheduling_Phrase,
            Has_Relative_Offset => Has_Relative,
            Has_Date_Time => Has_Date_Time,
            Has_Business_Day => Has_Business,
            Has_Period_Boundary => Has_Period,
            Has_Recurrence => Has_Recur,
            Error_Position => 0,
            Error => No_Parse_Error);
      end if;
end Classify_Scheduling_Phrase;
