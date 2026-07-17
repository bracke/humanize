with Humanize.Domain_Details;
with Humanize.Status;

--  Human-readable labels for search, filter, facet, and sort metadata.
package Humanize.Search is

   type Search_Output_Mode is (Search_Detailed, Search_Compact,
                               Search_Accessible, Search_Log);

   type Search_Label_Options is record
      Mode             : Search_Output_Mode := Search_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;

   Default_Search_Label_Options : constant Search_Label_Options :=
     (Mode             => Search_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Search_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;

   type Search_State is
     (Idle_Search,
      Searching_Search,
      Complete_Search,
      Empty_Search,
      Failed_Search);
   --  Caller-supplied search workflow state.

   type Filter_State is
     (Active_Filter,
      Inactive_Filter,
      Excluded_Filter);
   --  Caller-supplied filter state.

   type Sort_Mode is
     (Relevance_Sort,
      Ascending_Sort,
      Descending_Sort,
      Newest_First_Sort,
      Oldest_First_Sort);
   --  Caller-supplied search result sort mode.

   function Search_State_Label
     (State : Search_State)
      return Humanize.Status.Text_Result;
   --  @param State Search workflow state.
   --  @return Human-readable search-state label.

   function Filter_State_Label
     (State : Filter_State)
      return Humanize.Status.Text_Result;
   --  @param State Filter state.
   --  @return Human-readable filter-state label.

   function Sort_Mode_Label
     (Mode : Sort_Mode)
      return Humanize.Status.Text_Result;
   --  @param Mode Search result sort mode.
   --  @return Human-readable sort-mode label.

   function Search_Query_Label
     (Query : String)
      return Humanize.Status.Text_Result;
   --  @param Query Search query text.
   --  @return Human-readable search-query label.

   function Search_Result_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Search result count.
   --  @return Human-readable search result-count label.

   function Search_Result_Summary_Label
     (Query : String;
      Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Query Search query text.
   --  @param Count Search result count.
   --  @return Human-readable search result summary label.

   function No_Results_Label
     (Query : String := "")
      return Humanize.Status.Text_Result;
   --  @param Query Optional search query text.
   --  @return Human-readable no-results label.

   function Active_Filter_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Active filter count.
   --  @return Human-readable active-filter count label.

   function Filter_Label
     (Name  : String;
      Value : String := "";
      State : Filter_State := Active_Filter)
      return Humanize.Status.Text_Result;
   --  @param Name Filter name.
   --  @param Value Optional filter value.
   --  @param State Filter state.
   --  @return Human-readable filter label.

   function Filter_Label
     (Name    : String;
      Value   : String;
      State   : Filter_State;
      Options : Search_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Filter name.
   --  @param Value Optional filter value.
   --  @param State Filter state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable filter label with optional metadata.

   function Search_State_Metadata
     (State : Search_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Search workflow state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Filter_State_Metadata
     (State : Filter_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Filter state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Parse_Filter_Label
     (Text  : String;
      State : Filter_State)
      return Search_Label_Parse_Result;
   --  @param Text Label in rendered filter-label form.
   --  @param State Expected filter state.
   --  @return Parsed filter name/value span, state span, metadata, and consumed length.

   function Scan_Filter_Label
     (Text  : String;
      State : Filter_State)
      return Search_Label_Parse_Result;
   --  @param Text Text beginning with a filter label.
   --  @param State Expected filter state.
   --  @return Parsed label span and consumed prefix length.

   function Facet_Label
     (Name  : String;
      Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Name Facet name.
   --  @param Count Facet option count.
   --  @return Human-readable facet label.

   function Facet_Value_Label
     (Name     : String;
      Count    : Natural;
      Selected : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Name Facet value name.
   --  @param Count Search result count for the facet value.
   --  @param Selected Whether the facet value is selected.
   --  @return Human-readable facet value label.

   function Sort_Label
     (Mode : Sort_Mode)
      return Humanize.Status.Text_Result;
   --  @param Mode Search result sort mode.
   --  @return Human-readable sort label.

   function Clear_Filters_Label
     (Count : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Count Optional active filter count to clear.
   --  @return Human-readable clear-filters action label.

   function Search_Scope_Label
     (Name  : String;
      Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Name Search scope name.
   --  @param Count Search result count in the scope.
   --  @return Human-readable search-scope label.

   function Suggestion_Label
     (Query : String)
      return Humanize.Status.Text_Result;
   --  @param Query Suggested search query text.
   --  @return Human-readable search suggestion label.

   function Recent_Search_Label
     (Query : String)
      return Humanize.Status.Text_Result;
   --  @param Query Recent search query text.
   --  @return Human-readable recent-search label.

   function Saved_Search_Label
     (Name  : String;
      Count : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Name Saved search name.
   --  @param Count Optional result count for the saved search.
   --  @return Human-readable saved-search label.

   function Search_History_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Search history item count.
   --  @return Human-readable search-history count label.

   procedure Search_State_Label_Into
     (State   : Search_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Search workflow state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Filter_State_Label_Into
     (State   : Filter_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Filter state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Sort_Mode_Label_Into
     (Mode    : Sort_Mode;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Mode Search result sort mode.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Search_Query_Label_Into
     (Query   : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Query Search query text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Search_Result_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Search result count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Search_Result_Summary_Label_Into
     (Query   : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Query Search query text.
   --  @param Count Search result count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure No_Results_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Query   : String := "");
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Query Optional search query text.

   procedure Active_Filter_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Active filter count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Filter_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Value   : String := "";
      State   : Filter_State := Active_Filter);
   --  @param Name Filter name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Value Optional filter value.
   --  @param State Filter state.

   procedure Filter_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Value   : String;
      State   : Filter_State;
      Options : Search_Label_Options);
   --  @param Name Filter name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Value Optional filter value.
   --  @param State Filter state.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Facet_Label_Into
     (Name    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Facet name.
   --  @param Count Facet option count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Facet_Value_Label_Into
     (Name     : String;
      Count    : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Selected : Boolean := False);
   --  @param Name Facet value name.
   --  @param Count Search result count for the facet value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Selected Whether the facet value is selected.

   procedure Sort_Label_Into
     (Mode    : Sort_Mode;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Mode Search result sort mode.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Clear_Filters_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Count   : Natural := 0);
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Count Optional active filter count to clear.

   procedure Search_Scope_Label_Into
     (Name    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Search scope name.
   --  @param Count Search result count in the scope.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Suggestion_Label_Into
     (Query   : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Query Suggested search query text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Recent_Search_Label_Into
     (Query   : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Query Recent search query text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Saved_Search_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Count   : Natural := 0);
   --  @param Name Saved search name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Count Optional result count for the saved search.

   procedure Search_History_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Search history item count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Search;
