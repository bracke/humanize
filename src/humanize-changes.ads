with Humanize.Domain_Details;
with Humanize.Status;

--  Human-readable labels for collection differences and change-set metadata.
package Humanize.Changes is
   type Change_Output_Mode is
     (Change_Detailed,
      Change_Compact,
      Change_Accessible,
      Change_Log);

   type Change_Label_Options is record
      Mode             : Change_Output_Mode := Change_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;

   Default_Change_Label_Options : constant Change_Label_Options :=
     (Mode             => Change_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Change_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;

   type Change_Kind is
     (Added_Change,
      Removed_Change,
      Modified_Change,
      Renamed_Change,
      Unchanged_Change,
      Metadata_Change,
      Moved_Change,
      Conflict_Change,
      Unknown_Change);
   --  Caller-supplied change kind.

   type Change_Severity is
     (Informational_Change,
      Minor_Change,
      Major_Change,
      Breaking_Change);
   --  Caller-supplied change significance.

   function Change_Kind_Label
     (Kind : Change_Kind)
      return Humanize.Status.Text_Result;
   --  @param Kind Change kind.
   --  @return Human-readable change-kind label.

   function Change_Severity_Label
     (Severity : Change_Severity)
      return Humanize.Status.Text_Result;
   --  @param Severity Change significance.
   --  @return Human-readable change-severity label.

   function Change_Set_Label
     (Added     : Natural := 0;
      Removed   : Natural := 0;
      Modified  : Natural := 0;
      Unchanged : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Added Added item count.
   --  @param Removed Removed item count.
   --  @param Modified Modified item count.
   --  @param Unchanged Unchanged item count.
   --  @return Compact change-set summary.

   function Change_Summary_Label
     (Total     : Natural;
      Added     : Natural := 0;
      Removed   : Natural := 0;
      Modified  : Natural := 0;
      Renamed   : Natural := 0;
      Unchanged : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Total Total item count.
   --  @param Added Added item count.
   --  @param Removed Removed item count.
   --  @param Modified Modified item count.
   --  @param Renamed Renamed item count.
   --  @param Unchanged Unchanged item count.
   --  @return Human-readable change summary.

   function Item_Change_Label
     (Name : String;
      Kind : Change_Kind)
      return Humanize.Status.Text_Result;
   --  @param Name Item name.
   --  @param Kind Change kind.
   --  @return Human-readable item change label.

   function Item_Change_Label
     (Name    : String;
      Kind    : Change_Kind;
      Options : Change_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Item name.
   --  @param Kind Change kind.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable item change label with optional metadata.

   function Rename_Label
     (Old_Name : String;
      New_Name : String)
      return Humanize.Status.Text_Result;
   --  @param Old_Name Previous item name.
   --  @param New_Name New item name.
   --  @return Human-readable rename label.

   function Move_Label
     (Name : String;
      From : String;
      To   : String)
      return Humanize.Status.Text_Result;
   --  @param Name Item name.
   --  @param From Previous location/group.
   --  @param To New location/group.
   --  @return Human-readable move label.

   function Field_Change_Label
     (Field_Name : String;
      Old_Value  : String := "";
      New_Value  : String := "")
      return Humanize.Status.Text_Result;
   --  @param Field_Name Changed field name.
   --  @param Old_Value Optional previous display value.
   --  @param New_Value Optional new display value.
   --  @return Human-readable field change label.

   function Metadata_Only_Label
     (Count : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Count Optional changed metadata field count.
   --  @return Human-readable metadata-only change label.

   function No_Changes_Label
      return Humanize.Status.Text_Result;
   --  @return Human-readable no-changes label.

   function Conflict_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Conflict count.
   --  @return Human-readable conflict count label.

   function Conflict_Label
     (Count   : Natural;
      Options : Change_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Count Conflict count.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable conflict count label with optional metadata.

   function Change_Kind_Metadata
     (Kind : Change_Kind)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param Kind Change kind.
   --  @return Severity, tone, and final/actionable metadata for Kind.

   function Change_Severity_Metadata
     (Severity : Change_Severity)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param Severity Change significance.
   --  @return Severity, tone, and final/actionable metadata for Severity.

   function Parse_Item_Change_Label
     (Text : String;
      Kind : Change_Kind)
      return Change_Label_Parse_Result;
   --  @param Text Label in rendered item-change form.
   --  @param Kind Expected change kind.
   --  @return Parsed item name span, change-kind span, metadata, and consumed length.

   function Scan_Item_Change_Label
     (Text : String;
      Kind : Change_Kind)
      return Change_Label_Parse_Result;
   --  @param Text Text beginning with an item-change label.
   --  @param Kind Expected change kind.
   --  @return Parsed item-change prefix and consumed length.

   function Sync_Change_Label
     (Uploaded   : Natural := 0;
      Downloaded : Natural := 0;
      Deleted    : Natural := 0;
      Conflicts  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Uploaded Uploaded item count.
   --  @param Downloaded Downloaded item count.
   --  @param Deleted Deleted item count.
   --  @param Conflicts Conflict count.
   --  @return Human-readable sync change summary.

   function Net_Change_Label
     (Added   : Natural;
      Removed : Natural)
      return Humanize.Status.Text_Result;
   --  @param Added Added item count.
   --  @param Removed Removed item count.
   --  @return Human-readable net item-count change label.

   function Patch_Size_Label
     (Lines_Added   : Natural := 0;
      Lines_Removed : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Lines_Added Added line count.
   --  @param Lines_Removed Removed line count.
   --  @return Human-readable patch-size label.

   function Review_Progress_Label
     (Reviewed : Natural;
      Total    : Natural)
      return Humanize.Status.Text_Result;
   --  @param Reviewed Reviewed change count.
   --  @param Total Total change count.
   --  @return Human-readable review progress label.

   function Numeric_Field_Change_Label
     (Field_Name : String;
      Old_Value  : Long_Float;
      New_Value  : Long_Float;
      Unit       : String := "")
      return Humanize.Status.Text_Result;
   --  @param Field_Name Changed field name.
   --  @param Old_Value Previous numeric value.
   --  @param New_Value New numeric value.
   --  @param Unit Optional caller-formatted unit label.
   --  @return Human-readable numeric field-change label.

   function Duration_Field_Change_Label
     (Field_Name : String;
      Old_Label  : String;
      New_Label  : String)
      return Humanize.Status.Text_Result;
   --  @param Field_Name Changed field name.
   --  @param Old_Label Previous caller-formatted duration.
   --  @param New_Label New caller-formatted duration.
   --  @return Human-readable duration field-change label.

   function Date_Field_Change_Label
     (Field_Name : String;
      Old_Label  : String;
      New_Label  : String;
      Earlier    : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Field_Name Changed field name.
   --  @param Old_Label Previous caller-formatted date.
   --  @param New_Label New caller-formatted date.
   --  @param Earlier Whether the new date is earlier than the old date.
   --  @return Human-readable date field-change label.

   function Boolean_Field_Change_Label
     (Field_Name : String;
      Old_Value  : Boolean;
      New_Value  : Boolean)
      return Humanize.Status.Text_Result;
   --  @param Field_Name Changed field name.
   --  @param Old_Value Previous boolean value.
   --  @param New_Value New boolean value.
   --  @return Human-readable boolean field-change label.

   function Collection_Field_Change_Label
     (Field_Name : String;
      Added      : Natural := 0;
      Removed    : Natural := 0;
      Unchanged  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Field_Name Changed field name.
   --  @param Added Added item count.
   --  @param Removed Removed item count.
   --  @param Unchanged Unchanged item count.
   --  @return Human-readable collection field-change label.

   function Parse_Numeric_Field_Change_Label
     (Text : String)
      return Change_Label_Parse_Result;
   --  @param Text Label rendered by Numeric_Field_Change_Label.
   --  @return Parsed field/change spans and metadata.

   function Scan_Numeric_Field_Change_Label
     (Text : String)
      return Change_Label_Parse_Result;
   --  @param Text Text beginning with a numeric field-change label.
   --  @return Parsed numeric field-change prefix.

   procedure Numeric_Field_Change_Label_Into
     (Field_Name : String;
      Old_Value  : Long_Float;
      New_Value  : Long_Float;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Unit       : String := "");
   --  @param Field_Name Changed field name.
   --  @param Old_Value Previous numeric value.
   --  @param New_Value New numeric value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Unit Optional caller-formatted unit label.

   procedure Boolean_Field_Change_Label_Into
     (Field_Name : String;
      Old_Value  : Boolean;
      New_Value  : Boolean;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   --  @param Field_Name Changed field name.
   --  @param Old_Value Previous boolean value.
   --  @param New_Value New boolean value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Change_Kind_Label_Into
     (Kind    : Change_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Kind Change kind.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Change_Severity_Label_Into
     (Severity : Change_Severity;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Severity Change significance.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Change_Set_Label_Into
     (Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Added     : Natural := 0;
      Removed   : Natural := 0;
      Modified  : Natural := 0;
      Unchanged : Natural := 0);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Added Added item count.
   --  @param Removed Removed item count.
   --  @param Modified Modified item count.
   --  @param Unchanged Unchanged item count.

   procedure Change_Summary_Label_Into
     (Total     : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Added     : Natural := 0;
      Removed   : Natural := 0;
      Modified  : Natural := 0;
      Renamed   : Natural := 0;
      Unchanged : Natural := 0);
   --  @param Total Total item count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Added Added item count.
   --  @param Removed Removed item count.
   --  @param Modified Modified item count.
   --  @param Renamed Renamed item count.
   --  @param Unchanged Unchanged item count.

   procedure Item_Change_Label_Into
     (Name    : String;
      Kind    : Change_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Item name.
   --  @param Kind Change kind.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Item_Change_Label_Into
     (Name    : String;
      Kind    : Change_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Change_Label_Options);
   --  @param Name Item name.
   --  @param Kind Change kind.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Rename_Label_Into
     (Old_Name : String;
      New_Name : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Old_Name Previous item name.
   --  @param New_Name New item name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Move_Label_Into
     (Name    : String;
      From    : String;
      To      : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Item name.
   --  @param From Previous location/group.
   --  @param To New location/group.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Field_Change_Label_Into
     (Field_Name : String;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Old_Value  : String := "";
      New_Value  : String := "");
   --  @param Field_Name Changed field name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Old_Value Optional previous display value.
   --  @param New_Value Optional new display value.

   procedure Metadata_Only_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Count   : Natural := 0);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Count Optional changed metadata field count.

   procedure No_Changes_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Conflict_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Conflict count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Conflict_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Change_Label_Options);
   --  @param Count Conflict count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Sync_Change_Label_Into
     (Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Uploaded   : Natural := 0;
      Downloaded : Natural := 0;
      Deleted    : Natural := 0;
      Conflicts  : Natural := 0);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Uploaded Uploaded item count.
   --  @param Downloaded Downloaded item count.
   --  @param Deleted Deleted item count.
   --  @param Conflicts Conflict count.

   procedure Net_Change_Label_Into
     (Added   : Natural;
      Removed : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Added Added item count.
   --  @param Removed Removed item count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Patch_Size_Label_Into
     (Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Lines_Added   : Natural := 0;
      Lines_Removed : Natural := 0);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Lines_Added Added line count.
   --  @param Lines_Removed Removed line count.

   procedure Review_Progress_Label_Into
     (Reviewed : Natural;
      Total    : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Reviewed Reviewed change count.
   --  @param Total Total change count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Changes;
