separate (Humanize.Tests.Compatibility)
   procedure Test_Common_Phrases_Summaries_And_Comparisons
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Check
        (Humanize.Phrases.Status_Phrase (Support.En, Humanize.Phrases.Loading),
         "loading",
         "status phrase");
      Check
        (Humanize.Phrases.Domain_Summary
           (Support.En, Humanize.Phrases.Job_Domain,
            Humanize.Phrases.Summary_Running, 3, 10, 1, "task", "tasks"),
         "job running: 3 of 10 tasks complete, 1 failed",
         "domain summary");
      Check
        (Humanize.Phrases.Cache_Summary (Support.En, 8, 2),
         "cache: 8 hits, 2 misses, 80% hit rate",
         "cache summary");
      Check
        (Humanize.Phrases.File_Size_Comparison
           (Support.En, 3_900_000, 1_600_000, "file A", "file B",
            Humanize.Bytes.Decimal_Byte_Options),
         "file A is 2.3 MB larger than file B",
         "file size comparison");
      Check
        (Humanize.Phrases.Date_Comparison
           (Support.En,
            (Year => 2026, Month => 3, Day => 18, others => 0),
            (Year => 2026, Month => 3, Day => 21, others => 0),
            "updated", "release"),
         "updated is 3 days before release",
         "date comparison");
      Check
        (Humanize.Phrases.Percent_Comparison
           (Support.En, 88.0, 100.0, "score", "baseline"),
         "score is 12% lower than baseline",
         "percent comparison");
      Check
        (Humanize.Colors.Color_Summary
           ((Red => 16#33#, Green => 16#66#, Blue => 16#99#)),
         "#336699 rgb(51, 102, 153)",
         "color summary");
      Check
        (Humanize.Colors.Contrast_Label
           ((Red => 0, Green => 0, Blue => 0),
            (Red => 255, Green => 255, Blue => 255)),
         "21:1 enhanced contrast",
         "contrast summary");
   end Test_Common_Phrases_Summaries_And_Comparisons;
