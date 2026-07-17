separate (Humanize.Parsing.Implementation.Domain_Label_Text_Helpers)
function Parse_Domain_Summary
     (Text : String)
      return Domain_Summary_Parse_Result
   is
      Item : constant String := Trim (Text);
      Header_End : constant Natural := Find_Substring (Item, ": ");
      Header_Space : Natural := 0;
      Summary_Body : Unbounded_String;
      Main : Unbounded_String;
      Failed_Text : Unbounded_String;
      Of_Mark : constant String := " of ";
      Complete_Mark : constant String := " complete";
      Of_At : Natural;
      Complete_At : Natural;
      Amount : Long_Float;
      Tail : Unbounded_String;
      Domain_Buffer : String (1 .. 32);
      State_Buffer : String (1 .. 32);
      Unit_Buffer : String (1 .. 32);
      Domain_Length : Natural;
      State_Length : Natural;
      Unit_Length : Natural := 0;
      Completed : Natural := 0;
      Total : Natural := 0;
      Failed : Natural := 0;
begin
      if Header_End = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      for Index in Item'First .. Header_End - 1 loop
         if Item (Index) = ' ' then
            Header_Space := Index;
            exit;
         end if;
      end loop;
      if Header_Space = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      Store (Item (Item'First .. Header_Space - 1),
             Domain_Buffer, Domain_Length);
      Store (Item (Header_Space + 1 .. Header_End - 1),
             State_Buffer, State_Length);
      Summary_Body :=
        To_Unbounded_String (Trim (Item (Header_End + 2 .. Item'Last)));

      declare
         Body_Text : constant String := To_String (Summary_Body);
         Comma : constant Natural := Find_Substring (Body_Text, ", ");
      begin
         if Comma = 0 then
            Main := Summary_Body;
         else
            Main := To_Unbounded_String
              (Trim (Body_Text (Body_Text'First .. Comma - 1)));
            Failed_Text := To_Unbounded_String
              (Trim (Body_Text (Comma + 2 .. Body_Text'Last)));
            if not Parse_Failed_Segment (To_String (Failed_Text), Failed) then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Number,
                       others => <>);
            end if;
         end if;
      end;

      declare
         Main_Text : constant String := To_String (Main);
      begin
         if Starts_With (Main_Text, "no ") then
            Store (Trim (Main_Text (Main_Text'First + 3 .. Main_Text'Last)),
                   Unit_Buffer, Unit_Length);
         else
            Of_At := Find_Substring (Main_Text, Of_Mark);
            Complete_At := Find_Substring (Main_Text, Complete_Mark);
            if Complete_At = 0 then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Unit,
                       others => <>);
            elsif Of_At = 0 then
               if not Parse_Number_And_Tail
                 (Main_Text (Main_Text'First .. Complete_At - 1),
                  Amount, Tail)
                 or else Amount < 0.0
               then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error => Expected_Number,
                          others => <>);
               end if;

               Completed := Natural (Long_Float'Rounding (Amount));
               if Long_Float (Completed) /= Amount then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error => Expected_Number,
                          others => <>);
               end if;
               Store (To_String (Tail), Unit_Buffer, Unit_Length);
            elsif not Parse_Natural_Field
              (Main_Text (Main_Text'First .. Of_At - 1), Completed)
              or else not Parse_Number_And_Tail
              (Main_Text
                 (Of_At + Of_Mark'Length .. Complete_At - 1),
               Amount, Tail)
            then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Number,
                       others => <>);
            else
               Total := Natural (Long_Float'Rounding (Amount));
               if Long_Float (Total) /= Amount then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error => Expected_Number,
                          others => <>);
               end if;
               Store (To_String (Tail), Unit_Buffer, Unit_Length);
            end if;
         end if;
      end;

      return
        (Status => Humanize.Status.Ok,
         Domain => Domain_Buffer,
         Domain_Length => Domain_Length,
         State => State_Buffer,
         State_Length => State_Length,
         Completed => Completed,
         Total => Total,
         Failed => Failed,
         Unit => Unit_Buffer,
         Unit_Length => Unit_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Domain_Summary;
