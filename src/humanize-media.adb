with Humanize.Bounded_Text;

package body Humanize.Media is
   use type Humanize.Status.Status_Code;
   function Image (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;
   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;
   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;
   function Kind_Text (Kind : Media_Kind) return String is
   begin
      case Kind is
         when Image_Media => return "image";
         when Video_Media => return "video";
         when Audio_Media => return "audio";
         when PDF_Document => return "PDF document";
         when Text_Document => return "text document";
         when Archive_Media => return "archive";
         when Other_Media => return "media";
      end case;
   end Kind_Text;
   function State_Text (State : Media_State) return String is
   begin
      case State is
         when Ready_Media => return "ready";
         when Processing_Media => return "processing";
         when Transcoding_Media => return "transcoding";
         when Thumbnail_Missing => return "thumbnail unavailable";
         when Metadata_Missing => return "metadata missing";
         when Locked_Document => return "document locked";
         when Unavailable_Media => return "unavailable";
      end case;
   end State_Text;
   function Media_Kind_Label
     (Kind : Media_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Kind_Text (Kind));
   end Media_Kind_Label;
   function Media_State_Label
     (State : Media_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (State_Text (State));
   end Media_State_Label;
   function Domain_Options
     (Options : Media_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Media_Detailed => Humanize.Domain_Details.Detailed_Output,
              when Media_Compact => Humanize.Domain_Details.Compact_Output,
              when Media_Accessible => Humanize.Domain_Details.Accessible_Output,
              when Media_Log => Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Media_State_Suffix
     (State : Media_State)
      return String
   is
   begin
      return State_Text (State);
   end Media_State_Suffix;

   function Media_State_Metadata
     (State : Media_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Media_Surface, Media_State_Suffix (State));
   end Media_State_Metadata;

   function Media_Summary_Suffix
     (Kind  : Media_Kind;
      State : Media_State)
      return String
   is
   begin
      return Kind_Text (Kind) & " " & Media_State_Suffix (State);
   end Media_Summary_Suffix;

   function Resolution_Label
     (Width : Positive;
     Height : Positive)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Image (Width) & "x" & Image (Height));
   end Resolution_Label;
   function Duration_Label
     (Duration_Text : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.Bounded_Text.Nonempty_Label_Text
        (Duration_Text, "invalid media duration", Prefix => "duration ");
   end Duration_Label;
   function Page_Count_Label
     (Pages : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Pages = 0 then
         return Ok_Text ("no pages");
      elsif Pages = 1 then
         return Ok_Text ("1 page");
      else
         return Ok_Text (Image (Pages) & " pages");
      end if;
   end Page_Count_Label;
   function Media_Summary
     (Name : String;
     Kind : Media_Kind;
     State : Media_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.Bounded_Text.Nonempty_Label_Text
        (Name,
         "invalid media name",
         Suffix => " " & Media_Summary_Suffix (Kind, State));
   end Media_Summary;
   function Media_Summary
     (Name    : String;
      Kind    : Media_Kind;
      State   : Media_State;
      Options : Media_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Media_Summary (Name, Kind, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Media_State_Metadata (State), Domain_Options (Options));
   end Media_Summary;

   function Parse_Media_Summary
     (Text  : String;
      Kind  : Media_Kind;
      State : Media_State)
      return Media_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Media_Surface,
         Media_Summary_Suffix (Kind, State));
   end Parse_Media_Summary;

   function Scan_Media_Summary
     (Text  : String;
      Kind  : Media_Kind;
      State : Media_State)
      return Media_Label_Parse_Result
   is
   begin
      return Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Media_Surface,
         Media_Summary_Suffix (Kind, State));
   end Scan_Media_Summary;

   procedure Media_Kind_Label_Into
     (Kind : Media_Kind;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Media_Kind_Label (Kind), Target, Written, Status);
   end Media_Kind_Label_Into;
   procedure Media_State_Label_Into
     (State : Media_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Media_State_Label (State), Target, Written, Status);
   end Media_State_Label_Into;
   procedure Resolution_Label_Into
     (Width : Positive;
     Height : Positive;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Resolution_Label (Width, Height), Target, Written, Status);
   end Resolution_Label_Into;
   procedure Duration_Label_Into
     (Duration_Text : String;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Duration_Label (Duration_Text), Target, Written, Status);
   end Duration_Label_Into;
   procedure Page_Count_Label_Into
     (Pages : Natural;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Page_Count_Label (Pages), Target, Written, Status);
   end Page_Count_Label_Into;
   procedure Media_Summary_Into
     (Name : String;
     Kind : Media_Kind;
     State : Media_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Media_Summary (Name, Kind, State), Target, Written, Status);
   end Media_Summary_Into;
   procedure Media_Summary_Into
     (Name    : String;
      Kind    : Media_Kind;
      State   : Media_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Media_Label_Options)
   is
   begin
      Copy_Result
        (Media_Summary (Name, Kind, State, Options), Target, Written, Status);
   end Media_Summary_Into;
end Humanize.Media;
