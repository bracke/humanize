separate (Humanize.Parsing.Implementation.Domain_Label_Text_Helpers)
function Parse_Cache_Summary
     (Text : String)
      return Cache_Summary_Parse_Result
   is
      Item : constant String := Trim (Text);
      Hits_Mark : constant String := "cache: ";
      Misses_Mark : constant String := " hits, ";
      Rate_Mark : constant String := " misses, ";
      End_Mark : constant String := "% hit rate";
      A : constant Natural := Find_Substring (Item, Misses_Mark);
      B : constant Natural := Find_Substring (Item, Rate_Mark);
      C : constant Natural := Find_Substring (Item, End_Mark);
      Hits : Natural;
      Misses : Natural;
      Rate : Natural;
begin
      if Item = "cache: no requests" then
         return
           (Status => Humanize.Status.Ok,
            Empty => True,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif not Starts_With (Item, Hits_Mark)
        or else A = 0 or else B = 0 or else C = 0
        or else not Parse_Natural_Field
          (Item (Item'First + Hits_Mark'Length .. A - 1), Hits)
        or else not Parse_Natural_Field
          (Item (A + Misses_Mark'Length .. B - 1), Misses)
        or else not Parse_Natural_Field
          (Item (B + Rate_Mark'Length .. C - 1), Rate)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Hits => Hits,
         Misses => Misses,
         Hit_Rate => Rate,
         Empty => False,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
end Parse_Cache_Summary;
