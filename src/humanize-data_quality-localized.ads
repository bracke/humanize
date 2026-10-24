with Humanize.Contexts;

--  Data Quality labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain
--  labels"): each is the parent's function of the same name with a Context first, and that function itself in
--  English, where the locale has no translation, and for every input the parent rejects.
package Humanize.Data_Quality.Localized is

   function Data_Issue_Label
      (Context : Humanize.Contexts.Context;
       Issue   : Data_Issue)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Issue As for the parent's Data_Issue_Label.
   --  @return The label in Context's locale.

   function Import_Check_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Import_Check_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Import_Check_State_Label.
   --  @return The label in Context's locale.

   function Import_Result_Label
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       State    : Import_Check_State;
       Accepted : Natural;
       Rejected : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Import_Result_Label.
   --  @param State As for the parent's Import_Result_Label.
   --  @param Accepted As for the parent's Import_Result_Label.
   --  @param Rejected As for the parent's Import_Result_Label.
   --  @return The label in Context's locale.

   function Issue_Count_Label
      (Context : Humanize.Contexts.Context;
       Issue   : Data_Issue;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Issue As for the parent's Issue_Count_Label.
   --  @param Count As for the parent's Issue_Count_Label.
   --  @return The label in Context's locale.

   function Row_Issue_Label
      (Context : Humanize.Contexts.Context;
       Row     : Positive;
       Issue   : Data_Issue)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Row As for the parent's Row_Issue_Label.
   --  @param Issue As for the parent's Row_Issue_Label.
   --  @return The label in Context's locale.

   function Source_File_Issue_Label
      (Context   : Humanize.Contexts.Context;
       File_Name : String;
       Issue     : Data_Issue)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param File_Name As for the parent's Source_File_Issue_Label.
   --  @param Issue As for the parent's Source_File_Issue_Label.
   --  @return The label in Context's locale.

   procedure Data_Issue_Label_Into
      (Context : Humanize.Contexts.Context;
       Issue   : Data_Issue;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Issue As for the parent's Data_Issue_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Import_Check_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Import_Check_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Import_Check_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Import_Result_Label_Into
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       State    : Import_Check_State;
       Accepted : Natural;
       Rejected : Natural;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Import_Result_Label.
   --  @param State As for the parent's Import_Result_Label.
   --  @param Accepted As for the parent's Import_Result_Label.
   --  @param Rejected As for the parent's Import_Result_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Issue_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Issue   : Data_Issue;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Issue As for the parent's Issue_Count_Label.
   --  @param Count As for the parent's Issue_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Row_Issue_Label_Into
      (Context : Humanize.Contexts.Context;
       Row     : Positive;
       Issue   : Data_Issue;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Row As for the parent's Row_Issue_Label.
   --  @param Issue As for the parent's Row_Issue_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Source_File_Issue_Label_Into
      (Context   : Humanize.Contexts.Context;
       File_Name : String;
       Issue     : Data_Issue;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param File_Name As for the parent's Source_File_Issue_Label.
   --  @param Issue As for the parent's Source_File_Issue_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Data_Quality.Localized;
