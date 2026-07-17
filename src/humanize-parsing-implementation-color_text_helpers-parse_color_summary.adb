separate (Humanize.Parsing.Implementation.Color_Text_Helpers)
function Parse_Color_Summary
     (Text : String)
      return Color_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Space : constant Natural := Find_Substring (Item, " ");
      RGB_At : constant Natural := Find_Substring (Item, "rgb(");
      Hex_Color : Humanize.Colors.RGB_Color;
      RGB : Color_Label_Parse_Result;
      Code : Humanize.Status.Status_Code;
begin
      if RGB_At > Item'First and then (Space = 0 or else RGB_At < Space) then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => RGB_At,
            Error => Expected_Separator,
            others => <>);
      end if;

      if Space = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => (if Item'Length = 0 then Text'First else Item'First),
                 Error => Expected_Separator,
                 others => <>);
      end if;

      Code := Humanize.Colors.Parse_Hex_Color (Item (Item'First .. Space - 1), Hex_Color);
      RGB := Parse_RGB_Label (Item (Space + 1 .. Item'Last));
      if Code /= Humanize.Status.Ok then
         return
           (Status => Code,
            Error_Position => Item'First,
            Error => Unsupported_Form,
            others => <>);
      elsif RGB.Status /= Humanize.Status.Ok
        or else RGB.Color /= Hex_Color
      then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position =>
              (if RGB.Error_Position /= 0 then Space + RGB.Error_Position
               else Space + 1),
            Error =>
              (if RGB.Error /= No_Parse_Error then RGB.Error
               else Unsupported_Form),
            others => <>);
      end if;

      return Color_Label_Result (Item, Hex_Color);
end Parse_Color_Summary;
