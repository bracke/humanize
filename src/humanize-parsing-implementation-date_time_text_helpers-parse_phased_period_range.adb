separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Parse_Phased_Period_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Low       : out Ada.Calendar.Time;
      High      : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
      Space : Natural := 0;
      Phase : Unbounded_String;
      Period_Body : Unbounded_String;
      Period_Low : Ada.Calendar.Time;
      Period_High : Ada.Calendar.Time;
      Days : Natural;
      First_Len : Natural;
      Second_Len : Natural;
begin
      for Index in Item'Range loop
         if Item (Index) = ' ' then
            Space := Index;
            exit;
         end if;
      end loop;

      if Space = 0 then
         if Starts_With (Item, "mid-") then
            Phase := To_Unbounded_String ("mid");
            Period_Body :=
              To_Unbounded_String (Item (Item'First + 4 .. Item'Last));
         else
            return False;
         end if;
      else
         Phase := To_Unbounded_String (Item (Item'First .. Space - 1));
         Period_Body :=
           To_Unbounded_String (Trim (Item (Space + 1 .. Item'Last)));
      end if;
      if To_String (Phase) /= "early"
        and then To_String (Phase) /= "mid"
        and then To_String (Phase) /= "late"
      then
         return False;
      end if;

      if not Parse_Basic_Period_Range
        (Reference, To_String (Period_Body), Period_Low, Period_High)
      then
         return False;
      end if;

      Days := Natural ((Period_High - Period_Low) / 86_400.0);
      if Days = 0 then
         return False;
      end if;
      First_Len := (Days + 2) / 3;
      Second_Len := (Days + 1) / 3;

      if To_String (Phase) = "early" then
         Low := Period_Low;
         High := Add_Calendar_Days (Period_Low, Integer (First_Len));
      elsif To_String (Phase) = "mid" then
         Low := Add_Calendar_Days (Period_Low, Integer (First_Len));
         High := Add_Calendar_Days (Low, Integer (Second_Len));
      else
         Low := Add_Calendar_Days
           (Period_Low, Integer (First_Len + Second_Len));
         High := Period_High;
      end if;
      return True;
exception
      when others => --  parse failure normalization
         return False;
end Parse_Phased_Period_Range;
