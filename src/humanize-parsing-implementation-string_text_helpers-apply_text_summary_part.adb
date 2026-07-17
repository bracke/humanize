separate (Humanize.Parsing.Implementation.String_Text_Helpers)
procedure Apply_Text_Summary_Part
     (Part   : String;
      Result : in out Text_Summary_Parse_Result;
      Valid  : in out Boolean)
   is
      Item : constant String := Clean_Lower (Part);
      Counted : Text_Count_Summary_Parse_Result;
      Timed : Text_Time_Parse_Result;
      Amount : Natural;
begin
      if not Valid or else Item'Length = 0 then
         Valid := False;
         return;
      end if;

      Timed := Parse_Text_Time_Label (Item);
      if Timed.Status = Humanize.Status.Ok then
         declare
            Suffix : constant String := Timed.Suffix (1 .. Timed.Suffix_Length);
         begin
            if Suffix = "read" then
               Result.Reading_Minutes := Timed.Minutes;
               Result.Reading_Less_Than := Timed.Less_Than;
               Result.Has_Reading_Time := True;
            elsif Suffix = "spoken" then
               Result.Speaking_Minutes := Timed.Minutes;
               Result.Speaking_Less_Than := Timed.Less_Than;
               Result.Has_Speaking_Time := True;
            else
               Valid := False;
            end if;
            return;
         end;
      end if;

      Counted := Parse_Text_Count_Summary (Item);
      if Counted.Status = Humanize.Status.Ok then
         declare
            Unit : constant String := Counted.Unit (1 .. Counted.Unit_Length);
         begin
            if Unit in "word" | "words" | "w" then
               Result.Words := Counted.Count;
               Result.Has_Words := True;
            elsif Unit in "sentence" | "sentences" | "sent" then
               Result.Sentences := Counted.Count;
               Result.Has_Sentences := True;
            elsif Unit in "paragraph" | "paragraphs" | "para" then
               Result.Paragraphs := Counted.Count;
               Result.Has_Paragraphs := True;
            elsif Unit in "character" | "characters" | "ch" then
               Result.Code_Points := Counted.Count;
               Result.Has_Code_Points := True;
            elsif Unit in "column" | "columns" | "col" then
               Result.Display_Width := Counted.Count;
               Result.Has_Display_Width := True;
            else
               Valid := False;
            end if;
            return;
         end;
      end if;

      if Parse_Natural_Field (Item, Amount) then
         if not Result.Has_Words then
            Result.Words := Amount;
            Result.Has_Words := True;
         elsif not Result.Has_Sentences then
            Result.Sentences := Amount;
            Result.Has_Sentences := True;
         elsif not Result.Has_Paragraphs then
            Result.Paragraphs := Amount;
            Result.Has_Paragraphs := True;
         else
            Valid := False;
         end if;
      else
         Valid := False;
      end if;
end Apply_Text_Summary_Part;
