with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.Search is
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
     (Options : Search_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Search_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Search_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Search_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Search_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function State_Text (State : Search_State) return String is
   begin
      case State is
         when Idle_Search      => return "search idle";
         when Searching_Search => return "searching";
         when Complete_Search  => return "search complete";
         when Empty_Search     => return "no search results";
         when Failed_Search    => return "search failed";
      end case;
   end State_Text;

   function Filter_Text (State : Filter_State) return String is
   begin
      case State is
         when Active_Filter   => return "active";
         when Inactive_Filter => return "inactive";
         when Excluded_Filter => return "excluded";
      end case;
   end Filter_Text;

   function Search_State_Suffix (State : Search_State) return String is
   begin
      return State_Text (State);
   end Search_State_Suffix;

   function Filter_State_Suffix (State : Filter_State) return String is
   begin
      return Filter_Text (State);
   end Filter_State_Suffix;

   function Filter_Label_Suffix (State : Filter_State) return String is
   begin
      return Filter_State_Suffix (State) & " filter";
   end Filter_Label_Suffix;

   function Search_State_Metadata
     (State : Search_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Search_Surface, Search_State_Suffix (State));
   end Search_State_Metadata;

   function Filter_State_Metadata
     (State : Filter_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Search_Surface, Filter_State_Suffix (State));
   end Filter_State_Metadata;

   function Sort_Text (Mode : Sort_Mode) return String is
   begin
      case Mode is
         when Relevance_Sort    => return "relevance";
         when Ascending_Sort    => return "ascending";
         when Descending_Sort   => return "descending";
         when Newest_First_Sort => return "newest first";
         when Oldest_First_Sort => return "oldest first";
      end case;
   end Sort_Text;

   function Quoted (Text : String) return String is
   begin
      return """" & Text & """";
   end Quoted;

   function Search_State_Label
     (State : Search_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Search_State_Suffix (State));
   end Search_State_Label;

   function Filter_State_Label
     (State : Filter_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Filter_Label_Suffix (State));
   end Filter_State_Label;

   function Sort_Mode_Label
     (Mode : Sort_Mode)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Sort_Text (Mode));
   end Sort_Mode_Label;

   function Search_Query_Label
     (Query : String)
      return Humanize.Status.Text_Result
   is
      Text : constant String := Clean (Query);
   begin
      if Text'Length = 0 then
         return Invalid_Text ("invalid search query");
      else
         return Ok_Text ("search for " & Quoted (Text));
      end if;
   end Search_Query_Label;

   function Search_Result_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "result", "results"));
   end Search_Result_Count_Label;

   function Search_Result_Summary_Label
     (Query : String;
      Count : Natural)
      return Humanize.Status.Text_Result
   is
      Text : constant String := Clean (Query);
   begin
      if Text'Length = 0 then
         return Invalid_Text ("invalid search query");
      else
         return Ok_Text
           ("results for " & Quoted (Text) & ": "
            & Count_Or_No_Text (Count, "result", "results"));
      end if;
   end Search_Result_Summary_Label;

   function No_Results_Label
     (Query : String := "")
      return Humanize.Status.Text_Result
   is
      Text : constant String := Clean (Query);
   begin
      if Text'Length = 0 then
         return Ok_Text ("no results");
      else
         return Ok_Text ("no results for " & Quoted (Text));
      end if;
   end No_Results_Label;

   function Active_Filter_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Count_Or_No_Text (Count, "active filter", "active filters"));
   end Active_Filter_Count_Label;

   function Filter_Label
     (Name  : String;
      Value : String := "";
      State : Filter_State := Active_Filter)
      return Humanize.Status.Text_Result
   is
      Filter_Name  : constant String := Clean (Name);
      Filter_Value : constant String := Clean (Value);
      Text         : Unbounded_String;
   begin
      if Filter_Name'Length = 0 then
         return Invalid_Text ("invalid filter name");
      end if;

      Text := To_Unbounded_String (Filter_Name);
      if Filter_Value'Length > 0 then
         Append (Text, ": ");
         Append (Text, Filter_Value);
      end if;
      Append (Text, " ");
      Append (Text, Filter_Label_Suffix (State));
      return Ok_Text (To_String (Text));
   end Filter_Label;

   function Filter_Label
     (Name    : String;
      Value   : String;
      State   : Filter_State;
      Options : Search_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Filter_Label (Name, Value, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Filter_State_Metadata (State), Domain_Options (Options));
   end Filter_Label;

   function Parse_Filter_Label
     (Text  : String;
      State : Filter_State)
      return Search_Label_Parse_Result
   is
      Result : Search_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Search_Surface,
         Filter_Label_Suffix (State));
      Result.Metadata := Filter_State_Metadata (State);
      return Result;
   end Parse_Filter_Label;

   function Scan_Filter_Label
     (Text  : String;
      State : Filter_State)
      return Search_Label_Parse_Result
   is
      Result : Search_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Search_Surface,
         Filter_Label_Suffix (State));
      Result.Metadata := Filter_State_Metadata (State);
      return Result;
   end Scan_Filter_Label;

   function Facet_Label
     (Name  : String;
      Count : Natural)
      return Humanize.Status.Text_Result
   is
      Facet : constant String := Clean (Name);
   begin
      if Facet'Length = 0 then
         return Invalid_Text ("invalid facet name");
      else
         return Ok_Text
           (Facet & " facet, " & Count_Text (Count, "option", "options"));
      end if;
   end Facet_Label;

   function Facet_Value_Label
     (Name     : String;
      Count    : Natural;
      Selected : Boolean := False)
      return Humanize.Status.Text_Result
   is
      Value  : constant String := Clean (Name);
      Suffix : constant String := (if Selected then ", selected" else "");
   begin
      if Value'Length = 0 then
         return Invalid_Text ("invalid facet value");
      else
         return Ok_Text
           (Value & ", "
            & Count_Or_No_Text (Count, "result", "results")
            & Suffix);
      end if;
   end Facet_Value_Label;

   function Sort_Label
     (Mode : Sort_Mode)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text ("sort by " & Sort_Text (Mode));
   end Sort_Label;

   function Clear_Filters_Label
     (Count : Natural := 0)
      return Humanize.Status.Text_Result
   is
   begin
      if Count = 0 then
         return Ok_Text ("clear filters");
      elsif Count = 1 then
         return Ok_Text ("clear active filter");
      else
         return Ok_Text ("clear " & Image (Count) & " active filters");
      end if;
   end Clear_Filters_Label;

   function Search_Scope_Label
     (Name  : String;
      Count : Natural)
      return Humanize.Status.Text_Result
   is
      Scope : constant String := Clean (Name);
   begin
      if Scope'Length = 0 then
         return Invalid_Text ("invalid search scope");
      else
         return Ok_Text
           (Scope & " scope, "
            & Count_Or_No_Text (Count, "result", "results"));
      end if;
   end Search_Scope_Label;

   function Suggestion_Label
     (Query : String)
      return Humanize.Status.Text_Result
   is
      Text : constant String := Clean (Query);
   begin
      if Text'Length = 0 then
         return Invalid_Text ("invalid search suggestion");
      else
         return Ok_Text ("did you mean " & Quoted (Text) & "?");
      end if;
   end Suggestion_Label;

   function Recent_Search_Label
     (Query : String)
      return Humanize.Status.Text_Result
   is
      Text : constant String := Clean (Query);
   begin
      if Text'Length = 0 then
         return Invalid_Text ("invalid recent search");
      else
         return Ok_Text ("recent search: " & Quoted (Text));
      end if;
   end Recent_Search_Label;

   function Saved_Search_Label
     (Name  : String;
      Count : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Search_Name : constant String := Clean (Name);
   begin
      if Search_Name'Length = 0 then
         return Invalid_Text ("invalid saved search");
      elsif Count = 0 then
         return Ok_Text ("saved search: " & Search_Name);
      else
         return Ok_Text
           ("saved search: " & Search_Name & ", "
            & Count_Text (Count, "result", "results"));
      end if;
   end Saved_Search_Label;

   function Search_History_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (Count_Or_No_Text (Count, "recent search", "recent searches"));
   end Search_History_Count_Label;

   procedure Search_State_Label_Into
     (State   : Search_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Search_State_Label (State), Target, Written, Status);
   end Search_State_Label_Into;

   procedure Filter_State_Label_Into
     (State   : Filter_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Filter_State_Label (State), Target, Written, Status);
   end Filter_State_Label_Into;

   procedure Sort_Mode_Label_Into
     (Mode    : Sort_Mode;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Sort_Mode_Label (Mode), Target, Written, Status);
   end Sort_Mode_Label_Into;

   procedure Search_Query_Label_Into
     (Query   : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Search_Query_Label (Query), Target, Written, Status);
   end Search_Query_Label_Into;

   procedure Search_Result_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Search_Result_Count_Label (Count), Target, Written, Status);
   end Search_Result_Count_Label_Into;

   procedure Search_Result_Summary_Label_Into
     (Query   : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Search_Result_Summary_Label (Query, Count), Target, Written, Status);
   end Search_Result_Summary_Label_Into;

   procedure No_Results_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Query   : String := "")
   is
   begin
      Copy_Result (No_Results_Label (Query), Target, Written, Status);
   end No_Results_Label_Into;

   procedure Active_Filter_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Active_Filter_Count_Label (Count), Target, Written, Status);
   end Active_Filter_Count_Label_Into;

   procedure Filter_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Value   : String := "";
      State   : Filter_State := Active_Filter)
   is
   begin
      Copy_Result (Filter_Label (Name, Value, State), Target, Written, Status);
   end Filter_Label_Into;

   procedure Filter_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Value   : String;
      State   : Filter_State;
      Options : Search_Label_Options)
   is
   begin
      Copy_Result
        (Filter_Label (Name, Value, State, Options), Target, Written, Status);
   end Filter_Label_Into;

   procedure Facet_Label_Into
     (Name    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Facet_Label (Name, Count), Target, Written, Status);
   end Facet_Label_Into;

   procedure Facet_Value_Label_Into
     (Name     : String;
      Count    : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Selected : Boolean := False)
   is
   begin
      Copy_Result
        (Facet_Value_Label (Name, Count, Selected), Target, Written, Status);
   end Facet_Value_Label_Into;

   procedure Sort_Label_Into
     (Mode    : Sort_Mode;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Sort_Label (Mode), Target, Written, Status);
   end Sort_Label_Into;

   procedure Clear_Filters_Label_Into
     (Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Count   : Natural := 0)
   is
   begin
      Copy_Result (Clear_Filters_Label (Count), Target, Written, Status);
   end Clear_Filters_Label_Into;

   procedure Search_Scope_Label_Into
     (Name    : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Search_Scope_Label (Name, Count), Target, Written, Status);
   end Search_Scope_Label_Into;

   procedure Suggestion_Label_Into
     (Query   : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Suggestion_Label (Query), Target, Written, Status);
   end Suggestion_Label_Into;

   procedure Recent_Search_Label_Into
     (Query   : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Recent_Search_Label (Query), Target, Written, Status);
   end Recent_Search_Label_Into;

   procedure Saved_Search_Label_Into
     (Name    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Count   : Natural := 0)
   is
   begin
      Copy_Result (Saved_Search_Label (Name, Count), Target, Written, Status);
   end Saved_Search_Label_Into;

   procedure Search_History_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Search_History_Count_Label (Count), Target, Written, Status);
   end Search_History_Count_Label_Into;

end Humanize.Search;
