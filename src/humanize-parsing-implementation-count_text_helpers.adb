with Humanize.Bounded_Text;
with Humanize.Parsing.Implementation.Number_Text_Helpers;
with Humanize.Parsing.Implementation.Numeric_Text_Helpers;
with Humanize.Parsing.Implementation.Scalar_Text_Helpers;
with Humanize.Parsing.Support;
with Humanize.Status;

package body Humanize.Parsing.Implementation.Count_Text_Helpers is
   use type Humanize.Status.Status_Code;

   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;
   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;
   function Starts_With (Text, Prefix : String) return Boolean
      renames Humanize.Bounded_Text.Starts_With;
   function Ends_With (Text, Suffix : String) return Boolean
      renames Humanize.Bounded_Text.Ends_With;
   function Find_Substring (Text, Pattern : String) return Natural
      renames Humanize.Bounded_Text.Index_Text;
   function Numeric_Value
     (Text  : String;
      Value : out Long_Float)
      return Boolean
      renames Humanize.Parsing.Support.Numeric_Value;
   function Scan_End (Text : String) return Natural
      renames Humanize.Parsing.Support.Scan_End;
   function Parse_Two_Naturals
     (Left_Text  : String;
      Right_Text : String;
      Left       : out Natural;
      Right      : out Natural)
      return Boolean
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Parse_Two_Naturals;
   function Parse_Compact_Number
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Number_Text_Helpers.Parse_Compact_Number;
   function Parse_Cardinal
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Number_Text_Helpers.Parse_Cardinal;
   function Parse_Bounded_Number
     (Text   : String;
      Suffix : String := "+")
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Scalar_Text_Helpers.Parse_Bounded_Number;

   function Parse_Progress
     (Text : String)
      return Proportion_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Of_Pos : Natural := 0;
      Complete_Pos : Natural := 0;
      Suffix : constant String := " complete";
      Done, Total : Natural := 0;
   begin
      for Index in Item'Range loop
         if Index + 3 <= Item'Last and then Item (Index .. Index + 3) = " of "
         then
            Of_Pos := Index;
            exit;
         end if;
      end loop;

      Complete_Pos := Find_Substring (Item, Suffix);

      if Of_Pos = 0
        or else Complete_Pos = 0
        or else Complete_Pos <= Of_Pos + 4
        or else (Complete_Pos + Suffix'Length <= Item'Last
                 and then Item (Complete_Pos + Suffix'Length) /= ',')
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      if not Parse_Two_Naturals
        (Item (Item'First .. Of_Pos - 1),
         Item (Of_Pos + 4 .. Complete_Pos - 1),
         Done, Total)
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Count => Done,
         Total => Total,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Progress;

   function Parse_Result_Count
     (Text : String)
      return List_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Amount : Long_Float;
   begin
      if Item = "no results" or else Item = "no result" then
         return (Status => Humanize.Status.Ok, Count => 0, Exact => True,
                 Consumed => Item'Length, Error_Position => 0,
                 Error => No_Parse_Error);
      elsif Ends_With (Item, " results") or else Ends_With (Item, " result") then
         declare
            Stop : constant Natural :=
              (if Ends_With (Item, " results")
               then Item'Last - 8 else Item'Last - 7);
         begin
            if Numeric_Value (Item (Item'First .. Stop), Amount)
              and then Amount >= 0.0
            then
               return
                 (Status => Humanize.Status.Ok,
                  Count => Natural (Long_Float'Rounding (Amount)),
                  Exact => True,
                  Consumed => Item'Length,
                  Error_Position => 0,
                  Error => No_Parse_Error);
            end if;
         end;
      end if;
      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   exception
      when others => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Result_Count;

   function Counted_Result
     (Count    : Natural;
      Noun     : String;
      Consumed : Natural;
      Exact    : Boolean := True)
      return Counted_Noun_Parse_Result
   is
      Result : Counted_Noun_Parse_Result :=
        (Status => Humanize.Status.Ok,
         Count => Count,
         Exact => Exact,
         Consumed => Consumed,
         Error_Position => 0,
         others => <>);
      Copy_Length : constant Natural := Natural'Min (Noun'Length, Result.Noun'Length);
   begin
      if Copy_Length > 0 then
         Result.Noun (1 .. Copy_Length) :=
           Noun (Noun'First .. Noun'First + Copy_Length - 1);
      end if;
      Result.Noun_Length := Copy_Length;
      return Result;
   end Counted_Result;

   function Parse_Count_Prefix (Text : String) return Number_Parse_Result is
      Compact : constant Number_Parse_Result := Parse_Compact_Number (Text);
   begin
      if Text = "no" then
         return (Status => Humanize.Status.Ok, Value => 0, Exact => True,
                 Consumed => Text'Length, Error_Position => 0,
                 Error => No_Parse_Error);
      elsif Text = "a" or else Text = "an" then
         return (Status => Humanize.Status.Ok, Value => 1, Exact => True,
                 Consumed => Text'Length, Error_Position => 0,
                 Error => No_Parse_Error);
      elsif Compact.Status = Humanize.Status.Ok then
         return Compact;
      else
         return Parse_Cardinal (Text);
      end if;
   end Parse_Count_Prefix;

   function Parse_Counted_Noun
     (Text : String)
      return Counted_Noun_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
   begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Empty_Input,
            others => <>);
      end if;

      for Split in reverse Item'First + 1 .. Item'Last loop
         if Item (Split) = ' ' then
            declare
               Count_Text : constant String := Trim (Item (Item'First .. Split - 1));
               Noun_Text  : constant String := Trim (Item (Split + 1 .. Item'Last));
               Count      : constant Number_Parse_Result :=
                 Parse_Count_Prefix (Count_Text);
            begin
               if Noun_Text'Length > 0
                 and then Count.Status = Humanize.Status.Ok
                 and then Count.Value >= 0
               then
                  return Counted_Result
                    (Natural (Count.Value), Noun_Text, Item'Length, Count.Exact);
               end if;
            end;
         end if;
      end loop;

      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   exception
      when others => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Counted_Noun;

   function Scan_Counted_Noun
     (Text : String)
      return Counted_Noun_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Counted_Noun_Parse_Result :=
              Parse_Counted_Noun (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Counted_Noun;

   function Parse_Showing_Count
     (Text : String)
      return Proportion_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Prefix : constant String := "showing ";
      Of_Pos : Natural := 0;
      Shown, Total : Natural := 0;
   begin
      if Item'Length <= Prefix'Length
        or else Item (Item'First .. Item'First + Prefix'Length - 1) /= Prefix
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      for Index in Item'First + Prefix'Length .. Item'Last loop
         if Index + 3 <= Item'Last and then Item (Index .. Index + 3) = " of "
         then
            Of_Pos := Index;
            exit;
         end if;
      end loop;
      if Of_Pos = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      declare
         Tail : constant String := Item (Of_Pos + 4 .. Item'Last);
         End_Total : Natural := Tail'First - 1;
      begin
         for Index in Tail'Range loop
            exit when Tail (Index) = ' ';
            End_Total := Index;
         end loop;
         if End_Total < Tail'First
           or else not Parse_Two_Naturals
             (Item (Item'First + Prefix'Length .. Of_Pos - 1),
              Tail (Tail'First .. End_Total), Shown, Total)
         then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
      end;
      return (Status => Humanize.Status.Ok, Count => Shown, Total => Total,
              Exact => True, Consumed => Item'Length, Error_Position => 0,
              Error => No_Parse_Error);
   end Parse_Showing_Count;

   function Parse_Page_Count
     (Text : String)
      return Proportion_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Prefix : constant String := "page ";
      Of_Pos : Natural := 0;
      Page, Total : Natural := 0;
   begin
      if Item'Length <= Prefix'Length
        or else Item (Item'First .. Item'First + Prefix'Length - 1) /= Prefix
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      for Index in Item'First + Prefix'Length .. Item'Last loop
         if Index + 3 <= Item'Last and then Item (Index .. Index + 3) = " of "
         then
            Of_Pos := Index;
            exit;
         end if;
      end loop;
      if Of_Pos = 0
        or else not Parse_Two_Naturals
          (Item (Item'First + Prefix'Length .. Of_Pos - 1),
           Item (Of_Pos + 4 .. Item'Last), Page, Total)
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      return (Status => Humanize.Status.Ok, Count => Page, Total => Total,
              Exact => True, Consumed => Item'Length, Error_Position => 0,
              Error => No_Parse_Error);
   end Parse_Page_Count;

   function Parse_Count_Of_Total
     (Text   : String;
      Prefix : String)
      return Proportion_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Of_Pos : Natural := 0;
      Count, Total : Natural := 0;
   begin
      if not Starts_With (Item, Prefix) then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      for Index in Item'First + Prefix'Length .. Item'Last loop
         if Index + 3 <= Item'Last and then Item (Index .. Index + 3) = " of "
         then
            Of_Pos := Index;
            exit;
         end if;
      end loop;

      if Of_Pos = 0
        or else not Parse_Two_Naturals
          (Item (Item'First + Prefix'Length .. Of_Pos - 1),
           Item (Of_Pos + 4 .. Item'Last), Count, Total)
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      return (Status => Humanize.Status.Ok, Count => Count, Total => Total,
              Exact => True, Consumed => Item'Length, Error_Position => 0,
              Error => No_Parse_Error);
   end Parse_Count_Of_Total;

   function Parse_Step_Count
     (Text : String)
      return Proportion_Parse_Result is
   begin
      return Parse_Count_Of_Total (Text, "step ");
   end Parse_Step_Count;

   function Parse_Attempt_Count
     (Text : String)
      return Proportion_Parse_Result is
   begin
      return Parse_Count_Of_Total (Text, "attempt ");
   end Parse_Attempt_Count;

   function Scan_Step_Count
     (Text : String)
      return Proportion_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
      Result : Proportion_Parse_Result;
   begin
      if Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result := Parse_Step_Count (Text (Text'First .. Last));
      if Result.Status = Humanize.Status.Ok then
         Result.Consumed := Last - Text'First + 1;
      end if;
      return Result;
   end Scan_Step_Count;

   function Scan_Attempt_Count
     (Text : String)
      return Proportion_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
      Result : Proportion_Parse_Result;
   begin
      if Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result := Parse_Attempt_Count (Text (Text'First .. Last));
      if Result.Status = Humanize.Status.Ok then
         Result.Consumed := Last - Text'First + 1;
      end if;
      return Result;
   end Scan_Attempt_Count;

   function Parse_Progress_Bar
     (Text : String)
      return Number_Parse_Result
   is
      Item : constant String := Trim (Text);
      Close : Natural := 0;
   begin
      for Index in Item'Range loop
         if Item (Index) = ']' then
            Close := Index;
            exit;
         end if;
      end loop;

      if Item'Length = 0 or else Item (Item'First) /= '['
        or else Close = 0 or else Close + 2 > Item'Last
        or else Item (Close + 1) /= ' '
        or else Item (Item'Last) /= '%'
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      return Parse_Bounded_Number (Item (Close + 2 .. Item'Last - 1), "");
   end Parse_Progress_Bar;

   function Scan_Progress_Bar
     (Text : String)
      return Number_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
      Result : Number_Parse_Result;
   begin
      if Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result := Parse_Progress_Bar (Text (Text'First .. Last));
      if Result.Status = Humanize.Status.Ok then
         Result.Consumed := Last - Text'First + 1;
      end if;
      return Result;
   end Scan_Progress_Bar;

end Humanize.Parsing.Implementation.Count_Text_Helpers;
