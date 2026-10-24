--  Provenance: generated from Humanize spellout tables; split shard: locale long-number spellout composition.

separate (Humanize.Numbers.Spellout_Data)
function Locale_Long_Word
  (Locale : String;
   Value  : Long_Long_Integer)
   return String
is
   --  A count standing for Count's plural form, as the scale words choose it
   --  (1, 2 .. 4, more): Russian and Ukrainian 21 takes the singular and 22 the
   --  2 .. 4 form ("двадцять дві тисячі"), Polish 22 the 2 .. 4 form only.
   function Plural_Count (Locale : String; Count : Natural) return Natural is
   begin
      if Locale in "ru" | "uk" then
         return
           (if Count mod 10 = 1 and then Count mod 100 /= 11 then 1
            elsif Count mod 10 in 2 .. 4 and then Count mod 100 not in 12 .. 14 then 2
            else 5);
      elsif Locale = "pl" then
         return
           (if Count = 1 then 1
            elsif Count mod 10 in 2 .. 4 and then Count mod 100 not in 12 .. 14 then 2
            else 5);
      else
         return Count;
      end if;
   end Plural_Count;

   --  Words, Count's cardinal, with its last word feminine where thousands
   --  need it: Ukrainian "одна", "дві", Russian "одна", "две".
   function Feminine (Locale : String; Count : Natural; Words : String) return String is
      function Ends_With (Tail : String) return Boolean is
        (Words'Length >= Tail'Length and then Words (Words'Last - Tail'Length + 1 .. Words'Last) = Tail);
      Odyn : constant String := U (16#43E#) & U (16#434#) & U (16#438#) & U (16#43D#);
      Odna : constant String := U (16#43E#) & U (16#434#) & U (16#43D#) & U (16#430#);
      Dva  : constant String := U (16#434#) & U (16#432#) & U (16#430#);
   begin
      if Locale not in "ru" | "uk" or else Count mod 100 in 11 .. 12 then
         return Words;
      elsif Count mod 10 = 1 and then Ends_With (Odyn) then
         return Words (Words'First .. Words'Last - Odyn'Length) & Odna;
      elsif Count mod 10 = 2 and then Ends_With (Dva) then
         return Words (Words'First .. Words'Last - Dva'Length)
           & (if Locale = "uk" then U (16#434#) & U (16#432#) & U (16#456#) else U (16#434#) & U (16#432#) & U (16#435#));
      else
         return Words;
      end if;
   end Feminine;

   type Segment_Array is array (Positive range <>) of Natural;
   Segments : Segment_Array (1 .. 6) := [others => 0];
   Length   : Natural := 0;
   Rest     : Long_Long_Integer := Value;
   Result   : Unbounded_String;
begin
   if Humanize.Locales.Is_CJK (Locale) then
      declare
         type Segment_Array is array (Positive range <>) of Natural;
         Segments : Segment_Array (1 .. 3) := [others => 0];
         Length   : Natural := 0;
         Rest     : Long_Long_Integer := Value;
         Text     : Unbounded_String;
      begin
         if Value <= 9_999 then
            return Locale_CJK_Group_Word (Locale, Natural (Value));
         elsif Value > 999_999_999_999 then
            return "";
         end if;

         while Rest > 0 and then Length < Segments'Length loop
            Length := Length + 1;
            Segments (Length) := Natural (Rest mod 10_000);
            Rest := Rest / 10_000;
         end loop;

         for Index in reverse 1 .. Length loop
            if Segments (Index) /= 0 then
               if Index > 1 and then Segments (Index) = 1 then
                  Append
                    (Text, Locale_CJK_Myriad_Scale_Word (Locale, Index - 1));
               else
                  Append (Text, Locale_CJK_Group_Word (Locale, Segments (Index)));
                  if Index > 1 then
                     Append
                       (Text,
                        Locale_CJK_Myriad_Scale_Word (Locale, Index - 1));
                  end if;
               end if;
            end if;
         end loop;

         return To_String (Text);
      end;
   end if;

   if Value <= 999 then
      return Locale_Hundred_Word (Locale, Natural (Value));
   elsif Value > 999_999_999_999_999_999 then
      return "";
   end if;

   while Rest > 0 and then Length < Segments'Length loop
      Length := Length + 1;
      Segments (Length) := Natural (Rest mod 1_000);
      Rest := Rest / 1_000;
   end loop;

   for Index in reverse 1 .. Length loop
      if Segments (Index) /= 0 then
         if Ada.Strings.Unbounded.Length (Result) > 0 then
            if Locale = "de" and then Index = 1
              and then Length >= 2 and then Segments (2) /= 0
            then
               null;
            else
               Append (Result, " ");
            end if;
         end if;
         if Index = 2 and then Segments (Index) = 1
           and then
             (Locale in "de" | "fr" | "da" | "es" | "it" | "pt" | "nl"
              or else Locale = "sv" or else Humanize.Locales.Is_Norwegian (Locale)
              or else Locale = "fi" or else Locale = "tr"
              or else Has_Generated_Spellout (Locale))
         then
            if Locale = "de" then
               Append (Result, "eintausend");
            elsif Locale = "da" then
               Append (Result, "et " & Locale_Scale_Word (Locale, 1, 1));
            elsif Locale = "sv" then
               Append (Result, "ett " & Locale_Scale_Word (Locale, 1, 1));
            elsif Humanize.Locales.Is_Norwegian (Locale) then
               Append (Result, "ett " & Locale_Scale_Word (Locale, 1, 1));
            elsif Locale = "fi" then
               Append (Result, Locale_Scale_Word (Locale, 1, 1));
            elsif Locale = "tr" then
               Append (Result, Locale_Scale_Word (Locale, 1, 1));
            elsif Has_Generated_Spellout (Locale) then
               Append (Result, Locale_Scale_Word (Locale, 1, 1));
            elsif Locale = "fr" or else Locale = "es"
              or else Locale = "it" or else Locale = "pt"
              or else Locale = "nl"
            then
               Append (Result, Locale_Scale_Word (Locale, 1, 1));
            end if;
         elsif Index > 2 and then Segments (Index) = 1
           and then Locale = "de"
         then
            Append (Result, "eine " & Locale_Scale_Word (Locale, Index - 1, 1));
         elsif Index > 2 and then Segments (Index) = 1
           and then Locale in "es" | "it"
         then
            Append
              (Result,
               (if Locale = "es" and then (Index - 1 = 3 or else Index - 1 = 5)
                then ""
                else "un ")
               & Locale_Scale_Word (Locale, Index - 1, 1));
         elsif Index = 2 and then Locale in "de" | "it" | "nl" then
            Append
              (Result,
               Locale_Hundred_Word (Locale, Segments (Index))
               & Locale_Scale_Word (Locale, 1, Segments (Index)));
         elsif Locale = "de" and then Index = 2 and then Segments (Index) = 1 then
            Append (Result, "eintausend");
         else
            Append
              (Result,
               (if Index = 2 then Feminine (Locale, Segments (Index), Locale_Hundred_Word (Locale, Segments (Index)))
                else Locale_Hundred_Word (Locale, Segments (Index))));
            if Index > 1 then
               Append
                 (Result,
                  " " & Locale_Scale_Word
                    (Locale, Index - 1, Plural_Count (Locale, Segments (Index))));
            end if;
         end if;
      end if;
   end loop;

   return To_String (Result);
end Locale_Long_Word;
