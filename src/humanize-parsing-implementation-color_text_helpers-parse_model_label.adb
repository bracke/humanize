separate (Humanize.Parsing.Implementation.Color_Text_Helpers)
function Parse_Model_Label
     (Text   : String;
      Prefix : String)
      return Color_Model_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Body_First : Natural;
      Body_Last : Natural;
      First_Comma : Natural;
      Second_Comma : Natural;
      First_Value : Long_Float;
      Second_Value : Long_Float;
      Third_Value : Long_Float;
begin
      if not Starts_With (Item, Prefix & "(") or else not Ends_With (Item, ")") then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position =>
                   (if Item'Length = 0 then Text'First
                    elsif Starts_With (Item, Prefix) then
                       Item'First + Prefix'Length
                    else Item'First),
                 Error => Unsupported_Form,
                 others => <>);
      end if;

      Body_First := Item'First + Prefix'Length + 1;
      Body_Last := Item'Last - 1;
      First_Comma := Find_Substring (Item (Body_First .. Body_Last), ", ");
      if First_Comma = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Body_First,
                 Error => Expected_Separator,
                 others => <>);
      end if;
      Second_Comma := Find_Substring (Item (First_Comma + 2 .. Body_Last), ", ");
      if Second_Comma = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => First_Comma + 2,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      if not Parse_Float_Field (Item (Body_First .. First_Comma - 1), First_Value) then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Body_First,
                 Error => Expected_Number,
                 others => <>);
      elsif not Parse_Percent_Field
        (Item (First_Comma + 2 .. Second_Comma - 1), Second_Value)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => First_Comma + 2,
                 Error => Expected_Number,
                 others => <>);
      elsif not Parse_Percent_Field
        (Item (Second_Comma + 2 .. Body_Last), Third_Value)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Second_Comma + 2,
                 Error => Expected_Number,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         First => First_Value,
         Second => Second_Value,
         Third => Third_Value,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
exception
      when Constraint_Error =>
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => (if Item'Length = 0 then Text'First else Item'First),
            Error => Expected_Number,
            others => <>);
end Parse_Model_Label;
