with Humanize.Bounded_Text;

package body Humanize.Badges is
   use type Humanize.Status.Status_Code;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

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

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Domain_Options
     (Options : Badge_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Badge_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Badge_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Badge_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Badge_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Tone_Text (Tone : Badge_Tone) return String is
   begin
      case Tone is
         when Neutral_Tone => return "neutral";
         when Info_Tone    => return "info";
         when Success_Tone => return "success";
         when Warning_Tone => return "warning";
         when Danger_Tone  => return "danger";
         when Muted_Tone   => return "muted";
      end case;
   end Tone_Text;

   function State_Text (State : Badge_State) return String is
   begin
      case State is
         when Default_Badge     => return "default";
         when New_Badge         => return "new";
         when Updated_Badge     => return "updated";
         when Deprecated_Badge  => return "deprecated";
         when Selected_Badge    => return "selected";
         when Disabled_Badge    => return "disabled";
         when Dismissible_Badge => return "dismissible";
      end case;
   end State_Text;

   function Priority_Text (Priority : Badge_Priority) return String is
   begin
      case Priority is
         when Low_Priority      => return "low priority";
         when Medium_Priority   => return "medium priority";
         when High_Priority     => return "high priority";
         when Critical_Priority => return "critical priority";
      end case;
   end Priority_Text;

   function Tone_Suffix (Tone : Badge_Tone) return String is
   begin
      return Tone_Text (Tone);
   end Tone_Suffix;

   function State_Suffix (State : Badge_State) return String is
   begin
      return State_Text (State);
   end State_Suffix;

   function Priority_Suffix (Priority : Badge_Priority) return String is
   begin
      return Priority_Text (Priority);
   end Priority_Suffix;

   function Badge_Suffix
     (Tone  : Badge_Tone;
      State : Badge_State)
      return String
   is
   begin
      if State = Default_Badge then
         return Tone_Suffix (Tone) & " badge";
      else
         return Tone_Suffix (Tone) & " " & State_Suffix (State) & " badge";
      end if;
   end Badge_Suffix;

   function Status_Badge_Suffix (Tone : Badge_Tone) return String is
   begin
      return "status, " & Tone_Suffix (Tone);
   end Status_Badge_Suffix;

   function Badge_Tone_Metadata
     (Tone : Badge_Tone)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Badges_Surface, Tone_Suffix (Tone));
   end Badge_Tone_Metadata;

   function Badge_State_Metadata
     (State : Badge_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Badges_Surface, State_Suffix (State));
   end Badge_State_Metadata;

   function Badge_Priority_Metadata
     (Priority : Badge_Priority)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Badges_Surface, Priority_Suffix (Priority));
   end Badge_Priority_Metadata;

   function Badge_Tone_Label
     (Tone : Badge_Tone)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Tone_Suffix (Tone) & " badge");
   end Badge_Tone_Label;

   function Badge_State_Label
     (State : Badge_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (State_Suffix (State) & " badge");
   end Badge_State_Label;

   function Badge_Priority_Label
     (Priority : Badge_Priority)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Priority_Suffix (Priority) & " badge");
   end Badge_Priority_Label;

   function Badge_Label
     (Name  : String;
      Tone  : Badge_Tone := Neutral_Tone;
      State : Badge_State := Default_Badge)
      return Humanize.Status.Text_Result
   is
      Text : constant String := Clean (Name);
   begin
      if Text'Length = 0 then
         return Invalid_Text ("invalid badge label");
      else
         return Ok_Text (Text & " " & Badge_Suffix (Tone, State));
      end if;
   end Badge_Label;

   function Badge_Label
     (Name    : String;
      Tone    : Badge_Tone;
      State   : Badge_State;
      Options : Badge_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Badge_Label (Name, Tone, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base,
         Humanize.Domain_Details.State_Metadata
           (Humanize.Domain_Details.Badges_Surface, Badge_Suffix (Tone, State)),
         Domain_Options (Options));
   end Badge_Label;

   function Parse_Badge_Label
     (Text  : String;
      Tone  : Badge_Tone;
      State : Badge_State := Default_Badge)
      return Badge_Label_Parse_Result
   is
      Result : Badge_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Badges_Surface,
         Badge_Suffix (Tone, State));
      Result.Metadata := Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Badges_Surface, Badge_Suffix (Tone, State));
      return Result;
   end Parse_Badge_Label;

   function Scan_Badge_Label
     (Text  : String;
      Tone  : Badge_Tone;
      State : Badge_State := Default_Badge)
      return Badge_Label_Parse_Result
   is
      Result : Badge_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Badges_Surface,
         Badge_Suffix (Tone, State));
      Result.Metadata := Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Badges_Surface, Badge_Suffix (Tone, State));
      return Result;
   end Scan_Badge_Label;

   function Count_Badge_Label
     (Name  : String;
      Count : Natural)
      return Humanize.Status.Text_Result
   is
      Text : constant String := Clean (Name);
   begin
      if Text'Length = 0 then
         return Invalid_Text ("invalid badge label");
      else
         return Ok_Text (Count_Or_No_Text (Count, Text, Text & "s"));
      end if;
   end Count_Badge_Label;

   function Status_Badge_Label
     (Name : String;
      Tone : Badge_Tone)
      return Humanize.Status.Text_Result
   is
      Text : constant String := Clean (Name);
   begin
      if Text'Length = 0 then
         return Invalid_Text ("invalid status badge");
      else
         return Ok_Text (Text & " " & Status_Badge_Suffix (Tone));
      end if;
   end Status_Badge_Label;

   function Status_Badge_Label
     (Name    : String;
      Tone    : Badge_Tone;
      Options : Badge_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Status_Badge_Label (Name, Tone);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Badge_Tone_Metadata (Tone), Domain_Options (Options));
   end Status_Badge_Label;

   function Parse_Status_Badge_Label
     (Text : String;
      Tone : Badge_Tone)
      return Badge_Label_Parse_Result
   is
      Result : Badge_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Badges_Surface,
         Status_Badge_Suffix (Tone));
      Result.Metadata := Badge_Tone_Metadata (Tone);
      return Result;
   end Parse_Status_Badge_Label;

   function Scan_Status_Badge_Label
     (Text : String;
      Tone : Badge_Tone)
      return Badge_Label_Parse_Result
   is
      Result : Badge_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Badges_Surface,
         Status_Badge_Suffix (Tone));
      Result.Metadata := Badge_Tone_Metadata (Tone);
      return Result;
   end Scan_Status_Badge_Label;

   function Tag_Label
     (Name : String)
      return Humanize.Status.Text_Result
   is
      Text : constant String := Clean (Name);
   begin
      if Text'Length = 0 then
         return Invalid_Text ("invalid tag label");
      else
         return Ok_Text (Text & " tag");
      end if;
   end Tag_Label;

   function Tag_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "tag", "tags"));
   end Tag_Count_Label;

   function Chip_Label
     (Name     : String;
      Selected : Boolean := False)
      return Humanize.Status.Text_Result
   is
      Text : constant String := Clean (Name);
   begin
      if Text'Length = 0 then
         return Invalid_Text ("invalid chip label");
      elsif Selected then
         return Ok_Text (Text & " chip selected");
      else
         return Ok_Text (Text & " chip");
      end if;
   end Chip_Label;

   function Dismiss_Label
     (Name : String)
      return Humanize.Status.Text_Result
   is
      Text : constant String := Clean (Name);
   begin
      if Text'Length = 0 then
         return Invalid_Text ("invalid dismiss label");
      else
         return Ok_Text ("dismiss " & Text);
      end if;
   end Dismiss_Label;

   function New_Label
     (Name : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Badge_Label (Name, Info_Tone, New_Badge);
   end New_Label;

   function Updated_Label
     (Name : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Badge_Label (Name, Success_Tone, Updated_Badge);
   end Updated_Label;

   function Deprecated_Label
     (Name : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Badge_Label (Name, Warning_Tone, Deprecated_Badge);
   end Deprecated_Label;

   function Overflow_Badge_Label
     (Hidden_Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Hidden_Count = 0 then
         return Ok_Text ("no hidden badges");
      else
         return Ok_Text
           ("+" & Image (Hidden_Count) & " more "
            & (if Hidden_Count = 1 then "badge" else "badges"));
      end if;
   end Overflow_Badge_Label;

   function Priority_Badge_Label
     (Priority : Badge_Priority;
      Name     : String := "")
      return Humanize.Status.Text_Result
   is
      Text : constant String := Clean (Name);
   begin
      if Text'Length = 0 then
         return Ok_Text (Priority_Suffix (Priority) & " badge");
      else
         return Ok_Text (Text & " " & Priority_Suffix (Priority) & " badge");
      end if;
   end Priority_Badge_Label;

   procedure Badge_Tone_Label_Into
     (Tone    : Badge_Tone;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Badge_Tone_Label (Tone), Target, Written, Status);
   end Badge_Tone_Label_Into;

   procedure Badge_State_Label_Into
     (State   : Badge_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Badge_State_Label (State), Target, Written, Status);
   end Badge_State_Label_Into;

   procedure Badge_Priority_Label_Into
     (Priority : Badge_Priority;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Badge_Priority_Label (Priority), Target, Written, Status);
   end Badge_Priority_Label_Into;

   procedure Badge_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Tone    : Badge_Tone := Neutral_Tone;
      State   : Badge_State := Default_Badge)
   is
   begin
      Copy_Result (Badge_Label (Name, Tone, State), Target, Written, Status);
   end Badge_Label_Into;

   procedure Badge_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Tone    : Badge_Tone;
      State   : Badge_State;
      Options : Badge_Label_Options)
   is
   begin
      Copy_Result
        (Badge_Label (Name, Tone, State, Options), Target, Written, Status);
   end Badge_Label_Into;

   procedure Count_Badge_Label_Into
     (Name    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Count_Badge_Label (Name, Count), Target, Written, Status);
   end Count_Badge_Label_Into;

   procedure Status_Badge_Label_Into
     (Name    : String;
      Tone    : Badge_Tone;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Status_Badge_Label (Name, Tone), Target, Written, Status);
   end Status_Badge_Label_Into;

   procedure Status_Badge_Label_Into
     (Name    : String;
      Tone    : Badge_Tone;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Badge_Label_Options)
   is
   begin
      Copy_Result
        (Status_Badge_Label (Name, Tone, Options), Target, Written, Status);
   end Status_Badge_Label_Into;

   procedure Tag_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Tag_Label (Name), Target, Written, Status);
   end Tag_Label_Into;

   procedure Tag_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Tag_Count_Label (Count), Target, Written, Status);
   end Tag_Count_Label_Into;

   procedure Chip_Label_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Selected : Boolean := False)
   is
   begin
      Copy_Result (Chip_Label (Name, Selected), Target, Written, Status);
   end Chip_Label_Into;

   procedure Dismiss_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Dismiss_Label (Name), Target, Written, Status);
   end Dismiss_Label_Into;

   procedure New_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (New_Label (Name), Target, Written, Status);
   end New_Label_Into;

   procedure Updated_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Updated_Label (Name), Target, Written, Status);
   end Updated_Label_Into;

   procedure Deprecated_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Deprecated_Label (Name), Target, Written, Status);
   end Deprecated_Label_Into;

   procedure Overflow_Badge_Label_Into
     (Hidden_Count : Natural;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Overflow_Badge_Label (Hidden_Count), Target, Written, Status);
   end Overflow_Badge_Label_Into;

   procedure Priority_Badge_Label_Into
     (Priority : Badge_Priority;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Name     : String := "")
   is
   begin
      Copy_Result (Priority_Badge_Label (Priority, Name), Target, Written, Status);
   end Priority_Badge_Label_Into;

end Humanize.Badges;
