with Humanize.Bounded_Text;

package body Humanize.Attachments is
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
     (Options : Attachment_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Attachment_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Attachment_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Attachment_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Attachment_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function State_Text (State : Attachment_State) return String is
   begin
      case State is
         when Pending_Attachment   => return "pending";
         when Uploading_Attachment => return "uploading";
         when Uploaded_Attachment  => return "uploaded";
         when Failed_Attachment    => return "failed";
         when Removed_Attachment   => return "removed";
         when Blocked_Attachment   => return "blocked";
      end case;
   end State_Text;

   function Kind_Text (Kind : Attachment_Kind) return String is
   begin
      case Kind is
         when File_Attachment     => return "file";
         when Image_Attachment    => return "image";
         when Video_Attachment    => return "video";
         when Audio_Attachment    => return "audio";
         when Document_Attachment => return "document";
         when Archive_Attachment  => return "archive";
         when Link_Attachment     => return "link";
      end case;
   end Kind_Text;

   function Scan_Text (State : Scan_State) return String is
   begin
      case State is
         when Not_Scanned => return "not scanned";
         when Scanning    => return "scanning";
         when Safe        => return "safe";
         when Suspicious  => return "suspicious";
         when Infected    => return "infected";
      end case;
   end Scan_Text;

   function Attachment_State_Suffix
     (State : Attachment_State)
      return String
   is
   begin
      return State_Text (State);
   end Attachment_State_Suffix;

   function Attachment_Kind_Suffix
     (Kind : Attachment_Kind)
      return String
   is
   begin
      return Kind_Text (Kind);
   end Attachment_Kind_Suffix;

   function Attachment_Label_Suffix
     (Kind  : Attachment_Kind;
      State : Attachment_State)
      return String
   is
   begin
      return Attachment_Kind_Suffix (Kind) & " " & Attachment_State_Suffix (State);
   end Attachment_Label_Suffix;

   function Scan_State_Suffix
     (State : Scan_State)
      return String
   is
   begin
      return Scan_Text (State);
   end Scan_State_Suffix;

   function Scan_Result_Suffix
     (State : Scan_State)
      return String
   is
   begin
      return "scan " & Scan_State_Suffix (State);
   end Scan_Result_Suffix;

   function Attachment_State_Metadata
     (State : Attachment_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Attachments_Surface,
         Attachment_State_Suffix (State));
   end Attachment_State_Metadata;

   function Scan_State_Metadata
     (State : Scan_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Attachments_Surface, Scan_State_Suffix (State));
   end Scan_State_Metadata;

   function Attachment_State_Label
     (State : Attachment_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Attachment_State_Suffix (State) & " attachment");
   end Attachment_State_Label;

   function Attachment_Kind_Label
     (Kind : Attachment_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Attachment_Kind_Suffix (Kind) & " attachment");
   end Attachment_Kind_Label;

   function Scan_State_Label
     (State : Scan_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Scan_Result_Suffix (State));
   end Scan_State_Label;

   function Attachment_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "attachment", "attachments"));
   end Attachment_Count_Label;

   function Attachment_Label
     (Name  : String;
      Kind  : Attachment_Kind := File_Attachment;
      State : Attachment_State := Uploaded_Attachment)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid attachment name");
      else
         return Ok_Text (Label & " " & Attachment_Label_Suffix (Kind, State));
      end if;
   end Attachment_Label;

   function Attachment_Label
     (Name    : String;
      Kind    : Attachment_Kind;
      State   : Attachment_State;
      Options : Attachment_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Attachment_Label (Name, Kind, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Attachment_State_Metadata (State), Domain_Options (Options));
   end Attachment_Label;

   function Parse_Attachment_Label
     (Text  : String;
      Kind  : Attachment_Kind;
      State : Attachment_State)
      return Attachment_Label_Parse_Result
   is
      Result : Attachment_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Attachments_Surface,
         Attachment_Label_Suffix (Kind, State));
      Result.Metadata := Attachment_State_Metadata (State);
      return Result;
   end Parse_Attachment_Label;

   function Scan_Attachment_Label
     (Text  : String;
      Kind  : Attachment_Kind;
      State : Attachment_State)
      return Attachment_Label_Parse_Result
   is
      Result : Attachment_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Attachments_Surface,
         Attachment_Label_Suffix (Kind, State));
      Result.Metadata := Attachment_State_Metadata (State);
      return Result;
   end Scan_Attachment_Label;

   function Upload_Progress_Label
     (Done  : Natural;
      Total : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Done > Total then
         return Invalid_Text ("invalid upload progress");
      elsif Total = 0 then
         return Ok_Text ("no uploads");
      else
         return Ok_Text
           (Image (Done) & " of " & Count_Text (Total, "upload", "uploads")
            & " complete");
      end if;
   end Upload_Progress_Label;

   function Attachment_Size_Label
     (Name : String;
      Size : String)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
      Bytes : constant String := Clean (Size);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid attachment name");
      elsif Bytes'Length = 0 then
         return Invalid_Text ("invalid attachment size");
      else
         return Ok_Text (Label & ", " & Bytes);
      end if;
   end Attachment_Size_Label;

   function Preview_Label
     (Name : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Ok_Text ("preview attachment");
      else
         return Ok_Text ("preview " & Label);
      end if;
   end Preview_Label;

   function Download_Label
     (Name : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Ok_Text ("download attachment");
      else
         return Ok_Text ("download " & Label);
      end if;
   end Download_Label;

   function Remove_Label
     (Name : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Ok_Text ("remove attachment");
      else
         return Ok_Text ("remove " & Label);
      end if;
   end Remove_Label;

   function Scan_Result_Label
     (Name  : String;
      State : Scan_State)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid attachment name");
      else
         return Ok_Text (Label & " " & Scan_Result_Suffix (State));
      end if;
   end Scan_Result_Label;

   function Scan_Result_Label
     (Name    : String;
      State   : Scan_State;
      Options : Attachment_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Scan_Result_Label (Name, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Scan_State_Metadata (State), Domain_Options (Options));
   end Scan_Result_Label;

   function Parse_Scan_Result_Label
     (Text  : String;
      State : Scan_State)
      return Attachment_Label_Parse_Result
   is
      Result : Attachment_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Attachments_Surface,
         Scan_Result_Suffix (State));
      Result.Metadata := Scan_State_Metadata (State);
      return Result;
   end Parse_Scan_Result_Label;

   function Scan_Scan_Result_Label
     (Text  : String;
      State : Scan_State)
      return Attachment_Label_Parse_Result
   is
      Result : Attachment_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Attachments_Surface,
         Scan_Result_Suffix (State));
      Result.Metadata := Scan_State_Metadata (State);
      return Result;
   end Scan_Scan_Result_Label;

   function Upload_Error_Label
     (Name   : String;
      Reason : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
      Why   : constant String := Clean (Reason);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid attachment name");
      elsif Why'Length = 0 then
         return Ok_Text (Label & " upload failed");
      else
         return Ok_Text (Label & " upload failed: " & Why);
      end if;
   end Upload_Error_Label;

   function Attachment_Group_Label
     (Name  : String;
      Count : Natural)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid attachment group");
      else
         return Ok_Text
           (Label & ": " & Count_Text (Count, "attachment", "attachments"));
      end if;
   end Attachment_Group_Label;

   function Image_Dimensions_Label
     (Name       : String;
      Dimensions : String)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
      Size  : constant String := Clean (Dimensions);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid attachment name");
      elsif Size'Length = 0 then
         return Invalid_Text ("invalid image dimensions");
      else
         return Ok_Text (Label & ", " & Size);
      end if;
   end Image_Dimensions_Label;

   function Expiring_Link_Label
     (Name      : String;
      Time_Text : String)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
      Time  : constant String := Clean (Time_Text);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid attachment name");
      elsif Time'Length = 0 then
         return Invalid_Text ("invalid expiry label");
      else
         return Ok_Text (Label & " link expires " & Time);
      end if;
   end Expiring_Link_Label;

   procedure Attachment_State_Label_Into
     (State   : Attachment_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Attachment_State_Label (State), Target, Written, Status);
   end Attachment_State_Label_Into;

   procedure Attachment_Kind_Label_Into
     (Kind    : Attachment_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Attachment_Kind_Label (Kind), Target, Written, Status);
   end Attachment_Kind_Label_Into;

   procedure Scan_State_Label_Into
     (State   : Scan_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Scan_State_Label (State), Target, Written, Status);
   end Scan_State_Label_Into;

   procedure Attachment_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Attachment_Count_Label (Count), Target, Written, Status);
   end Attachment_Count_Label_Into;

   procedure Attachment_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : Attachment_Kind := File_Attachment;
      State   : Attachment_State := Uploaded_Attachment)
   is
   begin
      Copy_Result (Attachment_Label (Name, Kind, State), Target, Written, Status);
   end Attachment_Label_Into;

   procedure Attachment_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Kind    : Attachment_Kind;
      State   : Attachment_State;
      Options : Attachment_Label_Options)
   is
   begin
      Copy_Result
        (Attachment_Label (Name, Kind, State, Options),
         Target, Written, Status);
   end Attachment_Label_Into;

   procedure Upload_Progress_Label_Into
     (Done    : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Upload_Progress_Label (Done, Total), Target, Written, Status);
   end Upload_Progress_Label_Into;

   procedure Attachment_Size_Label_Into
     (Name    : String;
      Size    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Attachment_Size_Label (Name, Size), Target, Written, Status);
   end Attachment_Size_Label_Into;

   procedure Preview_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
   begin
      Copy_Result (Preview_Label (Name), Target, Written, Status);
   end Preview_Label_Into;

   procedure Download_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
   begin
      Copy_Result (Download_Label (Name), Target, Written, Status);
   end Download_Label_Into;

   procedure Remove_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Name    : String := "")
   is
   begin
      Copy_Result (Remove_Label (Name), Target, Written, Status);
   end Remove_Label_Into;

   procedure Scan_Result_Label_Into
     (Name    : String;
      State   : Scan_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Scan_Result_Label (Name, State), Target, Written, Status);
   end Scan_Result_Label_Into;

   procedure Scan_Result_Label_Into
     (Name    : String;
      State   : Scan_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Attachment_Label_Options)
   is
   begin
      Copy_Result
        (Scan_Result_Label (Name, State, Options), Target, Written, Status);
   end Scan_Result_Label_Into;

   procedure Upload_Error_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Reason  : String := "")
   is
   begin
      Copy_Result (Upload_Error_Label (Name, Reason), Target, Written, Status);
   end Upload_Error_Label_Into;

   procedure Attachment_Group_Label_Into
     (Name    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Attachment_Group_Label (Name, Count), Target, Written, Status);
   end Attachment_Group_Label_Into;

   procedure Image_Dimensions_Label_Into
     (Name       : String;
      Dimensions : String;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Image_Dimensions_Label (Name, Dimensions), Target, Written, Status);
   end Image_Dimensions_Label_Into;

   procedure Expiring_Link_Label_Into
     (Name      : String;
      Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Expiring_Link_Label (Name, Time_Text), Target, Written, Status);
   end Expiring_Link_Label_Into;

end Humanize.Attachments;
