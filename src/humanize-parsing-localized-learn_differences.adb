with Humanize.Parsing.Phrases;

separate (Humanize.Parsing.Localized)
function Learn_Differences (Context : Humanize.Contexts.Context; Kind : Lexicon_Kind) return Lexicon is
   package DT renames Humanize.Datetimes;
   Result : Lexicon;

   --  The frame a relative difference of Kind sits in ("vor {difference}").
   Frame : constant String :=
     (if Kind = Difference_Future_Kind then "calendar_difference.future" else "calendar_difference.past");

   function Day (Year, Month, Day_Of_Month : Integer) return DT.Civil_Date_Time is
     (DT.Civil_Date_Time'(Year => Year, Month => Month, Day => Day_Of_Month, others => <>));

   --  The difference between First and Last as the label writes it: plain,
   --  or for a relative Kind the part inside its frame ("2 Jahren" from "vor
   --  2 Jahren"), in whichever order of the two the label points Kind's way.
   function Render (First, Last : DT.Civil_Date_Time) return String is
      function Label (From, To : DT.Civil_Date_Time; Style : DT.Calendar_Difference_Style) return String is
         Rendered : constant Humanize.Status.Text_Result :=
           DT.Calendar_Difference_Label
             (Context, From, To, (DT.Default_Calendar_Difference_Options with delta Style => Style));
      begin
         return (if Rendered.Status = Humanize.Status.Ok then To_String (Rendered.Text) else "");
      end Label;
   begin
      if Kind = Difference_Kind then
         return Plain (Context, Label (First, Last, DT.Calendar_Difference_Plain));
      end if;
      for Swap in Boolean loop
         declare
            Text   : constant String :=
              (if Swap then Label (Last, First, DT.Calendar_Difference_Relative)
               else Label (First, Last, DT.Calendar_Difference_Relative));
            Inside : constant Humanize.Parsing.Phrases.Phrase_Parse_Result :=
              Humanize.Parsing.Phrases.Parse (Context, Frame, Text);
         begin
            if Text /= "" and then Inside.Status = Humanize.Status.Ok and then Inside.Text_Count >= 1 then
               return Plain (Context, To_String (Inside.Texts (1)));
            end if;
         end;
      end loop;
      return "";
   end Render;

   procedure Take (Rendered : String; Value : Long_Float) is
   begin
      if Rendered /= "" then
         Learn (Result.Forms, Rendered, Value);
      end if;
   end Take;

   --  The texts between Parts where Whole joins them, in order.
   procedure Learn_Joins (Whole : String; Parts : Text_Vectors.Vector) is
      At_Index : Positive := Whole'First;
   begin
      for I in Parts.First_Index .. Parts.Last_Index loop
         exit when Length (Parts (I)) = 0 or else At_Index > Whole'Last;
         declare
            Part  : constant String := To_String (Parts (I));
            Found : constant Natural := Ada.Strings.Fixed.Index (Whole (At_Index .. Whole'Last), Part);
         begin
            exit when Found = 0;
            --  An empty join: the locale writes the parts together ("2年2个月").
            if I > Parts.First_Index then
               declare
                  Join : constant Unbounded_String := To_Unbounded_String (Whole (At_Index .. Found - 1));
               begin
                  if not Result.Joins.Contains (Join) then
                     Result.Joins.Append (Join);
                  end if;
               end;
            end if;
            At_Index := Found + Part'Length;
         end;
      end loop;
   end Learn_Joins;

   Years : constant Integer_List := [1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 20, 21, 22, 25, 100, 101, 102,
                                     103, 111];
   Pair  : Text_Vectors.Vector;
   Three : Text_Vectors.Vector;
begin
   for N of Years loop
      Take (Render (Day (2000, 1, 1), Day (2000 + Integer (N), 1, 1)), Long_Float (N) * 10_000.0);
   end loop;
   for N in 1 .. 11 loop
      Take (Render (Day (2001, 1, 1), Day (2001, 1 + N, 1)), Long_Float (N) * 100.0);
   end loop;
   for N in 1 .. 27 loop
      Take (Render (Day (2001, 2, 1), Day (2001, 2, 1 + N)), Long_Float (N));
   end loop;
   --  Two and three parts give the locale's joins (", ", " und ").
   Pair.Append (To_Unbounded_String (Render (Day (2000, 1, 1), Day (2002, 1, 1))));
   Pair.Append (To_Unbounded_String (Render (Day (2001, 2, 1), Day (2001, 2, 5))));
   Learn_Joins (Render (Day (2000, 1, 1), Day (2002, 1, 5)), Pair);
   Three.Append (To_Unbounded_String (Render (Day (2000, 1, 1), Day (2002, 1, 1))));
   Three.Append (To_Unbounded_String (Render (Day (2001, 1, 1), Day (2001, 3, 1))));
   Three.Append (To_Unbounded_String (Render (Day (2001, 2, 1), Day (2001, 2, 5))));
   Learn_Joins (Render (Day (2000, 1, 1), Day (2002, 3, 5)), Three);
   Fit (Result.Forms);
   return Result;
end Learn_Differences;
