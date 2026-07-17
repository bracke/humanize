with Humanize.Status;
with Humanize.Domain_Details;

--  Deterministic labels for media, document, thumbnail, and metadata summaries.
package Humanize.Media is
   type Media_Output_Mode is (Media_Detailed, Media_Compact,
      Media_Accessible, Media_Log);
   --  Output policy for media labels.

   type Media_Label_Options is record
      Mode             : Media_Output_Mode := Media_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;
   --  Media label output options.

   Default_Media_Label_Options : constant Media_Label_Options :=
     (Mode             => Media_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Media_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;
   --  Parsed media label metadata.

   type Media_Kind is (Image_Media, Video_Media, Audio_Media, PDF_Document,
      Text_Document, Archive_Media, Other_Media);
   --  Caller-supplied media/document kind.

   type Media_State is (Ready_Media, Processing_Media, Transcoding_Media,
      Thumbnail_Missing, Metadata_Missing, Locked_Document, Unavailable_Media);
   --  Caller-supplied media/document state.

   function Media_Kind_Label (Kind : Media_Kind) return Humanize.Status.Text_Result;
   --  @param Kind Media/document kind.
   --  @return Human-readable media-kind label.

   function Media_State_Label (State : Media_State) return Humanize.Status.Text_Result;
   --  @param State Media/document state.
   --  @return Human-readable media-state label.

   function Resolution_Label (Width : Positive; Height : Positive) return Humanize.Status.Text_Result;
   --  @param Width Pixel width.
   --  @param Height Pixel height.
   --  @return Human-readable resolution label.

   function Duration_Label (Duration_Text : String) return Humanize.Status.Text_Result;
   --  @param Duration_Text Caller-supplied duration label.
   --  @return Human-readable media duration label.

   function Page_Count_Label (Pages : Natural) return Humanize.Status.Text_Result;
   --  @param Pages Document page count.
   --  @return Human-readable page-count label.

   function Media_Summary (Name : String; Kind : Media_Kind; State : Media_State) return Humanize.Status.Text_Result;
   --  @param Name Media or document display name.
   --  @param Kind Media/document kind.
   --  @param State Media/document state.
   --  @return Human-readable media summary.

   function Media_Summary
     (Name    : String;
      Kind    : Media_Kind;
      State   : Media_State;
      Options : Media_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Media or document display name.
   --  @param Kind Media/document kind.
   --  @param State Media/document state.
   --  @param Options Media output policy.
   --  @return Human-readable media summary with optional metadata.

   function Media_State_Metadata
     (State : Media_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Media state.
   --  @return Stable metadata for State.

   function Parse_Media_Summary
     (Text  : String;
      Kind  : Media_Kind;
      State : Media_State)
      return Media_Label_Parse_Result;
   --  @param Text Media summary emitted by Media_Summary.
   --  @param Kind Expected media kind.
   --  @param State Expected media state.
   --  @return Parsed media summary spans and metadata.

   function Scan_Media_Summary
     (Text  : String;
      Kind  : Media_Kind;
      State : Media_State)
      return Media_Label_Parse_Result;
   --  @param Text Text beginning with a media summary.
   --  @param Kind Expected media kind.
   --  @param State Expected media state.
   --  @return Parsed media summary prefix spans and metadata.

   procedure Media_Kind_Label_Into
     (Kind : Media_Kind;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Kind Media/document kind.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Media_State_Label_Into
     (State : Media_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param State Media/document state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Resolution_Label_Into
     (Width : Positive;
     Height : Positive;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Width Pixel width.
   --  @param Height Pixel height.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Duration_Label_Into
     (Duration_Text : String;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Duration_Text Caller-supplied duration label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Page_Count_Label_Into
     (Pages : Natural;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Pages Document page count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Media_Summary_Into
     (Name : String;
     Kind : Media_Kind;
     State : Media_State;
     Target : in out String;
     Written : out Natural;
     Status : out Humanize.Status.Status_Code);
   --  @param Name Media or document display name.
   --  @param Kind Media/document kind.
   --  @param State Media/document state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Media_Summary_Into
     (Name    : String;
      Kind    : Media_Kind;
      State   : Media_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Media_Label_Options);
   --  @param Name Media or document display name.
   --  @param Kind Media/document kind.
   --  @param State Media/document state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Media output policy.
end Humanize.Media;
