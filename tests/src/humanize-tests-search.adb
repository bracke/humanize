with AUnit.Assertions;

with Humanize.Search;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Search is
   use Humanize.Search;
   use Humanize.Status;

   procedure Check
     (Result   : Text_Result;
      Expected : String;
      Message  : String)
   is
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Test_State_Filter_And_Sort_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Check (Search_State_Label (Idle_Search), "search idle", "idle search");
      Check (Search_State_Label (Searching_Search), "searching", "searching");
      Check
        (Search_State_Label (Empty_Search),
         "no search results",
         "empty search");
      Check
        (Filter_State_Label (Active_Filter),
         "active filter",
         "active filter state");
      Check
        (Filter_State_Label (Excluded_Filter),
         "excluded filter",
         "excluded filter state");
      Check (Sort_Mode_Label (Relevance_Sort), "relevance", "relevance sort");
      Check
        (Sort_Mode_Label (Newest_First_Sort),
         "newest first",
         "newest sort");
      Check (Sort_Label (Descending_Sort), "sort by descending", "sort label");
   end Test_State_Filter_And_Sort_Labels;

   procedure Test_Query_And_Result_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check
        (Search_Query_Label (" billing "),
         "search for ""billing""",
         "search query");
      Check (Search_Result_Count_Label (0), "no results", "zero results");
      Check (Search_Result_Count_Label (1), "1 result", "one result");
      Check (Search_Result_Count_Label (5), "5 results", "many results");
      Check
        (Search_Result_Summary_Label ("billing", 3),
         "results for ""billing"": 3 results",
         "query summary");
      Check
        (Search_Result_Summary_Label ("billing", 0),
         "results for ""billing"": no results",
         "empty query summary");
      Check (No_Results_Label, "no results", "no results");
      Check
        (No_Results_Label ("billing"),
         "no results for ""billing""",
         "no results query");

      Invalid := Search_Query_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid search query",
         "empty query rejected");
      Invalid := Search_Result_Summary_Label (" ", 1);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid search query",
         "empty summary query rejected");
   end Test_Query_And_Result_Labels;

   procedure Test_Filter_Facet_And_Scope_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check
        (Active_Filter_Count_Label (0),
         "no active filters",
         "no active filters");
      Check
        (Active_Filter_Count_Label (2),
         "2 active filters",
         "active filters");
      Check
        (Filter_Label ("status", "open", Active_Filter),
         "status: open active filter",
         "filter value");
      Check
        (Filter_Label ("archived", State => Excluded_Filter),
         "archived excluded filter",
         "excluded filter");
      Check (Facet_Label ("status", 4), "status facet, 4 options", "facet");
      Check
        (Facet_Value_Label ("open", 3, Selected => True),
         "open, 3 results, selected",
         "selected facet value");
      Check
        (Facet_Value_Label ("closed", 0),
         "closed, no results",
         "empty facet value");
      Check
        (Search_Scope_Label ("docs", 5),
         "docs scope, 5 results",
         "search scope");

      Invalid := Filter_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid filter name",
         "empty filter rejected");
      Invalid := Facet_Label (" ", 1);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid facet name",
         "empty facet rejected");
      Invalid := Facet_Value_Label (" ", 1);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid facet value",
         "empty facet value rejected");
      Invalid := Search_Scope_Label (" ", 1);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid search scope",
         "empty scope rejected");
   end Test_Filter_Facet_And_Scope_Labels;

   procedure Test_Action_And_Suggestion_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check (Clear_Filters_Label, "clear filters", "clear filters");
      Check
        (Clear_Filters_Label (1),
         "clear active filter",
         "clear one filter");
      Check
        (Clear_Filters_Label (3),
         "clear 3 active filters",
         "clear many filters");
      Check
        (Suggestion_Label ("billing"),
         "did you mean ""billing""?",
         "suggestion");
      Check
        (Recent_Search_Label ("billing"),
         "recent search: ""billing""",
         "recent search");
      Check
        (Saved_Search_Label ("open bugs"),
         "saved search: open bugs",
         "saved search");
      Check
        (Saved_Search_Label ("open bugs", 7),
         "saved search: open bugs, 7 results",
         "saved search count");
      Check
        (Search_History_Count_Label (0),
         "no recent searches",
         "empty search history");
      Check
        (Search_History_Count_Label (2),
         "2 recent searches",
         "search history count");

      Invalid := Suggestion_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid search suggestion",
         "empty suggestion rejected");
      Invalid := Recent_Search_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid recent search",
         "empty recent search rejected");
      Invalid := Saved_Search_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid saved search",
         "empty saved search rejected");
   end Test_Action_And_Suggestion_Labels;

   procedure Test_Bounded_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Exact  : String (1 .. 40);
      Tiny   : String (1 .. 10);
      Offset : String (2 .. 12);
      Written : Natural;
      Code : Status_Code;
   begin
      Search_Result_Summary_Label_Into
        ("billing", 3, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 32
         and then Exact (1 .. Written) = "results for ""billing"": 3 results",
         "summary bounded exact text");

      Filter_Label_Into
        ("status", Tiny, Written, Code, "open", Active_Filter);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 10
         and then Tiny = "status: op",
         "filter bounded overflow prefix");

      Search_State_Label_Into (Searching_Search, Offset, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "search bounded rejects non-1-based buffers");

      Search_Query_Label_Into (" ", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "query bounded returns validation status");

      Facet_Value_Label_Into ("open", 3, Exact, Written, Code, True);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 25
         and then Exact (1 .. Written) = "open, 3 results, selected",
         "facet value bounded exact text");

      Suggestion_Label_Into ("billing", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 23
         and then Exact (1 .. Written) = "did you mean ""billing""?",
         "suggestion bounded exact text");

      Saved_Search_Label_Into ("open bugs", Exact, Written, Code, 7);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 34
         and then Exact (1 .. Written) = "saved search: open bugs, 7 results",
         "saved search bounded exact text");
   end Test_Bounded_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize search/filter tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_State_Filter_And_Sort_Labels'Access,
        "state filter and sort labels");
      Register_Routine (T, Test_Query_And_Result_Labels'Access,
        "query and result labels");
      Register_Routine (T, Test_Filter_Facet_And_Scope_Labels'Access,
        "filter facet and scope labels");
      Register_Routine (T, Test_Action_And_Suggestion_Labels'Access,
        "action and suggestion labels");
      Register_Routine (T, Test_Bounded_Labels'Access,
        "bounded labels");
   end Register_Tests;

end Humanize.Tests.Search;
