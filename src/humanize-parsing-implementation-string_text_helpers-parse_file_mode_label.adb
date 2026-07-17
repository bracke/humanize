separate (Humanize.Parsing.Implementation.String_Text_Helpers)
function Parse_File_Mode_Label
     (Text : String)
      return File_Mode_Parse_Result
   is
      Item : constant String := Trim (Text);
      Mode : Humanize.Strings.File_Mode_Value;
      Kind : Humanize.Strings.File_Mode_Kind;
      Code : Humanize.Status.Status_Code;
      Looks_Octal : Boolean := False;
      Looks_Symbolic : Boolean := False;
begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Empty_Input,
            others => <>);
      end if;

      Looks_Octal := True;
      for Ch of Item loop
         if Ch not in '0' .. '7' then
            Looks_Octal := False;
            exit;
         end if;
      end loop;
      Looks_Symbolic := Item'Length in 9 | 10;

      Code := Humanize.Strings.Parse_File_Mode (Item, Mode, Kind);
      if Code /= Humanize.Status.Ok then
         return
           (Status => Code,
            Error_Position => Item'First,
            Error =>
              (if Looks_Octal or else Looks_Symbolic then Expected_Number
               else Unsupported_Form),
            others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Mode => Mode,
         Kind => Kind,
         Symbolic => not Looks_Octal,
         Octal => Looks_Octal,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
end Parse_File_Mode_Label;
