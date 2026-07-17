separate (Humanize.Strings.Support.Backend)
function UTF8_Code_Point
  (Text  : String;
   Index : Natural;
   Width : out Positive)
   return Natural
is
   B1 : constant Natural := Character'Pos (Text (Index));
   B2 : Natural := 0;
   B3 : Natural := 0;
   B4 : Natural := 0;
begin
   Width := UTF8_Byte_Count (Text (Index), Text'Last - Index + 1);
   if Width = 1 then
      return B1;
   elsif Index + Width - 1 > Text'Last then
      Width := 1;
      return B1;
   end if;

   if Width >= 2 then
      if not Is_UTF8_Continuation (Text (Index + 1)) then
         Width := 1;
         return B1;
      end if;
      B2 := Character'Pos (Text (Index + 1));
   end if;

   if Width >= 3 then
      if not Is_UTF8_Continuation (Text (Index + 2)) then
         Width := 1;
         return B1;
      end if;
      B3 := Character'Pos (Text (Index + 2));
   end if;

   if Width = 4 then
      if not Is_UTF8_Continuation (Text (Index + 3)) then
         Width := 1;
         return B1;
      end if;
      B4 := Character'Pos (Text (Index + 3));
   end if;

   if Width = 3
     and then
       ((B1 = 16#E0# and then B2 < 16#A0#)
        or else (B1 = 16#ED# and then B2 >= 16#A0#))
   then
      Width := 1;
      return B1;
   elsif Width = 4
     and then
       ((B1 = 16#F0# and then B2 < 16#90#)
        or else (B1 = 16#F4# and then B2 > 16#8F#))
   then
      Width := 1;
      return B1;
   end if;

   case Width is
      when 2 =>
         return (B1 - 16#C0#) * 16#40# + (B2 - 16#80#);
      when 3 =>
         return (B1 - 16#E0#) * 16#1000#
           + (B2 - 16#80#) * 16#40# + (B3 - 16#80#);
      when 4 =>
         return (B1 - 16#F0#) * 16#40000#
           + (B2 - 16#80#) * 16#1000#
           + (B3 - 16#80#) * 16#40# + (B4 - 16#80#);
      when others =>
         return B1;
   end case;
end UTF8_Code_Point;
