with Humanize.Contexts;

--  Cross-domain labels a user reads -- validation problems and constraints,
--  network diagnostics, progress, collection statistics, the most frequent
--  value -- in a context's locale, through the phrase catalog
--  (docs/PHRASE_TEMPLATES.md, "Cross-domain labels"); each is the parent's
--  function of the same name in English. Caller texts (field names, values,
--  details) are inserted as given.
package Humanize.Cross_Domain.Localized is

   function Validation_Problem_Label
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Kind    : Validation_Problem_Kind;
      Detail  : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Field As for the parent's Validation_Problem_Label.
   --  @param Kind As for the parent's Validation_Problem_Label.
   --  @param Detail As for the parent's Validation_Problem_Label.
   --  @return A field's validation problem, localized.

   function Validation_Constraint_Label
     (Context  : Humanize.Contexts.Context;
      Field    : String;
      Relation : Validation_Relation;
      Value    : String;
      Actual   : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Field As for the parent's Validation_Constraint_Label.
   --  @param Relation As for the parent's Validation_Constraint_Label.
   --  @param Value As for the parent's Validation_Constraint_Label.
   --  @param Actual As for the parent's Validation_Constraint_Label.
   --  @return A field's constraint, localized.

   function Validation_Choice_Label
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Choices : String;
      Actual  : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Field As for the parent's Validation_Choice_Label.
   --  @param Choices As for the parent's Validation_Choice_Label.
   --  @param Actual As for the parent's Validation_Choice_Label.
   --  @return A field's allowed values, localized.

   function Network_Diagnostic_Label
     (Context     : Humanize.Contexts.Context;
      Endpoint    : String;
      Kind        : Network_Diagnostic_Kind;
      Detail      : String := "";
      Retry_After : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Endpoint As for the parent's Network_Diagnostic_Label.
   --  @param Kind As for the parent's Network_Diagnostic_Label.
   --  @param Detail As for the parent's Network_Diagnostic_Label.
   --  @param Retry_After As for the parent's Network_Diagnostic_Label.
   --  @return A network diagnostic, localized.

   function Progress_Label
     (Context : Humanize.Contexts.Context;
      Subject : String;
      Done    : Natural;
      Total   : Natural;
      State   : Progress_State := Progress_Running)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Subject As for the parent's Progress_Label.
   --  @param Done As for the parent's Progress_Label.
   --  @param Total As for the parent's Progress_Label.
   --  @param State As for the parent's Progress_Label.
   --  @return Progress, localized.

   function Collection_Summary_Label
     (Context    : Humanize.Contexts.Context;
      Name       : String;
      Total      : Natural;
      Unique     : Natural := 0;
      Duplicates : Natural := 0;
      Outliers   : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Collection_Summary_Label.
   --  @param Total As for the parent's Collection_Summary_Label.
   --  @param Unique As for the parent's Collection_Summary_Label.
   --  @param Duplicates As for the parent's Collection_Summary_Label.
   --  @param Outliers As for the parent's Collection_Summary_Label.
   --  @return Collection statistics, localized.

   function Top_Frequency_Label
     (Context : Humanize.Contexts.Context;
      Name    : String;
      Value   : String;
      Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Top_Frequency_Label.
   --  @param Value As for the parent's Top_Frequency_Label.
   --  @param Count As for the parent's Top_Frequency_Label.
   --  @return The most frequent value, localized.

   function Structured_Diff_Label
     (Context   : Humanize.Contexts.Context;
      Path      : String;
      Old_Value : String := "";
      New_Value : String := "";
      Redacted  : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Path As for the parent's Structured_Diff_Label.
   --  @param Old_Value As for the parent's Structured_Diff_Label.
   --  @param New_Value As for the parent's Structured_Diff_Label.
   --  @param Redacted As for the parent's Structured_Diff_Label.
   --  @return The change, localized.

   function Validation_Result_Label
     (Context : Humanize.Contexts.Context;
      Summary : Validation_Result_Summary)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Summary As for the parent's Validation_Result_Label.
   --  @return The validation counts, localized.

   function File_Metadata_Label
     (Context  : Humanize.Contexts.Context;
      Name     : String;
      Kind     : File_Metadata_Kind;
      Size     : String := "";
      Checksum : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's File_Metadata_Label.
   --  @param Kind As for the parent's File_Metadata_Label.
   --  @param Size As for the parent's File_Metadata_Label.
   --  @param Checksum As for the parent's File_Metadata_Label.
   --  @return The file's kind, size and checksum, localized.

   function File_Signature_Label
     (Context        : Humanize.Contexts.Context;
      Name           : String;
      Extension_Kind : File_Metadata_Kind;
      Signature_Kind : File_Metadata_Kind)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's File_Signature_Label.
   --  @param Extension_Kind As for the parent's File_Signature_Label.
   --  @param Signature_Kind As for the parent's File_Signature_Label.
   --  @return Whether the content matches the extension, localized.

   function Network_Session_Label
     (Context     : Humanize.Contexts.Context;
      Endpoint    : String;
      Event       : Network_Event_Kind;
      Detail      : String := "";
      Retry_After : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Endpoint As for the parent's Network_Session_Label.
   --  @param Event As for the parent's Network_Session_Label.
   --  @param Detail As for the parent's Network_Session_Label.
   --  @param Retry_After As for the parent's Network_Session_Label.
   --  @return The session's state, localized.

   function Diff_Node_Label
     (Context : Humanize.Contexts.Context;
      Path    : String;
      Kind    : Diff_Node_Kind;
      Changes : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Path As for the parent's Diff_Node_Label.
   --  @param Kind As for the parent's Diff_Node_Label.
   --  @param Changes As for the parent's Diff_Node_Label.
   --  @return The diff node, localized.

   function Product_Code_Label
     (Context  : Humanize.Contexts.Context;
      Value    : String;
      Kind     : Product_Code_Kind := Unknown_Product_Code;
      Checksum : Checksum_State := Checksum_Not_Checked)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value As for the parent's Product_Code_Label.
   --  @param Kind As for the parent's Product_Code_Label.
   --  @param Checksum As for the parent's Product_Code_Label.
   --  @return The code and its checksum state, localized.

   function Time_Zone_Label
     (Context        : Humanize.Contexts.Context;
      Kind           : Time_Zone_Kind;
      Name           : String := "";
      Offset_Minutes : Integer := 0;
      Has_DST        : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Time_Zone_Label.
   --  @param Name As for the parent's Time_Zone_Label.
   --  @param Offset_Minutes As for the parent's Time_Zone_Label.
   --  @param Has_DST As for the parent's Time_Zone_Label.
   --  @return The time zone, localized.

   function Zoned_Time_Label
     (Context        : Humanize.Contexts.Context;
      Local_Time     : String;
      Zone_Name      : String;
      Offset_Minutes : Integer;
      Ambiguous      : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Local_Time As for the parent's Zoned_Time_Label.
   --  @param Zone_Name As for the parent's Zoned_Time_Label.
   --  @param Offset_Minutes As for the parent's Zoned_Time_Label.
   --  @param Ambiguous As for the parent's Zoned_Time_Label.
   --  @return The local time in its zone, localized.

   --  Bounded forms: each writes its function's text into Target.

   procedure Validation_Problem_Label_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Kind    : Validation_Problem_Kind;
      Detail  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Field As for Validation_Problem_Label.
   --  @param Kind As for Validation_Problem_Label.
   --  @param Detail As for Validation_Problem_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Validation_Constraint_Label_Into
     (Context  : Humanize.Contexts.Context;
      Field    : String;
      Relation : Validation_Relation;
      Value    : String;
      Actual   : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Field As for Validation_Constraint_Label.
   --  @param Relation As for Validation_Constraint_Label.
   --  @param Value As for Validation_Constraint_Label.
   --  @param Actual As for Validation_Constraint_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Validation_Choice_Label_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Choices : String;
      Actual  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Field As for Validation_Choice_Label.
   --  @param Choices As for Validation_Choice_Label.
   --  @param Actual As for Validation_Choice_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Network_Diagnostic_Label_Into
     (Context     : Humanize.Contexts.Context;
      Endpoint    : String;
      Kind        : Network_Diagnostic_Kind;
      Detail      : String;
      Retry_After : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Endpoint As for Network_Diagnostic_Label.
   --  @param Kind As for Network_Diagnostic_Label.
   --  @param Detail As for Network_Diagnostic_Label.
   --  @param Retry_After As for Network_Diagnostic_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Progress_Label_Into
     (Context : Humanize.Contexts.Context;
      Subject : String;
      Done    : Natural;
      Total   : Natural;
      State   : Progress_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Subject As for Progress_Label.
   --  @param Done As for Progress_Label.
   --  @param Total As for Progress_Label.
   --  @param State As for Progress_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Collection_Summary_Label_Into
     (Context    : Humanize.Contexts.Context;
      Name       : String;
      Total      : Natural;
      Unique     : Natural;
      Duplicates : Natural;
      Outliers   : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for Collection_Summary_Label.
   --  @param Total As for Collection_Summary_Label.
   --  @param Unique As for Collection_Summary_Label.
   --  @param Duplicates As for Collection_Summary_Label.
   --  @param Outliers As for Collection_Summary_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Top_Frequency_Label_Into
     (Context : Humanize.Contexts.Context;
      Name    : String;
      Value   : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for Top_Frequency_Label.
   --  @param Value As for Top_Frequency_Label.
   --  @param Count As for Top_Frequency_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Cross_Domain.Localized;
