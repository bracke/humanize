with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.Changes is
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
     (Options : Change_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Change_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Change_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Change_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Change_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Kind_Text (Kind : Change_Kind) return String is
   begin
      case Kind is
         when Added_Change => return "added";
         when Removed_Change => return "removed";
         when Modified_Change => return "changed";
         when Renamed_Change => return "renamed";
         when Unchanged_Change => return "unchanged";
         when Metadata_Change => return "metadata changed";
         when Moved_Change => return "moved";
         when Conflict_Change => return "conflict";
         when Unknown_Change => return "unknown change";
      end case;
   end Kind_Text;

   function Change_Kind_Suffix (Kind : Change_Kind) return String is
   begin
      return Kind_Text (Kind);
   end Change_Kind_Suffix;

   function Change_Kind_Label
     (Kind : Change_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Change_Kind_Suffix (Kind));
   end Change_Kind_Label;

   function Change_Kind_Metadata
     (Kind : Change_Kind)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Changes_Surface, Change_Kind_Suffix (Kind));
   end Change_Kind_Metadata;

   function Change_Severity_Metadata
     (Severity : Change_Severity)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Changes_Surface,
         (case Severity is
            when Informational_Change => "informational change",
            when Minor_Change         => "minor change",
            when Major_Change         => "major change",
            when Breaking_Change      => "breaking change"));
   end Change_Severity_Metadata;

   function Change_Severity_Label
     (Severity : Change_Severity)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Severity is
            when Informational_Change => "informational change",
            when Minor_Change         => "minor change",
            when Major_Change         => "major change",
            when Breaking_Change      => "breaking change");
   end Change_Severity_Label;

   function Change_Set_Label
     (Added     : Natural := 0;
      Removed   : Natural := 0;
      Modified  : Natural := 0;
      Unchanged : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Text : Unbounded_String;
   begin
      if Added = 0 and then Removed = 0 and then Modified = 0 and then Unchanged = 0 then
         return Ok_Text ("no changes");
      end if;

      if Added > 0 then
         Append_Part (Text, Count_Text (Added, "added", "added"));
      end if;
      if Removed > 0 then
         Append_Part (Text, Count_Text (Removed, "removed", "removed"));
      end if;
      if Modified > 0 then
         Append_Part (Text, Count_Text (Modified, "changed", "changed"));
      end if;
      if Unchanged > 0 then
         Append_Part (Text, Count_Text (Unchanged, "unchanged", "unchanged"));
      end if;
      return Ok_Text (To_String (Text));
   end Change_Set_Label;

   function Change_Summary_Label
     (Total     : Natural;
      Added     : Natural := 0;
      Removed   : Natural := 0;
      Modified  : Natural := 0;
      Renamed   : Natural := 0;
      Unchanged : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Text : Unbounded_String :=
        To_Unbounded_String (Count_Text (Total, "item", "items"));
   begin
      if Added > 0 then
         Append_Part (Text, Count_Text (Added, "added", "added"));
      end if;
      if Removed > 0 then
         Append_Part (Text, Count_Text (Removed, "removed", "removed"));
      end if;
      if Modified > 0 then
         Append_Part (Text, Count_Text (Modified, "changed", "changed"));
      end if;
      if Renamed > 0 then
         Append_Part (Text, Count_Text (Renamed, "renamed", "renamed"));
      end if;
      if Unchanged > 0 then
         Append_Part (Text, Count_Text (Unchanged, "unchanged", "unchanged"));
      end if;
      return Ok_Text (To_String (Text));
   end Change_Summary_Label;

   function Item_Change_Label
     (Name : String;
      Kind : Change_Kind)
      return Humanize.Status.Text_Result
   is
      Item : constant String := Clean (Name);
   begin
      if Item'Length = 0 then
         return Invalid_Text ("invalid item name");
      end if;
      return Ok_Text (Item & " " & Change_Kind_Suffix (Kind));
   end Item_Change_Label;

   function Item_Change_Label
     (Name    : String;
      Kind    : Change_Kind;
      Options : Change_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Item_Change_Label (Name, Kind);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Change_Kind_Metadata (Kind), Domain_Options (Options));
   end Item_Change_Label;

   function Parse_Item_Change_Label
     (Text : String;
      Kind : Change_Kind)
      return Change_Label_Parse_Result
   is
      Result : Change_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Changes_Surface,
         Change_Kind_Suffix (Kind));
      Result.Metadata := Change_Kind_Metadata (Kind);
      return Result;
   end Parse_Item_Change_Label;

   function Scan_Item_Change_Label
     (Text : String;
      Kind : Change_Kind)
      return Change_Label_Parse_Result
   is
      Result : Change_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Changes_Surface,
         Change_Kind_Suffix (Kind));
      Result.Metadata := Change_Kind_Metadata (Kind);
      return Result;
   end Scan_Item_Change_Label;

   function Rename_Label
     (Old_Name : String;
      New_Name : String)
      return Humanize.Status.Text_Result
   is
      Old_Item : constant String := Clean (Old_Name);
      New_Item : constant String := Clean (New_Name);
   begin
      if Old_Item'Length = 0 or else New_Item'Length = 0 then
         return Invalid_Text ("invalid rename");
      end if;
      return Ok_Text ("renamed from " & Old_Item & " to " & New_Item);
   end Rename_Label;

   function Move_Label
     (Name : String;
      From : String;
      To   : String)
      return Humanize.Status.Text_Result
   is
      Item : constant String := Clean (Name);
      Old_Location : constant String := Clean (From);
      New_Location : constant String := Clean (To);
   begin
      if Item'Length = 0 or else Old_Location'Length = 0 or else New_Location'Length = 0 then
         return Invalid_Text ("invalid move");
      end if;
      return Ok_Text (Item & " moved from " & Old_Location & " to " & New_Location);
   end Move_Label;

   function Field_Change_Label
     (Field_Name : String;
      Old_Value  : String := "";
      New_Value  : String := "")
      return Humanize.Status.Text_Result
   is
      Field : constant String := Clean (Field_Name);
      Old_Text : constant String := Clean (Old_Value);
      New_Text : constant String := Clean (New_Value);
   begin
      if Field'Length = 0 then
         return Invalid_Text ("invalid field name");
      elsif Old_Text'Length > 0 and then New_Text'Length > 0 then
         return Ok_Text (Field & " changed from " & Old_Text & " to " & New_Text);
      else
         return Ok_Text (Field & " changed");
      end if;
   end Field_Change_Label;

   function Metadata_Only_Label
     (Count : Natural := 0)
      return Humanize.Status.Text_Result
   is
   begin
      if Count = 0 then
         return Ok_Text ("only metadata changed");
      else
         return Ok_Text ("only " & Count_Text (Count, "metadata field", "metadata fields") & " changed");
      end if;
   end Metadata_Only_Label;

   function No_Changes_Label
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text ("no changes");
   end No_Changes_Label;

   function Conflict_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "conflict", "conflicts"));
   end Conflict_Label;

   function Conflict_Label
     (Count   : Natural;
      Options : Change_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Conflict_Label (Count);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base,
         Humanize.Domain_Details.State_Metadata
           (Humanize.Domain_Details.Changes_Surface, Result_Text (Base)),
         Domain_Options (Options));
   end Conflict_Label;

   function Sync_Change_Label
     (Uploaded   : Natural := 0;
      Downloaded : Natural := 0;
      Deleted    : Natural := 0;
      Conflicts  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Text : Unbounded_String;
   begin
      if Uploaded = 0 and then Downloaded = 0 and then Deleted = 0 and then Conflicts = 0 then
         return Ok_Text ("no sync changes");
      end if;
      if Uploaded > 0 then
         Append_Part (Text, Count_Text (Uploaded, "uploaded", "uploaded"));
      end if;
      if Downloaded > 0 then
         Append_Part (Text, Count_Text (Downloaded, "downloaded", "downloaded"));
      end if;
      if Deleted > 0 then
         Append_Part (Text, Count_Text (Deleted, "deleted", "deleted"));
      end if;
      if Conflicts > 0 then
         Append_Part (Text, Count_Text (Conflicts, "conflict", "conflicts"));
      end if;
      return Ok_Text (To_String (Text));
   end Sync_Change_Label;

   function Net_Change_Label
     (Added   : Natural;
      Removed : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Added = Removed then
         return Ok_Text ("no net change");
      elsif Added > Removed then
         return Ok_Text
           ("net +" & Count_Text (Added - Removed, "item", "items"));
      else
         return Ok_Text
           ("net -" & Count_Text (Removed - Added, "item", "items"));
      end if;
   end Net_Change_Label;

   procedure Change_Kind_Label_Into
     (Kind    : Change_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Change_Kind_Label (Kind), Target, Written, Status);
   end Change_Kind_Label_Into;

   procedure Change_Severity_Label_Into
     (Severity : Change_Severity;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Change_Severity_Label (Severity), Target, Written, Status);
   end Change_Severity_Label_Into;

   function Patch_Size_Label
     (Lines_Added   : Natural := 0;
      Lines_Removed : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Text : Unbounded_String;
   begin
      if Lines_Added = 0 and then Lines_Removed = 0 then
         return Ok_Text ("no line changes");
      end if;
      if Lines_Added > 0 then
         Append_Part
           (Text, Count_Text (Lines_Added, "line added", "lines added"));
      end if;
      if Lines_Removed > 0 then
         Append_Part
           (Text, Count_Text (Lines_Removed, "line removed", "lines removed"));
      end if;
      return Ok_Text (To_String (Text));
   end Patch_Size_Label;

   function Review_Progress_Label
     (Reviewed : Natural;
      Total    : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Reviewed > Total then
         return Invalid_Text ("invalid review progress");
      elsif Total = 0 then
         return Ok_Text ("no changes to review");
      elsif Reviewed = Total then
         return Ok_Text ("all changes reviewed");
      else
         return Ok_Text
           (Image (Reviewed) & " of " & Image (Total) & " changes reviewed");
      end if;
   end Review_Progress_Label;

   function Float_Text (Value : Long_Float) return String is
     (Humanize.Bounded_Text.Float_Image (Value));

   function Value_With_Unit (Value : Long_Float; Unit : String) return String is
      Clean_Unit : constant String := Clean (Unit);
   begin
      if Clean_Unit'Length = 0 then
         return Float_Text (Value);
      else
         return Float_Text (Value) & " " & Clean_Unit;
      end if;
   end Value_With_Unit;

   function Numeric_Field_Change_Label
     (Field_Name : String;
      Old_Value  : Long_Float;
      New_Value  : Long_Float;
      Unit       : String := "")
      return Humanize.Status.Text_Result
   is
      Field : constant String := Clean (Field_Name);
      Verb  : constant String :=
        (if New_Value > Old_Value then "increased"
         elsif New_Value < Old_Value then "decreased"
         else "unchanged");
   begin
      if Field'Length = 0 then
         return Invalid_Text ("invalid field name");
      elsif Old_Value = New_Value then
         return Ok_Text
           (Field & " unchanged at " & Value_With_Unit (New_Value, Unit));
      else
         return Ok_Text
           (Field & " " & Verb & " from "
            & Value_With_Unit (Old_Value, Unit) & " to "
            & Value_With_Unit (New_Value, Unit));
      end if;
   end Numeric_Field_Change_Label;

   function Duration_Field_Change_Label
     (Field_Name : String;
      Old_Label  : String;
      New_Label  : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Field_Change_Label (Field_Name, Old_Label, New_Label);
   end Duration_Field_Change_Label;

   function Date_Field_Change_Label
     (Field_Name : String;
      Old_Label  : String;
      New_Label  : String;
      Earlier    : Boolean := False)
      return Humanize.Status.Text_Result
   is
      Field : constant String := Clean (Field_Name);
      Direction : constant String := (if Earlier then "moved earlier" else "moved later");
   begin
      if Field'Length = 0 then
         return Invalid_Text ("invalid field name");
      elsif Old_Label = New_Label then
         return Ok_Text (Field & " unchanged at " & Old_Label);
      else
         return Ok_Text
           (Field & " " & Direction & " from " & Old_Label
            & " to " & New_Label);
      end if;
   end Date_Field_Change_Label;

   function Boolean_Field_Change_Label
     (Field_Name : String;
      Old_Value  : Boolean;
      New_Value  : Boolean)
      return Humanize.Status.Text_Result
   is
      Field : constant String := Clean (Field_Name);
      Old_Text : constant String := (if Old_Value then "enabled" else "disabled");
      New_Text : constant String := (if New_Value then "enabled" else "disabled");
   begin
      if Field'Length = 0 then
         return Invalid_Text ("invalid field name");
      elsif Old_Value = New_Value then
         return Ok_Text (Field & " unchanged, " & New_Text);
      else
         return Ok_Text
           (Field & " changed from " & Old_Text & " to " & New_Text);
      end if;
   end Boolean_Field_Change_Label;

   function Collection_Field_Change_Label
     (Field_Name : String;
      Added      : Natural := 0;
      Removed    : Natural := 0;
      Unchanged  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Field : constant String := Clean (Field_Name);
      Parts : Unbounded_String;
   begin
      if Field'Length = 0 then
         return Invalid_Text ("invalid field name");
      elsif Added = 0 and then Removed = 0 then
         return Ok_Text (Field & " unchanged");
      else
         if Added > 0 then
            Append_Part (Parts, Count_Text (Added, "added", "added"));
         end if;
         if Removed > 0 then
            Append_Part (Parts, Count_Text (Removed, "removed", "removed"));
         end if;
         if Unchanged > 0 then
            Append_Part
              (Parts, Count_Text (Unchanged, "unchanged", "unchanged"));
         end if;
         return Ok_Text (Field & " changed: " & To_String (Parts));
      end if;
   end Collection_Field_Change_Label;

   function Find_Text (Text, Pattern : String) return Natural
      renames Humanize.Bounded_Text.Index_Text;

   function Parse_Numeric_Field_Change_Label
     (Text : String)
      return Change_Label_Parse_Result
   is
      Item : constant String := Clean (Text);
      Increased : constant Natural := Find_Text (Item, " increased ");
      Decreased : constant Natural := Find_Text (Item, " decreased ");
      Unchanged : constant Natural := Find_Text (Item, " unchanged ");
      Pos : constant Natural :=
        (if Increased /= 0 then Increased
         elsif Decreased /= 0 then Decreased
         else Unchanged);
      State_Len : constant Natural :=
        (if Increased /= 0 then 9
         elsif Decreased /= 0 then 9
         elsif Unchanged /= 0 then 9
         else 0);
      Result : Change_Label_Parse_Result;
   begin
      if Pos = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Surface => Humanize.Domain_Details.Changes_Surface,
            Metadata => Change_Kind_Metadata (Modified_Change),
            others => <>);
      end if;

      Result.Surface := Humanize.Domain_Details.Changes_Surface;
      Result.Metadata := Change_Kind_Metadata (Modified_Change);
      Result.Consumed := Item'Length;
      Result.Name_First := Item'First;
      Result.Name_Length := Pos - Item'First;
      Result.State_First := Pos + 1;
      Result.State_Length := State_Len;
      return Result;
   end Parse_Numeric_Field_Change_Label;

   function Scan_Numeric_Field_Change_Label
     (Text : String)
      return Change_Label_Parse_Result
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
            Surface => Humanize.Domain_Details.Changes_Surface,
            Metadata => Change_Kind_Metadata (Modified_Change),
            others => <>);
      end if;
      return Parse_Numeric_Field_Change_Label (Text (Text'First .. Stop));
   end Scan_Numeric_Field_Change_Label;

   procedure Numeric_Field_Change_Label_Into
     (Field_Name : String;
      Old_Value  : Long_Float;
      New_Value  : Long_Float;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Unit       : String := "")
   is
      Result : constant Humanize.Status.Text_Result :=
        Numeric_Field_Change_Label (Field_Name, Old_Value, New_Value, Unit);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Numeric_Field_Change_Label_Into;

   procedure Boolean_Field_Change_Label_Into
     (Field_Name : String;
      Old_Value  : Boolean;
      New_Value  : Boolean;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Boolean_Field_Change_Label (Field_Name, Old_Value, New_Value);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Boolean_Field_Change_Label_Into;

   procedure Change_Set_Label_Into
     (Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Added     : Natural := 0;
      Removed   : Natural := 0;
      Modified  : Natural := 0;
      Unchanged : Natural := 0)
   is
      Result : constant Humanize.Status.Text_Result :=
        Change_Set_Label (Added, Removed, Modified, Unchanged);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Change_Set_Label_Into;

   procedure Change_Summary_Label_Into
     (Total     : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Added     : Natural := 0;
      Removed   : Natural := 0;
      Modified  : Natural := 0;
      Renamed   : Natural := 0;
      Unchanged : Natural := 0)
   is
      Result : constant Humanize.Status.Text_Result :=
        Change_Summary_Label
          (Total, Added, Removed, Modified, Renamed, Unchanged);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Change_Summary_Label_Into;

   procedure Item_Change_Label_Into
     (Name    : String;
      Kind    : Change_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Item_Change_Label (Name, Kind), Target, Written, Status);
   end Item_Change_Label_Into;

   procedure Item_Change_Label_Into
     (Name    : String;
      Kind    : Change_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Change_Label_Options)
   is
   begin
      Copy_Result
        (Item_Change_Label (Name, Kind, Options), Target, Written, Status);
   end Item_Change_Label_Into;

   procedure Rename_Label_Into
     (Old_Name : String;
      New_Name : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Rename_Label (Old_Name, New_Name);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Rename_Label_Into;

   procedure Move_Label_Into
     (Name    : String;
      From    : String;
      To      : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Move_Label (Name, From, To), Target, Written, Status);
   end Move_Label_Into;

   procedure Field_Change_Label_Into
     (Field_Name : String;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Old_Value  : String := "";
      New_Value  : String := "")
   is
      Result : constant Humanize.Status.Text_Result :=
        Field_Change_Label (Field_Name, Old_Value, New_Value);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Field_Change_Label_Into;

   procedure Metadata_Only_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Count   : Natural := 0)
   is
   begin
      Copy_Result (Metadata_Only_Label (Count), Target, Written, Status);
   end Metadata_Only_Label_Into;

   procedure No_Changes_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (No_Changes_Label, Target, Written, Status);
   end No_Changes_Label_Into;

   procedure Conflict_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Conflict_Label (Count), Target, Written, Status);
   end Conflict_Label_Into;

   procedure Conflict_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Change_Label_Options)
   is
   begin
      Copy_Result
        (Conflict_Label (Count, Options), Target, Written, Status);
   end Conflict_Label_Into;

   procedure Sync_Change_Label_Into
     (Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Uploaded   : Natural := 0;
      Downloaded : Natural := 0;
      Deleted    : Natural := 0;
      Conflicts  : Natural := 0)
   is
      Result : constant Humanize.Status.Text_Result :=
        Sync_Change_Label (Uploaded, Downloaded, Deleted, Conflicts);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Sync_Change_Label_Into;

   procedure Net_Change_Label_Into
     (Added   : Natural;
      Removed : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Net_Change_Label (Added, Removed);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Net_Change_Label_Into;

   procedure Patch_Size_Label_Into
     (Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Lines_Added   : Natural := 0;
      Lines_Removed : Natural := 0)
   is
      Result : constant Humanize.Status.Text_Result :=
        Patch_Size_Label (Lines_Added, Lines_Removed);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Patch_Size_Label_Into;

   procedure Review_Progress_Label_Into
     (Reviewed : Natural;
      Total    : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Review_Progress_Label (Reviewed, Total);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Review_Progress_Label_Into;

end Humanize.Changes;
