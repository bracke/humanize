with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.Diagnostics is
   use type Humanize.Status.Status_Code;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text
     (Result : Humanize.Status.Text_Result)
      return String
      renames Humanize.Bounded_Text.Result_Text;

   function Invalid_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Invalid_Text;

   function Clean (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function Digits_Image (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Count_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
      renames Humanize.Bounded_Text.Count_Text;

   function Count_Or_No_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
      renames Humanize.Bounded_Text.Count_Or_No_Text;

   function Starts_With (Text, Prefix : String) return Boolean
      renames Humanize.Bounded_Text.Starts_With;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Domain_Options
     (Options : Diagnostic_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Diagnostic_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Diagnostic_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Diagnostic_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Diagnostic_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Severity_Text (Severity : Issue_Severity) return String is
   begin
      case Severity is
         when Info_Severity => return "info";
         when Notice_Severity => return "notice";
         when Warning_Severity => return "warning";
         when Error_Severity => return "error";
         when Critical_Severity => return "critical";
         when Blocking_Severity => return "blocking";
      end case;
   end Severity_Text;

   function Check_Status_Text (Status : Check_Status) return String is
   begin
      case Status is
         when Passed_Check => return "passed";
         when Failed_Check => return "failed";
         when Warning_Check => return "warnings";
         when Skipped_Check => return "skipped";
         when Pending_Check => return "pending";
         when Running_Check => return "running";
      end case;
   end Check_Status_Text;

   function Source_Text (Source : Diagnostic_Source) return String is
   begin
      case Source is
         when Build_Source => return "build";
         when Test_Source => return "test";
         when Lint_Source => return "lint";
         when Import_Source => return "import";
         when Validation_Source => return "validation";
         when Runtime_Source => return "runtime";
         when Security_Source => return "security";
         when Unknown_Source => return "diagnostic";
      end case;
   end Source_Text;

   function Severity_Suffix (Severity : Issue_Severity) return String is
   begin
      return Severity_Text (Severity);
   end Severity_Suffix;

   function Check_Status_Suffix (Status : Check_Status) return String is
   begin
      return Check_Status_Text (Status);
   end Check_Status_Suffix;

   function Issue_Severity_Metadata
     (Severity : Issue_Severity)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Diagnostics_Surface, Severity_Suffix (Severity));
   end Issue_Severity_Metadata;

   function Check_Status_Metadata
     (Status : Check_Status)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Diagnostics_Surface,
         Check_Status_Suffix (Status));
   end Check_Status_Metadata;

   function Severity_Label
     (Severity : Issue_Severity)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Severity_Suffix (Severity));
   end Severity_Label;

   function Check_Status_Label
     (Status : Check_Status)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Check_Status_Suffix (Status));
   end Check_Status_Label;

   function Source_Label
     (Source : Diagnostic_Source)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Source_Text (Source) & " diagnostics");
   end Source_Label;

   function Issue_Count_Label
     (Errors   : Natural := 0;
      Warnings : Natural := 0;
      Notices  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Text : Unbounded_String;
   begin
      if Errors = 0 and then Warnings = 0 and then Notices = 0 then
         return Ok_Text ("no issues");
      end if;

      if Errors > 0 then
         Append (Text, Count_Text (Errors, "error", "errors"));
      end if;
      if Warnings > 0 then
         if Length (Text) > 0 then
            Append (Text, ", ");
         end if;
         Append (Text, Count_Text (Warnings, "warning", "warnings"));
      end if;
      if Notices > 0 then
         if Length (Text) > 0 then
            Append (Text, ", ");
         end if;
         Append (Text, Count_Text (Notices, "notice", "notices"));
      end if;
      return Ok_Text (To_String (Text));
   end Issue_Count_Label;

   function Issue_Summary_Label
     (Errors   : Natural := 0;
      Warnings : Natural := 0;
      Notices  : Natural := 0;
      Blocking : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Issue_Count_Label (Errors, Warnings, Notices);
      Text : Unbounded_String := Base.Text;
   begin
      if Blocking > 0 then
         if To_String (Text) = "no issues" then
            Text := To_Unbounded_String (Count_Text (Blocking, "blocking issue", "blocking issues"));
         else
            Append (Text, ", " & Count_Text (Blocking, "blocking issue", "blocking issues"));
         end if;
      elsif Errors = 0 and then Warnings > 0 then
         Append (Text, " only");
      elsif Errors = 0 and then Warnings = 0 and then Notices > 0 then
         Append (Text, " only");
      end if;

      return Ok_Text (To_String (Text));
   end Issue_Summary_Label;

   function Check_Result_Label
     (Name   : String;
      Status : Check_Status)
      return Humanize.Status.Text_Result
   is
      Check_Name : constant String := Clean (Name);
   begin
      if Check_Name'Length = 0 then
         return Invalid_Text ("invalid check name");
      end if;
      return Ok_Text (Check_Name & " " & Check_Status_Suffix (Status));
   end Check_Result_Label;

   function Check_Result_Label
     (Name    : String;
      Status  : Check_Status;
      Options : Diagnostic_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Check_Result_Label (Name, Status);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Check_Status_Metadata (Status), Domain_Options (Options));
   end Check_Result_Label;

   function Parse_Check_Result_Label
     (Text   : String;
      Status : Check_Status)
      return Diagnostic_Label_Parse_Result
   is
      Result : Diagnostic_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Diagnostics_Surface,
         Check_Status_Suffix (Status));
      Result.Metadata := Check_Status_Metadata (Status);
      return Result;
   end Parse_Check_Result_Label;

   function Scan_Check_Result_Label
     (Text   : String;
      Status : Check_Status)
      return Diagnostic_Label_Parse_Result
   is
      Result : Diagnostic_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Diagnostics_Surface,
         Check_Status_Suffix (Status));
      Result.Metadata := Check_Status_Metadata (Status);
      return Result;
   end Scan_Check_Result_Label;

   function Location_Label
     (Path   : String := "";
      Line   : Natural := 0;
      Column : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Clean_Path : constant String := Clean (Path);
   begin
      if Clean_Path'Length = 0 and then Line = 0 then
         return Ok_Text ("unknown location");
      elsif Clean_Path'Length = 0 and then Column > 0 then
         return Ok_Text ("line " & Digits_Image (Line) & ", column " & Digits_Image (Column));
      elsif Clean_Path'Length = 0 then
         return Ok_Text ("line " & Digits_Image (Line));
      elsif Line = 0 then
         return Ok_Text (Clean_Path);
      elsif Column > 0 then
         return Ok_Text
           (Clean_Path & " line " & Digits_Image (Line)
            & ", column " & Digits_Image (Column));
      else
         return Ok_Text (Clean_Path & " line " & Digits_Image (Line));
      end if;
   end Location_Label;

   function Failed_At_Label
     (Path   : String;
      Line   : Natural := 0;
      Column : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Loc : constant Humanize.Status.Text_Result := Location_Label (Path, Line, Column);
   begin
      return Ok_Text ("failed at " & Result_Text (Loc));
   end Failed_At_Label;

   function First_Failure_Label
     (Check_Name : String;
      Path       : String := "";
      Line       : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Check : constant String := Clean (Check_Name);
   begin
      if Check'Length = 0 then
         return Invalid_Text ("invalid check name");
      elsif Clean (Path)'Length = 0 and then Line = 0 then
         return Ok_Text ("first failure in " & Check);
      else
         declare
            Loc : constant Humanize.Status.Text_Result := Location_Label (Path, Line);
         begin
            return Ok_Text ("first failure in " & Check & " at " & Result_Text (Loc));
         end;
      end if;
   end First_Failure_Label;

   function Diagnostic_Label
     (Message  : String;
      Severity : Issue_Severity := Error_Severity;
      Path     : String := "";
      Line     : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Msg : constant String := Clean (Message);
   begin
      if Msg'Length = 0 then
         return Invalid_Text ("invalid diagnostic message");
      elsif Clean (Path)'Length = 0 and then Line = 0 then
         return Ok_Text (Severity_Suffix (Severity) & ": " & Msg);
      else
         declare
            Loc : constant Humanize.Status.Text_Result := Location_Label (Path, Line);
         begin
            return Ok_Text
              (Severity_Suffix (Severity) & " at "
               & Result_Text (Loc) & ": " & Msg);
         end;
      end if;
   end Diagnostic_Label;

   function Diagnostic_Label
     (Message  : String;
      Severity : Issue_Severity;
      Options  : Diagnostic_Label_Options;
      Path     : String := "";
      Line     : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Diagnostic_Label (Message, Severity, Path, Line);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Issue_Severity_Metadata (Severity), Domain_Options (Options));
   end Diagnostic_Label;

   function Parse_Diagnostic_Label
     (Text     : String;
      Severity : Issue_Severity)
      return Diagnostic_Label_Parse_Result
   is
      Prefix : constant String := Severity_Suffix (Severity) & ": ";
      Result : Diagnostic_Label_Parse_Result;
   begin
      Result.Surface := Humanize.Domain_Details.Diagnostics_Surface;
      Result.Metadata := Issue_Severity_Metadata (Severity);

      if Text'Length <= Prefix'Length
        or else not Starts_With (Text, Prefix)
      then
         Result.Status := Humanize.Status.Invalid_Argument;
         return Result;
      end if;

      Result.Status := Humanize.Status.Ok;
      Result.Consumed := Text'Length;
      Result.State_First := Text'First;
      Result.State_Length := Severity_Suffix (Severity)'Length;
      Result.Name_First := Text'First + Prefix'Length;
      Result.Name_Length := Text'Last - Result.Name_First + 1;
      return Result;
   end Parse_Diagnostic_Label;

   function Scan_Diagnostic_Label
     (Text     : String;
      Severity : Issue_Severity)
      return Diagnostic_Label_Parse_Result
   is
   begin
      return Parse_Diagnostic_Label (Text, Severity);
   end Scan_Diagnostic_Label;

   function Source_Summary_Label
     (Source : Diagnostic_Source;
      Count  : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Count_Text (Count, Source_Text (Source) & " diagnostic", Source_Text (Source) & " diagnostics"));
   end Source_Summary_Label;

   function Check_Run_Summary_Label
     (Passed   : Natural := 0;
      Failed   : Natural := 0;
      Warnings : Natural := 0;
      Skipped  : Natural := 0;
      Pending  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Text : Unbounded_String;
   begin
      if Passed = 0 and then Failed = 0 and then Warnings = 0
        and then Skipped = 0 and then Pending = 0
      then
         return Ok_Text ("no checks run");
      end if;

      if Passed > 0 then
         Append (Text, Count_Text (Passed, "passed", "passed"));
      end if;
      if Failed > 0 then
         if Length (Text) > 0 then
            Append (Text, ", ");
         end if;
         Append (Text, Count_Text (Failed, "failed", "failed"));
      end if;
      if Warnings > 0 then
         if Length (Text) > 0 then
            Append (Text, ", ");
         end if;
         Append (Text, Count_Text (Warnings, "warning", "warnings"));
      end if;
      if Skipped > 0 then
         if Length (Text) > 0 then
            Append (Text, ", ");
         end if;
         Append (Text, Count_Text (Skipped, "skipped", "skipped"));
      end if;
      if Pending > 0 then
         if Length (Text) > 0 then
            Append (Text, ", ");
         end if;
         Append (Text, Count_Text (Pending, "pending", "pending"));
      end if;
      return Ok_Text (To_String (Text));
   end Check_Run_Summary_Label;

   function Check_Duration_Label
     (Name       : String;
      Status     : Check_Status;
      Duration_S : Natural)
      return Humanize.Status.Text_Result
   is
      Check_Name : constant String := Clean (Name);
   begin
      if Check_Name'Length = 0 then
         return Invalid_Text ("invalid check name");
      end if;
      return Ok_Text
        (Check_Name & " " & Check_Status_Text (Status)
         & " in " & Count_Text (Duration_S, "second", "seconds"));
   end Check_Duration_Label;

   function Retry_Label
     (Attempt : Positive;
      Limit   : Positive)
      return Humanize.Status.Text_Result
   is
   begin
      if Attempt > Limit then
         return Ok_Text
           ("retry " & Digits_Image (Attempt) & " of " & Digits_Image (Limit)
            & " exceeded");
      else
         return Ok_Text
           ("retry " & Digits_Image (Attempt) & " of " & Digits_Image (Limit));
      end if;
   end Retry_Label;

   function Suggested_Action_Label
     (Action : String)
      return Humanize.Status.Text_Result
   is
      Clean_Action : constant String := Clean (Action);
   begin
      if Clean_Action'Length = 0 then
         return Invalid_Text ("invalid suggested action");
      end if;
      return Ok_Text ("next: " & Clean_Action);
   end Suggested_Action_Label;

   function Affected_Items_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Count_Or_No_Text (Count, "affected item", "affected items"));
   end Affected_Items_Label;

   function Field_Problem_Label
     (Field_Name : String;
      Message    : String;
      Severity   : Issue_Severity := Error_Severity)
      return Humanize.Status.Text_Result
   is
      Field : constant String := Clean (Field_Name);
      Msg   : constant String := Clean (Message);
   begin
      if Field'Length = 0 then
         return Invalid_Text ("invalid field name");
      elsif Msg'Length = 0 then
         return Invalid_Text ("invalid diagnostic message");
      else
         return Ok_Text (Severity_Suffix (Severity) & " in " & Field & ": " & Msg);
      end if;
   end Field_Problem_Label;

   function Field_Problem_Label
     (Field_Name : String;
      Message    : String;
      Severity   : Issue_Severity;
      Options    : Diagnostic_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Field_Problem_Label (Field_Name, Message, Severity);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Issue_Severity_Metadata (Severity), Domain_Options (Options));
   end Field_Problem_Label;

   function Result_With_Notices_Label
     (Status  : Check_Status;
      Notices : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Notices = 0 then
         return Ok_Text (Check_Status_Text (Status) & " with no notices");
      else
         return Ok_Text
           (Check_Status_Text (Status) & " with "
            & Count_Text (Notices, "notice", "notices"));
      end if;
   end Result_With_Notices_Label;

   function Diagnostic_Explanation_Label
     (Kind       : Diagnostic_Explanation_Kind;
      Subject    : String := "";
      Position   : Natural := 0;
      Suggestion : String := "")
      return Humanize.Status.Text_Result
   is
      Base : constant String :=
        (case Kind is
            when Expected_Value => "expected a value",
            when Expected_Unit => "expected a unit",
            when Invalid_Range => "invalid range",
            when End_Before_Start => "range end is before start",
            when Unknown_Field => "unknown field",
            when Unsafe_Redacted_Value => "unsafe value was redacted",
            when Unsupported_Syntax => "unsupported syntax",
            when Unknown_Diagnostic_Explanation => "diagnostic explanation");
      Text : Unbounded_String := To_Unbounded_String (Base);
   begin
      if Subject'Length > 0 then
         Append (Text, " for " & Subject);
      end if;

      if Position > 0 then
         Append (Text, " at position ");
         Append (Text, Digits_Image (Position));
      end if;

      if Suggestion'Length > 0 then
         Append (Text, "; use " & Suggestion);
      end if;

      return Ok_Text (To_String (Text));
   end Diagnostic_Explanation_Label;

   function Parser_Family_Text (Family : Parser_Family) return String is
   begin
      case Family is
         when Byte_Parser => return "byte parser";
         when Duration_Parser => return "duration parser";
         when Date_Time_Parser => return "date-time parser";
         when Color_Parser => return "color parser";
         when URL_Parser => return "URL parser";
         when Unit_Parser => return "unit parser";
         when Recurrence_Parser => return "recurrence parser";
         when Domain_Label_Parser => return "domain-label parser";
         when Unknown_Parser => return "parser";
      end case;
   end Parser_Family_Text;

   function Parser_Diagnostic_Explanation_Label
     (Family   : Parser_Family;
      Error    : String;
      Position : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Subject : constant String := Parser_Family_Text (Family);
      Suggestion : constant String :=
        (case Family is
            when Byte_Parser => "B, kB, MB, GB, KiB, MiB, GiB, or TiB",
            when Duration_Parser => "ms, s, min, h, d, w, month, or year",
            when Date_Time_Parser => "ISO date, natural day, or clock time",
            when Color_Parser => "hex, rgb(), hsl(), lab(), lch(), or named color",
            when URL_Parser => "scheme, host, path, query, or fragment",
            when Unit_Parser => "a supported Humanize unit label",
            when Recurrence_Parser => "cron or every/weekday recurrence form",
            when Domain_Label_Parser => "a deterministic Humanize domain label",
            when Unknown_Parser => "a supported input form");
   begin
      return Diagnostic_Explanation_Label
        (Unsupported_Syntax, Subject & " " & Clean (Error),
         Position, Suggestion);
   end Parser_Diagnostic_Explanation_Label;

   function Find_Text (Text, Pattern : String) return Natural
      renames Humanize.Bounded_Text.Index_Text;

   function Explanation_Kind_For
     (Text : String)
      return Diagnostic_Explanation_Kind
   is
   begin
      if Starts_With (Text, "expected a value") then
         return Expected_Value;
      elsif Starts_With (Text, "expected a unit") then
         return Expected_Unit;
      elsif Starts_With (Text, "invalid range") then
         return Invalid_Range;
      elsif Starts_With (Text, "range end is before start") then
         return End_Before_Start;
      elsif Starts_With (Text, "unknown field") then
         return Unknown_Field;
      elsif Starts_With (Text, "unsafe value was redacted") then
         return Unsafe_Redacted_Value;
      elsif Starts_With (Text, "unsupported syntax") then
         return Unsupported_Syntax;
      else
         return Unknown_Diagnostic_Explanation;
      end if;
   end Explanation_Kind_For;

   function Parse_Diagnostic_Explanation_Label
     (Text : String)
      return Diagnostic_Explanation_Parse_Result
   is
      Item : constant String := Clean (Text);
      Kind : constant Diagnostic_Explanation_Kind := Explanation_Kind_For (Item);
      For_Pos : constant Natural := Find_Text (Item, " for ");
      Use_Pos : constant Natural := Find_Text (Item, "; use ");
      Result : Diagnostic_Explanation_Parse_Result;
   begin
      if Kind = Unknown_Diagnostic_Explanation then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Kind => Kind,
            others => <>);
      end if;

      Result.Kind := Kind;
      Result.Consumed := Item'Length;
      if For_Pos /= 0 then
         Result.Subject_First := For_Pos + 5;
         Result.Subject_Length :=
           (if Use_Pos /= 0 then Use_Pos - Result.Subject_First
            else Item'Last - Result.Subject_First + 1);
      end if;
      if Use_Pos /= 0 then
         Result.Suggestion_First := Use_Pos + 6;
         Result.Suggestion_Length := Item'Last - Result.Suggestion_First + 1;
      end if;
      return Result;
   end Parse_Diagnostic_Explanation_Label;

   function Scan_Diagnostic_Explanation_Label
     (Text : String)
      return Diagnostic_Explanation_Parse_Result
   is
      Stop : Natural := Text'Last;
   begin
      for Index in Text'Range loop
         if Text (Index) = ASCII.LF then
            Stop := Index - 1;
            exit;
         end if;
      end loop;
      if Text'Length = 0 or else Stop < Text'First then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Kind => Unknown_Diagnostic_Explanation,
            others => <>);
      end if;
      return Parse_Diagnostic_Explanation_Label (Text (Text'First .. Stop));
   end Scan_Diagnostic_Explanation_Label;

   procedure Diagnostic_Explanation_Label_Into
     (Kind       : Diagnostic_Explanation_Kind;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Subject    : String := "";
      Position   : Natural := 0;
      Suggestion : String := "")
   is
      Result : constant Humanize.Status.Text_Result :=
        Diagnostic_Explanation_Label (Kind, Subject, Position, Suggestion);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Diagnostic_Explanation_Label_Into;

   procedure Issue_Summary_Label_Into
     (Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Errors   : Natural := 0;
      Warnings : Natural := 0;
      Notices  : Natural := 0;
      Blocking : Natural := 0)
   is
      Result : constant Humanize.Status.Text_Result :=
        Issue_Summary_Label (Errors, Warnings, Notices, Blocking);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Issue_Summary_Label_Into;

   procedure Location_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Path    : String := "";
      Line    : Natural := 0;
      Column  : Natural := 0)
   is
      Result : constant Humanize.Status.Text_Result :=
        Location_Label (Path, Line, Column);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Location_Label_Into;

   procedure Diagnostic_Label_Into
     (Message  : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Severity : Issue_Severity := Error_Severity;
      Path     : String := "";
      Line     : Natural := 0)
   is
      Result : constant Humanize.Status.Text_Result :=
        Diagnostic_Label (Message, Severity, Path, Line);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Diagnostic_Label_Into;

   procedure Check_Result_Label_Into
     (Name    : String;
      Status  : Check_Status;
      Target  : in out String;
      Written : out Natural;
      Code    : out Humanize.Status.Status_Code;
      Options : Diagnostic_Label_Options)
   is
   begin
      Copy_Result
        (Check_Result_Label (Name, Status, Options), Target, Written, Code);
   end Check_Result_Label_Into;

   procedure Diagnostic_Label_Into
     (Message  : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Severity : Issue_Severity;
      Options  : Diagnostic_Label_Options;
      Path     : String := "";
      Line     : Natural := 0)
   is
   begin
      Copy_Result
        (Diagnostic_Label (Message, Severity, Options, Path, Line), Target,
         Written, Status);
   end Diagnostic_Label_Into;

   procedure Field_Problem_Label_Into
     (Field_Name : String;
      Message    : String;
      Severity   : Issue_Severity;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Options    : Diagnostic_Label_Options)
   is
   begin
      Copy_Result
        (Field_Problem_Label (Field_Name, Message, Severity, Options), Target,
         Written, Status);
   end Field_Problem_Label_Into;

end Humanize.Diagnostics;
