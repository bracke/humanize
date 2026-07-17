separate (Humanize.Parsing.Implementation.Color_Text_Helpers)
function Parse_Contrast_Remediation_Label
     (Text : String)
      return Contrast_Remediation_Parse_Result
   is
      Item : constant String := Trim (Text);
      Low  : constant String := Lower (Item);
      Meets_Prefix : constant String := "current foreground meets ";
      Meets_Mark : constant String := " contrast at ";
      Use_Prefix : constant String := "use ";
      For_Mark : constant String := " for ";
      Contrast_Suffix : constant String := " contrast";
      At_Pos : Natural;
      For_Pos : Natural;
      Ratio : Long_Float;
      Target_Buffer : String (1 .. 48);
      Target_Length : Natural;
      Color : Humanize.Colors.RGB_Color := (others => 0);
      Has_Color : Boolean := False;
begin
      if Starts_With (Low, Meets_Prefix) then
         At_Pos := Find_Substring (Low, Meets_Mark);
         if At_Pos = 0
           or else not Numeric_Value
             (Item (At_Pos + Meets_Mark'Length .. Item'Last - 2), Ratio)
         then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Expected_Number,
                    Error_Position =>
                      (if At_Pos = 0
                       then Item'First + Meets_Prefix'Length
                       else At_Pos + Meets_Mark'Length),
                    others => <>);
         end if;
         Store
           (Item (Item'First + Meets_Prefix'Length .. At_Pos - 1),
            Target_Buffer, Target_Length);
         return
           (Status => Humanize.Status.Ok,
            Recommended_Color => Color,
            Has_Recommended_Color => False,
            Ratio => Ratio,
            Target => Target_Buffer,
            Target_Length => Target_Length,
            Already_Passes => True,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error);
      elsif Starts_With (Low, Use_Prefix) then
         For_Pos := Find_Substring (Low, For_Mark);
         if For_Pos = 0
           or else Humanize.Colors.Parse_Hex_Color
             (Item (Item'First + Use_Prefix'Length .. For_Pos - 1), Color)
             /= Humanize.Status.Ok
         then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Expected_Unit,
                    Error_Position => Item'First + Use_Prefix'Length,
                    others => <>);
         end if;
         Has_Color := True;
         declare
            Rest : constant String :=
              Item (For_Pos + For_Mark'Length .. Item'Last);
            Rest_Low : constant String := Lower (Rest);
            Space : constant Natural := Find_Substring (Rest, " ");
         begin
            if Space = 0
              or else not Ends_With (Rest_Low, Contrast_Suffix)
              or else not Numeric_Value
                (Rest (Rest'First .. Space - 3), Ratio)
            then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Number,
                       Error_Position => Rest'First,
                       others => <>);
            end if;
            Store
              (Rest (Space + 1 .. Rest'Last - Contrast_Suffix'Length),
               Target_Buffer, Target_Length);
         end;
         return
           (Status => Humanize.Status.Ok,
            Recommended_Color => Color,
            Has_Recommended_Color => Has_Color,
            Ratio => Ratio,
            Target => Target_Buffer,
            Target_Length => Target_Length,
            Already_Passes => False,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error);
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Unsupported_Form,
                 others => <>);
      end if;
exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Contrast_Remediation_Label;
