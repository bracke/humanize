separate (Humanize.Parsing.Implementation.Color_Text_Helpers)
function Parse_Color_Accessibility_Summary
     (Text : String)
      return Color_Accessibility_Parse_Result
   is
      Item : constant String := Trim (Text);
      First_Sep : constant Natural := Find_Substring (Item, "; ");
      Rest : constant String :=
        (if First_Sep = 0 then "" else Item (First_Sep + 2 .. Item'Last));
      Second_Sep : constant Natural := Find_Substring (Rest, "; ");
      Ratio : Long_Float;
      Level_Buffer : String (1 .. 32);
      Level_Length : Natural;
      APCA : APCA_Label_Parse_Result;
      CVD : Color_Vision_Deficiency_Parse_Result;
begin
      if First_Sep = 0 or else Second_Sep = 0
        or else not Parse_Contrast_Label
          (Item (Item'First .. First_Sep - 1),
           Ratio, Level_Buffer, Level_Length)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      APCA := Parse_APCA_Contrast_Label (Rest (Rest'First .. Second_Sep - 1));
      CVD := Parse_Color_Vision_Deficiency_Label
        (Rest (Second_Sep + 2 .. Rest'Last));
      if APCA.Status /= Humanize.Status.Ok then
         return (Status => APCA.Status, Error => APCA.Error, others => <>);
      elsif CVD.Status /= Humanize.Status.Ok then
         return (Status => CVD.Status, Error => CVD.Error, others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Contrast_Ratio => Ratio,
         Contrast_Level => Level_Buffer,
         Contrast_Level_Length => Level_Length,
         APCA => APCA,
         CVD => CVD,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Color_Accessibility_Summary;
