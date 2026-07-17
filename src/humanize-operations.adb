with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.Operations is
   use type Humanize.Status.Status_Code;

   function Image (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Clean (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function Find_Text (Text, Pattern : String) return Natural
      renames Humanize.Bounded_Text.Index_Text;

   function Is_Digit (Char : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text
     (Result : Humanize.Status.Text_Result)
      return String
      renames Humanize.Bounded_Text.Result_Text;

   function Invalid_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Invalid_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Count_Text (Count : Natural; Singular, Plural : String) return String
      renames Humanize.Bounded_Text.Count_Text;

   function Plural_Text (Count : Natural; Singular, Plural : String) return String
      renames Humanize.Bounded_Text.Plural_Text;

   function Parse_Natural (Text : String; Value : out Natural) return Boolean is
   begin
      Value := Natural'Value (Text);
      return True;
   exception
      when Constraint_Error =>
         Value := 0;
         return False;
   end Parse_Natural;

   function Nonempty
     (Text, Message : String)
      return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Nonempty_Text;

   function Operation_State_Label
     (State : Operation_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (case State is
            when Queued              => "queued",
            when Running             => "running",
            when Blocked             => "blocked",
            when Retrying            => "retrying",
            when Succeeded           => "succeeded",
            when Partially_Succeeded => "partially succeeded",
            when Failed              => "failed",
            when Canceled            => "canceled",
            when Skipped             => "skipped",
            when Stale               => "stale",
            when Unknown_State       => "unknown");
   end Operation_State_Label;

   function State_Label (State : Operation_State) return String is
   begin
      return Result_Text (Operation_State_Label (State));
   end State_Label;

   function Extras
     (Failed, Skipped, Retried, Canceled : Natural;
      Singular, Plural : String)
      return String
   is
      Result : Unbounded_String;

      procedure Add (Count : Natural; Label : String) is
      begin
         if Count > 0 then
            if Length (Result) > 0 then
               Append (Result, ", ");
            end if;
            Append (Result, Count_Text (Count, Singular, Plural) & " " & Label);
         end if;
      end Add;
   begin
      Add (Failed, "failed");
      Add (Skipped, "skipped");
      Add (Retried, "retried");
      Add (Canceled, "canceled");
      if Length (Result) = 0 then
         return "";
      else
         return ", " & To_String (Result);
      end if;
   end Extras;

   function Compact_Extras
     (Failed, Skipped, Retried, Canceled : Natural)
      return String
   is
      Result : Unbounded_String;

      procedure Add (Count : Natural; Label : String) is
      begin
         if Count > 0 then
            if Length (Result) > 0 then
               Append (Result, ", ");
            end if;
            Append (Result, Image (Count) & " " & Label);
         end if;
      end Add;
   begin
      Add (Failed, "failed");
      Add (Skipped, "skipped");
      Add (Retried, "retried");
      Add (Canceled, "canceled");
      if Length (Result) = 0 then
         return "";
      else
         return ", " & To_String (Result);
      end if;
   end Compact_Extras;

   function Log_Extras
     (Failed, Skipped, Retried, Canceled : Natural)
      return String
   is
   begin
      return " failed=" & Image (Failed) & " skipped=" & Image (Skipped)
        & " retried=" & Image (Retried) & " canceled=" & Image (Canceled);
   end Log_Extras;

   function Progress_Prefix
     (Label : String;
      State : Operation_State)
      return String
   is
   begin
      return Label & " " & State_Label (State) & ": ";
   end Progress_Prefix;

   function Progress_Text
     (Label      : String;
      State      : Operation_State;
      Completed  : Natural;
      Total      : Natural;
      Singular   : String;
      Plural     : String;
      Extra_Text : String := "")
      return String
   is
   begin
      return Progress_Prefix (Label, State) &
        Image (Completed) & " of " & Image (Total) & " " &
        Plural_Text (Total, Singular, Plural) & " complete" & Extra_Text;
   end Progress_Text;

   function Progress_Summary
     (Name      : String;
      State     : Operation_State;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Skipped   : Natural := 0;
      Retried   : Natural := 0;
      Canceled  : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result
   is
      Label : constant Humanize.Status.Text_Result :=
        Nonempty (Name, "invalid operation name");
   begin
      if Label.Status /= Humanize.Status.Ok then
         return Label;
      elsif Completed > Total then
         return Invalid_Text ("invalid operation progress");
      else
         return Ok_Text (Progress_Text
              (Result_Text (Label),
               State, Completed, Total, Singular, Plural,
               Extras (Failed, Skipped, Retried, Canceled, Singular, Plural)));
      end if;
   end Progress_Summary;

   function Progress_Summary
     (Name      : String;
      State     : Operation_State;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural;
      Skipped   : Natural;
      Retried   : Natural;
      Canceled  : Natural;
      Singular  : String;
      Plural    : String;
      Options   : Operation_Summary_Options)
      return Humanize.Status.Text_Result
   is
      Label : constant Humanize.Status.Text_Result :=
        Nonempty (Name, "invalid operation name");
      Extra_Text : constant String :=
        (if Options.Include_Extras
         then Extras (Failed, Skipped, Retried, Canceled, Singular, Plural)
         else "");
      Compact_Extra_Text : constant String :=
        (if Options.Include_Extras
         then Compact_Extras (Failed, Skipped, Retried, Canceled)
         else "");
      Log_Extra_Text : constant String :=
        (if Options.Include_Extras
         then Log_Extras (Failed, Skipped, Retried, Canceled)
         else "");
   begin
      if Label.Status /= Humanize.Status.Ok then
         return Label;
      elsif Completed > Total then
         return Invalid_Text ("invalid operation progress");
      end if;

      case Options.Mode is
         when Operation_Detailed =>
            return Ok_Text (Progress_Text
                 (Result_Text (Label),
                  State, Completed, Total, Singular, Plural, Extra_Text));
         when Operation_Compact =>
            return Ok_Text (Result_Text (Label) & " " & Image (Completed) & "/"
               & Image (Total) & " " & State_Label (State)
               & Compact_Extra_Text);
         when Operation_Accessible =>
            return Ok_Text (Progress_Text
                 (Result_Text (Label),
                  State, Completed, Total, Singular, Plural, Extra_Text));
         when Operation_Log =>
            return Ok_Text (Result_Text (Label) & " state=" & State_Label (State)
               & " completed=" & Image (Completed)
               & " total=" & Image (Total) & Log_Extra_Text);
      end case;
   end Progress_Summary;

   function Parse_Log_Progress
     (Text : String)
      return Operation_Progress_Parse_Result
   is
      Result     : Operation_Progress_Parse_Result;
      State_Mark : constant String := " state=";
      State_Pos  : constant Natural := Find_Text (Text, State_Mark);
      Matched    : Boolean := False;

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
      if State_Pos = 0 then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      end if;

      for State in Operation_State loop
         declare
            Label : constant String := State_Label (State);
            First : constant Natural := State_Pos + State_Mark'Length;
            Last  : constant Natural := First + Label'Length - 1;
         begin
            if Last <= Text'Last and then Text (First .. Last) = Label then
               Result.State := State;
               Matched := True;
               exit;
            end if;
         end;
      end loop;

      if not Matched then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      elsif not Field ("completed", Result.Completed, End_Pos)
      then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      end if;
      Tail := Natural'Max (Tail, End_Pos);

      if not Field ("total", Result.Total, End_Pos) then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      end if;
      Tail := Natural'Max (Tail, End_Pos);

      if Result.Completed > Result.Total then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      end if;

      declare
         Ignored : Boolean;
      begin
         Ignored := Field ("failed", Result.Failed, End_Pos);
         if Ignored then
            Tail := Natural'Max (Tail, End_Pos);
         end if;
         Ignored := Field ("skipped", Result.Skipped, End_Pos);
         if Ignored then
            Tail := Natural'Max (Tail, End_Pos);
         end if;
         Ignored := Field ("retried", Result.Retried, End_Pos);
         if Ignored then
            Tail := Natural'Max (Tail, End_Pos);
         end if;
         Ignored := Field ("canceled", Result.Canceled, End_Pos);
         if Ignored then
            Tail := Natural'Max (Tail, End_Pos);
         end if;
      end;

      if Tail /= Text'Last + 1 then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      end if;

      Result.Status := Humanize.Status.Ok;
      Result.Consumed := Text'Length;
      return Result;
   end Parse_Log_Progress;

   function Parse_Detailed_Progress
     (Text : String)
      return Operation_Progress_Parse_Result
   is
      Result : Operation_Progress_Parse_Result;
   begin
      for State in Operation_State loop
         declare
            Mark : constant String := " " & State_Label (State) & ": ";
            Pos  : constant Natural := Find_Text (Text, Mark);
         begin
            if Pos /= 0 then
               declare
                  First    : constant Natural := Pos + Mark'Length;
                  Of_Pos   : constant Natural :=
                    Find_Text (Text (First .. Text'Last), " of ");
                  Complete : constant String := " complete";
                  Done_Pos : Natural;
                  Count_First : Natural;
               begin
                  Result.State := State;
                  if Of_Pos = 0 then
                     Result.Status := Humanize.Status.Invalid_Argument;
                     return Result;
                  elsif not Parse_Natural
                    (Text (First .. Of_Pos - 1), Result.Completed)
                  then
                     Result.Status := Humanize.Status.Invalid_Argument;
                     return Result;
                  end if;

                  Count_First := Of_Pos + 4;
                  Done_Pos :=
                    Find_Text (Text (Count_First .. Text'Last), Complete);
                  if Done_Pos = 0 then
                     Result.Status := Humanize.Status.Invalid_Argument;
                     return Result;
                  end if;

                  declare
                     Space : constant Natural :=
                       Find_Text (Text (Count_First .. Done_Pos - 1), " ");
                  begin
                     if Space = 0
                       or else not Parse_Natural
                         (Text (Count_First .. Space - 1), Result.Total)
                     then
                        Result.Status := Humanize.Status.Invalid_Argument;
                        return Result;
                     end if;
                  end;

                  if Result.Completed > Result.Total then
                     Result.Status := Humanize.Status.Invalid_Argument;
                  else
                     Result.Status := Humanize.Status.Ok;
                     Result.Consumed := Text'Length;
                  end if;
                  return Result;
               end;
            end if;
         end;
      end loop;

      Result.Status := Humanize.Status.Invalid_Argument;
      return Result;
   end Parse_Detailed_Progress;

   function Parse_Progress_Summary
     (Text : String)
      return Operation_Progress_Parse_Result
   is
      Log_Result : constant Operation_Progress_Parse_Result :=
        Parse_Log_Progress (Text);
   begin
      if Log_Result.Status = Humanize.Status.Ok then
         return Log_Result;
      else
         return Parse_Detailed_Progress (Text);
      end if;
   end Parse_Progress_Summary;

   function Scan_Progress_Summary
     (Text : String)
      return Operation_Progress_Parse_Result
   is
      Result : Operation_Progress_Parse_Result;
   begin
      for Last in reverse Text'Range loop
         Result := Parse_Progress_Summary (Text (Text'First .. Last));
         if Result.Status = Humanize.Status.Ok then
            Result.Consumed := Last - Text'First + 1;
            return Result;
         end if;
      end loop;

      Result.Status := Humanize.Status.Invalid_Argument;
      Result.Consumed := 0;
      return Result;
   end Scan_Progress_Summary;

   function Unknown_Total_Summary
     (Name      : String;
      State     : Operation_State;
      Completed : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result
   is
      Label : constant Humanize.Status.Text_Result :=
        Nonempty (Name, "invalid operation name");
   begin
      if Label.Status /= Humanize.Status.Ok then
         return Label;
      else
         return Ok_Text (Progress_Prefix (Result_Text (Label), State) &
            Count_Text (Completed, Singular, Plural) & " complete" &
            Extras (Failed, 0, 0, 0, Singular, Plural));
      end if;
   end Unknown_Total_Summary;

   function Time_Label (Name, Time_Text, Suffix, Invalid_Name, Invalid_Time : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.Bounded_Text.Nonempty_Detail_Text
        (Name, Invalid_Name, " " & Suffix & " ", Time_Text, Invalid_Time);
   end Time_Label;

   function Last_Success_Label
     (Name      : String;
      Time_Text : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Time_Label (Name, Time_Text, "last succeeded", "invalid operation name",
                         "invalid success time");
   end Last_Success_Label;

   function Next_Retry_Label
     (Name      : String;
      Time_Text : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Time_Label (Name, Time_Text, "next retry", "invalid operation name",
                         "invalid retry time");
   end Next_Retry_Label;

   function Stale_Run_Label
     (Name      : String;
      Time_Text : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Time_Label (Name, Time_Text, "stale for", "invalid operation name",
                         "invalid stale duration");
   end Stale_Run_Label;

   procedure Operation_State_Label_Into
     (State   : Operation_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) is
   begin
      Copy_Result (Operation_State_Label (State), Target, Written, Status);
   end Operation_State_Label_Into;

   procedure Progress_Summary_Into
     (Name      : String;
      State     : Operation_State;
      Completed : Natural;
      Total     : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Failed    : Natural := 0;
      Skipped   : Natural := 0;
      Retried   : Natural := 0;
      Canceled  : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items") is
   begin
      Copy_Result (Progress_Summary (Name, State, Completed, Total, Failed,
        Skipped, Retried, Canceled, Singular, Plural), Target, Written, Status);
   end Progress_Summary_Into;

   procedure Unknown_Total_Summary_Into
     (Name      : String;
      State     : Operation_State;
      Completed : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items") is
   begin
      Copy_Result (Unknown_Total_Summary (Name, State, Completed, Failed,
        Singular, Plural), Target, Written, Status);
   end Unknown_Total_Summary_Into;

   procedure Last_Success_Label_Into
     (Name      : String;
      Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code) is
   begin
      Copy_Result (Last_Success_Label (Name, Time_Text), Target, Written, Status);
   end Last_Success_Label_Into;

   procedure Next_Retry_Label_Into
     (Name      : String;
      Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code) is
   begin
      Copy_Result (Next_Retry_Label (Name, Time_Text), Target, Written, Status);
   end Next_Retry_Label_Into;

   procedure Stale_Run_Label_Into
     (Name      : String;
      Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code) is
   begin
      Copy_Result (Stale_Run_Label (Name, Time_Text), Target, Written, Status);
   end Stale_Run_Label_Into;
end Humanize.Operations;
