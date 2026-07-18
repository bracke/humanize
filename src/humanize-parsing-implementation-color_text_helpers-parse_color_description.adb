separate (Humanize.Parsing.Implementation.Color_Text_Helpers)
function Parse_Color_Description
     (Text : String)
      return Color_Description_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      First_Comma : constant Natural := Find_Substring (Item, ", ");
      Second_Comma : Natural;
      Third_Comma : Natural;
      Brightness_Buffer : String (1 .. 32);
      Saturation_Buffer : String (1 .. 32);
      Hue_Buffer : String (1 .. 32);
      Temperature_Buffer : String (1 .. 32);
      Chroma_Buffer : String (1 .. 32);
      Brightness_Length : Natural;
      Saturation_Length : Natural;
      Hue_Length : Natural;
      Temperature_Length : Natural;
      Chroma_Length : Natural;
      Space : Natural;
begin
      if First_Comma = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => (if Item'Length = 0 then Text'First else Item'First),
                 Error => Expected_Separator,
                 others => <>);
      end if;
      Second_Comma := Find_Substring (Item (First_Comma + 2 .. Item'Last), ", ");
      if Second_Comma = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => First_Comma + 2,
                 Error => Expected_Separator,
                 others => <>);
      end if;
      Third_Comma := Find_Substring (Item (Second_Comma + 2 .. Item'Last), ", ");
      if Third_Comma = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Second_Comma + 2,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      declare
         Sat_Hue : constant String := Item (First_Comma + 2 .. Second_Comma - 1);
      begin
         for Index in reverse Sat_Hue'Range loop
            if Sat_Hue (Index) = ' ' then
               Space := Index;
               exit;
            end if;
         end loop;
         if Space = 0 then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error_Position => Sat_Hue'First,
                    Error => Expected_Separator,
                    others => <>);
         end if;
         Store (Sat_Hue (Sat_Hue'First .. Space - 1),
                Saturation_Buffer, Saturation_Length);
         Store (Sat_Hue (Space + 1 .. Sat_Hue'Last), Hue_Buffer, Hue_Length);
      end;

      Store (Item (Item'First .. First_Comma - 1),
             Brightness_Buffer, Brightness_Length);
      Store (Item (Second_Comma + 2 .. Third_Comma - 1),
             Temperature_Buffer, Temperature_Length);
      Store (Item (Third_Comma + 2 .. Item'Last), Chroma_Buffer, Chroma_Length);
      return
        (Status => Humanize.Status.Ok,
         Brightness => Brightness_Buffer,
         Brightness_Length => Brightness_Length,
         Saturation => Saturation_Buffer,
         Saturation_Length => Saturation_Length,
         Hue => Hue_Buffer,
         Hue_Length => Hue_Length,
         Temperature => Temperature_Buffer,
         Temperature_Length => Temperature_Length,
         Chroma => Chroma_Buffer,
         Chroma_Length => Chroma_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
exception
      when Constraint_Error =>
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => (if Item'Length = 0 then Text'First else Item'First),
            Error => Expected_Separator,
            others => <>);
end Parse_Color_Description;
