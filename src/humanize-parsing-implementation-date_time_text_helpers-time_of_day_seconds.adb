separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Time_Of_Day_Seconds
     (Text    : String;
      Seconds : out Ada.Calendar.Day_Duration;
      Offset : out Integer;
      Has_Offset : out Boolean)
     return Boolean
   is
      Item : constant String := Clean_Lower (Text);

      function Parse_Timezone_Minutes
        (Offset_Text : String; Minutes : out Integer)
         return Boolean
      is
         Sign : constant Integer :=
           (if Offset_Text (Offset_Text'First) = '+'
            then 1
            else -1);
         Signless : constant String :=
           Trim (Offset_Text (Offset_Text'First + 1 .. Offset_Text'Last));
         Hour : Integer := 0;
         Minute : Integer := 0;
      begin
         if Signless'Length = 1 then
            if not Is_Digit (Signless (Signless'First)) then
               return False;
            end if;
            Hour := Integer'Value (Signless);
            Minute := 0;
         elsif Signless'Length = 2 then
            if not Is_Digit (Signless (Signless'First))
              or else not Is_Digit (Signless (Signless'First + 1))
            then
               return False;
            end if;
            Hour := Integer'Value (Signless);
            Minute := 0;
         elsif Signless'Length = 3 then
            if Signless (Signless'First + 1) /= ':'
              or else not Is_Digit (Signless (Signless'First))
              or else not Is_Digit (Signless (Signless'First + 2))
            then
               return False;
            end if;
            Hour := Integer'Value
              (Signless (Signless'First .. Signless'First));
            Minute := Integer'Value
              (Signless (Signless'First + 2 .. Signless'Last));
         elsif Signless'Length = 4 then
            if Signless (Signless'First + 1) = ':'
              and then Is_Digit (Signless (Signless'First))
              and then Is_Digit (Signless (Signless'First + 2))
              and then Is_Digit (Signless (Signless'First + 3))
            then
               Hour := Integer'Value (Signless (Signless'First .. Signless'First));
               Minute := Integer'Value
                 (Signless (Signless'First + 2 .. Signless'Last));
            elsif Is_Digit (Signless (Signless'First))
              and then Is_Digit (Signless (Signless'First + 1))
              and then Is_Digit (Signless (Signless'First + 2))
              and then Is_Digit (Signless (Signless'First + 3))
            then
               Hour := Integer'Value (Signless (Signless'First .. Signless'First + 1));
               Minute := Integer'Value
                 (Signless (Signless'First + 2 .. Signless'Last));
            else
               return False;
            end if;
         elsif Signless'Length = 5 then
            if Signless (Signless'First + 2) /= ':'
              or else not Is_Digit (Signless (Signless'First))
              or else not Is_Digit (Signless (Signless'First + 1))
              or else not Is_Digit (Signless (Signless'First + 3))
              or else not Is_Digit (Signless (Signless'First + 4))
            then
               return False;
            end if;
            Hour := Integer'Value (Signless (Signless'First .. Signless'First + 1));
            Minute := Integer'Value (Signless (Signless'First + 3 .. Signless'Last));
         else
            return False;
         end if;

         if Hour not in 0 .. 23 or else Minute not in 0 .. 59 then
            return False;
         end if;

         Minutes := Sign * (Hour * 60 + Minute);
         return True;
      exception
         when Constraint_Error =>
            return False;
      end Parse_Timezone_Minutes;

      function Is_Timezone_Offset (Text : String) return Boolean is
         Offset_Mins : Integer;
      begin
         if Text'Length not in 2 | 3 | 4 | 5 | 6 then
            return False;
         end if;
         return Parse_Timezone_Minutes (Text, Offset_Mins);
      end Is_Timezone_Offset;

      function Parse_Timezone_Name
        (Name : String;
         Minutes : out Integer)
         return Boolean
      is
      begin
         if Name = "ut" or else Name = "utc" or else Name = "gmt" then
            Minutes := 0;
         elsif Name = "est" then
            Minutes := -300;
         elsif Name = "edt" then
            Minutes := -240;
         elsif Name = "cst" then
            Minutes := -360;
         elsif Name = "cdt" then
            Minutes := -300;
         elsif Name = "mst" then
            Minutes := -420;
         elsif Name = "mdt" then
            Minutes := -360;
         elsif Name = "pst" then
            Minutes := -480;
         elsif Name = "pdt" then
            Minutes := -420;
         elsif Name = "cet" then
            Minutes := 60;
         elsif Name = "cest" then
            Minutes := 120;
         elsif Name = "wet" then
            Minutes := 0;
         elsif Name = "west" then
            Minutes := 60;
         elsif Name = "eet" then
            Minutes := 120;
         elsif Name = "eest" then
            Minutes := 180;
         elsif Name = "bst" then
            Minutes := 60;
         elsif Name = "aest" then
            Minutes := 600;
         elsif Name = "aedt" then
            Minutes := 660;
         elsif Name = "acst" then
            Minutes := 570;
         elsif Name = "acdt" then
            Minutes := 630;
         elsif Name = "awst" then
            Minutes := 480;
         elsif Name = "jst" then
            Minutes := 540;
         elsif Name = "kst" then
            Minutes := 540;
         else
            return False;
         end if;
         return True;
      end Parse_Timezone_Name;

      function Strip_Timezone
        (Source : String;
         Offset_Mins : out Integer;
         Found : out Boolean)
         return String
      is
         Trimmed : constant String := Trim (Source);
      begin
         Offset_Mins := 0;
         Found := False;
         if Trimmed'Length = 0 then
            return "";
         end if;

         if Trimmed (Trimmed'Last) = 'z' or else Trimmed (Trimmed'Last) = 'Z' then
            Found := True;
            return Trim (Trimmed (Trimmed'First .. Trimmed'Last - 1));
         end if;

         for Index in reverse Trimmed'Range loop
            if (Trimmed (Index) = '+' or else Trimmed (Index) = '-')
              and then Index > Trimmed'First
            then
               declare
                  Candidate : constant String := Trim (Trimmed (Index .. Trimmed'Last));
                  Prefix_End : Natural;
                  Prefix_Start : Natural;
                  Prefix_Offset : Integer;
                  Offset_Value : Integer;
               begin
                  Prefix_End := Index - 1;
                  while Prefix_End > Trimmed'First
                    and then Is_ASCII_Letter (Trimmed (Prefix_End))
                  loop
                     Prefix_End := Prefix_End - 1;
                  end loop;

                  if Prefix_End < Index - 1
                    and then Prefix_End + 1 < Index
                    and then Candidate'Length in 2 | 3 | 4 | 5 | 6
                    and then Is_Timezone_Offset (Candidate)
                    and then Parse_Timezone_Minutes (Candidate, Offset_Value)
                  then
                     Prefix_Start := Prefix_End + 1;
                     if Parse_Timezone_Name
                       (Trimmed (Prefix_Start .. Index - 1), Prefix_Offset)
                      and then Prefix_Offset = 0
                     then
                        Offset_Mins := Offset_Value;
                        Found := True;
                        return Trim
                          (Trimmed (Trimmed'First .. Prefix_Start - 1));
                     end if;
                  end if;

                  for Name_Length in reverse 2 .. 4 loop
                     declare
                        Name_Start : constant Integer := Index - Name_Length;
                        Name_Offset : Integer;
                        Can_Strip : Boolean;
                     begin
                        if Name_Start < Trimmed'First then
                           null;
                        else
                           if Parse_Timezone_Name
                             (Trim (Trimmed (Name_Start .. Index - 1)), Name_Offset)
                             and then Name_Offset = 0
                           then
                              Can_Strip := False;
                              if Name_Start = Trimmed'First then
                                 Can_Strip := True;
                              elsif not Is_ASCII_Letter (Trimmed (Name_Start - 1))
                              then
                                 Can_Strip := True;
                              elsif Trimmed (Name_Start - 1) = 'a'
                                or else Trimmed (Name_Start - 1) = 'A'
                                or else Trimmed (Name_Start - 1) = 'p'
                                or else Trimmed (Name_Start - 1) = 'P'
                                or else Trimmed (Name_Start - 1) = 'm'
                                or else Trimmed (Name_Start - 1) = 'M'
                              then
                                 Can_Strip := True;
                              end if;

                              if Can_Strip then
                                 Offset_Mins := Offset_Value;
                                 Found := True;
                                 return Trim
                                   (Trimmed (Trimmed'First .. Name_Start - 1));
                              end if;
                           end if;
                        end if;
                     end;
                  end loop;

                  if Is_Timezone_Offset (Candidate)
                    and then Parse_Timezone_Minutes (Candidate, Offset_Value)
                  then
                     Offset_Mins := Offset_Value;
                     Found := True;
                     return Trim (Trimmed (Trimmed'First .. Index - 1));
                  end if;
               end;
            end if;
         end loop;

         for Index in reverse Trimmed'Range loop
            if Trimmed (Index) = ' ' then
               declare
                  Candidate : constant String :=
                    Trim (Trimmed (Index + 1 .. Trimmed'Last));
                  Name_Offset : Integer := 0;
               begin
                  if Parse_Timezone_Name (Candidate, Name_Offset) then
                     Offset_Mins := Name_Offset;
                     Found := True;
                     return Trim (Trimmed (Trimmed'First .. Index - 1));
                  end if;
               end;
            end if;
         end loop;

         return Trimmed;
      end Strip_Timezone;

      function Merge_Spaced_AM_PM_Offset (Source : String) return String is
         Trimmed : constant String := Trim (Source);
      begin
         if Trimmed'Length < 4 then
            return Trimmed;
         end if;

         for Index in reverse Trimmed'Range loop
            if (Trimmed (Index) = '+' or else Trimmed (Index) = '-')
              and then Index > Trimmed'First + 2
            then
               declare
                  Token_End : Natural := Index - 1;
               begin
                  while Token_End > Trimmed'First and then Trimmed (Token_End) = ' ' loop
                     Token_End := Token_End - 1;
                  end loop;

                  if Token_End > Trimmed'First
                    and then Token_End + 1 < Index
                    and then Is_Lower (Trimmed (Token_End))
                    and then Is_Lower (Trimmed (Token_End - 1))
                    and then
                       ((Trimmed (Token_End - 1 .. Token_End) = "am")
                        or else
                        (Trimmed (Token_End - 1 .. Token_End) = "pm"))
                  then
                     return Trimmed (Trimmed'First .. Token_End)
                       & Trimmed (Index .. Trimmed'Last);
                  end if;
               end;
            end if;
         end loop;

         return Trimmed;
      end Merge_Spaced_AM_PM_Offset;

      function Parse_Natural_Text
        (Source : String;
         Value  : out Natural)
        return Boolean
      is
      begin
         if Source'Length = 0 then
            return False;
         end if;
         for Index in Source'Range loop
            if not Is_Digit (Source (Index)) then
               return False;
            end if;
         end loop;
         Value := Natural'Value (Source);
         return True;
      exception
         when Constraint_Error =>
            Value := 0;
            return False;
      end Parse_Natural_Text;

      function Parse_Clock
        (Source : String;
         Has_PM : Boolean;
         Has_AM : Boolean)
         return Boolean
      is
         Clock_Offset : Integer := 0;
         Clock_Offset_Present : Boolean := False;
         Clock_Text : constant String := Strip_Timezone
           (Source, Clock_Offset, Clock_Offset_Present);
         Colon : constant Natural := Find_Substring (Clock_Text, ":");
         Hour : Natural := 0;
         Minute : Natural := 0;
      begin
         if Clock_Text'Length = 0 then
            return False;
         end if;

         if Colon = 0 then
            if not Parse_Natural_Text (Clock_Text, Hour) then
               return False;
            end if;
         else
            if not Parse_Natural_Text
              (Clock_Text (Clock_Text'First .. Colon - 1), Hour)
              or else not Parse_Natural_Text
                (Clock_Text (Colon + 1 .. Clock_Text'Last), Minute)
            then
               return False;
            end if;
         end if;

         if Minute > 59 then
            return False;
         elsif Has_AM or else Has_PM then
            if Hour < 1 or else Hour > 12 then
               return False;
            end if;
            if Has_AM and then Hour = 12 then
               Hour := 0;
            elsif Has_PM and then Hour < 12 then
               Hour := Hour + 12;
            end if;
         elsif Hour > 23 then
            return False;
         end if;

         Seconds := Ada.Calendar.Day_Duration (Hour * 3_600 + Minute * 60);
         if Clock_Offset_Present then
            Offset := Clock_Offset;
            Has_Offset := True;
         end if;
         return True;
      end Parse_Clock;

      Base_Time_Offset : Integer := 0;
      Base_Time_Has_Offset : Boolean := False;
      Base_Text : constant String := Merge_Spaced_AM_PM_Offset (Item);
      Base_Time : constant String := Strip_Timezone
        (Base_Text, Base_Time_Offset, Base_Time_Has_Offset);
begin
      Offset := 0;
      Has_Offset := False;

      if Base_Time = "" then
         return False;
      elsif Base_Time = "morning" then
         Seconds := 9.0 * 3_600.0;
      elsif Base_Time = "afternoon" then
         Seconds := 13.0 * 3_600.0;
      elsif Base_Time = "evening" then
         Seconds := 18.0 * 3_600.0;
      elsif Base_Time = "night" then
         Seconds := 21.0 * 3_600.0;
      elsif Base_Time = "noon" or else Base_Time = "around noon"
        or else Base_Time = "about noon"
      then
         Seconds := 12.0 * 3_600.0;
      elsif Base_Time = "midnight" then
         Seconds := 0.0;
      elsif Base_Time'Length > 3 and then Ends_With (Base_Time, " pm") then
         if not Parse_Clock
           (Base_Time (Base_Time'First .. Base_Time'Last - 3), True, False)
         then
            return False;
         end if;
      elsif Base_Time'Length > 3 and then Ends_With (Base_Time, " am") then
         if not Parse_Clock
           (Base_Time (Base_Time'First .. Base_Time'Last - 3), False, True)
         then
            return False;
         end if;
      elsif Base_Time'Length > 2 and then Ends_With (Base_Time, "pm") then
         if not Parse_Clock (Base_Time (Base_Time'First .. Base_Time'Last - 2),
                             True, False)
         then
            return False;
         end if;
      elsif Base_Time'Length > 2 and then Ends_With (Base_Time, "am") then
         if not Parse_Clock (Base_Time (Base_Time'First .. Base_Time'Last - 2),
                             False, True)
         then
            return False;
         end if;
      elsif Find_Substring (Base_Time, ":") /= 0 then
         if not Parse_Clock (Base_Time, False, False) then
            return False;
         end if;
      else
         return False;
      end if;

      if Base_Time_Has_Offset then
         Offset := Base_Time_Offset;
         Has_Offset := True;
      end if;
      return True;
end Time_Of_Day_Seconds;
