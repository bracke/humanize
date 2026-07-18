separate (Humanize.Tests.Compatibility)
   procedure Test_Common_Bytes_Numbers_Units
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Check
        (Humanize.Bytes.Format (Support.En, 1_536),
         "1.5 KiB",
         "binary byte size");
      Check
        (Humanize.Bytes.Format
           (Support.En, 1_500, Humanize.Bytes.Decimal_Byte_Options),
         "1.5 kB",
         "decimal byte size");
      Check
        (Humanize.Bytes.File_Size_Summary (Support.En, 3, 1_536),
         "3 files, 1.5 KiB",
         "file size summary");
      Check
        (Humanize.Numbers.Ordinal (Support.En, 21),
         "21st",
         "ordinal");
      Check
        (Humanize.Numbers.Compact (Support.En, 1_200_000),
         "1.2M",
         "compact number");
      Check
        (Humanize.Numbers.Percent (Support.En, 12.5),
         "12.5%",
         "percent number");
      Check
        (Humanize.Numbers.Between (Support.En, 3, 7),
         "between 3 and 7",
         "between range");
      Check
        (Humanize.Numbers.Qualified_Range (Support.En, 3, 7),
         "3 to 7 inclusive",
         "qualified range");
      Check
        (Humanize.Numbers.Ratio_Per (Support.En, 2, 1, "error", "file"),
         "2 errors per file",
         "ratio with nouns");
      Check
        (Humanize.Numbers.Percent_Change (Support.En, -12.5),
         "down 12.5%",
         "percent change");
      Check
        (Humanize.Units.Format (Support.En, 5, Humanize.Units.Kilometer),
         "5 kilometers",
         "unit quantity");
      Check
        (Humanize.Units.Format_Aspect_Ratio (Support.En, 1_920, 1_080),
         "16:9",
         "aspect ratio");
   end Test_Common_Bytes_Numbers_Units;
