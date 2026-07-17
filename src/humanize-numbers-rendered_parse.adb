with Humanize.Bounded_Text;
with Humanize.Locales;
with Humanize.Numbers.Spellout_Data;

package body Humanize.Numbers.Rendered_Parse is
   function Find_Text (Text, Pattern : String) return Natural
      renames Humanize.Bounded_Text.Index_Text;

   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function Starts_With (Text, Prefix : String) return Boolean
      renames Humanize.Bounded_Text.Starts_With;

   function U (Code : Natural) return String
      renames Humanize.Bounded_Text.UTF8_Code_Point;

   function Lower (Text : String) return String
      renames Humanize.Bounded_Text.Lower_Text;

   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;

   function Contains (Text, Pattern : String) return Boolean
      renames Humanize.Bounded_Text.Contains_Text;

   function Has_Byte_In
     (Text : String;
      Low  : Natural;
      High : Natural)
      return Boolean
   is
   begin
      for Ch of Text loop
         if Character'Pos (Ch) in Low .. High then
            return True;
         end if;
      end loop;
      return False;
   end Has_Byte_In;

   U_I_Dotless : constant String :=
     Character'Val (16#C4#) & Character'Val (16#B1#);
   U_C_Cedilla : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A7#);
   U_S_Cedilla : constant String :=
     Character'Val (16#C5#) & Character'Val (16#9F#);

   function Locale_Hundred_Word
     (Locale : String;
      Value  : Natural)
      return String
      renames Humanize.Numbers.Spellout_Data.Locale_Hundred_Word;

   function Locale_CJK_Group_Word
     (Locale : String;
      Value  : Natural)
      return String
      renames Humanize.Numbers.Spellout_Data.Locale_CJK_Group_Word;

   function Locale_CJK_Myriad_Scale_Word
     (Locale : String;
      Scale  : Positive)
      return String
      renames Humanize.Numbers.Spellout_Data.Locale_CJK_Myriad_Scale_Word;

   function Locale_Long_Word
     (Locale : String;
      Value  : Long_Long_Integer)
      return String
      renames Humanize.Numbers.Spellout_Data.Locale_Long_Word;

   function Locale_Ordinal_Words_Text
     (Locale : String;
      Value  : Natural)
      return String
      renames Humanize.Numbers.Spellout_Data.Locale_Ordinal_Words_Text;

   function Scale_Value (Scale : Positive) return Long_Long_Integer
      renames Humanize.Numbers.Spellout_Data.Scale_Value;

   function CJK_Scale_Value (Scale : Positive) return Long_Long_Integer
      renames Humanize.Numbers.Spellout_Data.CJK_Scale_Value;

   function Parse_Rendered_Under_Thousand
     (Locale : String;
      Item   : String;
      Value  : out Natural)
      return Boolean
   is
   begin
      for Candidate in 0 .. 999 loop
         declare
            Rendered : constant String :=
              Lower (Locale_Hundred_Word (Locale, Candidate));
         begin
            if Rendered'Length > 0 and then Rendered = Item then
               Value := Candidate;
               return True;
            end if;
         end;
      end loop;

      Value := 0;
      return False;
   end Parse_Rendered_Under_Thousand;

   function Parse_Rendered_CJK_Group
     (Locale : String;
      Item   : String;
      Value  : out Natural)
      return Boolean
   is
   begin
      for Candidate in 0 .. 9_999 loop
         declare
            Rendered : constant String :=
              Lower (Locale_CJK_Group_Word (Locale, Candidate));
         begin
            if Rendered'Length > 0 and then Rendered = Item then
               Value := Candidate;
               return True;
            end if;
         end;
      end loop;

      Value := 0;
      return False;
   end Parse_Rendered_CJK_Group;

   function Parse_Rendered_Cardinal
     (Locale    : String;
      Item      : String;
      Max_Scale : Natural;
      Value     : out Long_Long_Integer)
      return Boolean;

   function Parse_Rendered_Cardinal
     (Locale    : String;
      Item      : String;
      Max_Scale : Natural;
      Value     : out Long_Long_Integer)
      return Boolean
   is
      Segment : Natural := 0;
      Rest_Value : Long_Long_Integer := 0;
   begin
      if Humanize.Locales.Is_CJK (Locale) then
         if Parse_Rendered_CJK_Group (Locale, Item, Segment) then
            Value := Long_Long_Integer (Segment);
            return True;
         end if;

         for Scale in reverse 1 .. Max_Scale loop
            declare
               Unit  : constant Long_Long_Integer := CJK_Scale_Value (Scale);
               Token : constant String :=
                 Locale_CJK_Myriad_Scale_Word (Locale, Scale);
               Pos   : constant Natural := Find_Text (Item, Token);
            begin
               if Token'Length > 0 and then Pos > 0 then
                  declare
                     Prefix_Value : Natural := 1;
                     Tail_Value   : Long_Long_Integer := 0;
                  begin
                     if Pos > Item'First
                       and then not Parse_Rendered_CJK_Group
                         (Locale, Item (Item'First .. Pos - 1), Prefix_Value)
                     then
                        Value := 0;
                        return False;
                     end if;

                     if Pos + Token'Length <= Item'Last then
                        if not Parse_Rendered_Cardinal
                          (Locale, Item (Pos + Token'Length .. Item'Last),
                           Scale - 1, Tail_Value)
                          or else Tail_Value >= Unit
                        then
                           Value := 0;
                           return False;
                        end if;
                     end if;

                     Value :=
                       Long_Long_Integer (Prefix_Value) * Unit + Tail_Value;
                     return True;
                  end;
               end if;
            end;
         end loop;

         Value := 0;
         return False;
      end if;

      if Parse_Rendered_Under_Thousand (Locale, Item, Segment) then
         Value := Long_Long_Integer (Segment);
         return True;
      end if;

      for Scale in reverse 1 .. Max_Scale loop
         declare
            Unit : constant Long_Long_Integer := Scale_Value (Scale);
         begin
            for Prefix_Segment in 1 .. 999 loop
               declare
                  Prefix_Value : constant Long_Long_Integer :=
                    Long_Long_Integer (Prefix_Segment) * Unit;
                  Prefix : constant String :=
                    Lower (Locale_Long_Word (Locale, Prefix_Value));
               begin
                  if Prefix'Length > 0 and then Item = Prefix then
                     Value := Prefix_Value;
                     return True;
                  elsif Prefix'Length > 0
                    and then Starts_With (Item, Prefix)
                  then
                     declare
                        Next : constant Natural :=
                          Item'First + Prefix'Length;
                     begin
                        if Next <= Item'Last and then Item (Next) = ' ' then
                           declare
                              Tail : constant String :=
                                Trim (Item (Next + 1 .. Item'Last));
                           begin
                              if Tail'Length > 0
                                and then Parse_Rendered_Cardinal
                                  (Locale, Tail, Scale - 1, Rest_Value)
                                and then Rest_Value < Unit
                              then
                                 Value := Prefix_Value + Rest_Value;
                                 return True;
                              end if;
                           end;
                        elsif Locale = "de" and then Scale = 1 then
                           declare
                              Tail : constant String :=
                                Item (Next .. Item'Last);
                           begin
                              if Tail'Length > 0
                                and then Parse_Rendered_Cardinal
                                  (Locale, Tail, 0, Rest_Value)
                                and then Rest_Value < Unit
                              then
                                 Value := Prefix_Value + Rest_Value;
                                 return True;
                              end if;
                           end;
                        elsif Humanize.Locales.Is_CJK (Locale) and then Scale = 1 then
                           declare
                              Tail : constant String :=
                                Item (Next .. Item'Last);
                           begin
                              if Tail'Length > 0
                                and then Parse_Rendered_Cardinal
                                  (Locale, Tail, 0, Rest_Value)
                                and then Rest_Value < Unit
                              then
                                 Value := Prefix_Value + Rest_Value;
                                 return True;
                              end if;
                           end;
                        end if;
                     end;
                  end if;
               end;
            end loop;
         end;
      end loop;

      Value := 0;
      return False;
   end Parse_Rendered_Cardinal;

   function Parse_Rendered_Ordinal_Under_Thousand
     (Locale : String;
      Item   : String;
      Value  : out Natural)
      return Boolean
   is
   begin
      for Candidate in 0 .. 999 loop
         declare
            Rendered : constant String :=
              Lower (Locale_Ordinal_Words_Text (Locale, Candidate));
         begin
            if Rendered'Length > 0 and then Rendered = Item then
               Value := Candidate;
               return True;
            end if;
         end;
      end loop;

      Value := 0;
      return False;
   end Parse_Rendered_Ordinal_Under_Thousand;

   function Parse_Rendered_Ordinal
     (Locale    : String;
      Item      : String;
      Max_Scale : Natural;
      Value     : out Natural)
      return Boolean
   is
      Rest_Value : Natural := 0;
      Cardinal_Value : Long_Long_Integer := 0;
   begin
      if Parse_Rendered_Ordinal_Under_Thousand (Locale, Item, Value) then
         return True;
      elsif (Locale = "ja" or else Locale = "zh")
        and then Starts_With (Item, U (16#7B2C#))
        and then Parse_Rendered_Cardinal
          (Locale, Item (Item'First + U (16#7B2C#)'Length .. Item'Last),
           Max_Scale, Cardinal_Value)
        and then Cardinal_Value in 0 .. Long_Long_Integer (Natural'Last)
      then
         Value := Natural (Cardinal_Value);
         return True;
      elsif Locale = "ko"
        and then Item'Length >
          U (16#BC88#)'Length + U (16#C9F8#)'Length
        and then Item
          (Item'Last - (U (16#BC88#)'Length + U (16#C9F8#)'Length) + 1
           .. Item'Last) = U (16#BC88#) & U (16#C9F8#)
        and then Parse_Rendered_Cardinal
          (Locale,
           Item
             (Item'First
              .. Item'Last
                 - (U (16#BC88#)'Length + U (16#C9F8#)'Length)),
           Max_Scale, Cardinal_Value)
        and then Cardinal_Value in 0 .. Long_Long_Integer (Natural'Last)
      then
         Value := Natural (Cardinal_Value);
         return True;
      end if;

      for Scale in reverse 1 .. Max_Scale loop
         declare
            Unit : constant Long_Long_Integer := Scale_Value (Scale);
         begin
            for Prefix_Segment in 1 .. 999 loop
               declare
                  Prefix_Value : constant Long_Long_Integer :=
                    Long_Long_Integer (Prefix_Segment) * Unit;
                  Prefix : constant String :=
                    Lower (Locale_Long_Word (Locale, Prefix_Value));
               begin
                  if Prefix'Length > 0 and then Starts_With (Item, Prefix) then
                     declare
                        Next : constant Natural :=
                          Item'First + Prefix'Length;
                     begin
                        if Next <= Item'Last and then Item (Next) = ' ' then
                           declare
                              Tail : constant String :=
                                Trim (Item (Next + 1 .. Item'Last));
                           begin
                              if Tail'Length > 0
                                and then Parse_Rendered_Ordinal
                                  (Locale, Tail, Scale - 1, Rest_Value)
                                and then Long_Long_Integer (Rest_Value) < Unit
                                and then Prefix_Value
                                  + Long_Long_Integer (Rest_Value)
                                    <= Long_Long_Integer (Natural'Last)
                              then
                                 Value :=
                                   Natural
                                     (Prefix_Value
                                      + Long_Long_Integer (Rest_Value));
                                 return True;
                              end if;
                           end;
                        end if;
                     end;
                  end if;
               end;
            end loop;
         end;
      end loop;

      Value := 0;
      return False;
   end Parse_Rendered_Ordinal;

   function Parse_Deterministic_Cardinal
     (Text  : String;
      Value : out Long_Long_Integer)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
      Has_Cyrillic : constant Boolean := Has_Byte_In (Item, 16#D0#, 16#D1#);
      Has_Arabic   : constant Boolean := Has_Byte_In (Item, 16#D8#, 16#DB#);
      Has_Devanagari : constant Boolean := Has_Byte_In (Item, 16#E0#, 16#E0#)
        or else Contains (Item, U (16#915#))
        or else Contains (Item, U (16#936#));
      Has_CJK : constant Boolean := Has_Byte_In (Item, 16#E3#, 16#EF#)
        and then not Has_Devanagari;
      Has_Latin_Ext : constant Boolean := Has_Byte_In (Item, 16#C2#, 16#C5#);
      Looks_Polish : constant Boolean := Contains (Item, U (16#105#))
        or else Contains (Item, U (16#119#))
        or else Contains (Item, U (16#15B#))
        or else Contains (Item, U (16#107#))
        or else Contains (Item, U (16#17C#));
      Looks_Czech : constant Boolean := Contains (Item, U (16#10D#))
        or else Contains (Item, U (16#159#))
        or else Contains (Item, U (16#11B#))
        or else Contains (Item, U (16#FD#));
      Looks_Turkish : constant Boolean := Contains (Item, U_I_Dotless)
        or else Contains (Item, U_S_Cedilla)
        or else Contains (Item, U_C_Cedilla);

      function Should_Try (Locale : String) return Boolean is
      begin
         if Has_Cyrillic then
            return Locale = "ru" or else Locale = "uk";
         elsif Has_Arabic then
            return Locale = "ar";
         elsif Has_Devanagari then
            return Locale = "hi";
         elsif Has_CJK then
            return Humanize.Locales.Is_CJK (Locale);
         elsif Looks_Polish then
            return Locale = "pl";
         elsif Looks_Czech then
            return Locale = "cs";
         elsif Looks_Turkish then
            return Locale = "tr";
         elsif Has_Latin_Ext then
            return Locale not in "ru" | "uk" | "ar" | "hi"
              and then not Humanize.Locales.Is_CJK (Locale);
         else
            return Locale not in "ru" | "uk" | "ar" | "hi"
              and then not Humanize.Locales.Is_CJK (Locale);
         end if;
      end Should_Try;

      Parsed : Long_Long_Integer := 0;
   begin
      Value := 0;
      if Item'Length = 0 then
         return False;
      end if;

      for Locale of Humanize.Locales.Shipped_Locales loop
         declare
            Code : constant String := Locale.all;
            Prefix : constant String :=
              (if Code = "fr" then "moins " else "minus ");
            Negative : constant Boolean := Starts_With (Item, Prefix);
            Spellout_Body : constant String :=
              (if Negative then Item (Item'First + Prefix'Length .. Item'Last)
               else Item);
         begin
            if not Should_Try (Code) then
               goto Continue_Locale;
            end if;

            if Parse_Rendered_Cardinal
                 (Code, Spellout_Body,
                  (if Humanize.Locales.Is_CJK (Code) then 3 else 5), Parsed)
            then
               Value := (if Negative then -Parsed else Parsed);
               return True;
            end if;
            <<Continue_Locale>>
            null;
         end;
      end loop;

      return False;
   end Parse_Deterministic_Cardinal;

   function Parse_Deterministic_Ordinal
     (Text  : String;
      Value : out Natural)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
      Has_Cyrillic : constant Boolean := Has_Byte_In (Item, 16#D0#, 16#D1#);
      Has_Arabic   : constant Boolean := Has_Byte_In (Item, 16#D8#, 16#DB#);
      Has_Devanagari : constant Boolean := Has_Byte_In (Item, 16#E0#, 16#E0#)
        or else Contains (Item, U (16#915#))
        or else Contains (Item, U (16#936#));
      Has_CJK : constant Boolean := Has_Byte_In (Item, 16#E3#, 16#EF#)
        and then not Has_Devanagari;
      Has_Latin_Ext : constant Boolean := Has_Byte_In (Item, 16#C2#, 16#C5#);
      Looks_Polish : constant Boolean := Contains (Item, U (16#105#))
        or else Contains (Item, U (16#119#))
        or else Contains (Item, U (16#15B#))
        or else Contains (Item, U (16#107#))
        or else Contains (Item, U (16#17C#));
      Looks_Czech : constant Boolean := Contains (Item, U (16#10D#))
        or else Contains (Item, U (16#159#))
        or else Contains (Item, U (16#11B#))
        or else Contains (Item, U (16#FD#));
      Looks_Turkish : constant Boolean := Contains (Item, U_I_Dotless)
        or else Contains (Item, U_S_Cedilla)
        or else Contains (Item, U_C_Cedilla);

      function Should_Try (Locale : String) return Boolean is
      begin
         if Has_Cyrillic then
            return Locale = "ru" or else Locale = "uk";
         elsif Has_Arabic then
            return Locale = "ar";
         elsif Has_Devanagari then
            return Locale = "hi";
         elsif Has_CJK then
            return Humanize.Locales.Is_CJK (Locale);
         elsif Looks_Polish then
            return Locale = "pl";
         elsif Looks_Czech then
            return Locale = "cs";
         elsif Looks_Turkish then
            return Locale = "tr";
         elsif Has_Latin_Ext then
            return Locale not in "ru" | "uk" | "ar" | "hi"
              and then not Humanize.Locales.Is_CJK (Locale);
         else
            return Locale not in "ru" | "uk" | "ar" | "hi"
              and then not Humanize.Locales.Is_CJK (Locale);
         end if;
      end Should_Try;
      Parsed : Natural := 0;
   begin
      Value := 0;
      if Item'Length = 0 then
         return False;
      end if;

      for Locale of Humanize.Locales.Shipped_Locales loop
         if not Should_Try (Locale.all) then
            goto Continue_Locale;
         end if;

         if Parse_Rendered_Ordinal
              (Locale.all, Item,
               (if Humanize.Locales.Is_CJK (Locale.all) then 3 else 5), Parsed)
         then
            Value := Parsed;
            return True;
         end if;
         <<Continue_Locale>>
         null;
      end loop;

      return False;
   end Parse_Deterministic_Ordinal;

end Humanize.Numbers.Rendered_Parse;
