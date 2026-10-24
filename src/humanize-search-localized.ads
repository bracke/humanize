with Humanize.Contexts;

--  Search labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Search.Localized is

   function Active_Filter_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Active_Filter_Count_Label.
   --  @return The label in Context's locale.

   function Clear_Filters_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Clear_Filters_Label.
   --  @return The label in Context's locale.

   function Facet_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Facet_Label.
   --  @param Count As for the parent's Facet_Label.
   --  @return The label in Context's locale.

   function Facet_Value_Label
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Count    : Natural;
       Selected : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Facet_Value_Label.
   --  @param Count As for the parent's Facet_Value_Label.
   --  @param Selected As for the parent's Facet_Value_Label.
   --  @return The label in Context's locale.

   function Filter_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Value   : String := "";
       State   : Filter_State := Active_Filter)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Filter_Label.
   --  @param Value As for the parent's Filter_Label.
   --  @param State As for the parent's Filter_Label.
   --  @return The label in Context's locale.

   function Filter_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Value   : String;
       State   : Filter_State;
       Options : Search_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Filter_Label.
   --  @param Value As for the parent's Filter_Label.
   --  @param State As for the parent's Filter_Label.
   --  @param Options As for the parent's Filter_Label.
   --  @return The label in Context's locale.

   function Filter_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Filter_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Filter_State_Label.
   --  @return The label in Context's locale.

   function No_Results_Label
      (Context : Humanize.Contexts.Context;
       Query   : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Query As for the parent's No_Results_Label.
   --  @return The label in Context's locale.

   function Recent_Search_Label
      (Context : Humanize.Contexts.Context;
       Query   : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Query As for the parent's Recent_Search_Label.
   --  @return The label in Context's locale.

   function Saved_Search_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Saved_Search_Label.
   --  @param Count As for the parent's Saved_Search_Label.
   --  @return The label in Context's locale.

   function Search_History_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Search_History_Count_Label.
   --  @return The label in Context's locale.

   function Search_Query_Label
      (Context : Humanize.Contexts.Context;
       Query   : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Query As for the parent's Search_Query_Label.
   --  @return The label in Context's locale.

   function Search_Result_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Search_Result_Count_Label.
   --  @return The label in Context's locale.

   function Search_Result_Summary_Label
      (Context : Humanize.Contexts.Context;
       Query   : String;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Query As for the parent's Search_Result_Summary_Label.
   --  @param Count As for the parent's Search_Result_Summary_Label.
   --  @return The label in Context's locale.

   function Search_Scope_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Search_Scope_Label.
   --  @param Count As for the parent's Search_Scope_Label.
   --  @return The label in Context's locale.

   function Search_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Search_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Search_State_Label.
   --  @return The label in Context's locale.

   function Sort_Label
      (Context : Humanize.Contexts.Context;
       Mode    : Sort_Mode)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Mode As for the parent's Sort_Label.
   --  @return The label in Context's locale.

   function Sort_Mode_Label
      (Context : Humanize.Contexts.Context;
       Mode    : Sort_Mode)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Mode As for the parent's Sort_Mode_Label.
   --  @return The label in Context's locale.

   function Suggestion_Label
      (Context : Humanize.Contexts.Context;
       Query   : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Query As for the parent's Suggestion_Label.
   --  @return The label in Context's locale.

   procedure Active_Filter_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Active_Filter_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Clear_Filters_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Clear_Filters_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Facet_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Facet_Label.
   --  @param Count As for the parent's Facet_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Facet_Value_Label_Into
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Count    : Natural;
       Selected : Boolean := False;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Facet_Value_Label.
   --  @param Count As for the parent's Facet_Value_Label.
   --  @param Selected As for the parent's Facet_Value_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Filter_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Value   : String := "";
       State   : Filter_State := Active_Filter;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Filter_Label.
   --  @param Value As for the parent's Filter_Label.
   --  @param State As for the parent's Filter_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Filter_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Value   : String;
       State   : Filter_State;
       Options : Search_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Filter_Label.
   --  @param Value As for the parent's Filter_Label.
   --  @param State As for the parent's Filter_Label.
   --  @param Options As for the parent's Filter_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Filter_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Filter_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Filter_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure No_Results_Label_Into
      (Context : Humanize.Contexts.Context;
       Query   : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Query As for the parent's No_Results_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Recent_Search_Label_Into
      (Context : Humanize.Contexts.Context;
       Query   : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Query As for the parent's Recent_Search_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Saved_Search_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Saved_Search_Label.
   --  @param Count As for the parent's Saved_Search_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Search_History_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Search_History_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Search_Query_Label_Into
      (Context : Humanize.Contexts.Context;
       Query   : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Query As for the parent's Search_Query_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Search_Result_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Search_Result_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Search_Result_Summary_Label_Into
      (Context : Humanize.Contexts.Context;
       Query   : String;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Query As for the parent's Search_Result_Summary_Label.
   --  @param Count As for the parent's Search_Result_Summary_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Search_Scope_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Search_Scope_Label.
   --  @param Count As for the parent's Search_Scope_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Search_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Search_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Search_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Sort_Label_Into
      (Context : Humanize.Contexts.Context;
       Mode    : Sort_Mode;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Mode As for the parent's Sort_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Sort_Mode_Label_Into
      (Context : Humanize.Contexts.Context;
       Mode    : Sort_Mode;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Mode As for the parent's Sort_Mode_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Suggestion_Label_Into
      (Context : Humanize.Contexts.Context;
       Query   : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Query As for the parent's Suggestion_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Search.Localized;
