separate (Humanize.Tests.Rendering)
   procedure Test_Lists_Frequencies_Rates
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Items : constant Humanize.Lists.Text_List :=
        [To_Unbounded_String ("alpha"),
         To_Unbounded_String ("beta"),
         To_Unbounded_String ("gamma")];
      Joined : constant Text_Result := Humanize.Lists.Format (Support.En, Items);
      Oxford : constant Text_Result :=
        Humanize.Lists.Format
          (Support.En, Items,
           (Style => Humanize.Lists.Conjunction, Oxford_Comma => True));
      Choice : constant Text_Result :=
        Humanize.Lists.Format
          (Support.En, Items,
           (Style => Humanize.Lists.Disjunction, Oxford_Comma => False));
      Count : constant Text_Result :=
        Humanize.Lists.Count (Support.En, 0, "item");
      Article_Count : constant Text_Result :=
        Humanize.Lists.Counted_Noun
          (Support.En, 1, "file", Options =>
             (Number_Style => Humanize.Lists.Article_Count,
              Zero_Style => Humanize.Lists.No_Zero,
              Include_Noun => True,
              Compact_At => 1_000,
              Prefer_Article => False));
      Article_Vowel : constant Text_Result :=
        Humanize.Lists.Counted_Noun
          (Support.En, 1, "item", Options =>
             (Number_Style => Humanize.Lists.Article_Count,
              Zero_Style => Humanize.Lists.No_Zero,
              Include_Noun => True,
              Compact_At => 1_000,
              Prefer_Article => False));
      Word_Count : constant Text_Result :=
        Humanize.Lists.Counted_Noun
          (Support.En, 5, "box", Options =>
             (Number_Style => Humanize.Lists.Word_Count,
              Zero_Style => Humanize.Lists.No_Zero,
              Include_Noun => True,
              Compact_At => 1_000,
              Prefer_Article => False));
      Compact_Count : constant Text_Result :=
        Humanize.Lists.Counted_Noun
          (Support.En, 1_250, "file", Options =>
             (Number_Style => Humanize.Lists.Compact_Count,
              Zero_Style => Humanize.Lists.No_Zero,
              Include_Noun => True,
              Compact_At => 1_000,
              Prefer_Article => False));
      Zero_Word_Count : constant Text_Result :=
        Humanize.Lists.Counted_Noun
          (Support.En, 0, "entry", Options =>
             (Number_Style => Humanize.Lists.Word_Count,
              Zero_Style => Humanize.Lists.Word_Zero,
              Include_Noun => True,
              Compact_At => 1_000,
              Prefer_Article => False));
      Irregular_Count : constant Text_Result :=
        Humanize.Lists.Counted_Noun (Support.En, 2, "person", "people");
      Default_Plural_Count : constant Text_Result :=
        Humanize.Lists.Counted_Noun (Support.En, 2, "category");
      Count_Only : constant Text_Result :=
        Humanize.Lists.Counted_Noun
          (Support.En, 3, "file", Options =>
             (Number_Style => Humanize.Lists.Numeric_Count,
              Zero_Style => Humanize.Lists.No_Zero,
              Include_Noun => False,
              Compact_At => 1_000,
              Prefer_Article => False));
      Source_Label : constant Text_Result :=
        Humanize.Lists.Counted_Noun_Source_Label
          (Humanize.Lists.Counted_Noun_Source (2, "person", "people"));
      Selected : constant Text_Result :=
        Humanize.Lists.Selection_Count (Support.En, 3, 5, "item");
      Remaining : constant Text_Result :=
        Humanize.Lists.Remaining_Count (Support.En, 2, "item");
      Position : constant Text_Result :=
        Humanize.Lists.Position_Count (Support.En, 1, 5);
      All_Items : constant Text_Result :=
        Humanize.Lists.All_Count (Support.En, 5, "item");
      Result_Count : constant Text_Result :=
        Humanize.Lists.Result_Count (Support.En, 24);
      Showing : constant Text_Result :=
        Humanize.Lists.Showing_Count (Support.En, 20, 153);
      Page : constant Text_Result :=
        Humanize.Lists.Page_Count (Support.En, 2, 8);
      More : constant Text_Result :=
        Humanize.Lists.More_Count (Support.En, 3, 4);
      Others_Text : constant Text_Result :=
        Humanize.Lists.Others_Count (Support.En, "Ada", 4);
      Selection_Summary : constant Text_Result :=
        Humanize.Lists.Selection_Summary (Support.En, 0, 5, "item");
      Filtered : constant Text_Result :=
        Humanize.Lists.Filtered_Count (Support.En, 3, 10);
      Filtered_None : constant Text_Result :=
        Humanize.Lists.Filtered_Count (Support.En, 0, 10, "item", "items");
      Filtered_All : constant Text_Result :=
        Humanize.Lists.Filtered_Count (Support.En, 10, 10, "item", "items");
      Page_Range : constant Text_Result :=
        Humanize.Lists.Pagination_Range (Support.En, 21, 40, 153);
      Screen_Display : constant Text_Result :=
        Humanize.Lists.Collection_Display
          (Support.En, 3, 4, Options =>
             (Style => Humanize.Lists.Screen_Reader_Display));
      Collection_Count : constant Text_Result :=
        Humanize.Lists.Collection_Count_Label (Support.En, 0);
      Collection_Summary : constant Text_Result :=
        Humanize.Lists.Collection_Summary (Support.En, 3, 10);
      Compact_Collection : constant Text_Result :=
        Humanize.Lists.Collection_Summary
          (Support.En, 3, 10,
           Options =>
             (Style => Humanize.Lists.Collection_Compact_Summary,
              Include_Total => True,
              Include_Hidden => True));
      Accessible_Collection : constant Text_Result :=
        Humanize.Lists.Collection_Summary
          (Support.En, 3, 10,
           Options =>
             (Style => Humanize.Lists.Collection_Accessible_Summary,
              Include_Total => True,
              Include_Hidden => True));
      Empty_Collection : constant Text_Result :=
        Humanize.Lists.Empty_Collection_Label (Support.En, "message", "messages");
      Invalid_Collection : constant Text_Result :=
        Humanize.Lists.Collection_Summary (Support.En, 11, 10);
      Page_Position : constant Text_Result :=
        Humanize.Lists.Page_Position_Label (Support.En, 2, 8);
      Invalid_Page_Position : constant Text_Result :=
        Humanize.Lists.Page_Position_Label (Support.En, 9, 8);
      Page_Range_Label : constant Text_Result :=
        Humanize.Lists.Page_Range_Label (Support.En, 21, 40, 153);
      Invalid_Page_Range : constant Text_Result :=
        Humanize.Lists.Page_Range_Label (Support.En, 40, 21, 153);
      Page_Nav_First : constant Text_Result :=
        Humanize.Lists.Page_Navigation_Label (Support.En, 1, 8);
      Page_Nav_Middle : constant Text_Result :=
        Humanize.Lists.Page_Navigation_Label (Support.En, 4, 8);
      Page_Nav_Last : constant Text_Result :=
        Humanize.Lists.Page_Navigation_Label (Support.En, 8, 8);
      Page_Nav_Only : constant Text_Result :=
        Humanize.Lists.Page_Navigation_Label (Support.En, 1, 1);
      Page_Size : constant Text_Result :=
        Humanize.Lists.Page_Size_Label (Support.En, 50);
      Limited_List : constant Text_Result :=
        Humanize.Lists.Format_Limited (Support.En, Items, 2);
      Validation_Issues : constant Humanize.Lists.Text_List :=
        [To_Unbounded_String ("email is invalid"),
         To_Unbounded_String ("password is too short"),
         To_Unbounded_String ("name is required")];
      Validation : constant Text_Result :=
        Humanize.Lists.Validation_Summary
          (Support.En, Validation_Issues,
           (Severity => Humanize.Lists.Validation_Error,
            Style => Humanize.Lists.Validation_Detailed,
            Max_Details => 2,
            Include_Ok => True,
            Detail_List_Options => Humanize.Lists.Default_List_Options));
      Validation_Headline : constant Text_Result :=
        Humanize.Lists.Validation_Summary
          (Support.En, Validation_Issues,
           (Severity => Humanize.Lists.Validation_Error,
            Style => Humanize.Lists.Validation_Headline,
            Max_Details => 3,
            Include_Ok => True,
            Detail_List_Options => Humanize.Lists.Default_List_Options));
      Validation_Ok : constant Text_Result :=
        Humanize.Lists.Validation_Count (Support.En, 0);
      Validation_Suppressed : constant Text_Result :=
        Humanize.Lists.Validation_Count
          (Support.En, 0,
           (Severity => Humanize.Lists.Validation_Error,
            Style => Humanize.Lists.Validation_Detailed,
            Max_Details => 3,
            Include_Ok => False,
            Detail_List_Options => Humanize.Lists.Default_List_Options));
      Validation_Warnings : constant Text_Result :=
        Humanize.Lists.Validation_Count
          (Support.En, 2,
           (Severity => Humanize.Lists.Validation_Warning,
            Style => Humanize.Lists.Validation_Detailed,
            Max_Details => 3,
            Include_Ok => True,
            Detail_List_Options => Humanize.Lists.Default_List_Options));
      Validation_Info : constant Text_Result :=
        Humanize.Lists.Validation_Count
          (Support.En, 1,
           (Severity => Humanize.Lists.Validation_Info,
            Style => Humanize.Lists.Validation_Detailed,
            Max_Details => 3,
            Include_Ok => True,
            Detail_List_Options => Humanize.Lists.Default_List_Options));
      Field_Issues : constant Humanize.Lists.Text_List :=
        [To_Unbounded_String ("is invalid"),
         To_Unbounded_String ("is already used")];
      Field_Problems : constant Text_Result :=
        Humanize.Lists.Field_Problem_Summary
          (Support.En, "email", Field_Issues);
      Never  : constant Text_Result := Humanize.Frequencies.Times (Support.En, 0);
      Once   : constant Text_Result := Humanize.Frequencies.Times (Support.En, 1);
      Many   : constant Text_Result := Humanize.Frequencies.Times (Support.En, 4);
      Custom : constant Text_Result :=
        Humanize.Frequencies.Times (Support.En, 4, "heartbeat", "heartbeats");
      Pace   : constant Text_Result :=
        Humanize.Rates.Pace (Support.En, 4, Humanize.Rates.Per_Week);
      Custom_Pace : constant Text_Result :=
        Humanize.Rates.Pace
          (Support.En, 4, Humanize.Rates.Per_Week, "heartbeat", "heartbeats");
      Less : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.En, 0, Humanize.Rates.Per_Week);
      Less_Custom : constant Text_Result :=
        Humanize.Rates.Pace_Approximate
          (Support.En, 0, Humanize.Rates.Per_Week, "heartbeat", "heartbeats");
      Buffer : String (1 .. 32);
      Validation_Buffer : String (1 .. 80);
      Written : Natural;
      Code : Status_Code;
   begin
      AUnit.Assertions.Assert
        (Joined.Status = Ok and then Support.Text (Joined) = "alpha, beta and gamma",
         "list joins with localized conjunction");
      AUnit.Assertions.Assert
        (Oxford.Status = Ok
         and then Support.Text (Oxford) = "alpha, beta, and gamma",
         "list supports Oxford comma");
      AUnit.Assertions.Assert
        (Choice.Status = Ok
         and then Support.Text (Choice) = "alpha, beta or gamma",
         "list supports disjunction");
      AUnit.Assertions.Assert
        (Count.Status = Ok and then Support.Text (Count) = "no items",
         "list count phrase");
      AUnit.Assertions.Assert
        (Article_Count.Status = Ok and then Support.Text (Article_Count) = "a file",
         "counted noun supports article style");
      AUnit.Assertions.Assert
        (Article_Vowel.Status = Ok and then Support.Text (Article_Vowel) = "an item",
         "counted noun supports vowel article");
      AUnit.Assertions.Assert
        (Word_Count.Status = Ok and then Support.Text (Word_Count) = "five boxes",
         "counted noun supports word counts and es plural");
      AUnit.Assertions.Assert
        (Compact_Count.Status = Ok
         and then Support.Text (Compact_Count) = "1.3K files",
         "counted noun supports compact counts");
      AUnit.Assertions.Assert
        (Zero_Word_Count.Status = Ok
         and then Support.Text (Zero_Word_Count) = "zero entries",
         "counted noun supports explicit zero word");
      AUnit.Assertions.Assert
        (Irregular_Count.Status = Ok
         and then Support.Text (Irregular_Count) = "2 people",
         "counted noun supports irregular plural");
      AUnit.Assertions.Assert
        (Default_Plural_Count.Status = Ok
         and then Support.Text (Default_Plural_Count) = "2 categories",
         "counted noun supports default y plural");
      AUnit.Assertions.Assert
        (Count_Only.Status = Ok and then Support.Text (Count_Only) = "3",
         "counted noun can omit noun");
      AUnit.Assertions.Assert
        (Source_Label.Status = Ok
         and then Support.Text (Source_Label) = "irregular-noun",
         "counted noun exposes noun source metadata");
      Humanize.Lists.Counted_Noun_Into
        (Support.En, 1_250, "file", Buffer, Written, Code,
         Options =>
           (Number_Style => Humanize.Lists.Compact_Count,
            Zero_Style => Humanize.Lists.No_Zero,
            Include_Noun => True,
            Compact_At => 1_000,
            Prefer_Article => False));
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "1.3K files",
         "bounded counted noun");
      AUnit.Assertions.Assert
        (Selected.Status = Ok
         and then Support.Text (Selected) = "3 of 5 items selected",
         "selection count phrase");
      AUnit.Assertions.Assert
        (Remaining.Status = Ok
         and then Support.Text (Remaining) = "2 items remaining",
         "remaining count phrase");
      AUnit.Assertions.Assert
        (Position.Status = Ok and then Support.Text (Position) = "1 of 5",
         "position count phrase");
      AUnit.Assertions.Assert
        (All_Items.Status = Ok and then Support.Text (All_Items) = "all 5 items",
         "all count phrase");
      AUnit.Assertions.Assert
        (Result_Count.Status = Ok
         and then Support.Text (Result_Count) = "24 results",
         "result count phrase");
      AUnit.Assertions.Assert
        (Showing.Status = Ok
         and then Support.Text (Showing) = "showing 20 of 153 results",
         "showing count phrase");
      AUnit.Assertions.Assert
        (Page.Status = Ok and then Support.Text (Page) = "page 2 of 8",
         "page count phrase");
      AUnit.Assertions.Assert
        (More.Status = Ok and then Support.Text (More) = "3 shown, +4 more",
         "more-count phrase");
      AUnit.Assertions.Assert
        (Others_Text.Status = Ok
         and then Support.Text (Others_Text) = "Ada and 4 others",
         "others-count phrase");
      AUnit.Assertions.Assert
        (Selection_Summary.Status = Ok
         and then Support.Text (Selection_Summary) = "no items selected",
         "selection summary phrase");
      AUnit.Assertions.Assert
        (Filtered.Status = Ok
         and then Support.Text (Filtered) = "3 of 10 results match",
         "filtered count partial phrase");
      AUnit.Assertions.Assert
        (Filtered_None.Status = Ok
         and then Support.Text (Filtered_None) = "no items match",
         "filtered count none phrase");
      AUnit.Assertions.Assert
        (Filtered_All.Status = Ok
         and then Support.Text (Filtered_All) = "all 10 items match",
         "filtered count all phrase");
      Humanize.Lists.Filtered_Count_Into
        (Support.En, 3, 10, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "3 of 10 results match",
         "bounded filtered count");
      AUnit.Assertions.Assert
        (Page_Range.Status = Ok
         and then Support.Text (Page_Range) = "21-40 of 153 results",
         "pagination range phrase");
      AUnit.Assertions.Assert
        (Screen_Display.Status = Ok
         and then Support.Text (Screen_Display)
           = "3 items shown, 4 items available",
         "collection display screen-reader phrase");
      AUnit.Assertions.Assert
        (Collection_Count.Status = Ok
         and then Support.Text (Collection_Count) = "no items",
         "collection count label");
      AUnit.Assertions.Assert
        (Collection_Summary.Status = Ok
         and then Support.Text (Collection_Summary)
           = "showing 3 of 10 items, 7 hidden",
         "collection summary detailed phrase");
      AUnit.Assertions.Assert
        (Compact_Collection.Status = Ok
         and then Support.Text (Compact_Collection) = "3/10",
         "collection summary compact phrase");
      AUnit.Assertions.Assert
        (Accessible_Collection.Status = Ok
         and then Support.Text (Accessible_Collection)
           = "3 items visible out of 10 items",
         "collection summary accessible phrase");
      AUnit.Assertions.Assert
        (Empty_Collection.Status = Ok
         and then Support.Text (Empty_Collection) = "no messages",
         "empty collection label");
      AUnit.Assertions.Assert
        (Invalid_Collection.Status = Invalid_Argument
         and then Support.Text (Invalid_Collection) =
           "invalid collection summary",
         "invalid collection summary");
      AUnit.Assertions.Assert
        (Page_Position.Status = Ok
         and then Support.Text (Page_Position) = "page 2 of 8",
         "validated page position");
      AUnit.Assertions.Assert
        (Invalid_Page_Position.Status = Invalid_Argument
         and then Support.Text (Invalid_Page_Position) =
           "invalid page position",
         "invalid page position");
      AUnit.Assertions.Assert
        (Page_Range_Label.Status = Ok
         and then Support.Text (Page_Range_Label) =
           "21-40 of 153 results",
         "validated page range");
      AUnit.Assertions.Assert
        (Invalid_Page_Range.Status = Invalid_Argument
         and then Support.Text (Invalid_Page_Range) = "invalid page range",
         "invalid page range");
      AUnit.Assertions.Assert
        (Page_Nav_First.Status = Ok
         and then Support.Text (Page_Nav_First) =
           "first page, next available",
         "page navigation first");
      AUnit.Assertions.Assert
        (Page_Nav_Middle.Status = Ok
         and then Support.Text (Page_Nav_Middle) =
           "previous and next available",
         "page navigation middle");
      AUnit.Assertions.Assert
        (Page_Nav_Last.Status = Ok
         and then Support.Text (Page_Nav_Last) =
           "last page, previous available",
         "page navigation last");
      AUnit.Assertions.Assert
        (Page_Nav_Only.Status = Ok
         and then Support.Text (Page_Nav_Only) = "only page",
         "page navigation only");
      AUnit.Assertions.Assert
        (Page_Size.Status = Ok
         and then Support.Text (Page_Size) = "50 results per page",
         "page size label");
      Humanize.Lists.Collection_Summary_Into
        (Support.En, 3, 10, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 31
         and then Buffer (1 .. Written) = "showing 3 of 10 items, 7 hidden",
         "bounded collection summary exact");
      Humanize.Lists.Page_Position_Label_Into
        (Support.En, 9, 8, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "bounded invalid page position");
      AUnit.Assertions.Assert
        (Limited_List.Status = Ok
         and then Support.Text (Limited_List) = "alpha, beta and 1 other",
         "limited list shows hidden count");
      AUnit.Assertions.Assert
        (Validation.Status = Ok
         and then Support.Text (Validation)
           = "3 errors: email is invalid, password is too short and 1 other",
         "validation summary limits details");
      AUnit.Assertions.Assert
        (Validation_Headline.Status = Ok
         and then Support.Text (Validation_Headline) = "3 errors",
         "validation summary supports headline-only counts");
      AUnit.Assertions.Assert
        (Validation_Ok.Status = Ok
         and then Support.Text (Validation_Ok) = "no errors",
         "validation count supports empty ok text");
      AUnit.Assertions.Assert
        (Validation_Suppressed.Status = Ok
         and then Support.Text (Validation_Suppressed) = "",
         "validation count can suppress empty ok text");
      AUnit.Assertions.Assert
        (Validation_Warnings.Status = Ok
         and then Support.Text (Validation_Warnings) = "2 warnings",
         "validation count supports warning severity");
      AUnit.Assertions.Assert
        (Validation_Info.Status = Ok
         and then Support.Text (Validation_Info) = "1 notice",
         "validation count supports info severity");
      AUnit.Assertions.Assert
        (Field_Problems.Status = Ok
         and then Support.Text (Field_Problems)
           = "email: 2 errors: is invalid and is already used",
         "field problem summary prefixes validation details");
      Humanize.Lists.Validation_Summary_Into
        (Support.En, Field_Issues, Validation_Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok
         and then Validation_Buffer (1 .. Written)
           = "2 errors: is invalid and is already used",
         "bounded validation summary");
      AUnit.Assertions.Assert
        (Never.Status = Ok and then Support.Text (Never) = "never",
         "frequency never");
      AUnit.Assertions.Assert
        (Once.Status = Ok and then Support.Text (Once) = "once",
         "frequency once");
      AUnit.Assertions.Assert
        (Many.Status = Ok and then Support.Text (Many) = "4 times",
         "frequency many");
      AUnit.Assertions.Assert
        (Custom.Status = Ok and then Support.Text (Custom) = "4 heartbeats",
         "frequency custom noun");
      AUnit.Assertions.Assert
        (Pace.Status = Ok
         and then Support.Text (Pace) = "approximately 4 times per week",
         "rate pace per week");
      AUnit.Assertions.Assert
        (Custom_Pace.Status = Ok
         and then Support.Text (Custom_Pace)
           = "approximately 4 heartbeats per week",
         "rate custom noun per week");
      AUnit.Assertions.Assert
        (Less.Status = Ok
         and then Support.Text (Less) = "less than once per week",
         "rate less-than threshold");
      AUnit.Assertions.Assert
        (Less_Custom.Status = Ok
         and then Support.Text (Less_Custom)
           = "less than once heartbeat per week",
         "rate less-than custom noun threshold");
   end Test_Lists_Frequencies_Rates;
