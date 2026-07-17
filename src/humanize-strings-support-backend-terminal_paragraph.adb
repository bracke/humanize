separate (Humanize.Strings.Support.Backend)
function Terminal_Paragraph
     (Text         : String;
      Width        : Positive;
      Prefix       : String := "";
      Continuation : String := "")
      return Humanize.Status.Text_Result
   is
      Prefix_Width : constant Natural := ANSI_Display_Width (Prefix);
      Continuation_Width : constant Natural := ANSI_Display_Width (Continuation);
      Content_Width : constant Positive :=
        Positive'Max
          (1, Width - Natural'Min
             (Width - 1, Natural'Max (Prefix_Width, Continuation_Width)));
      Result : Unbounded_String;
      Line   : Unbounded_String;
      Index  : Natural := Text'First;
      First_Line : Boolean := True;

      procedure Start_Line is
      begin
         if Length (Result) > 0 then
            Append (Result, ASCII.LF);
         end if;
         if First_Line then
            Append (Result, Prefix);
            First_Line := False;
         else
            Append (Result, Continuation);
         end if;
      end Start_Line;

      procedure Flush_Line is
      begin
         if Length (Line) = 0 then
            return;
         end if;
         Start_Line;
         Append (Result, To_String (Line));
         Line := Null_Unbounded_String;
      end Flush_Line;
begin
      while Index <= Text'Last loop
         while Index <= Text'Last
           and then (Text (Index) = ' ' or else Text (Index) = ASCII.HT)
         loop
            Index := Index + 1;
         end loop;
         exit when Index > Text'Last;

         declare
            Word_First : constant Natural := Index;
         begin
            while Index <= Text'Last
              and then Text (Index) /= ' '
              and then Text (Index) /= ASCII.HT
              and then Text (Index) /= ASCII.LF
            loop
               Index := Index + 1;
            end loop;

            declare
               Word : constant String := Text (Word_First .. Index - 1);
               Extra : constant Natural :=
                 (if Length (Line) = 0 then ANSI_Display_Width (Word)
                  else 1 + ANSI_Display_Width (Word));
            begin
               if Length (Line) > 0
                 and then ANSI_Display_Width (To_String (Line)) + Extra
                   > Content_Width
               then
                  Flush_Line;
               end if;

               if Length (Line) > 0 then
                  Append (Line, " ");
               end if;
               Append (Line, Word);
            end;
         end;

         if Index <= Text'Last and then Text (Index) = ASCII.LF then
            Flush_Line;
            Index := Index + 1;
         end if;
      end loop;

      Flush_Line;
      return Ok_Text (To_String (Result));
end Terminal_Paragraph;
