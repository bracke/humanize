separate (Humanize.Strings.Support.Backend)
function Editorial_Title
     (Text  : String;
      Style : Editorial_Title_Style := AP_Title)
      return Humanize.Status.Text_Result
   is
      Acronyms : constant String := "api url http https id ui cpu iops utf8";
begin
      case Style is
         when AP_Title =>
            return Title_Case_With_Word_Lists
              (Text,
               Acronyms,
               "a an and as at but by for in nor of on or per the to via vs "
               & "with");
         when Chicago_Title =>
            return Title_Case_With_Word_Lists
              (Text,
               Acronyms,
               "a an and as at but by for from in into nor of on or over the "
               & "to with");
         when Sentence_Title =>
            declare
               Squished : constant Humanize.Status.Text_Result := Squish (Text);
               Raw      : constant String := Result_Text (Squished);
               Lowered  : Unbounded_String;
            begin
               for Ch of Raw loop
                  Append (Lowered, Lower (Ch));
               end loop;
               return Capitalize (To_String (Lowered));
            end;
      end case;
end Editorial_Title;
