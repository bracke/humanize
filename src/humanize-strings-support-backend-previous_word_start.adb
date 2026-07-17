separate (Humanize.Strings.Support.Backend)
function Previous_Word_Start
     (Text  : String;
      Index : Natural)
      return Natural
   is
      Pos     : Natural := Natural'Min (Index, Text'Last);
      Lead    : Natural;
      Width   : Positive;
      Code    : Natural;
      In_Word : Boolean := False;
      Start  : Natural := Text'First;
begin
      if Text'Length = 0 then
         return 0;
      end if;

      while Pos >= Text'First loop
         Lead := Pos;
         while Lead > Text'First and then Is_UTF8_Continuation (Text (Lead)) loop
            Lead := Lead - 1;
         end loop;

         Code := UTF8_Code_Point (Text, Lead, Width);
         if Is_Unicode_Word_Continuation (Code) then
            Start := Lead;
            In_Word := True;
         elsif In_Word then
            return Start;
         end if;
         exit when Lead = Text'First;
         Pos := Lead - 1;
      end loop;
      return Start;
end Previous_Word_Start;
