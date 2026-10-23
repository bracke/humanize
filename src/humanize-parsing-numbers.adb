with Humanize.Parsing.Implementation.CLDR_Vocabulary;
with Humanize.Parsing.Implementation.Numbers;

package body Humanize.Parsing.Numbers is
   use type Humanize.Status.Status_Code;
   package Impl renames Humanize.Parsing.Implementation.Numbers;

   --  CLDR's spelled-out compounds carry soft hyphens ("zwei" SHY "und" SHY
   --  "vierzig"), which mark where a line may break and are not part of the
   --  word: the number words are read without them, and Consumed and
   --  Error_Position count the caller's bytes.
   Soft_Hyphen : constant String := Character'Val (16#C2#) & Character'Val (16#AD#);

   function Is_Soft_At (Text : String; Index : Positive) return Boolean is
     (Index < Text'Last and then Text (Index .. Index + 1) = Soft_Hyphen);

   function Has_Soft_Hyphen (Text : String) return Boolean is
     (for some Index in Text'Range => Is_Soft_At (Text, Index));

   function Without_Soft_Hyphens (Text : String) return String is
      Result : String (1 .. Text'Length);
      Last   : Natural := 0;
      Index  : Natural := Text'First;
   begin
      while Index <= Text'Last loop
         if Is_Soft_At (Text, Index) then
            Index := Index + 2;
         else
            Last := Last + 1;
            Result (Last) := Text (Index);
            Index := Index + 1;
         end if;
      end loop;
      return Result (1 .. Last);
   end Without_Soft_Hyphens;

   --  How many of Text's bytes cover the first Count bytes of its stripped
   --  form, soft hyphens included up to the next kept byte.
   function Original_Count (Text : String; Count : Natural) return Natural is
      Kept  : Natural := 0;
      Index : Natural := Text'First;
   begin
      while Index <= Text'Last loop
         if Is_Soft_At (Text, Index) then
            Index := Index + 2;
         else
            exit when Kept = Count;
            Kept := Kept + 1;
            Index := Index + 1;
         end if;
      end loop;
      return Index - Text'First;
   end Original_Count;

   --  Where the hand-kept vocabulary does not read the whole text, CLDR's
   --  rules in the shipped locales may: the formatters spell numbers by them
   --  ("kolmesataaneljäkymmentäkaksi", Danish "et").
   generic
      with function Parse (Text : String) return Number_Parse_Result;
      Ordinal : Boolean;
      Whole   : Boolean;
   function Reading_Soft_Hyphens (Text : String) return Number_Parse_Result;

   function Reading_Soft_Hyphens (Text : String) return Number_Parse_Result is
      function Hand return Number_Parse_Result is
      begin
         if not Has_Soft_Hyphen (Text) then
            return Parse (Text);
         end if;
         declare
            Result : Number_Parse_Result := Parse (Without_Soft_Hyphens (Text));
         begin
            Result.Consumed := Original_Count (Text, Result.Consumed);
            if Result.Error_Position /= 0 then
               Result.Error_Position := Text'First + Original_Count (Text, Result.Error_Position - 1);
            end if;
            return Result;
         end;
      end Hand;
      Result : constant Number_Parse_Result := Hand;
   begin
      --  ASCII text is the hand vocabulary's own ground; other scripts are
      --  what the formatters spell by CLDR, whose reading comes first.
      if Result.Status = Humanize.Status.Ok and then Result.Consumed = Text'Length
        and then (for all C of Text => Character'Pos (C) < 128)
      then
         return Result;
      end if;
      declare
         Value    : Long_Long_Integer;
         Consumed : Natural;
      begin
         Humanize.Parsing.Implementation.CLDR_Vocabulary.Spelled_Number (Text, Ordinal, Value, Consumed);
         if (if Whole then Consumed = Text'Length
             else Consumed > (if Result.Status = Humanize.Status.Ok then Result.Consumed else 0))
         then
            return (Status => Humanize.Status.Ok, Value => Value, Exact => True, Consumed => Consumed,
                    Error_Position => 0, Error => No_Parse_Error);
         end if;
      end;
      return Result;
   end Reading_Soft_Hyphens;

   function Parse_Cardinal_Reading is new Reading_Soft_Hyphens (Impl.Parse_Cardinal, False, True);
   function Scan_Cardinal_Reading is new Reading_Soft_Hyphens (Impl.Scan_Cardinal, False, False);
   function Parse_Ordinal_Reading is new Reading_Soft_Hyphens (Impl.Parse_Ordinal, True, True);
   function Scan_Ordinal_Reading is new Reading_Soft_Hyphens (Impl.Scan_Ordinal, True, False);

   function Parse_Compact_Number
     (Text : String)
      return Number_Parse_Result renames Impl.Parse_Compact_Number;

   function Parse_Cardinal
     (Text : String)
      return Number_Parse_Result renames Parse_Cardinal_Reading;

   function Scan_Cardinal
     (Text : String)
      return Number_Parse_Result renames Scan_Cardinal_Reading;

   function Parse_Scientific_Number
     (Text : String)
      return Float_Parse_Result renames Impl.Parse_Scientific_Number;

   function Scan_Scientific_Number
     (Text : String)
      return Float_Parse_Result renames Impl.Scan_Scientific_Number;

   function Parse_Currency
     (Text : String)
      return Currency_Parse_Result renames Impl.Parse_Currency;

   function Scan_Currency
     (Text : String)
      return Currency_Parse_Result renames Impl.Scan_Currency;

   function Parse_Approximate_Currency
     (Text : String)
      return Currency_Parse_Result renames Impl.Parse_Approximate_Currency;

   function Scan_Approximate_Currency
     (Text : String)
      return Currency_Parse_Result renames Impl.Scan_Approximate_Currency;

   function Parse_Approximate_Number
     (Text : String)
      return Number_Parse_Result renames Impl.Parse_Approximate_Number;

   function Parse_Editorial_Number
     (Text : String)
      return Number_Parse_Result renames Impl.Parse_Editorial_Number;

   function Parse_Currency_Words
     (Text : String)
      return Currency_Parse_Result renames Impl.Parse_Currency_Words;

   function Scan_Approximate_Number
     (Text : String)
      return Number_Parse_Result renames Impl.Scan_Approximate_Number;

   function Parse_Change
     (Text : String)
      return Change_Parse_Result renames Impl.Parse_Change;

   function Scan_Change
     (Text : String)
      return Change_Parse_Result renames Impl.Scan_Change;

   function Parse_Number_Comparison
     (Text : String)
      return Comparison_Parse_Result renames Impl.Parse_Number_Comparison;

   function Parse_Percent_Comparison
     (Text : String)
      return Comparison_Parse_Result renames Impl.Parse_Percent_Comparison;

   function Parse_File_Size_Comparison
     (Text : String)
      return Comparison_Parse_Result renames Impl.Parse_File_Size_Comparison;

   function Scan_Compact_Number
     (Text : String)
      return Number_Parse_Result renames Impl.Scan_Compact_Number;

   function Parse_Bounded_Number
     (Text   : String;
      Suffix : String := "+")
      return Number_Parse_Result renames Impl.Parse_Bounded_Number;

   function Parse_Number_Range
     (Text : String)
      return Number_Range_Parse_Result renames Impl.Parse_Number_Range;

   function Parse_Decimal_Range
     (Text : String)
      return Decimal_Range_Parse_Result renames Impl.Parse_Decimal_Range;

   function Parse_Decimal_Range_Words
     (Text : String)
      return Decimal_Range_Parse_Result renames Impl.Parse_Decimal_Range_Words;

   function Parse_Fraction_Words
     (Text : String)
      return Proportion_Parse_Result renames Impl.Parse_Fraction_Words;

   function Parse_Uncertainty_Label
     (Text : String)
      return Uncertainty_Parse_Result renames Impl.Parse_Uncertainty_Label;

   function Parse_Uncertainty_Words
     (Text : String)
      return Uncertainty_Parse_Result renames Impl.Parse_Uncertainty_Words;

   function Parse_Percent_Words
     (Text : String)
      return Float_Parse_Result renames Impl.Parse_Percent_Words;

   function Scan_Uncertainty_Label
     (Text : String)
      return Uncertainty_Parse_Result renames Impl.Scan_Uncertainty_Label;

   function Scan_Number_Range
     (Text : String)
      return Number_Range_Parse_Result renames Impl.Scan_Number_Range;

   function Scan_Decimal_Range
     (Text : String)
      return Decimal_Range_Parse_Result renames Impl.Scan_Decimal_Range;

   function Parse_Proportion
     (Text : String)
      return Proportion_Parse_Result renames Impl.Parse_Proportion;

   function Scan_Proportion
     (Text : String)
      return Proportion_Parse_Result renames Impl.Scan_Proportion;

   function Scan_Bounded_Number
     (Text   : String;
      Suffix : String := "+")
      return Number_Parse_Result renames Impl.Scan_Bounded_Number;

   function Parse_Percent
     (Text : String)
      return Number_Parse_Result renames Impl.Parse_Percent;

   function Scan_Percent
     (Text : String)
      return Number_Parse_Result renames Impl.Scan_Percent;

   function Parse_Ordinal
     (Text : String)
      return Number_Parse_Result renames Parse_Ordinal_Reading;

   function Scan_Ordinal
     (Text : String)
      return Number_Parse_Result renames Scan_Ordinal_Reading;

   function Parse_Roman
     (Text : String)
      return Number_Parse_Result renames Impl.Parse_Roman;

   function Scan_Roman
     (Text : String)
      return Number_Parse_Result renames Impl.Scan_Roman;
end Humanize.Parsing.Numbers;
