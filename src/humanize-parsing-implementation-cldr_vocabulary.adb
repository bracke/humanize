with Ada.Containers.Indefinite_Hashed_Maps;
with Ada.Containers.Indefinite_Vectors;
with Ada.Strings.Hash;
with Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Locales;

with I18N.Relative_Format;
with I18N.Spellout;
with I18N.Unit_Format;

package body Humanize.Parsing.Implementation.CLDR_Vocabulary is

   use Ada.Strings.Unbounded;

   type Unit_Info is record
      Base    : access constant String;
      Seconds : Long_Long_Integer;
   end record;

   Second_Base : aliased constant String := "second";
   Minute_Base : aliased constant String := "minute";
   Hour_Base   : aliased constant String := "hour";
   Day_Base    : aliased constant String := "day";
   Week_Base   : aliased constant String := "week";
   Month_Base  : aliased constant String := "month";
   Year_Base   : aliased constant String := "year";

   Units : constant array (1 .. 7) of Unit_Info :=
     [(Second_Base'Access, 1),
      (Minute_Base'Access, 60),
      (Hour_Base'Access, 3_600),
      (Day_Base'Access, 86_400),
      (Week_Base'Access, 7 * 86_400),
      (Month_Base'Access, 30 * 86_400),
      (Year_Base'Access, 365 * 86_400)];

   Byte_Base      : aliased constant String := "byte";
   Kilobyte_Base  : aliased constant String := "kilobyte";
   Megabyte_Base  : aliased constant String := "megabyte";
   Gigabyte_Base  : aliased constant String := "gigabyte";
   Terabyte_Base  : aliased constant String := "terabyte";

   Byte_Units : constant array (1 .. 5) of Unit_Info :=
     [(Byte_Base'Access, 1),
      (Kilobyte_Base'Access, 1_000),
      (Megabyte_Base'Access, 1_000_000),
      (Gigabyte_Base'Access, 1_000_000_000),
      (Terabyte_Base'Access, 1_000_000_000_000)];

   Full_Width   : aliased constant String := "unit-width-full-name";
   Short_Width  : aliased constant String := "unit-width-short";
   Narrow_Width : aliased constant String := "unit-width-narrow";
   Widths : constant array (1 .. 3) of access constant String :=
     [Full_Width'Access, Short_Width'Access, Narrow_Width'Access];

   Zero_Category  : aliased constant String := "zero";
   One_Category   : aliased constant String := "one";
   Two_Category   : aliased constant String := "two";
   Few_Category   : aliased constant String := "few";
   Many_Category  : aliased constant String := "many";
   Other_Category : aliased constant String := "other";
   Categories : constant array (1 .. 6) of access constant String :=
     [Zero_Category'Access, One_Category'Access, Two_Category'Access,
      Few_Category'Access, Many_Category'Access, Other_Category'Access];

   --  A word that names different units in different locales.
   Ambiguous : constant Long_Long_Integer := -1;

   type Counted_Info is record
      Count   : Natural;
      Seconds : Long_Long_Integer;
   end record;

   --  A relative pattern: around the number (Fixed False) it reads as
   --  Canonical's direction with the number and Base's English name; whole
   --  (Fixed True) it is Canonical outright.
   type Relative_Info is record
      Prefix, Suffix, Canonical : Unbounded_String;
      Base                      : Unbounded_String;
      Future, Fixed             : Boolean := False;
   end record;

   package Word_Maps is new Ada.Containers.Indefinite_Hashed_Maps
     (String, Long_Long_Integer, Ada.Strings.Hash, "=");
   package Counted_Maps is new Ada.Containers.Indefinite_Hashed_Maps
     (String, Counted_Info, Ada.Strings.Hash, "=");
   package Relative_Vectors is new Ada.Containers.Indefinite_Vectors
     (Positive, Relative_Info);

   --  CLDR writes no-break spaces; the parser's text has them as ASCII.
   function Key (Text : String) return String is
      NBSP   : constant String := Character'Val (16#C2#) & Character'Val (16#A0#);
      Narrow : constant String := Character'Val (16#E2#) & Character'Val (16#80#) & Character'Val (16#AF#);
      Thin   : constant String := Character'Val (16#E2#) & Character'Val (16#80#) & Character'Val (16#89#);
      Result : String (1 .. Text'Length);
      Last   : Natural := 0;
      Index  : Natural := Text'First;

      procedure Space is
      begin
         if Last > 0 and then Result (Last) /= ' ' then
            Last := Last + 1;
            Result (Last) := ' ';
         end if;
      end Space;
   begin
      while Index <= Text'Last loop
         if Index + 1 <= Text'Last and then Text (Index .. Index + 1) = NBSP then
            Space;
            Index := Index + 2;
         elsif Index + 2 <= Text'Last
           and then (Text (Index .. Index + 2) = Narrow or else Text (Index .. Index + 2) = Thin)
         then
            Space;
            Index := Index + 3;
         elsif Text (Index) = ' ' then
            Space;
            Index := Index + 1;
         else
            Last := Last + 1;
            Result (Last) := Text (Index);
            Index := Index + 1;
         end if;
      end loop;
      return Humanize.Bounded_Text.Clean_Lower_Text (Result (1 .. Last));
   end Key;

   function Placeholder (Pattern : String) return Natural is
   begin
      for Index in Pattern'First .. Pattern'Last - 2 loop
         if Pattern (Index .. Index + 2) = "{0}" then
            return Index;
         end if;
      end loop;
      return 0;
   end Placeholder;

   function English (Base : String; Count : String) return String is
     (Count & " " & Base & (if Count = "1" then "" else "s"));

   function Category_Count (Category : String) return Natural is
     (if Category = "one" then 1 elsif Category = "two" then 2 else 0);

   protected Tables is
      function Is_Built return Boolean;
      procedure Install
        (Words    : Word_Maps.Map;
         Bytes    : Word_Maps.Map;
         Counts   : Counted_Maps.Map;
         Patterns : Relative_Vectors.Vector);
      function Unit_Of (Word : String) return Long_Long_Integer;
      function Byte_Unit_Of (Word : String) return Long_Long_Integer;
      function Counted_Of (Word : String) return Counted_Info;
      function Relative_Of (Text : String) return String;
   private
      Built         : Boolean := False;
      Unit_Words    : Word_Maps.Map;
      Byte_Words    : Word_Maps.Map;
      Counted_Words : Counted_Maps.Map;
      Relatives     : Relative_Vectors.Vector;
   end Tables;

   protected body Tables is
      function Is_Built return Boolean is (Built);

      procedure Install
        (Words    : Word_Maps.Map;
         Bytes    : Word_Maps.Map;
         Counts   : Counted_Maps.Map;
         Patterns : Relative_Vectors.Vector)
      is
      begin
         Unit_Words := Words;
         Byte_Words := Bytes;
         Counted_Words := Counts;
         Relatives := Patterns;
         Built := True;
      end Install;

      function Unit_Of (Word : String) return Long_Long_Integer is
         Position : constant Word_Maps.Cursor := Unit_Words.Find (Key (Word));
      begin
         if not Word_Maps.Has_Element (Position) then
            return 0;
         end if;
         declare
            Value : constant Long_Long_Integer := Word_Maps.Element (Position);
         begin
            return (if Value = Ambiguous then 0 else Value);
         end;
      end Unit_Of;

      function Byte_Unit_Of (Word : String) return Long_Long_Integer is
         Position : constant Word_Maps.Cursor := Byte_Words.Find (Key (Word));
      begin
         if not Word_Maps.Has_Element (Position) then
            return 0;
         end if;
         declare
            Value : constant Long_Long_Integer := Word_Maps.Element (Position);
         begin
            return (if Value = Ambiguous then 0 else Value);
         end;
      end Byte_Unit_Of;

      function Counted_Of (Word : String) return Counted_Info is
         Position : constant Counted_Maps.Cursor := Counted_Words.Find (Key (Word));
      begin
         return
           (if Counted_Maps.Has_Element (Position) then Counted_Maps.Element (Position)
            else (Count => 0, Seconds => 0));
      end Counted_Of;

      function Relative_Of (Text : String) return String is
         Item       : constant String := Key (Text);
         Best       : Natural := 0;
         Best_Score : Natural := 0;
      begin
         for Index in Relatives.First_Index .. Relatives.Last_Index loop
            declare
               R : constant Relative_Info := Relatives (Index);
            begin
               if R.Fixed then
                  if Item = To_String (R.Prefix) then
                     return To_String (R.Canonical);   --  "" where ambiguous
                  end if;
               else
                  declare
                     P : constant String := To_String (R.Prefix);
                     S : constant String := To_String (R.Suffix);
                  begin
                     if Item'Length > P'Length + S'Length
                       and then P'Length + S'Length > Best_Score
                       and then Item (Item'First .. Item'First + P'Length - 1) = P
                       and then Item (Item'Last - S'Length + 1 .. Item'Last) = S
                     then
                        Best := Index;
                        Best_Score := P'Length + S'Length;
                     end if;
                  end;
               end if;
            end;
         end loop;

         if Best = 0 then
            return "";
         end if;

         declare
            R      : constant Relative_Info := Relatives (Best);
            Number : constant String :=
              Humanize.Bounded_Text.Clean
                (Item (Item'First + Length (R.Prefix) .. Item'Last - Length (R.Suffix)));
         begin
            --  Only a number stands where the pattern's {0} was.
            for C of Number loop
               if C in 'a' .. 'z' or else C = ' ' then
                  return "";
               end if;
            end loop;
            if Number = "" then
               return "";
            end if;
            return
              (if R.Future then "in " & English (To_String (R.Base), Number)
               else English (To_String (R.Base), Number) & " ago");
         end;
      end Relative_Of;
   end Tables;

   procedure Build is
      Words    : Word_Maps.Map;
      Bytes    : Word_Maps.Map;
      Counts   : Counted_Maps.Map;
      Patterns : Relative_Vectors.Vector;

      procedure Add_To (Map : in out Word_Maps.Map; Word : String; Value : Long_Long_Integer) is
         K        : constant String := Key (Word);
         Position : constant Word_Maps.Cursor := Map.Find (K);
      begin
         if K = "" then
            return;
         elsif not Word_Maps.Has_Element (Position) then
            Map.Insert (K, Value);
         elsif Word_Maps.Element (Position) /= Value then
            Map.Replace_Element (Position, Ambiguous);
         end if;
      end Add_To;

      procedure Add_Word (Word : String; Seconds : Long_Long_Integer) is
      begin
         Add_To (Words, Word, Seconds);
      end Add_Word;

      --  The same words for two meanings -- Hindi "कल" is yesterday and
      --  tomorrow -- answer neither: the hand-kept rules decide.
      procedure Add_Fixed (Text : String; Canonical : String) is
      begin
         for R of Patterns loop
            if R.Fixed and then To_String (R.Prefix) = Key (Text) then
               if To_String (R.Canonical) /= Canonical then
                  R.Canonical := Null_Unbounded_String;
               end if;
               return;
            end if;
         end loop;
         if Key (Text) /= "" then
            Patterns.Append
              (Relative_Info'(Prefix    => To_Unbounded_String (Key (Text)),
                Suffix    => Null_Unbounded_String,
                Canonical => To_Unbounded_String (Canonical),
                Base      => Null_Unbounded_String,
                Future    => False,
                Fixed     => True));
         end if;
      end Add_Fixed;

      procedure Add_Pattern (Pattern : String; Base : String; Future : Boolean) is
         At_Zero : constant Natural := Placeholder (Pattern);
      begin
         Patterns.Append
           (Relative_Info'(Prefix    => To_Unbounded_String (Key (Pattern (Pattern'First .. At_Zero - 1))),
             Suffix    => To_Unbounded_String (Key (Pattern (At_Zero + 3 .. Pattern'Last))),
             Canonical => Null_Unbounded_String,
             Base      => To_Unbounded_String (Base),
             Future    => Future,
             Fixed     => False));
      end Add_Pattern;

   begin
      for Locale_Code of Humanize.Locales.Shipped_Locales loop
         declare
            Locale : constant String := Locale_Code.all;
         begin
            for Unit of Byte_Units loop
               for Width of Widths loop
                  for Category of Categories loop
                     Add_To
                       (Bytes,
                        I18N.Unit_Format.Display_Name (Locale, Unit.Base.all, Width.all, Category.all),
                        Unit.Seconds);
                  end loop;
               end loop;
            end loop;
            for Unit of Units loop
               for Width of Widths loop
                  for Category of Categories loop
                     Add_Word
                       (I18N.Unit_Format.Display_Name (Locale, Unit.Base.all, Width.all, Category.all),
                        Unit.Seconds);
                     declare
                        Found   : Boolean;
                        Pattern : constant String :=
                          I18N.Unit_Format.Pattern (Locale, Unit.Base.all, Width.all, Category.all, Found);
                     begin
                        if Found and then Placeholder (Pattern) = 0
                          and then Category_Count (Category.all) > 0
                        then
                           Counts.Include (Key (Pattern), (Category_Count (Category.all), Unit.Seconds));
                        end if;
                     end;
                     for Future in Boolean loop
                        declare
                           Pattern : constant String :=
                             I18N.Relative_Format.Time_Pattern
                               (Locale, Unit.Base.all, Width.all, Category.all, Future);
                        begin
                           if Pattern = "" then
                              null;
                           elsif Placeholder (Pattern) /= 0 then
                              Add_Pattern (Pattern, Unit.Base.all, Future);
                           elsif Category_Count (Category.all) > 0 then
                              declare
                                 Count : constant String :=
                                   Natural'Image (Category_Count (Category.all));
                                 Amount : constant String :=
                                   English (Unit.Base.all, Count (Count'First + 1 .. Count'Last));
                              begin
                                 Add_Fixed (Pattern, (if Future then "in " & Amount else Amount & " ago"));
                              end;
                           end if;
                        end;
                     end loop;
                  end loop;

                  --  CLDR's names for offsets: yesterday, tomorrow, last week.
                  for Offset in -2 .. 2 loop
                     declare
                        Found : Boolean;
                        Name  : constant String :=
                          I18N.Relative_Format.Exact_Name (Locale, Unit.Base.all, Width.all, Offset, Found);
                        Count : constant String := Natural'Image (abs Offset);
                        Amount : constant String :=
                          English (Unit.Base.all, Count (Count'First + 1 .. Count'Last));
                     begin
                        if not Found then
                           null;
                        elsif Unit.Base.all = "day" then
                           Add_Fixed
                             (Name,
                              (case Offset is
                                  when -1 => "yesterday",
                                  when 0 => "today",
                                  when 1 => "tomorrow",
                                  when others =>
                                    (if Offset < 0 then Amount & " ago" else "in " & Amount)));
                        elsif Offset /= 0 then
                           Add_Fixed (Name, (if Offset < 0 then Amount & " ago" else "in " & Amount));
                        elsif Unit.Base.all = "second" then
                           Add_Fixed (Name, "now");
                        end if;
                     end;
                  end loop;
               end loop;
            end loop;
         end;
      end loop;
      Tables.Install (Words, Bytes, Counts, Patterns);
   end Build;

   --  Built outside the protected object: the lookups read i18n's files.
   --  Two first callers may both build; the second install is the same.
   procedure Ensure_Built is
   begin
      if not Tables.Is_Built then
         Build;
      end if;
   end Ensure_Built;

   function Byte_Multiplier (Word : String) return Long_Float is
   begin
      Ensure_Built;
      return Long_Float (Tables.Byte_Unit_Of (Word));
   end Byte_Multiplier;

   function Spaced (Text : String) return String is
      NBSP   : constant String := Character'Val (16#C2#) & Character'Val (16#A0#);
      Narrow : constant String := Character'Val (16#E2#) & Character'Val (16#80#) & Character'Val (16#AF#);
      Thin   : constant String := Character'Val (16#E2#) & Character'Val (16#80#) & Character'Val (16#89#);
      Result : String (1 .. Text'Length);
      Last   : Natural := 0;
      Index  : Natural := Text'First;
   begin
      while Index <= Text'Last loop
         if Index + 1 <= Text'Last and then Text (Index .. Index + 1) = NBSP then
            Result (Last + 1 .. Last + 2) := "  ";
            Last := Last + 2;
            Index := Index + 2;
         elsif Index + 2 <= Text'Last
           and then (Text (Index .. Index + 2) = Narrow or else Text (Index .. Index + 2) = Thin)
         then
            Result (Last + 1 .. Last + 3) := "   ";
            Last := Last + 3;
            Index := Index + 3;
         else
            Last := Last + 1;
            Result (Last) := Text (Index);
            Index := Index + 1;
         end if;
      end loop;
      return Result (1 .. Last);
   end Spaced;

   function Unit_Seconds (Word : String) return Long_Long_Integer is
   begin
      Ensure_Built;
      return Tables.Unit_Of (Word);
   end Unit_Seconds;

   procedure Counted
     (Word    : String;
      Count   : out Natural;
      Seconds : out Long_Long_Integer)
   is
      Info : Counted_Info;
   begin
      Ensure_Built;
      Info := Tables.Counted_Of (Word);
      Count := Info.Count;
      Seconds := Info.Seconds;
   end Counted;

   function Relative_Canonical (Text : String) return String is
   begin
      Ensure_Built;
      return Tables.Relative_Of (Text);
   end Relative_Canonical;

   procedure Spelled_Number
     (Text     : String;
      Ordinal  : Boolean;
      Value    : out Long_Long_Integer;
      Consumed : out Natural) is separate;

   function Has_Ordinal_Rules (Locale : String) return Boolean is
     (I18N.Spellout.Ordinal_Ruleset (Locale) /= "");

end Humanize.Parsing.Implementation.CLDR_Vocabulary;
