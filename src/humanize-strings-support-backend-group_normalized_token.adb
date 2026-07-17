separate (Humanize.Strings.Support.Backend)
function Group_Normalized_Token
     (Text    : String;
      Options : Token_Group_Options)
      return String
   is
      Result : Unbounded_String;
      Count  : Natural := 0;
      First_Group : Natural;
begin
      if Text'Length = 0 then
         return "";
      end if;

      if Options.Direction = Group_From_Left then
         for Index in Text'Range loop
            if Count > 0 and then Count mod Natural (Options.Group_Size) = 0 then
               Append (Result, Options.Separator);
            end if;
            Append (Result, Text (Index));
            Count := Count + 1;
         end loop;
      else
         First_Group := Text'Length mod Natural (Options.Group_Size);
         if First_Group = 0 then
            First_Group := Natural (Options.Group_Size);
         end if;

         for Index in Text'Range loop
            if Count > 0
              and then (Count = First_Group
                        or else (Count > First_Group
                                 and then (Count - First_Group)
                                   mod Natural (Options.Group_Size) = 0))
            then
               Append (Result, Options.Separator);
            end if;
            Append (Result, Text (Index));
            Count := Count + 1;
         end loop;
      end if;

      return To_String (Result);
end Group_Normalized_Token;
