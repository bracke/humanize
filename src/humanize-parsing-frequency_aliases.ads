with Humanize.Frequencies;

private package Humanize.Parsing.Frequency_Aliases is
   function Known_Count_Alias
     (Text  : String;
      Count : out Humanize.Frequencies.Occurrence_Count)
      return Boolean;

   function Is_Count_Unit (Unit : String) return Boolean;
end Humanize.Parsing.Frequency_Aliases;
