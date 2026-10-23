separate (Humanize.Parsing.Localized)
function Learn_Relative (Context : Humanize.Contexts.Context) return Lexicon is
   package D renames Humanize.Durations;
   Result    : Lexicon;
   Reference : constant Ada.Calendar.Time := Ada.Calendar.Time_Of (2026, 3, 10, 43_200.0);

   function Render (Offset : Long_Long_Integer) return String is
      Rendered : constant Humanize.Status.Text_Result :=
        Humanize.Datetimes.Relative (Context, Reference + Duration (Offset), Reference);
   begin
      return (if Rendered.Status = Humanize.Status.Ok then Plain (Context, To_String (Rendered.Text)) else "");
   end Render;
begin
   --  The present first, so "now" reads as 0 rather than a few seconds.
   for Offset of Present_Offsets loop
      if Render (Offset) /= "" then
         Learn (Result.Forms, Render (Offset), 0.0);
      end if;
   end loop;
   --  Largest units first: a calendar word ("yesterday") is first learnt
   --  from the span it names (a day), not from 1000 minutes.
   for Sign of Signs loop
      for Unit in reverse D.Duration_Unit loop
         for N of Samples loop
            declare
               Offset : constant Long_Long_Integer := Sign * N * Unit_Seconds (Unit);
            begin
               --  Ada.Calendar reaches a few centuries; a century is enough.
               exit when abs Offset > 3_200_000_000;
               declare
                  Shown_Text : constant String := Render (Offset);
                  Last       : Natural := 0;
                  Shown      : Long_Float := 0.0;
               begin
                  for I in Shown_Text'Range loop
                     if Shown_Text (I) in '0' .. '9' then
                        Read_Number (Shown_Text, I, Last, Shown);
                        exit;
                     end if;
                  end loop;
                  --  The formatter may say it in another unit ("2 weeks"
                  --  for 14 days): learn the unit it shows, when the offset
                  --  is a whole number of one.
                  if Last = 0 then
                     if Shown_Text /= "" then
                        Learn (Result.Forms, Shown_Text, Long_Float (Offset));
                     end if;
                  else
                     for U in D.Duration_Unit loop
                        if Long_Float (Offset) = Shown * Long_Float (Sign * Unit_Seconds (U)) then
                           Learn (Result.Forms, Shown_Text, Long_Float (Offset));
                           exit;
                        end if;
                     end loop;
                  end if;
               end;
            end;
         end loop;
      end loop;
   end loop;
   Fit (Result.Forms);
   return Result;
end Learn_Relative;
