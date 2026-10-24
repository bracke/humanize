with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Selections;

package body Humanize.Search.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Active_Filter_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Search.Active_Filter_Count_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.search.active_filter_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Active_Filter_Count_Label;

   function Clear_Filters_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Search.Clear_Filters_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.search.clear_filters_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Clear_Filters_Label;

   function Facet_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Search.Facet_Label (Name => Name, Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.search.facet_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Facet_Label;

   function Facet_Value_Label
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Count    : Natural;
       Selected : Boolean := False)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Search.Facet_Value_Label (Name => Name, Count => Count, Selected => Selected);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.search.facet_value_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      Selection := Sel.With_Arg (Selection, "selected", Lower (Boolean'Image (Selected)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Facet_Value_Label;

   function Filter_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Value   : String := "";
       State   : Filter_State := Active_Filter)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Search.Filter_Label (Name => Name, Value => Value, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.search.filter_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "value", Humanize.Bounded_Text.Clean (Value));
      Selection := Sel.With_Arg (Selection, "state", Lower (Filter_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Filter_Label;

   function Filter_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Filter_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Search.Filter_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.search.filter_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Filter_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Filter_State_Label;

   function No_Results_Label
      (Context : Humanize.Contexts.Context;
       Query   : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Search.No_Results_Label (Query => Query);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.search.no_results_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "query", Humanize.Bounded_Text.Clean (Query));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end No_Results_Label;

   function Recent_Search_Label
      (Context : Humanize.Contexts.Context;
       Query   : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Search.Recent_Search_Label (Query => Query);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.search.recent_search_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "query", Humanize.Bounded_Text.Clean (Query));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Recent_Search_Label;

   function Saved_Search_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Search.Saved_Search_Label (Name => Name, Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.search.saved_search_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Saved_Search_Label;

   function Search_History_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Search.Search_History_Count_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.search.search_history_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Search_History_Count_Label;

   function Search_Query_Label
      (Context : Humanize.Contexts.Context;
       Query   : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Search.Search_Query_Label (Query => Query);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.search.search_query_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "query", Humanize.Bounded_Text.Clean (Query));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Search_Query_Label;

   function Search_Result_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Search.Search_Result_Count_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.search.search_result_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Search_Result_Count_Label;

   function Search_Result_Summary_Label
      (Context : Humanize.Contexts.Context;
       Query   : String;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Search.Search_Result_Summary_Label (Query => Query, Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.search.search_result_summary_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "query", Humanize.Bounded_Text.Clean (Query));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Search_Result_Summary_Label;

   function Search_Scope_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Search.Search_Scope_Label (Name => Name, Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.search.search_scope_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Search_Scope_Label;

   function Search_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Search_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Search.Search_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.search.search_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Search_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Search_State_Label;

   function Sort_Label
      (Context : Humanize.Contexts.Context;
       Mode    : Sort_Mode)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Search.Sort_Label (Mode => Mode);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.search.sort_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "mode", Lower (Sort_Mode'Image (Mode)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Sort_Label;

   function Sort_Mode_Label
      (Context : Humanize.Contexts.Context;
       Mode    : Sort_Mode)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Search.Sort_Mode_Label (Mode => Mode);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.search.sort_mode_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "mode", Lower (Sort_Mode'Image (Mode)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Sort_Mode_Label;

   function Suggestion_Label
      (Context : Humanize.Contexts.Context;
       Query   : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Search.Suggestion_Label (Query => Query);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.search.suggestion_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "query", Humanize.Bounded_Text.Clean (Query));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Suggestion_Label;

   procedure Active_Filter_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Active_Filter_Count_Label (Context, Count), Target, Written, Status);
   end Active_Filter_Count_Label_Into;

   procedure Clear_Filters_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Clear_Filters_Label (Context, Count), Target, Written, Status);
   end Clear_Filters_Label_Into;

   procedure Facet_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Facet_Label (Context, Name, Count), Target, Written, Status);
   end Facet_Label_Into;

   procedure Facet_Value_Label_Into
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Count    : Natural;
       Selected : Boolean := False;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Facet_Value_Label (Context, Name, Count, Selected), Target, Written, Status);
   end Facet_Value_Label_Into;

   procedure Filter_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Value   : String := "";
       State   : Filter_State := Active_Filter;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Filter_Label (Context, Name, Value, State), Target, Written, Status);
   end Filter_Label_Into;

   procedure Filter_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Filter_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Filter_State_Label (Context, State), Target, Written, Status);
   end Filter_State_Label_Into;

   procedure No_Results_Label_Into
      (Context : Humanize.Contexts.Context;
       Query   : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (No_Results_Label (Context, Query), Target, Written, Status);
   end No_Results_Label_Into;

   procedure Recent_Search_Label_Into
      (Context : Humanize.Contexts.Context;
       Query   : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Recent_Search_Label (Context, Query), Target, Written, Status);
   end Recent_Search_Label_Into;

   procedure Saved_Search_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Saved_Search_Label (Context, Name, Count), Target, Written, Status);
   end Saved_Search_Label_Into;

   procedure Search_History_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Search_History_Count_Label (Context, Count), Target, Written, Status);
   end Search_History_Count_Label_Into;

   procedure Search_Query_Label_Into
      (Context : Humanize.Contexts.Context;
       Query   : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Search_Query_Label (Context, Query), Target, Written, Status);
   end Search_Query_Label_Into;

   procedure Search_Result_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Search_Result_Count_Label (Context, Count), Target, Written, Status);
   end Search_Result_Count_Label_Into;

   procedure Search_Result_Summary_Label_Into
      (Context : Humanize.Contexts.Context;
       Query   : String;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Search_Result_Summary_Label (Context, Query, Count), Target, Written, Status);
   end Search_Result_Summary_Label_Into;

   procedure Search_Scope_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Search_Scope_Label (Context, Name, Count), Target, Written, Status);
   end Search_Scope_Label_Into;

   procedure Search_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Search_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Search_State_Label (Context, State), Target, Written, Status);
   end Search_State_Label_Into;

   procedure Sort_Label_Into
      (Context : Humanize.Contexts.Context;
       Mode    : Sort_Mode;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Sort_Label (Context, Mode), Target, Written, Status);
   end Sort_Label_Into;

   procedure Sort_Mode_Label_Into
      (Context : Humanize.Contexts.Context;
       Mode    : Sort_Mode;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Sort_Mode_Label (Context, Mode), Target, Written, Status);
   end Sort_Mode_Label_Into;

   procedure Suggestion_Label_Into
      (Context : Humanize.Contexts.Context;
       Query   : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Suggestion_Label (Context, Query), Target, Written, Status);
   end Suggestion_Label_Into;

end Humanize.Search.Localized;
