with Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Frequencies;
with Humanize.Numbers;
with Humanize.Parsing.Frequency_Aliases;
with Humanize.Parsing.Implementation.Duration_Text_Helpers;
with Humanize.Parsing.Implementation.Number_Text_Helpers;
with Humanize.Parsing.Implementation.Numeric_Text_Helpers;
with Humanize.Parsing.Implementation.Text_Helpers;
with Humanize.Parsing.Support;
with Humanize.Rates;
with Humanize.Status;

package body Humanize.Parsing.Implementation.Scalar_Text_Helpers is
   use Ada.Strings.Unbounded;
   use type Humanize.Status.Status_Code;

   function B (Hex : String) return String
      renames Humanize.Bounded_Text.Hex_Bytes;
   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;
   function Lower (Text : String) return String
      renames Humanize.Bounded_Text.Lower_Text;
   function Upper (Text : String) return String
      renames Humanize.Bounded_Text.Upper_Text;
   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;
   function Starts_With (Text, Prefix : String) return Boolean
      renames Humanize.Bounded_Text.Starts_With;
   function Ends_With (Text, Suffix : String) return Boolean
      renames Humanize.Bounded_Text.Ends_With;
   function Find_Substring (Text, Pattern : String) return Natural
      renames Humanize.Bounded_Text.Index_Text;
   function Result_Text (Result : Humanize.Status.Text_Result) return String
      renames Humanize.Bounded_Text.Result_Text;
   function Is_Digit (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;
   function Normalize_Native_Digits (Text : String) return String
      renames Humanize.Parsing.Support.Normalize_Native_Digits;
   function Numeric_Value
     (Text  : String;
      Value : out Long_Float)
      return Boolean
      renames Humanize.Parsing.Support.Numeric_Value;
   function Scan_End (Text : String) return Natural
      renames Humanize.Parsing.Support.Scan_End;
   function Scan_Number_End (Text : String) return Natural
      renames Humanize.Parsing.Support.Scan_Number_End;
   function Has_Spaced_Token (Text, Token : String) return Boolean
      renames Humanize.Parsing.Implementation.Text_Helpers.Has_Spaced_Token;
   function Roman_Digit (Ch : Character) return Natural
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Roman_Digit;
   function Is_Roman_Character (Ch : Character) return Boolean
      renames Humanize.Parsing.Implementation.Numeric_Text_Helpers.Is_Roman_Character;
   function Parse_Cardinal
     (Text : String)
      return Number_Parse_Result
      renames Humanize.Parsing.Implementation.Number_Text_Helpers.Parse_Cardinal;
   function Unit_Seconds (Unit : String) return Long_Long_Integer
      renames Humanize.Parsing.Implementation.Duration_Text_Helpers.Unit_Seconds;

   function Parse_Bounded_Number
     (Text   : String;
      Suffix : String := "+")
      return Number_Parse_Result
   is
      Item : constant String := Trim (Text);
      Core_Last : Natural := Item'Last;
      Amount : Long_Float;
   begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, Value => 0, others => <>);
      end if;

      if Suffix'Length > 0
        and then Item'Length >= Suffix'Length
        and then Item (Item'Last - Suffix'Length + 1 .. Item'Last) = Suffix
      then
         Core_Last := Item'Last - Suffix'Length;
      end if;

      if Core_Last < Item'First
        or else not Numeric_Value (Item (Item'First .. Core_Last), Amount)
      then
         return (Status => Humanize.Status.Invalid_Argument, Value => 0, others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Value  => Long_Long_Integer (Long_Float'Rounding (Amount)),
         Exact  => Long_Float'Rounding (Amount) = Amount,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Value, Value => 0, others => <>);
   end Parse_Bounded_Number;

   function Scan_Bounded_Number
     (Text   : String;
      Suffix : String := "+")
      return Number_Parse_Result
   is
      Last : constant Natural := Scan_Number_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Number_Parse_Result :=
              Parse_Bounded_Number (Text (Text'First .. Stop), Suffix);
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Bounded_Number;

   function Parse_Frequency
     (Text : String)
      return Frequency_Parse_Result
   is
      Item : constant String := Lower (Trim (Normalize_Native_Digits (Text)));
      Last_Number : Natural := Item'First - 1;
      Amount : Long_Float;
   begin
      declare
         Alias_Count : Humanize.Frequencies.Occurrence_Count;
      begin
         if Humanize.Parsing.Frequency_Aliases.Known_Count_Alias
              (Item, Alias_Count)
         then
            return
              (Status => Humanize.Status.Ok,
               Count => Alias_Count,
               Exact => True,
               Consumed => Item'Length,
               Error_Position => 0,
               Error => No_Parse_Error);
         end if;
      end;

      for Index in Item'Range loop
         if Is_Digit (Item (Index)) or else Item (Index) = ','
           or else Item (Index) = '.'
         then
            Last_Number := Index;
         else
            exit;
         end if;
      end loop;

      if Last_Number < Item'First then
         declare
            Space : Natural := 0;
         begin
            for Index in Item'Range loop
               if Item (Index) = ' ' then
                  Space := Index;
                  exit;
               end if;
            end loop;
            if Space > Item'First then
               declare
                  Count : constant Number_Parse_Result :=
                    Parse_Cardinal (Item (Item'First .. Space - 1));
                  Unit  : constant String := Trim (Item (Space + 1 .. Item'Last));
               begin
                  if Count.Status = Humanize.Status.Ok
                    and then Humanize.Parsing.Frequency_Aliases.Is_Count_Unit
                      (Unit)
                    and then Count.Value >= 0
                  then
                     return
                       (Status => Humanize.Status.Ok,
                        Count => Humanize.Frequencies.Occurrence_Count
                          (Count.Value),
                        Exact => True,
                        Consumed => Item'Length,
                        Error_Position => 0,
                        Error => No_Parse_Error);
                  end if;
               end;
            end if;
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end;
      elsif not Numeric_Value (Item (Item'First .. Last_Number), Amount) then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      if Last_Number = Item'Last then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      declare
         Unit    : constant String :=
           Trim (Item (Last_Number + 1 .. Item'Last));
         Rounded : constant Long_Long_Integer :=
           Long_Long_Integer (Long_Float'Rounding (Amount));
      begin
         if Rounded < 0
           or else not Humanize.Parsing.Frequency_Aliases.Is_Count_Unit
             (Unit)
         then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
         return
           (Status   => Humanize.Status.Ok,
            Count    => Humanize.Frequencies.Occurrence_Count (Rounded),
            Exact    => Long_Float'Rounding (Amount) = Amount,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error);
      end;
   exception
      when others => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Parse_Frequency;

   function Scan_Frequency
     (Text : String)
      return Frequency_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Frequency_Parse_Result :=
              Parse_Frequency (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Frequency;

   function Period_Value
     (Text : String;
      Period : out Humanize.Rates.Rate_Period)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
      Seconds : constant Long_Long_Integer := Unit_Seconds (Item);
   begin
      if Seconds = 1 then
         Period := Humanize.Rates.Per_Second;
      elsif Seconds = 60 then
         Period := Humanize.Rates.Per_Minute;
      elsif Seconds = 3_600 then
         Period := Humanize.Rates.Per_Hour;
      elsif Seconds = 86_400 then
         Period := Humanize.Rates.Per_Day;
      elsif Seconds = 7 * 86_400 then
         Period := Humanize.Rates.Per_Week;
      elsif Item = "second" or else Item = "seconds" or else Item = "sec"
        or else Item = "s"
      then
         Period := Humanize.Rates.Per_Second;
      elsif Item = "minute" or else Item = "minutes" or else Item = "min"
        or else Item = "m"
      then
         Period := Humanize.Rates.Per_Minute;
      elsif Item = "hour" or else Item = "hours" or else Item = "hr"
        or else Item = "h"
      then
         Period := Humanize.Rates.Per_Hour;
      elsif Item = "day" or else Item = "days" or else Item = "d" then
         Period := Humanize.Rates.Per_Day;
      elsif Item = "week" or else Item = "weeks" or else Item = "wk"
        or else Item = "w"
        or else Item = "uge"
        or else Item = "vecka"
        or else Item = "uke"
        or else Item = "woche"
        or else Item = "semaine"
        or else Item = "semana"
        or else Item = "settimana"
        or else Item = B ("7479647A6965C584")
        or else Item = "tygodnie"
        or else Item = B ("74C3BD64656E")
        or else Item = B ("74C3BD646E79")
        or else Item = "viikossa"
        or else Item = B ("736176616974C499")
        or else Item = "teden"
        or else Item = "tednu"
        or else Item = "haftada"
        or else Item = "hetente"
        or else Item = "seminggu"
        or else Item = B ("E6AF8EE980B1")
        or else Item = B ("E6AF8FE591A8")
        or else Item = B ("ECA3BCEBA788EB8BA4")
      then
         Period := Humanize.Rates.Per_Week;
      else
         return False;
      end if;
      return True;
   end Period_Value;

   function Rate_Separator
     (Text   : String;
      First  : Natural;
      Pos    : out Natural;
      Length : out Natural)
      return Boolean
   is
      Tail : constant String :=
        (if First <= Text'Last then Text (First .. Text'Last) else "");

      function Try (Candidate : String) return Boolean is
         Found : constant Natural := Find_Substring (Tail, Candidate);
      begin
         if Found = 0 then
            return False;
         end if;
         Pos := First + Found - Tail'First;
         Length := Candidate'Length;
         return True;
      end Try;
   begin
      Pos := 0;
      Length := 0;
      if First > Text'Last then
         return False;
      end if;

      return Try (" per ") or else Try (" pro ") or else Try (" par ")
        or else Try (" por ") or else Try (" pe ") or else Try (" na ")
        or else Try (" kwa ") or else Try (" po ") or else Try (" moi ")
        or else Try (" za ")
        or else Try (" a ") or else Try (" al ") or else Try (" alla ")
        or else Try (" cada ")
        or else Try (B ("20D0B220"))
        or else Try (B ("20D0B7D0B020"))
        or else Try (B ("20D981D98A20"))
        or else Try (B ("20E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20"));
   end Rate_Separator;

   function Parse_Period_First_Rate
     (Item : String)
      return Rate_Parse_Result
   is
      type Candidate is record
         Prefix : Unbounded_String;
         Period : Humanize.Rates.Rate_Period := Humanize.Rates.Per_Second;
         Approx : Unbounded_String;
         Less_Suffix : Unbounded_String;
      end record;

      Candidates : constant array (Positive range <>) of Candidate :=
        [(To_Unbounded_String ("saniyede "), Humanize.Rates.Per_Second,
          To_Unbounded_String (B ("79616B6C61C59FC4B16B20")),
          To_Unbounded_String ("den az")),
         (To_Unbounded_String ("dakikada "), Humanize.Rates.Per_Minute,
          To_Unbounded_String (B ("79616B6C61C59FC4B16B20")),
          To_Unbounded_String ("den az")),
         (To_Unbounded_String ("saatte "), Humanize.Rates.Per_Hour,
          To_Unbounded_String (B ("79616B6C61C59FC4B16B20")),
          To_Unbounded_String ("den az")),
         (To_Unbounded_String (B ("67C3BC6E6465") & " "),
          Humanize.Rates.Per_Day,
          To_Unbounded_String (B ("79616B6C61C59FC4B16B20")),
          To_Unbounded_String ("den az")),
         (To_Unbounded_String ("haftada "), Humanize.Rates.Per_Week,
          To_Unbounded_String (B ("79616B6C61C59FC4B16B20")),
          To_Unbounded_String ("den az")),
         (To_Unbounded_String (B ("E6AF8EE7A792")),
          Humanize.Rates.Per_Second, To_Unbounded_String (B ("E7B48420")),
          To_Unbounded_String (B ("E69CAAE6BA80"))),
         (To_Unbounded_String (B ("E6AF8EE58886")),
          Humanize.Rates.Per_Minute, To_Unbounded_String (B ("E7B48420")),
          To_Unbounded_String (B ("E69CAAE6BA80"))),
         (To_Unbounded_String (B ("E6AF8EE69982")),
          Humanize.Rates.Per_Hour, To_Unbounded_String (B ("E7B48420")),
          To_Unbounded_String (B ("E69CAAE6BA80"))),
         (To_Unbounded_String (B ("E6AF8EE697A5")),
          Humanize.Rates.Per_Day, To_Unbounded_String (B ("E7B48420")),
          To_Unbounded_String (B ("E69CAAE6BA80"))),
         (To_Unbounded_String (B ("E6AF8EE980B1")),
          Humanize.Rates.Per_Week, To_Unbounded_String (B ("E7B48420")),
          To_Unbounded_String (B ("E69CAAE6BA80"))),
         (To_Unbounded_String (B ("ECB488EB8BB9") & " "),
          Humanize.Rates.Per_Second, To_Unbounded_String (B ("EC95BD20")),
          To_Unbounded_String (B ("20EBAFB8EBA78C"))),
         (To_Unbounded_String (B ("EBB684EB8BB9") & " "),
          Humanize.Rates.Per_Minute, To_Unbounded_String (B ("EC95BD20")),
          To_Unbounded_String (B ("20EBAFB8EBA78C"))),
         (To_Unbounded_String (B ("EC8B9CEAB084EB8BB9") & " "),
          Humanize.Rates.Per_Hour, To_Unbounded_String (B ("EC95BD20")),
          To_Unbounded_String (B ("20EBAFB8EBA78C"))),
         (To_Unbounded_String (B ("EC9DBCEB8BB9") & " "),
          Humanize.Rates.Per_Day, To_Unbounded_String (B ("EC95BD20")),
          To_Unbounded_String (B ("20EBAFB8EBA78C"))),
         (To_Unbounded_String (B ("ECA3BCEB8BB9") & " "),
          Humanize.Rates.Per_Week, To_Unbounded_String (B ("EC95BD20")),
          To_Unbounded_String (B ("20EBAFB8EBA78C"))),
         (To_Unbounded_String (B ("E6AF8FE7A792")),
          Humanize.Rates.Per_Second, To_Unbounded_String (B ("E7BAA620")),
          To_Unbounded_String ("")),
         (To_Unbounded_String (B ("E6AF8FE58886E9929F")),
          Humanize.Rates.Per_Minute, To_Unbounded_String (B ("E7BAA620")),
          To_Unbounded_String ("")),
         (To_Unbounded_String (B ("E6AF8FE5B08FE697B6")),
          Humanize.Rates.Per_Hour, To_Unbounded_String (B ("E7BAA620")),
          To_Unbounded_String ("")),
         (To_Unbounded_String (B ("E6AF8FE5A4A9")),
          Humanize.Rates.Per_Day, To_Unbounded_String (B ("E7BAA620")),
          To_Unbounded_String ("")),
         (To_Unbounded_String (B ("E6AF8FE591A8")),
          Humanize.Rates.Per_Week, To_Unbounded_String (B ("E7BAA620")),
          To_Unbounded_String ("")),
         (To_Unbounded_String (B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4B8E0A587E0A495E0A482E0A4A1") & " "),
          Humanize.Rates.Per_Second,
          To_Unbounded_String (B ("E0A4B2E0A497E0A4ADE0A49720")),
          To_Unbounded_String (B ("20E0A4B8E0A58720E0A495E0A4AE"))),
         (To_Unbounded_String (B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4AEE0A4BFE0A4A8E0A49F") & " "),
          Humanize.Rates.Per_Minute,
          To_Unbounded_String (B ("E0A4B2E0A497E0A4ADE0A49720")),
          To_Unbounded_String (B ("20E0A4B8E0A58720E0A495E0A4AE"))),
         (To_Unbounded_String (B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A498E0A482E0A49FE0A4BE") & " "),
          Humanize.Rates.Per_Hour,
          To_Unbounded_String (B ("E0A4B2E0A497E0A4ADE0A49720")),
          To_Unbounded_String (B ("20E0A4B8E0A58720E0A495E0A4AE"))),
         (To_Unbounded_String (B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4A6E0A4BFE0A4A8") & " "),
          Humanize.Rates.Per_Day,
          To_Unbounded_String (B ("E0A4B2E0A497E0A4ADE0A49720")),
          To_Unbounded_String (B ("20E0A4B8E0A58720E0A495E0A4AE"))),
         (To_Unbounded_String (B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4B8E0A4AAE0A58DE0A4A4E0A4BEE0A4B9") & " "),
          Humanize.Rates.Per_Week,
          To_Unbounded_String (B ("E0A4B2E0A497E0A4ADE0A49720")),
          To_Unbounded_String (B ("20E0A4B8E0A58720E0A495E0A4AE")))];
   begin
      for C of Candidates loop
         declare
            Prefix : constant String := To_String (C.Prefix);
         begin
            if Starts_With (Item, Prefix) then
               declare
                  Rest_Start : constant Natural :=
                    Item'First + Prefix'Length;
                  Raw_Rest : constant String :=
                    (if Rest_Start <= Item'Last
                     then Trim (Item (Rest_Start .. Item'Last))
                     else "");
                  Approx : constant String := To_String (C.Approx);
                  Less_Suffix : constant String := To_String (C.Less_Suffix);
                  Rest : constant String :=
                    (if Approx'Length > 0 and then Starts_With (Raw_Rest, Approx)
                     then Trim
                       (Raw_Rest
                          (Raw_Rest'First + Approx'Length .. Raw_Rest'Last))
                     else Raw_Rest);
                  Less_Prefix : constant String := B ("E5B091E4BA8E20");
                  Has_Less_Prefix : constant Boolean :=
                    Starts_With (Rest, Less_Prefix);
                  Is_Less : constant Boolean :=
                    Has_Less_Prefix
                    or else
                      (Less_Suffix'Length > 0
                       and then Ends_With (Rest, Less_Suffix));
                  Frequency_Text : constant String :=
                    (if Has_Less_Prefix
                     then Trim
                       (Rest
                          (Rest'First + Less_Prefix'Length .. Rest'Last))
                     elsif Is_Less
                     then Trim
                       (Rest
                          (Rest'First
                           .. Rest'Last - Less_Suffix'Length))
                     else Rest);
                  F : constant Frequency_Parse_Result :=
                    Parse_Frequency (Frequency_Text);
               begin
                  if F.Status = Humanize.Status.Ok then
                     return
                       (Status    => Humanize.Status.Ok,
                        Count     => F.Count,
                        Period    => C.Period,
                        Less_Than => Is_Less,
                        Exact     => F.Exact,
                        Consumed  => Item'Length,
                        Error_Position => 0,
                        Error => No_Parse_Error);
                  end if;
               end;
            end if;
         end;
      end loop;

      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Item'First,
         Error => Expected_Separator,
         others => <>);
   end Parse_Period_First_Rate;

   function Parse_Rate
     (Text : String)
      return Rate_Parse_Result
   is
      Item : constant String := Lower (Trim (Normalize_Native_Digits (Text)));
      Prefix : constant String := "approximately ";
      Less_Prefix : constant String := "less than ";
      Romanian_Approx : constant String := "aproximativ ";
      Romanian_Less : constant String := B ("6D6169207075C89B696E20646563C3A27420");
      Lithuanian_Approx : constant String := "apie ";
      Lithuanian_Less : constant String := B ("6D61C5BE696175206E656920");
      Slovenian_Approx : constant String := "priblizno ";
      Slovenian_Less : constant String := "manj kot ";
      Indonesian_Approx : constant String := "sekitar ";
      Indonesian_Less : constant String := "kurang dari ";
      Malay_Approx : constant String := "kira-kira ";
      Malay_Less : constant String := "kurang daripada ";
      Esperanto_Approx : constant String := "proksimume ";
      Esperanto_Less : constant String := "malpli ol ";
      Vietnamese_Approx : constant String := "khoang ";
      Vietnamese_Less : constant String := "it hon ";
      Swahili_Approx : constant String := "takriban ";
      Swahili_Less : constant String := "chini ya ";
      Afrikaans_Approx : constant String := "ongeveer ";
      Afrikaans_Less : constant String := "minder as ";
      Hungarian_Approx : constant String := "korulbelul ";
      Hungarian_Less : constant String := "kevesebb mint ";
      Slovak_Approx : constant String := "priblizne ";
      Slovak_Less : constant String := "menej ako ";
      Body_First : Natural := Item'First;
      Per_Pos : Natural := 0;
      Per_Length : Natural := 0;
      Less : Boolean := False;
      Period : Humanize.Rates.Rate_Period;
   begin
      declare
         Period_First : constant Rate_Parse_Result :=
           Parse_Period_First_Rate (Item);
      begin
         if Period_First.Status = Humanize.Status.Ok then
            return Period_First;
         end if;
      end;

      if Item'Length >= Prefix'Length
        and then Item (Item'First .. Item'First + Prefix'Length - 1) = Prefix
      then
         Body_First := Item'First + Prefix'Length;
      elsif Item'Length >= Less_Prefix'Length
        and then Item (Item'First .. Item'First + Less_Prefix'Length - 1)
          = Less_Prefix
      then
         Body_First := Item'First + Less_Prefix'Length;
         Less := True;
      elsif Starts_With (Item, "cirka ") then
         Body_First := Item'First + 6;
      elsif Starts_With (Item, B ("756E676566C3A47220"))
        or else Starts_With (Item, "environ ")
      then
         Body_First := Item'First + 8;
      elsif Starts_With (Item, "ungefaehr ") then
         Body_First := Item'First + 10;
      elsif Starts_With (Item, "weniger als ") then
         Body_First := Item'First + 12;
         Less := True;
      elsif Starts_With (Item, "ongeveer ") then
         Body_First := Item'First + 9;
      elsif Starts_With (Item, "noin ") then
         Body_First := Item'First + 5;
      elsif Starts_With (Item, "alle ") then
         Body_First := Item'First + 5;
         Less := True;
      elsif Starts_With (Item, B ("6F6B6FC5826F20")) then
         Body_First := Item'First + 7;
      elsif Starts_With (Item, B ("70C59969626C69C5BE6EC49B20")) then
         Body_First := Item'First + 13;
      elsif Starts_With (Item, "aproximadamente ") then
         Body_First := Item'First + 16;
      elsif Starts_With (Item, Romanian_Approx) then
         Body_First := Item'First + Romanian_Approx'Length;
      elsif Starts_With (Item, Romanian_Less) then
         Body_First := Item'First + Romanian_Less'Length;
         Less := True;
      elsif Starts_With (Item, Lithuanian_Approx) then
         Body_First := Item'First + Lithuanian_Approx'Length;
      elsif Starts_With (Item, Lithuanian_Less) then
         Body_First := Item'First + Lithuanian_Less'Length;
         Less := True;
      elsif Starts_With (Item, Slovenian_Approx) then
         Body_First := Item'First + Slovenian_Approx'Length;
      elsif Starts_With (Item, Slovenian_Less) then
         Body_First := Item'First + Slovenian_Less'Length;
         Less := True;
      elsif Starts_With (Item, Indonesian_Approx) then
         Body_First := Item'First + Indonesian_Approx'Length;
      elsif Starts_With (Item, Indonesian_Less) then
         Body_First := Item'First + Indonesian_Less'Length;
         Less := True;
      elsif Starts_With (Item, Malay_Approx) then
         Body_First := Item'First + Malay_Approx'Length;
      elsif Starts_With (Item, Malay_Less) then
         Body_First := Item'First + Malay_Less'Length;
         Less := True;
      elsif Starts_With (Item, Esperanto_Approx) then
         Body_First := Item'First + Esperanto_Approx'Length;
      elsif Starts_With (Item, Esperanto_Less) then
         Body_First := Item'First + Esperanto_Less'Length;
         Less := True;
      elsif Starts_With (Item, Vietnamese_Approx) then
         Body_First := Item'First + Vietnamese_Approx'Length;
      elsif Starts_With (Item, Vietnamese_Less) then
         Body_First := Item'First + Vietnamese_Less'Length;
         Less := True;
      elsif Starts_With (Item, Swahili_Approx) then
         Body_First := Item'First + Swahili_Approx'Length;
      elsif Starts_With (Item, Swahili_Less) then
         Body_First := Item'First + Swahili_Less'Length;
         Less := True;
      elsif Starts_With (Item, Afrikaans_Approx) then
         Body_First := Item'First + Afrikaans_Approx'Length;
      elsif Starts_With (Item, Afrikaans_Less) then
         Body_First := Item'First + Afrikaans_Less'Length;
         Less := True;
      elsif Starts_With (Item, Hungarian_Approx) then
         Body_First := Item'First + Hungarian_Approx'Length;
      elsif Starts_With (Item, Hungarian_Less) then
         Body_First := Item'First + Hungarian_Less'Length;
         Less := True;
      elsif Starts_With (Item, Slovak_Approx) then
         Body_First := Item'First + Slovak_Approx'Length;
      elsif Starts_With (Item, Slovak_Less) then
         Body_First := Item'First + Slovak_Less'Length;
         Less := True;
      elsif Starts_With (Item, "circa ") or else Starts_With (Item, "omtrent ")
        or else Starts_With (Item, "yaklasik ")
      then
         Body_First := Item'First + Find_Substring (Item, " ");
      elsif Starts_With (Item, B ("79616B6C61C59F696B20")) then
         Body_First := Item'First + 10;
      elsif Starts_With (Item, B ("79616B6C61C59FC4B16B20")) then
         Body_First := Item'First + 11;
      elsif Starts_With (Item, B ("D0BFD180D0B8D0BCD0B5D180D0BDD0BE20"))
        or else Starts_With (Item, B ("D0BFD180D0B8D0B1D0BBD0B8D0B7D0BDD0BE20"))
      then
         Body_First := Item'First + Find_Substring (Item, " ");
      elsif Starts_With (Item, B ("E7B484")) or else Starts_With (Item, B ("EC95BD"))
        or else Starts_With (Item, B ("E7BAA6"))
      then
         Body_First := Item'First + 3;
      elsif Starts_With (Item, B ("D8AAD982D8B1D98AD8A8D98BD8A720")) then
         Body_First := Item'First + 15;
      elsif Starts_With (Item, B ("D8A3D982D98420D985D98620")) then
         Body_First := Item'First + 12;
         Less := True;
      elsif Starts_With (Item, B ("E0A4B2E0A497E0A4ADE0A49720")) then
         Body_First := Item'First + 13;
      elsif Starts_With (Item, "mindre end ")
        or else Starts_With (Item, "mindre enn ")
      then
         Body_First := Item'First + 11;
         Less := True;
      elsif Starts_With (Item, "menos de ") or else Starts_With (Item, "meno di ")
        or else Starts_With (Item, "minder dan ")
      then
         Body_First := Item'First + Find_Substring (Item, " ") + 3;
         Less := True;
      elsif Starts_With (Item, "moins de ") then
         Body_First := Item'First + 9;
         Less := True;
      elsif Starts_With (Item, B ("6D696E64726520C3A46E20")) then
         Body_First := Item'First + 11;
         Less := True;
      elsif Starts_With (Item, "mniej niz ") or else Starts_With (Item, "mene nez ")
        or else Starts_With (Item, "daha az ")
      then
         Body_First := Item'First + Find_Substring (Item, " ") + 3;
         Less := True;
      elsif Starts_With (Item, B ("6D6E69656A206E69C5BC20")) then
         Body_First := Item'First + 11;
         Less := True;
      elsif Starts_With (Item, B ("6DC3A96EC49B206E65C5BE20")) then
         Body_First := Item'First + 12;
         Less := True;
      elsif Starts_With (Item, B ("6D6E656CC5A1206E65C5BE20")) then
         Body_First := Item'First + 10;
         Less := True;
      elsif Starts_With (Item, B ("D0BCD0B5D0BDD18CD188D0B520D187D0B5D0BC20"))
      then
         Body_First := Item'First + 20;
         Less := True;
      elsif Starts_With (Item, B ("D0BCD0B5D0BDD188D0B520D0BDD196D0B620"))
      then
         Body_First := Item'First + 18;
         Less := True;
      elsif Starts_With (Item, B ("E69CACE6BA80")) or else Starts_With (Item, B ("EBAFB8EBA78C"))
        or else Starts_With (Item, B ("E5B091E4BA8E"))
      then
         Body_First := Item'First + 6;
         Less := True;
      end if;

      declare
         Found : constant Boolean :=
           Rate_Separator (Item, Body_First, Per_Pos, Per_Length);
         Finnish_Week : constant String := " viikossa";
         Turkish_Week : constant String := " haftada";
         Malay_Week : constant String := " seminggu";
         Hungarian_Week : constant String := " hetente";
         Japanese_Week : constant String := B ("20E6AF8EE980B1");
         Chinese_Week : constant String := B ("20E6AF8FE591A8");
         Korean_Week : constant String := B ("20ECA3BCEBA788EB8BA4");
      begin
         if not Found then
            if Ends_With (Item, Finnish_Week) then
               Per_Pos := Item'Last - Finnish_Week'Length + 1;
               Per_Length := 1;
            elsif Ends_With (Item, Turkish_Week) then
               Per_Pos := Item'Last - Turkish_Week'Length + 1;
               Per_Length := 1;
            elsif Ends_With (Item, Malay_Week) then
               Per_Pos := Item'Last - Malay_Week'Length + 1;
               Per_Length := 1;
            elsif Ends_With (Item, Hungarian_Week) then
               Per_Pos := Item'Last - Hungarian_Week'Length + 1;
               Per_Length := 1;
            elsif Ends_With (Item, Japanese_Week) then
               Per_Pos := Item'Last - Japanese_Week'Length + 1;
               Per_Length := 1;
            elsif Ends_With (Item, Chinese_Week) then
               Per_Pos := Item'Last - Chinese_Week'Length + 1;
               Per_Length := 1;
            elsif Ends_With (Item, Korean_Week) then
               Per_Pos := Item'Last - Korean_Week'Length + 1;
               Per_Length := 1;
            else
               Per_Pos := 0;
            end if;
         end if;
      end;

      if Per_Pos = 0
        or else not Period_Value
          (Item (Per_Pos + Per_Length .. Item'Last), Period)
      then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => (if Per_Pos = 0 then Text'First else Per_Pos),
            Error => Expected_Separator,
            others => <>);
      end if;

      declare
         F : constant Frequency_Parse_Result :=
           Parse_Frequency (Item (Body_First .. Per_Pos - 1));
      begin
         if F.Status /= Humanize.Status.Ok then
            return
              (Status => F.Status,
               Error_Position => Body_First,
               Error => Diagnostic (F.Status, Body_First, F.Error),
               others => <>);
         end if;
         return
           (Status    => Humanize.Status.Ok,
            Count     => F.Count,
            Period    => Period,
            Less_Than => Less,
            Exact     => F.Exact,
            Consumed  => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error);
      end;
   end Parse_Rate;

   function Scan_Rate
     (Text : String)
      return Rate_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Rate_Parse_Result :=
              Parse_Rate (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Rate;

   function Parse_List
     (Text : String)
      return List_Parse_Result
   is
      Item : constant String := Trim (Text);
      Count : Natural := 1;
   begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Empty_Input,
            others => <>);
      end if;

      for Ch of Item loop
         if Ch = ',' then
            Count := Count + 1;
         end if;
      end loop;

      declare
         Low : constant String := Lower (Item);
         Found : Boolean := False;
      begin
         if Low'Length >= 5 then
            for Index in Low'First .. Low'Last - 4 loop
               if Low (Index .. Index + 4) = " and "
                 or else Low (Index .. Index + 4) = " und "
                 or else Low (Index .. Index + 4) = " och "
                 or else Low (Index .. Index + 4) = " dan "
                 or else Low (Index .. Index + 4) = " kaj "
               then
                  Count := Count + 1;
                  Found := True;
                  exit;
               end if;
            end loop;
         end if;
         if not Found and then Low'Length >= 4 then
            for Index in Low'First .. Low'Last - 3 loop
               if Low (Index .. Index + 3) = " et "
                 or else Low (Index .. Index + 3) = " og "
                 or else Low (Index .. Index + 3) = " en "
                 or else Low (Index .. Index + 3) = " of "
                 or else Low (Index .. Index + 3) = " ja "
                 or else Low (Index .. Index + 3) = " ir "
                 or else Low (Index .. Index + 3) = " in "
                 or else Low (Index .. Index + 3) = " va "
                 or else Low (Index .. Index + 3) = " ve "
                 or else Low (Index .. Index + 3) = " na "
                 or else Low (Index .. Index + 3) = " es "
               then
                  Count := Count + 1;
                  Found := True;
                  exit;
               end if;
            end loop;
         end if;
         if not Found and then Low'Length >= 3 then
            for Index in Low'First .. Low'Last - 2 loop
               if Low (Index .. Index + 2) = " y "
                 or else Low (Index .. Index + 2) = " i "
                 or else Low (Index .. Index + 2) = " e "
                 or else Low (Index .. Index + 2) = " a "
               then
                  Count := Count + 1;
                  exit;
               end if;
            end loop;
         end if;
         if not Found
           and then
             (Has_Spaced_Token (Low, B ("D0B8"))
              or else Has_Spaced_Token (Low, B ("D196"))
              or else Has_Spaced_Token (Low, B ("C89969"))
              or else Has_Spaced_Token (Low, B ("E381A8"))
              or else Has_Spaced_Token (Low, B ("EBA78F"))
              or else Has_Spaced_Token (Low, B ("EBB08F"))
              or else Has_Spaced_Token (Low, B ("E5928C"))
              or else Has_Spaced_Token (Low, B ("D988"))
              or else Has_Spaced_Token (Low, B ("E0A494E0A4B0")))
         then
            Count := Count + 1;
         end if;
      end;

      return
        (Status   => Humanize.Status.Ok,
         Count    => Count,
         Exact    => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_List;

   function Scan_List
     (Text : String)
      return List_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant List_Parse_Result :=
              Parse_List (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_List;

   function Parse_Percent
     (Text : String)
      return Number_Parse_Result
   is
      Item : constant String := Trim (Text);
      Amount : Long_Float;
   begin
      if Item'Length < 2 or else Item (Item'Last) /= '%' then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      if not Numeric_Value (Item (Item'First .. Item'Last - 1), Amount) then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      return
        (Status   => Humanize.Status.Ok,
         Value    => Long_Long_Integer (Long_Float'Rounding (Amount)),
         Exact    => Long_Float'Rounding (Amount) = Amount,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Parse_Percent;

   function Scan_Percent
     (Text : String)
      return Number_Parse_Result
   is
      Last : constant Natural := Scan_Number_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Number_Parse_Result :=
              Parse_Percent (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Percent;

   function Parse_Ordinal
     (Text : String)
      return Number_Parse_Result
   is
      Item : constant String := Clean_Lower (Text);
      Last_Number : Natural := Item'First - 1;
      Amount : Long_Float;
      Locale_Value : Natural := 0;
   begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      for Index in Item'Range loop
         if Is_Digit (Item (Index)) then
            Last_Number := Index;
         else
            exit;
         end if;
      end loop;

      if Last_Number < Item'First then
         if Humanize.Numbers.Parse_Deterministic_Ordinal (Item, Locale_Value)
         then
            return
              (Status => Humanize.Status.Ok,
               Value => Long_Long_Integer (Locale_Value),
               Exact => True,
               Consumed => Item'Length,
               Error_Position => 0,
               Error => No_Parse_Error);
         end if;
         return Parse_Cardinal (Item);
      elsif not Numeric_Value (Item (Item'First .. Last_Number), Amount) then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      if Last_Number = Item'Last then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      declare
         Suffix : constant String := Item (Last_Number + 1 .. Item'Last);
      begin
         if Suffix = "st" or else Suffix = "nd" or else Suffix = "rd"
           or else Suffix = "th" or else Suffix = "."
           or else Suffix = "a" or else Suffix = "re"
         then
            return
              (Status   => Humanize.Status.Ok,
               Value    => Long_Long_Integer (Long_Float'Rounding (Amount)),
               Exact    => True,
               Consumed => Item'Length,
               Error_Position => 0,
               Error => No_Parse_Error);
         end if;
      end;

      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   exception
      when others => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Parse_Ordinal;

   function Scan_Ordinal
     (Text : String)
      return Number_Parse_Result
   is
      Last : constant Natural := Scan_Number_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Number_Parse_Result :=
              Parse_Ordinal (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Ordinal;

   function Parse_Roman
     (Text : String)
      return Number_Parse_Result
   is
      Item  : constant String := Upper (Trim (Text));
      Total : Natural := 0;
      Index : Natural := Item'First;
   begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      while Index <= Item'Last loop
         declare
            Current : constant Natural := Roman_Digit (Item (Index));
            Next    : constant Natural :=
              (if Index < Item'Last then Roman_Digit (Item (Index + 1)) else 0);
         begin
            if Current = 0 then
               return
                 (Status => Humanize.Status.Invalid_Argument,
                  Error_Position => Index,
                  Error => Unsupported_Form,
                  others => <>);
            elsif Next > Current then
               Total := Total + Next - Current;
               Index := Index + 2;
            else
               Total := Total + Current;
               Index := Index + 1;
            end if;
         end;
      end loop;

      declare
         Canonical : constant Humanize.Status.Text_Result :=
           Humanize.Numbers.Roman (Total);
      begin
         if Canonical.Status /= Humanize.Status.Ok
           or else Result_Text (Canonical) /= Item
         then
            return
              (Status => Humanize.Status.Invalid_Argument,
               Error_Position => Item'First,
               Error => Unsupported_Form,
               others => <>);
         end if;
      end;

      return
        (Status   => Humanize.Status.Ok,
         Value    => Long_Long_Integer (Total),
         Exact    => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others => --  parse failure normalization
         return
           (Status => Humanize.Status.Invalid_Value,
            Error => Out_Of_Range,
            others => <>);
   end Parse_Roman;

   function Scan_Roman
     (Text : String)
      return Number_Parse_Result
   is
      Last : Natural := Text'First - 1;
   begin
      if Text'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            others => <>);
      end if;

      for Index in Text'Range loop
         exit when not Is_Roman_Character (Text (Index));
         Last := Index;
      end loop;

      if Last < Text'First then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Number_Parse_Result :=
              Parse_Roman (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Roman;

   function Parse_Aspect_Ratio
     (Text : String)
      return Aspect_Ratio_Parse_Result
   is
      Item : constant String := Trim (Text);
      Colon : Natural := 0;
      Left  : Long_Float;
      Right : Long_Float;
   begin
      for Index in Item'Range loop
         if Item (Index) = ':' then
            Colon := Index;
            exit;
         end if;
      end loop;

      if Colon = 0 or else Colon = Item'First or else Colon = Item'Last then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => (if Colon = 0 then Item'First else Colon),
            Error => Expected_Separator,
            others => <>);
      elsif not Numeric_Value (Item (Item'First .. Colon - 1), Left)
        or else not Numeric_Value (Item (Colon + 1 .. Item'Last), Right)
      then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Item'First,
            Error => Expected_Number,
            others => <>);
      elsif Left <= 0.0 or else Right <= 0.0 then
         return
           (Status => Humanize.Status.Invalid_Value,
            Error => Out_Of_Range,
            others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Width => Natural (Long_Float'Rounding (Left)),
         Height => Natural (Long_Float'Rounding (Right)),
         Exact => Long_Float'Rounding (Left) = Left
           and then Long_Float'Rounding (Right) = Right,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others => --  parse failure normalization
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Parse_Aspect_Ratio;

   function Scan_Aspect_Ratio
     (Text : String)
      return Aspect_Ratio_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Aspect_Ratio_Parse_Result :=
              Parse_Aspect_Ratio (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Aspect_Ratio;
end Humanize.Parsing.Implementation.Scalar_Text_Helpers;
