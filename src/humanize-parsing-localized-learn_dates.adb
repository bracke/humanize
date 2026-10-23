separate (Humanize.Parsing.Localized)
function Learn_Dates (Context : Humanize.Contexts.Context) return Lexicon is
   package DT renames Humanize.Datetimes;
   Result : Lexicon;
   Styles : constant array (1 .. 4) of DT.Calendar_Date_Style :=
     [DT.Calendar_Date_ISO, DT.Calendar_Date_Short, DT.Calendar_Date_Medium, DT.Calendar_Date_Long];

   --  Text with the first From replaced by Marker; Text where it is absent.
   function Mark (Text, From : String; Marker : Character) return String is
      At_Index : constant Natural := Index (To_Unbounded_String (Text), From);
   begin
      return (if At_Index = 0 then Text
              else Text (Text'First .. At_Index - 1) & Marker & Text (At_Index + From'Length .. Text'Last));
   end Mark;
begin
   for Style of Styles loop
      --  Seven days of each month, so a style that names the weekday has a
      --  form for each.
      for Month in Ada.Calendar.Month_Number loop
         for Day in 22 .. 28 loop
            declare
               Rendered : constant Humanize.Status.Text_Result :=
                 DT.Calendar_Date_Label (Context, (Year => 2087, Month => Month, Day => Day, others => 0),
                                         DT.Calendar_Date_Options'(Style => Style, Fiscal_Year_Start_Month => 1));
               Day_Text : constant String := Ada.Strings.Fixed.Trim (Natural'Image (Day), Ada.Strings.Left);
            begin
               if Rendered.Status = Humanize.Status.Ok then
                  declare
                     Text  : constant String := Plain (Context, To_String (Rendered.Text));
                     Years : constant String :=
                       (if Index (To_Unbounded_String (Text), "2087") > 0 then Mark (Text, "2087", Year_Marker)
                        else Mark (Text, "87", Short_Marker));
                     Pattern : constant Unbounded_String := To_Unbounded_String (Mark (Years, Day_Text, Day_Marker));
                  begin
                     if not (for some F of Result.Forms => F.Pattern = Pattern) then
                        Result.Forms.Append
                          (Form'(Pattern => Pattern, Counted => False, Unit => Long_Float (Month), others => <>));
                     end if;
                  end;
               end if;
            end;
         end loop;
      end loop;
   end loop;
   --  Day words around the reference ("gestern", "morgen").
   for Offset in -2 .. 2 loop
      declare
         Reference : constant DT.Civil_Date_Time := (Year => 2087, Month => 6, Day => 15, others => 0);
         Rendered  : constant Humanize.Status.Text_Result :=
           DT.Natural_Day (Context, (Reference with delta Day => 15 + Offset), Reference);
         Text      : constant String :=
           (if Rendered.Status = Humanize.Status.Ok then Plain (Context, To_String (Rendered.Text)) else "");
      begin
         if Text /= "" and then (for all C of Text => C not in '0' .. '9')
           and then not (for some F of Result.Forms => To_String (F.Pattern) = Text)
         then
            Result.Forms.Append
              (Form'(Pattern => To_Unbounded_String (Text), Counted => False, Unit => Day_Word,
                     Offset => Long_Float (Offset), others => <>));
         end if;
      end;
   end loop;
   return Result;
end Learn_Dates;
