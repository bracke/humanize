with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.Forms is
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

   function Image (Value : Natural) return String
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

   procedure Append_Part
     (Text : in out Unbounded_String;
      Part : String)
   is
   begin
      if Length (Text) > 0 then
         Append (Text, ", ");
      end if;
      Append (Text, Part);
   end Append_Part;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Domain_Options
     (Options : Form_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Form_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Form_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Form_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Form_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Form_State_Text (State : Form_State) return String is
   begin
      case State is
         when Pristine_Form  => return "not started";
         when Editing_Form   => return "editing";
         when Dirty_Form     => return "unsaved changes";
         when Saving_Form    => return "saving";
         when Saved_Form     => return "saved";
         when Submitted_Form => return "submitted";
         when Failed_Form    => return "submission failed";
      end case;
   end Form_State_Text;

   function Input_State_Text (State : Input_State) return String is
   begin
      case State is
         when Valid_Input     => return "valid";
         when Invalid_Input   => return "invalid";
         when Required_Input  => return "required";
         when Optional_Input  => return "optional";
         when Disabled_Input  => return "disabled";
         when Read_Only_Input => return "read-only";
      end case;
   end Input_State_Text;

   function Form_State_Suffix (State : Form_State) return String is
   begin
      return Form_State_Text (State);
   end Form_State_Suffix;

   function Input_State_Suffix (State : Input_State) return String is
   begin
      return Input_State_Text (State);
   end Input_State_Suffix;

   function Field_Suffix (Required : Boolean) return String is
   begin
      if Required then
         return "required field";
      else
         return "optional field";
      end if;
   end Field_Suffix;

   function Field_Metadata
     (Required : Boolean)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Forms_Surface, Field_Suffix (Required));
   end Field_Metadata;

   function Submission_Text
     (State  : Form_State;
      Errors : Natural)
      return String
   is
   begin
      if State = Failed_Form and then Errors > 0 then
         return "submission failed with " & Count_Text (Errors, "error", "errors");
      elsif State = Submitted_Form then
         return "form submitted";
      elsif State = Saved_Form then
         return "form saved";
      elsif State = Saving_Form then
         return "saving form";
      else
         return Form_State_Suffix (State);
      end if;
   end Submission_Text;

   function Submission_Suffix
     (State  : Form_State;
      Errors : Natural)
      return String
   is
   begin
      return Submission_Text (State, Errors);
   end Submission_Suffix;

   function Form_State_Metadata
     (State : Form_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Forms_Surface, Form_State_Suffix (State));
   end Form_State_Metadata;

   function Input_State_Metadata
     (State : Input_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Forms_Surface, Input_State_Suffix (State));
   end Input_State_Metadata;

   function Submission_Metadata
     (State  : Form_State;
      Errors : Natural)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Forms_Surface, Submission_Suffix (State, Errors));
   end Submission_Metadata;

   function Form_State_Label
     (State : Form_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Form_State_Suffix (State));
   end Form_State_Label;

   function Input_State_Label
     (State : Input_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Input_State_Suffix (State) & " input");
   end Input_State_Label;

   function Field_Label
     (Name     : String;
      Required : Boolean := False)
      return Humanize.Status.Text_Result
   is
      Field : constant String := Clean (Name);
   begin
      if Field'Length = 0 then
         return Invalid_Text ("invalid field name");
      elsif Required then
         return Ok_Text (Field & " required field");
      else
         return Ok_Text (Field & " optional field");
      end if;
   end Field_Label;

   function Field_Label
     (Name     : String;
      Required : Boolean;
      Options  : Form_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Field_Label (Name, Required);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Field_Metadata (Required), Domain_Options (Options));
   end Field_Label;

   function Parse_Field_Label
     (Text     : String;
      Required : Boolean)
      return Form_Label_Parse_Result
   is
      Result : Form_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Forms_Surface, Field_Suffix (Required));
      Result.Metadata := Field_Metadata (Required);
      return Result;
   end Parse_Field_Label;

   function Scan_Field_Label
     (Text     : String;
      Required : Boolean)
      return Form_Label_Parse_Result
   is
      Result : Form_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Forms_Surface, Field_Suffix (Required));
      Result.Metadata := Field_Metadata (Required);
      return Result;
   end Scan_Field_Label;

   function Field_State_Label
     (Name  : String;
      State : Input_State)
      return Humanize.Status.Text_Result
   is
      Field : constant String := Clean (Name);
   begin
      if Field'Length = 0 then
         return Invalid_Text ("invalid field name");
      else
         return Ok_Text (Field & " " & Input_State_Suffix (State));
      end if;
   end Field_State_Label;

   function Field_State_Label
     (Name    : String;
      State   : Input_State;
      Options : Form_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Field_State_Label (Name, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Input_State_Metadata (State), Domain_Options (Options));
   end Field_State_Label;

   function Parse_Field_State_Label
     (Text  : String;
      State : Input_State)
      return Form_Label_Parse_Result
   is
      Result : Form_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Forms_Surface, Input_State_Suffix (State));
      Result.Metadata := Input_State_Metadata (State);
      return Result;
   end Parse_Field_State_Label;

   function Scan_Field_State_Label
     (Text  : String;
      State : Input_State)
      return Form_Label_Parse_Result
   is
      Result : Form_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Forms_Surface, Input_State_Suffix (State));
      Result.Metadata := Input_State_Metadata (State);
      return Result;
   end Scan_Field_State_Label;

   function Character_Count_Label
     (Used : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Text (Used, "character", "characters"));
   end Character_Count_Label;

   function Character_Limit_Label
     (Limit : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Limit = 0 then
         return Ok_Text ("no character limit");
      else
         return Ok_Text (Count_Text (Limit, "character", "characters") & " maximum");
      end if;
   end Character_Limit_Label;

   function Character_Usage_Label
     (Used  : Natural;
      Limit : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Limit = 0 then
         return Ok_Text (Count_Text (Used, "character", "characters"));
      else
         return Ok_Text
           (Image (Used) & " of "
            & Count_Text (Limit, "character", "characters"));
      end if;
   end Character_Usage_Label;

   function Remaining_Characters_Label
     (Used  : Natural;
      Limit : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Limit = 0 then
         return Ok_Text ("no character limit");
      elsif Used = Limit then
         return Ok_Text ("no characters remaining");
      elsif Used < Limit then
         return Ok_Text
           (Count_Text (Limit - Used, "character", "characters") & " remaining");
      else
         return Ok_Text
           (Count_Text (Used - Limit, "character", "characters") & " over limit");
      end if;
   end Remaining_Characters_Label;

   function Required_Fields_Label
     (Missing : Natural;
      Total   : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Missing > Total then
         return Invalid_Text ("invalid required field count");
      elsif Total = 0 then
         return Ok_Text ("no required fields");
      elsif Missing = 0 then
         return Ok_Text ("all required fields complete");
      else
         return Ok_Text
           (Image (Missing) & " of "
            & Count_Text (Total, "required field", "required fields")
            & " missing");
      end if;
   end Required_Fields_Label;

   function Form_Progress_Label
     (Completed : Natural;
      Total     : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Completed > Total then
         return Invalid_Text ("invalid form progress");
      elsif Total = 0 then
         return Ok_Text ("no fields");
      elsif Completed = Total then
         return Ok_Text ("all fields complete");
      else
         return Ok_Text
           (Image (Completed) & " of "
            & Count_Text (Total, "field", "fields") & " complete");
      end if;
   end Form_Progress_Label;

   function Unsaved_Changes_Label
     (Count : Natural := 0)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Count_Or_No_Text (Count, "unsaved change", "unsaved changes"));
   end Unsaved_Changes_Label;

   function Submission_Label
     (State  : Form_State;
      Errors : Natural := 0)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Submission_Suffix (State, Errors));
   end Submission_Label;

   function Submission_Label
     (State   : Form_State;
      Errors  : Natural;
      Options : Form_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Submission_Label (State, Errors);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Submission_Metadata (State, Errors), Domain_Options (Options));
   end Submission_Label;

   function Parse_Submission_Label
     (Text   : String;
      State  : Form_State;
      Errors : Natural := 0)
      return Form_Label_Parse_Result
   is
      Result : Form_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        ("form " & Text, Humanize.Domain_Details.Forms_Surface,
         Submission_Suffix (State, Errors));
      if Result.Status = Humanize.Status.Ok then
         Result.Name_First := Text'First;
         Result.Name_Length := 0;
         Result.State_First := Text'First;
         Result.Consumed := Clean (Text)'Length;
      end if;
      Result.Metadata := Submission_Metadata (State, Errors);
      return Result;
   end Parse_Submission_Label;

   function Scan_Submission_Label
     (Text   : String;
      State  : Form_State;
      Errors : Natural := 0)
      return Form_Label_Parse_Result
   is
      Result : Form_Label_Parse_Result;
   begin
      for Last in reverse Text'Range loop
         Result := Parse_Submission_Label
           (Text (Text'First .. Last), State, Errors);
         if Result.Status = Humanize.Status.Ok then
            return Result;
         end if;
      end loop;
      Result.Surface := Humanize.Domain_Details.Forms_Surface;
      Result.Metadata := Submission_Metadata (State, Errors);
      Result.Status := Humanize.Status.Invalid_Argument;
      Result.Consumed := 0;
      return Result;
   end Scan_Submission_Label;

   function Section_Progress_Label
     (Name      : String;
      Completed : Natural;
      Total     : Natural)
      return Humanize.Status.Text_Result
   is
      Section  : constant String := Clean (Name);
      Progress : Humanize.Status.Text_Result;
   begin
      if Section'Length = 0 then
         return Invalid_Text ("invalid section name");
      end if;

      Progress := Form_Progress_Label (Completed, Total);
      if Progress.Status /= Humanize.Status.Ok then
         return Progress;
      end if;
      return Ok_Text (Section & ": " & Result_Text (Progress));
   end Section_Progress_Label;

   function Form_Step_Label
     (Current : Natural;
      Total   : Natural;
      Name    : String := "")
      return Humanize.Status.Text_Result
   is
      Step_Name : constant String := Clean (Name);
   begin
      if Total = 0 then
         return Ok_Text ("no form steps");
      elsif Current = 0 or else Current > Total then
         return Invalid_Text ("invalid form step");
      elsif Step_Name'Length > 0 then
         return Ok_Text
           ("step " & Image (Current) & " of " & Image (Total)
            & ": " & Step_Name);
      else
         return Ok_Text ("step " & Image (Current) & " of " & Image (Total));
      end if;
   end Form_Step_Label;

   function Form_Error_Summary_Label
     (Errors   : Natural := 0;
      Warnings : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Text : Unbounded_String;
   begin
      if Errors = 0 and then Warnings = 0 then
         return Ok_Text ("no form issues");
      end if;
      if Errors > 0 then
         Append_Part (Text, Count_Text (Errors, "error", "errors"));
      end if;
      if Warnings > 0 then
         Append_Part (Text, Count_Text (Warnings, "warning", "warnings"));
      end if;
      return Ok_Text (To_String (Text));
   end Form_Error_Summary_Label;

   procedure Form_State_Label_Into
     (State   : Form_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Form_State_Label (State), Target, Written, Status);
   end Form_State_Label_Into;

   procedure Input_State_Label_Into
     (State   : Input_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Input_State_Label (State), Target, Written, Status);
   end Input_State_Label_Into;

   procedure Field_Label_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Required : Boolean := False)
   is
   begin
      Copy_Result (Field_Label (Name, Required), Target, Written, Status);
   end Field_Label_Into;

   procedure Field_Label_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Required : Boolean;
      Options  : Form_Label_Options)
   is
   begin
      Copy_Result
        (Field_Label (Name, Required, Options), Target, Written, Status);
   end Field_Label_Into;

   procedure Field_State_Label_Into
     (Name    : String;
      State   : Input_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Field_State_Label (Name, State), Target, Written, Status);
   end Field_State_Label_Into;

   procedure Field_State_Label_Into
     (Name    : String;
      State   : Input_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Form_Label_Options)
   is
   begin
      Copy_Result
        (Field_State_Label (Name, State, Options), Target, Written, Status);
   end Field_State_Label_Into;

   procedure Character_Count_Label_Into
     (Used    : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Character_Count_Label (Used), Target, Written, Status);
   end Character_Count_Label_Into;

   procedure Character_Limit_Label_Into
     (Limit   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Character_Limit_Label (Limit), Target, Written, Status);
   end Character_Limit_Label_Into;

   procedure Character_Usage_Label_Into
     (Used    : Natural;
      Limit   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Character_Usage_Label (Used, Limit), Target, Written, Status);
   end Character_Usage_Label_Into;

   procedure Remaining_Characters_Label_Into
     (Used    : Natural;
      Limit   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Remaining_Characters_Label (Used, Limit), Target, Written, Status);
   end Remaining_Characters_Label_Into;

   procedure Required_Fields_Label_Into
     (Missing : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Required_Fields_Label (Missing, Total), Target, Written, Status);
   end Required_Fields_Label_Into;

   procedure Form_Progress_Label_Into
     (Completed : Natural;
      Total     : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Form_Progress_Label (Completed, Total), Target, Written, Status);
   end Form_Progress_Label_Into;

   procedure Unsaved_Changes_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Count   : Natural := 0)
   is
   begin
      Copy_Result (Unsaved_Changes_Label (Count), Target, Written, Status);
   end Unsaved_Changes_Label_Into;

   procedure Submission_Label_Into
     (State   : Form_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Errors  : Natural := 0)
   is
   begin
      Copy_Result (Submission_Label (State, Errors), Target, Written, Status);
   end Submission_Label_Into;

   procedure Submission_Label_Into
     (State   : Form_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Errors  : Natural;
      Options : Form_Label_Options)
   is
   begin
      Copy_Result
        (Submission_Label (State, Errors, Options), Target, Written, Status);
   end Submission_Label_Into;

   procedure Section_Progress_Label_Into
     (Name      : String;
      Completed : Natural;
      Total     : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Section_Progress_Label (Name, Completed, Total),
         Target,
         Written,
         Status);
   end Section_Progress_Label_Into;

   procedure Form_Step_Label_Into
     (Current : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
   begin
      Copy_Result (Form_Step_Label (Current, Total, Name), Target, Written, Status);
   end Form_Step_Label_Into;

   procedure Form_Error_Summary_Label_Into
     (Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Errors   : Natural := 0;
      Warnings : Natural := 0)
   is
   begin
      Copy_Result
        (Form_Error_Summary_Label (Errors, Warnings), Target, Written, Status);
   end Form_Error_Summary_Label_Into;

end Humanize.Forms;
