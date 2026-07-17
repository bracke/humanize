separate (Humanize.Strings.Support.Backend)
function Generic_Range_Label
     (Low     : String;
      High    : String;
      Options : Generic_Range_Options)
      return Humanize.Status.Text_Result
   is
      L : constant String := Result_Text (Squish (Low));
      H : constant String := Result_Text (Squish (High));
      U : constant String := Unit_Text (Options);
      Sep : constant String := " " & String'(1 => Options.Separator) & " ";
begin
      if Options.Low_Boundary = Open_Boundary or else L'Length = 0 then
         if H'Length = 0 then
            return Ok_Text ("any value" & U);
         elsif Options.High_Boundary = Exclusive_Boundary then
            return Ok_Text ("less than " & H & U);
         else
            return Ok_Text ("up to " & H & U);
         end if;
      elsif Options.High_Boundary = Open_Boundary or else H'Length = 0 then
         if Options.Low_Boundary = Exclusive_Boundary then
            return Ok_Text ("more than " & L & U);
         else
            return Ok_Text ("at least " & L & U);
         end if;
      elsif Options.Low_Boundary = Exclusive_Boundary
        or else Options.High_Boundary = Exclusive_Boundary
      then
         return Ok_Text (L & Sep & H & U & " ("
            & (if Options.Low_Boundary = Inclusive_Boundary then "inclusive"
               else "exclusive")
            & " low, "
            & (if Options.High_Boundary = Inclusive_Boundary then "inclusive"
               else "exclusive")
            & " high)");
      else
         return Ok_Text (L & Sep & H & U);
      end if;
end Generic_Range_Label;
