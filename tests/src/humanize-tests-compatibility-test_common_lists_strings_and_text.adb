separate (Humanize.Tests.Compatibility)
   procedure Test_Common_Lists_Strings_And_Text
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Items : constant Humanize.Lists.Text_List :=
        [To_Unbounded_String ("alpha"),
         To_Unbounded_String ("beta"),
         To_Unbounded_String ("gamma")];
   begin
      Check
        (Humanize.Lists.Format (Support.En, Items),
         "alpha, beta and gamma",
         "list conjunction");
      Check
        (Humanize.Lists.More_Count (Support.En, 3, 4),
         "3 shown, +4 more",
         "more count");
      Check
        (Humanize.Lists.Selection_Summary (Support.En, 3, 5, "item"),
         "3 of 5 items selected",
         "selection summary");
      Check
        (Humanize.Frequencies.Times (Support.En, 4),
         "4 times",
         "frequency times");
      Check
        (Humanize.Rates.Pace_Approximate
           (Support.En, 4, Humanize.Rates.Per_Week),
         "approximately 4 times per week",
         "rate pace");
      Check
        (Humanize.Strings.Truncate ("abcdef", 4),
         "a...",
         "truncate");
      Check
        (Humanize.Strings.Title_Case ("hello world"),
         "Hello World",
         "title case");
      Check
        (Humanize.Strings.Display_Name ("Ada Lovelace", "ada_lovelace"),
         "Ada Lovelace",
         "display name");
      Check
        (Humanize.Strings.Safe_Filename ("Hello, Ada!.txt"),
         "hello-ada.txt",
         "safe filename");
      Check
        (Humanize.Strings.Mask ("secret-token", 4),
         "********oken",
         "mask text");
   end Test_Common_Lists_Strings_And_Text;
