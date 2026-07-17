with Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Bytes;
with Humanize.Status;
with Humanize.Units;

package body Humanize.Parsing.Success_Labels is
   use type Humanize.Status.Status_Code;
   use Ada.Strings.Unbounded;

   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function No_Space (Image : String) return String
      renames Humanize.Bounded_Text.No_Space;

   function Integer_Text (Value : Long_Long_Integer) return String
      renames Humanize.Bounded_Text.Image;

   function Is_Digit (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;

   function Digit_Value (Item : Character) return Natural
      renames Humanize.Bounded_Text.Digit_Value;

   function Starts_With (Text, Prefix : String) return Boolean
      renames Humanize.Bounded_Text.Starts_With;

   function Ends_With (Text, Suffix : String) return Boolean
      renames Humanize.Bounded_Text.Ends_With;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Status_Text
     (Status : Humanize.Status.Status_Code;
      Text   : String)
      return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Status_Text;

   function Image (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   procedure Copy_Text
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Find_Substring (Text, Pattern : String) return Natural
      renames Humanize.Bounded_Text.Index_Text;

   function Scheduling_Phrase_Label
     (Result : Scheduling_Phrase_Result)
      return Humanize.Status.Text_Result
   is
      Text : constant String :=
        (case Result.Kind is
            when No_Scheduling_Phrase => "no scheduling phrase",
            when Relative_Offset_Phrase => "relative scheduling phrase",
            when Date_Time_Phrase => "date-time scheduling phrase",
            when Business_Day_Phrase => "business-day scheduling phrase",
            when Period_Boundary_Phrase => "period-boundary scheduling phrase",
            when Recurrence_Phrase => "recurrence scheduling phrase",
            when Ambiguous_Scheduling_Phrase => "ambiguous scheduling phrase");
   begin
      if Result.Status /= Humanize.Status.Ok then
         return Status_Text (Result.Status, Text);
      elsif Result.Ambiguous then
         return Ok_Text (Text & ", needs caller disambiguation");
      else
         return Ok_Text (Text);
      end if;
   end Scheduling_Phrase_Label;

   procedure Add_Candidate
     (Text    : in out Unbounded_String;
      Enabled : Boolean;
      Label   : String)
   is
   begin
      if Enabled then
         if Length (Text) > 0 then
            Append (Text, ", ");
         end if;
         Append (Text, Label);
      end if;
   end Add_Candidate;

   function Scheduling_Ambiguity_Label
     (Result : Scheduling_Phrase_Result)
      return Humanize.Status.Text_Result
   is
      Candidates : Unbounded_String;
   begin
      Add_Candidate
        (Candidates, Result.Has_Relative_Offset, "relative offset");
      Add_Candidate (Candidates, Result.Has_Date_Time, "date-time");
      Add_Candidate (Candidates, Result.Has_Business_Day, "business day");
      Add_Candidate
        (Candidates, Result.Has_Period_Boundary, "period boundary");
      Add_Candidate (Candidates, Result.Has_Recurrence, "recurrence");

      if Length (Candidates) = 0 then
         return Ok_Text ("no scheduling candidates");
      elsif Result.Ambiguous then
         return Ok_Text
           ("ambiguous scheduling phrase: choose "
            & To_String (Candidates));
      else
         return Ok_Text ("scheduling candidate: " & To_String (Candidates));
      end if;
   end Scheduling_Ambiguity_Label;

   function Scheduling_Resolution_Label
     (Kind : Scheduling_Phrase_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Kind is
            when Relative_Offset_Phrase =>
               "resolve with duration or relative date-time parser",
            when Date_Time_Phrase =>
               "resolve with natural date-time parser",
            when Business_Day_Phrase =>
               "resolve with business-calendar parser",
            when Period_Boundary_Phrase =>
               "resolve with period-boundary parser",
            when Recurrence_Phrase =>
               "resolve with recurrence parser",
            when Ambiguous_Scheduling_Phrase =>
               "ask caller to choose a scheduling interpretation",
            when No_Scheduling_Phrase =>
               "no scheduling parser applies");
   end Scheduling_Resolution_Label;

   function Parse_Value_Family_Text
     (Family : Parse_Value_Family)
      return String
   is
   begin
      case Family is
         when Parsed_Bytes         => return "bytes";
         when Parsed_Duration      => return "duration";
         when Parsed_Number        => return "number";
         when Parsed_Date_Time     => return "date-time";
         when Parsed_Color         => return "color";
         when Parsed_URL           => return "url";
         when Parsed_Unit          => return "unit";
         when Parsed_Recurrence    => return "recurrence";
         when Parsed_Generic_Value => return "value";
      end case;
   end Parse_Value_Family_Text;

   function Match_Parse_Value_Family
     (Text   : String;
      Family : out Parse_Value_Family)
      return Boolean
   is
   begin
      for Candidate in Parse_Value_Family loop
         if Text = Parse_Value_Family_Text (Candidate) then
            Family := Candidate;
            return True;
         end if;
      end loop;
      return False;
   end Match_Parse_Value_Family;

   function Parse_Value_Family_Label
     (Family : Parse_Value_Family)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Parse_Value_Family_Text (Family));
   end Parse_Value_Family_Label;

   function Parse_Success_Explanation_Label
     (Family     : Parse_Value_Family;
      Input      : String;
      Normalized : String;
      Consumed   : Natural := 0;
      Exact      : Boolean := True)
      return Humanize.Status.Text_Result
   is
      In_Text : constant String := Trim (Input);
      Norm    : constant String := Trim (Normalized);
      Used    : constant Natural :=
        (if Consumed = 0 then In_Text'Length else Consumed);
   begin
      if In_Text'Length = 0 then
         return Ok_Text ("parse success " & Parse_Value_Family_Text (Family)
                         & ": empty input");
      elsif Norm'Length = 0 then
         return Status_Text
           (Humanize.Status.Invalid_Argument,
            "invalid normalized parse label");
      else
         return Ok_Text
           ("parse success " & Parse_Value_Family_Text (Family)
            & ": input=""" & In_Text & """ normalized=""" & Norm
            & """ consumed=" & Image (Used)
            & " exact=" & (if Exact then "yes" else "no"));
      end if;
   end Parse_Success_Explanation_Label;

   function Natural_Field
     (Text   : String;
      Prefix : String)
      return Natural
   is
      Pos   : constant Natural := Find_Substring (Text, Prefix);
      First : Natural;
      Last  : Natural;
      Value : Natural := 0;
   begin
      if Pos = 0 then
         return 0;
      end if;
      First := Pos + Prefix'Length;
      Last := First;
      while Last <= Text'Last and then Is_Digit (Text (Last)) loop
         Value := Value * 10 + Digit_Value (Text (Last));
         Last := Last + 1;
      end loop;
      return Value;
   end Natural_Field;

   function Parse_Success_Explanation_Label
     (Text : String)
      return Parse_Success_Explanation
   is
      Item : constant String := Trim (Text);
      Prefix : constant String := "parse success ";
      Input_Prefix : constant String := ": input=""";
      Norm_Prefix  : constant String := """ normalized=""";
      Consumed_Prefix : constant String := """ consumed=";
      Result : Parse_Success_Explanation;
      Family_End : Natural;
      Input_Start : Natural;
      Input_End : Natural;
      Norm_Start : Natural;
      Norm_End : Natural;
      Exact_Pos : Natural;
   begin
      if not Starts_With (Item, Prefix) then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      Family_End := Find_Substring (Item, Input_Prefix);
      if Family_End = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      declare
         Family_Text : constant String :=
           Item (Item'First + Prefix'Length .. Family_End - 1);
      begin
         if not Match_Parse_Value_Family (Family_Text, Result.Family) then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
      end;

      Input_Start := Family_End + Input_Prefix'Length;
      Norm_Start := Find_Substring (Item, Norm_Prefix);
      if Norm_Start = 0 or else Norm_Start <= Input_Start then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Input_End := Norm_Start - 1;
      Norm_Start := Norm_Start + Norm_Prefix'Length;
      Norm_End := Find_Substring (Item, Consumed_Prefix);
      if Norm_End = 0 or else Norm_End <= Norm_Start then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Exact_Pos := Find_Substring (Item, " exact=");
      if Exact_Pos = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      Result.Input_First := Input_Start;
      Result.Input_Length := Input_End - Input_Start + 1;
      Result.Normalized_First := Norm_Start;
      Result.Normalized_Length := Norm_End - Norm_Start;
      Result.Consumed := Natural_Field (Item, "consumed=");
      Result.Exact := Ends_With (Item, "exact=yes");
      return Result;
   end Parse_Success_Explanation_Label;

   function Byte_Parse_Success_Label
     (Input  : String;
      Result : Byte_Parse_Result)
      return Humanize.Status.Text_Result
   is
   begin
      if Result.Status /= Humanize.Status.Ok then
         return Status_Text
           (Result.Status, "byte parse did not succeed");
      end if;
      return Parse_Success_Explanation_Label
        (Parsed_Bytes, Input,
         No_Space (Humanize.Bytes.Byte_Count'Image (Result.Value)) & " bytes",
         Result.Consumed, Result.Exact);
   end Byte_Parse_Success_Label;

   function Duration_Parse_Success_Label
     (Input  : String;
      Result : Duration_Parse_Result)
      return Humanize.Status.Text_Result
   is
   begin
      if Result.Status /= Humanize.Status.Ok then
         return Status_Text
           (Result.Status, "duration parse did not succeed");
      end if;
      return Parse_Success_Explanation_Label
        (Parsed_Duration, Input,
         Integer_Text (Long_Long_Integer (Result.Value))
         & " seconds",
         Result.Consumed, Result.Exact);
   end Duration_Parse_Success_Label;

   function Number_Parse_Success_Label
     (Input  : String;
      Result : Number_Parse_Result)
      return Humanize.Status.Text_Result
   is
   begin
      if Result.Status /= Humanize.Status.Ok then
         return Status_Text
           (Result.Status, "number parse did not succeed");
      end if;
      return Parse_Success_Explanation_Label
        (Parsed_Number, Input,
         Integer_Text (Result.Value),
         Result.Consumed, Result.Exact);
   end Number_Parse_Success_Label;

   function Unit_Parse_Success_Label
     (Input  : String;
      Result : Unit_Parse_Result)
      return Humanize.Status.Text_Result
   is
   begin
      if Result.Status /= Humanize.Status.Ok then
         return Status_Text
           (Result.Status, "unit parse did not succeed");
      end if;
      return Parse_Success_Explanation_Label
        (Parsed_Unit, Input,
         Humanize.Bounded_Text.Float_Image (Result.Value)
         & " " & Humanize.Units.Unit_Kind'Image (Result.Unit),
         Result.Consumed, Result.Exact);
   end Unit_Parse_Success_Label;

   function Scheduling_Parse_Success_Label
     (Input  : String;
      Result : Scheduling_Phrase_Result)
      return Humanize.Status.Text_Result
   is
   begin
      if Result.Status /= Humanize.Status.Ok then
         return Status_Text
           (Result.Status, "scheduling parse did not succeed");
      end if;
      return Parse_Success_Explanation_Label
        (Parsed_Recurrence, Input,
         (case Result.Kind is
             when No_Scheduling_Phrase => "no scheduling phrase",
             when Relative_Offset_Phrase => "relative offset",
             when Date_Time_Phrase => "date-time",
             when Business_Day_Phrase => "business day",
             when Period_Boundary_Phrase => "period boundary",
             when Recurrence_Phrase => "recurrence",
             when Ambiguous_Scheduling_Phrase => "ambiguous scheduling"),
         Result.Consumed, Exact => not Result.Ambiguous);
   end Scheduling_Parse_Success_Label;

   function Scan_Success_Explanation_Label
     (Text : String)
      return Parse_Success_Explanation
   is
      Last : Natural := Text'Last;
   begin
      for Index in Text'Range loop
         if Text (Index) = ASCII.LF then
            Last := Index - 1;
            exit;
         end if;
      end loop;
      if Text'Length = 0 or else Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      else
         return Parse_Success_Explanation_Label (Text (Text'First .. Last));
      end if;
   end Scan_Success_Explanation_Label;

   procedure Scheduling_Phrase_Label_Into
     (Result  : Scheduling_Phrase_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Label : constant Humanize.Status.Text_Result :=
        Scheduling_Phrase_Label (Result);
   begin
      Copy_Text (Label, Target, Written, Status);
   end Scheduling_Phrase_Label_Into;

   procedure Parse_Success_Explanation_Label_Into
     (Family     : Parse_Value_Family;
      Input      : String;
      Normalized : String;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Consumed   : Natural := 0;
      Exact      : Boolean := True)
   is
      Label : constant Humanize.Status.Text_Result :=
        Parse_Success_Explanation_Label
          (Family, Input, Normalized, Consumed, Exact);
   begin
      Copy_Text (Label, Target, Written, Status);
   end Parse_Success_Explanation_Label_Into;
end Humanize.Parsing.Success_Labels;
