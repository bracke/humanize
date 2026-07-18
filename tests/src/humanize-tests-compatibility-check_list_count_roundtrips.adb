separate (Humanize.Tests.Compatibility)
   procedure Check_List_Count_Roundtrips is
      Counted_Text : constant String :=
        Rendered
          (Humanize.Lists.Counted_Noun (Support.En, 1_200, "file"),
           "counted noun");
      Counted : constant Humanize.Parsing.Counted_Noun_Parse_Result :=
        Humanize.Parsing.Parse_Counted_Noun (Counted_Text);
      Result_Text : constant String :=
        Rendered
          (Humanize.Lists.Result_Count (Support.En, 24), "result count");
      Results : constant Humanize.Parsing.List_Parse_Result :=
        Humanize.Parsing.Parse_Result_Count (Result_Text);
      Showing_Text : constant String :=
        Rendered
          (Humanize.Lists.Showing_Count (Support.En, 20, 153),
           "showing count");
      Showing : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Showing_Count (Showing_Text);
      Page_Text : constant String :=
        Rendered
          (Humanize.Lists.Page_Count (Support.En, 2, 8), "page count");
      Page : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Page_Count (Page_Text);
   begin
      AUnit.Assertions.Assert
        (Counted.Status = Ok
         and then Counted.Count = 1_200
         and then Counted.Noun (1 .. Counted.Noun_Length) = "files",
         "counted noun roundtrip [" & Counted_Text & "]");
      AUnit.Assertions.Assert
        (Results.Status = Ok and then Results.Count = 24,
         "result count roundtrip [" & Result_Text & "]");
      AUnit.Assertions.Assert
        (Showing.Status = Ok
         and then Showing.Count = 20
         and then Showing.Total = 153,
         "showing count roundtrip [" & Showing_Text & "]");
      AUnit.Assertions.Assert
        (Page.Status = Ok and then Page.Count = 2 and then Page.Total = 8,
         "page count roundtrip [" & Page_Text & "]");
   end Check_List_Count_Roundtrips;
