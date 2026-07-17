separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Strip_Time_Of_Day
     (Text    : String;
      Prefix  : out Unbounded_String;
      Seconds : out Ada.Calendar.Day_Duration;
      Offset : out Integer;
      Has_Offset : out Boolean)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
begin
      for Index in reverse Item'Range loop
         if Item (Index) = ' ' then
            declare
               Tail : constant String := Item (Index + 1 .. Item'Last);
               Head : constant String := Trim (Item (Item'First .. Index - 1));
               Head_Length : constant Natural := Head'Length;
               Tail_Parsed : Boolean := False;
            begin
               if Head_Length > 0 then
                  Tail_Parsed := Time_Of_Day_Seconds
                    (Tail, Seconds, Offset, Has_Offset);
               end if;
               if Tail_Parsed then
                  if Ends_With (Head, " at") then
                     Prefix := To_Unbounded_String
                       (Trim (Head (Head'First .. Head'Last - 3)));
                  elsif Ends_With (Head, " around") then
                     Prefix := To_Unbounded_String
                       (Trim (Head (Head'First .. Head'Last - 7)));
                  elsif Ends_With (Head, " about") then
                     Prefix := To_Unbounded_String
                       (Trim (Head (Head'First .. Head'Last - 6)));
                  else
                     Prefix := To_Unbounded_String (Head);
                  end if;
                  return True;
               end if;

               declare
                     Previous : Natural := Index - 1;
                  Fallback_Prefix : Unbounded_String;
               begin
                  while Previous > Item'First
                    and then Item (Previous) /= ' '
                  loop
                     Previous := Previous - 1;
                  end loop;

                  if Previous < Index and then Previous > Item'First then
                     declare
                        Combined : constant String :=
                          Item (Previous + 1 .. Item'Last);
                     begin
                        if Combined'Length > 0
                          and then Is_Digit (Combined (Combined'First))
                          and then (Is_Digit (Combined (Combined'Last))
                            or else Combined (Combined'Last) = '+'
                            or else Combined (Combined'Last) = '-'
                            or else Combined (Combined'Last) = 'z'
                            or else Combined (Combined'Last) = 'Z')
                          and then Time_Of_Day_Seconds
                            (Combined, Seconds, Offset, Has_Offset)
                        then
                           Fallback_Prefix :=
                             To_Unbounded_String
                               (Trim (Item (Item'First .. Previous - 1)));
                           if Ends_With (To_String (Fallback_Prefix), " at") then
                              Prefix := To_Unbounded_String
                                (Trim
                                 (To_String (Fallback_Prefix)
                                  (To_String (Fallback_Prefix)'First ..
                                   To_String (Fallback_Prefix)'Last - 3)));
                           elsif Ends_With (To_String (Fallback_Prefix), " around") then
                              Prefix := To_Unbounded_String
                                (Trim
                                 (To_String (Fallback_Prefix)
                                  (To_String (Fallback_Prefix)'First ..
                                   To_String (Fallback_Prefix)'Last - 7)));
                           elsif Ends_With (To_String (Fallback_Prefix), " about") then
                              Prefix := To_Unbounded_String
                                (Trim
                                 (To_String (Fallback_Prefix)
                                  (To_String (Fallback_Prefix)'First ..
                                   To_String (Fallback_Prefix)'Last - 6)));
                           else
                              Prefix := Fallback_Prefix;
                           end if;
                           return True;
                        end if;
                     end;
                  end if;
               end;
            end;
         end if;
      end loop;
      return False;
end Strip_Time_Of_Day;
