with Humanize.Bounded_Text;

package body Humanize.Comparisons is
   use type Humanize.Status.Status_Code;

   function Image (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Find_Text (Text, Pattern : String) return Natural
      renames Humanize.Bounded_Text.Index_Text;

   function Is_Digit (Char : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;

   function Parse_Natural (Text : String; Value : out Natural) return Boolean is
   begin
      Value := Natural'Value (Text);
      return True;
   exception
      when Constraint_Error =>
         Value := 0;
         return False;
   end Parse_Natural;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Invalid_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Invalid_Text;

   function Label_Text
     (Result : Humanize.Status.Text_Result)
      return String
      renames Humanize.Bounded_Text.Result_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Nonempty
     (Text, Message : String)
      return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Nonempty_Text;

   function Result_Text (Result : Comparison_Result) return String is
   begin
      case Result is
         when Improved             => return "improved";
         when Regressed            => return "regressed";
         when Unchanged            => return "unchanged";
         when Within_Tolerance     => return "within tolerance";
         when Outside_Tolerance    => return "outside tolerance";
         when New_Value            => return "new";
         when Removed_Value        => return "removed";
         when Baseline_Unavailable => return "baseline unavailable";
      end case;
   end Result_Text;

   function Comparison_Result_Label
     (Result : Comparison_Result)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Result_Text (Result));
   end Comparison_Result_Label;

   function Comparison_Text
     (Label  : String;
      Result : Comparison_Result)
      return String
   is
   begin
      return Label & " " & Result_Text (Result);
   end Comparison_Text;

   function Difference_Label
     (Name            : String;
      Difference_Text : String;
      Result          : Comparison_Result)
      return Humanize.Status.Text_Result
   is
      Label : constant Humanize.Status.Text_Result := Nonempty (Name, "invalid comparison name");
      Diff  : constant Humanize.Status.Text_Result := Nonempty (Difference_Text, "invalid difference");
   begin
      if Label.Status /= Humanize.Status.Ok then
         return Label;
      elsif Diff.Status /= Humanize.Status.Ok then
         return Diff;
      else
         return Ok_Text (Comparison_Text
              (Label_Text (Label), Result)
            & " by " & Label_Text (Diff));
      end if;
   end Difference_Label;

   function Tolerance_Label
     (Name            : String;
      Difference_Text : String;
      Tolerance_Text  : String;
      Result          : Comparison_Result)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Difference_Label (Name, Difference_Text, Result);
      Tol  : constant Humanize.Status.Text_Result :=
        Nonempty (Tolerance_Text, "invalid tolerance");
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      elsif Tol.Status /= Humanize.Status.Ok then
         return Tol;
      else
         return Ok_Text (Label_Text (Base)
            & ", tolerance "
            & Label_Text (Tol));
      end if;
   end Tolerance_Label;

   function Baseline_Label
     (Name   : String;
      Result : Comparison_Result)
      return Humanize.Status.Text_Result
   is
      Label : constant Humanize.Status.Text_Result := Nonempty (Name, "invalid comparison name");
   begin
      if Label.Status /= Humanize.Status.Ok then
         return Label;
      else
         return Ok_Text (Comparison_Text
              (Label_Text (Label), Result));
      end if;
   end Baseline_Label;

   function Multi_Value_Text
     (Label     : String;
      Changed   : Natural;
      Unchanged : Natural;
      Total     : Natural)
      return String
   is
   begin
      return Label & ": " & Image (Changed) & " changed, "
        & Image (Unchanged) & " unchanged, " & Image (Total) & " total";
   end Multi_Value_Text;

   function Multi_Value_Summary
     (Name      : String;
      Changed   : Natural;
      Unchanged : Natural;
      Total     : Natural)
      return Humanize.Status.Text_Result
   is
      Label : constant Humanize.Status.Text_Result := Nonempty (Name, "invalid comparison name");
   begin
      if Label.Status /= Humanize.Status.Ok then
         return Label;
      elsif Changed + Unchanged > Total then
         return Invalid_Text ("invalid comparison counts");
      else
         return Ok_Text (Multi_Value_Text
              (Label_Text (Label),
               Changed, Unchanged, Total));
      end if;
   end Multi_Value_Summary;

   function Multi_Value_Summary
     (Name      : String;
      Changed   : Natural;
      Unchanged : Natural;
      Total     : Natural;
      Options   : Comparison_Summary_Options)
      return Humanize.Status.Text_Result
   is
      Label : constant Humanize.Status.Text_Result :=
        Nonempty (Name, "invalid comparison name");
   begin
      if Label.Status /= Humanize.Status.Ok then
         return Label;
      elsif Changed + Unchanged > Total then
         return Invalid_Text ("invalid comparison counts");
      end if;

      declare
         Text : constant String := Label_Text (Label);
      begin
         case Options.Mode is
            when Comparison_Detailed =>
               return Ok_Text (Multi_Value_Text (Text, Changed, Unchanged, Total));
            when Comparison_Compact =>
               return Ok_Text (Text & " " & Image (Changed) & "/" & Image (Total)
                  & " changed");
            when Comparison_Log =>
               return Ok_Text (Text & " changed=" & Image (Changed) & " unchanged="
                  & Image (Unchanged) & " total=" & Image (Total));
         end case;
      end;
   end Multi_Value_Summary;

   function Parse_Log_Multi_Value
     (Text : String)
      return Multi_Value_Parse_Result
   is
      Result : Multi_Value_Parse_Result;

      function Field
        (Name    : String;
         Value   : out Natural;
         End_Pos : out Natural)
         return Boolean
      is
         Mark  : constant String := " " & Name & "=";
         First : constant Natural := Find_Text (Text, Mark);
         Last  : Natural;
      begin
         End_Pos := 0;
         if First = 0 then
            return False;
         end if;

         Last := First + Mark'Length;
         while Last <= Text'Last and then Is_Digit (Text (Last)) loop
            Last := Last + 1;
         end loop;

         if Last = First + Mark'Length then
            return False;
         end if;

         if Parse_Natural (Text (First + Mark'Length .. Last - 1), Value) then
            End_Pos := Last;
            return True;
         else
            return False;
         end if;
      end Field;
      End_Pos : Natural := 0;
      Tail    : Natural := 0;
   begin
      if not Field ("changed", Result.Changed, End_Pos) then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      end if;
      Tail := Natural'Max (Tail, End_Pos);

      if not Field ("unchanged", Result.Unchanged, End_Pos) then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      end if;
      Tail := Natural'Max (Tail, End_Pos);

      if not Field ("total", Result.Total, End_Pos) then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      end if;
      Tail := Natural'Max (Tail, End_Pos);

      if Result.Changed + Result.Unchanged > Result.Total
        or else Tail /= Text'Last + 1
      then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      end if;

      Result.Status := Humanize.Status.Ok;
      Result.Consumed := Text'Length;
      return Result;
   end Parse_Log_Multi_Value;

   function Parse_Detailed_Multi_Value
     (Text : String)
      return Multi_Value_Parse_Result
   is
      Result        : Multi_Value_Parse_Result;
      Colon         : constant Natural := Find_Text (Text, ": ");
      Changed_Mark  : constant String := " changed, ";
      Unchanged_Mark : constant String := " unchanged, ";
      Total_Mark    : constant String := " total";
      Changed_End   : Natural;
      Unchanged_End : Natural;
      Total_End     : Natural;
   begin
      if Colon = 0 then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      end if;

      Changed_End :=
        Find_Text (Text (Colon + 2 .. Text'Last), Changed_Mark);
      if Changed_End = 0
        or else not Parse_Natural
          (Text (Colon + 2 .. Changed_End - 1), Result.Changed)
      then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      end if;

      Unchanged_End := Find_Text
        (Text (Changed_End + Changed_Mark'Length .. Text'Last),
         Unchanged_Mark);
      if Unchanged_End = 0
        or else not Parse_Natural
          (Text (Changed_End + Changed_Mark'Length .. Unchanged_End - 1),
           Result.Unchanged)
      then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      end if;

      Total_End := Find_Text
        (Text (Unchanged_End + Unchanged_Mark'Length .. Text'Last),
         Total_Mark);
      if Total_End = 0
        or else not Parse_Natural
          (Text (Unchanged_End + Unchanged_Mark'Length .. Total_End - 1),
           Result.Total)
      then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      elsif Result.Changed + Result.Unchanged > Result.Total then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      end if;

      Result.Status := Humanize.Status.Ok;
      Result.Consumed := Text'Length;
      return Result;
   end Parse_Detailed_Multi_Value;

   function Parse_Multi_Value_Summary
     (Text : String)
      return Multi_Value_Parse_Result
   is
      Log_Result : constant Multi_Value_Parse_Result :=
        Parse_Log_Multi_Value (Text);
   begin
      if Log_Result.Status = Humanize.Status.Ok then
         return Log_Result;
      else
         return Parse_Detailed_Multi_Value (Text);
      end if;
   end Parse_Multi_Value_Summary;

   function Scan_Multi_Value_Summary
     (Text : String)
      return Multi_Value_Parse_Result
   is
      Result : Multi_Value_Parse_Result;
   begin
      for Last in reverse Text'Range loop
         Result := Parse_Multi_Value_Summary (Text (Text'First .. Last));
         if Result.Status = Humanize.Status.Ok then
            Result.Consumed := Last - Text'First + 1;
            return Result;
         end if;
      end loop;

      Result.Status := Humanize.Status.Invalid_Argument;
      Result.Consumed := 0;
      return Result;
   end Scan_Multi_Value_Summary;

   procedure Comparison_Result_Label_Into
     (Result  : Comparison_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) is
   begin
      Copy_Result (Comparison_Result_Label (Result), Target, Written, Status);
   end Comparison_Result_Label_Into;

   procedure Difference_Label_Into
     (Name            : String;
      Difference_Text : String;
      Result          : Comparison_Result;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code) is
   begin
      Copy_Result (Difference_Label (Name, Difference_Text, Result), Target, Written, Status);
   end Difference_Label_Into;

   procedure Tolerance_Label_Into
     (Name            : String;
      Difference_Text : String;
      Tolerance_Text  : String;
      Result          : Comparison_Result;
      Target          : in out String;
      Written         : out Natural;
      Status          : out Humanize.Status.Status_Code) is
   begin
      Copy_Result (Tolerance_Label (Name, Difference_Text, Tolerance_Text, Result),
                   Target, Written, Status);
   end Tolerance_Label_Into;

   procedure Baseline_Label_Into
     (Name    : String;
      Result  : Comparison_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) is
   begin
      Copy_Result (Baseline_Label (Name, Result), Target, Written, Status);
   end Baseline_Label_Into;

   procedure Multi_Value_Summary_Into
     (Name      : String;
      Changed   : Natural;
      Unchanged : Natural;
      Total     : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code) is
   begin
      Copy_Result (Multi_Value_Summary (Name, Changed, Unchanged, Total),
                   Target, Written, Status);
   end Multi_Value_Summary_Into;
end Humanize.Comparisons;
